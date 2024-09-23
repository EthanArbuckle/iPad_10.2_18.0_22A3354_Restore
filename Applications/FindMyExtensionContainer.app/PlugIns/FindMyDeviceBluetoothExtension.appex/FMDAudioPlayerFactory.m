@implementation FMDAudioPlayerFactory

+ (id)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  objc_class *v11;
  id v12;
  id *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;

  v5 = a3;
  v6 = +[FMDAVRouteControllerFactory isAutomationActive](FMDAVRouteControllerFactory, "isAutomationActive");
  v7 = sub_100007584();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDAutomationAVAudioPlayer: switching to automation", buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAutomationHelperFactory sharedFactory](FMDAutomationHelperFactory, "sharedFactory"));
    v11 = (objc_class *)objc_msgSend(v10, "automationHelperClassWithName:", CFSTR("FMDAutomationAVAudioPlayer"));

    v12 = [v11 alloc];
    v20 = 0;
    v13 = (id *)&v20;
    v14 = objc_msgSend(v12, "initWithError:", &v20);
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AVAudioPlayer: initWithContentsOfURL: %@", buf, 0xCu);
    }

    v19 = 0;
    v13 = (id *)&v19;
    v14 = objc_msgSend(objc_alloc((Class)AVAudioPlayer), "initWithContentsOfURL:error:", v5, &v19);
  }
  v15 = v14;
  v16 = *v13;
  v17 = v16;
  if (a4)
    *a4 = objc_retainAutorelease(v16);

  return v15;
}

@end
