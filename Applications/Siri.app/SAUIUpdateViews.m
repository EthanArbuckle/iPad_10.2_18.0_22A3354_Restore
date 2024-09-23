@implementation SAUIUpdateViews

- (id)sr_sirilandShim
{
  void *v3;
  id v4;
  void *v5;
  SAUIUpdateViews *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  SAUIUpdateViews *v12;
  __int16 v13;
  SAUIUpdateViews *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIUpdateViews views](self, "views"));
  v4 = sub_10005B3F0(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v3 == v5)
  {
    v6 = self;
  }
  else
  {
    v6 = (SAUIUpdateViews *)-[SAUIUpdateViews copy](self, "copy");
    -[SAUIUpdateViews setViews:](v6, "setViews:", v5);
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = "-[SAUIUpdateViews(Siriland) sr_sirilandShim]";
      v11 = 2112;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Successfully shimmed UpdateViews for the Siriland presentation:\n    UpdateViews: %@\n    Shimmed UpdateViews: %@", (uint8_t *)&v9, 0x20u);
    }
  }

  return v6;
}

@end
