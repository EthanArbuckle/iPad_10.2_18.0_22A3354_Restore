@implementation TVSetupRemoteLauncher

+ (void)launchRemoteWithDeviceIdentifier:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void **v10;
  uint64_t v11;
  Class (*v12)(uint64_t);
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v4 = (void *)qword_10001E810;
  v18 = qword_10001E810;
  if (!qword_10001E810)
  {
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_100004AF8;
    v13 = &unk_1000186E8;
    v14 = &v15;
    sub_100004AF8((uint64_t)&v10);
    v4 = (void *)v16[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v15, 8);
  v6 = objc_msgSend([v5 alloc], "initWithDeviceIdentifier:identifierType:deviceType:launchContext:launchMethod:", v3, 0, 1, 11, 1);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v7 = (void *)qword_10001E820;
  v18 = qword_10001E820;
  if (!qword_10001E820)
  {
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_100004BF8;
    v13 = &unk_1000186E8;
    v14 = &v15;
    sub_100004BF8((uint64_t)&v10);
    v7 = (void *)v16[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v15, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sharedInstance"));
  objc_msgSend(v9, "presentWithContext:", v6);

}

@end
