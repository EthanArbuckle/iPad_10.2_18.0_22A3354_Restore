@implementation DDLookupQuery

- (id)feedbackListener
{
  return self->_session;
}

+ (id)queryWithQuery:(id)a3
{
  NSString *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;
  DDLookupQuery *v13;
  PARSession *v14;
  DDLookupQuery *v15;
  NSBundle *v16;
  id v17;
  id v18;
  id v19;
  NSString *v20;
  id location[2];
  id v22;

  v22 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  v19 = 0;
  if (location[0])
  {
    v5 = (NSString *)objc_msgSend(location[0], "userAgent");
    v6 = v20;
    v20 = v5;

    v7 = objc_msgSend(location[0], "identifier");
    v8 = v19;
    v19 = v7;

  }
  else
  {
    v16 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v22);
    v18 = -[NSBundle objectForInfoDictionaryKey:](v16, "objectForInfoDictionaryKey:", kCFBundleVersionKey);

    if (!objc_msgSend(v18, "length"))
      objc_storeStrong(&v18, CFSTR("1.0"));
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), kPARLookupClient, v18);
    v4 = v20;
    v20 = v3;

    objc_storeStrong(&v19, CFSTR("com.apple.lookup"));
    objc_storeStrong(&v18, 0);
  }
  v9 = objc_alloc((Class)PARSessionConfiguration);
  v17 = objc_msgSend(v9, "initWithId:userAgent:", v19, v20);
  v11 = v17;
  v12 = +[PARSession sharedSession](PARSession, "sharedSession");
  objc_msgSend(v12, "setConfiguration:", v11);

  v13 = [DDLookupQuery alloc];
  v14 = +[PARSession sessionWithConfiguration:](PARSession, "sessionWithConfiguration:", v17);
  v15 = -[DDLookupQuery initWithSession:](v13, "initWithSession:");

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(location, 0);
  return v15;
}

+ (id)queryWithoutNetwork
{
  return -[DDLookupQuery initWithSession:]([DDLookupQuery alloc], "initWithSession:", 0);
}

- (DDLookupQuery)initWithSession:(id)a3
{
  DDLookupQuery *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *bagQueue;
  PARBag *v6;
  PARBag *bag;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *bagSem;
  DDLookupQuery *v11;
  objc_super v12;
  id location[2];
  DDLookupQuery *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v14;
  v14 = 0;
  v12.receiver = v3;
  v12.super_class = (Class)DDLookupQuery;
  v14 = -[DDLookupQuery init](&v12, "init");
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    if (location[0])
    {
      v4 = dispatch_queue_create("DDLookupQuery.bag", 0);
      bagQueue = v14->_bagQueue;
      v14->_bagQueue = (OS_dispatch_queue *)v4;

      v6 = (PARBag *)objc_msgSend(location[0], "bag");
      bag = v14->_bag;
      v14->_bag = v6;

      if (v14->_bag)
      {
        v14->_bagFetchingOver = 1;
      }
      else
      {
        v8 = dispatch_semaphore_create(0);
        bagSem = v14->_bagSem;
        v14->_bagSem = (OS_dispatch_semaphore *)v8;

      }
      objc_storeStrong((id *)&v14->_session, location[0]);
      objc_msgSend(location[0], "setDelegate:", v14);
    }
    else
    {
      objc_storeStrong((id *)&v14->_bag, 0);
      v14->_bagFetchingOver = 1;
    }
  }
  v11 = v14;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v14, 0);
  return v11;
}

- (id)bag
{
  dispatch_time_t v2;
  id v4;
  NSObject *bagQueue;
  NSObject *log;
  os_log_type_t v7;
  NSObject *dsema;
  NSObject *queue;
  void **v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15[2];
  BOOL v16;
  uint8_t v17[7];
  os_log_type_t type;
  os_log_t oslog;
  BOOL v20;
  void **v21;
  int v22;
  int v23;
  _QWORD *(*v24)(_QWORD *);
  void *v25;
  id v26[3];
  uint64_t v27;
  uint64_t *v28;
  int v29;
  int v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  int v34;
  int v35;
  void (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38[2];
  DDLookupQuery *v39;

  v39 = self;
  v38[1] = (id)a2;
  v32 = 0;
  v33 = &v32;
  v34 = 838860800;
  v35 = 48;
  v36 = sub_100005C5C;
  v37 = sub_100005CB0;
  v38[0] = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x20000000;
  v30 = 32;
  v31 = 0;
  queue = self->_bagQueue;
  v21 = _NSConcreteStackBlock;
  v22 = -1073741824;
  v23 = 0;
  v24 = sub_100005CDC;
  v25 = &unk_1000205C0;
  v26[1] = &v32;
  v26[0] = self;
  v26[2] = &v27;
  dispatch_sync(queue, &v21);
  if ((v28[3] & 1) == 0)
  {
    v20 = 0;
    dsema = v39->_bagSem;
    v2 = dispatch_time(0, 2000000000);
    v20 = dispatch_semaphore_wait(dsema, v2) == 0;
    if (!v20)
    {
      oslog = &_os_log_default;
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        v7 = type;
        sub_100005D3C(v17);
        _os_log_error_impl((void *)&_mh_execute_header, log, v7, "Time out waiting for the bag, network calls will be disabled", v17, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    bagQueue = v39->_bagQueue;
    v10 = _NSConcreteStackBlock;
    v11 = -1073741824;
    v12 = 0;
    v13 = sub_100005D58;
    v14 = &unk_100020628;
    v15[1] = &v32;
    v15[0] = v39;
    v16 = v20;
    dispatch_sync(bagQueue, &v10);
    objc_storeStrong(v15, 0);
  }
  v4 = (id)v33[5];
  objc_storeStrong(v26, 0);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v32, 8);
  objc_storeStrong(v38, 0);
  return v4;
}

- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5
{
  NSObject *queue;
  void **v8;
  int v9;
  int v10;
  intptr_t (*v11)(intptr_t);
  void *v12;
  DDLookupQuery *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  DDLookupQuery *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = 0;
  objc_storeStrong(&v17, a5);
  v16 = v20->_bagSem;
  if (v16)
  {
    queue = v20->_bagQueue;
    v8 = _NSConcreteStackBlock;
    v9 = -1073741824;
    v10 = 0;
    v11 = sub_100006058;
    v12 = &unk_100020650;
    v13 = v20;
    v14 = v18;
    v15 = v16;
    dispatch_async(queue, &v8);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong((id *)&v13, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)parsecEnabled
{
  NSObject *v3;
  os_log_type_t v4;
  NSObject *v5;
  os_log_type_t v6;
  NSObject *log;
  os_log_type_t type;
  id v9;
  unsigned int v10;
  uint8_t v11[7];
  os_log_type_t v12;
  id v13;
  uint8_t v14[7];
  os_log_type_t v15;
  id v16;
  uint8_t v17[7];
  os_log_type_t v18;
  id location;
  id v20;
  char v21;
  id v22[2];
  DDLookupQuery *v23;
  char v24;

  v23 = self;
  v22[1] = (id)a2;
  if (self->_session)
  {
    v22[0] = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.spotlightui"));
    v9 = objc_msgSend(v22[0], "objectForKey:", CFSTR("SBSearchDisabledDomains"));
    v10 = objc_msgSend(v9, "containsObject:", CFSTR("DOMAIN_PARSEC")) ^ 1;

    v21 = v10 & 1;
    if ((v10 & 1) != 0)
    {
      v20 = -[DDLookupQuery bag](v23, "bag");
      v21 = objc_msgSend(v20, "isEnabled") & 1;
      if (!v21)
      {
        if (v20)
        {
          location = &_os_log_default;
          v18 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
          {
            log = location;
            type = v18;
            sub_100005D3C(v17);
            _os_log_impl((void *)&_mh_execute_header, log, type, "Parsec disabled from parsec bag, network calls will be disabled", v17, 2u);
          }
          objc_storeStrong(&location, 0);
        }
        else
        {
          v16 = &_os_log_default;
          v15 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
          {
            v5 = v16;
            v6 = v15;
            sub_100005D3C(v14);
            _os_log_impl((void *)&_mh_execute_header, v5, v6, "Parsec disabled because the bag couldn't be fetched, network calls will be disabled", v14, 2u);
          }
          objc_storeStrong(&v16, 0);
        }
      }
      objc_storeStrong(&v20, 0);
    }
    else
    {
      v13 = &_os_log_default;
      v12 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
        v3 = v13;
        v4 = v12;
        sub_100005D3C(v11);
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "Parsec disabled from system setting, network calls will be disabled", v11, 2u);
      }
      objc_storeStrong(&v13, 0);
    }
    v24 = v21 & 1;
    objc_storeStrong(v22, 0);
  }
  else
  {
    v24 = 0;
  }
  return v24 & 1;
}

- (void)sectionsForResult:(__DDResult *)a3 useNetwork:(BOOL)a4 clientId:(id)a5 queryId:(unint64_t)a6 scale:(double)a7 proxy:(id)a8 handler:(id)a9
{
  id v9;
  id v10;
  BOOL v11;
  id v12;
  unint64_t v13;
  id v14;
  DDLookupQuery *v15;
  id v20;
  id v21;
  int v22;
  id v23;
  id v24;
  double v25;
  unint64_t v26;
  id location;
  BOOL v28;
  __DDResult *v29;
  SEL v30;
  DDLookupQuery *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;

  v31 = self;
  v30 = a2;
  v29 = a3;
  v28 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v26 = a6;
  v25 = a7;
  v24 = 0;
  objc_storeStrong(&v24, a8);
  v23 = 0;
  objc_storeStrong(&v23, a9);
  if (v23 && v29 && (DDResultHasType(v29, DDBinderParsecSourceKey) & 1) != 0)
  {
    v21 = (id)DDResultGetMatchedString(v29);
    v20 = (id)DDResultGetParsecRawDomain(v29);
    v15 = v31;
    v10 = v21;
    v11 = v28;
    v12 = location;
    v13 = v26;
    v14 = v20;
    v9 = objc_msgSend(v21, "length");
    v33 = 0;
    v32 = v9;
    v34 = 0;
    v35 = v9;
    -[DDLookupQuery sectionsForString:useNetwork:clientId:queryId:selectionType:domain:range:scale:proxy:handler:](v15, "sectionsForString:useNetwork:clientId:queryId:selectionType:domain:range:scale:proxy:handler:", v10, v11, v12, v13, 2, v14, v25, 0, v9, v24, v23);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
    v22 = 0;
  }
  else
  {
    if (v23)
      (*((void (**)(id, _QWORD))v23 + 2))(v23, 0);
    v22 = 1;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&location, 0);
}

- (id)_rankFeedbackWithLocalSections:(id)a3 remoteSections:(id)a4 footerSection:(id)a5
{
  NSArray *v5;
  id v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  id v17;
  id v18;
  id v19;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  BOOL v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[8];
  uint64_t v45;
  uint64_t v46;
  id v47;
  _QWORD __b[8];
  id v49;
  uint64_t v50;
  id v51[3];
  char v52;
  id v53;
  char v54;
  id v55;
  char v56;
  id v57;
  double v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id location[2];
  DDLookupQuery *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  id v71;

  v64 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v62 = 0;
  objc_storeStrong(&v62, a4);
  v61 = 0;
  objc_storeStrong(&v61, a5);
  v60 = 0;
  v59 = +[NSDate date](NSDate, "date");
  v58 = 0.0;
  v56 = 0;
  v54 = 0;
  v52 = 0;
  v40 = 0;
  if (objc_msgSend(v62, "count"))
  {
    v57 = objc_msgSend(v62, "firstObject");
    v56 = 1;
    v55 = objc_msgSend(v57, "results");
    v54 = 1;
    v53 = objc_msgSend(v55, "firstObject");
    v52 = 1;
    v40 = objc_msgSend(v53, "placement") == 1;
  }
  if ((v52 & 1) != 0)

  if ((v54 & 1) != 0)
  if ((v56 & 1) != 0)

  if (v40)
  {
    v37 = objc_msgSend(v62, "firstObject");
    v71 = v37;
    v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v71, 1);
    v6 = v60;
    v60 = v5;

    if (objc_msgSend(v62, "count") == (id)1)
    {
      objc_storeStrong(&v62, 0);
    }
    else
    {
      v36 = v62;
      v7 = (char *)objc_msgSend(v62, "count");
      v66 = 1;
      v65 = v7 - 1;
      v67 = 1;
      v68 = v7 - 1;
      v51[1] = (id)1;
      v51[2] = v7 - 1;
      v8 = objc_msgSend(v36, "subarrayWithRange:", 1, v7 - 1);
      v9 = v62;
      v62 = v8;

    }
  }
  else
  {
    objc_storeStrong(&v60, &__NSArray0__struct);
  }
  if (objc_msgSend(location[0], "count"))
  {
    v10 = objc_msgSend(v60, "arrayByAddingObjectsFromArray:", location[0]);
    v11 = v60;
    v60 = v10;

  }
  if (objc_msgSend(v62, "count"))
  {
    v12 = objc_msgSend(v60, "arrayByAddingObjectsFromArray:", v62);
    v13 = v60;
    v60 = v12;

  }
  if (v61)
  {
    if (!objc_msgSend(v60, "count"))
    {
      v35 = (id)DDLocalizedString(CFSTR("No Content Found"), CFSTR("Text shown when there is no content to show in the Look Up view because there is no data to present"));
      objc_msgSend(v61, "setTitle:");

    }
    v14 = objc_msgSend(v60, "arrayByAddingObject:", v61);
    v15 = v60;
    v60 = v14;

  }
  objc_msgSend(v59, "timeIntervalSinceNow");
  v58 = -v16;
  v51[0] = +[NSMutableArray array](NSMutableArray, "array");
  v50 = 0;
  memset(__b, 0, sizeof(__b));
  v33 = v60;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", __b, v70, 16);
  if (v34)
  {
    v30 = *(_QWORD *)__b[2];
    v31 = 0;
    v32 = v34;
    while (1)
    {
      v29 = v31;
      if (*(_QWORD *)__b[2] != v30)
        objc_enumerationMutation(v33);
      v49 = *(id *)(__b[1] + 8 * v31);
      v47 = +[NSMutableArray array](NSMutableArray, "array");
      v46 = 0;
      memset(v44, 0, sizeof(v44));
      v27 = objc_msgSend(v49, "results");
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", v44, v69, 16);
      if (v28)
      {
        v24 = *(_QWORD *)v44[2];
        v25 = 0;
        v26 = v28;
        while (1)
        {
          v23 = v25;
          if (*(_QWORD *)v44[2] != v24)
            objc_enumerationMutation(v27);
          v45 = *(_QWORD *)(v44[1] + 8 * v25);
          v17 = objc_alloc((Class)SFResultRankingFeedback);
          v43 = objc_msgSend(v17, "initWithResult:hiddenResults:duplicateResults:localResultPosition:", v45, 0, 0, v46++);
          objc_msgSend(v47, "addObject:", v43);
          objc_storeStrong(&v43, 0);
          ++v25;
          if (v23 + 1 >= (unint64_t)v26)
          {
            v25 = 0;
            v26 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", v44, v69, 16);
            if (!v26)
              break;
          }
        }
      }

      v18 = objc_alloc((Class)SFSectionRankingFeedback);
      v42 = objc_msgSend(v18, "initWithResults:section:localSectionPosition:personalizationScore:", v47, v49, v50, 0.0);
      objc_msgSend(v51[0], "addObject:", v42);
      ++v50;
      objc_storeStrong(&v42, 0);
      objc_storeStrong(&v47, 0);
      ++v31;
      if (v29 + 1 >= (unint64_t)v32)
      {
        v31 = 0;
        v32 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", __b, v70, 16);
        if (!v32)
          break;
      }
    }
  }

  v19 = objc_alloc((Class)SFRankingFeedback);
  v41 = objc_msgSend(v19, "initWithSections:blendingDuration:", v51[0], v58);
  v21 = -[DDLookupQuery feedbackListener](v64, "feedbackListener");
  objc_msgSend(v21, "didRankSections:", v41);

  v22 = v60;
  objc_storeStrong(&v41, 0);
  objc_storeStrong(v51, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(location, 0);
  return v22;
}

- (void)sectionsForString:(id)a3 useNetwork:(BOOL)a4 clientId:(id)a5 queryId:(unint64_t)a6 selectionType:(int64_t)a7 domain:(id)a8 range:(_NSRange)a9 scale:(double)a10 proxy:(id)a11 handler:(id)a12
{
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  float v22;
  double v23;
  double v24;
  NSObject *v25;
  id v26;
  PARSession *session;
  double v28;
  id v29;
  id v30;
  id v31;
  id v32;
  int64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  dispatch_time_t when;
  NSObject *v42;
  id v43;
  float v44;
  id v45;
  NSObject *queue;
  NSObject *group;
  void *v48;
  char *v49;
  NSRegularExpression *v50;
  void *v51;
  id v52;
  void **v59;
  int v60;
  int v61;
  void (*v62)(uint64_t);
  void *v63;
  id v64;
  id v65[2];
  void **v66;
  int v67;
  int v68;
  void (*v69)(uint64_t, void *, void *, void *);
  void *v70;
  DDLookupQuery *v71;
  id v72;
  id v73;
  id v74[4];
  id v75;
  char v76;
  id v77;
  char v78;
  id v79;
  char v80;
  id v81;
  id v82;
  void **v83;
  int v84;
  int v85;
  void (*v86)(uint64_t, void *, void *);
  void *v87;
  DDLookupQuery *v88;
  id v89;
  id v90;
  id v91[4];
  void **v92;
  int v93;
  int v94;
  void (*v95)(uint64_t);
  void *v96;
  id v97;
  DDLookupQuery *v98;
  id v99;
  id v100[4];
  float v101;
  void **v102;
  int v103;
  int v104;
  void (*v105)(uint64_t);
  void *v106;
  id v107;
  id v108[3];
  _QWORD v109[2];
  int v110;
  int v111;
  char v112;
  _QWORD v113[2];
  int v114;
  int v115;
  void (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t);
  id v118;
  id v119;
  id v120;
  int v121;
  uint64_t v122;
  char *v123;
  char *v124;
  void **v125;
  int v126;
  int v127;
  void (*v128)(_QWORD *, void *);
  void *v129;
  uint64_t *v130;
  uint64_t v131;
  id v132;
  id v133;
  id v134;
  id v135;
  uint64_t v136;
  uint64_t *v137;
  int v138;
  int v139;
  void (*v140)(uint64_t, uint64_t);
  void (*v141)(uint64_t);
  id v142;
  id v143;
  id v144;
  id v145;
  double v146;
  id v147;
  int64_t v148;
  void *v149;
  id v150;
  BOOL v151;
  id location[2];
  DDLookupQuery *v153;
  _NSRange v154;
  id v155;
  dispatch_once_t *v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  id v164;

  v154 = a9;
  v153 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v151 = a4;
  v150 = 0;
  objc_storeStrong(&v150, a5);
  v149 = (void *)a6;
  v148 = a7;
  v147 = 0;
  objc_storeStrong(&v147, a8);
  v146 = a10;
  v145 = 0;
  objc_storeStrong(&v145, a11);
  v144 = 0;
  objc_storeStrong(&v144, a12);
  v143 = objc_msgSend(location[0], "substringWithRange:", v154.location, v154.length);
  v136 = 0;
  v137 = &v136;
  v138 = 838860800;
  v139 = 48;
  v140 = sub_100005C5C;
  v141 = sub_100005CB0;
  v142 = v143;
  if ((objc_msgSend((id)v137[5], "containsString:", CFSTR("\")) & 1) != 0)
  {
    v135 = 0;
    v133 = 0;
    v50 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("[\\p{Letter}&&\\p{script=hebrew}](\")[\\p{Letter}&&\\p{script=hebrew}]"), 0, &v133);
    objc_storeStrong(&v135, v133);
    v134 = v50;
    v51 = (void *)v137[5];
    v52 = objc_msgSend(v51, "length");
    v162 = 0;
    v161 = v52;
    v163 = 0;
    v164 = v52;
    v131 = 0;
    v132 = v52;
    v125 = _NSConcreteStackBlock;
    v126 = -1073741824;
    v127 = 0;
    v128 = sub_100008048;
    v129 = &unk_100020678;
    v130 = &v136;
    -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:](v50, "enumerateMatchesInString:options:range:usingBlock:", v51, 0, 0, v52, &v125);
    objc_storeStrong(&v134, 0);
    objc_storeStrong(&v135, 0);
  }
  v12 = objc_msgSend((id)v137[5], "stringByReplacingOccurrencesOfString:withString:", CFSTR("׳"), CFSTR("'"));
  v13 = (void *)v137[5];
  v137[5] = (uint64_t)v12;

  if ((objc_msgSend((id)v137[5], "hasSuffix:", CFSTR(",")) & 1) != 0
    && (unint64_t)objc_msgSend((id)v137[5], "length") > 1)
  {
    v14 = objc_msgSend((id)v137[5], "substringToIndex:", (char *)objc_msgSend((id)v137[5], "length") - 1);
    v15 = (void *)v137[5];
    v137[5] = (uint64_t)v14;

  }
  if ((objc_msgSend((id)v137[5], "hasSuffix:", CFSTR(".")) & 1) != 0)
  {
    v124 = 0;
    v124 = (char *)objc_msgSend((id)v137[5], "length");
    if (v124 == (char *)2
      || v124 == (char *)3
      || (unint64_t)v124 > 3 && (unsigned __int16)objc_msgSend((id)v137[5], "characterAtIndex:", v124 - 3) != 46)
    {
      v16 = objc_msgSend((id)v137[5], "substringToIndex:", v124 - 1);
      v17 = (void *)v137[5];
      v137[5] = (uint64_t)v16;

    }
  }
  if ((unint64_t)objc_msgSend((id)v137[5], "length") > 2
    && (unsigned __int16)objc_msgSend((id)v137[5], "characterAtIndex:", 0) == 8220
    && (unsigned __int16)objc_msgSend((id)v137[5], "characterAtIndex:", (char *)objc_msgSend((id)v137[5], "length") - 1) == 8221)
  {
    v48 = (void *)v137[5];
    v49 = (char *)objc_msgSend(v48, "length");
    v158 = 1;
    v157 = v49 - 2;
    v159 = 1;
    v160 = v49 - 2;
    v122 = 1;
    v123 = v49 - 2;
    v18 = objc_msgSend(v48, "substringWithRange:", 1, v49 - 2);
    v19 = (void *)v137[5];
    v137[5] = (uint64_t)v18;

  }
  if ((unint64_t)objc_msgSend((id)v137[5], "length") > 2
    && (objc_msgSend((id)v137[5], "hasSuffix:", CFSTR("'s")) & 1) != 0)
  {
    v20 = objc_msgSend((id)v137[5], "substringToIndex:", (char *)objc_msgSend((id)v137[5], "length") - 2);
    v21 = (void *)v137[5];
    v137[5] = (uint64_t)v20;

  }
  objc_storeStrong(&v143, (id)v137[5]);
  if (objc_msgSend(v143, "length"))
  {
    v156 = (dispatch_once_t *)&unk_100028738;
    v155 = 0;
    objc_storeStrong(&v155, &stru_100020698);
    if (*v156 != -1)
      dispatch_once(v156, v155);
    objc_storeStrong(&v155, 0);
    if (v151)
    {
      v120 = v147;
      v119 = dispatch_group_create();
      v113[0] = 0;
      v113[1] = v113;
      v114 = 838860800;
      v115 = 48;
      v116 = sub_100005C5C;
      v117 = sub_100005CB0;
      v118 = 0;
      v109[0] = 0;
      v109[1] = v109;
      v110 = 0x20000000;
      v111 = 32;
      v112 = 0;
      if (v148 != 2)
      {
        group = v119;
        queue = qword_100028730;
        v102 = _NSConcreteStackBlock;
        v103 = -1073741824;
        v104 = 0;
        v105 = sub_10000817C;
        v106 = &unk_1000206C0;
        v107 = v143;
        v108[2] = v149;
        v108[1] = v113;
        v108[0] = v153;
        dispatch_group_async(group, queue, &v102);
        objc_storeStrong(v108, 0);
        objc_storeStrong(&v107, 0);
      }
      v45 = -[DDLookupQuery bag](v153, "bag");
      v43 = objc_msgSend(v45, "searchRenderTimeout");
      objc_msgSend(v43, "floatValue");
      v44 = v22;

      v101 = v44;
      v23 = v44;
      if (v44 > 0.0)
      {
        when = dispatch_time(0, (uint64_t)(float)(v101 * 1000000.0));
        v42 = dispatch_get_global_queue(17, 0);
        v92 = _NSConcreteStackBlock;
        v93 = -1073741824;
        v94 = 0;
        v95 = sub_10000837C;
        v96 = &unk_100020710;
        v97 = v119;
        v100[1] = v109;
        v100[2] = v113;
        v98 = v153;
        v99 = v143;
        v100[3] = v149;
        v100[0] = v144;
        dispatch_after(when, v42, &v92);

        objc_storeStrong(v100, 0);
        objc_storeStrong(&v99, 0);
        objc_storeStrong((id *)&v98, 0);
        objc_storeStrong(&v97, 0);
      }
      if (v145)
      {
        v38 = v145;
        v39 = v143;
        v40 = v149;
        v37 = -[PARSession configuration](v153->_session, "configuration", v23);
        v36 = objc_msgSend(v37, "identifier");
        v35 = -[PARSession configuration](v153->_session, "configuration");
        v34 = objc_msgSend(v35, "userAgent");
        v83 = _NSConcreteStackBlock;
        v84 = -1073741824;
        v85 = 0;
        v86 = sub_100008778;
        v87 = &unk_100020760;
        v88 = v153;
        v89 = v119;
        v91[1] = v109;
        v91[2] = v113;
        v90 = v143;
        v91[3] = v149;
        v91[0] = v144;
        objc_msgSend(v38, "performClientTextQueryWithTerm:queryId:sessionId:userAgent:reply:", v39, v40, v36, v34, &v83);

        objc_storeStrong(v91, 0);
        objc_storeStrong(&v90, 0);
        objc_storeStrong(&v89, 0);
        objc_storeStrong((id *)&v88, 0);
      }
      else
      {
        v30 = v143;
        v31 = location[0];
        v32 = v120;
        v33 = v148;
        v80 = 0;
        v78 = 0;
        if (v150)
        {
          v29 = v150;
        }
        else
        {
          v81 = +[NSBundle mainBundle](NSBundle, "mainBundle", v23);
          v80 = 1;
          v79 = objc_msgSend(v81, "bundleIdentifier");
          v78 = 1;
          v29 = v79;
        }
        v82 = +[PARRequest lookupRequestWithString:queryContext:domain:lookupSelectionType:appBundleId:queryId:](PARRequest, "lookupRequestWithString:queryContext:domain:lookupSelectionType:appBundleId:queryId:", v30, v31, v32, v33, v29, v149, v23);
        if ((v78 & 1) != 0)

        if ((v80 & 1) != 0)
        v76 = 0;
        if (v146 <= 0.0)
        {
          v77 = +[UIScreen mainScreen](UIScreen, "mainScreen", v146);
          v76 = 1;
          objc_msgSend(v77, "scale");
          v28 = v24;
        }
        else
        {
          v28 = v146;
        }
        objc_msgSend(v82, "setScale:", v28);
        if ((v76 & 1) != 0)

        session = v153->_session;
        v26 = v82;
        v66 = _NSConcreteStackBlock;
        v67 = -1073741824;
        v68 = 0;
        v69 = sub_100008B10;
        v70 = &unk_100020788;
        v71 = v153;
        v72 = v119;
        v74[1] = v109;
        v74[2] = v113;
        v73 = v143;
        v74[3] = v149;
        v74[0] = v144;
        v75 = -[PARSession taskWithRequest:completion:](session, "taskWithRequest:completion:", v26, &v66);
        objc_msgSend(v75, "resume");
        objc_storeStrong(&v75, 0);
        objc_storeStrong(v74, 0);
        objc_storeStrong(&v73, 0);
        objc_storeStrong(&v72, 0);
        objc_storeStrong((id *)&v71, 0);
        objc_storeStrong(&v82, 0);
      }
      _Block_object_dispose(v109, 8);
      _Block_object_dispose(v113, 8);
      objc_storeStrong(&v118, 0);
      objc_storeStrong(&v119, 0);
      objc_storeStrong(&v120, 0);
    }
    else
    {
      v25 = qword_100028730;
      v59 = _NSConcreteStackBlock;
      v60 = -1073741824;
      v61 = 0;
      v62 = sub_100008EE4;
      v63 = &unk_1000207D8;
      v64 = v143;
      v65[1] = v149;
      v65[0] = v144;
      dispatch_async(v25, &v59);
      objc_storeStrong(v65, 0);
      objc_storeStrong(&v64, 0);
    }
    v121 = 0;
  }
  else
  {
    (*((void (**)(id, _QWORD))v144 + 2))(v144, 0);
    v121 = 1;
  }
  _Block_object_dispose(&v136, 8);
  objc_storeStrong(&v142, 0);
  objc_storeStrong(&v143, 0);
  objc_storeStrong(&v144, 0);
  objc_storeStrong(&v145, 0);
  objc_storeStrong(&v147, 0);
  objc_storeStrong(&v150, 0);
  objc_storeStrong(location, 0);
}

+ (id)dictionarySectionForString:(id)a3 queryId:(unint64_t)a4
{
  DDSearchResultDictionarySection *v4;
  id v5;
  id v7;
  id v9;
  unint64_t v10;
  id location[3];
  id v12;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = a4;
  if (objc_msgSend(location[0], "length"))
  {
    v4 = [DDSearchResultDictionarySection alloc];
    v9 = -[DDSearchResultDictionarySection initWithSearchString:queryId:](v4, "initWithSearchString:queryId:", location[0], v10);
    v7 = objc_msgSend(v9, "results");
    if (objc_msgSend(v7, "count"))
      v5 = v9;
    else
      v5 = 0;
    v12 = v5;

    objc_storeStrong(&v9, 0);
  }
  else
  {
    v12 = 0;
  }
  objc_storeStrong(location, 0);
  return v12;
}

+ (id)footerSectionForString:(id)a3 queryId:(unint64_t)a4
{
  DDSearchResultFooterSection *v4;
  id location[3];
  DDSearchResultFooterSection *v8;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (objc_msgSend(location[0], "length"))
  {
    v4 = [DDSearchResultFooterSection alloc];
    v8 = -[DDSearchResultFooterSection initWithQuery:queryId:](v4, "initWithQuery:queryId:", location[0], a4);
  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong(location, 0);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagSem, 0);
  objc_storeStrong((id *)&self->_bagQueue, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
