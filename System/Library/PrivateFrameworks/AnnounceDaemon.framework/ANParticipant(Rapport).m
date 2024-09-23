@implementation ANParticipant(Rapport)

- (id)initWithDevice:()Rapport
{
  id v4;
  id v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&off_1EFC8D418;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "populateWithDevice:", v4);

  return v6;
}

- (void)populateWithDevice:()Rapport
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "setIsAccessory:", objc_msgSend(v4, "isAccessory"));
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setRapportID:", v5);

  objc_msgSend(v4, "idsDeviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setIdsID:", v6);

  objc_msgSend(v4, "homeKitIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setHomeKitID:", v8);

  objc_msgSend(v4, "name");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setName:", v9);
}

@end
