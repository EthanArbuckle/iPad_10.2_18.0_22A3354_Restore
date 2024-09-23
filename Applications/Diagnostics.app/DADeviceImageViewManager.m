@implementation DADeviceImageViewManager

+ (id)sharedInstance
{
  if (qword_10016E878 != -1)
    dispatch_once(&qword_10016E878, &stru_100133288);
  return (id)qword_10016E870;
}

- (void)deviceImageViewForDeviceState:(id)a3 completion:(id)a4
{
  -[DADeviceImageViewManager downloadAndCreateDeviceImageForDeviceState:completion:](self, "downloadAndCreateDeviceImageForDeviceState:completion:", a3, a4);
}

- (void)downloadAndCreateDeviceImageForDeviceState:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  global_queue = dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue(global_queue);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100013DC4;
  v12[3] = &unk_1001332B0;
  objc_copyWeak(&v15, &location);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)downloadAndSetImageForURL:(id)a3 fallbackUrl:(id)a4 withDeviceState:(id)a5 andCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  DADeviceImageViewManager *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v10 = a3;
  v22 = a4;
  v11 = a5;
  v12 = a6;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_100014380;
  v39 = sub_100014390;
  v40 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceImageViewManager prepareSession](self, "prepareSession"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v10));
  objc_msgSend(v14, "setHTTPMethod:", CFSTR("GET"));
  v15 = objc_claimAutoreleasedReturnValue(-[DADeviceImageViewManager getImageFromCacheWithRequest:](self, "getImageFromCacheWithRequest:", v14));
  v16 = (void *)v36[5];
  v36[5] = v15;

  v17 = v36[5];
  if (v17)
  {
    -[DADeviceImageViewManager setDeviceImage:forDeviceState:withCompletion:](self, "setDeviceImage:forDeviceState:withCompletion:", v17, v11, v12);
  }
  else
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100014398;
    v31[3] = &unk_1001332D8;
    v34 = &v35;
    v31[4] = self;
    v18 = v11;
    v32 = v18;
    v19 = v12;
    v33 = v19;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000143EC;
    v23[3] = &unk_100133300;
    v20 = objc_retainBlock(v31);
    v28 = v20;
    v30 = &v35;
    v24 = v22;
    v25 = self;
    v26 = v18;
    v29 = v19;
    v27 = v13;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dataTaskWithRequest:completionHandler:", v14, v23));
    objc_msgSend(v21, "resume");

  }
  _Block_object_dispose(&v35, 8);

}

- (id)getImageFromCacheWithRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCache sharedURLCache](NSURLCache, "sharedURLCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cachedResponseForRequest:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "data"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v7));

  }
  return v6;
}

- (id)prepareSession
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v2));

  return v3;
}

- (void)setDeviceImage:(id)a3 forDeviceState:(id)a4 withCompletion:(id)a5
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = sub_100014380;
  v12[4] = sub_100014390;
  v13 = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000146F4;
  v9[3] = &unk_100133328;
  v10 = a5;
  v11 = v12;
  v7 = v10;
  v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  _Block_object_dispose(v12, 8);
}

- (id)imageURLForDeviceClass:(id)a3 deviceModel:(id)a4 deviceColor:(id)a5 deviceEnclosureColor:(id)a6 scale:(float)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceImageViewManager getDeviceSizeTokenForCurrentDeviceClass:](self, "getDeviceSizeTokenForCurrentDeviceClass:", v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceImageViewManager getFormattedDeviceColor:deviceEnclosureColor:](self, "getFormattedDeviceColor:deviceEnclosureColor:", v13, v12));

  v18 = objc_msgSend(CFSTR("https://statici.icloud.com/fmipmobile/deviceImages-9.0/"), "mutableCopy");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLPathAllowedCharacterSet](NSCharacterSet, "URLPathAllowedCharacterSet"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAddingPercentEncodingWithAllowedCharacters:", v19));

  objc_msgSend(v18, "appendFormat:", CFSTR("%@/"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLPathAllowedCharacterSet](NSCharacterSet, "URLPathAllowedCharacterSet"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", v21));

  objc_msgSend(v18, "appendFormat:", CFSTR("%@"), v22);
  if (v17)
    objc_msgSend(v18, "appendFormat:", CFSTR("-%@"), v17);
  objc_msgSend(v18, "appendString:", CFSTR("/"));
  if (a7 <= 1.0)
    v23 = &stru_10013CDC8;
  else
    v23 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("__%.0fx"), a7);
  objc_msgSend(v18, "appendFormat:", CFSTR("%@-%@%@.png"), CFSTR("online"), v16, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v18));

  return v24;
}

- (id)getDeviceSizeTokenForCurrentDeviceClass:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v3 = a3;
  v4 = (void *)MGCopyAnswer(CFSTR("iPad"), 0);
  v5 = (void *)MGCopyAnswer(CFSTR("RealityDevice"), 0);
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", v5))
  {
    v6 = CFSTR("nolocation_ipad");
  }
  else
  {
    v6 = CFSTR("nolocation_iphone");
  }

  return (id)v6;
}

- (id)getFormattedDeviceColor:(id)a3 deviceEnclosureColor:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  v8 = v6;
  v9 = 0;
  if (v5 && v6)
  {
    v9 = (void *)objc_opt_new(NSMutableString, v7);
    if (objc_msgSend(v5, "length"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLPathAllowedCharacterSet](NSCharacterSet, "URLPathAllowedCharacterSet"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v10));
      objc_msgSend(v9, "appendFormat:", CFSTR("%@"), v11);

    }
    if (objc_msgSend(v8, "length"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLPathAllowedCharacterSet](NSCharacterSet, "URLPathAllowedCharacterSet"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", v12));
      objc_msgSend(v9, "appendFormat:", CFSTR("-%@"), v13);

    }
    if (objc_msgSend(v8, "intValue"))
      objc_msgSend(v9, "appendFormat:", CFSTR("-%@"), CFSTR("0"));
  }

  return v9;
}

@end
