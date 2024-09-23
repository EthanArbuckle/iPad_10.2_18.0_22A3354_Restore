@implementation _DKSourceMOConverter

+ (id)insertSource:(id)a3 inManagedObjectContext:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = (void *)MEMORY[0x1E0C97B20];
  v6 = a4;
  v7 = a3;
  +[_DKSource entityName](_DKSource, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertNewObjectForEntityForName:inManagedObjectContext:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sourceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSourceID:", v10);

  objc_msgSend(v7, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBundleID:", v11);

  objc_msgSend(v7, "itemID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItemID:", v12);

  objc_msgSend(v7, "groupID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGroupID:", v13);

  objc_msgSend(v7, "deviceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDeviceID:", v14);

  objc_msgSend(v7, "userID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserID:", v15);

  objc_msgSend(v7, "intentID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setIntentID:", v16);
  return v9;
}

+ (id)sourceFromManagedObject:(id)a3
{
  id v3;
  _DKSource *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _DKSource *v12;

  v3 = a3;
  v4 = [_DKSource alloc];
  objc_msgSend(v3, "sourceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intentID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[_DKSource initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:intentIdentifier:](v4, "initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:intentIdentifier:", v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

@end
