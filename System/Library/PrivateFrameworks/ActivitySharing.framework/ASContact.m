@implementation ASContact

- (id)codableContactIncludingCloudKitFields:(BOOL)a3
{
  _BOOL8 v3;
  ASCodableContact *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = a3;
  v5 = objc_alloc_init(ASCodableContact);
  -[ASContact linkedContactStoreIdentifier](self, "linkedContactStoreIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableContact setLinkedContactStoreIdentifier:](v5, "setLinkedContactStoreIdentifier:", v6);

  -[ASContact fullName](self, "fullName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableContact setFullName:](v5, "setFullName:", v7);

  -[ASContact shortName](self, "shortName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableContact setShortName:](v5, "setShortName:", v8);

  -[ASContact destinations](self, "destinations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  -[ASCodableContact setDestinations:](v5, "setDestinations:", v11);

  if (ASSecureCloudEnabled())
  {
    -[ASContact pendingRelationshipShareItem](self, "pendingRelationshipShareItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDD1618];
      -[ASContact pendingRelationshipShareItem](self, "pendingRelationshipShareItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCodableContact setPendingRelationshipShareItem:](v5, "setPendingRelationshipShareItem:", v15);

    }
    -[ASContact pendingLegacyShareLocations](self, "pendingLegacyShareLocations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[ASContact pendingLegacyShareLocations](self, "pendingLegacyShareLocations");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCodableContact setPendingLegacyShareLocations:](v5, "setPendingLegacyShareLocations:", v18);

    }
  }
  -[ASContact relationshipStorage](self, "relationshipStorage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "codableRelationshipStorageIncludingCloudKitFields:", v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableContact setRelationshipStorage:](v5, "setRelationshipStorage:", v20);

  -[ASContact relationshipStorage](self, "relationshipStorage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "legacyRelationship");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "codableRelationshipContainerIncludingCloudKitFields:", v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableContact setRelationshipContainer:](v5, "setRelationshipContainer:", v23);

  -[ASContact relationshipStorage](self, "relationshipStorage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "legacyRemoteRelationship");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "codableRelationshipContainerIncludingCloudKitFields:", v3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableContact setRemoteRelationshipContainer:](v5, "setRemoteRelationshipContainer:", v26);

  return v5;
}

+ (id)contactWithCodableContact:(id)a3
{
  id v3;
  ASContact *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  ASCodableShareLocations *v14;
  void *v15;
  ASCodableShareLocations *v16;
  void *v17;
  void *v18;
  ASRelationshipStorage *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(ASContact);
  objc_msgSend(v3, "linkedContactStoreIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASContact setLinkedContactStoreIdentifier:](v4, "setLinkedContactStoreIdentifier:", v5);

  objc_msgSend(v3, "fullName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASContact setFullName:](v4, "setFullName:", v6);

  objc_msgSend(v3, "shortName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASContact setShortName:](v4, "setShortName:", v7);

  v8 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v3, "destinations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASContact setDestinations:](v4, "setDestinations:", v10);

  if (ASSecureCloudEnabled())
  {
    v11 = (objc_class *)objc_opt_class();
    objc_msgSend(v3, "pendingRelationshipShareItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ASSecureUnarchiveClassWithDataAndStrictness(v11, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASContact setPendingRelationshipShareItem:](v4, "setPendingRelationshipShareItem:", v13);

    if ((objc_msgSend(v3, "hasPendingLegacyShareLocations") & 1) != 0)
    {
      v14 = [ASCodableShareLocations alloc];
      objc_msgSend(v3, "pendingLegacyShareLocations");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[ASCodableShareLocations initWithData:](v14, "initWithData:", v15);
      -[ASContact setPendingLegacyShareLocations:](v4, "setPendingLegacyShareLocations:", v16);

    }
    else
    {
      -[ASContact setPendingLegacyShareLocations:](v4, "setPendingLegacyShareLocations:", 0);
    }
  }
  if (objc_msgSend(v3, "hasRelationshipStorage"))
  {
    objc_msgSend(v3, "relationshipStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASRelationshipStorage relationshipStorageWithCodableRelationshipStorage:](ASRelationshipStorage, "relationshipStorageWithCodableRelationshipStorage:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASContact setRelationshipStorage:](v4, "setRelationshipStorage:", v18);

  }
  else
  {
    v19 = objc_alloc_init(ASRelationshipStorage);
    objc_msgSend(v3, "relationshipContainer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v3, "relationshipContainer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASRelationship relationshipWithCodableRelationshipContainer:](ASRelationship, "relationshipWithCodableRelationshipContainer:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASRelationshipStorage setLegacyRelationship:](v19, "setLegacyRelationship:", v22);

    }
    objc_msgSend(v3, "remoteRelationshipContainer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v3, "remoteRelationshipContainer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASRelationship relationshipWithCodableRelationshipContainer:](ASRelationship, "relationshipWithCodableRelationshipContainer:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASRelationshipStorage setLegacyRemoteRelationship:](v19, "setLegacyRemoteRelationship:", v25);

    }
    -[ASRelationshipStorage storageWithSynchronizedRelationshipIdentifiers](v19, "storageWithSynchronizedRelationshipIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[ASContact setRelationshipStorage:](v4, "setRelationshipStorage:", v17);
    ASLoggingInitialize();
    v26 = ASLogRelationships;
    if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = v17;
      _os_log_impl(&dword_21381F000, v26, OS_LOG_TYPE_DEFAULT, "Migrated relationships to storage %@", (uint8_t *)&v28, 0xCu);
    }
  }

  return v4;
}

- (ASContact)initWithRelationship:(id)a3 remoteRelationship:(id)a4
{
  id v6;
  id v7;
  ASContact *v8;
  uint64_t v9;
  NSSet *destinations;
  ASRelationshipStorage *v11;
  ASRelationshipStorage *relationshipStorage;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASContact;
  v8 = -[ASContact init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    destinations = v8->_destinations;
    v8->_destinations = (NSSet *)v9;

    v11 = -[ASRelationshipStorage initWithRelationship:remoteRelationship:]([ASRelationshipStorage alloc], "initWithRelationship:remoteRelationship:", v6, v7);
    relationshipStorage = v8->_relationshipStorage;
    v8->_relationshipStorage = v11;

  }
  return v8;
}

- (ASContact)init
{
  ASRelationship *v3;
  ASRelationship *v4;
  ASContact *v5;

  v3 = objc_alloc_init(ASRelationship);
  v4 = objc_alloc_init(ASRelationship);
  v5 = -[ASContact initWithRelationship:remoteRelationship:](self, "initWithRelationship:remoteRelationship:", v3, v4);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *shortName;
  void *v6;
  void *v7;
  __int128 v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ASContact UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)&self->_linkedContactStoreIdentifier;
  shortName = self->_shortName;
  -[ASContact displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Contact uuid=%@ contactStoreId=%@ fullName=%@ shortName=%@ displayName=%@ destinations=%@"), v4, v9, shortName, v6, self->_destinations);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fullDescription
{
  id v3;
  NSString *fullName;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  fullName = self->_fullName;
  -[ASContact UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("-------- Contact - %@ (%@) --------\n"), fullName, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("Full Name: %@\n"), self->_fullName);
  objc_msgSend(v3, "appendFormat:", CFSTR("Short Name: %@\n"), self->_shortName);
  -[ASContact displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Display Name: %@\n"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("Destinations: %@\n"), self->_destinations);
  -[ASContact primaryDestinationForMessaging](self, "primaryDestinationForMessaging");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Primary Destination For Messaging: %@\n"), v7);

  NSStringFromASCloudType(-[ASContact cloudType](self, "cloudType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Cloud Type: %@\n"), v8);

  -[ASContact pendingRelationshipShareItem](self, "pendingRelationshipShareItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Pending Secure Cloud Share Item: %@\n"), v9);

  -[ASContact pendingLegacyShareLocations](self, "pendingLegacyShareLocations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Pending Legacy Share Locations: %@\n"), v10);

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  ASContact *v4;
  BOOL v5;

  v4 = (ASContact *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[ASContact isEqualToContact:](self, "isEqualToContact:", v4);
  }

  return v5;
}

- (BOOL)isEqualToContact:(id)a3
{
  id v4;
  NSString *linkedContactStoreIdentifier;
  void *v6;
  NSString *fullName;
  void *v8;
  NSString *shortName;
  void *v10;
  NSSet *destinations;
  void *v12;
  ASRelationshipStorage *relationshipStorage;
  void *v14;
  ASSecureCloudShareItem *pendingRelationshipShareItem;
  void *v16;
  ASCodableShareLocations *pendingLegacyShareLocations;
  void *v18;
  char v19;

  v4 = a3;
  linkedContactStoreIdentifier = self->_linkedContactStoreIdentifier;
  objc_msgSend(v4, "linkedContactStoreIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (ASStringsAreEqual(linkedContactStoreIdentifier, v6))
  {
    fullName = self->_fullName;
    objc_msgSend(v4, "fullName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (ASStringsAreEqual(fullName, v8))
    {
      shortName = self->_shortName;
      objc_msgSend(v4, "shortName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (ASStringsAreEqual(shortName, v10))
      {
        destinations = self->_destinations;
        objc_msgSend(v4, "destinations");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSSet isEqualToSet:](destinations, "isEqualToSet:", v12))
        {
          relationshipStorage = self->_relationshipStorage;
          objc_msgSend(v4, "relationshipStorage");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[ASRelationshipStorage isEqualToRelationshipStorage:](relationshipStorage, "isEqualToRelationshipStorage:", v14))
          {
            pendingRelationshipShareItem = self->_pendingRelationshipShareItem;
            objc_msgSend(v4, "pendingRelationshipShareItem");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (ASObjectsAreEqualOrNil((unint64_t)pendingRelationshipShareItem, (unint64_t)v16))
            {
              pendingLegacyShareLocations = self->_pendingLegacyShareLocations;
              objc_msgSend(v4, "pendingLegacyShareLocations");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = ASObjectsAreEqualOrNil((unint64_t)pendingLegacyShareLocations, (unint64_t)v18);

            }
            else
            {
              v19 = 0;
            }

          }
          else
          {
            v19 = 0;
          }

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v5 + 16), self->_linkedContactStoreIdentifier);
  objc_storeStrong((id *)(v5 + 24), self->_fullName);
  objc_storeStrong((id *)(v5 + 32), self->_shortName);
  v6 = -[NSSet copyWithZone:](self->_destinations, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[ASRelationshipStorage copyWithZone:](self->_relationshipStorage, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v8;

  objc_storeStrong((id *)(v5 + 48), self->_pendingRelationshipShareItem);
  objc_storeStrong((id *)(v5 + 56), self->_pendingLegacyShareLocations);
  return (id)v5;
}

- (NSUUID)UUID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (ASSecureCloudEnabled())
  {
    -[ASRelationshipStorage legacyRelationship](self->_relationshipStorage, "legacyRelationship");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASRelationshipStorage secureCloudRelationship](self->_relationshipStorage, "secureCloudRelationship");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      ASLoggingInitialize();
      v8 = ASLogDefault;
      if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR))
        -[ASContact UUID].cold.1((uint64_t *)&self->_relationshipStorage, v8, v9);
    }
  }
  -[ASRelationshipStorage primaryRelationship](self->_relationshipStorage, "primaryRelationship");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v11;
}

- (NSString)displayName
{
  NSString *fullName;
  __CFString *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;

  if (!-[NSString length](self->_shortName, "length"))
  {
    if (-[NSString length](self->_fullName, "length"))
    {
      fullName = self->_fullName;
      goto LABEL_5;
    }
    -[ASRelationshipStorage primaryRelationship](self->_relationshipStorage, "primaryRelationship");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredReachableAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ASRelationshipStorage primaryRelationship](self->_relationshipStorage, "primaryRelationship");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cloudKitAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (!ASDestinationIsMako(v9, v10) || !v7)
      {
        v11 = v9;
LABEL_13:
        v4 = v11;
LABEL_14:

        return (NSString *)v4;
      }
    }
    else if (!v7)
    {
      -[NSSet anyObject](self->_destinations, "anyObject");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = &stru_24D059A78;
      if (v12)
        v14 = (__CFString *)v12;
      v4 = v14;

      goto LABEL_14;
    }
    v11 = v7;
    goto LABEL_13;
  }
  fullName = self->_shortName;
LABEL_5:
  v4 = fullName;
  return (NSString *)v4;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (id)contactStore
{
  return self->_contactStore;
}

- (NSString)primaryDestinationForMessaging
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  ASContact *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  ASLoggingInitialize();
  v3 = (void *)ASLogDefault;
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[ASContact UUID](self, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v5;
    v18 = 2112;
    v19 = self;
    _os_log_impl(&dword_21381F000, v4, OS_LOG_TYPE_DEFAULT, "Looking for primary destination for messaging for contact %{public}@ - %@", buf, 0x16u);

  }
  v6 = *MEMORY[0x24BDBA348];
  v15[0] = *MEMORY[0x24BDBA288];
  v15[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASContact contactWithKeys:](self, "contactWithKeys:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_12;
  ASLoggingInitialize();
  v9 = ASLogDefault;
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21381F000, v9, OS_LOG_TYPE_DEFAULT, "Found linked contact, choosing best destination", buf, 2u);
  }
  -[ASContact _bestDestinationForContact:](self, "_bestDestinationForContact:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ASLoggingInitialize();
  v11 = ASLogDefault;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR))
      -[ASContact primaryDestinationForMessaging].cold.1(v11, self);
LABEL_12:
    -[ASContact _bestDestinationFromKnownDestinations](self, "_bestDestinationFromKnownDestinations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21381F000, v11, OS_LOG_TYPE_DEFAULT, "Found a destination on linked contact, sanitizing", buf, 2u);
  }
  v12 = v10;
LABEL_13:
  ASContactSanitizedDestination(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (ASContact)contactWithKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v13;

  v4 = a3;
  -[ASContact linkedContactStoreIdentifier](self, "linkedContactStoreIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASContact contactStore](self, "contactStore");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
      v6 = objc_alloc_init(MEMORY[0x24BDBACF8]);
    -[ASContact linkedContactStoreIdentifier](self, "linkedContactStoreIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v6, "unifiedContactWithIdentifier:keysToFetch:error:", v7, v4, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;

    if (!v8 || v9)
    {
      ASLoggingInitialize();
      v10 = (void *)ASLogDefault;
      if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR))
        -[ASContact contactWithKeys:].cold.2(v10, self, (uint64_t)v9);
    }

  }
  else
  {
    ASLoggingInitialize();
    v11 = (void *)ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR))
      -[ASContact contactWithKeys:].cold.1(v11, self);
    v8 = 0;
  }

  return (ASContact *)v8;
}

- (id)_bestDestinationFromKnownDestinations
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  ASLoggingInitialize();
  v3 = ASLogDefault;
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21381F000, v3, OS_LOG_TYPE_DEFAULT, "Choosing the best destination from known relationship destinations", buf, 2u);
  }
  -[ASRelationshipStorage primaryRelationship](self->_relationshipStorage, "primaryRelationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredReachableAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    ASLoggingInitialize();
    v6 = ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21381F000, v6, OS_LOG_TYPE_DEFAULT, "No preferred reachable address, falling back to CloudKit address", v10, 2u);
    }
    objc_msgSend(v4, "cloudKitAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      ASLoggingInitialize();
      v7 = ASLogDefault;
      if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR))
        -[ASContact _bestDestinationFromKnownDestinations].cold.1(v7);
      -[ASContact destinations](self, "destinations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "anyObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

- (id)_bestDestinationForContact:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  void *v18;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  ASLoggingInitialize();
  v6 = (void *)ASLogDefault;
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[ASContact displayName](self, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v8;
    _os_log_impl(&dword_21381F000, v7, OS_LOG_TYPE_DEFAULT, "Looking for best destination for CNContact: %@", buf, 0xCu);

  }
  objc_msgSend(v5, "phoneNumbers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_map:", &__block_literal_global_3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASRelationshipStorage primaryRelationship](self->_relationshipStorage, "primaryRelationship");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredReachableAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "preferredReachableAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _FindIntersectingDestination(v10, v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _FindIntersectingDestination(v10, MEMORY[0x24BDBD1A8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v14)
  {
    ASLoggingInitialize();
    v15 = ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v14;
      v16 = "Found a phone number that matches preferredReachableAddress, selecting: %@";
LABEL_15:
      _os_log_impl(&dword_21381F000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  objc_msgSend(v11, "addresses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _FindIntersectingDestination(v10, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ASLoggingInitialize();
      v15 = ASLogDefault;
      if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v14;
        v16 = "Has a non-matching phone number, selecting: %@";
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    ASLoggingInitialize();
    v20 = ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21381F000, v20, OS_LOG_TYPE_DEFAULT, "Contact has no phone numbers, looking for email addresses", buf, 2u);
    }
    objc_msgSend(v5, "emailAddresses");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hk_map:", &__block_literal_global_215);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "preferredReachableAddress");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v11, "preferredReachableAddress");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v3;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _FindIntersectingDestination(v22, v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _FindIntersectingDestination(v22, MEMORY[0x24BDBD1A8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v14)
    {
      ASLoggingInitialize();
      v25 = ASLogDefault;
      if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v14;
        v26 = "Found email that matches preferredReachableAddress, selecting: %@";
LABEL_39:
        _os_log_impl(&dword_21381F000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v11, "cloudKitAddress");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        objc_msgSend(v11, "cloudKitAddress");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v3;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = (void *)MEMORY[0x24BDBD1A8];
      }
      _FindIntersectingDestination(v22, v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {

      }
      if (v14)
      {
        ASLoggingInitialize();
        v25 = ASLogDefault;
        if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v14;
          v26 = "Found email that matches the CloudKitAddress, selecting: %@";
          goto LABEL_39;
        }
      }
      else
      {
        objc_msgSend(v11, "addresses");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "allObjects");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        _FindIntersectingDestination(v22, v30);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          ASLoggingInitialize();
          v25 = ASLogDefault;
          if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v14;
            v26 = "Found email that matches the address set, selecting: %@";
            goto LABEL_39;
          }
        }
        else
        {
          if (!objc_msgSend(v22, "count"))
          {
            v14 = 0;
            goto LABEL_40;
          }
          objc_msgSend(v22, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          ASLoggingInitialize();
          v25 = ASLogDefault;
          if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v14;
            v26 = "Has a non-matching email, selecting: %@";
            goto LABEL_39;
          }
        }
      }
    }
LABEL_40:

    goto LABEL_16;
  }
  ASLoggingInitialize();
  v15 = ASLogDefault;
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v14;
    v16 = "Found a phone number that matches the address set, selecting: %@";
    goto LABEL_15;
  }
LABEL_16:

  return v14;
}

id __40__ASContact__bestDestinationForContact___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __40__ASContact__bestDestinationForContact___block_invoke_214(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

- (ASRelationship)relationship
{
  return -[ASRelationshipStorage primaryRelationship](self->_relationshipStorage, "primaryRelationship");
}

- (ASRelationship)remoteRelationship
{
  return -[ASRelationshipStorage primaryRemoteRelationship](self->_relationshipStorage, "primaryRemoteRelationship");
}

- (unint64_t)cloudType
{
  void *v2;
  unint64_t v3;

  -[ASRelationshipStorage primaryRelationship](self->_relationshipStorage, "primaryRelationship");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cloudType");

  return v3;
}

- (void)setRelationshipStorage:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipStorage, a3);
}

- (NSString)linkedContactStoreIdentifier
{
  return self->_linkedContactStoreIdentifier;
}

- (void)setLinkedContactStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)shortName
{
  return self->_shortName;
}

- (void)setShortName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (ASSecureCloudShareItem)pendingRelationshipShareItem
{
  return self->_pendingRelationshipShareItem;
}

- (void)setPendingRelationshipShareItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (ASCodableShareLocations)pendingLegacyShareLocations
{
  return self->_pendingLegacyShareLocations;
}

- (void)setPendingLegacyShareLocations:(id)a3
{
  objc_storeStrong((id *)&self->_pendingLegacyShareLocations, a3);
}

- (ASRelationshipStorage)relationshipStorage
{
  return self->_relationshipStorage;
}

- (void)setRelationship:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setRemoteRelationship:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteRelationship, 0);
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_relationshipStorage, 0);
  objc_storeStrong((id *)&self->_pendingLegacyShareLocations, 0);
  objc_storeStrong((id *)&self->_pendingRelationshipShareItem, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_linkedContactStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)UUID
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_4(&dword_21381F000, a2, a3, "Relationship storage has mismatched UUIDs: %@", (uint8_t *)&v4);
}

- (void)primaryDestinationForMessaging
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "linkedContactStoreIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_4(&dword_21381F000, v3, v5, "Found a CNContactStore entry with no known destinations for ID: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_11();
}

- (void)contactWithKeys:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_4(&dword_21381F000, v3, v5, "Cannot fetch contact record for friend with UUID: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_11();
}

- (void)contactWithKeys:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;

  v5 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "linkedContactStoreIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a3;
  _os_log_error_impl(&dword_21381F000, v5, OS_LOG_TYPE_ERROR, "Error fetching contact %@, error: %@", (uint8_t *)&v7, 0x16u);

}

- (void)_bestDestinationFromKnownDestinations
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21381F000, log, OS_LOG_TYPE_ERROR, "No CloudKit address, falling back to any arbitrary known address", v1, 2u);
}

@end
