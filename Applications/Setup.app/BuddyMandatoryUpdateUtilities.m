@implementation BuddyMandatoryUpdateUtilities

+ (BOOL)hasInformation
{
  return objc_msgSend((id)objc_opt_class(a1), "_mandatoryUpdateInformationFromActivation", a2, a1) != 0;
}

+ (BOOL)isUpdateRequired
{
  unsigned __int8 v3;

  v3 = objc_msgSend((id)objc_opt_class(a1), "_mandatoryUpdateInformationFromActivation", 0, a2);
  if ((objc_msgSend((id)objc_opt_class(a1), "deviceIsFromFactory") & 1) != 0)
    return (v3 & 1) != 0;
  else
    return (v3 & 4) != 0;
}

+ (BOOL)isUpdateAllowedOnCellular:(id)a3
{
  unsigned __int8 v3;
  char v4;
  char v6;
  NSUserDefaults *v7;
  id v8;
  id location[3];
  char v10;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = objc_msgSend(sub_1000763A8(), "userDownloadPolicyForDescriptor:existingPolicy:", location[0], 0);
  v3 = objc_msgSend(v8, "isDownloadAllowableForCellular");
  v6 = 0;
  v4 = 0;
  if ((v3 & 1) != 0)
  {
    v7 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    v6 = 1;
    v4 = !-[NSUserDefaults BOOLForKey:](v7, "BOOLForKey:", CFSTR("MandatoryUpdateRequiresWiFi"));
  }
  v10 = v4 & 1;
  if ((v6 & 1) != 0)

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10 & 1;
}

+ (BOOL)deviceIsFromFactory
{
  return +[BYWarranty shouldDisplay](BYWarranty, "shouldDisplay", a2, a1) & 1;
}

+ (id)humanReadableCurrentOSVersion
{
  uint64_t v2;
  id v3;
  id v5;
  id location[2];
  id v7;

  v7 = a1;
  location[1] = (id)a2;
  location[0] = (id)MGCopyAnswer(CFSTR("ProductVersion"), 0);
  v2 = MGCopyAnswer(CFSTR("BuildVersion"), 0);
  v3 = objc_msgSend(v7, "_humanReadableOSVersionWithProductVersion:buildVersion:", location[0], v2, v2);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v3;
}

+ (id)humanReadableOSVersionFromScanOptions:(id)a3
{
  id v3;
  id v5;
  id v6;
  id location[2];
  id v8;

  v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = objc_msgSend(location[0], "requestedPMV");
  v5 = objc_msgSend(location[0], "requestedBuild");
  v3 = objc_msgSend(v8, "_humanReadableOSVersionWithProductVersion:buildVersion:", v6, v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v3;
}

+ (id)_humanReadableOSVersionWithProductVersion:(id)a3 buildVersion:(id)a4
{
  NSBundle *v5;
  NSBundle *v6;
  NSString *v7;
  __int128 v9;
  SEL v10;
  id v11;
  NSString *v12;

  v11 = a1;
  v10 = a2;
  *((_QWORD *)&v9 + 1) = 0;
  objc_storeStrong((id *)&v9 + 1, a3);
  *(_QWORD *)&v9 = 0;
  objc_storeStrong((id *)&v9, a4);
  if (v9 == 0)
  {
    v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v12 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("UNKNOWN"), &stru_100284738, CFSTR("Localizable"));

  }
  else if ((_QWORD)v9)
  {
    if (*((_QWORD *)&v9 + 1))
    {
      v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateUtilities));
      v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_INFO_HUMAN_READABLE_VERSION"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
      v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, *((_QWORD *)&v9 + 1), (_QWORD)v9);

    }
    else
    {
      v12 = (NSString *)(id)v9;
    }
  }
  else
  {
    v12 = (NSString *)*((id *)&v9 + 1);
  }
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong((id *)&v9 + 1, 0);
  return v12;
}

+ (void)removeInformation
{
  NSObject *v2;
  os_log_type_t v3;
  id location;
  uint8_t buf[7];
  os_log_type_t v6;
  os_log_t oslog[3];

  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(a1);
  v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v6;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Remove mandatory update information on device...", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  location = objc_msgSend(objc_alloc((Class)sub_100076880()), "initWithDelegate:clientType:", 0, 1);
  objc_msgSend(location, "setMandatorySoftwareUpdateDictionary:", 0);
  objc_storeStrong(&location, 0);
}

+ (unint64_t)_mandatoryUpdateInformationFromActivation
{
  id v2;
  NSObject *v3;
  id v4;
  unint64_t v5;
  void **v7;
  int v8;
  int v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12[2];
  uint64_t v13;
  uint64_t *v14;
  int v15;
  int v16;
  uint64_t v17;
  id location;
  id v19[3];

  v19[2] = a1;
  v19[1] = (id)a2;
  v2 = objc_alloc((Class)sub_100076880());
  v3 = dispatch_get_global_queue(0, 0);
  v19[0] = objc_msgSend(v2, "initWithDelegate:queue:clientType:", 0, v3, 1);

  location = dispatch_semaphore_create(0);
  v13 = 0;
  v14 = &v13;
  v15 = 0x20000000;
  v16 = 32;
  v17 = 0;
  v4 = v19[0];
  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_100076AC4;
  v11 = &unk_100281718;
  v12[1] = &v13;
  v12[0] = location;
  objc_msgSend(v4, "getMandatorySoftwareUpdateDictionary:", &v7);
  dispatch_semaphore_wait((dispatch_semaphore_t)location, 0xFFFFFFFFFFFFFFFFLL);
  v5 = v14[3];
  objc_storeStrong(v12, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v19, 0);
  return v5;
}

@end
