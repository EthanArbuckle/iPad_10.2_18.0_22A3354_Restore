@implementation MKFCKRoom

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7;
  _BOOL4 v8;
  void *v9;

  v7 = a3;
  v8 = -[MKFCKModel copyPropertiesIntoLocalModel:context:](self, "copyPropertiesIntoLocalModel:context:", v7, a5);
  if (v8)
  {
    -[MKFCKRoom applicationData](self, "applicationData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFApplicationData setAppDataDictionary:forContainer:](_MKFApplicationData, "setAppDataDictionary:forContainer:", v9, v7);

  }
  return v8;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v7 = a3;
  v8 = a5;
  v9 = -[MKFCKModel copyPropertiesFromLocalModel:context:](self, "copyPropertiesFromLocalModel:context:", v7, v8);
  if (self)
    v10 = v9;
  else
    v10 = 0;
  if (v10)
  {
    -[MKFCKRoom homeZone](self, "homeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      -[MKFCKRoom setHomeZone:](self, "setHomeZone:", 0);
    +[_MKFApplicationData appDataDictionaryForContainer:](_MKFApplicationData, "appDataDictionaryForContainer:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKRoom applicationData](self, "applicationData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = HMFEqualObjects();

    if ((v14 & 1) == 0)
      -[MKFCKRoom setApplicationData:](self, "setApplicationData:", v12);

  }
  return v10;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKRoom"));
}

@end
