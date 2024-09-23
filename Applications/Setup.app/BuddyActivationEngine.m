@implementation BuddyActivationEngine

+ (id)wifiActivationEngineWithOverrideActivationURL:(id)a3 sessionURL:(id)a4
{
  BuddyActivationEngine *v5;
  id v6;
  id v8;
  id v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v5 = [BuddyActivationEngine alloc];
  v8 = -[BuddyActivationEngine initWithOverrideActivationURL:sessionURL:](v5, "initWithOverrideActivationURL:sessionURL:", location[0], v9);
  v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)cellularActivationEngineWithOverrideActivationURL:(id)a3 sessionURL:(id)a4 usingBootstrap:(BOOL)a5
{
  BuddyActivationEngine *v7;
  id v8;
  id v10;
  BOOL v11;
  id v12;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = a5;
  v7 = [BuddyActivationEngine alloc];
  v10 = -[BuddyActivationEngine initWithOverrideActivationURL:sessionURL:](v7, "initWithOverrideActivationURL:sessionURL:", location[0], v12);
  objc_msgSend(v10, "setUseCellular:", 1);
  objc_msgSend(v10, "setUsingBootstrap:", a5);
  v8 = v10;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (BuddyActivationEngine)initWithOverrideActivationURL:(id)a3 sessionURL:(id)a4
{
  id v5;
  dispatch_queue_t v6;
  id v7;
  id v8;
  id v9;
  BuddyActivationEngine *v10;
  objc_super v12;
  id v13;
  id location[2];
  id v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v5 = v15;
  v15 = 0;
  v12.receiver = v5;
  v12.super_class = (Class)BuddyActivationEngine;
  v15 = -[BuddyActivationEngine init](&v12, "init");
  objc_storeStrong(&v15, v15);
  if (v15)
  {
    objc_msgSend(v15, "setOverrideActivationURL:", location[0]);
    objc_msgSend(v15, "setOverrideSessionURL:", v13);
    v6 = dispatch_queue_create("Telephony Client Queue", 0);
    objc_msgSend(v15, "setTelephonyClientQueue:", v6);

    v7 = objc_alloc((Class)CoreTelephonyClient);
    v8 = objc_msgSend(v15, "telephonyClientQueue");
    v9 = objc_msgSend(v7, "initWithQueue:", v8);
    objc_msgSend(v15, "setTelephonyClient:", v9);

  }
  v10 = (BuddyActivationEngine *)v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v15, 0);
  return v10;
}

- (void)cancel
{
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  _WORD v5[3];
  os_log_type_t v6;
  os_log_t oslog;
  BOOL v8;
  id location[2];
  BuddyActivationEngine *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = -[BuddyActivationEngine completion](self, "completion");
  v8 = 0;
  v8 = v10->_session != 0;
  v2 = -[BuddyActivationEngine _cleanup](v10, "_cleanup");
  if (v8)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v2);
    v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v3 = oslog;
      v4 = v6;
      sub_100038C3C(v5);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Buddy Activate: Canceling any in-flight activation", (uint8_t *)v5, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  if (location[0])
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))location[0] + 2))(location[0], 0, 0, 0, 0);
  objc_storeStrong(location, 0);
}

- (void)_cleanup
{
  NSTimer *v2;
  id completion;

  -[NSURLSession invalidateAndCancel](self->_session, "invalidateAndCancel", a2);
  v2 = -[BuddyActivationEngine connectivityTimer](self, "connectivityTimer");
  -[NSTimer invalidate](v2, "invalidate");

  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_activationData, 0);
  completion = self->_completion;
  self->_completion = 0;

  -[BuddyActivationEngine setConnectivityTimer:](self, "setConnectivityTimer:", 0);
}

- (NSURLSession)session
{
  CoreTelephonyClient *v2;
  id v3;
  uint64_t v4;
  CoreTelephonyClient *v5;
  id v6;
  id v7;
  uint64_t v8;
  CoreTelephonyClient *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  id v17;
  id v18;
  id v19;
  BuddyActivationEngine *v20;
  NSOperationQueue *v21;
  NSURLSession *v22;
  NSURLSession *session;
  _WORD v25[3];
  os_log_type_t v26;
  os_log_t v27;
  os_log_type_t v28;
  os_log_t v29;
  id v30;
  os_log_type_t v31;
  os_log_t v32;
  os_log_type_t v33;
  os_log_t v34;
  id v35;
  os_log_type_t v36;
  os_log_t oslog;
  id v38;
  id v39;
  id obj;
  id v41;
  id v42;
  id v43;
  id location;
  id v45[2];
  BuddyActivationEngine *v46;
  uint8_t v47[16];
  _QWORD v48[4];
  _QWORD v49[4];
  uint8_t v50[16];
  uint8_t v51[16];
  uint8_t buf[24];

  v46 = self;
  v45[1] = (id)a2;
  if (!self->_session)
  {
    v45[0] = +[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration");
    objc_msgSend(v45[0], "setWaitsForConnectivity:", 1);
    if (v46->_useCellular)
    {
      objc_msgSend(v45[0], "set_CTDataConnectionServiceType:", kCTDataConnectionServiceTypeOTAActivation);
      location = 0;
      v43 = 0;
      v42 = 0;
      v2 = -[BuddyActivationEngine telephonyClient](v46, "telephonyClient");
      obj = 0;
      v3 = -[CoreTelephonyClient getPreferredDataSubscriptionContextSync:](v2, "getPreferredDataSubscriptionContextSync:", &obj);
      objc_storeStrong(&location, obj);
      v41 = v3;

      if (v41)
      {
        v39 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 1);
        v5 = -[BuddyActivationEngine telephonyClient](v46, "telephonyClient");
        v38 = location;
        v6 = -[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](v5, "copyCarrierBundleValue:key:bundleType:error:", v41, CFSTR("OTAActivationProxyHost"), v39, &v38);
        objc_storeStrong(&location, v38);
        v7 = v43;
        v43 = v6;

        if (!v43 && location)
        {
          oslog = (os_log_t)(id)_BYLoggingFacility(v8);
          v36 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            sub_100038C28((uint64_t)buf, (uint64_t)location);
            _os_log_impl((void *)&_mh_execute_header, oslog, v36, "Failed to get proxy host from telephony: %@", buf, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
        v9 = -[BuddyActivationEngine telephonyClient](v46, "telephonyClient");
        v35 = location;
        v10 = -[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](v9, "copyCarrierBundleValue:key:bundleType:error:", v41, CFSTR("OTAActivationProxyPort"), v39, &v35);
        objc_storeStrong(&location, v35);
        v11 = v42;
        v42 = v10;

        if (!v42 && location)
        {
          v34 = (os_log_t)(id)_BYLoggingFacility(v12);
          v33 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            sub_100038C28((uint64_t)v51, (uint64_t)location);
            _os_log_impl((void *)&_mh_execute_header, v34, v33, "Failed to get proxy port from telephony: %@", v51, 0xCu);
          }
          objc_storeStrong((id *)&v34, 0);
        }
        v13 = objc_msgSend(v41, "uuid");
        v14 = objc_msgSend(v13, "UUIDString");
        objc_msgSend(v45[0], "set_sourceApplicationSecondaryIdentifier:", v14);

        objc_storeStrong(&v39, 0);
      }
      else if (location)
      {
        v32 = (os_log_t)(id)_BYLoggingFacility(v4);
        v31 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          sub_100038C28((uint64_t)v50, (uint64_t)location);
          _os_log_error_impl((void *)&_mh_execute_header, v32, v31, "Failed to get data preferred subscription context: %@", v50, 0xCu);
        }
        objc_storeStrong((id *)&v32, 0);
      }
      if (v43 && v42)
      {
        v48[0] = kCFStreamPropertyHTTPProxyHost;
        v49[0] = v43;
        v48[1] = kCFStreamPropertyHTTPProxyPort;
        v49[1] = v42;
        v48[2] = kCFStreamPropertyHTTPSProxyHost;
        v49[2] = v43;
        v48[3] = kCFStreamPropertyHTTPSProxyPort;
        v49[3] = v42;
        v30 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 4);

        v29 = (os_log_t)(id)_BYLoggingFacility(objc_msgSend(v45[0], "setConnectionProxyDictionary:", v30));
        v28 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          sub_100038C28((uint64_t)v47, (uint64_t)v30);
          _os_log_impl((void *)&_mh_execute_header, v29, v28, "Set Proxy Settings %@", v47, 0xCu);
        }
        objc_storeStrong((id *)&v29, 0);
        objc_storeStrong(&v30, 0);
      }
      else
      {
        v27 = (os_log_t)(id)_BYLoggingFacility(v4);
        v26 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v15 = v27;
          v16 = v26;
          sub_100038C3C(v25);
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "No Proxy Settings Detected!", (uint8_t *)v25, 2u);
        }
        objc_storeStrong((id *)&v27, 0);
      }
      if (v42)
      {
        if (objc_msgSend(v42, "integerValue") == (id)443)
        {
          v17 = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration");
          v18 = objc_msgSend(v17, "cellularActivationMethod");

          if (v18 == (id)1)
            objc_msgSend(v45[0], "set_requiresSecureHTTPSProxyConnection:", 1);
        }
      }
      objc_storeStrong(&v41, 0);
      objc_storeStrong(&v42, 0);
      objc_storeStrong(&v43, 0);
      objc_storeStrong(&location, 0);
    }
    v19 = v45[0];
    v20 = v46;
    v21 = +[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue");
    v22 = +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v19, v20, v21);
    session = v46->_session;
    v46->_session = v22;

    objc_storeStrong(v45, 0);
  }
  return v46->_session;
}

- (NSURLSessionConfiguration)sessionConfiguration
{
  NSURLSession *v2;
  NSURLSessionConfiguration *v3;

  v2 = -[BuddyActivationEngine session](self, "session", a2, self);
  v3 = -[NSURLSession configuration](v2, "configuration");

  return v3;
}

- (id)_newActivationRequestWithOptions:(id)a3 sessionData:(id)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_signpost_type_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  NSString *v18;
  id v19;
  unint64_t Nanoseconds;
  NSObject *v21;
  os_signpost_type_t v22;
  os_signpost_id_t v23;
  uint64_t v24;
  BuddyActivationEngine *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  NSString *v30;
  id v31;
  NSArray *v32;
  id v33;
  id v34;
  unsigned __int8 v35;
  NSUserDefaults *v36;
  id v37;
  id v38;
  uint64_t v39;
  unint64_t i;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD __b[8];
  uint64_t v47;
  id v48;
  char v49;
  id v50;
  char v51;
  id v52;
  id v53;
  os_log_type_t v54;
  os_log_t v55;
  id v56;
  os_log_type_t v57;
  os_log_t v58;
  uint8_t v59[16];
  uint64_t v60;
  char v61;
  os_log_t v62;
  double v63;
  int v64;
  char v65;
  id v66;
  char v67;
  id v68;
  os_log_type_t v69;
  os_log_t v70;
  id v71;
  id obj;
  os_log_type_t v73;
  os_log_t oslog;
  uint8_t buf[8];
  uint64_t v76;
  char v77;
  os_log_t log;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  id v84;
  id *v85;
  id v86;
  id location[2];
  BuddyActivationEngine *v88;
  id v89;
  uint8_t v90[128];
  uint8_t v91[16];
  uint8_t v92[32];
  uint8_t v93[16];
  uint8_t v94[24];

  v88 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v86 = 0;
  objc_storeStrong(&v86, a4);
  v85 = a5;
  v84 = 0;
  v83 = 0;
  v82 = 0;
  v81 = 0;
  v8 = (id)_BYSignpostSubsystem(v7);
  v9 = _BYSignpostCreate(v8);
  v80 = v10;
  v79 = v9;

  log = (os_log_t)(id)_BYSignpostSubsystem(v11);
  v77 = 1;
  v76 = v79;
  if (v79 && v76 != -1 && os_signpost_enabled(log))
  {
    v12 = log;
    v13 = v77;
    v14 = v76;
    sub_100038C3C(buf);
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, v13, v14, "ActivationCreateActivationRequest", ", buf, 2u);
  }
  objc_storeStrong((id *)&log, 0);
  oslog = (os_log_t)(id)_BYSignpostSubsystem(v15);
  v73 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000342B4((uint64_t)v94, v79);
    _os_log_impl((void *)&_mh_execute_header, oslog, v73, "BEGIN [%lld]: ActivationCreateActivationRequest ", v94, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v81 = v79;
  v82 = v80;
  obj = v84;
  v71 = v83;
  v16 = MAECreateActivationRequestWithError(v86, &obj, location[0], &v71);
  objc_storeStrong(&v84, obj);
  objc_storeStrong(&v83, v71);
  if ((v16 & 1) != 0)
  {
    Nanoseconds = _BYSignpostGetNanoseconds(v81, v82);
    v63 = (double)Nanoseconds / 1000000000.0;
    v62 = (os_log_t)(id)_BYSignpostSubsystem(Nanoseconds);
    v61 = 2;
    v60 = v81;
    if (v81 && v60 != -1 && os_signpost_enabled(v62))
    {
      v21 = v62;
      v22 = v61;
      v23 = v60;
      sub_100038C3C(v59);
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, v22, v23, "ActivationCreateActivationRequest", ", v59, 2u);
    }
    objc_storeStrong((id *)&v62, 0);
    v58 = (os_log_t)(id)_BYSignpostSubsystem(v24);
    v57 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      sub_10008A810((uint64_t)v92, v81, *(uint64_t *)&v63);
      _os_log_impl((void *)&_mh_execute_header, v58, v57, "END [%lld] %fs: ActivationCreateActivationRequest ", v92, 0x16u);
    }
    objc_storeStrong((id *)&v58, 0);
    v56 = objc_msgSend(v84, "valueForHTTPHeaderField:", CFSTR("User-Agent"));
    v25 = v88;
    v26 = sub_10012A1B8();
    v27 = objc_msgSend(v26, "stringByAppendingFormat:", CFSTR(" %@"), v56);
    -[BuddyActivationEngine setUserAgent:](v25, "setUserAgent:", v27);

    v55 = (os_log_t)(id)_BYLoggingFacility(v28);
    v54 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      v53 = objc_msgSend(v84, "URL");
      sub_100038C28((uint64_t)v91, (uint64_t)v53);
      _os_log_impl((void *)&_mh_execute_header, v55, v54, "Setting override URL with old URL: %@", v91, 0xCu);

      objc_storeStrong(&v53, 0);
    }
    objc_storeStrong((id *)&v55, 0);
    if (v88->_overrideActivationURL)
      objc_msgSend(v84, "setURL:", v88->_overrideActivationURL);
    v29 = v84;
    v30 = -[BuddyActivationEngine userAgent](v88, "userAgent");
    objc_msgSend(v29, "setValue:forHTTPHeaderField:", v30, CFSTR("User-Agent"));

    v31 = v84;
    v32 = +[NSLocale preferredLanguages](NSLocale, "preferredLanguages");
    v33 = +[NSLocale minimizedLanguagesFromLanguages:](NSLocale, "minimizedLanguagesFromLanguages:", v32);
    v34 = objc_msgSend(v33, "componentsJoinedByString:", CFSTR(","));
    objc_msgSend(v31, "setValue:forHTTPHeaderField:", v34, CFSTR("Accept-Language"));

    v51 = 0;
    v49 = 0;
    v35 = 0;
    if ((os_variant_allows_internal_security_policies("com.apple.purplebuddy") & 1) != 0)
    {
      v52 = objc_msgSend(v84, "URL");
      v51 = 1;
      v50 = objc_msgSend(v52, "absoluteString");
      v49 = 1;
      v35 = objc_msgSend(v50, "hasSuffix:", CFSTR("/deviceActivation"));
    }
    if ((v49 & 1) != 0)

    if ((v51 & 1) != 0)
    if ((v35 & 1) != 0)
    {
      v36 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
      v48 = -[NSUserDefaults dictionaryForKey:](v36, "dictionaryForKey:", CFSTR("CustomActivationHeaders"));

      memset(__b, 0, sizeof(__b));
      v37 = v48;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", __b, v90, 16);
      if (v38)
      {
        v39 = *(_QWORD *)__b[2];
        do
        {
          for (i = 0; i < (unint64_t)v38; ++i)
          {
            if (*(_QWORD *)__b[2] != v39)
              objc_enumerationMutation(v37);
            v47 = *(_QWORD *)(__b[1] + 8 * i);
            v41 = v84;
            v42 = objc_msgSend(v48, "objectForKeyedSubscript:", v47);
            objc_msgSend(v41, "setValue:forHTTPHeaderField:", v42, v47);

          }
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", __b, v90, 16);
        }
        while (v38);
      }

      objc_storeStrong(&v48, 0);
    }
    if (v88->_allowAnyHTTPSCertificate)
    {
      v43 = objc_msgSend(v84, "URL");
      v44 = objc_msgSend(v43, "host");
      +[NSURLRequest setAllowsAnyHTTPSCertificate:forHost:](NSURLRequest, "setAllowsAnyHTTPSCertificate:forHost:", 1, v44);

    }
    -[BuddyActivationEngine _addCommonHeaders:](v88, "_addCommonHeaders:", v84);
    v89 = v84;
    v64 = 1;
    objc_storeStrong(&v56, 0);
  }
  else
  {
    v70 = (os_log_t)(id)_BYLoggingFacility(v17);
    v69 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      v67 = 0;
      v65 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v18 = (NSString *)v83;
      }
      else if (v83)
      {
        v68 = objc_msgSend(v83, "domain");
        v67 = 1;
        v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v68, objc_msgSend(v83, "code"));
        v66 = v18;
        v65 = 1;
      }
      else
      {
        v18 = 0;
      }
      sub_100039500((uint64_t)v93, (uint64_t)v18);
      _os_log_impl((void *)&_mh_execute_header, v70, v69, "Buddy Activate: Failed to create activation request: %{public}@", v93, 0xCu);
      if ((v65 & 1) != 0)

      if ((v67 & 1) != 0)
    }
    objc_storeStrong((id *)&v70, 0);
    if (v85)
    {
      v19 = objc_retainAutorelease(v83);
      *v85 = v19;
    }
    v89 = 0;
    v64 = 1;
  }
  objc_storeStrong(&v83, 0);
  objc_storeStrong(&v84, 0);
  objc_storeStrong(&v86, 0);
  objc_storeStrong(location, 0);
  return v89;
}

- (void)_sendSessionRequest:(id)a3 withOptions:(id)a4
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_signpost_type_t v10;
  os_signpost_id_t v11;
  uint64_t v12;
  NSURLSession *v13;
  id v14;
  NSURLSessionDataTask *v15;
  void *v16;
  uint64_t v17;
  os_log_t oslog;
  void **v19;
  int v20;
  int v21;
  void (*v22)(uint64_t, void *, void *, void *);
  void *v23;
  BuddyActivationEngine *v24;
  id v25[2];
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  int v29;
  int v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  os_log_type_t v34;
  id v35;
  __int16 buf;
  os_signpost_id_t v37;
  char v38;
  id v39;
  __int128 v40;
  __int128 v41;
  id v42;
  id location[2];
  BuddyActivationEngine *v44;
  uint8_t v45[16];
  uint8_t v46[24];

  v44 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v42 = 0;
  objc_storeStrong(&v42, a4);
  v41 = 0uLL;
  v6 = (id)_BYSignpostSubsystem(v5);
  *(_QWORD *)&v40 = _BYSignpostCreate(v6);
  *((_QWORD *)&v40 + 1) = v7;

  v39 = (id)_BYSignpostSubsystem(v8);
  v38 = 1;
  v37 = v40;
  if ((_QWORD)v40 && v37 != -1 && os_signpost_enabled((os_log_t)v39))
  {
    v9 = v39;
    v10 = v38;
    v11 = v37;
    sub_100038C3C(&buf);
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, v10, v11, "ActivationSendRequest", ", (uint8_t *)&buf, 2u);
  }
  objc_storeStrong(&v39, 0);
  v35 = (id)_BYSignpostSubsystem(v12);
  v34 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000342B4((uint64_t)v46, v40);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v35, v34, "BEGIN [%lld]: ActivationSendRequest ", v46, 0xCu);
  }
  objc_storeStrong(&v35, 0);
  v41 = v40;
  v27 = 0;
  v28 = &v27;
  v29 = 838860800;
  v30 = 48;
  v31 = sub_10018EBAC;
  v32 = sub_10018EBDC;
  v33 = 0;
  v13 = -[BuddyActivationEngine session](v44, "session");
  v14 = location[0];
  v19 = _NSConcreteStackBlock;
  v20 = -1073741824;
  v21 = 0;
  v22 = sub_10018EBE8;
  v23 = &unk_1002840B8;
  v26 = v41;
  v24 = v44;
  v25[0] = v42;
  v25[1] = &v27;
  v15 = -[NSURLSession dataTaskWithRequest:completionHandler:](v13, "dataTaskWithRequest:completionHandler:", v14, &v19);
  v16 = (void *)v28[5];
  v28[5] = (uint64_t)v15;

  oslog = (os_log_t)(id)_BYLoggingFacility(v17);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100039500((uint64_t)v45, v28[5]);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Buddy Activation: Created session data task: %{public}@", v45, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_msgSend((id)v28[5], "resume");
  _Block_object_dispose(&v27, 8);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(v25, 0);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
}

- (void)tryActivateWithOptions:(id)a3 requestMutator:(id)a4 completion:(id)a5
{
  NSObject *v7;
  void **block;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  BuddyActivationEngine *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  BuddyActivationEngine *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = 0;
  objc_storeStrong(&v17, a5);
  -[BuddyActivationEngine setCompletion:](v20, "setCompletion:", v17);
  objc_storeStrong((id *)&v20->_activationData, 0);
  v7 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_10018FBDC;
  v12 = &unk_1002840E0;
  v15 = v17;
  v13 = v20;
  v16 = v18;
  v14 = location[0];
  dispatch_async(v7, &block);

  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)makeRequest:(id)a3 completion:(id)a4
{
  NSString *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  os_signpost_type_t v12;
  os_signpost_id_t v13;
  uint64_t v14;
  NSURLSession *v15;
  uint64_t v16;
  os_log_t v17;
  id v18;
  void **v19;
  int v20;
  int v21;
  void (*v22)(_QWORD *, void *, void *, void *, void *);
  void *v23;
  id v24[3];
  os_log_type_t v25;
  os_log_t oslog;
  uint8_t buf[16];
  void *v28;
  char v29;
  os_log_t log;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id location[2];
  BuddyActivationEngine *v38;
  uint8_t v39[16];
  uint8_t v40[24];

  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v36 = 0;
  objc_storeStrong(&v36, a4);
  v35 = objc_msgSend(location[0], "mutableCopy");
  v5 = -[BuddyActivationEngine userAgent](v38, "userAgent");
  objc_msgSend(v35, "setValue:forHTTPHeaderField:", v5, CFSTR("User-Agent"));

  objc_storeStrong((id *)&v38->_activationRequest, v35);
  v34 = 0;
  v33 = 0;
  v7 = (id)_BYSignpostSubsystem(v6);
  v8 = (void *)_BYSignpostCreate(v7);
  v32 = v9;
  v31 = v8;

  log = (os_log_t)(id)_BYSignpostSubsystem(v10);
  v29 = 1;
  v28 = v31;
  if (v31 && v28 != (void *)-1 && os_signpost_enabled(log))
  {
    v11 = log;
    v12 = v29;
    v13 = (os_signpost_id_t)v28;
    sub_100038C3C(buf);
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, v12, v13, "ActivationSendRequest", ", buf, 2u);
  }
  objc_storeStrong((id *)&log, 0);
  oslog = (os_log_t)(id)_BYSignpostSubsystem(v14);
  v25 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000342B4((uint64_t)v40, (uint64_t)v31);
    _os_log_impl((void *)&_mh_execute_header, oslog, v25, "BEGIN [%lld]: ActivationSendRequest ", v40, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v33 = v31;
  v34 = v32;
  v19 = _NSConcreteStackBlock;
  v20 = -1073741824;
  v21 = 0;
  v22 = sub_1001905C0;
  v23 = &unk_100284090;
  v24[1] = v31;
  v24[2] = v32;
  v24[0] = v36;
  -[BuddyActivationEngine setCompletion:](v38, "setCompletion:", &v19);
  v15 = -[BuddyActivationEngine session](v38, "session");
  v18 = -[NSURLSession dataTaskWithRequest:](v15, "dataTaskWithRequest:", v38->_activationRequest);

  v17 = (os_log_t)(id)_BYLoggingFacility(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    sub_100039500((uint64_t)v39, (uint64_t)v18);
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Buddy Activation: Created arbitrary data task: %{public}@", v39, 0xCu);
  }
  objc_storeStrong((id *)&v17, 0);
  objc_msgSend(v18, "resume");
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v24, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
}

- (void)_addCommonHeaders:(id)a3
{
  id v3;
  id v4;
  id v5;
  id location[2];
  BuddyActivationEngine *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  if (-[BuddyActivationEngine useCellular](v7, "useCellular"))
  {
    if (-[BuddyActivationEngine usingBootstrap](v7, "usingBootstrap"))
      objc_storeStrong(&v5, &off_100290CB0);
    else
      objc_storeStrong(&v5, &off_100290CD8);
  }
  if (objc_msgSend(v5, "count"))
  {
    v3 = objc_msgSend(location[0], "allHTTPHeaderFields");
    v4 = objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "addEntriesFromDictionary:", v5);
    objc_msgSend(location[0], "setAllHTTPHeaderFields:", v4);
    objc_storeStrong(&v4, 0);
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v9;
  NSTimer *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  NSTimer *v14;
  id v15;
  uint64_t v16;
  BuddyActivationEngine *v17;
  id v18;
  _WORD v19[3];
  os_log_type_t v20;
  os_log_t v21;
  os_log_type_t v22;
  os_log_t oslog;
  id v24;
  id v25;
  id v26;
  id location[2];
  BuddyActivationEngine *v28;
  uint8_t buf[24];

  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v25 = 0;
  objc_storeStrong(&v25, a5);
  v24 = 0;
  objc_storeStrong(&v24, a6);
  oslog = (os_log_t)(id)_BYLoggingFacility(v9);
  v22 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)v25);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, v22, "Session received response: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v10 = -[BuddyActivationEngine connectivityTimer](v28, "connectivityTimer");

  if (v10)
  {
    v21 = (os_log_t)(id)_BYLoggingFacility(v11);
    v20 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v21;
      v13 = v20;
      sub_100038C3C(v19);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Invalidating connectivity timer...", (uint8_t *)v19, 2u);
    }
    objc_storeStrong((id *)&v21, 0);
    v14 = -[BuddyActivationEngine connectivityTimer](v28, "connectivityTimer");
    -[NSTimer invalidate](v14, "invalidate");

    -[BuddyActivationEngine setConnectivityTimer:](v28, "setConnectivityTimer:", 0);
  }
  v15 = v25;
  v16 = objc_opt_class(NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
  {
    v17 = v28;
    v18 = objc_msgSend(v25, "allHeaderFields");
    -[BuddyActivationEngine setResponseHeaders:](v17, "setResponseHeaders:", v18);

  }
  else
  {
    -[BuddyActivationEngine setResponseHeaders:](v28, "setResponseHeaders:", 0);
  }
  if (v24)
    (*((void (**)(id, uint64_t))v24 + 2))(v24, 1);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7;
  NSMutableData *v8;
  NSMutableData *activationData;
  id v10;
  id v11;
  id location[2];
  BuddyActivationEngine *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = 0;
  objc_storeStrong(&v10, a5);
  if (location[0] == v13->_session)
  {
    if (v13->_activationData)
    {
      -[NSMutableData appendData:](v13->_activationData, "appendData:", v10);
    }
    else
    {
      v7 = objc_alloc((Class)NSMutableData);
      v8 = (NSMutableData *)objc_msgSend(v7, "initWithData:", v10);
      activationData = v13->_activationData;
      v13->_activationData = v8;

    }
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v7;
  id v8;
  int64_t v9;
  NSString *v10;
  id v11;
  NSDictionary *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;
  id v19;
  char v20;
  id v21;
  os_log_type_t v22;
  os_log_t oslog;
  id v24;
  id v25;
  id location[2];
  BuddyActivationEngine *v27;
  uint8_t buf[40];

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = 0;
  objc_storeStrong(&v24, a5);
  oslog = (os_log_t)(id)_BYLoggingFacility(v7);
  v22 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v25;
    v9 = -[NSMutableData length](v27->_activationData, "length");
    v20 = 0;
    v18 = 0;
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v10 = (NSString *)v24;
    }
    else if (v24)
    {
      v21 = objc_msgSend(v24, "domain");
      v20 = 1;
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v21, objc_msgSend(v24, "code"));
      v19 = v10;
      v18 = 1;
    }
    else
    {
      v10 = 0;
    }
    sub_10003AA38((uint64_t)buf, (uint64_t)v8, v9, (uint64_t)v10);
    _os_log_impl((void *)&_mh_execute_header, oslog, v22, "Task %{public}@ completed with activationData length = %llu, error: %{public}@", buf, 0x20u);
    if ((v18 & 1) != 0)

    if ((v20 & 1) != 0)
  }
  objc_storeStrong((id *)&oslog, 0);
  if (location[0] == v27->_session)
  {
    v11 = -[BuddyActivationEngine completion](v27, "completion");

    if (v11)
    {
      v17 = -[NSMutableData copy](v27->_activationData, "copy");
      v12 = -[BuddyActivationEngine responseHeaders](v27, "responseHeaders");
      v16 = -[NSDictionary copy](v12, "copy");

      v15 = -[BuddyActivationEngine completion](v27, "completion");
      -[BuddyActivationEngine _cleanup](v27, "_cleanup");
      v13 = objc_msgSend(v25, "response");
      v14 = objc_msgSend(v13, "URL");
      (*((void (**)(id, id, id, id, id))v15 + 2))(v15, v17, v16, v14, v24);

      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v17, 0);
    }
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  BOOL v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSData *v15;
  id obj;
  char v17;
  id v18;
  os_log_type_t v19;
  os_log_t oslog;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location[2];
  BuddyActivationEngine *v27;
  uint8_t buf[40];

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = 0;
  objc_storeStrong(&v24, a5);
  v23 = 0;
  objc_storeStrong(&v23, a6);
  v22 = 0;
  objc_storeStrong(&v22, a7);
  v21 = objc_msgSend(v24, "statusCode");
  oslog = (os_log_t)(id)_BYLoggingFacility(v21);
  v19 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_1001912D4((uint64_t)buf, (int)v21, (uint64_t)v24, (uint64_t)v23);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, v19, "Activate: Will redirect, code %i: %@, new request: %@", buf, 0x1Cu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v17 = 0;
  v11 = 0;
  if (v24)
  {
    v11 = 0;
    if (v21 == (id)302)
    {
      v11 = 0;
      if (v27->_activationRequest)
      {
        v18 = -[NSURLRequest HTTPBody](v27->_activationRequest, "HTTPBody");
        v17 = 1;
        v11 = v18 != 0;
      }
    }
  }
  if ((v17 & 1) != 0)

  if (v11)
  {
    obj = objc_msgSend(v23, "mutableCopy");
    objc_msgSend(obj, "setHTTPMethod:", CFSTR("POST"));
    v12 = -[NSURLRequest valueForHTTPHeaderField:](v27->_activationRequest, "valueForHTTPHeaderField:", CFSTR("Content-Type"));
    objc_msgSend(obj, "setValue:forHTTPHeaderField:", v12, CFSTR("Content-Type"));

    v13 = -[NSURLRequest valueForHTTPHeaderField:](v27->_activationRequest, "valueForHTTPHeaderField:", CFSTR("Content-Length"));
    objc_msgSend(obj, "setValue:forHTTPHeaderField:", v13, CFSTR("Content-Length"));

    v14 = -[BuddyActivationEngine userAgent](v27, "userAgent");
    objc_msgSend(obj, "setValue:forHTTPHeaderField:", v14, CFSTR("User-Agent"));

    v15 = -[NSURLRequest HTTPBody](v27->_activationRequest, "HTTPBody");
    objc_msgSend(obj, "setHTTPBody:", v15);

    objc_storeStrong(&v23, obj);
    objc_storeStrong(&obj, 0);
  }
  if (location[0] == v27->_session && v27->_activationRequest != v23)
    -[BuddyActivationEngine setActivationRequest:](v27, "setActivationRequest:", v23);
  if (v22)
    (*((void (**)(id, id))v22 + 2))(v22, v23);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  double v8;
  NSTimer *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(NSObject *, void *);
  void *v13;
  id v14;
  os_log_type_t v15;
  os_log_t oslog;
  double v17;
  id v18;
  id location[2];
  BuddyActivationEngine *v20;
  uint8_t buf[24];

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = 15.0;
  if (v20->_useCellular)
  {
    v6 = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration");
    v7 = objc_msgSend(v6, "cellularActivationMethod");

    if (v7 == (id)1)
      v17 = 60.0;
  }
  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000342B4((uint64_t)buf, *(uint64_t *)&v17);
    _os_log_impl((void *)&_mh_execute_header, oslog, v15, "Waiting %0.f seconds for connectivity for activation...", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v8 = v17;
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100191520;
  v13 = &unk_100281ED8;
  v14 = v18;
  v9 = +[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v10, v8);
  -[BuddyActivationEngine setConnectivityTimer:](v20, "setConnectivityTimer:", v9, v10, v11, v12, v13);

  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)useCellular
{
  return self->_useCellular;
}

- (void)setUseCellular:(BOOL)a3
{
  self->_useCellular = a3;
}

- (BOOL)allowAnyHTTPSCertificate
{
  return self->_allowAnyHTTPSCertificate;
}

- (void)setAllowAnyHTTPSCertificate:(BOOL)a3
{
  self->_allowAnyHTTPSCertificate = a3;
}

- (void)setSessionConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_sessionConfiguration, a3);
}

- (NSURL)overrideActivationURL
{
  return self->_overrideActivationURL;
}

- (void)setOverrideActivationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)overrideSessionURL
{
  return self->_overrideSessionURL;
}

- (void)setOverrideSessionURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)usingBootstrap
{
  return self->_usingBootstrap;
}

- (void)setUsingBootstrap:(BOOL)a3
{
  self->_usingBootstrap = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)responseHeaders
{
  return self->_responseHeaders;
}

- (void)setResponseHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURLRequest)activationRequest
{
  return self->_activationRequest;
}

- (void)setActivationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_activationRequest, a3);
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (OS_dispatch_queue)telephonyClientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTelephonyClientQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CoreTelephonyClient)telephonyClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTelephonyClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSTimer)connectivityTimer
{
  return self->_connectivityTimer;
}

- (void)setConnectivityTimer:(id)a3
{
  objc_storeStrong((id *)&self->_connectivityTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectivityTimer, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_telephonyClientQueue, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_activationRequest, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_overrideSessionURL, 0);
  objc_storeStrong((id *)&self->_overrideActivationURL, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_activationData, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
