@implementation ANAnnouncement(Accessory)

- (uint64_t)isAnnouncerInSameRoomAsAccessory:()Accessory
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v4 = a3;
  objc_msgSend(a1, "announcer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAccessory");

  if (v6)
  {
    +[ANHomeManager shared](ANHomeManager, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeForID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(a1, "announcer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "homeKitID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithUUIDString:", v13);

    objc_msgSend(v10, "accessoryWithUniqueIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "room");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "uniqueIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "room");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "uniqueIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "isEqual:", v20);

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end
