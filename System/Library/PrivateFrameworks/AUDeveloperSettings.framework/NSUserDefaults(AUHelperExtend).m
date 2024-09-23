@implementation NSUserDefaults(AUHelperExtend)

+ (void)AUDeveloperSettingsSetObject:()AUHelperExtend withKey:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  if (getuid() == 278)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCF50]);
    MapPreferenceSuiteToString(1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v7, "initWithSuiteName:", v8);

    objc_msgSend(v10, "setObject:forKey:", v6, v5);
  }
  else
  {
    +[AUHelperInstance sharedInstance](AUHelperInstance, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "userPreferenceSetObject:forSuite:withKey:", v6, 1, v5);
  }

}

+ (id)AUDeveloperSettingsObjectWithKey:()AUHelperExtend
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  if (getuid() == 278)
  {
    v4 = objc_alloc(MEMORY[0x24BDBCF50]);
    MapPreferenceSuiteToString(1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithSuiteName:", v5);

    objc_msgSend(v6, "objectForKey:", v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AUHelperInstance sharedInstance](AUHelperInstance, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    v16 = 0;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __67__NSUserDefaults_AUHelperExtend__AUDeveloperSettingsObjectWithKey___block_invoke;
    v10[3] = &unk_24DFEFA30;
    v10[4] = &v11;
    objc_msgSend(v6, "userPreferenceObjectForSuite:withKey:withReply:", 1, v3, v10);
    v7 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  return v7;
}

@end
