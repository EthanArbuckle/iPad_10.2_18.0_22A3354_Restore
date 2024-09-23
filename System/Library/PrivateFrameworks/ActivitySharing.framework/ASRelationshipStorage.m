@implementation ASRelationshipStorage

- (id)codableRelationshipStorageIncludingCloudKitFields:(BOOL)a3
{
  _BOOL8 v3;
  ASCodableRelationshipStorage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v5 = objc_alloc_init(ASCodableRelationshipStorage);
  -[ASRelationshipStorage legacyRelationship](self, "legacyRelationship");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "codableRelationshipContainerIncludingCloudKitFields:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableRelationshipStorage setLegacyRelationshipContainer:](v5, "setLegacyRelationshipContainer:", v7);

  -[ASRelationshipStorage legacyRemoteRelationship](self, "legacyRemoteRelationship");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRelationshipContainerIncludingCloudKitFields:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableRelationshipStorage setLegacyRemoteRelationshipContainer:](v5, "setLegacyRemoteRelationshipContainer:", v9);

  -[ASRelationshipStorage secureCloudRelationship](self, "secureCloudRelationship");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "codableRelationshipContainerIncludingCloudKitFields:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableRelationshipStorage setSecureCloudRelationshipContainer:](v5, "setSecureCloudRelationshipContainer:", v11);

  -[ASRelationshipStorage secureCloudRemoteRelationship](self, "secureCloudRemoteRelationship");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "codableRelationshipContainerIncludingCloudKitFields:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableRelationshipStorage setSecureCloudRemoteRelationshipContainer:](v5, "setSecureCloudRemoteRelationshipContainer:", v13);

  return v5;
}

+ (ASRelationshipStorage)relationshipStorageWithCodableRelationshipStorage:(id)a3
{
  id v3;
  ASRelationshipStorage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = objc_alloc_init(ASRelationshipStorage);
  objc_msgSend(v3, "legacyRelationshipContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASRelationship relationshipWithCodableRelationshipContainer:](ASRelationship, "relationshipWithCodableRelationshipContainer:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationshipStorage setLegacyRelationship:](v4, "setLegacyRelationship:", v6);

  objc_msgSend(v3, "legacyRemoteRelationshipContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASRelationship relationshipWithCodableRelationshipContainer:](ASRelationship, "relationshipWithCodableRelationshipContainer:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationshipStorage setLegacyRemoteRelationship:](v4, "setLegacyRemoteRelationship:", v8);

  objc_msgSend(v3, "secureCloudRelationshipContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASRelationship relationshipWithCodableRelationshipContainer:](ASRelationship, "relationshipWithCodableRelationshipContainer:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationshipStorage setSecureCloudRelationship:](v4, "setSecureCloudRelationship:", v10);

  objc_msgSend(v3, "secureCloudRemoteRelationshipContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[ASRelationship relationshipWithCodableRelationshipContainer:](ASRelationship, "relationshipWithCodableRelationshipContainer:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationshipStorage setSecureCloudRemoteRelationship:](v4, "setSecureCloudRemoteRelationship:", v12);

  return v4;
}

- (ASRelationshipStorage)init
{
  ASRelationship *v3;
  ASRelationship *v4;
  ASRelationshipStorage *v5;

  v3 = objc_alloc_init(ASRelationship);
  v4 = objc_alloc_init(ASRelationship);
  v5 = -[ASRelationshipStorage initWithRelationship:remoteRelationship:](self, "initWithRelationship:remoteRelationship:", v3, v4);

  return v5;
}

- (ASRelationshipStorage)initWithRelationship:(id)a3 remoteRelationship:(id)a4
{
  id v7;
  id v8;
  ASRelationshipStorage *v9;
  ASRelationshipStorage *v10;
  ASRelationship *v11;
  ASRelationship *v12;
  ASRelationship *secureCloudRelationship;
  ASRelationship *v14;
  ASRelationship *secureCloudRemoteRelationship;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ASRelationshipStorage;
  v9 = -[ASRelationshipStorage init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_legacyRelationship, a3);
    objc_storeStrong((id *)&v10->_legacyRemoteRelationship, a4);
    v11 = (ASRelationship *)objc_msgSend(v7, "copy");
    v12 = (ASRelationship *)objc_msgSend(v8, "copy");
    -[ASRelationship setCloudType:](v11, "setCloudType:", 1);
    -[ASRelationship setCloudType:](v12, "setCloudType:", 1);
    secureCloudRelationship = v10->_secureCloudRelationship;
    v10->_secureCloudRelationship = v11;
    v14 = v11;

    secureCloudRemoteRelationship = v10->_secureCloudRemoteRelationship;
    v10->_secureCloudRemoteRelationship = v12;

  }
  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  ASRelationship *legacyRelationship;
  ASRelationship *legacyRemoteRelationship;
  ASRelationship *secureCloudRelationship;
  ASRelationship *secureCloudRemoteRelationship;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;

  -[ASRelationshipStorage primaryRelationship](self, "primaryRelationship");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cloudType");

  -[ASRelationshipStorage primaryRemoteRelationship](self, "primaryRemoteRelationship");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cloudType");

  if (v4)
    v7 = &stru_24D059A78;
  else
    v7 = CFSTR(" (PRIMARY)");
  if (v4)
    v8 = CFSTR(" (PRIMARY)");
  else
    v8 = &stru_24D059A78;
  if (v6)
    v9 = &stru_24D059A78;
  else
    v9 = CFSTR(" (PRIMARY)");
  if (v6)
    v10 = CFSTR(" (PRIMARY)");
  else
    v10 = &stru_24D059A78;
  v11 = (void *)MEMORY[0x24BDD17C8];
  legacyRelationship = self->_legacyRelationship;
  legacyRemoteRelationship = self->_legacyRemoteRelationship;
  secureCloudRelationship = self->_secureCloudRelationship;
  secureCloudRemoteRelationship = self->_secureCloudRemoteRelationship;
  v16 = v8;
  v17 = v9;
  v18 = v7;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("ASRelationshipStorage:\nLEGACY LOCAL%@: %@\nLEGACY REMOTE%@: %@\nSECURE CLOUD LOCAL%@: %@\nSECURE CLOUD REMOTE%@: %@"), v18, legacyRelationship, v17, legacyRemoteRelationship, v16, secureCloudRelationship, v10, secureCloudRemoteRelationship);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)fullDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  objc_class *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  -[ASRelationshipStorage primaryRelationship](self, "primaryRelationship");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cloudType");

  -[ASRelationshipStorage primaryRemoteRelationship](self, "primaryRemoteRelationship");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cloudType");

  v7 = &stru_24D059A78;
  if (v4)
    v8 = &stru_24D059A78;
  else
    v8 = CFSTR(" (PRIMARY)");
  if (v4)
    v9 = CFSTR(" (PRIMARY)");
  else
    v9 = &stru_24D059A78;
  if (v6)
    v10 = &stru_24D059A78;
  else
    v10 = CFSTR(" (PRIMARY)");
  if (v6)
    v7 = CFSTR(" (PRIMARY)");
  v11 = (objc_class *)MEMORY[0x24BDD16A8];
  v12 = v7;
  v13 = v9;
  v14 = v10;
  v15 = v8;
  v16 = objc_alloc_init(v11);
  objc_msgSend(v16, "appendFormat:", CFSTR("-------- Relationship Storage --------\n"));
  -[ASRelationship fullDescription](self->_legacyRelationship, "fullDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendFormat:", CFSTR("LEGACY LOCAL%@: \n%@\n"), v15, v17);

  -[ASRelationship fullDescription](self->_legacyRemoteRelationship, "fullDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendFormat:", CFSTR("LEGACY REMOTE%@: \n%@\n"), v14, v18);

  -[ASRelationship fullDescription](self->_secureCloudRelationship, "fullDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendFormat:", CFSTR("SECURE CLOUD LOCAL%@: \n%@\n"), v13, v19);

  -[ASRelationship fullDescription](self->_secureCloudRemoteRelationship, "fullDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendFormat:", CFSTR("SECURE CLOUD REMOTE%@: \n%@\n"), v12, v20);

  v21 = (void *)objc_msgSend(v16, "copy");
  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ASRelationship copyWithZone:](self->_legacyRelationship, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[ASRelationship copyWithZone:](self->_legacyRemoteRelationship, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[ASRelationship copyWithZone:](self->_secureCloudRelationship, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[ASRelationship copyWithZone:](self->_secureCloudRemoteRelationship, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqualToRelationshipStorage:(id)a3
{
  id v4;
  ASRelationship *legacyRelationship;
  void *v6;
  ASRelationship *legacyRemoteRelationship;
  void *v8;
  ASRelationship *secureCloudRelationship;
  void *v10;
  ASRelationship *secureCloudRemoteRelationship;
  void *v12;
  BOOL v13;

  v4 = a3;
  legacyRelationship = self->_legacyRelationship;
  objc_msgSend(v4, "legacyRelationship");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ASRelationship isEqualToRelationship:](legacyRelationship, "isEqualToRelationship:", v6))
  {
    legacyRemoteRelationship = self->_legacyRemoteRelationship;
    objc_msgSend(v4, "legacyRemoteRelationship");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ASRelationship isEqualToRelationship:](legacyRemoteRelationship, "isEqualToRelationship:", v8))
    {
      secureCloudRelationship = self->_secureCloudRelationship;
      objc_msgSend(v4, "secureCloudRelationship");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ASRelationship isEqualToRelationship:](secureCloudRelationship, "isEqualToRelationship:", v10))
      {
        secureCloudRemoteRelationship = self->_secureCloudRemoteRelationship;
        objc_msgSend(v4, "secureCloudRemoteRelationship");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[ASRelationship isEqualToRelationship:](secureCloudRemoteRelationship, "isEqualToRelationship:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (ASRelationship)primaryRelationship
{
  void *v3;
  void *v4;
  void *v5;

  -[ASRelationshipStorage secureCloudRelationship](self, "secureCloudRelationship");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationshipStorage legacyRelationship](self, "legacyRelationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationshipStorage _chosePrimaryRelationshipWithSecureCloudRelationship:legacyRelationship:](self, "_chosePrimaryRelationshipWithSecureCloudRelationship:legacyRelationship:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASRelationship *)v5;
}

- (ASRelationship)primaryRemoteRelationship
{
  void *v3;
  void *v4;
  void *v5;

  -[ASRelationshipStorage secureCloudRemoteRelationship](self, "secureCloudRemoteRelationship");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationshipStorage legacyRemoteRelationship](self, "legacyRemoteRelationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASRelationshipStorage _chosePrimaryRelationshipWithSecureCloudRelationship:legacyRelationship:](self, "_chosePrimaryRelationshipWithSecureCloudRelationship:legacyRelationship:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASRelationship *)v5;
}

- (id)_chosePrimaryRelationshipWithSecureCloudRelationship:(id)a3 legacyRelationship:(id)a4
{
  id v5;
  id v6;
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  void *v27;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "dateForLatestRelationshipStart");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateForLatestRelationshipEnd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateForLatestRelationshipStart");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateForLatestRelationshipEnd");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isFriendshipActive") & 1) != 0
    || (objc_msgSend(v5, "hasInviteRequestEvent") & 1) != 0
    || !objc_msgSend(v6, "isFriendshipActive")
    || !objc_msgSend(v10, "hk_isAfterOrEqualToDate:", v7))
  {
    if ((objc_msgSend(v6, "isFriendshipActive") & 1) == 0
      && (objc_msgSend(v6, "hasInviteRequestEvent") & 1) == 0
      && objc_msgSend(v5, "isFriendshipActive")
      && objc_msgSend(v8, "hk_isAfterOrEqualToDate:", v9))
    {
      v11 = v6;
      goto LABEL_11;
    }
    objc_msgSend(v6, "dateForLatestDowngradeCompleted");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateForLatestMigrationCompleted");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isFriendshipActive")
      && objc_msgSend(v5, "secureCloudMigrationCompleted")
      && (!v8 || objc_msgSend(v9, "hk_isAfterOrEqualToDate:", v8))
      && (!v13 || objc_msgSend(v14, "hk_isAfterOrEqualToDate:", v13)))
    {
      v15 = v5;
    }
    else
    {
      if (!objc_msgSend(v6, "isFriendshipActive"))
      {
        v27 = v7;
        objc_msgSend(v5, "dateForLatestInviteRequestEvent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = v16;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        v19 = v18;

        objc_msgSend(v6, "dateForLatestInviteRequestEvent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          v22 = v20;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
          v22 = (id)objc_claimAutoreleasedReturnValue();
        }
        v23 = v22;

        if (objc_msgSend(v5, "hasInviteRequestEvent")
          && objc_msgSend(v6, "hasInviteRequestEvent"))
        {
          if (objc_msgSend(v19, "hk_isAfterOrEqualToDate:", v23))
            v24 = v5;
          else
            v24 = v6;
        }
        else
        {
          v25 = objc_msgSend(v5, "hasInviteRequestEvent");
          v24 = v5;
          if ((v25 & 1) == 0)
          {
            objc_msgSend(v6, "hasInviteRequestEvent");
            v24 = v6;
          }
        }
        v12 = (void *)objc_msgSend(v24, "copy");

        v7 = v27;
        goto LABEL_36;
      }
      v15 = v6;
    }
    v12 = (void *)objc_msgSend(v15, "copy");
LABEL_36:

    goto LABEL_37;
  }
  v11 = v5;
LABEL_11:
  v12 = (void *)objc_msgSend(v11, "copy");
LABEL_37:

  return v12;
}

- (id)relationshipForCloudType:(unint64_t)a3
{
  uint64_t v3;

  v3 = 8;
  if (a3 == 1)
    v3 = 24;
  return *(id *)((char *)&self->super.isa + v3);
}

- (void)updateRelationship:(id)a3 cloudType:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = objc_msgSend(v5, "cloudType");
  v7 = 8;
  if (v6 == 1)
    v7 = 24;
  v8 = *(Class *)((char *)&self->super.isa + v7);
  *(Class *)((char *)&self->super.isa + v7) = (Class)v5;

}

- (id)remoteRelationshipForCloudType:(unint64_t)a3
{
  uint64_t v3;

  v3 = 16;
  if (a3 == 1)
    v3 = 32;
  return *(id *)((char *)&self->super.isa + v3);
}

- (void)updateRemoteRelationship:(id)a3 cloudType:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = objc_msgSend(v5, "cloudType");
  v7 = 16;
  if (v6 == 1)
    v7 = 32;
  v8 = *(Class *)((char *)&self->super.isa + v7);
  *(Class *)((char *)&self->super.isa + v7) = (Class)v5;

}

- (ASRelationshipStorage)storageWithSynchronizedRelationshipIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)-[ASRelationshipStorage copy](self, "copy");
  objc_msgSend(v2, "primaryRelationship");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "cloudType"))
  {
LABEL_2:

    goto LABEL_3;
  }
  objc_msgSend(v2, "legacyRelationship");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secureCloudRelationship");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v2, "secureCloudRelationship");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "legacyRelationship");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUUID:", v12);

    objc_msgSend(v2, "setSecureCloudRelationship:", v3);
    ASLoggingInitialize();
    v13 = ASLogRelationships;
    if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v2;
      _os_log_impl(&dword_21381F000, v13, OS_LOG_TYPE_DEFAULT, "Synchronized relationship identifiers: %@", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_2;
  }
LABEL_3:
  objc_msgSend(v2, "primaryRemoteRelationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "cloudType"))
  {
    objc_msgSend(v2, "legacyRemoteRelationship");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "secureCloudRemoteRelationship");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "isEqual:", v17);

    if ((v18 & 1) != 0)
      return (ASRelationshipStorage *)v2;
    objc_msgSend(v2, "secureCloudRemoteRelationship");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "legacyRemoteRelationship");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUUID:", v20);

    objc_msgSend(v2, "setSecureCloudRemoteRelationship:", v4);
    ASLoggingInitialize();
    v21 = ASLogRelationships;
    if (os_log_type_enabled((os_log_t)ASLogRelationships, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v2;
      _os_log_impl(&dword_21381F000, v21, OS_LOG_TYPE_DEFAULT, "Synchronized remote relationship identifiers: %@", (uint8_t *)&v22, 0xCu);
    }
  }

  return (ASRelationshipStorage *)v2;
}

- (ASRelationship)legacyRelationship
{
  return self->_legacyRelationship;
}

- (void)setLegacyRelationship:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ASRelationship)legacyRemoteRelationship
{
  return self->_legacyRemoteRelationship;
}

- (void)setLegacyRemoteRelationship:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ASRelationship)secureCloudRelationship
{
  return self->_secureCloudRelationship;
}

- (void)setSecureCloudRelationship:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ASRelationship)secureCloudRemoteRelationship
{
  return self->_secureCloudRemoteRelationship;
}

- (void)setSecureCloudRemoteRelationship:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureCloudRemoteRelationship, 0);
  objc_storeStrong((id *)&self->_secureCloudRelationship, 0);
  objc_storeStrong((id *)&self->_legacyRemoteRelationship, 0);
  objc_storeStrong((id *)&self->_legacyRelationship, 0);
}

@end
