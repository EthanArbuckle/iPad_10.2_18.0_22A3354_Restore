@implementation _PHMeCardGeocoderPreferences

+ (id)sharedPreferences
{
  if (qword_1002DCAC8 != -1)
    dispatch_once(&qword_1002DCAC8, &stru_100286CC0);
  return (id)qword_1002DCAD0;
}

- (_PHMeCardGeocoderPreferences)init
{
  uint64_t v2;
  _PHMeCardGeocoderPreferences *v3;
  NSBundle *v4;
  void *v5;
  NSDictionary *v6;
  id v7;
  NSObject *v8;
  NSDictionary *v9;
  NSDictionary *defaultValues;
  id v11;
  NSObject *v12;
  NSDictionary *v13;
  uint64_t v14;
  NSDictionary *currentValues;
  objc_super v17;
  uint8_t buf[4];
  NSDictionary *v19;

  v17.receiver = self;
  v17.super_class = (Class)_PHMeCardGeocoderPreferences;
  v3 = -[_PHMeCardGeocoderPreferences init](&v17, "init");
  if (v3)
  {
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(_PHMeCardGeocoderPreferences, v2));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathForResource:ofType:", CFSTR("PHMeCardGeocoderPreferenceDefaults"), CFSTR("plist")));

    if (v6)
    {
      v7 = sub_1000C5588();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Loading default PHMeCardGeocoder preferences from file: %@", buf, 0xCu);
      }

      v9 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", v6);
      defaultValues = v3->_defaultValues;
      v3->_defaultValues = v9;

      v11 = sub_1000C5588();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v3->_defaultValues;
        *(_DWORD *)buf = 138412290;
        v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Default values = %@", buf, 0xCu);
      }

    }
    v14 = objc_claimAutoreleasedReturnValue(-[_PHMeCardGeocoderPreferences _constructCurrentValues](v3, "_constructCurrentValues"));
    currentValues = v3->_currentValues;
    v3->_currentValues = (NSDictionary *)v14;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_PHMeCardGeocoderPreferences;
  -[_PHMeCardGeocoderPreferences dealloc](&v4, "dealloc");
}

- (id)_constructCurrentValues
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = sub_10000D540(CFSTR("PeriodLength"), CFSTR("com.apple.mobilephone.PHMeCardGeocoder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
    objc_msgSend(v2, "setValue:forKey:", v4, CFSTR("PeriodLength"));
  v5 = sub_10000D540(CFSTR("ActiveUsagePeriodLength"), CFSTR("com.apple.mobilephone.PHMeCardGeocoder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
    objc_msgSend(v2, "setValue:forKey:", v6, CFSTR("ActiveUsagePeriodLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v2));

  return v7;
}

- (double)_bestTimeIntervalForKey:(id)a3
{
  id v4;
  void *v5;
  double v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKey:](self->_currentValues, "valueForKey:", v4));
  if (v5
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKey:](self->_defaultValues, "valueForKey:", v4))) != 0)
  {
    v6 = (double)(int)objc_msgSend(v5, "intValue");

  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (double)periodLength
{
  double result;

  -[_PHMeCardGeocoderPreferences _bestTimeIntervalForKey:](self, "_bestTimeIntervalForKey:", CFSTR("PeriodLength"));
  return result;
}

- (double)activeUsagePeriodLength
{
  double result;

  -[_PHMeCardGeocoderPreferences _bestTimeIntervalForKey:](self, "_bestTimeIntervalForKey:", CFSTR("ActiveUsagePeriodLength"));
  return result;
}

- (BOOL)hasValidNetworkPreferences
{
  return -[NSDictionary count](self->_currentValues, "count") > 1;
}

- (BOOL)isActivelyUsing
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v2 = sub_10000D540(CFSTR("PHMeCardGeocoder.IsActivelyUsing"), TUBundleIdentifierMobilePhoneApplication);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v5 = objc_opt_class(NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = objc_msgSend(v3, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

- (void)setActivelyUsing:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;

  v3 = a3;
  if (-[_PHMeCardGeocoderPreferences isActivelyUsing](self, "isActivelyUsing") != a3)
  {
    v4 = (void *)TUBundleIdentifierMobilePhoneApplication;
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("NO");
      if (v3)
        v7 = CFSTR("YES");
      v9 = 138412290;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting geocoder actively used value to %@", (uint8_t *)&v9, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    sub_10000D5F8(CFSTR("PHMeCardGeocoder.IsActivelyUsing"), v8, v4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentValues, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);
}

@end
