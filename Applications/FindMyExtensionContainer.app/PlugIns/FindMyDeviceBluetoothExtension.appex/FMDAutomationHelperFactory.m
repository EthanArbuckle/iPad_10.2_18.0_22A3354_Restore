@implementation FMDAutomationHelperFactory

+ (id)sharedFactory
{
  if (qword_10002D6C0 != -1)
    dispatch_once(&qword_10002D6C0, &stru_100021068);
  return (id)qword_10002D6B8;
}

- (Class)automationHelperClassWithName:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  int v17;
  id v18;

  v4 = a3;
  v5 = sub_100007584();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Loading automation class %@", (uint8_t *)&v17, 0xCu);
  }

  if (!-[FMDAutomationHelperFactory hasAttemptedLoad](self, "hasAttemptedLoad"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/AppleInternal/Library/Bundles/FindMyDevice")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathForResource:ofType:", CFSTR("FMDAutomationClasses"), CFSTR("bundle")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v8));
    -[FMDAutomationHelperFactory setAutomationHelperBundle:](self, "setAutomationHelperBundle:", v9);

    -[FMDAutomationHelperFactory setHasAttemptedLoad:](self, "setHasAttemptedLoad:", 1);
  }
  if (-[FMDAutomationHelperFactory hasAttemptedLoad](self, "hasAttemptedLoad")
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAutomationHelperFactory automationHelperBundle](self, "automationHelperBundle")),
        v10,
        !v10))
  {
    v15 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAutomationHelperFactory automationHelperBundle](self, "automationHelperBundle"));
    v12 = objc_msgSend(v11, "classNamed:", v4);

    if (!v12)
    {
      v13 = sub_100007584();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_100012694((uint64_t)v4, v14);

    }
    v15 = v12;
  }

  return (Class)v15;
}

- (BOOL)hasAttemptedLoad
{
  return self->_hasAttemptedLoad;
}

- (void)setHasAttemptedLoad:(BOOL)a3
{
  self->_hasAttemptedLoad = a3;
}

- (NSBundle)automationHelperBundle
{
  return self->_automationHelperBundle;
}

- (void)setAutomationHelperBundle:(id)a3
{
  objc_storeStrong((id *)&self->_automationHelperBundle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automationHelperBundle, 0);
}

@end
