@implementation CNContact

id __63__CNContact_areKeysAvailable_useIgnorableKeys_findMissingKeys___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isKeyAvailable:", v3))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "CNValueForContact:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(*(id *)(a1 + 40), "containsKey:", v3))
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "nilValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 48), "addKey:", v3);
    v6 = 0;
  }

  return v6;
}

+ (id)alwaysFetchedKeys
{
  if (alwaysFetchedKeys_cn_once_token_1 != -1)
    dispatch_once(&alwaysFetchedKeys_cn_once_token_1, &__block_literal_global_3_10);
  return (id)alwaysFetchedKeys_cn_once_object_1;
}

- (CNContact)initWithIdentifier:(id)a3 availableKeyDescriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CNContact *v9;
  uint64_t v10;
  NSString *internalIdentifier;
  uint64_t v12;
  CNContactKeyVector *availableKeyDescriptor;
  void *v14;
  uint64_t v15;
  NSArray *phoneNumbers;
  uint64_t v17;
  NSArray *emailAddresses;
  uint64_t v19;
  NSArray *urlAddresses;
  uint64_t v21;
  NSArray *dates;
  uint64_t v23;
  NSArray *instantMessageAddresses;
  uint64_t v25;
  NSArray *contactRelations;
  uint64_t v27;
  NSArray *socialProfiles;
  uint64_t v29;
  NSArray *postalAddresses;
  uint64_t v31;
  NSArray *calendarURIs;
  uint64_t v33;
  NSArray *addressingGrammars;
  uint64_t v35;
  NSArray *addressingGrammarsEncrypted;
  NSArray *v37;
  NSArray *linkedContacts;
  uint64_t v39;
  NSDate *creationDate;
  CNContact *v41;
  objc_super v43;

  v6 = a3;
  v7 = a4;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_6 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_6, &__block_literal_global_712);
    v8 = (void *)CNGuardOSLog_cn_once_object_0_6;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_6, OS_LOG_TYPE_FAULT))
      -[CNContact initWithIdentifier:availableKeyDescriptor:].cold.1(v8);
  }
  v43.receiver = self;
  v43.super_class = (Class)CNContact;
  v9 = -[CNContact init](&v43, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    internalIdentifier = v9->_internalIdentifier;
    v9->_internalIdentifier = (NSString *)v10;

    v12 = objc_msgSend(v7, "copy");
    availableKeyDescriptor = v9->_availableKeyDescriptor;
    v9->_availableKeyDescriptor = (CNContactKeyVector *)v12;

    v9->_displayNameOrder = 0;
    v9->_sharedPhotoDisplayPreference = 0;
    *(_WORD *)&v9->_preferredForName = 1;
    v9->_iOSLegacyIdentifier = -1;
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    phoneNumbers = v9->_phoneNumbers;
    v9->_phoneNumbers = (NSArray *)v15;

    v17 = objc_msgSend(v14, "copy");
    emailAddresses = v9->_emailAddresses;
    v9->_emailAddresses = (NSArray *)v17;

    v19 = objc_msgSend(v14, "copy");
    urlAddresses = v9->_urlAddresses;
    v9->_urlAddresses = (NSArray *)v19;

    v21 = objc_msgSend(v14, "copy");
    dates = v9->_dates;
    v9->_dates = (NSArray *)v21;

    v23 = objc_msgSend(v14, "copy");
    instantMessageAddresses = v9->_instantMessageAddresses;
    v9->_instantMessageAddresses = (NSArray *)v23;

    v25 = objc_msgSend(v14, "copy");
    contactRelations = v9->_contactRelations;
    v9->_contactRelations = (NSArray *)v25;

    v27 = objc_msgSend(v14, "copy");
    socialProfiles = v9->_socialProfiles;
    v9->_socialProfiles = (NSArray *)v27;

    v29 = objc_msgSend(v14, "copy");
    postalAddresses = v9->_postalAddresses;
    v9->_postalAddresses = (NSArray *)v29;

    v31 = objc_msgSend(v14, "copy");
    calendarURIs = v9->_calendarURIs;
    v9->_calendarURIs = (NSArray *)v31;

    v33 = objc_msgSend(v14, "copy");
    addressingGrammars = v9->_addressingGrammars;
    v9->_addressingGrammars = (NSArray *)v33;

    v35 = objc_msgSend(v14, "copy");
    addressingGrammarsEncrypted = v9->_addressingGrammarsEncrypted;
    v9->_addressingGrammarsEncrypted = (NSArray *)v35;

    v37 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    linkedContacts = v9->_linkedContacts;
    v9->_linkedContacts = v37;

    if (objc_msgSend(v7, "containsKey:", CFSTR("creationDate")))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v39 = objc_claimAutoreleasedReturnValue();
      creationDate = v9->_creationDate;
      v9->_creationDate = (NSDate *)v39;

    }
    v41 = v9;

  }
  return v9;
}

void __72__CNContact__contactWithContact_createNewInstance_propertyDescriptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v9 = v3;
  if (*(_BYTE *)(a1 + 48)
    || (v4 = *(void **)(a1 + 32),
        objc_msgSend(v3, "key"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v4) = objc_msgSend(v4, "isKeyAvailable:", v5),
        v5,
        v6 = v9,
        (_DWORD)v4))
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v9, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addKey:", v8);

    v6 = v9;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropRectHash, 0);
  objc_storeStrong((id *)&self->_cropRectID, 0);
  objc_storeStrong((id *)&self->_wallpaperSyncFailedTime, 0);
  objc_storeStrong((id *)&self->_imageSyncFailedTime, 0);
  objc_storeStrong((id *)&self->_sensitiveContentConfiguration, 0);
  objc_storeStrong((id *)&self->_imageBackgroundColorsData, 0);
  objc_storeStrong((id *)&self->_wallpaperURI, 0);
  objc_storeStrong((id *)&self->_watchWallpaperImageData, 0);
  objc_storeStrong((id *)&self->_wallpaperMetadata, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_memojiMetadata, 0);
  objc_storeStrong((id *)&self->_imageHash, 0);
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_downtimeWhitelist, 0);
  objc_storeStrong((id *)&self->_ISOCountryCode, 0);
  objc_storeStrong((id *)&self->_preferredChannel, 0);
  objc_storeStrong((id *)&self->_preferredApplePersonaIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredLikenessSource, 0);
  objc_storeStrong((id *)&self->_searchIndex, 0);
  objc_storeStrong((id *)&self->_mapsData, 0);
  objc_storeStrong((id *)&self->_availableKeyDescriptor, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_linkedContacts, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_storeInfo, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_textAlert, 0);
  objc_storeStrong((id *)&self->_callAlert, 0);
  objc_storeStrong((id *)&self->_externalImageURI, 0);
  objc_storeStrong((id *)&self->_externalUUID, 0);
  objc_storeStrong((id *)&self->_externalModificationTag, 0);
  objc_storeStrong((id *)&self->_externalRepresentation, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_cardDAVUID, 0);
  objc_storeStrong((id *)&self->_calendarURIs, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_contactRelations, 0);
  objc_storeStrong((id *)&self->_instantMessageAddresses, 0);
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_urlAddresses, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_phonemeData, 0);
  objc_storeStrong((id *)&self->_linkIdentifier, 0);
  objc_storeStrong((id *)&self->_syncImageData, 0);
  objc_storeStrong((id *)&self->_fullscreenImageData, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_nonGregorianBirthday, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_departmentName, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_sectionForSortingByFamilyName, 0);
  objc_storeStrong((id *)&self->_sectionForSortingByGivenName, 0);
  objc_storeStrong((id *)&self->_sortingFamilyName, 0);
  objc_storeStrong((id *)&self->_sortingGivenName, 0);
  objc_storeStrong((id *)&self->_addressingGrammarsEncrypted, 0);
  objc_storeStrong((id *)&self->_addressingGrammars, 0);
  objc_storeStrong((id *)&self->_explicitDisplayName, 0);
  objc_storeStrong((id *)&self->_pronunciationFamilyName, 0);
  objc_storeStrong((id *)&self->_pronunciationGivenName, 0);
  objc_storeStrong((id *)&self->_phoneticOrganizationName, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_previousFamilyName, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_internalIdentifier, 0);
}

void __29__CNContact_encodeWithCoder___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v5, "encodeUsingCoder:contact:", v3, v4);
  v6 = (void *)a1[6];
  objc_msgSend(v5, "key");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v7);
}

uint64_t __27__CNContact_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "decodeUsingCoder:contact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD aBlock[5];
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x1E0D13A78];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __17__CNContact_hash__block_invoke;
  v7[3] = &unk_1E29F7D98;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __17__CNContact_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

+ (id)_contactWithContact:(id)a3 createNewInstance:(BOOL)a4 propertyDescriptions:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  CNMutableContactKeyVector *v11;
  id *v12;
  CNMutableContactKeyVector *v13;
  CNMutableContact *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  CNContact *snapshot;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *accountIdentifier;
  void *v35;
  void *v36;
  CNMutableContact *v37;
  CNMutableContact *v38;
  CNMutableContactKeyVector *v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  BOOL v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id *v52;
  CNMutableContactKeyVector *v53;
  BOOL v54;
  _BYTE v55[128];
  uint64_t v56;

  v6 = a4;
  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_6 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_6, &__block_literal_global_712);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_6, OS_LOG_TYPE_FAULT))
  {
    +[CNContact _contactWithContact:createNewInstance:propertyDescriptions:].cold.2();
    if (v9)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v9)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_6 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_6, &__block_literal_global_712);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_6, OS_LOG_TYPE_FAULT))
    +[CNContact _contactWithContact:createNewInstance:propertyDescriptions:].cold.1();
LABEL_10:
  v42 = a1;
  if (v6)
    objc_msgSend(a1, "makeIdentifier");
  else
    objc_msgSend(v8, "internalIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(CNMutableContactKeyVector);
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __72__CNContact__contactWithContact_createNewInstance_propertyDescriptions___block_invoke;
  v51[3] = &unk_1E29FC458;
  v54 = v6;
  v12 = (id *)v8;
  v52 = v12;
  v13 = v11;
  v53 = v13;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v51);
  v40 = v13;
  v41 = (void *)v10;
  v14 = -[CNContact initWithIdentifier:availableKeyDescriptor:]([CNMutableContact alloc], "initWithIdentifier:availableKeyDescriptor:", v10, v13);
  +[CN alwaysFetchedProperties](CN, "alwaysFetchedProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[CN runtimeOnlyProperties](CN, "runtimeOnlyProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v48 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v24, "key");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v12, "isKeyAvailable:", v25);

        if (v26)
        {
          objc_msgSend(v24, "CNValueForContact:", v12);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
            objc_msgSend(v24, "valueWithResetIdentifiers:", v27);
            v28 = objc_claimAutoreleasedReturnValue();

            v27 = (void *)v28;
          }
        }
        else
        {
          if (!v6)
            continue;
          objc_msgSend(v24, "nilValue");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v24, "setCNValue:onContact:", v27, v14);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v21);
  }

  v29 = objc_msgSend(v12[67], "copy");
  snapshot = v14->super._snapshot;
  v14->super._snapshot = (CNContact *)v29;

  if (objc_msgSend(v12, "isUnified"))
  {
    objc_msgSend(v12, "linkedContacts");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __72__CNContact__contactWithContact_createNewInstance_propertyDescriptions___block_invoke_2;
    v43[3] = &unk_1E29FC480;
    v45 = v42;
    v46 = v6;
    v44 = v19;
    objc_msgSend(v31, "_cn_map:", v43);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNMutableContact setLinkedContacts:](v14, "setLinkedContacts:", v32);
  }
  v33 = objc_msgSend(v12[69], "copy");
  accountIdentifier = v14->super._accountIdentifier;
  v14->super._accountIdentifier = (NSString *)v33;

  if (!v6)
  {
    objc_msgSend(v12, "storeIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setStoreIdentifier:](v14, "setStoreIdentifier:", v35);

    objc_msgSend(v12, "storeInfo");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setStoreInfo:](v14, "setStoreInfo:", v36);

  }
  if (objc_msgSend(v42, "isSubclassOfClass:", objc_opt_class()))
  {
    v37 = v14;
  }
  else
  {
    -[CNMutableContact freeze](v14, "freeze");
    v37 = (CNMutableContact *)objc_claimAutoreleasedReturnValue();
  }
  v38 = v37;

  return v38;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  const __CFString *givenName;
  id v7;
  const __CFString *familyName;
  id v9;
  const __CFString *organizationName;
  id v11;
  NSArray *phoneNumbers;
  id v13;
  NSArray *emailAddresses;
  id v15;
  NSArray *postalAddresses;
  id v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"), v4);

  if (-[CNContact isKeyAvailable:](self, "isKeyAvailable:", CFSTR("givenName")))
    givenName = (const __CFString *)self->_givenName;
  else
    givenName = CFSTR("(not fetched)");
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("givenName"), givenName);
  if (-[CNContact isKeyAvailable:](self, "isKeyAvailable:", CFSTR("familyName")))
    familyName = (const __CFString *)self->_familyName;
  else
    familyName = CFSTR("(not fetched)");
  v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("familyName"), familyName);
  if (-[CNContact isKeyAvailable:](self, "isKeyAvailable:", CFSTR("organizationName")))
    organizationName = (const __CFString *)self->_organizationName;
  else
    organizationName = CFSTR("(not fetched)");
  v11 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("organizationName"), organizationName);
  if (-[CNContact isKeyAvailable:](self, "isKeyAvailable:", CFSTR("phoneNumbers")))
    phoneNumbers = self->_phoneNumbers;
  else
    phoneNumbers = (NSArray *)CFSTR("(not fetched)");
  v13 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("phoneNumbers"), phoneNumbers);
  if (-[CNContact isKeyAvailable:](self, "isKeyAvailable:", CFSTR("emailAddresses")))
    emailAddresses = self->_emailAddresses;
  else
    emailAddresses = (NSArray *)CFSTR("(not fetched)");
  v15 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("emailAddresses"), emailAddresses);
  if (-[CNContact isKeyAvailable:](self, "isKeyAvailable:", CFSTR("postalAddresses")))
    postalAddresses = self->_postalAddresses;
  else
    postalAddresses = (NSArray *)CFSTR("(not fetched)");
  v17 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("postalAddresses"), postalAddresses);
  objc_msgSend(v3, "build");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (BOOL)isKeyAvailable:(NSString *)key
{
  return -[CNContactKeyVector containsKey:](self->_availableKeyDescriptor, "containsKey:", key);
}

- (BOOL)areKeysAvailable:(NSArray *)keyDescriptors
{
  void *v3;
  void *v4;
  char v5;

  -[CNContact areKeysAvailable:useIgnorableKeys:findMissingKeys:](self, "areKeysAvailable:useIgnorableKeys:findMissingKeys:", keyDescriptors, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)areKeysAvailable:(id)a3 useIgnorableKeys:(BOOL)a4 findMissingKeys:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  BOOL v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id obj;
  CNMutableContactKeyVector *v32;
  CNContact *v33;
  _BOOL4 v34;
  _QWORD v35[4];
  void *v36;
  _QWORD v37[5];
  id v38;
  CNMutableContactKeyVector *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v5 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v33 = self;
  v29 = v7;
  if (self->_availableKeyDescriptor)
  {
    v8 = v7;
    v34 = v5;
    if (v5)
      v32 = objc_alloc_init(CNMutableContactKeyVector);
    else
      v32 = 0;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v46;
      v12 = 1;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v46 != v11)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          if (_CNIsObject_CNKeyDescriptorPrivate(v14))
          {
            if (a4)
              objc_msgSend(v14, "_cn_ignorableKeys");
            else
              +[CNContactKeyVector keyVector](CNContactKeyVector, "keyVector");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "_cn_requiredKeys");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "keyVectorByRemovingKeysFromKeyVector:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v17, "isSubsetOfKeyVector:", v33->_availableKeyDescriptor) & 1) == 0)
            {
              if (!v34)
              {

                v12 = 0;
                v24 = 0;
                goto LABEL_34;
              }
              -[CNMutableContactKeyVector unionKeyVector:](v32, "unionKeyVector:", v17);
              -[CNMutableContactKeyVector minusKeyVector:](v32, "minusKeyVector:", v33->_availableKeyDescriptor);
              v12 = 0;
            }
            objc_msgSend(v14, "_cn_optionalKeys");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[CNContactKeyVector keyVector](CNContactKeyVector, "keyVector");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "isEqualToKeyVector:", v19);

            if ((v20 & 1) == 0)
            {
              v41 = 0;
              v42 = &v41;
              v43 = 0x2020000000;
              v44 = 0;
              v37[0] = MEMORY[0x1E0C809B0];
              v37[1] = 3221225472;
              v37[2] = __63__CNContact_areKeysAvailable_useIgnorableKeys_findMissingKeys___block_invoke;
              v37[3] = &unk_1E29FC598;
              v37[4] = v33;
              v21 = v15;
              v38 = v21;
              v40 = &v41;
              v39 = v32;
              objc_msgSend(v14, "_cn_executeGetterForRepresentedKeys:", v37);
              v22 = *((_BYTE *)v42 + 24) == 0;
              v23 = !*((_BYTE *)v42 + 24) || v34;

              v12 &= v22;
              _Block_object_dispose(&v41, 8);
              if (!v23)
              {

                goto LABEL_32;
              }
            }

          }
          else
          {
            v12 = 0;
            if (!v34)
            {
              v24 = 0;
              goto LABEL_35;
            }
          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v12 = 1;
    }
LABEL_32:

    if (v34)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __63__CNContact_areKeysAvailable_useIgnorableKeys_findMissingKeys___block_invoke_2;
      v35[3] = &unk_1E29F9C50;
      v36 = v25;
      obj = v25;
      -[CNContactKeyVector enumeratePropertiesUsingBlock:](v32, "enumeratePropertiesUsingBlock:", v35);
      objc_msgSend(obj, "allObjects");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v36;
LABEL_34:

LABEL_35:
    }
    else
    {
      v24 = 0;
    }
    v26 = (void *)MEMORY[0x1E0D13AF8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12 & 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pairWithFirst:second:", v27, v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", MEMORY[0x1E0C9AAB0], 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

uint64_t __21__CNContact_isEqual___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (!v3)
    goto LABEL_6;
LABEL_7:

  return v6;
}

uint64_t __17__CNContact_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "internalIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __17__CNContact_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "storeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  objc_class *v5;
  objc_class *v6;
  uint64_t v7;

  -[CNContact internalIdentifier](self, "internalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact storeIdentifier](self, "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = +[CNContactStore storeClassWithIdentifier:](CNContactStore, "storeClassWithIdentifier:", v4);
    if (v5)
    {
      v6 = v5;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[objc_class contactIdentifierFromInternalIdentifier:](v6, "contactIdentifierFromInternalIdentifier:", v3);
        v7 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v7;
      }
    }
  }

  return (NSString *)v3;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSString)internalIdentifier
{
  return self->_internalIdentifier;
}

- (NSDictionary)storeInfo
{
  return self->_storeInfo;
}

- (NSString)wallpaperURI
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_wallpaperURI;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("wallpaperURI"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("wallpaperURI")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSData)syncImageData
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_syncImageData;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("syncImageData"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("syncImageData")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)sectionForSortingByGivenName
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_sectionForSortingByGivenName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("sectionForSortingByGivenName"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("sectionForSortingByGivenName")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)sectionForSortingByFamilyName
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_sectionForSortingByFamilyName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("sectionForSortingByFamilyName"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("sectionForSortingByFamilyName")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSDate)modificationDate
{
  NSDate *v3;
  NSDate *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_modificationDate;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("modificationDate"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("modificationDate")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)externalUUID
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_externalUUID;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("externalUUID"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("externalUUID")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSData)externalRepresentation
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_externalRepresentation;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("externalRepresentation"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("externalRepresentation")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)externalModificationTag
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_externalModificationTag;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("externalModificationTag"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("externalModificationTag")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)externalImageURI
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_externalImageURI;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("externalImageURI"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("externalImageURI")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)externalIdentifier
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_externalIdentifier;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("externalIdentifier"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("externalIdentifier")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (id)explicitDisplayName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_explicitDisplayName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("explicitDisplayName"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("explicitDisplayName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return v3;
}

- (NSDate)creationDate
{
  NSDate *v3;
  NSDate *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_creationDate;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("creationDate"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("creationDate")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSArray)addressingGrammarsEncrypted
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_addressingGrammarsEncrypted;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("addressingGrammarsEncrypted"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("addressingGrammarsEncrypted")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

void __30__CNContact_alwaysFetchedKeys__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[CN alwaysFetchedProperties](CN, "alwaysFetchedProperties");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_6_1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)alwaysFetchedKeys_cn_once_object_1;
  alwaysFetchedKeys_cn_once_object_1 = v2;

}

- (NSArray)phoneNumbers
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_phoneNumbers;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phoneNumbers"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("phoneNumbers")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (NSArray)emailAddresses
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_emailAddresses;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("emailAddresses"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("emailAddresses")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  CNContact *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD aBlock[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __21__CNContact_isEqual___block_invoke;
  v25[3] = &unk_1E29F7D70;
  v25[4] = self;
  v26 = v4;
  aBlock[0] = v7;
  aBlock[1] = 3221225472;
  aBlock[2] = __21__CNContact_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E29F7D70;
  aBlock[4] = self;
  v8 = v26;
  v24 = v8;
  v9 = _Block_copy(aBlock);
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __21__CNContact_isEqual___block_invoke_3;
  v21[3] = &unk_1E29F7D70;
  v21[4] = self;
  v10 = v8;
  v22 = v10;
  v11 = _Block_copy(v21);
  v15 = v7;
  v16 = 3221225472;
  v17 = __21__CNContact_isEqual___block_invoke_4;
  v18 = &unk_1E29F7D70;
  v19 = self;
  v20 = v10;
  v12 = v10;
  v13 = _Block_copy(&v15);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v12, v6, self, v25, v9, v11, v13, 0, v15, v16, v17, v18, v19);

  return (char)self;
}

- (NSString)nameSuffix
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_nameSuffix;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("nameSuffix"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("nameSuffix")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)namePrefix
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_namePrefix;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("namePrefix"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("namePrefix")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (CNContactType)contactType
{
  CNContactType contactType;
  CNContactKeyVector *availableKeyDescriptor;

  contactType = self->_contactType;
  availableKeyDescriptor = self->_availableKeyDescriptor;
  if (availableKeyDescriptor
    && !-[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("contactType")))
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }
  return contactType;
}

- (NSString)givenName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_givenName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("givenName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("givenName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)familyName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_familyName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("familyName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("familyName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)middleName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_middleName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("middleName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("middleName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

uint64_t __30__CNContact_alwaysFetchedKeys__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

void __31__CNContact_identifierProvider__block_invoke()
{
  CNUuidIdentifierProvider *v0;
  void *v1;

  v0 = -[CNUuidIdentifierProvider initWithSuffix:]([CNUuidIdentifierProvider alloc], "initWithSuffix:", CFSTR("ABPerson"));
  v1 = (void *)identifierProvider_cn_once_object_2;
  identifierProvider_cn_once_object_2 = (uint64_t)v0;

}

+ (CNContact)contactWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:", v4);

  return (CNContact *)v5;
}

- (CNContact)init
{
  void *v3;
  CNContact *v4;

  objc_msgSend((id)objc_opt_class(), "makeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNContact initWithIdentifier:](self, "initWithIdentifier:", v3);

  return v4;
}

- (CNContact)initWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  CNContact *v6;

  v4 = a3;
  +[CNContactKeyVector keyVectorWithAllKeys](CNContactKeyVector, "keyVectorWithAllKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContact initWithIdentifier:availableKeyDescriptor:](self, "initWithIdentifier:availableKeyDescriptor:", v4, v5);

  return v6;
}

+ (id)makeIdentifierString
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "identifierProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)identifierProvider
{
  if (identifierProvider_cn_once_token_2 != -1)
    dispatch_once(&identifierProvider_cn_once_token_2, &__block_literal_global_155_0);
  return (id)identifierProvider_cn_once_object_2;
}

- (unint64_t)flags
{
  return self->_flags;
}

void __34__CNContact_copyWithPropertyKeys___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  if (_CNIsObject_CNKeyDescriptorPrivate(v3))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __34__CNContact_copyWithPropertyKeys___block_invoke_2;
    v5[3] = &unk_1E29FC4C8;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    objc_msgSend(v3, "_cn_executeGetterForRepresentedKeys:", v5);

  }
}

- (id)linkedContactsFromStoreWithIdentifier:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (unint64_t)a3;
  -[CNContact linkedContacts](self, "linkedContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v12, "storeIdentifier");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v4 | v13)
          {
            v14 = (void *)v13;
            objc_msgSend(v12, "storeIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqual:", v4);

            if (!v16)
              continue;
          }
          objc_msgSend(v6, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    v5 = v18;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (BOOL)isUnifiedWithContactWithIdentifier:(NSString *)contactIdentifier
{
  NSString *v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = contactIdentifier;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))() && -[CNContact isUnified](self, "isUnified"))
  {
    -[CNContact identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", v4);

    if ((v6 & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v10[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CNContact isUnifiedWithContactsWithIdentifiers:](self, "isUnifiedWithContactsWithIdentifiers:", v9);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)allLinkedIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[CNContact identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CNContact isUnified](self, "isUnified"))
  {
    -[CNContact linkedContacts](self, "linkedContacts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cn_map:", &__block_literal_global_201);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

  }
  return v5;
}

- (BOOL)isUnified
{
  void *v3;
  BOOL v4;

  if (!-[CNContact isKeyAvailable:](self, "isKeyAvailable:", CFSTR("linkIdentifier")))
    return 0;
  -[CNContact linkedContacts](self, "linkedContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (int)iOSLegacyIdentifier
{
  return self->_iOSLegacyIdentifier;
}

- (NSArray)linkedContacts
{
  return self->_linkedContacts;
}

+ (id)predicateForLegacyIdentifier:(unsigned int)a3
{
  return -[CNiOSABContactLegacyIdentifierPredicate initWithLegacyIdentifier:]([CNiOSABContactLegacyIdentifierPredicate alloc], "initWithLegacyIdentifier:", *(_QWORD *)&a3);
}

- (NSArray)termsOfAddress
{
  void *v2;
  void *v3;

  -[CNContact addressingGrammars](self, "addressingGrammars");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_compactMap:", &__block_literal_global_210);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __34__CNContact_copyWithPropertyKeys___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(*(id *)(a1 + 32), "isKeyAvailable:", v3))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    objc_msgSend(v5, "CNValueForContact:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)nickname
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_nickname;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("nickname"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("nickname")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSArray)socialProfiles
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_socialProfiles;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("socialProfiles"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("socialProfiles")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (NSArray)instantMessageAddresses
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_instantMessageAddresses;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("instantMessageAddresses"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("instantMessageAddresses")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (NSArray)postalAddresses
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_postalAddresses;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("postalAddresses"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("postalAddresses")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (NSString)organizationName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_organizationName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("organizationName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("organizationName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)phoneticGivenName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_phoneticGivenName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phoneticGivenName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("phoneticGivenName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)phoneticFamilyName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_phoneticFamilyName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phoneticFamilyName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("phoneticFamilyName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (CNWallpaper)wallpaper
{
  CNWallpaper *v3;
  CNWallpaper *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_wallpaper;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (CNWallpaper *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("wallpaper"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("wallpaper")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)phoneticMiddleName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_phoneticMiddleName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phoneticMiddleName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("phoneticMiddleName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)phonemeData
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_phonemeData;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phonemeData"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("phonemeData")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)phoneticOrganizationName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_phoneticOrganizationName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("phoneticOrganizationName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("phoneticOrganizationName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[CNContact assertKeyIsAvailable:](self, "assertKeyIsAvailable:", CFSTR("cropRect"));
  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSString)downtimeWhitelist
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_downtimeWhitelist;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("downtimeWhitelist"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("downtimeWhitelist")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)pronunciationGivenName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_pronunciationGivenName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("pronunciationGivenName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("pronunciationGivenName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)pronunciationFamilyName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_pronunciationFamilyName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("pronunciationFamilyName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("pronunciationFamilyName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)previousFamilyName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_previousFamilyName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("previousFamilyName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("previousFamilyName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)jobTitle
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_jobTitle;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("jobTitle"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("jobTitle")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSString)departmentName
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_departmentName;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("departmentName"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("departmentName")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (BOOL)preferredForName
{
  _BOOL4 preferredForName;
  CNContactKeyVector *availableKeyDescriptor;

  preferredForName = self->_preferredForName;
  availableKeyDescriptor = self->_availableKeyDescriptor;
  if (availableKeyDescriptor
    && !-[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("preferredForName")))
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }
  return preferredForName;
}

- (BOOL)preferredForImage
{
  _BOOL4 preferredForImage;
  CNContactKeyVector *availableKeyDescriptor;

  preferredForImage = self->_preferredForImage;
  availableKeyDescriptor = self->_availableKeyDescriptor;
  if (availableKeyDescriptor
    && !-[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("preferredForImage")))
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }
  return preferredForImage;
}

- (BOOL)isUsingSharedPhoto
{
  _BOOL4 isUsingSharedPhoto;
  CNContactKeyVector *availableKeyDescriptor;

  isUsingSharedPhoto = self->_isUsingSharedPhoto;
  availableKeyDescriptor = self->_availableKeyDescriptor;
  if (availableKeyDescriptor
    && !-[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("isUsingSharedPhoto")))
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }
  return isUsingSharedPhoto;
}

- (NSString)preferredChannel
{
  return self->_preferredChannel;
}

- (NSString)preferredLikenessSource
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_preferredLikenessSource;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("preferredLikenessSource"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("preferredLikenessSource")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)preferredApplePersonaIdentifier
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_preferredApplePersonaIdentifier;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("preferredApplePersonaIdentifier"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("preferredApplePersonaIdentifier")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)mapsData
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_mapsData;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("mapsData"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("mapsData")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSData)memojiMetadata
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_memojiMetadata;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("memojiMetadata"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("memojiMetadata")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)imageType
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_imageType;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("imageType"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("imageType")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSData)imageHash
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_imageHash;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("imageHash"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("imageHash")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSArray)contactRelations
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_contactRelations;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("contactRelations"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("contactRelations")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (NSDateComponents)birthday
{
  void *v3;
  void *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = (void *)-[NSDateComponents copy](self->_birthday, "copy");
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSDateComponents *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("birthday"));

    if (v6)
      return (NSDateComponents *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("birthday")))
    goto LABEL_9;
  v3 = 0;
  return (NSDateComponents *)v3;
}

- (NSArray)addressingGrammars
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_addressingGrammars;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("addressingGrammars"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("addressingGrammars")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (NSData)watchWallpaperImageData
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_watchWallpaperImageData;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("watchWallpaperImageData"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("watchWallpaperImageData")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (CNActivityAlert)textAlert
{
  CNActivityAlert *v3;
  CNActivityAlert *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_textAlert;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (CNActivityAlert *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("textAlert"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("textAlert")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (CNSensitiveContentConfiguration)sensitiveContentConfiguration
{
  CNSensitiveContentConfiguration *v3;
  CNSensitiveContentConfiguration *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_sensitiveContentConfiguration;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (CNSensitiveContentConfiguration *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("sensitiveContentConfiguration"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("sensitiveContentConfiguration")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)note
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_note;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("note"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("note")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (NSDateComponents)nonGregorianBirthday
{
  void *v3;
  void *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = (void *)-[NSDateComponents copy](self->_nonGregorianBirthday, "copy");
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSDateComponents *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("nonGregorianBirthday"));

    if (v6)
      return (NSDateComponents *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("nonGregorianBirthday")))
    goto LABEL_9;
  v3 = 0;
  return (NSDateComponents *)v3;
}

- (NSData)imageBackgroundColorsData
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_imageBackgroundColorsData;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("imageBackgroundColorsData"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("imageBackgroundColorsData")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (CNActivityAlert)callAlert
{
  CNActivityAlert *v3;
  CNActivityAlert *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_callAlert;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (CNActivityAlert *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("callAlert"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("callAlert")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSArray)calendarURIs
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_calendarURIs;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("calendarURIs"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("calendarURIs")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSArray)urlAddresses
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_urlAddresses;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("urlAddresses"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("urlAddresses")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (NSArray)dates
{
  NSArray *v3;
  NSArray *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_dates;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("dates"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("dates")))
    goto LABEL_9;
  v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  return v3;
}

- (NSString)linkIdentifier
{
  NSString *v3;
  NSString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_linkIdentifier;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("linkIdentifier"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("linkIdentifier")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (BOOL)imageDataAvailable
{
  -[CNContact assertKeyIsAvailable:](self, "assertKeyIsAvailable:", CFSTR("imageDataAvailable"));
  return self->_imageDataAvailable;
}

- (void)assertKeyIsAvailable:(id)a3
{
  if (!-[CNContact isKeyAvailable:](self, "isKeyAvailable:", a3))
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
}

- (int64_t)sharedPhotoDisplayPreference
{
  int64_t sharedPhotoDisplayPreference;
  CNContactKeyVector *availableKeyDescriptor;

  sharedPhotoDisplayPreference = self->_sharedPhotoDisplayPreference;
  availableKeyDescriptor = self->_availableKeyDescriptor;
  if (availableKeyDescriptor
    && !-[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("sharedPhotoDisplayPreference")))
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
  }
  return sharedPhotoDisplayPreference;
}

+ (id)descriptorWithKeyDescriptors:(id)a3 description:(id)a4
{
  return +[CNAggregateKeyDescriptor keyDescriptorWithKeyDescriptors:description:](CNAggregateKeyDescriptor, "keyDescriptorWithKeyDescriptors:description:", a3, a4);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  CNContactKeyVector *availableKeyDescriptor;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  CNContact *v16;
  _QWORD v17[4];
  id v18;
  CNContact *v19;
  id v20;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  availableKeyDescriptor = self->_availableKeyDescriptor;
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __29__CNContact_encodeWithCoder___block_invoke;
  v17[3] = &unk_1E29FC540;
  v9 = v4;
  v18 = v9;
  v19 = self;
  v10 = v6;
  v20 = v10;
  -[CNContactKeyVector enumeratePropertiesUsingBlock:](availableKeyDescriptor, "enumeratePropertiesUsingBlock:", v17);
  +[CN runtimeOnlyProperties](CN, "runtimeOnlyProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __29__CNContact_encodeWithCoder___block_invoke_2;
  v14[3] = &unk_1E29FC518;
  v12 = v9;
  v15 = v12;
  v16 = self;
  objc_msgSend(v11, "_cn_each:", v14);

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v12, "encodeObject:forKey:", self->_availableKeyDescriptor, CFSTR("availableKeyDescriptor"));
  }
  else
  {
    v13 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v12, "encodeObject:forKey:", v13, CFSTR("availableKeys"));

  }
  objc_msgSend(v12, "encodeObject:forKey:", self->_snapshot, CFSTR("snapshot"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_linkedContacts, CFSTR("linkedContacts"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_storeIdentifier, CFSTR("storeIdentifier"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_storeInfo, CFSTR("storeInfo"));

}

+ (NSPredicate)predicateForContactsWithIdentifiers:(NSArray *)identifiers
{
  NSArray *v3;
  CNiOSABContactIdentifiersPredicate *v4;

  v3 = identifiers;
  v4 = -[CNContactsWithIdentifiersPredicate initWithIdentifiers:]([CNiOSABContactIdentifiersPredicate alloc], "initWithIdentifiers:", v3);

  return (NSPredicate *)v4;
}

+ (id)predicateForMeContact
{
  return objc_alloc_init(CNiOSABMeContactsPredicate);
}

+ (NSPredicate)predicateForContactsMatchingPhoneNumber:(CNPhoneNumber *)phoneNumber
{
  CNPhoneNumber *v3;
  id v4;

  v3 = phoneNumber;
  v4 = -[CNPhoneNumberContactPredicate initWithPhoneNumber:returnMultipleResults:]([CNiOSABPhoneNumberContactPredicate alloc], v3, 1);

  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateForContactsMatchingEmailAddress:(NSString *)emailAddress
{
  NSString *v3;
  CNiOSABEmailAddressContactPredicate *v4;

  v3 = emailAddress;
  v4 = -[CNEmailAddressContactPredicate initWithEmailAddress:returnMultipleResults:]([CNiOSABEmailAddressContactPredicate alloc], "initWithEmailAddress:returnMultipleResults:", v3, 1);

  return (NSPredicate *)v4;
}

- (BOOL)isSuggestedMe
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[CNContact storeIdentifier](self, "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[CNDonationMapper mapperIdentifier](CNDonationMapper, "mapperIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v7 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  -[CNContact storeIdentifier](self, "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNDonationMapper mapperIdentifier](CNDonationMapper, "mapperIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (!v4)
    goto LABEL_6;
LABEL_7:

  return v7;
}

- (BOOL)isSuggested
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  -[CNContact storeIdentifier](self, "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[CNSuggestedContactStore storeIdentifier](CNSuggestedContactStore, "storeIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v8 = 1;
      goto LABEL_14;
    }
  }
  -[CNContact storeIdentifier](self, "storeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNSuggestedContactStore storeIdentifier](CNSuggestedContactStore, "storeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) == 0)
  {
    -[CNContact storeIdentifier](self, "storeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      || (+[CNDonationMapper mapperIdentifier](CNDonationMapper, "mapperIdentifier"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CNContact storeIdentifier](self, "storeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNDonationMapper mapperIdentifier](CNDonationMapper, "mapperIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isEqual:", v11);

      if (v9)
      {

        goto LABEL_13;
      }
    }
    else
    {
      v8 = 1;
    }

LABEL_13:
    if (v5)
      goto LABEL_15;
LABEL_14:

    goto LABEL_15;
  }

  v8 = 1;
  if (!v5)
    goto LABEL_14;
LABEL_15:

  return v8;
}

- (void)assertKeysAreAvailable:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[CNContact areKeysAvailable:](self, "areKeysAvailable:"))
  {
    objc_msgSend(v5, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CNPropertyNotFetchedException"), CFSTR("Contact %p is missing some of the required key descriptors: %@"), self, v4);

  }
}

- (BOOL)hasBeenPersisted
{
  return self->_snapshot != 0;
}

- (id)snapshot
{
  CNContact *v2;
  CNContact *snapshot;
  CNContact *v4;
  CNContact *v5;

  v2 = self;
  snapshot = self->_snapshot;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (CNContact *)objc_claimAutoreleasedReturnValue();
  if (snapshot != v4)
    v2 = v2->_snapshot;
  v5 = v2;

  return v5;
}

- (id)copyWithPropertyKeys:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  CNContact *v16;
  id v17;

  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __34__CNContact_copyWithPropertyKeys___block_invoke;
  v15 = &unk_1E29FC4F0;
  v16 = self;
  v17 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v12);

  v8 = (void *)objc_opt_class();
  objc_msgSend(v7, "allObjects", v12, v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_contactWithContact:createNewInstance:propertyDescriptions:", self, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  CNContact *snapshot;
  CNContact *v6;

  +[CNContact contactWithContact:](CNMutableContact, "contactWithContact:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  snapshot = self->_snapshot;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (CNContact *)objc_claimAutoreleasedReturnValue();

  if (snapshot == v6)
    objc_msgSend(v4, "setSnapshot:", self);
  return v4;
}

+ (CNContact)contactWithContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CN allContactProperties](CN, "allContactProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_contactWithContact:createNewInstance:propertyDescriptions:", v4, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContact *)v6;
}

- (id)keyVector
{
  return self->_availableKeyDescriptor;
}

- (CNContact)initWithCoder:(id)a3
{
  id v4;
  CNContact *v5;
  CNContact *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CNContact *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CNContactKeyVector *availableKeyDescriptor;
  CNContactKeyVector *v17;
  uint64_t v18;
  id v19;
  CNContact *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  CNContact *snapshot;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSArray *linkedContacts;
  void *v35;
  uint64_t v36;
  NSString *storeIdentifier;
  void *v38;
  uint64_t v39;
  NSDictionary *storeInfo;
  NSObject *v41;
  void *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, void *);
  void *v47;
  id v48;
  CNContact *v49;
  _QWORD v50[4];
  id v51;
  CNContact *v52;

  v4 = a3;
  v5 = -[CNContact init](self, "init");
  if (v5)
  {
    v6 = v5;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v8 = (void *)MEMORY[0x1E0C99E60];
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("availableKeyDescriptor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
    }
    else
    {
      v13 = objc_opt_class();
      objc_msgSend(v8, "setWithObjects:", v13, objc_opt_class(), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("availableKeys"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v15, "copy");

      objc_msgSend(v9, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    availableKeyDescriptor = v6->_availableKeyDescriptor;
    v6->_availableKeyDescriptor = (CNContactKeyVector *)v11;

    v17 = v6->_availableKeyDescriptor;
    v18 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __27__CNContact_initWithCoder___block_invoke;
    v50[3] = &unk_1E29F9BC0;
    v19 = v4;
    v51 = v19;
    v20 = v6;
    v52 = v20;
    -[CNContactKeyVector enumeratePropertiesUsingBlock:](v17, "enumeratePropertiesUsingBlock:", v50);
    +[CN runtimeOnlyProperties](CN, "runtimeOnlyProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v18;
    v45 = 3221225472;
    v46 = __27__CNContact_initWithCoder___block_invoke_2;
    v47 = &unk_1E29FC518;
    v22 = v19;
    v48 = v22;
    v12 = v20;
    v49 = v12;
    objc_msgSend(v21, "_cn_each:", &v44);

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0, v44, v45, v46, v47);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "decodeObjectOfClasses:forKey:", v25, CFSTR("snapshot"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "copy");
    snapshot = v12->_snapshot;
    v12->_snapshot = (CNContact *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "decodeObjectOfClasses:forKey:", v31, CFSTR("linkedContacts"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "copy");
    linkedContacts = v12->_linkedContacts;
    v12->_linkedContacts = (NSArray *)v33;

    objc_msgSend(v22, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeIdentifier"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "copy");
    storeIdentifier = v12->_storeIdentifier;
    v12->_storeIdentifier = (NSString *)v36;

    +[CNContact storeInfoFromCoder:storeIdentifier:key:](CNContact, "storeInfoFromCoder:storeIdentifier:key:", v22, v12->_storeIdentifier, CFSTR("storeInfo"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "copy");
    storeInfo = v12->_storeInfo;
    v12->_storeInfo = (NSDictionary *)v39;

    if (!v12->_internalIdentifier)
    {

      v41 = os_log_create("com.apple.contacts", "data-access-error");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[CNContact initWithCoder:].cold.1();

      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 2, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "failWithError:", v42);

      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)storeInfoFromCoder:(id)a3 storeIdentifier:(id)a4 key:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v7 = a3;
  v8 = a5;
  v9 = +[CNContactStore storeClassWithIdentifier:](CNContactStore, "storeClassWithIdentifier:", a4);
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNSecureCodingClassSets contactStoreClasses](CNSecureCodingClassSets, "contactStoreClasses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v15, "containsObject:", v9);

    if ((_DWORD)v12)
    {
      -[objc_class storeInfoClasses](v9, "storeInfoClasses");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        objc_msgSend(v14, "setByAddingObjectsFromSet:", v16);
        v18 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v18;
      }
    }
    objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v14, v8);
    v9 = (objc_class *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (NSString)localizedStringForKey:(NSString *)key
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D13A98], "localizedStringForString:class:returningNilIfNotFound:", key, a1, 1);
}

uint64_t __29__CNContact_encodeWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "encodeUsingCoder:contact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (NSArray)mainStoreLinkedContacts
{
  return (NSArray *)-[CNContact linkedContactsFromStoreWithIdentifier:](self, "linkedContactsFromStoreWithIdentifier:", 0);
}

- (NSData)thumbnailImageData
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_thumbnailImageData;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("thumbnailImageData"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("thumbnailImageData")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

+ (NSComparator)comparatorForNameSortOrder:(CNContactSortOrder)sortOrder
{
  void *v3;
  void *v4;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CNContact_comparatorForNameSortOrder___block_invoke;
  aBlock[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  aBlock[4] = sortOrder;
  v3 = _Block_copy(aBlock);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSData)imageData
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_imageData;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("imageData"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("imageData")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

+ (id)predicateForContactsMatchingHandleStrings:(id)a3
{
  id v3;
  CNiOSABHandleStringsContactPredicate *v4;

  v3 = a3;
  v4 = -[CNHandleStringsContactPredicate initWithHandleStrings:containerIdentifiers:]([CNiOSABHandleStringsContactPredicate alloc], "initWithHandleStrings:containerIdentifiers:", v3, 0);

  return v4;
}

- (id)searchableItemAttributeSetForUserActivity
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc((Class)getCSSearchableItemAttributeSetClass[0]()), "initWithItemContentType:", CFSTR("public.contact"));
  -[CNContact identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRelatedUniqueIdentifier:", v4);

  return v3;
}

+ (id)predicateForPreferredNameInRange:(_NSRange)a3
{
  return -[CNiOSABPreferredNameContactsPredicate initWithRange:]([CNiOSABPreferredNameContactsPredicate alloc], "initWithRange:", a3.location, a3.length);
}

- (id)shortDebugDescription
{
  void *v3;
  void *v4;
  id v5;
  const __CFString *givenName;
  id v7;
  const __CFString *familyName;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"), v4);

  if (-[CNContact isKeyAvailable:](self, "isKeyAvailable:", CFSTR("givenName")))
    givenName = (const __CFString *)self->_givenName;
  else
    givenName = CFSTR("(not fetched)");
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("givenName"), givenName);
  if (-[CNContact isKeyAvailable:](self, "isKeyAvailable:", CFSTR("familyName")))
    familyName = (const __CFString *)self->_familyName;
  else
    familyName = CFSTR("(not fetched)");
  v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("familyName"), familyName);
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSData)fullscreenImageData
{
  NSData *v3;
  NSData *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_fullscreenImageData;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("fullscreenImageData"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("fullscreenImageData")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

uint64_t __27__CNContact_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "decodeUsingCoder:contact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)isEqualIgnoringIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t aBlock;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  CNContact *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __40__CNContact_isEqualIgnoringIdentifiers___block_invoke;
  v17[3] = &unk_1E29F7D70;
  v17[4] = self;
  v18 = v4;
  aBlock = v7;
  v12 = 3221225472;
  v13 = __40__CNContact_isEqualIgnoringIdentifiers___block_invoke_2;
  v14 = &unk_1E29F7D70;
  v15 = self;
  v16 = v18;
  v8 = v18;
  v9 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v8, v6, self, v17, v9, 0, aBlock, v12, v13, v14, v15);

  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptorForRequiredKeysForSearchableItem
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CNContact_Spotlight__descriptorForRequiredKeysForSearchableItem__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  if (descriptorForRequiredKeysForSearchableItem_cn_once_token_1 != -1)
    dispatch_once(&descriptorForRequiredKeysForSearchableItem_cn_once_token_1, block);
  return (id)descriptorForRequiredKeysForSearchableItem_cn_once_object_1;
}

void __66__CNContact_Spotlight__descriptorForRequiredKeysForSearchableItem__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[25];

  v9[24] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  v9[0] = CFSTR("namePrefix");
  v9[1] = CFSTR("givenName");
  v9[2] = CFSTR("middleName");
  v9[3] = CFSTR("familyName");
  v9[4] = CFSTR("nameSuffix");
  v9[5] = CFSTR("nickname");
  v9[6] = CFSTR("phoneticFamilyName");
  v9[7] = CFSTR("phoneticGivenName");
  v9[8] = CFSTR("phoneticMiddleName");
  v9[9] = CFSTR("phoneNumbers");
  v9[10] = CFSTR("emailAddresses");
  v9[11] = CFSTR("instantMessageAddresses");
  v9[12] = CFSTR("dates");
  v9[13] = CFSTR("postalAddresses");
  v9[14] = CFSTR("urlAddresses");
  v9[15] = CFSTR("socialProfiles");
  v9[16] = CFSTR("note");
  v9[17] = CFSTR("organizationName");
  v9[18] = CFSTR("contactType");
  v9[19] = CFSTR("departmentName");
  v9[20] = CFSTR("jobTitle");
  v9[21] = CFSTR("birthday");
  v9[22] = CFSTR("nonGregorianBirthday");
  v9[23] = CFSTR("creationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  NSStringFromSelector(*(SEL *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact descriptorWithKeyDescriptors:description:](CNContact, "descriptorWithKeyDescriptors:description:", v2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "copy");
  v8 = (void *)descriptorForRequiredKeysForSearchableItem_cn_once_object_1;
  descriptorForRequiredKeysForSearchableItem_cn_once_object_1 = v7;

}

- (id)searchableItemForIndexing
{
  return -[CNContact _searchableItemIncludingInternalAttributes:](self, "_searchableItemIncludingInternalAttributes:", 1);
}

- (id)searchableItemForDragging
{
  return -[CNContact _searchableItemIncludingInternalAttributes:](self, "_searchableItemIncludingInternalAttributes:", 0);
}

- (id)_searchableItemIncludingInternalAttributes:(BOOL)a3
{
  void *v4;
  void *v5;
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
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  void *context;
  CNContact *v79;
  void *v80;
  id obja;
  id obj;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[7];
  _BYTE v92[128];
  _QWORD v93[2];
  _QWORD v94[4];
  _QWORD v95[11];

  v77 = a3;
  v95[9] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc((Class)getCSSearchableItemAttributeSetClass[0]()), "initWithItemContentType:", CFSTR("public.contact"));
  context = (void *)MEMORY[0x19400675C]();
  +[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", self, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v4;
  objc_msgSend(v4, "setDisplayName:", v5);

  -[CNContact namePrefix](self, "namePrefix");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v85;
  -[CNContact givenName](self, "givenName");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v83;
  -[CNContact middleName](self, "middleName");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v95[2] = obja;
  -[CNContact familyName](self, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v95[3] = v6;
  -[CNContact nameSuffix](self, "nameSuffix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v95[4] = v7;
  -[CNContact nickname](self, "nickname");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v95[5] = v8;
  -[CNContact phoneticFamilyName](self, "phoneticFamilyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v95[6] = v9;
  -[CNContact phoneticGivenName](self, "phoneticGivenName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v95[7] = v10;
  -[CNContact phoneticMiddleName](self, "phoneticMiddleName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v95[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact _filteredArrayForValidValues:](self, "_filteredArrayForValidValues:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlternateNames:", v13);

  -[CNContact phoneNumbers](self, "phoneNumbers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueForKey:", CFSTR("value"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForKey:", CFSTR("stringValue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact _filteredArrayForValidValues:](self, "_filteredArrayForValidValues:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  -[CNContact emailAddresses](self, "emailAddresses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueForKey:", CFSTR("value"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact _filteredArrayForValidValues:](self, "_filteredArrayForValidValues:", v19);
  v20 = objc_claimAutoreleasedReturnValue();

  -[CNContact instantMessageAddresses](self, "instantMessageAddresses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "valueForKey:", CFSTR("value"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "valueForKey:", CFSTR("username"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact _filteredArrayForValidValues:](self, "_filteredArrayForValidValues:", v23);
  v24 = objc_claimAutoreleasedReturnValue();

  -[CNContact socialProfiles](self, "socialProfiles");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "valueForKey:", CFSTR("value"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "valueForKey:", CFSTR("username"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact _filteredArrayForValidValues:](self, "_filteredArrayForValidValues:", v27);
  v28 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v80, "setPhoneNumbers:", v17);
  objc_msgSend(v80, "setEmailAddresses:", v20);
  objc_msgSend(v80, "setInstantMessageAddresses:", v24);
  v75 = (void *)v20;
  v76 = (void *)v17;
  v94[0] = v17;
  v94[1] = v20;
  v73 = (void *)v28;
  v74 = (void *)v24;
  v94[2] = v24;
  v94[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_cn_flatten");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setAccountHandles:", v30);

  -[CNContact note](self, "note");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setTextContent:", v31);

  -[CNContact organizationName](self, "organizationName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v32;
  -[CNContact departmentName](self, "departmentName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact _filteredArrayForValidValues:](self, "_filteredArrayForValidValues:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setOrganizations:", v35);

  -[CNContact jobTitle](self, "jobTitle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setRole:", v36);

  -[CNContact dates](self, "dates");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "valueForKey:", CFSTR("value"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "valueForKey:", CFSTR("date"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "mutableCopy");

  -[CNContact birthday](self, "birthday");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "date");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    objc_msgSend(v40, "addObject:", v42);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v43);

  }
  -[CNContact nonGregorianBirthday](self, "nonGregorianBirthday");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "date");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    objc_msgSend(v40, "addObject:", v45);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v46);

  }
  v72 = v40;
  -[CNContact _filteredArrayForValidValues:](self, "_filteredArrayForValidValues:", v40);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setImportantDates:", v47);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = self;
  -[CNContact postalAddresses](self, "postalAddresses");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "valueForKey:", CFSTR("value"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v49;
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
  if (v50)
  {
    v51 = v50;
    v84 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v88 != v84)
          objc_enumerationMutation(obj);
        v53 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
        objc_msgSend(v53, "street");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v91[0] = v54;
        objc_msgSend(v53, "subLocality");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v91[1] = v55;
        objc_msgSend(v53, "city");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v91[2] = v56;
        objc_msgSend(v53, "subAdministrativeArea");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v91[3] = v57;
        objc_msgSend(v53, "state");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v91[4] = v58;
        objc_msgSend(v53, "postalCode");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v91[5] = v59;
        objc_msgSend(v53, "country");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v91[6] = v60;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 7);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "addObjectsFromArray:", v61);

      }
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
    }
    while (v51);
  }

  -[CNContact urlAddresses](v79, "urlAddresses");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "valueForKey:", CFSTR("value"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "addObjectsFromArray:", v63);

  -[CNContact _filteredArrayForValidValues:](v79, "_filteredArrayForValidValues:", v86);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setAuthorAddresses:", v64);

  +[CNDraggingContact availableDataRepresentationTypes](CNDraggingContact, "availableDataRepresentationTypes");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setProviderDataTypeIdentifiers:", v65);

  if (v77)
  {
    -[CNContact creationDate](v79, "creationDate");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setContentCreationDate:", v66);

  }
  -[CNContact identifier](v79, "identifier");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNEntitySpotlightIndexing associateAttributeSet:withContactEntityIdentifiedBy:](CNEntitySpotlightIndexing, "associateAttributeSet:withContactEntityIdentifiedBy:", v80, v67);

  objc_autoreleasePoolPop(context);
  v68 = objc_alloc((Class)getCSSearchableItemClass[0]());
  -[CNContact identifier](v79, "identifier");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v68, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v69, CFSTR("contact"), v80);

  return v70;
}

- (id)_filteredArrayForValidValues:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if ((objc_msgSend(v10, "isEqualToString:", &stru_1E29FF900) & 1) == 0)
              goto LABEL_14;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
LABEL_14:
              objc_msgSend(v4, "addObject:", v10);
              goto LABEL_15;
            }
            -[CNContact _filteredArrayForValidValues:](self, "_filteredArrayForValidValues:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v11, "isEqualToArray:", MEMORY[0x1E0C9AA60]) & 1) == 0)
              objc_msgSend(v4, "addObject:", v11);

          }
        }
LABEL_15:
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (NSPredicate)predicateForContactsInGroupWithIdentifier:(NSString *)groupIdentifier
{
  NSString *v3;
  CNiOSABContactsInGroupPredicate *v4;

  v3 = groupIdentifier;
  v4 = -[CNiOSABContactsInGroupPredicate initWithParentGroupIdentifier:]([CNiOSABContactsInGroupPredicate alloc], "initWithParentGroupIdentifier:", v3);

  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateForContactsMatchingName:(NSString *)name
{
  NSString *v3;
  CNiOSABContactWithNamePredicate *v4;

  v3 = name;
  v4 = -[CNContactWithNamePredicate initWithName:]([CNiOSABContactWithNamePredicate alloc], "initWithName:", v3);

  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateForContactsInContainerWithIdentifier:(NSString *)containerIdentifier
{
  NSString *v3;
  CNiOSABContactsInContainerPredicate *v4;

  v3 = containerIdentifier;
  v4 = -[CNiOSABContactsInContainerPredicate initWithParentContainerIdentifier:]([CNiOSABContactsInContainerPredicate alloc], "initWithParentContainerIdentifier:", v3);

  return (NSPredicate *)v4;
}

+ (id)predicateForContactsMatchingName:(id)a3 options:(unint64_t)a4
{
  id v5;
  CNiOSABContactWithNamePredicate *v6;

  v5 = a3;
  v6 = -[CNContactWithNamePredicate initWithName:options:]([CNiOSABContactWithNamePredicate alloc], "initWithName:options:", v5, a4);

  return v6;
}

+ (id)predicateForContactsWithOrganizationName:(id)a3
{
  id v3;
  CNiOSABOrganizationNameContactPredicate *v4;

  v3 = a3;
  v4 = -[CNiOSABOrganizationNameContactPredicate initWithOrganizationName:]([CNiOSABOrganizationNameContactPredicate alloc], "initWithOrganizationName:", v3);

  return v4;
}

+ (id)predicateForContactMatchingEmailAddress:(id)a3
{
  id v3;
  CNiOSABEmailAddressContactPredicate *v4;

  v3 = a3;
  v4 = -[CNEmailAddressContactPredicate initWithEmailAddress:returnMultipleResults:]([CNiOSABEmailAddressContactPredicate alloc], "initWithEmailAddress:returnMultipleResults:", v3, 0);

  return v4;
}

+ (id)predicateForContactsMatchingEmailAddress:(id)a3 groupIdentifiers:(id)a4 limitToOneResult:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  CNiOSABEmailAddressContactPredicate *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[CNEmailAddressContactPredicate initWithEmailAddress:groupIdentifiers:returnMultipleResults:]([CNiOSABEmailAddressContactPredicate alloc], "initWithEmailAddress:groupIdentifiers:returnMultipleResults:", v8, v7, !v5);

  return v9;
}

+ (id)predicateForContactsMatchingPhoneNumber:(id)a3 prefixHint:(id)a4 groupIdentifiers:(id)a5 limitToOneResult:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[CNPhoneNumberContactPredicate initWithPhoneNumber:prefixHint:groupIdentifiers:returnMultipleResults:]([CNiOSABPhoneNumberContactPredicate alloc], v11, v10, v9, !a6);

  return v12;
}

+ (id)predicateForContactsMatchingHandleStrings:(id)a3 inContainersWithIdentifiers:(id)a4
{
  id v5;
  id v6;
  CNiOSABHandleStringsContactPredicate *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNHandleStringsContactPredicate initWithHandleStrings:containerIdentifiers:]([CNiOSABHandleStringsContactPredicate alloc], "initWithHandleStrings:containerIdentifiers:", v6, v5);

  return v7;
}

+ (id)predicateForContactsMatchingPostalAddress:(id)a3
{
  id v3;
  CNiOSABPostalAddressContactPredicate *v4;

  v3 = a3;
  v4 = -[CNiOSABPostalAddressContactPredicate initWithPostalAddress:]([CNiOSABPostalAddressContactPredicate alloc], "initWithPostalAddress:", v3);

  return v4;
}

+ (id)predicateForContactsLinkedToContactWithIdentifier:(id)a3
{
  id v3;
  CNiOSABLinkedContactsPredicate *v4;

  v3 = a3;
  v4 = -[CNLinkedContactsPredicate initWithContactIdentifier:]([CNiOSABLinkedContactsPredicate alloc], "initWithContactIdentifier:", v3);

  return v4;
}

+ (id)predicateForContactsLinkedToContact:(id)a3
{
  id v3;
  CNiOSABLinkedContactsPredicate *v4;

  v3 = a3;
  v4 = -[CNLinkedContactsPredicate initWithContact:]([CNiOSABLinkedContactsPredicate alloc], "initWithContact:", v3);

  return v4;
}

+ (id)predicateForContactsMatchingSmartDialerString:(id)a3
{
  id v3;
  CNiOSABSmartDialerStringContactPredicate *v4;

  v3 = a3;
  v4 = -[CNiOSABSmartDialerStringContactPredicate initWithString:]([CNiOSABSmartDialerStringContactPredicate alloc], "initWithString:", v3);

  return v4;
}

+ (id)predicateForContactsMatchingFullTextSearch:(id)a3 containerIdentifiers:(id)a4 groupIdentifiers:(id)a5
{
  id v7;
  id v8;
  id v9;
  CNiOSABFullTextSearchContactPredicate *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CNiOSABFullTextSearchContactPredicate initWithSearchString:containerIdentifiers:groupIdentifiers:]([CNiOSABFullTextSearchContactPredicate alloc], "initWithSearchString:containerIdentifiers:groupIdentifiers:", v9, v8, v7);

  return v10;
}

+ (id)predicateForContactMatchingMapString:(id)a3
{
  id v3;
  CNiOSABMapDataContactPredicate *v4;

  v3 = a3;
  v4 = -[CNiOSABMapDataContactPredicate initWithString:]([CNiOSABMapDataContactPredicate alloc], "initWithString:", v3);

  return v4;
}

+ (id)predicateForContactMatchingPhoneNumber:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[CNPhoneNumberContactPredicate initWithPhoneNumber:returnMultipleResults:]([CNiOSABPhoneNumberContactPredicate alloc], v3, 0);

  return v4;
}

+ (id)predicateForContactsMatchingPhoneNumber:(id)a3 prefixHint:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNPhoneNumberContactPredicate initWithPhoneNumber:prefixHint:returnMultipleResults:]([CNiOSABPhoneNumberContactPredicate alloc], v6, v5, 1);

  return v7;
}

+ (id)predicateForContactMatchingPhoneNumberWithDigits:(id)a3 countryCode:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNPhoneNumberContactPredicate initWithDigits:countryCode:returnMultipleResults:]([CNiOSABPhoneNumberContactPredicate alloc], v6, v5, 0);

  return v7;
}

+ (id)predicateForPreferredNameInContainersWithIdentifiers:(id)a3 groupsWithIdentifiers:(id)a4
{
  id v5;
  id v6;
  CNiOSABPreferredNameInContainersAndGroupsPredicate *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNiOSABPreferredNameInContainersAndGroupsPredicate initWithContainerIdentifiers:groupIdentifiers:]([CNiOSABPreferredNameInContainersAndGroupsPredicate alloc], "initWithContainerIdentifiers:groupIdentifiers:", v6, v5);

  return v7;
}

+ (id)predicateForContactsMatchingString:(id)a3 accountIdentifier:(id)a4 containerIdentifier:(id)a5 groupIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  CNiOSABStringMatchContactPredicate *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[CNiOSABStringMatchContactPredicate initWithSearchString:accountIdentifier:containerIdentifier:groupIdentifier:]([CNiOSABStringMatchContactPredicate alloc], "initWithSearchString:accountIdentifier:containerIdentifier:groupIdentifier:", v12, v11, v10, v9);

  return v13;
}

+ (id)predicateForContactMatchingURLString:(id)a3
{
  id v3;
  CNiOSABURLContactPredicate *v4;

  v3 = a3;
  v4 = -[CNiOSABURLContactPredicate initWithURLString:]([CNiOSABURLContactPredicate alloc], "initWithURLString:", v3);

  return v4;
}

+ (id)predicateForContactMatchingLabeledValueIdentifier:(id)a3
{
  id v3;
  CNiOSABLabeledValueContactPredicate *v4;

  v3 = a3;
  v4 = -[CNiOSABLabeledValueContactPredicate initWithLabeledValueIdentifier:]([CNiOSABLabeledValueContactPredicate alloc], "initWithLabeledValueIdentifier:", v3);

  return v4;
}

+ (id)predicateForContactMatchingEKParticipantWithName:(id)a3 emailAddress:(id)a4 URL:(id)a5 predicateDescription:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  CNiOSABEKParticipantPredicate *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[CNiOSABEKParticipantPredicate initWithName:URL:emailAddress:customDescription:]([CNiOSABEKParticipantPredicate alloc], "initWithName:URL:emailAddress:customDescription:", v12, v10, v11, v9);

  return v13;
}

+ (id)predicateForContactsMatchingSocialProfile:(id)a3
{
  id v3;
  CNiOSABSocialProfileContactPredicate *v4;

  v3 = a3;
  v4 = -[CNSocialProfileContactPredicate initWithSocialProfile:]([CNiOSABSocialProfileContactPredicate alloc], "initWithSocialProfile:", v3);

  return v4;
}

+ (id)predicateForContactsMatchingInstantMessageAddress:(id)a3
{
  id v3;
  CNiOSABInstantMessageAddressContactPredicate *v4;

  v3 = a3;
  v4 = -[CNiOSABInstantMessageAddressContactPredicate initWithInstantMessageAddress:]([CNiOSABInstantMessageAddressContactPredicate alloc], "initWithInstantMessageAddress:", v3);

  return v4;
}

+ (id)predicateForContactsMatchingPreferredChannel:(id)a3 limitOne:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  CNiOSABPreferredChannelContactPredicate *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[CNiOSABPreferredChannelContactPredicate initWithPreferredChannel:limitOne:]([CNiOSABPreferredChannelContactPredicate alloc], "initWithPreferredChannel:limitOne:", v5, v4);

  return v6;
}

+ (id)predicateForContactsMatchingExternalUUIDs:(id)a3
{
  id v3;
  CNiOSABExternalUUIDContactPredicate *v4;

  v3 = a3;
  v4 = -[CNExternalUUIDContactPredicate initWithExternalUUIDs:]([CNiOSABExternalUUIDContactPredicate alloc], "initWithExternalUUIDs:", v3);

  return v4;
}

+ (id)predicateForContactsWithNonUnifiedIdentifiers:(id)a3
{
  id v3;
  CNiOSABContactIdentifiersPredicate *v4;

  v3 = a3;
  v4 = -[CNiOSABContactIdentifiersPredicate initWithIdentifiers:ignoreUnifiedIdentifiers:]([CNiOSABContactIdentifiersPredicate alloc], "initWithIdentifiers:ignoreUnifiedIdentifiers:", v3, 1);

  return v4;
}

+ (id)predicateForFaultFulfillmentForLegacyIdentifier:(unsigned int)a3 identifier:(id)a4
{
  uint64_t v4;
  id v5;
  CNiOSABFaultFulfillmentPredicate *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = -[CNiOSABFaultFulfillmentPredicate initWithLegacyIdentifier:identifier:]([CNiOSABFaultFulfillmentPredicate alloc], "initWithLegacyIdentifier:identifier:", v4, v5);

  return v6;
}

+ (id)predicateForAllContacts
{
  if (predicateForAllContacts_cn_once_token_0 != -1)
    dispatch_once(&predicateForAllContacts_cn_once_token_0, &__block_literal_global_41);
  return (id)predicateForAllContacts_cn_once_object_0;
}

void __56__CNContact_Predicates_Private__predicateForAllContacts__block_invoke()
{
  uint64_t v0;
  void *v1;
  CNiOSABAllContactsPredicate *v2;

  v2 = objc_alloc_init(CNiOSABAllContactsPredicate);
  v0 = -[CNiOSABAllContactsPredicate copy](v2, "copy");
  v1 = (void *)predicateForAllContacts_cn_once_object_0;
  predicateForAllContacts_cn_once_object_0 = v0;

}

+ (id)predicateForContactsMissingBackgroundColors
{
  return objc_alloc_init(CNiOSABMissingBackgroundColorsContactPredicate);
}

+ (id)predicateForContactsWithWallpaperMetadata
{
  return objc_alloc_init(CNiOSABWithWallpaperMetadataContactPredicate);
}

- (void)detachedPerson
{
  return -[CNContact detachedPersonWithError:](self, "detachedPersonWithError:", 0);
}

- (void)detachedPersonWithError:(id *)a3
{
  ABRecordRef v5;

  v5 = ABPersonCreate();
  if (-[CNContact overwritePerson:error:](self, "overwritePerson:error:", v5, a3))
  {
    if (v5)
      return (void *)CFAutorelease(v5);
  }
  else
  {
    CFRelease(v5);
  }
  return 0;
}

- (BOOL)overwritePerson:(void *)a3
{
  return -[CNContact overwritePerson:error:](self, "overwritePerson:error:", a3, 0);
}

- (BOOL)overwritePerson:(void *)a3 error:(id *)a4
{
  CNiOSABDependentPropertiesUpdateContext *v7;
  void *v8;
  CNiOSABDependentPropertiesUpdateContext *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  _QWORD v16[5];
  CNiOSABDependentPropertiesUpdateContext *v17;
  uint64_t *v18;
  void *v19;
  id *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v7 = objc_alloc_init(CNiOSABDependentPropertiesUpdateContext);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  -[CNContact keyVector](self, "keyVector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__CNContact_iOSABLegacyCompatibility__overwritePerson_error___block_invoke;
  v16[3] = &unk_1E29F9818;
  v16[4] = self;
  v19 = a3;
  v9 = v7;
  v20 = a4;
  v17 = v9;
  v18 = &v21;
  objc_msgSend(v8, "enumeratePropertiesUsingBlock:", v16);

  if (*((_BYTE *)v22 + 24))
  {
    +[CNContactsEnvironment currentEnvironment](CNContactsEnvironment, "currentEnvironment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loggerProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contactsLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[CNiOSABDependentPropertiesUpdateContext flushPendingImageChangesToPerson:logger:error:](v9, "flushPendingImageChangesToPerson:logger:error:", a3, v12, a4);
    *((_BYTE *)v22 + 24) = v13;

    v14 = *((_BYTE *)v22 + 24) != 0;
  }
  else
  {
    v14 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __61__CNContact_iOSABLegacyCompatibility__overwritePerson_error___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  +[CN identifierDescription](CN, "identifierDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v5 == v10)
  {
LABEL_5:

    v8 = v10;
    goto LABEL_6;
  }
  +[CN iOSLegacyIdentifierDescription](CN, "iOSLegacyIdentifierDescription");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7 != v10)
  {
    objc_msgSend(v10, "CNValueForContact:", a1[4]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueWithResetIdentifiers:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v10, "setCNValue:onABPerson:withDependentPropertiesContext:error:", v6, a1[7], a1[5], a1[8]) & 1) == 0)
    {
      *a3 = 1;
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    }
    goto LABEL_5;
  }
LABEL_6:

}

+ (id)contactFromPerson:(void *)a3 keysToFetch:(id)a4
{
  return (id)objc_msgSend(a1, "contactFromPerson:keysToFetch:mutable:", a3, a4, 0);
}

+ (id)contactFromPerson:(void *)a3 keysToFetch:(id)a4 mutable:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFArray *v12;
  const __CFArray *v13;
  CFIndex Count;
  CFIndex v15;
  void *v16;
  id v17;
  CFIndex i;
  const void *ValueAtIndex;
  int v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  BOOL v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  void *v32;
  int v33;

  v5 = a5;
  v7 = a4;
  +[CNContact alwaysFetchedKeys](CNContact, "alwaysFetchedKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNiOSABConversions contactFromABPerson:keysToConvert:mutable:]((uint64_t)CNiOSABConversions, (uint64_t)a3, v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "hasBeenPersisted"))
  {
    v12 = (const __CFArray *)CPRecordCopyChangedProperties();
    if (v12)
    {
      v13 = v12;
      Count = CFArrayGetCount(v12);
      if (Count >= 1)
      {
        v15 = Count;
        v16 = (void *)objc_msgSend(v11, "mutableCopy");
        v28 = v10;
        v29 = v7;
        v27 = v5;
        if (contactFromPerson_keysToFetch_mutable__cn_once_token_0 != -1)
          dispatch_once(&contactFromPerson_keysToFetch_mutable__cn_once_token_0, &__block_literal_global_48);
        v17 = (id)contactFromPerson_keysToFetch_mutable__cn_once_object_0;
        for (i = 0; i != v15; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v13, i);
          v20 = (int)ValueAtIndex;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", ValueAtIndex);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __77__CNContact_iOSABLegacyCompatibility__contactFromPerson_keysToFetch_mutable___block_invoke_3;
          v30[3] = &unk_1E29F9860;
          v32 = a3;
          v33 = v20;
          v23 = v16;
          v31 = v23;
          objc_msgSend(v22, "enumerateObjectsUsingBlock:", v30);

        }
        if (v27)
        {
          v24 = v11;
          objc_msgSend(v24, "setSnapshot:", v23);
          v11 = v24;
        }
        else
        {
          v24 = (id)objc_msgSend(v11, "mutableCopy");
          objc_msgSend(v24, "setSnapshot:", v23);
          v25 = objc_msgSend(v24, "copy");

          v11 = (void *)v25;
        }
        v10 = v28;

        v7 = v29;
      }
      CFRelease(v13);
    }
  }

  return v11;
}

void __77__CNContact_iOSABLegacyCompatibility__contactFromPerson_keysToFetch_mutable___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[CN writableContactProperties](CN, "writableContactProperties");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_groupBy:", &__block_literal_global_7_0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)contactFromPerson_keysToFetch_mutable__cn_once_object_0;
  contactFromPerson_keysToFetch_mutable__cn_once_object_0 = v1;

}

id __77__CNContact_iOSABLegacyCompatibility__contactFromPerson_keysToFetch_mutable___block_invoke_2(uint64_t a1, void *a2)
{
  unsigned int v3;

  v3 = 0;
  if (objc_msgSend(a2, "abPropertyID:", &v3))
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __77__CNContact_iOSABLegacyCompatibility__contactFromPerson_keysToFetch_mutable___block_invoke_3(uint64_t a1, void *a2)
{
  const void *v3;
  ABRecordRef v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = (const void *)ABRecordCopyOriginalValue();
  v4 = ABPersonCreate();
  ABRecordSetValue(v4, *(_DWORD *)(a1 + 48), v3, 0);
  v5 = objc_msgSend(v7, "ABValueForABPerson:", v4);
  if (v3)
    CFRelease(v3);
  if (v4)
    CFRelease(v4);
  objc_msgSend(v7, "CNValueFromABValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCNValue:onContact:", v6, *(_QWORD *)(a1 + 32));

}

+ (id)contactPropertyKeyFromABPropertyID:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  int v9;

  +[CN allContactProperties](CN, "allContactProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__CNContact_iOSABLegacyCompatibility__contactPropertyKeyFromABPropertyID___block_invoke;
  v8[3] = &__block_descriptor_36_e8_B16__0_8l;
  v9 = a3;
  objc_msgSend(v4, "_cn_firstObjectPassingTest:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __74__CNContact_iOSABLegacyCompatibility__contactPropertyKeyFromABPropertyID___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  _BOOL8 result;
  int v5;

  v5 = 0;
  v3 = objc_msgSend(a2, "abPropertyID:", &v5);
  result = 0;
  if (v3)
    return v5 == *(_DWORD *)(a1 + 32);
  return result;
}

+ (int)abPropertyIDfromContactPropertyKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v7;

  v3 = a3;
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  objc_msgSend(v5, "abPropertyID:", &v7);
  LODWORD(v4) = v7;

  return (int)v4;
}

- (BOOL)overwritePublicABPerson:(void *)a3
{
  return objc_msgSend(getABSPublicABCNCompatibilityClass(), "overwritePublicABPerson:withContact:", a3, self);
}

- (BOOL)updateNewPublicABPerson:(void *)a3 inAddressBook:(void *)a4
{
  return objc_msgSend(getABSPublicABCNCompatibilityClass(), "updateNewPublicABPerson:withSavedContact:inAddressBook:", a3, self, a4);
}

+ (id)contactFromPublicABPerson:(void *)a3 keysToFetch:(id)a4
{
  return (id)objc_msgSend(a1, "contactFromPublicABPerson:keysToFetch:mutable:", a3, a4, 0);
}

+ (id)contactFromPublicABPerson:(void *)a3 keysToFetch:(id)a4 mutable:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;

  v5 = a5;
  v7 = a4;
  objc_msgSend(getABSPublicABCNCompatibilityClass(), "contactFromPublicABPerson:keysToFetch:mutable:", a3, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)contactPropertyKeyFromPublicABPropertyID:(int)a3
{
  return (id)objc_msgSend(getABSPublicABCNCompatibilityClass(), "contactPropertyKeyFromPublicABPropertyID:", *(_QWORD *)&a3);
}

+ (int)publicABPropertyIDFromContactPropertyKey:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = objc_msgSend(getABSPublicABCNCompatibilityClass(), "publicABPropertyIDFromContactPropertyKey:", v3);

  return v4;
}

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_0_16 != -1)
    dispatch_once(&os_log_cn_once_token_0_16, &__block_literal_global_98);
  return (OS_os_log *)(id)os_log_cn_once_object_0_16;
}

void __19__CNContact_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "api");
  v1 = (void *)os_log_cn_once_object_0_16;
  os_log_cn_once_object_0_16 = (uint64_t)v0;

}

- (NSString)searchIndex
{
  __CFString *v3;
  __CFString *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_searchIndex;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return (NSString *)v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("searchIndex"));

    if (v6)
      return (NSString *)v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = &stru_1E29FF900;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("searchIndex")))
    goto LABEL_9;
  v3 = &stru_1E29FF900;
  return (NSString *)v3;
}

- (id)wallpaperMetadata
{
  CNWallpaperMetadata *v3;
  CNWallpaperMetadata *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_wallpaperMetadata;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (CNWallpaperMetadata *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("wallpaperMetadata"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("wallpaperMetadata")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSDate)imageSyncFailedTime
{
  NSDate *v3;
  NSDate *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_imageSyncFailedTime;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("imageSyncFailedTime"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("imageSyncFailedTime")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSDate)wallpaperSyncFailedTime
{
  NSDate *v3;
  NSDate *v4;
  CNContactKeyVector *availableKeyDescriptor;
  BOOL v6;
  CNContactKeyVector *v7;

  v3 = self->_wallpaperSyncFailedTime;
  if (v3)
  {
    +[CNLabeledValue emptyEntries](CNLabeledValue, "emptyEntries");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_11:

      return v3;
    }
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      v4 = v3;
      goto LABEL_11;
    }
    v6 = -[CNContactKeyVector containsKey:](availableKeyDescriptor, "containsKey:", CFSTR("wallpaperSyncFailedTime"));

    if (v6)
      return v3;
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact](CNContact, "you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact");
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
  v7 = self->_availableKeyDescriptor;
  if (v7 && !-[CNContactKeyVector containsKey:](v7, "containsKey:", CFSTR("wallpaperSyncFailedTime")))
    goto LABEL_9;
  v3 = 0;
  return v3;
}

- (NSString)cardDAVUID
{
  return (NSString *)(id)-[NSString copy](self->_cardDAVUID, "copy");
}

- (NSDictionary)activityAlerts
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact callAlert](self, "callAlert");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_setNonNilObject:forKey:", v4, CFSTR("callAlert"));

  -[CNContact textAlert](self, "textAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_setNonNilObject:forKey:", v5, CFSTR("textAlert"));

  return (NSDictionary *)v3;
}

+ (CNContact)contactWithIdentifierOnly:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  +[CNContactKeyVector keyVectorWithKey:](CNContactKeyVector, "keyVectorWithKey:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:availableKeyDescriptor:", v4, v6);

  return (CNContact *)v7;
}

+ (id)contact
{
  return objc_alloc_init((Class)a1);
}

+ (CNContact)contactWithDisplayName:(id)a3 emailOrPhoneNumber:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v14 = v6;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = a3;
    objc_msgSend(v8, "arrayWithObjects:count:", &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "contactWithDisplayName:handleStrings:", v9, v10, v14, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = a3;
    objc_msgSend(a1, "contactWithDisplayName:handleStrings:", v12, MEMORY[0x1E0C9AA60]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (CNContact *)v11;
}

+ (CNContact)contactWithDisplayName:(id)a3 handleStrings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  CNMutableContact *v14;
  void *v15;
  void *v16;
  CNContactClassifiedHandleStringInterpreter *v17;
  void *v18;
  void *v19;
  NSObject *v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "os_log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[CNContact contactWithDisplayName:handleStrings:].cold.5();

  v9 = *MEMORY[0x1E0D13848];
  v10 = (*(uint64_t (**)(_QWORD, id))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v6);
  objc_msgSend(a1, "os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12)
      +[CNContact contactWithDisplayName:handleStrings:].cold.3();
  }
  else if (v12)
  {
    +[CNContact contactWithDisplayName:handleStrings:].cold.4();
  }

  objc_msgSend(a1, "os_log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    +[CNContact contactWithDisplayName:handleStrings:].cold.2(v7, v13);

  v14 = objc_alloc_init(CNMutableContact);
  if (((*(uint64_t (**)(uint64_t, id))(v9 + 16))(v9, v6) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D13AD8], "componentsFromString:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "overrideComponentsInContact:", v14);

  }
  objc_msgSend(MEMORY[0x1E0D13A70], "classificationOfHandleStrings:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CNContactClassifiedHandleStringInterpreter initWithHandleStringClassification:]([CNContactClassifiedHandleStringInterpreter alloc], "initWithHandleStringClassification:", v16);
  -[CNContactClassifiedHandleStringInterpreter emailAddresses](v17, "emailAddresses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setEmailAddresses:](v14, "setEmailAddresses:", v18);

  -[CNContactClassifiedHandleStringInterpreter phoneNumbers](v17, "phoneNumbers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setPhoneNumbers:](v14, "setPhoneNumbers:", v19);

  objc_msgSend(a1, "freezeIfInstancetypeIsImmutable:", v14);
  objc_msgSend(a1, "os_log");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    +[CNContact contactWithDisplayName:handleStrings:].cold.1();

  return (CNContact *)v14;
}

+ (void)freezeIfInstancetypeIsImmutable:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(a3, "freeze");
}

uint64_t __72__CNContact__contactWithContact_createNewInstance_propertyDescriptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_contactWithContact:createNewInstance:propertyDescriptions:", a2, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

+ (id)emptyContact
{
  if (emptyContact_cn_once_token_11 != -1)
    dispatch_once(&emptyContact_cn_once_token_11, &__block_literal_global_172);
  return (id)emptyContact_cn_once_object_11;
}

void __25__CNContact_emptyContact__block_invoke()
{
  CNContact *v0;
  void *v1;

  v0 = objc_alloc_init(CNContact);
  v1 = (void *)emptyContact_cn_once_object_11;
  emptyContact_cn_once_object_11 = (uint64_t)v0;

}

+ (id)newContactWithPropertyKeys:(id)a3 withValuesFromContact:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E20];
  v7 = a3;
  objc_msgSend(v6, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __62__CNContact_newContactWithPropertyKeys_withValuesFromContact___block_invoke;
  v18 = &unk_1E29FC4F0;
  v19 = v8;
  v20 = v5;
  v9 = v5;
  v10 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v15);

  v11 = (void *)objc_opt_class();
  objc_msgSend(v10, "allObjects", v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_contactWithContact:createNewInstance:propertyDescriptions:", v9, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __62__CNContact_newContactWithPropertyKeys_withValuesFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (_CNIsObject_CNKeyDescriptorPrivate(v3))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __62__CNContact_newContactWithPropertyKeys_withValuesFromContact___block_invoke_2;
    v4[3] = &unk_1E29FC4C8;
    v5 = *(id *)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "_cn_executeGetterForRepresentedKeys:", v4);

  }
}

id __62__CNContact_newContactWithPropertyKeys_withValuesFromContact___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    if (objc_msgSend(*(id *)(a1 + 40), "isKeyAvailable:", v3))
      objc_msgSend(v5, "CNValueForContact:", *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v5, "nilValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithDistinctIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_class();
  +[CN allContactProperties](CN, "allContactProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_contactWithContact:createNewInstance:propertyDescriptions:", self, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "updateStateFromContact:", 0);
  +[CN resetRestrictedPropertiesOnMutableContact:](CN, "resetRestrictedPropertiesOnMutableContact:", v6);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (id)copyWithSelfAsSnapshot
{
  void *v2;
  void *v3;

  v2 = (void *)-[CNContact mutableCopy](self, "mutableCopy");
  objc_msgSend(v2, "freezeWithSelfAsSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)selfOrMutableCopy
{
  return (id)-[CNContact mutableCopy](self, "mutableCopy");
}

+ (id)makeContactAndMergeValuesFromAvailableKeysInContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CN allContactProperties](CN, "allContactProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_contactWithContact:createNewInstance:propertyDescriptions:", v4, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CNKeyDescriptor)availableKeyDescriptor
{
  return (CNKeyDescriptor *)self->_availableKeyDescriptor;
}

- (NSSet)availableKeys
{
  void *v3;
  CNContactKeyVector *availableKeyDescriptor;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  availableKeyDescriptor = self->_availableKeyDescriptor;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __26__CNContact_availableKeys__block_invoke;
  v8[3] = &unk_1E29F9C50;
  v9 = v3;
  v5 = v3;
  -[CNContactKeyVector enumeratePropertiesUsingBlock:](availableKeyDescriptor, "enumeratePropertiesUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return (NSSet *)v6;
}

void __26__CNContact_availableKeys__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "key");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (BOOL)isUnifiedWithContactsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (-[CNContact isUnified](self, "isUnified"))
  {
    if (objc_msgSend(v4, "count"))
    {
      v5 = (void *)MEMORY[0x1E0C99E60];
      -[CNContact allLinkedIdentifiers](self, "allLinkedIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setWithArray:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isSubsetOfSet:", v7);

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

uint64_t __33__CNContact_allLinkedIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

+ (id)descriptorForAllComparatorKeys
{
  return +[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 1003);
}

+ (CNKeyDescriptor)descriptorForAllImageDataKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  +[CN allImageDataPropertyKeys](CN, "allImageDataPropertyKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact descriptorWithKeyDescriptors:description:](CNContact, "descriptorWithKeyDescriptors:description:", v3, CFSTR("+[CNContact descriptorForAllImageDataKeys]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNKeyDescriptor *)v4;
}

void __63__CNContact_areKeysAvailable_useIgnorableKeys_findMissingKeys___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "key");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (NSString)stringForIndexing
{
  CNContactSearchIndexFormatter *v3;
  void *v4;

  v3 = objc_alloc_init(CNContactSearchIndexFormatter);
  -[CNContactSearchIndexFormatter stringFromContact:](v3, "stringFromContact:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

id __27__CNContact_termsOfAddress__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F0] + 16))())
    v3 = 0;
  else
    v3 = v2;
  v4 = v3;

  return v4;
}

- (BOOL)isImplicitAugmentation
{
  return -[CNContact flags](self, "flags") & 1;
}

- (NSString)fullName
{
  return +[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", self, 0);
}

- (NSString)phoneticFullName
{
  return +[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", self, 1);
}

- (BOOL)hasChanges
{
  CNContact *v2;
  void *v3;

  v2 = self;
  -[CNContact snapshot](self, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = !-[CNContact isEqual:](v2, "isEqual:", v3);

  return (char)v2;
}

- (id)diffToSnapshotAndReturnError:(id *)a3
{
  void *v5;
  void *v6;

  -[CNContact snapshot](self, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactDiff diffContact:to:error:](CNContactDiff, "diffContact:to:error:", v5, self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __21__CNContact_isEqual___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "storeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "storeIdentifier");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (!v3)
    goto LABEL_6;
LABEL_7:

  return v6;
}

uint64_t __21__CNContact_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "areAllAvailableKeysEqualToContact:ignoringIdentifiers:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __21__CNContact_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "areAllPropertiesButContactIdentifierEqualToContact:", *(_QWORD *)(a1 + 40));
}

- (BOOL)areAllAvailableKeysEqualToContact:(id)a3 ignoringIdentifiers:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;

  v4 = a4;
  v6 = a3;
  -[CNContact availableKeyDescriptor](self, "availableKeyDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availableKeyDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    v17 = 1;
  }
  else
  {
    if (v4)
    {
      if (areAllAvailableKeysEqualToContact_ignoringIdentifiers__cn_once_token_13 != -1)
        dispatch_once(&areAllAvailableKeysEqualToContact_ignoringIdentifiers__cn_once_token_13, &__block_literal_global_221);
      v9 = (id)areAllAvailableKeysEqualToContact_ignoringIdentifiers__cn_once_object_13;
      -[CNContact keyVector](self, "keyVector");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      objc_msgSend(v6, "keyVector");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      objc_msgSend(v11, "minusKeyVector:", v9);
      objc_msgSend(v13, "minusKeyVector:", v9);

      v15 = v11;
      v16 = v13;
    }
    else
    {
      -[CNContact keyVector](self, "keyVector");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "keyVector");
      v14 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v14;
      v15 = v11;
      v16 = (void *)v14;
    }
    v17 = __67__CNContact_areAllAvailableKeysEqualToContact_ignoringIdentifiers___block_invoke(v14, v15, v16);

  }
  return v17;
}

uint64_t __67__CNContact_areAllAvailableKeysEqualToContact_ignoringIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = v4;
  if (a2 && v4)
  {
    v6 = objc_msgSend(a2, "isEqualToKeyVector:", v4);
LABEL_7:
    v7 = v6;
    goto LABEL_8;
  }
  if ((objc_msgSend(a2, "containsAllKeys") & 1) == 0)
  {
    v6 = objc_msgSend(v5, "containsAllKeys");
    goto LABEL_7;
  }
  v7 = 1;
LABEL_8:

  return v7;
}

void __67__CNContact_areAllAvailableKeysEqualToContact_ignoringIdentifiers___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("identifier");
  v3[1] = CFSTR("iOSLegacyIdentifier");
  v3[2] = CFSTR("linkIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)areAllAvailableKeysEqualToContact_ignoringIdentifiers__cn_once_object_13;
  areAllAvailableKeysEqualToContact_ignoringIdentifiers__cn_once_object_13 = v1;

}

- (BOOL)areAllPropertiesButContactIdentifierEqualToContact:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  +[CN allContactProperties](CN, "allContactProperties", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        +[CN identifierDescription](CN, "identifierDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 != v11)
        {
          objc_msgSend(v10, "key");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[CNContact isKeyAvailable:](self, "isKeyAvailable:", v12);

          if (v13 && !objc_msgSend(v10, "isEqualForContact:other:", self, v4))
          {
            v14 = 0;
            goto LABEL_13;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (BOOL)isProperty:(id)a3 equalToOtherIgnoreIdentifiers:(id)a4
{
  return objc_msgSend(a3, "isEqualIgnoringIdentifiersForContact:other:", self, a4);
}

- (BOOL)areAllPropertiesEqualToContactIgnoringIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _BOOL4 v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  +[CN writableContactProperties](CN, "writableContactProperties", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "key");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[CNContact isKeyAvailable:](self, "isKeyAvailable:", v11);

        if (v12
          && !-[CNContact isProperty:equalToOtherIgnoreIdentifiers:](self, "isProperty:equalToOtherIgnoreIdentifiers:", v10, v4))
        {
          v13 = 0;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_12:

  return v13;
}

uint64_t __40__CNContact_isEqualIgnoringIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "areAllAvailableKeysEqualToContact:ignoringIdentifiers:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __40__CNContact_isEqualIgnoringIdentifiers___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "areAllPropertiesEqualToContactIgnoringIdentifiers:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__CNContact_comparatorForNameSortOrder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CNContactFormatter *v7;
  void *v8;
  id v9;
  uint64_t (**v10)(void *, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  _QWORD aBlock[4];
  id v20;
  _QWORD v21[10];

  v21[9] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(CNContactFormatter);
  -[CNContactFormatter setStyle:](v7, "setStyle:", 1003);
  -[CNContactFormatter setSortOrder:](v7, "setSortOrder:", *(_QWORD *)(a1 + 32));
  v21[0] = CFSTR("familyName");
  v21[1] = CFSTR("phoneticFamilyName");
  v21[2] = CFSTR("givenName");
  v21[3] = CFSTR("phoneticGivenName");
  v21[4] = CFSTR("middleName");
  v21[5] = CFSTR("phoneticMiddleName");
  v21[6] = CFSTR("nickname");
  v21[7] = CFSTR("organizationName");
  v21[8] = CFSTR("phoneticOrganizationName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CNContact_comparatorForNameSortOrder___block_invoke_2;
  aBlock[3] = &unk_1E29FC6D8;
  v9 = v8;
  v20 = v9;
  v10 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactFormatter stringFromContact:attributes:](v7, "stringFromContact:attributes:", v5, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactFormatter stringFromContact:attributes:](v7, "stringFromContact:attributes:", v6, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10[2](v10, v11);
    v16 = v10[2](v10, v12);
    if (!v15 || v16)
    {
      if ((v16 ^ 1 | v15) == 1)
        v17 = objc_msgSend(v13, "localizedStandardCompare:", v14);
      else
        v17 = 1;
    }
    else
    {
      v17 = -1;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __40__CNContact_comparatorForNameSortOrder___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__CNContact_comparatorForNameSortOrder___block_invoke_3;
  v6[3] = &unk_1E29FC6B0;
  v7 = *(id *)(a1 + 32);
  v8 = &v9;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = *((unsigned __int8 *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v4;
}

void __40__CNContact_comparatorForNameSortOrder___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__CNContact_comparatorForNameSortOrder___block_invoke_4;
  v7[3] = &unk_1E29FC688;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __40__CNContact_comparatorForNameSortOrder___block_invoke_4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(a2, "isEqual:", CFSTR("contactProperty"))
    && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

+ (id)preferredImageComparator
{
  if (preferredImageComparator_cn_once_token_14 != -1)
    dispatch_once(&preferredImageComparator_cn_once_token_14, &__block_literal_global_230);
  return (id)preferredImageComparator_cn_once_object_14;
}

void __37__CNContact_preferredImageComparator__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = &__block_literal_global_229;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CNAggregateComparator();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)preferredImageComparator_cn_once_object_14;
  preferredImageComparator_cn_once_object_14 = v2;

}

- (id)linkedIdentifierMap
{
  void *v3;
  void *v4;
  void *v5;

  -[CNContact snapshot](self, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact linkedContacts](self, "linkedContacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN identifierMapForUnifiedContact:backingContacts:](CN, "identifierMapForUnifiedContact:backingContacts:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)unifyContacts:(id)a3
{
  return +[CN contactUnifyingContacts:includingMainStoreContacts:allowMutableContactFreeze:](CN, "contactUnifyingContacts:includingMainStoreContacts:allowMutableContactFreeze:", a3, 1, 0);
}

+ (id)previewURLForContact:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB3998];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_msgSend(v4, "isUnified");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = v7;
  objc_msgSend(v5, "setScheme:", CFSTR("addressbook"));
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setHost:", v9);
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("unify"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQueryItems:", v11);

  objc_msgSend(v5, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (void)you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CNPropertyNotFetchedException"), CFSTR("A property was not requested when contact was fetched."));
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)cropRectID
{
  return self->_cropRectID;
}

- (NSData)cropRectHash
{
  return self->_cropRectHash;
}

- (NSString)sortingGivenName
{
  return self->_sortingGivenName;
}

- (NSString)sortingFamilyName
{
  return self->_sortingFamilyName;
}

- (int64_t)displayNameOrder
{
  return self->_displayNameOrder;
}

- (NSArray)relatedNames
{
  void *v2;
  void *v3;

  -[CNContact contactRelations](self, "contactRelations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.contacts.contact.persisted");
  v3[1] = CFSTR("com.apple.contacts.contact");
  v3[2] = *MEMORY[0x1E0CA5CB0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(a1, "isContactUTIType:", v9))
  {
    objc_msgSend(a1, "contactWithArchivedData:error:", v8, a5);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = (void *)v10;
    goto LABEL_9;
  }
  if (objc_msgSend(a1, "isVCardDataUTIType:", v9))
  {
    objc_msgSend(a1, "contactWithVCardData:error:", v8, a5);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a5)
    *a5 = objc_retainAutorelease(v12);

  v11 = 0;
LABEL_9:

  return v11;
}

+ (BOOL)isContactUTIType:(id)a3
{
  __CFString *v3;
  BOOL v4;

  v3 = (__CFString *)a3;
  if (UTTypeConformsTo(v3, CFSTR("com.apple.contacts.contact")))
    v4 = 1;
  else
    v4 = UTTypeConformsTo(v3, CFSTR("com.apple.contacts.contact.persisted")) != 0;

  return v4;
}

+ (BOOL)isVCardDataUTIType:(id)a3
{
  return UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E0CA5CB0]) != 0;
}

+ (CNContact)contactWithArchivedData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D13968];
  v6 = a3;
  v15 = 0;
  objc_msgSend(v5, "decodeObjectOfClass:data:error:", objc_opt_class(), v6, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v15;
  v9 = v8;
  if (v7)
  {
    v10 = v7;
  }
  else
  {
    if (v8)
    {
      v16 = *MEMORY[0x1E0CB3388];
      v17[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a4)
      *a4 = objc_retainAutorelease(v12);

  }
  return (CNContact *)v7;
}

+ (CNContact)contactWithVCardData:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  +[CNContactVCardSerialization contactsWithData:error:](CNContactVCardSerialization, "contactsWithData:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_5;
  if (!objc_msgSend(v5, "count"))
  {
    CNSetError(a4, 700, 0);
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return (CNContact *)v7;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.contacts.contact");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)writableTypeIdentifiersForItemProvider
{
  const __CFString *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  const __CFString **v9;
  uint64_t v10;
  const __CFString *v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (-[CNContact hasBeenPersisted](self, "hasBeenPersisted"))
    v3 = CFSTR("com.apple.contacts.contact.persisted");
  else
    v3 = CFSTR("com.apple.contacts.contact");
  +[CNContactVCardSerialization descriptorForRequiredKeys](CNContactVCardSerialization, "descriptorForRequiredKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContact areKeysAvailable:](self, "areKeysAvailable:", v5);

  if (v6)
  {
    v7 = *MEMORY[0x1E0CA5CB0];
    v13[0] = v3;
    v13[1] = v7;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = (const __CFString **)v13;
    v10 = 2;
  }
  else
  {
    v12 = v3;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = &v12;
    v10 = 1;
  }
  objc_msgSend(v8, "arrayWithObjects:count:", v9, v10);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  if (objc_msgSend((id)objc_opt_class(), "isContactUTIType:", v6))
  {
    objc_msgSend(MEMORY[0x1E0D13968], "encodeObject:error:", self, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, 0);

  }
  else if (objc_msgSend((id)objc_opt_class(), "isVCardDataUTIType:", v6))
  {
    v15[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    +[CNContactVCardSerialization dataWithContacts:error:](CNContactVCardSerialization, "dataWithContacts:error:", v9, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;

    if (v10)
      v12 = 0;
    else
      v12 = v11;
    ((void (**)(id, void *, id))v7)[2](v7, v10, v12);

  }
  else
  {
    v7[2](v7, 0, 0);
  }

  return 0;
}

+ (id)contactFromSuggestion:(id)a3
{
  return CNContactFromSGContact(a3, 0);
}

+ (id)contactIdentifierFromSuggestionID:(id)a3
{
  void *v3;
  void *v4;

  CNSuggestedContactFoundInBundle_block_invoke((uint64_t)a1, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactStore contactIdentifierFromInternalIdentifier:](CNSuggestedContactStore, "contactIdentifierFromInternalIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)suggestionIDFromContactIdentifier:(id)a3
{
  void *v3;
  void *v4;

  +[CNContactStore internalIdentifierFromContactIdentifier:](CNSuggestedContactStore, "internalIdentifierFromContactIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CNSuggestedContactFoundInBundle_block_invoke_2((uint64_t)v3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SGRecordId)suggestionRecordId
{
  void *v2;
  void *v3;

  -[CNContact storeInfo](self, "storeInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CNSuggestedContactRecordIdKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SGRecordId *)v3;
}

- (NSString)suggestionFoundInBundleId
{
  void *v2;
  void *v3;

  -[CNContact storeInfo](self, "storeInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CNSuggestedContactFoundInBundle);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)copyWithCuratingAllSuggestions
{
  +[CNContact makeContactAndMergeValuesFromAvailableKeysInContact:](CNContact, "makeContactAndMergeValuesFromAvailableKeysInContact:", self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasSuggestedProperties
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  _QWORD v27[6];

  v27[5] = *MEMORY[0x1E0C80C00];
  v27[0] = CFSTR("phoneNumbers");
  v27[1] = CFSTR("emailAddresses");
  v27[2] = CFSTR("postalAddresses");
  v27[3] = CFSTR("socialProfiles");
  v27[4] = CFSTR("dates");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 5);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (-[CNContact isKeyAvailable:](self, "isKeyAvailable:", v8))
        {
          -[CNContact valueForKey:](self, "valueForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v18;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v18 != v13)
                  objc_enumerationMutation(v10);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "isSuggested") & 1) != 0)
                {

                  v15 = 1;
                  goto LABEL_21;
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
              if (v12)
                continue;
              break;
            }
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v15 = 0;
    }
    while (v5);
  }
  else
  {
    v15 = 0;
  }
LABEL_21:

  return v15;
}

+ (id)predicateForSuggestionIdentifier:(unint64_t)a3
{
  return -[CNSuggestedContactIdentifierPredicate initWithSuggestionIdentifier:]([CNSuggestedContactIdentifierPredicate alloc], "initWithSuggestionIdentifier:", a3);
}

- (NSUUID)id
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  CNContact *v7;
  NSString *v8;
  id v9;
  void *v10;
  uint64_t v12;

  v3 = sub_18FA28108();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  v8 = -[CNContact identifier](v7, sel_identifier);
  if (!v8)
  {
    sub_18FA2833C();
    v8 = (NSString *)sub_18FA28330();
    swift_bridgeObjectRelease();
  }
  v9 = objc_msgSend((id)objc_opt_self(), sel_uuidFromContactIdentifier_, v8);

  sub_18FA280F0();
  v10 = (void *)sub_18FA280E4();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v10;
}

+ (void)contactWithDisplayName:handleStrings:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18F8BD000, v0, v1, "< +[CNContact contactWithDisplayName:handleStrings:]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)contactWithDisplayName:(void *)a1 handleStrings:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2(&dword_18F8BD000, a2, v3, "    handleStrings: %lu", v4);
  OUTLINED_FUNCTION_1();
}

+ (void)contactWithDisplayName:handleStrings:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2(&dword_18F8BD000, v0, v1, "    displayName: %{public}@", v2);
}

+ (void)contactWithDisplayName:handleStrings:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2(&dword_18F8BD000, v0, v1, "    displayName: %@", v2);
}

+ (void)contactWithDisplayName:handleStrings:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18F8BD000, v0, v1, "> +[CNContact contactWithDisplayName:handleStrings:]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithIdentifier:(void *)a1 availableKeyDescriptor:.cold.1(void *a1)
{
  NSObject *v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_18F8BD000, v1, OS_LOG_TYPE_FAULT, "parameter ‘internalIdentifier’ must be nonnull and of type %{public}@", v2, 0xCu);

  OUTLINED_FUNCTION_1();
}

+ (void)_contactWithContact:createNewInstance:propertyDescriptions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18F8BD000, v0, v1, "parameter ‘propertyDescriptions’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)_contactWithContact:createNewInstance:propertyDescriptions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18F8BD000, v0, v1, "parameter ‘contact’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithCoder:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_18F8BD000, v0, OS_LOG_TYPE_ERROR, "Error decoding CNContact: no internal identifier", v1, 2u);
  OUTLINED_FUNCTION_4();
}

@end
