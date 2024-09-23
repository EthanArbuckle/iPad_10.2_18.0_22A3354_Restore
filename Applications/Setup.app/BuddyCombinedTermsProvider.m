@implementation BuddyCombinedTermsProvider

- (BuddyCombinedTermsProvider)init
{
  dispatch_queue_t v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;
  BuddyCombinedTermsProvider *v6;
  objc_super v8;
  SEL v9;
  id location;

  v9 = a2;
  location = 0;
  v8.receiver = self;
  v8.super_class = (Class)BuddyCombinedTermsProvider;
  location = -[BuddyCombinedTermsProvider init](&v8, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = dispatch_queue_create("Combined Terms Queue", 0);
    v3 = (void *)*((_QWORD *)location + 2);
    *((_QWORD *)location + 2) = v2;

    v4 = dispatch_queue_create("Combined Terms Request Queue", 0);
    v5 = (void *)*((_QWORD *)location + 3);
    *((_QWORD *)location + 3) = v4;

  }
  v6 = (BuddyCombinedTermsProvider *)location;
  objc_storeStrong(&location, 0);
  return v6;
}

- (void)prefetchTerms
{
  -[BuddyCombinedTermsProvider fetchTerms:](self, "fetchTerms:", 0, a2, self);
}

- (void)fetchTerms:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  BuddyCombinedTermsProvider *v9;
  id v10;
  id location[2];
  BuddyCombinedTermsProvider *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyCombinedTermsProvider termsRequestQueue](v12, "termsRequestQueue");
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100078788;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)fetchTermsFromServer:(id)a3
{
  NSArray *v3;
  id v4;
  id v5;
  NSString *v6;
  NSDictionary *v7;
  void **v8;
  int v9;
  int v10;
  void (*v11)(_QWORD *, void *, void *, void *);
  void *v12;
  id v13;
  id v14;
  os_log_type_t v15;
  os_log_t oslog;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id location[3];
  id v25;
  const __CFString *v26;
  NSString *v27;
  uint8_t buf[16];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = (id)MGCopyAnswer(CFSTR("BuildVersion"), 0);
  v23 = v25;
  if (!objc_msgSend(v23, "length"))
    objc_storeStrong(&v23, CFSTR("1A001a"));
  v22 = &off_100290BE8;
  v21 = &off_100290C10;
  v20 = &off_100290C38;
  v19 = 0;
  if ((+[BYWarranty shouldDisplay](BYWarranty, "shouldDisplay") & 1) != 0)
  {
    v32[0] = v22;
    v32[1] = v20;
    v32[2] = v21;
    v3 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 3);
  }
  else
  {
    v31[0] = v22;
    v31[1] = v20;
    v3 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2);
  }
  v4 = v19;
  v19 = v3;

  v29[0] = CFSTR("terms");
  v30[0] = v19;
  v29[1] = CFSTR("format");
  v30[1] = kAAProtocolGenericTermsUIBuddyMLKey;
  v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v17 = +[BYLicenseAgreement versionOfAcceptedAgreement](BYLicenseAgreement, "versionOfAcceptedAgreement");
  oslog = (os_log_t)(id)_BYLoggingFacility(v17);
  v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000342B4((uint64_t)buf, (uint64_t)v17);
    _os_log_impl((void *)&_mh_execute_header, oslog, v15, "Loading generic terms, accepted version = %llu", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v5 = objc_alloc((Class)AAGenericTermsUIRequest);
  v14 = objc_msgSend(v5, "initWithParameters:", v18);
  v26 = CFSTR("X-Apple-iOS-SLA-Version");
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), v17);
  v27 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  objc_msgSend(v14, "setCustomHeaders:", v7);

  v8 = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_10007912C;
  v12 = &unk_100281820;
  v13 = location[0];
  objc_msgSend(v14, "performRequestWithHandler:", &v8);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (NSData)cachedTermsData
{
  return self->_cachedTermsData;
}

- (void)setCachedTermsData:(id)a3
{
  objc_storeStrong((id *)&self->_cachedTermsData, a3);
}

- (OS_dispatch_queue)termsQueue
{
  return self->_termsQueue;
}

- (void)setTermsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_termsQueue, a3);
}

- (OS_dispatch_queue)termsRequestQueue
{
  return self->_termsRequestQueue;
}

- (void)setTermsRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_termsRequestQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsRequestQueue, 0);
  objc_storeStrong((id *)&self->_termsQueue, 0);
  objc_storeStrong((id *)&self->_cachedTermsData, 0);
}

@end
