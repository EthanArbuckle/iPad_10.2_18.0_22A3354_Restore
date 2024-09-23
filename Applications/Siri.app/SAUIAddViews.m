@implementation SAUIAddViews

- (id)sr_sirilandShim
{
  void *v3;
  id v4;
  void *v5;
  SAUIAddViews *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  SAUIAddViews *v12;
  __int16 v13;
  SAUIAddViews *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIAddViews views](self, "views"));
  v4 = sub_10005B3F0(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v3 == v5)
  {
    v6 = self;
  }
  else
  {
    v6 = (SAUIAddViews *)-[SAUIAddViews copy](self, "copy");
    -[SAUIAddViews setViews:](v6, "setViews:", v5);
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = "-[SAUIAddViews(Siriland) sr_sirilandShim]";
      v11 = 2112;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Successfully shimmed AddViews for the Siriland presentation:\n    AddViews: %@\n    Shimmed AddViews: %@", (uint8_t *)&v9, 0x20u);
    }
  }

  return v6;
}

@end
