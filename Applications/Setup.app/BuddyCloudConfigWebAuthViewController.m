@implementation BuddyCloudConfigWebAuthViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  NSBundle *v5;
  NSString *v6;
  WKWebsiteDataStore *v7;
  id v8;
  BuddyCloudConfigWebAuthViewController *v9;
  WKWebView *v10;
  BuddyCloudConfigWebAuthViewController *v11;
  WKWebView *v12;
  BuddyCloudConfigWebAuthViewController *v13;
  WKWebView *v14;
  WKWebViewConfiguration *v15;
  WKProcessPool *v16;
  id v17;
  NSURL *v18;
  id v19;
  WKWebView *v20;
  id v21;
  id location;
  id v23;
  id v24;
  objc_super v25;
  SEL v26;
  BuddyCloudConfigWebAuthViewController *v27;

  v27 = self;
  v26 = a2;
  v25.receiver = self;
  v25.super_class = (Class)BuddyCloudConfigWebAuthViewController;
  -[BuddyCloudConfigWebAuthViewController viewDidLoad](&v25, "viewDidLoad");
  v2 = objc_alloc((Class)UIBarButtonItem);
  v3 = objc_msgSend(v2, "initWithBarButtonSystemItem:target:action:", 1, v27, "cancelButtonTapped");
  v4 = -[BuddyCloudConfigWebAuthViewController navigationItem](v27, "navigationItem");
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("REMOTE_MANAGEMENT_TITLE"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyCloudConfigWebAuthViewController setTitle:](v27, "setTitle:", v6);

  v24 = objc_opt_new(WKWebViewConfiguration);
  v7 = +[WKWebsiteDataStore nonPersistentDataStore](WKWebsiteDataStore, "nonPersistentDataStore");
  objc_msgSend(v24, "setWebsiteDataStore:", v7);

  v8 = objc_msgSend(v24, "preferences");
  objc_msgSend(v8, "_setDiagnosticLoggingEnabled:", 1);

  v23 = objc_msgSend(objc_alloc((Class)WKWebView), "initWithFrame:configuration:", v24, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BuddyCloudConfigWebAuthViewController setView:](v27, "setView:", v23);
  -[BuddyCloudConfigWebAuthViewController setWebView:](v27, "setWebView:", v23);
  v9 = v27;
  v10 = -[BuddyCloudConfigWebAuthViewController webView](v27, "webView");
  -[WKWebView setUIDelegate:](v10, "setUIDelegate:", v9);

  v11 = v27;
  v12 = -[BuddyCloudConfigWebAuthViewController webView](v27, "webView");
  -[WKWebView setNavigationDelegate:](v12, "setNavigationDelegate:", v11);

  v13 = v27;
  v14 = -[BuddyCloudConfigWebAuthViewController webView](v27, "webView");
  v15 = -[WKWebView configuration](v14, "configuration");
  v16 = -[WKWebViewConfiguration processPool](v15, "processPool");
  -[WKProcessPool _setDownloadDelegate:](v16, "_setDownloadDelegate:", v13);

  v17 = objc_alloc((Class)NSMutableURLRequest);
  v18 = -[BuddyCloudConfigWebAuthViewController webURL](v27, "webURL");
  location = objc_msgSend(v17, "initWithURL:", v18);

  v19 = -[BuddyCloudConfigWebAuthViewController _getEncodedMachineInfo](v27, "_getEncodedMachineInfo");
  objc_msgSend(location, "setValue:forHTTPHeaderField:", v19, CFSTR("x-apple-aspen-deviceinfo"));

  v20 = -[BuddyCloudConfigWebAuthViewController webView](v27, "webView");
  v21 = -[WKWebView loadRequest:](v20, "loadRequest:", location);

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  NSBundle *v12;
  id v13;
  BOOL v14;
  id v15;
  NSBundle *v16;
  NSString *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  int v23;
  uint8_t buf[15];
  os_log_type_t v25;
  os_log_t oslog;
  id v27;
  id v28;
  id location[2];
  BuddyCloudConfigWebAuthViewController *v30;

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = 0;
  objc_storeStrong(&v28, a4);
  v27 = 0;
  objc_storeStrong(&v27, a5);
  v7 = objc_msgSend(v27, "domain");
  v8 = 0;
  if ((objc_msgSend(v7, "isEqualToString:", WebKitErrorDomain) & 1) != 0)
    v8 = objc_msgSend(v27, "code") == (id)102;

  if (v8)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v9);
    v25 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = oslog;
      v11 = v25;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Suppressing web navigation error caused by policy change", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v23 = 1;
  }
  else
  {
    v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v22 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", CFSTR("REMOTE_MANAGEMENT_FAILED_TO_LOAD_PAGE"), &stru_100284738, CFSTR("Localizable"));

    v13 = objc_msgSend(v27, "domain");
    v14 = 0;
    if ((objc_msgSend(v13, "isEqualToString:", NSURLErrorDomain) & 1) != 0)
      v14 = objc_msgSend(v27, "code") == (id)-1003;

    if (v14)
    {
      v15 = objc_msgSend(v27, "userInfo");
      v21 = objc_msgSend(v15, "objectForKeyedSubscript:", NSURLErrorFailingURLErrorKey);

      v20 = objc_msgSend(v21, "host");
      v16 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v17 = -[NSBundle localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", CFSTR("REMOTE_MANAGEMENT_UNABLE_TO_RESOLVE_HOST"), &stru_100284738, CFSTR("Localizable"));
      v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v20);

      -[BuddyCloudConfigWebAuthViewController _showFailureAlertWithTitle:andMessage:](v30, "_showFailureAlertWithTitle:andMessage:", v22, v19);
      objc_storeStrong(&v19, 0);
      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v21, 0);
    }
    else
    {
      v18 = objc_msgSend(v27, "description");
      -[BuddyCloudConfigWebAuthViewController _showFailureAlertWithTitle:andMessage:](v30, "_showFailureAlertWithTitle:andMessage:", v22, v18);
      objc_storeStrong(&v18, 0);
    }
    objc_storeStrong(&v22, 0);
    v23 = 0;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  id v7;
  NSURL *v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  unsigned __int8 v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _WORD v19[3];
  char v20;
  os_log_t v21;
  uint8_t v22[15];
  char v23;
  os_log_t v24;
  char v25;
  id v26;
  int v27;
  uint8_t buf[7];
  char v29;
  os_log_t oslog;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id location[2];
  BuddyCloudConfigWebAuthViewController *v37;

  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = 0;
  objc_storeStrong(&v35, a4);
  v34 = 0;
  objc_storeStrong(&v34, a5);
  v33 = objc_msgSend(v35, "response");
  v7 = objc_msgSend(v33, "MIMEType");
  LOBYTE(a4) = objc_msgSend(v7, "isEqualToString:", CFSTR("application/x-apple-aspen-config"));

  if ((a4 & 1) != 0)
  {
    v8 = -[BuddyCloudConfigWebAuthViewController webURL](v37, "webURL");
    v32 = -[NSURL host](v8, "host");

    v9 = objc_msgSend(v33, "URL");
    v31 = objc_msgSend(v9, "host");

    v10 = objc_msgSend(v32, "caseInsensitiveCompare:", v31);
    if (v10)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v10);
      v29 = 16;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v11 = oslog;
        v12 = v29;
        sub_100038C3C(buf);
        _os_log_error_impl((void *)&_mh_execute_header, v11, v12, "domain of download does not match domain of initial URL from cloud config!", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      (*((void (**)(id, _QWORD))v34 + 2))(v34, 0);
      v27 = 1;
    }
    else
    {
      (*((void (**)(id, uint64_t))v34 + 2))(v34, 2);
      v27 = 1;
    }
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  else
  {
    v25 = 0;
    v13 = 0;
    if (objc_msgSend(v33, "statusCode") == (id)403)
    {
      v26 = objc_msgSend(v33, "MIMEType");
      v25 = 1;
      v13 = objc_msgSend(v26, "isEqualToString:", DMCHTTPContentTypeApplicationJSON);
    }
    if ((v25 & 1) != 0)

    if ((v13 & 1) != 0)
    {
      -[BuddyCloudConfigWebAuthViewController setWillDownloadError:](v37, "setWillDownloadError:", 1);
      (*((void (**)(id, uint64_t))v34 + 2))(v34, 2);
      v27 = 1;
    }
    else if (objc_msgSend(v33, "statusCode") == (id)404)
    {
      v24 = (os_log_t)(id)_BYLoggingFacility(404);
      v23 = 16;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v14 = v24;
        v15 = v23;
        sub_100038C3C(v22);
        _os_log_error_impl((void *)&_mh_execute_header, v14, v15, "recieved 404 response from website!", v22, 2u);
      }
      objc_storeStrong((id *)&v24, 0);
      (*((void (**)(id, _QWORD))v34 + 2))(v34, 0);
      v27 = 1;
    }
    else
    {
      v16 = (*((uint64_t (**)(id, uint64_t))v34 + 2))(v34, 1);
      v21 = (os_log_t)(id)_BYLoggingFacility(v16);
      v20 = 16;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v17 = v21;
        v18 = v20;
        sub_100038C3C(v19);
        _os_log_error_impl((void *)&_mh_execute_header, v17, v18, "did not recieve download response!", (uint8_t *)v19, 2u);
      }
      objc_storeStrong((id *)&v21, 0);
      v27 = 0;
    }
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _WORD v10[7];
  os_log_type_t v11;
  os_log_t oslog;
  id v13;
  id v14;
  id location[2];
  BuddyCloudConfigWebAuthViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = 0;
  objc_storeStrong(&v13, a5);
  oslog = (os_log_t)(id)_BYLoggingFacility(v7);
  v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = oslog;
    v9 = v11;
    sub_100038C3C(v10);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "webview didReceiveAuthenticationChallenge", (uint8_t *)v10, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyCloudConfigWebAuthViewController evaluateAuthenticationChallenge:withCompletionHandler:](v16, "evaluateAuthenticationChallenge:withCompletionHandler:", v14, v13);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)_downloadDidStart:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _WORD v6[7];
  os_log_type_t v7;
  os_log_t oslog;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v7;
    sub_100038C3C(v6);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "download did Start!", (uint8_t *)v6, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(location, 0);
}

- (void)_download:(id)a3 decideDestinationWithSuggestedFilename:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = 0;
  objc_storeStrong(&v8, a5);
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/tmp/%@"), v9);
  (*((void (**)(id, uint64_t, id))v8 + 2))(v8, 1, v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_download:(id)a3 didFailWithError:(id)a4
{
  uint64_t v5;
  BuddyCloudConfigWebAuthDelegate *v6;
  id v7;
  os_log_type_t v8;
  os_log_t oslog;
  id v10;
  id location[2];
  BuddyCloudConfigWebAuthViewController *v12;
  uint8_t buf[24];

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  v8 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)v10);
    _os_log_error_impl((void *)&_mh_execute_header, oslog, v8, "download failed with error from WKDownload!: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BYCloudConfigRetreiveProfileFromWebErrorDomain"), -2, 0);
  v6 = -[BuddyCloudConfigWebAuthViewController delegate](v12, "delegate");
  -[BuddyCloudConfigWebAuthDelegate webAuthCanceled:](v6, "webAuthCanceled:", v7);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)_downloadDidCancel:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BuddyCloudConfigWebAuthDelegate *v6;
  id v7;
  uint8_t buf[15];
  char v9;
  os_log_t oslog;
  id location[2];
  BuddyCloudConfigWebAuthViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v9 = 16;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    v4 = oslog;
    v5 = v9;
    sub_100038C3C(buf);
    _os_log_error_impl((void *)&_mh_execute_header, v4, v5, "download canceled! ", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BYCloudConfigRetreiveProfileFromWebErrorDomain"), -3, 0);
  v6 = -[BuddyCloudConfigWebAuthViewController delegate](v12, "delegate");
  -[BuddyCloudConfigWebAuthDelegate webAuthCanceled:](v6, "webAuthCanceled:", v7);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)_download:(id)a3 didCreateDestination:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _WORD v8[3];
  os_log_type_t v9;
  os_log_t oslog;
  id v11;
  id location[2];
  BuddyCloudConfigWebAuthViewController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = oslog;
    v7 = v9;
    sub_100038C3C(v8);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "download did create destination", (uint8_t *)v8, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyCloudConfigWebAuthViewController setDownloadDestination:](v13, "setDownloadDestination:", v11);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)_downloadDidFinish:(id)a3
{
  WKWebView *v3;
  NSString *v4;
  NSData *v5;
  _BOOL8 v6;
  NSData *v7;
  NSData *v8;
  unsigned __int8 v9;
  uint64_t v10;
  NSString *v11;
  BuddyCloudConfigWebAuthDelegate *v12;
  NSData *v13;
  NSFileManager *v14;
  NSString *v15;
  BuddyCloudConfigWebAuthDelegate *v16;
  NSData *v17;
  id v18;
  os_log_type_t v19;
  os_log_t v20;
  char v21;
  id v22;
  char v23;
  id v24;
  os_log_type_t v25;
  os_log_t v26;
  id obj;
  id v28;
  id v29;
  id v30;
  os_log_type_t v31;
  os_log_t oslog;
  id location[2];
  BuddyCloudConfigWebAuthViewController *v34;
  uint8_t v35[16];
  uint8_t v36[16];
  uint8_t buf[24];

  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyCloudConfigWebAuthViewController webView](v34, "webView");
  -[WKWebView stopLoading](v3, "stopLoading");

  v4 = -[BuddyCloudConfigWebAuthViewController downloadDestination](v34, "downloadDestination");
  v5 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v4);
  -[BuddyCloudConfigWebAuthViewController setDownloadedResponseData:](v34, "setDownloadedResponseData:", v5);

  v6 = -[BuddyCloudConfigWebAuthViewController willDownloadError](v34, "willDownloadError");
  if (v6)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v6);
    v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[BuddyCloudConfigWebAuthViewController downloadedResponseData](v34, "downloadedResponseData");
      v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), -[NSData length](v7, "length"));
      sub_100039500((uint64_t)buf, (uint64_t)v30);
      _os_log_impl((void *)&_mh_execute_header, oslog, v31, "we downloaded an error with data length of %{public}@!", buf, 0xCu);

      objc_storeStrong(&v30, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v8 = -[BuddyCloudConfigWebAuthViewController downloadedResponseData](v34, "downloadedResponseData");
    v29 = +[DMCHTTPRequestor jsonDictFromResponse:](DMCHTTPRequestor, "jsonDictFromResponse:", v8);

    v28 = 0;
    obj = 0;
    v9 = +[DMCHTTPRequestor parsePredefined403ErrorWithResponseDictionary:outError:](DMCHTTPRequestor, "parsePredefined403ErrorWithResponseDictionary:outError:", v29, &obj);
    objc_storeStrong(&v28, obj);
    if ((v9 & 1) != 0)
    {
      v26 = (os_log_t)(id)_BYLoggingFacility(v10);
      v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 0;
        v21 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v11 = (NSString *)v28;
        }
        else if (v28)
        {
          v24 = objc_msgSend(v28, "domain");
          v23 = 1;
          v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v24, objc_msgSend(v28, "code"));
          v22 = v11;
          v21 = 1;
        }
        else
        {
          v11 = 0;
        }
        sub_100039500((uint64_t)v36, (uint64_t)v11);
        _os_log_impl((void *)&_mh_execute_header, v26, v25, "WebAuthView received 403 error %{public}@!", v36, 0xCu);
        if ((v21 & 1) != 0)

        if ((v23 & 1) != 0)
      }
      objc_storeStrong((id *)&v26, 0);
    }
    v12 = -[BuddyCloudConfigWebAuthViewController delegate](v34, "delegate");
    -[BuddyCloudConfigWebAuthDelegate webAuthCanceled:](v12, "webAuthCanceled:", v28);

    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
  }
  else
  {
    v20 = (os_log_t)(id)_BYLoggingFacility(v6);
    v19 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[BuddyCloudConfigWebAuthViewController downloadedResponseData](v34, "downloadedResponseData");
      v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), -[NSData length](v13, "length"));
      sub_100039500((uint64_t)v35, (uint64_t)v18);
      _os_log_impl((void *)&_mh_execute_header, v20, v19, "we downloaded a profile with data length of %{public}@!", v35, 0xCu);

      objc_storeStrong(&v18, 0);
    }
    objc_storeStrong((id *)&v20, 0);
    v14 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v15 = -[BuddyCloudConfigWebAuthViewController downloadDestination](v34, "downloadDestination");
    -[NSFileManager removeItemAtPath:error:](v14, "removeItemAtPath:error:", v15, 0);

    v16 = -[BuddyCloudConfigWebAuthViewController delegate](v34, "delegate");
    v17 = -[BuddyCloudConfigWebAuthViewController downloadedResponseData](v34, "downloadedResponseData");
    -[BuddyCloudConfigWebAuthDelegate recievedProfile:](v16, "recievedProfile:", v17);

  }
  objc_storeStrong(location, 0);
}

- (void)_downloadProcessDidCrash:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BuddyCloudConfigWebAuthDelegate *v6;
  id v7;
  uint8_t buf[15];
  char v9;
  os_log_t oslog;
  id location[2];
  BuddyCloudConfigWebAuthViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v9 = 16;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    v4 = oslog;
    v5 = v9;
    sub_100038C3C(buf);
    _os_log_error_impl((void *)&_mh_execute_header, v4, v5, "the download process crashed!", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BYCloudConfigRetreiveProfileFromWebErrorDomain"), -4, 0);
  v6 = -[BuddyCloudConfigWebAuthViewController delegate](v12, "delegate");
  -[BuddyCloudConfigWebAuthDelegate webAuthCanceled:](v6, "webAuthCanceled:", v7);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)_download:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _WORD v10[7];
  os_log_type_t v11;
  os_log_t oslog;
  id v13;
  id v14;
  id location[2];
  BuddyCloudConfigWebAuthViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = 0;
  objc_storeStrong(&v13, a5);
  oslog = (os_log_t)(id)_BYLoggingFacility(v7);
  v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = oslog;
    v9 = v11;
    sub_100038C3C(v10);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "wkdownload didReceiveAuthenticationChallenge", (uint8_t *)v10, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyCloudConfigWebAuthViewController evaluateAuthenticationChallenge:withCompletionHandler:](v16, "evaluateAuthenticationChallenge:withCompletionHandler:", v14, v13);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (id)_getEncodedMachineInfo
{
  NSData *v2;
  id v3;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  v2 = -[BuddyCloudConfigWebAuthViewController machineInfo](self, "machineInfo");
  location[0] = -[NSData base64EncodedStringWithOptions:](v2, "base64EncodedStringWithOptions:", 0);

  v3 = location[0];
  objc_storeStrong(location, 0);
  return v3;
}

- (void)cancelButtonTapped
{
  BuddyCloudConfigWebAuthDelegate *v2;
  uint64_t v3;
  BuddyCloudConfigWebAuthDelegate *v4;
  NSObject *v5;
  os_log_type_t v6;
  _WORD v7[7];
  char v8;
  os_log_t oslog;
  id location[2];
  BuddyCloudConfigWebAuthViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  v2 = -[BuddyCloudConfigWebAuthViewController delegate](self, "delegate");

  if (v2)
  {
    location[0] = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BYCloudConfigRetreiveProfileFromWebErrorDomain"), -1, 0);
    v4 = -[BuddyCloudConfigWebAuthViewController delegate](v11, "delegate");
    -[BuddyCloudConfigWebAuthDelegate webAuthCanceled:](v4, "webAuthCanceled:", location[0]);

    objc_storeStrong(location, 0);
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    v8 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v5 = oslog;
      v6 = v8;
      sub_100038C3C(v7);
      _os_log_error_impl((void *)&_mh_execute_header, v5, v6, "no delegate defined for buddy web auth!", (uint8_t *)v7, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
}

- (void)_showFailureAlertWithTitle:(id)a3 andMessage:(id)a4
{
  uint64_t v5;
  id v6;
  NSBundle *v7;
  NSString *v8;
  UIAlertAction *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(id *, void *);
  void *v13;
  id v14;
  id v15;
  os_log_type_t v16;
  os_log_t oslog;
  id v18;
  id location[2];
  id v20;
  uint8_t buf[24];

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10003EB04((uint64_t)buf, (uint64_t)location[0], (uint64_t)v18);
    _os_log_impl((void *)&_mh_execute_header, oslog, v16, "Showing failure alert title: %@, message: %@", buf, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v15 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", location[0], v18, 1);
  v6 = v15;
  v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100284738, CFSTR("Localizable"));
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1000F3824;
  v13 = &unk_100280A28;
  v14 = v20;
  v9 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 1, &v10);
  objc_msgSend(v6, "addAction:", v9, v10, v11, v12, v13);

  objc_msgSend(v20, "presentViewController:animated:completion:", v15, 1, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)evaluateAuthenticationChallenge:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  unsigned __int8 v7;
  uint64_t v8;
  id v9;
  __SecTrust *v10;
  OSStatus v11;
  uint64_t v12;
  id v13;
  OSStatus v14;
  uint64_t v15;
  id v16;
  NSURLCredential *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  NSObject *v22;
  os_log_type_t v23;
  _WORD v24[3];
  char v25;
  os_log_t v26;
  os_log_type_t v27;
  os_log_t v28;
  uint8_t v29[15];
  os_log_type_t v30;
  os_log_t v31;
  OSStatus v32;
  SecTrustResultType result;
  os_log_type_t v34;
  os_log_t v35;
  OSStatus v36;
  os_log_type_t v37;
  os_log_t oslog;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  id location[2];
  BuddyCloudConfigWebAuthViewController *v45;
  uint8_t v46[16];
  uint8_t v47[16];
  uint8_t buf[24];

  v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = 0;
  objc_storeStrong(&v43, a4);
  v42 = 1;
  v41 = 0;
  v5 = objc_msgSend(location[0], "protectionSpace");
  v6 = objc_msgSend(v5, "authenticationMethod");
  v7 = objc_msgSend(v6, "isEqualToString:", NSURLAuthenticationMethodServerTrust);

  if ((v7 & 1) != 0)
  {
    v40 = objc_msgSend(location[0], "protectionSpace");
    v39 = objc_msgSend(v40, "host");
    oslog = (os_log_t)(id)_BYLoggingFacility(v39);
    v37 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100050750((uint64_t)buf, (uint64_t)v39, -[NSArray count](v45->_anchorCerts, "count"));
      _os_log_impl((void *)&_mh_execute_header, oslog, v37, "evaluating trust for %@ using %lu anchor certs", buf, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v45->_anchorCerts)
    {
      v36 = 0;
      v9 = objc_msgSend(location[0], "protectionSpace");
      v10 = (__SecTrust *)objc_msgSend(v9, "serverTrust");
      v11 = SecTrustSetAnchorCertificates(v10, (CFArrayRef)v45->_anchorCerts);

      v36 = v11;
      if (v11)
      {
        v35 = (os_log_t)(id)_BYLoggingFacility(v12);
        v34 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          sub_100046FA0(v47, v36);
          _os_log_error_impl((void *)&_mh_execute_header, v35, v34, "Failed to set Anchor Certs on trust! With secError code: %d", v47, 8u);
        }
        objc_storeStrong((id *)&v35, 0);
      }
    }
    result = kSecTrustResultInvalid;
    v13 = objc_msgSend(location[0], "protectionSpace");
    v14 = SecTrustEvaluate((SecTrustRef)objc_msgSend(v13, "serverTrust"), &result);

    v32 = v14;
    if (!v14 && (result == kSecTrustResultProceed || result == kSecTrustResultUnspecified))
    {
      v16 = objc_msgSend(location[0], "protectionSpace");
      v17 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", objc_msgSend(v16, "serverTrust"));
      v18 = v41;
      v41 = v17;

      v31 = (os_log_t)(id)_BYLoggingFacility(v19);
      v30 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v31;
        v21 = v30;
        sub_100038C3C(v29);
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "Accepting server trust!", v29, 2u);
      }
      objc_storeStrong((id *)&v31, 0);
      v42 = 0;
    }
    else
    {
      v28 = (os_log_t)(id)_BYLoggingFacility(v15);
      v27 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        sub_100046FA0(v46, v32);
        _os_log_error_impl((void *)&_mh_execute_header, v28, v27, "Could not evaluate trust! Error Code:  %d", v46, 8u);
      }
      objc_storeStrong((id *)&v28, 0);
      v42 = 3;
    }
    objc_storeStrong(&v39, 0);
    objc_storeStrong(&v40, 0);
  }
  else
  {
    v26 = (os_log_t)(id)_BYLoggingFacility(v8);
    v25 = 16;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v22 = v26;
      v23 = v25;
      sub_100038C3C(v24);
      _os_log_error_impl((void *)&_mh_execute_header, v22, v23, "Received an Authentication method other than Server Trust!!", (uint8_t *)v24, 2u);
    }
    objc_storeStrong((id *)&v26, 0);
    v42 = 3;
  }
  if (v43)
    (*((void (**)(id, uint64_t, id))v43 + 2))(v43, v42, v41);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
}

- (NSURL)webURL
{
  return self->_webURL;
}

- (void)setWebURL:(id)a3
{
  objc_storeStrong((id *)&self->_webURL, a3);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (NSArray)anchorCerts
{
  return self->_anchorCerts;
}

- (void)setAnchorCerts:(id)a3
{
  objc_storeStrong((id *)&self->_anchorCerts, a3);
}

- (NSData)machineInfo
{
  return self->_machineInfo;
}

- (void)setMachineInfo:(id)a3
{
  objc_storeStrong((id *)&self->_machineInfo, a3);
}

- (BuddyCloudConfigWebAuthDelegate)delegate
{
  return (BuddyCloudConfigWebAuthDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)downloadDestination
{
  return self->_downloadDestination;
}

- (void)setDownloadDestination:(id)a3
{
  objc_storeStrong((id *)&self->_downloadDestination, a3);
}

- (NSData)downloadedResponseData
{
  return self->_downloadedResponseData;
}

- (void)setDownloadedResponseData:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedResponseData, a3);
}

- (BOOL)willDownloadError
{
  return self->_willDownloadError;
}

- (void)setWillDownloadError:(BOOL)a3
{
  self->_willDownloadError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadedResponseData, 0);
  objc_storeStrong((id *)&self->_downloadDestination, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_machineInfo, 0);
  objc_storeStrong((id *)&self->_anchorCerts, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_webURL, 0);
}

@end
