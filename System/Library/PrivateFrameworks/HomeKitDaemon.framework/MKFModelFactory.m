@implementation MKFModelFactory

+ (id)createServiceGroupModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFServiceGroup entity](_MKFServiceGroup, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (void)initialize
{
  id v2;

  v2 = +[HMDCoreData managedObjectModel](HMDCoreData, "managedObjectModel");
}

+ (id)createAccountModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFAccount entity](_MKFAccount, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createCharacteristicWriteActionModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFCharacteristicWriteAction entity](_MKFCharacteristicWriteAction, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createDurationEventModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFDurationEvent entity](_MKFDurationEvent, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createPhotosPersonModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFPhotosPerson entity](_MKFPhotosPerson, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createHomePersonManagerSettingModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFHomePersonManagerSetting entity](_MKFHomePersonManagerSetting, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createHomeManagerHomeModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFHomeManagerHome entity](_MKFHomeManagerHome, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createMediaPlaybackActionModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFMediaPlaybackAction entity](_MKFMediaPlaybackAction, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createSignificantTimeEventModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFSignificantTimeEvent entity](_MKFSignificantTimeEvent, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createTimePeriodBulletinConditionModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFTimePeriodBulletinCondition entity](_MKFTimePeriodBulletinCondition, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createPresenceBulletinConditionModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFPresenceBulletinCondition entity](_MKFPresenceBulletinCondition, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createIncomingInvitationModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFIncomingInvitation entity](_MKFIncomingInvitation, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createTimeOfDayTimeSpecificationModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFTimeOfDayTimeSpecification entity](_MKFTimeOfDayTimeSpecification, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createCalendarEventModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFCalendarEvent entity](_MKFCalendarEvent, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createHomeModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFHome entity](_MKFHome, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createLocationEventModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFLocationEvent entity](_MKFLocationEvent, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createHomeThreadNetworkModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFHomeThreadNetwork entity](_MKFHomeThreadNetwork, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createIntegerCharacteristicModelWithInstanceID:(id)a3 service:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (objc_class *)MEMORY[0x24BDBB698];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  +[_MKFIntegerCharacteristic entity](_MKFIntegerCharacteristic, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithEntity:insertIntoManagedObjectContext:", v9, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "setValue:forKey:", v7, CFSTR("instanceID"));
  objc_msgSend(v12, "setValue:forKey:", v6, CFSTR("service"));

  return v12;
}

+ (id)createUserModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFUser entity](_MKFUser, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createDeviceModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFDevice entity](_MKFDevice, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createAppleMediaAccessoryPowerActionModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFAppleMediaAccessoryPowerAction entity](_MKFAppleMediaAccessoryPowerAction, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createHomeNetworkRouterManagingDeviceSettingModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFHomeNetworkRouterManagingDeviceSetting entity](_MKFHomeNetworkRouterManagingDeviceSetting, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createAirPlayAccessoryModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFAirPlayAccessory entity](_MKFAirPlayAccessory, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createPresenceEventModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFPresenceEvent entity](_MKFPresenceEvent, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createGuestAccessCodeModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFGuestAccessCode entity](_MKFGuestAccessCode, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createRoomModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFRoom entity](_MKFRoom, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createServiceModelWithInstanceID:(id)a3 accessory:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v5 = (objc_class *)MEMORY[0x24BDBB698];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  +[_MKFService entity](_MKFService, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithEntity:insertIntoManagedObjectContext:", v9, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "setValue:forKey:", v7, CFSTR("instanceID"));
  objc_msgSend(v12, "setValue:forKey:", v6, CFSTR("accessory"));
  objc_msgSend((id)objc_opt_class(), "modelIDForKeyAttribute:parent:", v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setValue:forKey:", v13, CFSTR("modelID"));
  return v12;
}

+ (id)createHAPMetadataModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFHAPMetadata entity](_MKFHAPMetadata, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createHomeNetworkRouterSettingModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFHomeNetworkRouterSetting entity](_MKFHomeNetworkRouterSetting, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createCameraAccessModeBulletinRegistrationModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFCameraAccessModeBulletinRegistration entity](_MKFCameraAccessModeBulletinRegistration, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createCameraSignificantEventBulletinRegistrationModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFCameraSignificantEventBulletinRegistration entity](_MKFCameraSignificantEventBulletinRegistration, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createResidentSelectionModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFResidentSelection entity](_MKFResidentSelection, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createCharacteristicValueEventModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFCharacteristicValueEvent entity](_MKFCharacteristicValueEvent, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createResidentModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFResident entity](_MKFResident, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createAppleMediaAccessoryModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFAppleMediaAccessory entity](_MKFAppleMediaAccessory, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createUserAccessCodeModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFUserAccessCode entity](_MKFUserAccessCode, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createHomeManagerModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFHomeManager entity](_MKFHomeManager, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createCharacteristicModelWithInstanceID:(id)a3 service:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (objc_class *)MEMORY[0x24BDBB698];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  +[_MKFCharacteristic entity](_MKFCharacteristic, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithEntity:insertIntoManagedObjectContext:", v9, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "setValue:forKey:", v7, CFSTR("instanceID"));
  objc_msgSend(v12, "setValue:forKey:", v6, CFSTR("service"));

  return v12;
}

+ (id)createUserActivityStatusModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFUserActivityStatus entity](_MKFUserActivityStatus, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createBulletinRegistrationModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFBulletinRegistration entity](_MKFBulletinRegistration, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createTimerTriggerModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFTimerTrigger entity](_MKFTimerTrigger, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createCameraReachabilityBulletinRegistrationModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFCameraReachabilityBulletinRegistration entity](_MKFCameraReachabilityBulletinRegistration, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createShortcutActionModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFShortcutAction entity](_MKFShortcutAction, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createSoftwareUpdateModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFSoftwareUpdate entity](_MKFSoftwareUpdate, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createGuestModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFGuest entity](_MKFGuest, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createHomePersonModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFHomePerson entity](_MKFHomePerson, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createStringCharacteristicModelWithInstanceID:(id)a3 service:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (objc_class *)MEMORY[0x24BDBB698];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  +[_MKFStringCharacteristic entity](_MKFStringCharacteristic, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithEntity:insertIntoManagedObjectContext:", v9, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "setValue:forKey:", v7, CFSTR("instanceID"));
  objc_msgSend(v12, "setValue:forKey:", v6, CFSTR("service"));

  return v12;
}

+ (id)createMatterLocalKeyValuePairModelWithKey:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFMatterLocalKeyValuePair entity](_MKFMatterLocalKeyValuePair, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("key"));
  return v9;
}

+ (id)createHAPAccessoryModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFHAPAccessory entity](_MKFHAPAccessory, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createOutgoingInvitationModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFOutgoingInvitation entity](_MKFOutgoingInvitation, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createAccountHandleModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFAccountHandle entity](_MKFAccountHandle, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createZoneModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFZone entity](_MKFZone, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createAnalysisEventBulletinRegistrationModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFAnalysisEventBulletinRegistration entity](_MKFAnalysisEventBulletinRegistration, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createAccessoryNetworkProtectionGroupModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFAccessoryNetworkProtectionGroup entity](_MKFAccessoryNetworkProtectionGroup, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createNotificationRegistrationMediaPropertyModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFNotificationRegistrationMediaProperty entity](_MKFNotificationRegistrationMediaProperty, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createYearDayScheduleRuleModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFYearDayScheduleRule entity](_MKFYearDayScheduleRule, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createActionSetModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFActionSet entity](_MKFActionSet, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createApplicationDataModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFApplicationData entity](_MKFApplicationData, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createSunriseSunsetTimeSpecificationModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFSunriseSunsetTimeSpecification entity](_MKFSunriseSunsetTimeSpecification, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createHomeMediaSettingModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFHomeMediaSetting entity](_MKFHomeMediaSetting, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createNaturalLightingActionModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFNaturalLightingAction entity](_MKFNaturalLightingAction, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createEventTriggerModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFEventTrigger entity](_MKFEventTrigger, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createCharacteristicBulletinRegistrationModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFCharacteristicBulletinRegistration entity](_MKFCharacteristicBulletinRegistration, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createFloatCharacteristicModelWithInstanceID:(id)a3 service:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (objc_class *)MEMORY[0x24BDBB698];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  +[_MKFFloatCharacteristic entity](_MKFFloatCharacteristic, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithEntity:insertIntoManagedObjectContext:", v9, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "setValue:forKey:", v7, CFSTR("instanceID"));
  objc_msgSend(v12, "setValue:forKey:", v6, CFSTR("service"));

  return v12;
}

+ (id)createRemovedUserAccessCodeModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFRemovedUserAccessCode entity](_MKFRemovedUserAccessCode, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createHomeSoftwareUpdateSettingModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFHomeSoftwareUpdateSetting entity](_MKFHomeSoftwareUpdateSetting, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createNotificationRegistrationActionSetModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFNotificationRegistrationActionSet entity](_MKFNotificationRegistrationActionSet, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createCharacteristicRangeEventModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFCharacteristicRangeEvent entity](_MKFCharacteristicRangeEvent, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createWeekDayScheduleRuleModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFWeekDayScheduleRule entity](_MKFWeekDayScheduleRule, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

+ (id)createNotificationRegistrationCharacteristicModelWithModelID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBB698];
  v4 = a3;
  v5 = [v3 alloc];
  +[_MKFNotificationRegistrationCharacteristic entity](_MKFNotificationRegistrationCharacteristic, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:insertIntoManagedObjectContext:", v6, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("modelID"));
  return v9;
}

@end
