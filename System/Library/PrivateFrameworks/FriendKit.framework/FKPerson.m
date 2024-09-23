@implementation FKPerson

+ (id)sharedMetadataQueue
{
  if (sharedMetadataQueue_onceToken != -1)
    dispatch_once(&sharedMetadataQueue_onceToken, &__block_literal_global_3);
  return (id)sharedMetadataQueue_metadataQueue;
}

void __31__FKPerson_sharedMetadataQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.FriendKit.FKPerson.metadata", MEMORY[0x24BDAC9C0]);
  v1 = (void *)sharedMetadataQueue_metadataQueue;
  sharedMetadataQueue_metadataQueue = (uint64_t)v0;

}

- (FKPerson)init
{
  FKPerson *v2;
  FKPerson *v3;
  uint64_t v4;
  NSMutableDictionary *metadata;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FKPerson;
  v2 = -[FKPerson init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_abRecordID = -1;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    metadata = v3->_metadata;
    v3->_metadata = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (FKPerson)initWithDictionaryRepresentation:(id)a3 addressBook:(void *)a4
{
  id v5;
  FKPerson *v6;
  FKPerson *v7;

  v5 = a3;
  v6 = -[FKPerson init](self, "init");
  v7 = v6;
  if (v6)
    -[FKPerson _updateFromDictionaryRepresentation:shouldLogUpdates:](v6, "_updateFromDictionaryRepresentation:shouldLogUpdates:", v5, 0);

  return v7;
}

- (FKPerson)initWithDestinations:(id)a3 addressBook:(void *)a4
{
  id v6;
  FKPerson *v7;
  uint64_t v8;
  NSSet *allValues;

  v6 = a3;
  v7 = -[FKPerson init](self, "init");
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    allValues = v7->_allValues;
    v7->_allValues = (NSSet *)v8;

    -[FKPerson _reconcile:canPostChangeNotification:shouldLogUpdates:](v7, "_reconcile:canPostChangeNotification:shouldLogUpdates:", a4, 0, 0);
  }

  return v7;
}

- (FKPerson)initWithABRecordGUID:(id)a3 addressBook:(void *)a4
{
  id v7;
  FKPerson *v8;
  FKPerson *v9;

  v7 = a3;
  v8 = -[FKPerson init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_abRecordGUID, a3);
    -[FKPerson _reconcile:canPostChangeNotification:shouldLogUpdates:](v9, "_reconcile:canPostChangeNotification:shouldLogUpdates:", a4, 0, 0);
  }

  return v9;
}

- (FKPerson)initWithFavorite:(id)a3 addressBook:(void *)a4
{
  id v6;
  FKPerson *v7;
  ABRecordID v8;
  ABRecordRef PersonWithRecordID;
  NSString *v10;
  NSString *abRecordGUID;
  uint64_t v12;
  NSString *abDatabaseUID;
  uint64_t v14;
  NSString *name;
  void *v16;
  void *v17;
  uint64_t v18;
  NSSet *allValues;

  v6 = a3;
  v7 = -[FKPerson init](self, "init");
  if (v7)
  {
    v8 = objc_msgSend(v6, "_abUid");
    PersonWithRecordID = ABAddressBookGetPersonWithRecordID(a4, v8);
    if (PersonWithRecordID)
    {
      v7->_abRecordID = v8;
      v10 = (NSString *)ABRecordCopyValue(PersonWithRecordID, *MEMORY[0x24BE027E8]);
      abRecordGUID = v7->_abRecordGUID;
      v7->_abRecordGUID = v10;

      v12 = ABAddressBookCopyUniqueIdentifier();
      abDatabaseUID = v7->_abDatabaseUID;
      v7->_abDatabaseUID = (NSString *)v12;

      -[FKPerson _reconcile:canPostChangeNotification:shouldLogUpdates:](v7, "_reconcile:canPostChangeNotification:shouldLogUpdates:", a4, 0, 0);
    }
    else
    {
      objc_msgSend(v6, "displayName");
      v14 = objc_claimAutoreleasedReturnValue();
      name = v7->_name;
      v7->_name = (NSString *)v14;

      objc_msgSend(v6, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fkMessageCanonicalRawAddress");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      allValues = v7->_allValues;
      v7->_allValues = (NSSet *)v18;

    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *primaryDestination;
  id v5;

  primaryDestination = self->_primaryDestination;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", primaryDestination, CFSTR("pd"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_initials, CFSTR("i"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumberCount, CFSTR("pnc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emailAddressCount, CFSTR("eac"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_abRecordID, CFSTR("abid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_abRecordGUID, CFSTR("abguid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_abDatabaseUID, CFSTR("abdbuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("n"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allValues, CFSTR("av"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("m"));

}

- (FKPerson)initWithCoder:(id)a3
{
  id v4;
  FKPerson *v5;
  uint64_t v6;
  NSString *primaryDestination;
  uint64_t v8;
  NSString *initials;
  uint64_t v10;
  NSNumber *phoneNumberCount;
  uint64_t v12;
  NSNumber *emailAddressCount;
  uint64_t v14;
  NSString *abRecordGUID;
  uint64_t v16;
  NSString *abDatabaseUID;
  uint64_t v18;
  NSString *name;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSSet *allValues;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSMutableDictionary *metadata;
  _QWORD v33[6];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[FKPerson init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pd"));
    v6 = objc_claimAutoreleasedReturnValue();
    primaryDestination = v5->_primaryDestination;
    v5->_primaryDestination = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
    v8 = objc_claimAutoreleasedReturnValue();
    initials = v5->_initials;
    v5->_initials = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pnc"));
    v10 = objc_claimAutoreleasedReturnValue();
    phoneNumberCount = v5->_phoneNumberCount;
    v5->_phoneNumberCount = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eac"));
    v12 = objc_claimAutoreleasedReturnValue();
    emailAddressCount = v5->_emailAddressCount;
    v5->_emailAddressCount = (NSNumber *)v12;

    v5->_abRecordID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("abid"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("abguid"));
    v14 = objc_claimAutoreleasedReturnValue();
    abRecordGUID = v5->_abRecordGUID;
    v5->_abRecordGUID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("abdbuid"));
    v16 = objc_claimAutoreleasedReturnValue();
    abDatabaseUID = v5->_abDatabaseUID;
    v5->_abDatabaseUID = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("n"));
    v18 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v18;

    v20 = (void *)MEMORY[0x24BDBCF20];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("av"));
    v23 = objc_claimAutoreleasedReturnValue();
    allValues = v5->_allValues;
    v5->_allValues = (NSSet *)v23;

    v25 = (void *)MEMORY[0x24BDBCED8];
    v26 = (void *)MEMORY[0x24BDBCF20];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v33[3] = objc_opt_class();
    v33[4] = objc_opt_class();
    v33[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setWithArray:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("m"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryWithDictionary:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSMutableDictionary *)v30;

  }
  return v5;
}

- (BOOL)_updateFromDictionaryRepresentation:(id)a3 shouldLogUpdates:(BOOL)a4
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSString *abRecordGUID;
  NSObject *v17;
  NSString *v18;
  NSString *abDatabaseUID;
  NSObject *v20;
  NSString *v21;
  NSString *name;
  NSObject *v23;
  NSString *v24;
  uint64_t v25;
  NSSet *allValues;
  NSObject *v27;
  NSSet *v28;
  NSString *preferredReplyAs;
  NSObject *v30;
  NSString *v31;
  BOOL v32;
  NSString *initials;
  NSObject *v34;
  NSString *v35;
  NSObject *v36;
  id v37;
  BOOL v38;
  uint64_t v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  uint64_t v44;
  _QWORD block[5];
  id v46;
  uint64_t *v47;
  BOOL v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  FKPerson *v58;
  __int16 v59;
  NSSet *v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v43 = a4;
  v63 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("ABRecordID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("ABRecordGUID"));
  v44 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ABDatabaseUID"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Name"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v5, "objectForKey:", CFSTR("AllValues"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("ReplyAs"));
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Monogram"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(v5, "objectForKey:", CFSTR("Metadata"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithDictionary:", v15);
  v40 = objc_claimAutoreleasedReturnValue();

  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  if (self->_abRecordID != v7)
  {
    self->_abRecordID = v7;
    v52 = 1;
  }
  abRecordGUID = self->_abRecordGUID;
  if ((unint64_t)abRecordGUID | v44 && !-[NSString isEqualToString:](abRecordGUID, "isEqualToString:", v44))
  {
    if (v43)
    {
      _FKGetLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_abRecordGUID;
        *(_DWORD *)buf = 136316162;
        v54 = "-[FKPerson _updateFromDictionaryRepresentation:shouldLogUpdates:]";
        v55 = 1024;
        v56 = 195;
        v57 = 2112;
        v58 = self;
        v59 = 2112;
        v60 = (NSSet *)v18;
        v61 = 2112;
        v62 = v44;
        _os_log_impl(&dword_211A80000, v17, OS_LOG_TYPE_DEFAULT, "%s (%d) \"%@ is being marked as updated due to abRecordGUID: %@ -> %@\", buf, 0x30u);
      }

    }
    -[FKPerson _setABRecordGUID:](self, "_setABRecordGUID:", v44, v40);
    *((_BYTE *)v50 + 24) = 1;
  }
  abDatabaseUID = self->_abDatabaseUID;
  if ((unint64_t)abDatabaseUID | v8 && !-[NSString isEqualToString:](abDatabaseUID, "isEqualToString:", v8))
  {
    if (v43)
    {
      _FKGetLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_abDatabaseUID;
        *(_DWORD *)buf = 136316162;
        v54 = "-[FKPerson _updateFromDictionaryRepresentation:shouldLogUpdates:]";
        v55 = 1024;
        v56 = 201;
        v57 = 2112;
        v58 = self;
        v59 = 2112;
        v60 = (NSSet *)v21;
        v61 = 2112;
        v62 = v8;
        _os_log_impl(&dword_211A80000, v20, OS_LOG_TYPE_DEFAULT, "%s (%d) \"%@ is being marked as updated due to abDatabaseUID: %@ -> %@\", buf, 0x30u);
      }

    }
    objc_storeStrong((id *)&self->_abDatabaseUID, (id)v8);
    *((_BYTE *)v50 + 24) = 1;
  }
  name = self->_name;
  if ((unint64_t)name | v9 && !-[NSString isEqualToString:](name, "isEqualToString:", v9))
  {
    if (v43)
    {
      _FKGetLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = self->_name;
        *(_DWORD *)buf = 136316162;
        v54 = "-[FKPerson _updateFromDictionaryRepresentation:shouldLogUpdates:]";
        v55 = 1024;
        v56 = 207;
        v57 = 2112;
        v58 = self;
        v59 = 2112;
        v60 = (NSSet *)v24;
        v61 = 2112;
        v62 = v9;
        _os_log_impl(&dword_211A80000, v23, OS_LOG_TYPE_DEFAULT, "%s (%d) \"%@ is being marked as updated due to name: '%@' -> '%@'\", buf, 0x30u);
      }

    }
    objc_storeStrong((id *)&self->_name, (id)v9);
    *((_BYTE *)v50 + 24) = 1;
  }
  objc_msgSend(v42, "fkSanitizedDestinationSet", v40);
  v25 = objc_claimAutoreleasedReturnValue();
  allValues = self->_allValues;
  if ((unint64_t)allValues | v25 && !-[NSSet isEqualToSet:](allValues, "isEqualToSet:", v25))
  {
    if (v43)
    {
      _FKGetLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = self->_allValues;
        *(_DWORD *)buf = 136316162;
        v54 = "-[FKPerson _updateFromDictionaryRepresentation:shouldLogUpdates:]";
        v55 = 1024;
        v56 = 216;
        v57 = 2112;
        v58 = self;
        v59 = 2112;
        v60 = v28;
        v61 = 2112;
        v62 = v25;
        _os_log_impl(&dword_211A80000, v27, OS_LOG_TYPE_DEFAULT, "%s (%d) \"%@ is being marked as updated due to allValues: %@ -> %@\", buf, 0x30u);
      }

    }
    objc_storeStrong((id *)&self->_allValues, (id)v25);
    *((_BYTE *)v50 + 24) = 1;
    self->_needsSave = objc_msgSend(v42, "isEqualToSet:", v25) ^ 1;
  }
  preferredReplyAs = self->_preferredReplyAs;
  if ((unint64_t)preferredReplyAs | v12
    && !-[NSString isEqualToString:](preferredReplyAs, "isEqualToString:", v12))
  {
    if (v43)
    {
      _FKGetLogSystem();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = self->_preferredReplyAs;
        *(_DWORD *)buf = 136316162;
        v54 = "-[FKPerson _updateFromDictionaryRepresentation:shouldLogUpdates:]";
        v55 = 1024;
        v56 = 225;
        v57 = 2112;
        v58 = self;
        v59 = 2112;
        v60 = (NSSet *)v31;
        v61 = 2112;
        v62 = v12;
        _os_log_impl(&dword_211A80000, v30, OS_LOG_TYPE_DEFAULT, "%s (%d) \"%@ is being marked as updated due to _preferredReplyAs: '%@' -> '%@'\", buf, 0x30u);
      }

    }
    objc_storeStrong((id *)&self->_preferredReplyAs, (id)v12);
    *((_BYTE *)v50 + 24) = 1;
  }
  if (!v13)
  {
    +[FKUtility initialForString:](FKUtility, "initialForString:", self->_name);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend((id)v13, "length"))
    v32 = 0;
  else
    v32 = -[NSString length](self->_initials, "length") == 0;
  initials = self->_initials;
  if (v13 | (unint64_t)initials && !v32 && !-[NSString isEqualToString:](initials, "isEqualToString:", v13))
  {
    if (v43)
    {
      _FKGetLogSystem();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = self->_initials;
        *(_DWORD *)buf = 136316162;
        v54 = "-[FKPerson _updateFromDictionaryRepresentation:shouldLogUpdates:]";
        v55 = 1024;
        v56 = 234;
        v57 = 2112;
        v58 = self;
        v59 = 2112;
        v60 = (NSSet *)v35;
        v61 = 2112;
        v62 = v13;
        _os_log_impl(&dword_211A80000, v34, OS_LOG_TYPE_DEFAULT, "%s (%d) \"%@ is being marked as updated due to initials: [%@] -> [%@]\", buf, 0x30u);
      }

    }
    objc_storeStrong((id *)&self->_initials, (id)v13);
    *((_BYTE *)v50 + 24) = 1;
  }
  +[FKPerson sharedMetadataQueue](FKPerson, "sharedMetadataQueue");
  v36 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__FKPerson__updateFromDictionaryRepresentation_shouldLogUpdates___block_invoke;
  block[3] = &unk_24CCDFF98;
  block[4] = self;
  v46 = v41;
  v48 = v43;
  v47 = &v49;
  v37 = v41;
  dispatch_sync(v36, block);

  v38 = *((_BYTE *)v50 + 24) != 0;
  _Block_object_dispose(&v49, 8);

  return v38;
}

void __65__FKPerson__updateFromDictionaryRepresentation_shouldLogUpdates___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v3 + 80) | v2 && (objc_msgSend((id)v2, "isEqualToDictionary:") & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      _FKGetLogSystem();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = *(_QWORD *)(a1 + 40);
        v7 = *(_QWORD *)(v5 + 80);
        *(_DWORD *)buf = 136316162;
        v13 = "-[FKPerson _updateFromDictionaryRepresentation:shouldLogUpdates:]_block_invoke";
        v14 = 1024;
        v15 = 241;
        v16 = 2112;
        v17 = v5;
        v18 = 2112;
        v19 = v7;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_211A80000, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) \"%@ is being marked as updated due to metadata: %@ -> %@\", buf, 0x30u);
      }

    }
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    +[FKPerson sharedMetadataQueue](FKPerson, "sharedMetadataQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __65__FKPerson__updateFromDictionaryRepresentation_shouldLogUpdates___block_invoke_52;
    v9[3] = &unk_24CCDFBE0;
    objc_copyWeak(&v11, (id *)buf);
    v10 = *(id *)(a1 + 40);
    dispatch_barrier_async(v8, v9);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __65__FKPerson__updateFromDictionaryRepresentation_shouldLogUpdates___block_invoke_52(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_metadataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "_metadataDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));

}

- (BOOL)updateFromDictionaryRepresentation:(id)a3
{
  return -[FKPerson _updateFromDictionaryRepresentation:shouldLogUpdates:](self, "_updateFromDictionaryRepresentation:shouldLogUpdates:", a3, 1);
}

- (void)refreshWithAddressBook:(void *)a3
{
  -[FKPerson _reconcile:canPostChangeNotification:shouldLogUpdates:](self, "_reconcile:canPostChangeNotification:shouldLogUpdates:", a3, 1, 1);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSString *abRecordGUID;
  NSString *abDatabaseUID;
  NSString *name;
  NSSet *allValues;
  void *v10;
  NSString *preferredReplyAs;
  const __CFString *initials;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD block[5];
  id v19;

  v3 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_abRecordID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, CFSTR("ABRecordID"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  abRecordGUID = self->_abRecordGUID;
  if (abRecordGUID)
    objc_msgSend(v5, "setObject:forKey:", abRecordGUID, CFSTR("ABRecordGUID"));
  abDatabaseUID = self->_abDatabaseUID;
  if (abDatabaseUID)
    objc_msgSend(v5, "setObject:forKey:", abDatabaseUID, CFSTR("ABDatabaseUID"));
  name = self->_name;
  if (name)
    objc_msgSend(v5, "setObject:forKey:", name, CFSTR("Name"));
  allValues = self->_allValues;
  if (allValues)
  {
    -[NSSet allObjects](allValues, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("AllValues"));

  }
  preferredReplyAs = self->_preferredReplyAs;
  if (preferredReplyAs)
    objc_msgSend(v5, "setObject:forKey:", preferredReplyAs, CFSTR("ReplyAs"));
  if (self->_initials)
    initials = (const __CFString *)self->_initials;
  else
    initials = &stru_24CCE02E8;
  objc_msgSend(v5, "setObject:forKey:", initials, CFSTR("Monogram"));
  +[FKPerson sharedMetadataQueue](FKPerson, "sharedMetadataQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__FKPerson_dictionaryRepresentation__block_invoke;
  block[3] = &unk_24CCDFEA8;
  block[4] = self;
  v14 = v5;
  v19 = v14;
  dispatch_sync(v13, block);

  v15 = v19;
  v16 = v14;

  return v16;
}

void __36__FKPerson_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"))
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("Metadata"));

  }
}

- (id)displayName
{
  void *v3;
  uint64_t v4;

  if (-[NSString length](self->_name, "length"))
  {
    v3 = (void *)-[NSString copy](self->_name, "copy");
  }
  else
  {
    -[FKPerson primaryDestination](self, "primaryDestination");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "fkMessageDestinationType") == 1)
    {
      +[FKUtility compressPhoneNumberString:](FKUtility, "compressPhoneNumberString:", v3);
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
  }
  return v3;
}

- (id)primaryDestination
{
  NSString *primaryDestination;
  void *v4;
  NSString *v5;
  void *v6;
  NSString *v7;

  primaryDestination = self->_primaryDestination;
  if (!primaryDestination)
  {
    +[FKPerson _allPhoneValuesInSet:](FKPerson, "_allPhoneValuesInSet:", self->_allValues);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "objectAtIndex:", 0);
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[FKPerson _allEmailValuesInSet:](FKPerson, "_allEmailValuesInSet:", self->_allValues);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "objectAtIndex:", 0);
        v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

    }
    v7 = self->_primaryDestination;
    self->_primaryDestination = v5;

    primaryDestination = self->_primaryDestination;
  }
  return primaryDestination;
}

- (id)allValues
{
  return (id)-[NSSet copy](self->_allValues, "copy");
}

- (unint64_t)allValuesCount
{
  return -[NSSet count](self->_allValues, "count");
}

- (void)setPreferredReplyAs:(id)a3
{
  unint64_t v5;
  NSString *preferredReplyAs;
  NSObject *v7;
  NSString *name;
  NSString *abRecordGUID;
  NSString *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (unint64_t)a3;
  preferredReplyAs = self->_preferredReplyAs;
  if (v5 | (unint64_t)preferredReplyAs
    && !-[NSString isEqualToString:](preferredReplyAs, "isEqualToString:", v5))
  {
    _FKGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      abRecordGUID = self->_abRecordGUID;
      v10 = self->_preferredReplyAs;
      v11 = 136316418;
      v12 = "-[FKPerson setPreferredReplyAs:]";
      v13 = 1024;
      v14 = 348;
      v15 = 2112;
      v16 = name;
      v17 = 2112;
      v18 = abRecordGUID;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_211A80000, v7, OS_LOG_TYPE_DEFAULT, "%s (%d) \"updating preferredReplyAs for [%@] (GUID %@): %@ -> %@\", (uint8_t *)&v11, 0x3Au);
    }

    objc_storeStrong((id *)&self->_preferredReplyAs, a3);
    self->_needsSave = 1;
    -[FKPerson _postChangeNotification](self, "_postChangeNotification");
  }

}

- (id)_metadataDictionary
{
  return self->_metadata;
}

- (id)metadataValueForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  +[FKPerson sharedMetadataQueue](FKPerson, "sharedMetadataQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__FKPerson_metadataValueForKey___block_invoke;
  block[3] = &unk_24CCDFFC0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __32__FKPerson_metadataValueForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setMetadataValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  +[FKPerson sharedMetadataQueue](FKPerson, "sharedMetadataQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __36__FKPerson_setMetadataValue_forKey___block_invoke;
  v11[3] = &unk_24CCDFDC0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __36__FKPerson_setMetadataValue_forKey___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_metadataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setNeedsSave:", 1);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "_postChangeNotification");

}

- (void)addMetadataEntriesFromDictionary:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  +[FKPerson sharedMetadataQueue](FKPerson, "sharedMetadataQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__FKPerson_addMetadataEntriesFromDictionary___block_invoke;
  block[3] = &unk_24CCDFBE0;
  objc_copyWeak(&v10, &location);
  v9 = v5;
  v7 = v5;
  dispatch_barrier_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __45__FKPerson_addMetadataEntriesFromDictionary___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_metadataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setNeedsSave:", 1);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "_postChangeNotification");

}

- (void)removeAllMetadataValues
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  +[FKPerson sharedMetadataQueue](FKPerson, "sharedMetadataQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__FKPerson_removeAllMetadataValues__block_invoke;
  v3[3] = &unk_24CCDFBB8;
  objc_copyWeak(&v4, &location);
  dispatch_barrier_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __35__FKPerson_removeAllMetadataValues__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_metadataDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setNeedsSave:", 1);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "_postChangeNotification");

}

- (NSDictionary)metadata
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  +[FKPerson sharedMetadataQueue](FKPerson, "sharedMetadataQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __20__FKPerson_metadata__block_invoke;
  v6[3] = &unk_24CCDFF28;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __20__FKPerson_metadata__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FKPerson displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FKPerson primaryDestination](self, "primaryDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p [%@]:%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)copyABPersonWithAddressBook:(void *)a3
{
  void *result;

  result = -[NSString length](self->_abRecordGUID, "length");
  if (result)
    return (void *)ABAddressBookCopyPersonMatchingInternalUUID();
  return result;
}

- (id)abRecordGUID
{
  return self->_abRecordGUID;
}

- (void)_setABRecordGUID:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *abRecordGUID;
  const __CFString *v7;
  void *v8;
  id v9;
  NSString *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  v5 = v4;
  abRecordGUID = self->_abRecordGUID;
  if (abRecordGUID)
  {
    if (-[NSString length](v4, "length"))
      v7 = (const __CFString *)v5;
    else
      v7 = &stru_24CCE02E8;
    if (!-[NSString isEqualToString:](abRecordGUID, "isEqualToString:", v7))
    {
      objc_initWeak(&location, self);
      v15 = CFSTR("UnlinkedABGUID");
      v16[0] = self->_abRecordGUID;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __29__FKPerson__setABRecordGUID___block_invoke;
      v11[3] = &unk_24CCDFBE0;
      objc_copyWeak(&v13, &location);
      v12 = v8;
      v9 = v8;
      dispatch_async(MEMORY[0x24BDAC9B8], v11);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  v10 = self->_abRecordGUID;
  self->_abRecordGUID = v5;

}

void __29__FKPerson__setABRecordGUID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("FKPersonUnlinkedFromAddressBookNotification"), WeakRetained, *(_QWORD *)(a1 + 32));

}

- (id)abDatabaseUID
{
  return self->_abDatabaseUID;
}

- (id)initials
{
  return (id)-[NSString copy](self->_initials, "copy");
}

- (BOOL)hasName
{
  return -[NSString length](self->_name, "length") != 0;
}

- (BOOL)isEqualToDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  NSString *abRecordGUID;
  char v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("ABRecordGUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  abRecordGUID = self->_abRecordGUID;
  if ((v5 == 0) == (abRecordGUID != 0))
  {
    v7 = 0;
  }
  else if (abRecordGUID)
  {
    v7 = -[NSString isEqualToString:](abRecordGUID, "isEqualToString:", v5);
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AllValues"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v16 != v12)
              objc_enumerationMutation(v9);
            if (-[NSSet containsObject:](self->_allValues, "containsObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15))
            {
              v7 = 1;
              goto LABEL_16;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v11)
            continue;
          break;
        }
      }
      v7 = 0;
LABEL_16:

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (BOOL)isLikePerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *abRecordGUID;
  BOOL v8;
  BOOL v9;
  void *v10;
  NSSet *allValues;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "abRecordGUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    abRecordGUID = self->_abRecordGUID;
    if (abRecordGUID)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8 || !-[NSString isEqualToString:](abRecordGUID, "isEqualToString:", v6))
    {
      objc_msgSend(v5, "allValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      allValues = self->_allValues;
      v9 = allValues && v10 && -[NSSet intersectsSet:](allValues, "intersectsSet:", v10);

    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_postChangeNotification
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __35__FKPerson__postChangeNotification__block_invoke;
  v2[3] = &unk_24CCDFBB8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __35__FKPerson__postChangeNotification__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("FKPersonValuesChangedNotification"), WeakRetained);

}

- (void)_reconcile:(void *)a3 canPostChangeNotification:(BOOL)a4 shouldLogUpdates:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  int v9;
  const void *v10;
  const void *v11;
  ABRecordID RecordID;
  int v13;
  NSObject *v14;
  NSString *abRecordGUID;
  int abRecordID;
  uint64_t v17;
  NSString *name;
  NSObject *v19;
  NSString *v20;
  NSString *v21;
  uint64_t v22;
  NSSet *allValues;
  NSObject *v24;
  NSString *v25;
  NSSet *v26;
  NSString *primaryDestination;
  NSNumber *phoneNumberCount;
  NSNumber *emailAddressCount;
  void *v30;
  NSObject *v31;
  NSString *v32;
  NSObject *v33;
  BOOL v34;
  NSUInteger v35;
  NSObject *v36;
  NSString *v37;
  NSString *initials;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  NSString *v44;
  __int16 v45;
  _BYTE v46[10];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return;
  v5 = a5;
  v6 = a4;
  v8 = (void *)ABAddressBookCopyUniqueIdentifier();
  if (v8 && !-[NSString isEqualToString:](self->_abDatabaseUID, "isEqualToString:", v8))
  {
    objc_storeStrong((id *)&self->_abDatabaseUID, v8);
    v9 = 1;
    self->_needsSave = 1;
  }
  else
  {
    v9 = 0;
  }
  if (self->_abRecordGUID && (v10 = (const void *)ABAddressBookCopyPersonMatchingInternalUUID()) != 0)
  {
    v11 = v10;
    RecordID = ABRecordGetRecordID(v10);
    if (self->_abRecordID != RecordID)
    {
      v13 = RecordID;
      if (v5)
      {
        _FKGetLogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          abRecordGUID = self->_abRecordGUID;
          abRecordID = self->_abRecordID;
          *(_DWORD *)buf = 136316162;
          v40 = "-[FKPerson _reconcile:canPostChangeNotification:shouldLogUpdates:]";
          v41 = 1024;
          v42 = 536;
          v43 = 2112;
          v44 = abRecordGUID;
          v45 = 1024;
          *(_DWORD *)v46 = abRecordID;
          *(_WORD *)&v46[4] = 1024;
          *(_DWORD *)&v46[6] = v13;
          _os_log_impl(&dword_211A80000, v14, OS_LOG_TYPE_DEFAULT, "%s (%d) \"updating AB record ID for friend with GUID %@: %d -> %d\", buf, 0x28u);
        }

      }
      self->_abRecordID = v13;
      v9 = 1;
      self->_needsSave = 1;
    }
    +[FKPerson preferredNameForPerson:](FKPerson, "preferredNameForPerson:", v11);
    v17 = objc_claimAutoreleasedReturnValue();
    name = self->_name;
    if ((unint64_t)name | v17 && !-[NSString isEqualToString:](name, "isEqualToString:", v17))
    {
      if (v5)
      {
        _FKGetLogSystem();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = self->_abRecordGUID;
          v21 = self->_name;
          *(_DWORD *)buf = 136316162;
          v40 = "-[FKPerson _reconcile:canPostChangeNotification:shouldLogUpdates:]";
          v41 = 1024;
          v42 = 546;
          v43 = 2112;
          v44 = v20;
          v45 = 2112;
          *(_QWORD *)v46 = v21;
          *(_WORD *)&v46[8] = 2112;
          v47 = v17;
          _os_log_impl(&dword_211A80000, v19, OS_LOG_TYPE_DEFAULT, "%s (%d) \"updating name for friend with GUID %@: [%@] -> [%@]\", buf, 0x30u);
        }

      }
      objc_storeStrong((id *)&self->_name, (id)v17);
      v9 = 1;
      self->_needsSave = 1;
    }
    +[FKPerson allValuesForPerson:](FKPerson, "allValuesForPerson:", v11);
    v22 = objc_claimAutoreleasedReturnValue();
    allValues = self->_allValues;
    if ((unint64_t)allValues | v22 && !-[NSSet isEqualToSet:](allValues, "isEqualToSet:", v22))
    {
      if (v5)
      {
        _FKGetLogSystem();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = self->_abRecordGUID;
          v26 = self->_allValues;
          *(_DWORD *)buf = 136316162;
          v40 = "-[FKPerson _reconcile:canPostChangeNotification:shouldLogUpdates:]";
          v41 = 1024;
          v42 = 556;
          v43 = 2112;
          v44 = v25;
          v45 = 2112;
          *(_QWORD *)v46 = v26;
          *(_WORD *)&v46[8] = 2112;
          v47 = v22;
          _os_log_impl(&dword_211A80000, v24, OS_LOG_TYPE_DEFAULT, "%s (%d) \"updated destinations for friend with GUID %@: %@ -> %@\", buf, 0x30u);
        }

      }
      objc_storeStrong((id *)&self->_allValues, (id)v22);
      primaryDestination = self->_primaryDestination;
      self->_primaryDestination = 0;

      phoneNumberCount = self->_phoneNumberCount;
      self->_phoneNumberCount = 0;

      emailAddressCount = self->_emailAddressCount;
      self->_emailAddressCount = 0;

      v9 = 1;
      self->_needsSave = 1;
    }

    +[FKUtility initialsForPerson:](FKUtility, "initialsForPerson:", v11);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[NSSet count](self->_allValues, "count") && -[NSString length](self->_name, "length"))
    {
      _FKGetLogSystem();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = self->_name;
        *(_DWORD *)buf = 136315650;
        v40 = "-[FKPerson _reconcile:canPostChangeNotification:shouldLogUpdates:]";
        v41 = 1024;
        v42 = 571;
        v43 = 2112;
        v44 = v32;
        _os_log_impl(&dword_211A80000, v31, OS_LOG_TYPE_DEFAULT, "%s (%d) \"friend needs a full AB lookup, searching with name: %@\", buf, 0x1Cu);
      }

      ABAddressBookCopyPeopleAndIdentifiersMatchingName();
    }
    _FKGetLogSystem();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[FKPerson _reconcile:canPostChangeNotification:shouldLogUpdates:]";
      v41 = 1024;
      v42 = 600;
      _os_log_impl(&dword_211A80000, v33, OS_LOG_TYPE_DEFAULT, "%s (%d) \"unable to find matching record using name\", buf, 0x12u);
    }

    if (self->_abRecordID != -1)
    {
      self->_abRecordID = -1;
      -[FKPerson _setABRecordGUID:](self, "_setABRecordGUID:", 0);
      v9 = 1;
      self->_needsSave = 1;
    }
    +[FKUtility initialForString:](FKUtility, "initialForString:", self->_name);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
  }
  if (objc_msgSend(v30, "length"))
  {
    if (v30)
      goto LABEL_47;
    v34 = 0;
  }
  else
  {
    v35 = -[NSString length](self->_initials, "length");
    v34 = v35 == 0;
    if (v30)
    {
      if (v35)
        goto LABEL_47;
      goto LABEL_53;
    }
  }
  if (self->_initials && !v34)
  {
LABEL_47:
    if ((objc_msgSend(v30, "isEqualToString:", self->_initials) & 1) == 0)
    {
      if (v5)
      {
        _FKGetLogSystem();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = self->_abRecordGUID;
          initials = self->_initials;
          *(_DWORD *)buf = 136316162;
          v40 = "-[FKPerson _reconcile:canPostChangeNotification:shouldLogUpdates:]";
          v41 = 1024;
          v42 = 615;
          v43 = 2112;
          v44 = v37;
          v45 = 2112;
          *(_QWORD *)v46 = initials;
          *(_WORD *)&v46[8] = 2112;
          v47 = (uint64_t)v30;
          _os_log_impl(&dword_211A80000, v36, OS_LOG_TYPE_DEFAULT, "%s (%d) \"updating monogram for friend with GUID %@: [%@] -> [%@]\", buf, 0x30u);
        }

      }
      objc_storeStrong((id *)&self->_initials, v30);
      v9 = 1;
      self->_needsSave = 1;
    }
  }
LABEL_53:
  if (v11)
    CFRelease(v11);
  if ((v9 & v6) == 1)
    -[FKPerson _postChangeNotification](self, "_postChangeNotification");

}

+ (id)preferredNameForPerson:(void *)a3
{
  uint64_t v4;
  const void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v4 = ABPersonCopyPreferredLinkedPersonForName();
    v5 = (const void *)v4;
    if (v4)
      v6 = (void *)v4;
    else
      v6 = a3;
    if (ABPersonGetShortNameFormatEnabled())
      v7 = (void *)ABPersonCopyShortName();
    else
      v7 = 0;
    if (ABPersonGetShortNamePreferNicknames())
      v9 = (void *)ABRecordCopyValue(v6, *MEMORY[0x24BE02858]);
    else
      v9 = 0;
    v10 = (void *)ABPersonCopyCompositeName();
    if (v5)
      CFRelease(v5);
    if (v7)
      v11 = v7;
    else
      v11 = v10;
    if (v9)
      v11 = v9;
    v8 = v11;

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)allValuesForPerson:(void *)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FKPerson _allEmailValuesForRecord:](FKPerson, "_allEmailValuesForRecord:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FKPerson _allPhoneValuesForRecord:](FKPerson, "_allPhoneValuesForRecord:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);
    objc_msgSend(v4, "addObjectsFromArray:", v6);
    if (+[FKUtility personHasLinkages:](FKUtility, "personHasLinkages:", a3))
    {
      v16 = v5;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = ABPersonCopyArrayOfAllLinkedPeople(a3);
      v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
            if (v12 != a3)
            {
              +[FKPerson _allEmailValuesForRecord:](FKPerson, "_allEmailValuesForRecord:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              +[FKPerson _allPhoneValuesForRecord:](FKPerson, "_allPhoneValuesForRecord:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObjectsFromArray:", v13);
              objc_msgSend(v4, "addObjectsFromArray:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = -[__CFArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v9);
      }

      v5 = v16;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_recordMatchDictionaryFromCFArray:(__CFArray *)a3 followLinks:(BOOL)a4 addressBook:(void *)a5
{
  _BOOL4 v6;
  void *v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex i;
  const void *ValueAtIndex;
  ABRecordRef PersonWithRecordID;
  uint64_t RecordID;
  uint64_t IntValue;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    v10 = Count;
    for (i = 0; i != v10; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
      if (ValueAtIndex)
      {
        PersonWithRecordID = ValueAtIndex;
        RecordID = ABRecordGetRecordID(ValueAtIndex);
        if (v6)
        {
          IntValue = ABRecordGetIntValue();
          if ((_DWORD)IntValue != -1)
          {
            v16 = IntValue;
            PersonWithRecordID = ABAddressBookGetPersonWithRecordID(a5, IntValue);
            RecordID = v16;
          }
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", RecordID);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (PersonWithRecordID)
        {
          objc_msgSend(v8, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            +[FKPerson allValuesForPerson:](FKPerson, "allValuesForPerson:", PersonWithRecordID);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v19, v17);

          }
        }

      }
    }
  }
  return v8;
}

- (float)_allValuesMatchScore:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  float v8;

  v4 = a3;
  v5 = (void *)-[NSSet mutableCopy](self->_allValues, "mutableCopy");
  objc_msgSend(v5, "intersectSet:", v4);
  v6 = objc_msgSend(v5, "count");
  v7 = -[NSSet count](self->_allValues, "count");
  v8 = (float)v6 / (float)v7;
  if (v6 == v7)
    v8 = v8 + (float)((float)(objc_msgSend(v4, "count") - v6) * (float)(1.0 / (float)v7));

  return v8;
}

- (void)_bestRecordMatchFromDictionary:(id)a3 addressBook:(void *)a4
{
  id v6;
  ABRecordID v7;
  ABRecordRef PersonWithRecordID;
  _QWORD v10[7];
  _QWORD v11[3];
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = -1;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__FKPerson__bestRecordMatchFromDictionary_addressBook___block_invoke;
  v10[3] = &unk_24CCDFFE8;
  v10[4] = self;
  v10[5] = v11;
  v10[6] = &v13;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
  v7 = *((_DWORD *)v14 + 6);
  if (v7 == -1)
    PersonWithRecordID = 0;
  else
    PersonWithRecordID = ABAddressBookGetPersonWithRecordID(a4, v7);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  return (void *)PersonWithRecordID;
}

void __55__FKPerson__bestRecordMatchFromDictionary_addressBook___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  float v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_allValuesMatchScore:", a3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v5 > *(float *)(v6 + 24))
  {
    *(float *)(v6 + 24) = v5;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v7, "intValue");
  }

}

+ (id)_allPhoneValuesForRecord:(void *)a3
{
  CFTypeRef v3;
  const void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v3 = ABRecordCopyValue(a3, *MEMORY[0x24BE028C0]);
    v4 = v3;
    if (v3)
    {
      v5 = (uint64_t)ABMultiValueCopyArrayOfAllValues(v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v5;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fkSanitizedDestinationSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      CFRelease(v4);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)_allPhoneValuesInSet:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "fkMessageDestinationType", (_QWORD)v12) == 1)
            objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_allEmailValuesForRecord:(void *)a3
{
  CFTypeRef v3;
  const void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v3 = ABRecordCopyValue(a3, *MEMORY[0x24BE02718]);
    v4 = v3;
    if (v3)
    {
      v5 = (uint64_t)ABMultiValueCopyArrayOfAllValues(v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v5;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fkSanitizedDestinationSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      CFRelease(v4);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)_allEmailValuesInSet:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "fkMessageDestinationType", (_QWORD)v12) == 2)
            objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int)addValue:(void *)a3 withLabel:(__CFString *)a4 toPerson:(void *)a5 property:(int)a6
{
  CFTypeRef v11;
  const void *v12;
  ABMutableMultiValueRef MutableCopy;
  ABPropertyType TypeOfProperty;
  ABMultiValueIdentifier outIdentifier;

  outIdentifier = -1;
  if ((ABPersonGetTypeOfProperty(a6) & 0x100) != 0)
  {
    v11 = ABRecordCopyValue(a5, a6);
    if (v11)
    {
      v12 = v11;
      MutableCopy = ABMultiValueCreateMutableCopy(v11);
      CFRelease(v12);
    }
    else
    {
      TypeOfProperty = ABPersonGetTypeOfProperty(a6);
      MutableCopy = ABMultiValueCreateMutable(TypeOfProperty);
    }
    ABMultiValueAddValueAndLabel(MutableCopy, a3, a4, &outIdentifier);
    ABRecordSetValue(a5, a6, MutableCopy, 0);
    CFRelease(MutableCopy);
    return outIdentifier;
  }
  else
  {
    ABRecordSetValue(a5, a6, a3, 0);
    return -1;
  }
}

- (BOOL)hasUnreadMessages
{
  return self->_hasUnreadMessages;
}

- (NSString)preferredReplyAs
{
  return self->_preferredReplyAs;
}

- (BOOL)needsSave
{
  return self->_needsSave;
}

- (void)setNeedsSave:(BOOL)a3
{
  self->_needsSave = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredReplyAs, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_allValues, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_abDatabaseUID, 0);
  objc_storeStrong((id *)&self->_abRecordGUID, 0);
  objc_storeStrong((id *)&self->_emailAddressCount, 0);
  objc_storeStrong((id *)&self->_phoneNumberCount, 0);
  objc_storeStrong((id *)&self->_initials, 0);
  objc_storeStrong((id *)&self->_primaryDestination, 0);
}

@end
