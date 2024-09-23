@implementation BuddyLocalizationUtilities

+ (id)modelSpecificLocalizedStringKeyForKey:(id)a3 deviceClass:(id)a4
{
  id v5;
  id v6;
  NSString *v7;
  id v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v5 = location[0];
  v6 = objc_msgSend(v9, "uppercaseString");
  v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%@_%@"), v5, v6);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (id)siblingDeviceSpecificLocalizedStringKeyForKey:(id)a3 deviceClass:(id)a4
{
  id v6;
  id v7;
  id v8;
  id location[2];
  id v10;
  id v11;

  v10 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v7 = (id)MGCopyAnswer(CFSTR("DeviceClass"), 0);
  if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) == 0 && objc_msgSend(v8, "length"))
  {
    v11 = objc_msgSend(v10, "modelSpecificLocalizedStringKeyForKey:deviceClass:", location[0], v8);
  }
  else
  {
    v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%@_OTHER"), location[0]);
    v11 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", v6);
    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v11;
}

+ (id)siblingPairDeviceSpecificLocalizedStringKeyForKey:(id)a3 deviceClass:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  id v11;
  id location[3];
  NSString *v13;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = (id)MGCopyAnswer(CFSTR("DeviceClass"), 0);
  if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) == 0 && objc_msgSend(v11, "length"))
  {
    v5 = location[0];
    v6 = objc_msgSend(v10, "uppercaseString");
    v7 = objc_msgSend(v11, "uppercaseString");
    v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%@_%@_%@"), v5, v6, v7);

  }
  else
  {
    v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%@_OTHER"), location[0]);
    v13 = (NSString *)+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", v9);
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v13;
}

+ (id)dispositionSpecificLocalizedStringKeyForKey:(id)a3 disposition:(unint64_t)a4
{
  id v5;
  char v6;
  id v7;
  NSString *v8;
  id v10;
  id v11;
  os_log_type_t v12;
  os_log_t oslog;
  char v14;
  id v15;
  unint64_t v16;
  id location[3];
  uint8_t buf[24];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = a4;
  v5 = (id)BYStringForFlowItemDispositions(a4);
  v15 = v5;
  v14 = 0;
  v6 = 0;
  if (a4)
  {
    v6 = 0;
    if ((v16 & 0x1C) == v16)
    {
      v5 = objc_msgSend(v15, "containsString:", CFSTR(","));
      v6 = v5 ^ 1;
    }
  }
  v14 = v6 & 1;
  if ((v6 & 1) == 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    v12 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v11 = (id)BYStringForFlowItemDispositions(v16);
      sub_100038C28((uint64_t)buf, (uint64_t)v11);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v12, "Disposition specific localized string key not supported for '%@'", buf, 0xCu);

      objc_storeStrong(&v11, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v7 = objc_msgSend(v15, "uppercaseString");
  v10 = objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));

  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), location[0], v10);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v8;
}

@end
