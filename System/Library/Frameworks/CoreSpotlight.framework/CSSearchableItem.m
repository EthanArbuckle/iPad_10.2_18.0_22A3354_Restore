@implementation CSSearchableItem

- (NSString)bundleID
{
  void *v2;
  void *v3;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_standardizePeople:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CSSearchableItem *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CSSearchableItem *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  int v43;
  uint64_t v44;
  __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;

  v50 = a3;
  -[CSSearchableItem _fixBrokenAuthorNames:](self, "_fixBrokenAuthorNames:", v50);
  objc_msgSend(v50, "authorNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "authors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "attributeForKey:", CFSTR("kMDItemAuthorsDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "attributeForKey:", CFSTR("kMDItemAuthorContactProperties"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItem _populateMissingPeopleWithNames:emailAddresses:allItemPersons:primaryItemPersons:additionalItemPersons:hiddenAdditionalItemPersons:personDictionary:contactProperties:nameKey:emailKey:contactIdentifierKey:personKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:](self, "_populateMissingPeopleWithNames:emailAddresses:allItemPersons:primaryItemPersons:additionalItemPersons:hiddenAdditionalItemPersons:personDictionary:contactProperties:nameKey:emailKey:contactIdentifierKey:personKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:", v4, v5, v6, 0, 0, 0, v7, v8, CFSTR("kMDItemAuthors"), CFSTR("kMDItemAuthorEmailAddresses"), CFSTR("kMDItemAuthorContactIdentifiers"), CFSTR("kMDItemAuthorPersons"), CFSTR("kMDItemAuthorPhotosPersonIdentifiers"), CFSTR("kMDItemPhotosPeopleTypes"), CFSTR("kMDItemPhotosPeopleNamesAlternatives"),
    CFSTR("kMDItemPhotosPeopleFaceAttributes"),
    v50);

  objc_msgSend(v50, "primaryRecipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "primaryRecipients");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v12);

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v50, "additionalRecipients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v50, "additionalRecipients");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v15);

  }
  objc_msgSend(v50, "hiddenAdditionalRecipients");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v50, "hiddenAdditionalRecipients");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v18);

  }
  objc_msgSend(v50, "attributeForKey:", CFSTR("kMDItemPrimaryRecipientsDictionary"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addEntriesFromDictionary:", v19);
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v50, "attributeForKey:", CFSTR("kMDItemAdditionalRecipientsDictionary"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count"))
  {
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "addEntriesFromDictionary:", v21);
  }
  objc_msgSend(v50, "attributeForKey:", CFSTR("kMDItemHiddenAdditionalRecipientsDictionary"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = v22;
  if (objc_msgSend(v22, "count"))
  {
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "addEntriesFromDictionary:", v22);
  }
  objc_msgSend(v50, "attributeForKey:", CFSTR("kMDItemPrimaryRecipientContactProperties"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObjectsFromArray:", v23);
  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(v50, "attributeForKey:", CFSTR("kMDItemAdditionalRecipientContactProperties"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v25, "count"))
  {
    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "addObjectsFromArray:", v25);
  }
  objc_msgSend(v50, "attributeForKey:", CFSTR("kMDItemHiddenAdditionalRecipientContactProperties"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v26, "count"))
  {
    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "addObjectsFromArray:", v26);
  }
  v48 = v24;
  v49 = v20;
  v46 = v26;
  v27 = self;
  if (objc_msgSend(v11, "count"))
    v28 = 0;
  else
    v28 = CFSTR("kMDItemPrimaryRecipientPersons");
  objc_msgSend(v50, "recipientNames");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "recipientEmailAddresses");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "primaryRecipients");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "additionalRecipients");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "hiddenAdditionalRecipients");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v28;
  -[CSSearchableItem _populateMissingPeopleWithNames:emailAddresses:allItemPersons:primaryItemPersons:additionalItemPersons:hiddenAdditionalItemPersons:personDictionary:contactProperties:nameKey:emailKey:contactIdentifierKey:personKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:](v27, "_populateMissingPeopleWithNames:emailAddresses:allItemPersons:primaryItemPersons:additionalItemPersons:hiddenAdditionalItemPersons:personDictionary:contactProperties:nameKey:emailKey:contactIdentifierKey:personKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:", v29, v30, v11, v31, v32, v33, v49, v48, CFSTR("kMDItemRecipients"), CFSTR("kMDItemRecipientEmailAddresses"), CFSTR("kMDItemRecipientContactIdentifiers"), v28, CFSTR("kMDItemRecipientPhotosPersonIdentifiers"), CFSTR("kMDItemPhotosPeopleTypes"), CFSTR("kMDItemPhotosPeopleNamesAlternatives"),
    CFSTR("kMDItemPhotosPeopleFaceAttributes"),
    v50);

  objc_msgSend(v50, "photosPeople");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "count"))
  {
    -[CSSearchableItem extractAndStandardizePersonInformation:contactIdentifierKey:emailKey:nameKey:emailAddressExtractKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:contactIdentifiers:emails:names:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:persons:](v27, "extractAndStandardizePersonInformation:contactIdentifierKey:emailKey:nameKey:emailAddressExtractKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:contactIdentifiers:emails:names:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:persons:", v50, CFSTR("kMDItemPhotosPeopleContactIdentifiers"), 0, CFSTR("kMDItemPhotosPeopleNames"), 0, CFSTR("kMDItemPhotosPeoplePersonIdentifiers"), CFSTR("kMDItemPhotosPeopleTypes"), CFSTR("kMDItemPhotosPeopleNamesAlternatives"), CFSTR("kMDItemPhotosPeopleFaceAttributes"), 0, 0, 0, 0, 0, 0,
      0,
      0,
      0,
      v34);
    v35 = v27;
    v37 = v11;
    v36 = v48;
    v39 = v45;
    v38 = v46;
LABEL_39:
    v40 = v50;
    goto LABEL_40;
  }
  v42 = -[CSSearchableItem isUpdate](v27, "isUpdate");
  v35 = v27;
  v37 = v11;
  v36 = v48;
  v39 = v45;
  v38 = v46;
  v40 = v50;
  if (v42)
  {
    v43 = objc_msgSend(v50, "attributeIsDelete:", CFSTR("kMDItemPhotosPeople"));
    v40 = v50;
    if (v43)
    {
      v44 = *MEMORY[0x1E0C9B0D0];
      objc_msgSend(v50, "setAttribute:forKey:", *MEMORY[0x1E0C9B0D0], CFSTR("kMDItemPhotosPeopleContactIdentifiers"));
      objc_msgSend(v50, "setAttribute:forKey:", v44, CFSTR("kMDItemPhotosPeopleNames"));
      objc_msgSend(v50, "setAttribute:forKey:", v44, CFSTR("kMDItemPhotosPeoplePersonIdentifiers"));
      objc_msgSend(v50, "setAttribute:forKey:", v44, CFSTR("kMDItemPhotosPeopleTypes"));
      objc_msgSend(v50, "setAttribute:forKey:", v44, CFSTR("kMDItemPhotosPeopleNamesAlternatives"));
      objc_msgSend(v50, "setAttribute:forKey:", v44, CFSTR("kMDItemPhotosPeopleNamesAlternativesCounts"));
      objc_msgSend(v50, "setAttribute:forKey:", v44, CFSTR("kMDItemPhotosPeopleFaceAttributes"));
      objc_msgSend(v50, "setAttribute:forKey:", v44, CFSTR("kMDItemPhotosPeopleFaceAttributesCounts"));
      objc_msgSend(v50, "setAttribute:forKey:", v44, CFSTR("kMDItemPhotosPeopleEmailAddresses"));
      objc_msgSend(v50, "setAttribute:forKey:", v44, CFSTR("kMDItemPhotosPeoplePhoneNumbers"));
      goto LABEL_39;
    }
  }
LABEL_40:
  objc_msgSend(v40, "photosSharedLibraryContributors");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "count"))
    -[CSSearchableItem extractAndStandardizePersonInformation:contactIdentifierKey:emailKey:nameKey:emailAddressExtractKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:contactIdentifiers:emails:names:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:persons:](v35, "extractAndStandardizePersonInformation:contactIdentifierKey:emailKey:nameKey:emailAddressExtractKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:contactIdentifiers:emails:names:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:persons:", v50, CFSTR("kMDItemPhotosSharedLibraryContributorsContactIdentifiers"), 0, CFSTR("kMDItemPhotosSharedLibraryContributorsNames"), 0, CFSTR("kMDItemPhotosSharedLibraryContributorsPersonIdentifiers"), 0, CFSTR("kMDItemPhotosSharedLibraryContributorsNamesAlternatives"), 0, 0, 0, 0, 0, 0, 0,
      0,
      0,
      0,
      v41);

}

- (void)_fixBrokenAuthorNames:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "authorNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14[0] = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setAuthorNames:", v5);

      }
      else
      {
        logForCSLogCategoryIndex();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          -[CSSearchableItem(Internal) _fixBrokenAuthorNames:].cold.2((uint64_t)v4, v6, &v12);
          v7 = v12;
        }
        else
        {
          v7 = CFSTR("kMDItemAuthors");
        }

        objc_msgSend(v3, "setAttribute:forKey:", 0, v7);
      }
    }
  }
  objc_msgSend(v3, "recipientNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setRecipientNames:", v9);

      }
      else
      {
        logForCSLogCategoryIndex();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          -[CSSearchableItem(Internal) _fixBrokenAuthorNames:].cold.1((uint64_t)v8, v10, &v12);
          v11 = v12;
        }
        else
        {
          v11 = CFSTR("kMDItemRecipients");
        }

        objc_msgSend(v3, "setAttribute:forKey:", 0, v11);
      }
    }
  }

}

+ (id)searchableItemFromUserActivity:(id)a3 bundleID:(id)a4
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  _BOOL4 v30;
  void *v31;
  int v32;
  void *v33;
  CSSearchableItem *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  id v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, void *, void *, void *);
  void *v51;
  id v52;
  id v53;
  NSObject *v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setContentType:", *MEMORY[0x1E0CA5BA0]);
  objc_msgSend(v5, "activityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserActivityType:", v8);

  objc_msgSend(v5, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayName:", v10);

    objc_msgSend(v5, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v11);

  }
  objc_msgSend(v5, "webpageURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v5, "webpageURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentURL:", v13);

  }
  objc_msgSend(v5, "keywords");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v5, "keywords");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setKeywords:", v16);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "performSelector:", sel_suggestedInvocationPhrase);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "setSuggestedInvocationPhrase:", v17);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v18 = objc_msgSend(v5, "performSelector:", sel_shortcutAvailability);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShortcutAvailability:", v19);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isEligibleForPublicIndexing"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttribute:forKey:", v20, CFSTR("_kMDItemUserActivityEligibleForPublicIndexing"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isEligibleForSearch"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttribute:forKey:", v21, CFSTR("_kMDItemUserActivityEligibleForSearch"));

  objc_msgSend(v5, "contentAttributeSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttributesFromAttributeSet:", v22);
  v23 = dispatch_group_create();
  dispatch_group_enter(v23);
  v48 = MEMORY[0x1E0C809B0];
  v49 = 3221225472;
  v50 = __70__CSSearchableItem_Internal__searchableItemFromUserActivity_bundleID___block_invoke;
  v51 = &unk_1E24016B0;
  v24 = v5;
  v52 = v24;
  v25 = v7;
  v53 = v25;
  v26 = v23;
  v54 = v26;
  if ((objc_msgSend(v24, "_createUserActivityStringsWithOptions:completionHandler:", 0, &v48) & 1) == 0)
    dispatch_group_leave(v26);
  dispatch_group_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v24, "performSelector:", sel_persistentIdentifier);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v27, "length"))
    {
      objc_msgSend(CFSTR("NSUA:"), "stringByAppendingString:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setUniqueIdentifier:", v28);

    }
  }
  v29 = +[CSSearchableIndex activityShouldBeIndexed:bundleID:](CSSearchableIndex, "activityShouldBeIndexed:bundleID:", v24, v6);
  v30 = v29;
  if (v6)
  {
    if (v29)
    {
      +[CSSearchableIndex mainBundleID](CSSearchableIndex, "mainBundleID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEqualToString:", v6);

      if (v32)
      {
        +[CSSearchableIndex mainBundleLocalizedString](CSSearchableIndex, "mainBundleLocalizedString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
          objc_msgSend(v25, "setApplicationName:", v33);

      }
    }
  }
  v34 = -[CSSearchableItem initWithAttributeSet:]([CSSearchableItem alloc], "initWithAttributeSet:", v25);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 2592000.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItem setExpirationDate:](v34, "setExpirationDate:", v35);

  if (!v30)
    -[CSSearchableItem setNoIndex:](v34, "setNoIndex:", 1);
  logForCSLogCategoryDefault();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    -[CSSearchableItem uniqueIdentifier](v34, "uniqueIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v24;
    v38 = v26;
    v39 = v25;
    v40 = v22;
    v41 = v6;
    if (v30)
      v42 = CFSTR("YES");
    else
      v42 = CFSTR("NO");
    -[CSSearchableItem attributeSet](v34, "attributeSet", v46, v48, v49, v50, v51, v52, v53);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "userActivityType");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v56 = v37;
    v57 = 2112;
    v58 = v42;
    v6 = v41;
    v22 = v40;
    v25 = v39;
    v26 = v38;
    v24 = v47;
    v59 = 2112;
    v60 = v44;
    v61 = 2112;
    v62 = v6;
    _os_log_impl(&dword_18C42F000, v36, OS_LOG_TYPE_INFO, "Created UA item, identifier:%@, shouldIndex:%@, userActivityType:%@, bundleID:%@", buf, 0x2Au);

  }
  return v34;
}

- (CSSearchableItem)initWithAttributeSet:(id)a3
{
  id v5;
  CSSearchableItem *v6;
  CSSearchableItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSSearchableItem;
  v6 = -[CSSearchableItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_attributeSet, a3);

  return v7;
}

- (NSString)uniqueIdentifier
{
  void *v2;
  void *v3;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isUpdate
{
  void *v2;
  BOOL v3;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "searchableItemFlags") & 1;

  return v3;
}

- (CSSearchableItemAttributeSet)attributeSet
{
  CSSearchableItem *v2;
  CSSearchableItemAttributeSet *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_attributeSet;
  objc_sync_exit(v2);

  return v3;
}

- (void)_standardizeHTML:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "attributeForKey:", CFSTR("kMDItemHTMLContent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v11, "HTMLContentData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(v3, "dataUsingEncoding:", 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHTMLContentData:", v5);

    }
    objc_msgSend(v11, "setAttribute:forKey:", 0, CFSTR("kMDItemHTMLContent"));
  }
  objc_msgSend(v11, "textContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v11, "HTMLContentData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = objc_msgSend(v7, "length");
      if (v8 >= 0xC350)
        v9 = 50000;
      else
        v9 = v8;
      _MDPlainTextFromHTMLData(v7, v9, 0, 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "length"))
        objc_msgSend(v11, "setTextContent:", v10);

    }
  }

}

void __70__CSSearchableItem_Internal__searchableItemFromUserActivity_bundleID___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
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
  unint64_t v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "webpageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "webpageURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataUsingEncoding:", 10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "dataUsingEncoding:", 10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[0] = 0;
  v25[1] = 0;
  v14 = objc_retainAutorelease(v13);
  MurmurHash3_128(objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), 0, v25);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v25, 16, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "base64EncodedStringWithOptions:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setUniqueIdentifier:", v16);

  if (v7)
    objc_msgSend(*(id *)(a1 + 40), "setAttribute:forKey:", v7, CFSTR("_kMDItemUserActivityRequiredString"));
  if (v8)
    objc_msgSend(*(id *)(a1 + 40), "setAttribute:forKey:", v8, CFSTR("_kMDItemUserActivitySecondaryString"));
  if (v9)
    objc_msgSend(*(id *)(a1 + 40), "setAttribute:forKey:", v9, CFSTR("_kMDItemUserActivityData"));
  v17 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAttribute:forKey:", v19, CFSTR(":A:_kMDItemRankingLaunchDates"));

  v20 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAttribute:forKey:", v21, CFSTR("kMDItemLastUsedDate"));

  v22 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAttribute:forKey:", v23, CFSTR("kMDItemContentCreationDate"));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeSet, 0);
}

- (CSSearchableItem)initWithUniqueIdentifier:(NSString *)uniqueIdentifier domainIdentifier:(NSString *)domainIdentifier attributeSet:(CSSearchableItemAttributeSet *)attributeSet
{
  NSString *v8;
  NSString *v9;
  CSSearchableItemAttributeSet *v10;
  CSSearchableItem *v11;
  CSSearchableItem *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = uniqueIdentifier;
  v9 = domainIdentifier;
  v10 = attributeSet;
  v18.receiver = self;
  v18.super_class = (Class)CSSearchableItem;
  v11 = -[CSSearchableItem init](&v18, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_8;
  if (v10)
  {
    -[CSSearchableItem setAttributeSet:](v11, "setAttributeSet:", v10);
    if (v8)
      goto LABEL_4;
  }
  else
  {
    v15 = (void *)objc_opt_new();
    -[CSSearchableItem setAttributeSet:](v12, "setAttributeSet:", v15);

    if (v8)
    {
LABEL_4:
      -[CSSearchableItem setUniqueIdentifier:](v12, "setUniqueIdentifier:", v8);
      if (!v9)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItem setUniqueIdentifier:](v12, "setUniqueIdentifier:", v17);

  if (v9)
LABEL_5:
    -[CSSearchableItem setDomainIdentifier:](v12, "setDomainIdentifier:", v9);
LABEL_6:
  -[CSSearchableItem expirationDate](v12, "expirationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    -[CSSearchableItem setExpirationDate:](v12, "setExpirationDate:", 0);
LABEL_8:

  return v12;
}

- (void)setExpirationDate:(NSDate *)expirationDate
{
  NSDate *v4;
  double v5;
  void *v6;
  NSDate *v7;

  v4 = expirationDate;
  if (!v4)
  {
    if ((hasInternalCSEntitlement() & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)(86400 * ((uint64_t)(v5 + 2678400.0) / 86400)));
      v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
  }
  v7 = v4;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExpirationDate:", v7);

}

- (void)setUniqueIdentifier:(NSString *)uniqueIdentifier
{
  NSString *v4;
  id v5;

  v4 = uniqueIdentifier;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUniqueIdentifier:", v4);

}

- (void)setDomainIdentifier:(NSString *)domainIdentifier
{
  NSString *v4;
  id v5;

  v4 = domainIdentifier;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDomainIdentifier:", v4);

}

- (NSDate)expirationDate
{
  void *v2;
  void *v3;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)_standardizeSiriShortcuts:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  objc_msgSend(v10, "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.siri.interaction")) & 1) == 0)
  {
LABEL_9:

LABEL_10:
    v8 = v10;
    goto LABEL_11;
  }
  objc_msgSend(v10, "userActivityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(v10, "userActivityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("/app/intents"));

  v8 = v10;
  if (v7)
  {
    objc_msgSend(v10, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v10;
    if (!v9)
    {
      objc_msgSend(v10, "attributeForKey:", CFSTR("kMDItemDisplayName"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        objc_msgSend(v10, "setAttribute:forKey:", v3, CFSTR("kMDItemTitle"));
        objc_msgSend(v10, "setAttribute:forKey:", *MEMORY[0x1E0C9B0D0], CFSTR("kMDItemDisplayName"));
      }
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)_standardizePortrait:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "portraitNamedEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAttribute:forKey:", v4, CFSTR("_kMDItemPortraitNamedEntityArray"));
    objc_msgSend(v6, "setAttribute:forKey:", v5, CFSTR("_kMDItemPortraitNamedEntityScoreArray"));
    objc_msgSend(v6, "setPortraitNamedEntities:", 0);

  }
}

- (void)_standardizeMarkAs:(id)a3
{
  objc_msgSend(a3, "_standardizeMarkAs");
}

- (void)_standardizeFileProvider:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  char v30;
  const char *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  void *v65;
  void *v66;
  _BYTE v67[128];
  _QWORD v68[6];

  v68[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "contentURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isFileURL"))
    goto LABEL_16;
  objc_msgSend(v3, "contentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CA5B58]))
  {

    goto LABEL_16;
  }
  objc_msgSend(v3, "documentIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v3, "fileProviderID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v3, "fileItemID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
        goto LABEL_16;
      goto LABEL_10;
    }

  }
LABEL_10:
  if ((objc_msgSend(v4, "cs_addDocumentTracking") & 1) != 0)
  {
    v11 = *MEMORY[0x1E0C9AC50];
    v12 = *MEMORY[0x1E0C99A90];
    v68[0] = *MEMORY[0x1E0C9AC50];
    v68[1] = v12;
    v13 = *MEMORY[0x1E0C9AD30];
    v14 = *MEMORY[0x1E0C998F8];
    v68[2] = *MEMORY[0x1E0C9AD30];
    v68[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0;
    objc_msgSend(v4, "resourceValuesForKeys:error:", v15, &v61);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v61;

    if (v17)
    {
      logForCSLogCategoryIndex();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CSSearchableItem(Internal) _standardizeFileProvider:].cold.1((uint64_t)v4, (uint64_t)v17, v18);
    }
    else
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", v14);
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v3, "setDocumentIdentifier:", v18);
        objc_msgSend(v16, "objectForKeyedSubscript:", v11);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setFileIdentifier:", v33);

        objc_msgSend(v16, "objectForKeyedSubscript:", v12);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setFilename:", v34);

        objc_msgSend(v16, "objectForKeyedSubscript:", v13);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setParentFileIdentifier:", v35);

        objc_msgSend(v3, "fileProviderID");
        v36 = objc_claimAutoreleasedReturnValue();
        if (!v36
          || (v37 = (void *)v36,
              objc_msgSend(v3, "fileItemID"),
              v38 = (void *)objc_claimAutoreleasedReturnValue(),
              v38,
              v37,
              !v38))
        {
          +[CSFPItem itemWithFileURL:](CSFPItem, "itemWithFileURL:", v4);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "searchableItem");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "attributeSet");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v41, "fileProviderID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "fileItemID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v42, "length") && objc_msgSend(v43, "length"))
          {
            v52 = v43;
            v53 = v42;
            v54 = v18;
            v55 = v16;
            v56 = v4;
            objc_msgSend(v41, "attributeDictionary");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            v60 = 0u;
            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
            if (v45)
            {
              v46 = v45;
              v47 = *(_QWORD *)v58;
              do
              {
                for (i = 0; i != v46; ++i)
                {
                  if (*(_QWORD *)v58 != v47)
                    objc_enumerationMutation(v44);
                  v49 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                  if ((objc_msgSend(v49, "isEqualToString:", CFSTR("_kMDItemBundleID")) & 1) == 0
                    && (objc_msgSend(v49, "isEqualToString:", CFSTR("_kMDItemExternalID")) & 1) == 0
                    && (objc_msgSend(v49, "isEqualToString:", CFSTR("kMDItemContentTypeTree")) & 1) == 0)
                  {
                    if (!objc_msgSend(v49, "isEqualToString:", CFSTR("kMDItemContentType"))
                      || (objc_msgSend(v3, "contentType"),
                          v50 = (void *)objc_claimAutoreleasedReturnValue(),
                          v50,
                          !v50))
                    {
                      objc_msgSend(v44, "objectForKeyedSubscript:", v49);
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v3, "setAttribute:forKey:", v51, v49);

                    }
                  }
                }
                v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
              }
              while (v46);
            }
            objc_msgSend(v3, "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("_kMDItemHasClientData"));

            v16 = v55;
            v4 = v56;
            v18 = v54;
            v17 = 0;
            v42 = v53;
            v43 = v52;
          }

        }
      }
    }

  }
  else
  {
    objc_msgSend(v3, "setDocumentIdentifier:", 0);
    objc_msgSend(v3, "setParentFileIdentifier:", 0);
    objc_msgSend(v3, "setFileIdentifier:", 0);
    objc_msgSend(v3, "setFilename:", 0);
  }
LABEL_16:
  objc_msgSend(v3, "FPFilename");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v3, "alternateNames");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "arrayByAddingObject:", v19);
    }
    else
    {
      v66 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlternateNames:", v22);

  }
  v23 = objc_msgSend(v3, "searchableItemFlags");
  objc_msgSend(v3, "fileProviderID");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if ((v23 & 1) != 0)
  {
    if (v24)
    {
      objc_msgSend(v3, "contentType");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("public.folder"));

      if ((v30 & 1) == 0
        && (objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")) & 1) == 0)
      {
        objc_msgSend(v3, "attributeForKey:", CFSTR("FPDownloaded"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v28, "BOOLValue") & 1) == 0)
        {
          objc_msgSend(v3, "setRequiresImport:", MEMORY[0x1E0C9AAA0]);
          objc_msgSend(v3, "setAttribute:forKey:", *MEMORY[0x1E0C9B0D0], CFSTR("_kMDItemImportSandboxExtension"));
        }
        goto LABEL_39;
      }
    }
  }
  else if (v24)
  {
    objc_msgSend(v3, "contentType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("public.folder"));

    if ((v27 & 1) == 0)
    {
      if (!objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")))
      {
        objc_msgSend(v3, "attributeForKey:", CFSTR("FPDownloaded"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          if (objc_msgSend(v28, "BOOLValue"))
            v31 = "Downloaded";
          else
            v31 = "Cloudy";
          objc_msgSend(v3, "contentURL");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v63 = v31;
          v64 = 2112;
          v65 = v32;
          _os_log_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s file at %@", buf, 0x16u);

        }
        if (objc_msgSend(v28, "BOOLValue"))
          objc_msgSend(v3, "setRequiresImport:", MEMORY[0x1E0C9AAB0]);
        goto LABEL_39;
      }
      objc_msgSend(v3, "setRequiresImport:", MEMORY[0x1E0C9AAB0]);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "contentURL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v63 = (const char *)v28;
        _os_log_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Local file at %@", buf, 0xCu);
LABEL_39:

      }
    }
  }

}

- (void)_standardizeDocumentUnderstandingTopics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x18D782104]();
  v6 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(v4, "documentUnderstandingTopics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedSetWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = CFSTR("kMDItemDocumentUnderstandingTopicsLabels");
  v10[1] = CFSTR("kMDItemDocumentUnderstandingTopicsSynonyms");
  v10[2] = CFSTR("kMDItemDocumentUnderstandingTopicsSynonymsCounts");
  v10[3] = CFSTR("kMDItemDocumentUnderstandingTopicsConfidences");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItem _standardizeExternalAnalysisTags:forAttributeSet:primaryAttribute:analysisAttribibutes:specializedAttributes:standardizeBlock:](self, "_standardizeExternalAnalysisTags:forAttributeSet:primaryAttribute:analysisAttribibutes:specializedAttributes:standardizeBlock:", v8, v4, CFSTR("kMDItemDocumentUnderstandingTopics"), v9, MEMORY[0x1E0C9AA60], &__block_literal_global_181);

  objc_autoreleasePoolPop(v5);
}

- (void)_standardizeSceneClassification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *context;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _QWORD v75[5];
  _QWORD v76[6];

  v76[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x18D782104]();
  v5 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(v4, "photosSceneClassifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedSetWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__2;
  v73 = __Block_byref_object_dispose__2;
  v74 = 0;
  v74 = (id)objc_opt_new();
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__2;
  v67 = __Block_byref_object_dispose__2;
  v68 = 0;
  v68 = (id)objc_opt_new();
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__2;
  v61 = __Block_byref_object_dispose__2;
  v62 = 0;
  v62 = (id)objc_opt_new();
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__2;
  v55 = __Block_byref_object_dispose__2;
  v56 = 0;
  v56 = (id)objc_opt_new();
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__2;
  v49 = __Block_byref_object_dispose__2;
  v50 = 0;
  v50 = (id)objc_opt_new();
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v76[0] = CFSTR("kMDItemPhotosSceneClassificationLabels");
  v76[1] = CFSTR("kMDItemPhotosSceneClassificationSynonyms");
  v76[2] = CFSTR("kMDItemPhotosSceneClassificationSynonymsCounts");
  v76[3] = CFSTR("kMDItemPhotosSceneClassificationConfidences");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = CFSTR("kMDItemPhotosSceneClassificationIdentifiers");
  v75[1] = CFSTR("kMDItemPhotosSceneClassificationBoundingBoxes");
  v75[2] = CFSTR("kMDItemPhotosSceneClassificationTypedIdentifiers");
  v75[3] = CFSTR("kMDItemPhotosSceneClassificationTypes");
  v75[4] = CFSTR("kMDItemPhotosSceneClassificationMediaTypes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__CSSearchableItem_Internal___standardizeSceneClassification___block_invoke;
  v18[3] = &unk_1E2401760;
  v10 = v7;
  v19 = v10;
  v20 = &v41;
  v21 = &v37;
  v22 = &v33;
  v23 = &v29;
  v24 = &v69;
  v25 = &v63;
  v26 = &v57;
  v27 = &v51;
  v28 = &v45;
  v11 = -[CSSearchableItem _standardizeExternalAnalysisTags:forAttributeSet:primaryAttribute:analysisAttribibutes:specializedAttributes:standardizeBlock:](self, "_standardizeExternalAnalysisTags:forAttributeSet:primaryAttribute:analysisAttribibutes:specializedAttributes:standardizeBlock:", v10, v4, CFSTR("kMDItemPhotosSceneClassification"), v8, v9, v18);

  if (v11)
  {
    if (*((_BYTE *)v42 + 24) && objc_msgSend((id)v70[5], "count"))
      v12 = v70[5];
    else
      v12 = 0;
    objc_msgSend(v4, "setAttribute:forKey:", v12, CFSTR("kMDItemPhotosSceneClassificationIdentifiers"));
    if (*((_BYTE *)v38 + 24) && objc_msgSend((id)v64[5], "count"))
      v13 = v64[5];
    else
      v13 = 0;
    objc_msgSend(v4, "setAttribute:forKey:", v13, CFSTR("kMDItemPhotosSceneClassificationBoundingBoxes"));
    if (*((_BYTE *)v34 + 24) && objc_msgSend((id)v52[5], "count"))
      v14 = v52[5];
    else
      v14 = 0;
    objc_msgSend(v4, "setAttribute:forKey:", v14, CFSTR("kMDItemPhotosSceneClassificationTypes"));
    if (*((_BYTE *)v34 + 24) && objc_msgSend((id)v58[5], "count"))
      v15 = v58[5];
    else
      v15 = 0;
    objc_msgSend(v4, "setAttribute:forKey:", v15, CFSTR("kMDItemPhotosSceneClassificationTypedIdentifiers"));
    if (*((_BYTE *)v30 + 24) && objc_msgSend((id)v46[5], "count"))
      v16 = v46[5];
    else
      v16 = 0;
    objc_msgSend(v4, "setAttribute:forKey:", v16, CFSTR("kMDItemPhotosSceneClassificationMediaTypes"));
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v69, 8);

  objc_autoreleasePoolPop(context);
}

- (void)_standardizeDocumentUnderstandingCategories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x18D782104]();
  v6 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(v4, "documentUnderstandingCategories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedSetWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = CFSTR("kMDItemDocumentUnderstandingCategoriesLabels");
  v10[1] = CFSTR("kMDItemDocumentUnderstandingCategoriesSynonyms");
  v10[2] = CFSTR("kMDItemDocumentUnderstandingCategoriesSynonymsCounts");
  v10[3] = CFSTR("kMDItemDocumentUnderstandingCategoriesConfidences");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItem _standardizeExternalAnalysisTags:forAttributeSet:primaryAttribute:analysisAttribibutes:specializedAttributes:standardizeBlock:](self, "_standardizeExternalAnalysisTags:forAttributeSet:primaryAttribute:analysisAttribibutes:specializedAttributes:standardizeBlock:", v8, v4, CFSTR("kMDItemDocumentUnderstandingCategories"), v9, MEMORY[0x1E0C9AA60], &__block_literal_global_182);

  objc_autoreleasePoolPop(v5);
}

- (BOOL)_standardizeExternalAnalysisTags:(id)a3 forAttributeSet:(id)a4 primaryAttribute:(id)a5 analysisAttribibutes:(id)a6 specializedAttributes:(id)a7 standardizeBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  char v20;
  char v21;
  char v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  BOOL v28;
  _BOOL8 v29;
  int v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  BOOL v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t (**v69)(id, unint64_t, _BOOL8);
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v69 = (uint64_t (**)(id, unint64_t, _BOOL8))a8;
  if (objc_msgSend(v17, "count") != 4)
    -[CSSearchableItem(Internal) _standardizeExternalAnalysisTags:forAttributeSet:primaryAttribute:analysisAttribibutes:specializedAttributes:standardizeBlock:].cold.1();
  if (objc_msgSend(v14, "count"))
  {
    v67 = (void *)objc_opt_new();
    v63 = (void *)objc_opt_new();
    v66 = (void *)objc_opt_new();
    v65 = (void *)objc_opt_new();
    if (objc_msgSend(v14, "count"))
    {
      v59 = v18;
      v60 = v17;
      v61 = v16;
      v62 = v15;
      v19 = 0;
      v64 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v68 = v14;
      do
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", v19, v59, v60, v61);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "label");
        v24 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "synonyms");
        v25 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "confidence");
        v27 = v26;
        v28 = v26 != 0.0;
        v29 = v26 != 0.0 || (v24 | v25) != 0;
        v30 = v69[2](v69, v19, v29);
        if (v29 || v30)
        {
          if (v24)
            v31 = (const __CFString *)v24;
          else
            v31 = &stru_1E2406B38;
          objc_msgSend(v67, "addObject:", v31);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)v25, "count"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "addObject:", v32);

          if (v25)
            objc_msgSend(v63, "addObjectsFromArray:", v25);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "addObject:", v33);

          v64 = 1;
        }
        v22 |= v24 != 0;
        v21 |= v25 != 0;
        v20 |= v28;

        ++v19;
        v14 = v68;
      }
      while (v19 < objc_msgSend(v68, "count"));
      if ((v64 & 1) != 0)
      {
        v17 = v60;
        v16 = v61;
        v18 = v59;
        if ((v22 & 1) != 0)
        {
          if (objc_msgSend(v67, "count"))
            v34 = v67;
          else
            v34 = 0;
        }
        else
        {
          v34 = 0;
        }
        objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setAttribute:forKey:", v34, v50);

        if ((v21 & 1) != 0)
        {
          v51 = v63;
          if (!objc_msgSend(v63, "count"))
            v51 = 0;
          objc_msgSend(v60, "objectAtIndexedSubscript:", 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setAttribute:forKey:", v51, v52);

          v53 = v66;
          if (!objc_msgSend(v66, "count"))
            v53 = 0;
        }
        else
        {
          objc_msgSend(v60, "objectAtIndexedSubscript:", 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setAttribute:forKey:", 0, v54);

          v53 = 0;
        }
        v15 = v62;
        objc_msgSend(v60, "objectAtIndexedSubscript:", 2);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setAttribute:forKey:", v53, v55);

        if ((v20 & 1) != 0)
        {
          if (objc_msgSend(v65, "count"))
            v56 = v65;
          else
            v56 = 0;
        }
        else
        {
          v56 = 0;
        }
        objc_msgSend(v60, "objectAtIndexedSubscript:", 3);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setAttribute:forKey:", v56, v57);

        v49 = 1;
      }
      else
      {
        v49 = 0;
        v16 = v61;
        v15 = v62;
        v18 = v59;
        v17 = v60;
      }
    }
    else
    {
      v49 = 0;
    }
    objc_msgSend(v15, "setAttribute:forKey:", 0, v16);

  }
  else if (-[CSSearchableItem isUpdate](self, "isUpdate") && objc_msgSend(v15, "attributeIsDelete:", v16))
  {
    v35 = v18;
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v36 = v17;
    v37 = v17;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v75;
      v41 = *MEMORY[0x1E0C9B0D0];
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v75 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(v15, "setAttribute:forKey:", v41, *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i));
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
      }
      while (v39);
    }

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v18 = v35;
    v43 = v35;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v71;
      v47 = *MEMORY[0x1E0C9B0D0];
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v71 != v46)
            objc_enumerationMutation(v43);
          objc_msgSend(v15, "setAttribute:forKey:", v47, *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j));
        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
      }
      while (v45);
    }

    v49 = 0;
    v17 = v36;
  }
  else
  {
    v49 = 0;
  }

  return v49;
}

- (void)_parseEmailHeadersForFeatures:(id)a3
{
  id v3;
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
  id v14;
  void (**v15)(void *, void *, void *);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v3 = a3;
  objc_msgSend(v3, "emailHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_17;
  objc_msgSend(v3, "emailHeaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Auto-submitted"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

LABEL_5:
    objc_msgSend(v3, "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kMDMailMessageAutoReplied"));
    goto LABEL_6;
  }
  objc_msgSend(v3, "emailHeaders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("auto-submitted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_5;
LABEL_6:
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31 = 0;
  objc_msgSend(v3, "emailHeaders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("List-Id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v31 = v10;
  }
  else
  {
    objc_msgSend(v3, "emailHeaders");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("list-id"));
    v31 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v27[5])
  {
    v13 = (void *)MEMORY[0x18D782104]();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __60__CSSearchableItem_Internal___parseEmailHeadersForFeatures___block_invoke;
    v23 = &unk_1E24016D8;
    v25 = &v26;
    v14 = v3;
    v24 = v14;
    v15 = (void (**)(void *, void *, void *))_Block_copy(&v20);
    objc_msgSend(v14, "attributeForKey:", CFSTR("kMDItemPrimaryRecipientEmailAddresses"), v20, v21, v22, v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "attributeForKey:", CFSTR("kMDItemAdditionalRecipientEmailAddresses"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend((id)v27[5], "count") < 2
      || (unint64_t)objc_msgSend(v16, "count") <= 0xFF && (unint64_t)objc_msgSend(v17, "count") < 0x100)
    {
      v15[2](v15, v16, v17);
    }
    else
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v16);
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v17);
      v15[2](v15, v18, v19);

    }
    objc_autoreleasePoolPop(v13);
  }
  _Block_object_dispose(&v26, 8);

LABEL_17:
}

- (NSString)protection
{
  void *v2;
  void *v3;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "protectionClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)domainIdentifier
{
  void *v2;
  void *v3;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domainIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAttributeSet:(CSSearchableItemAttributeSet *)attributeSet
{
  CSSearchableItemAttributeSet *v4;
  CSSearchableItemAttributeSet *v5;
  CSSearchableItemAttributeSet *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CSSearchableItemAttributeSet *v16;
  CSSearchableItemAttributeSet *v17;
  CSSearchableItem *obj;

  v4 = attributeSet;
  obj = self;
  objc_sync_enter(obj);
  v5 = obj->_attributeSet;
  v6 = v5;
  if (v5)
  {
    v7 = -[CSSearchableItemAttributeSet searchableItemFlags](v5, "searchableItemFlags");
    if (v7)
      -[CSSearchableItemAttributeSet setSearchableItemFlags:](v4, "setSearchableItemFlags:", -[CSSearchableItemAttributeSet searchableItemFlags](v4, "searchableItemFlags") | v7);
    -[CSSearchableItemAttributeSet uniqueIdentifier](v4, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[CSSearchableItemAttributeSet uniqueIdentifier](v6, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        -[CSSearchableItemAttributeSet setUniqueIdentifier:](v4, "setUniqueIdentifier:", v9);

    }
    -[CSSearchableItemAttributeSet bundleID](v4, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[CSSearchableItemAttributeSet bundleID](v6, "bundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        -[CSSearchableItemAttributeSet setBundleID:](v4, "setBundleID:", v11);

    }
    -[CSSearchableItemAttributeSet domainIdentifier](v4, "domainIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      -[CSSearchableItemAttributeSet domainIdentifier](v6, "domainIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        -[CSSearchableItemAttributeSet setDomainIdentifier:](v4, "setDomainIdentifier:", v13);

    }
    -[CSSearchableItemAttributeSet expirationDate](v4, "expirationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[CSSearchableItemAttributeSet expirationDate](v6, "expirationDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        -[CSSearchableItemAttributeSet setExpirationDate:](v4, "setExpirationDate:", v15);

    }
  }
  v16 = obj->_attributeSet;
  obj->_attributeSet = v4;
  v17 = v4;

  objc_sync_exit(obj);
}

- (CSSearchableItem)init
{
  CSSearchableItem *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSSearchableItem;
  v2 = -[CSSearchableItem init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[CSSearchableItem setAttributeSet:](v2, "setAttributeSet:", v3);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItem setUniqueIdentifier:](v2, "setUniqueIdentifier:", v5);

    -[CSSearchableItem setExpirationDate:](v2, "setExpirationDate:", 0);
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("attributes"));

}

- (CSSearchableItem)initWithCoder:(id)a3
{
  id v4;
  CSSearchableItem *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSSearchableItem;
  v5 = -[CSSearchableItem init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItem setAttributeSet:](v5, "setAttributeSet:", v6);

    -[CSSearchableItem attributeSet](v5, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = (void *)objc_opt_new();
      -[CSSearchableItem setAttributeSet:](v5, "setAttributeSet:", v8);

    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setAttributeSet:", v6);

  -[CSSearchableItem uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUniqueIdentifier:", v7);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)compareByEmbeddingDistance:(id)a3
{
  id v4;
  int64_t v5;
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
  float v21;
  _BOOL4 v22;
  void *v23;
  float v24;
  float v25;
  char v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  float v31;
  _BOOL8 v32;

  v4 = a3;
  if (!-[CSSearchableItem isEqual:](self, "isEqual:", v4))
  {
    -[CSSearchableItem bundleID](self, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "compare:", v7);

    if (v5)
      goto LABEL_25;
    -[CSSearchableItem attributeSet](self, "attributeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributeDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("kMDQueryResultRetrievalType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "attributeSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributeDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("kMDQueryResultRetrievalType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((int)objc_msgSend(v10, "intValue") < 2 || (int)objc_msgSend(v13, "intValue") < 2)
    {
      v5 = 0;
LABEL_24:

      goto LABEL_25;
    }
    -[CSSearchableItem attributeSet](self, "attributeSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "attributeDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("kMDQueryResultEmbeddingDistances"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "attributeSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "attributeDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("kMDQueryResultEmbeddingDistances"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count") == 3)
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      v22 = v21 != 3.4028e38;

    }
    else
    {
      v22 = 0;
    }
    if (objc_msgSend(v19, "count") == 3)
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      v25 = v24;

      v26 = !v22;
      if (v25 == 3.4028e38)
        v26 = 1;
      if ((v26 & 1) == 0)
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "floatValue");
        v29 = v28;
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "floatValue");
        if (v29 >= v31)
          v5 = 1;
        else
          v5 = -1;

        goto LABEL_23;
      }
      v32 = v25 != 3.4028e38;
    }
    else
    {
      v32 = 0;
    }
    if (v22)
      v5 = -1;
    else
      v5 = v32;
LABEL_23:

    goto LABEL_24;
  }
  v5 = 0;
LABEL_25:

  return v5;
}

- (NSComparisonResult)compareByRank:(CSSearchableItem *)other
{
  CSSearchableItem *v4;
  NSComparisonResult v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  _BOOL4 v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void **v48;
  unint64_t v49;
  void **v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  BOOL v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;

  v4 = other;
  if (!-[CSSearchableItem isEqual:](self, "isEqual:", v4))
  {
    -[CSSearchableItem bundleID](self, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItem bundleID](v4, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "compare:", v7);

    if (v5)
      goto LABEL_59;
    -[CSSearchableItem attributeSet](self, "attributeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributeDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kMDQueryResultScoreL2"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSSearchableItem attributeSet](v4, "attributeSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributeDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kMDQueryResultScoreL2"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "floatValue");
    v15 = v14;
    objc_msgSend(v13, "floatValue");
    if (v15 == 0.0 || v16 == 0.0)
    {
      v23 = v16 == 0.0 || v15 != 0.0;
      if (v23)
        v5 = NSOrderedAscending;
      else
        v5 = NSOrderedDescending;
      if (v15 != 0.0 || !v23)
        goto LABEL_58;
    }
    else
    {
      objc_msgSend(v10, "floatValue");
      v18 = v17;
      objc_msgSend(v13, "floatValue");
      if (v18 != v19)
      {
        objc_msgSend(v10, "floatValue");
        v21 = v20;
        objc_msgSend(v13, "floatValue");
        if (v21 <= v22)
          v5 = NSOrderedDescending;
        else
          v5 = NSOrderedAscending;
        goto LABEL_58;
      }
    }
    -[CSSearchableItem attributeSet](self, "attributeSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "attributeDictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("kMDQueryResultScoreL1"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSSearchableItem attributeSet](v4, "attributeSet");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "attributeDictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("kMDQueryResultScoreL1"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "floatValue");
    v32 = v31;
    objc_msgSend(v30, "floatValue");
    if (v32 == 0.0 || v33 == 0.0)
    {
      v40 = v33 == 0.0 || v32 != 0.0;
      if (v40)
        v5 = NSOrderedAscending;
      else
        v5 = NSOrderedDescending;
      if (v32 != 0.0 || !v40)
        goto LABEL_38;
    }
    else
    {
      objc_msgSend(v27, "floatValue");
      v35 = v34;
      objc_msgSend(v30, "floatValue");
      if (v35 != v36)
      {
        objc_msgSend(v27, "floatValue");
        v38 = v37;
        objc_msgSend(v30, "floatValue");
        if (v38 <= v39)
          v5 = NSOrderedDescending;
        else
          v5 = NSOrderedAscending;
LABEL_38:

LABEL_58:
        goto LABEL_59;
      }
    }
    v59 = v27;
    -[CSSearchableItem attributeSet](self, "attributeSet");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "attributeDictionary");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("kMDQueryResultNewMatchedExtraQueriesField"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSSearchableItem attributeSet](v4, "attributeSet");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "attributeDictionary");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("kMDQueryResultNewMatchedExtraQueriesField"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = (unint64_t)v43;
    if (v43)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v43, "length") == 16)
      {
        v48 = (void **)objc_msgSend(objc_retainAutorelease(v43), "bytes");
        v47 = (unint64_t)*v48;
        v49 = (unint64_t)v48[1];
LABEL_41:
        if (v46 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v46, "length") == 16)
        {
          v50 = (void **)objc_msgSend(objc_retainAutorelease(v46), "bytes");
          v51 = (unint64_t)*v50;
          v52 = (unint64_t)v50[1];
          v53 = v47 | v49;
          if (v47 | v49 && v51 | v52)
          {
            v54 = v49 == v52 && v47 == v51;
            v55 = v59;
            if (!v54)
            {
              if (__PAIR128__(v52, v51) < __PAIR128__(v49, v47))
                v5 = NSOrderedAscending;
              else
                v5 = NSOrderedDescending;
LABEL_56:

              if (v5 == NSOrderedSame)
              {
                -[CSSearchableItem uniqueIdentifier](self, "uniqueIdentifier");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                -[CSSearchableItem uniqueIdentifier](v4, "uniqueIdentifier");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v5 = objc_msgSend(v56, "compare:", v57);

              }
              goto LABEL_58;
            }
LABEL_55:
            v5 = NSOrderedSame;
            goto LABEL_56;
          }
          v5 = (unint64_t)((v51 | v52) != 0);
          v55 = v59;
          if (!v53)
            goto LABEL_56;
        }
        else
        {
          v55 = v59;
          if (!(v47 | v49))
            goto LABEL_55;
        }
        v5 = NSOrderedAscending;
        goto LABEL_56;
      }
      v47 = 0;
    }
    v49 = 0;
    goto LABEL_41;
  }
  v5 = NSOrderedSame;
LABEL_59:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CSSearchableItem attributeSet](self, "attributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CSSearchableItem uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)_propertiesDescription
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[CSSearchableItem uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("uid=%@"), v5);
  objc_msgSend(v3, "addObject:", v6);

  -[CSSearchableItem bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("bundleID=%@"), v7);
    objc_msgSend(v3, "addObject:", v8);

  }
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("contentType=%@"), v10);
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  if (-[CSSearchableItem noIndex](self, "noIndex"))
    objc_msgSend(v12, "addObject:", CFSTR("should-not-be-indexed"));
  if (-[CSSearchableItem isUpdate](self, "isUpdate"))
    objc_msgSend(v12, "addObject:", CFSTR("is-update"));
  if (objc_msgSend(v12, "count"))
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("|"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("flags=%@"), v14);
    objc_msgSend(v3, "addObject:", v15);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[CSSearchableItem _propertiesDescription](self, "_propertiesDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p; %@>"), v4, self, v5);

  return v6;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[CSSearchableItem _propertiesDescription](self, "_propertiesDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p; %@, attributes=%@>"), v4, self, v5, v6);

  return v7;
}

- (BOOL)_isFullyFormed
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CSSearchableItem uniqueIdentifier](self, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CSSearchableItem attributeSet](self, "attributeSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_hasAttributesOfType:(id)a3
{
  __CFString *v4;
  void *v5;
  __CFString *v6;
  int v7;

  v4 = (__CFString *)a3;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentType");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = UTTypeConformsTo(v6, v4);

  return v7 != 0;
}

- (void)setBundleID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleID:", v4);

}

- (void)setProtection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProtectionClass:", v4);

}

- (void)setIsUpdate:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchableItemFlags:", objc_msgSend(v4, "searchableItemFlags") & 0xFFFFFFFFFFFFFFFELL | v3);

}

- (BOOL)isAppEntity
{
  void *v2;
  unint64_t v3;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "searchableItemFlags") >> 5) & 1;

  return v3;
}

- (void)setIsAppEntity:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "searchableItemFlags") & 0xFFFFFFFFFFFFFFDFLL;
  v5 = 32;
  if (!v3)
    v5 = 0;
  objc_msgSend(v6, "setSearchableItemFlags:", v4 | v5);

}

- (BOOL)noIndex
{
  void *v2;
  unint64_t v3;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "searchableItemFlags") >> 1) & 1;

  return v3;
}

- (void)setNoIndex:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "searchableItemFlags") & 0xFFFFFFFFFFFFFFFDLL;
  v5 = 2;
  if (!v3)
    v5 = 0;
  objc_msgSend(v6, "setSearchableItemFlags:", v4 | v5);

}

- (BOOL)allowTextStore
{
  void *v2;
  unint64_t v3;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "searchableItemFlags") >> 4) & 1;

  return v3;
}

- (void)setAllowTextStore:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "searchableItemFlags") & 0xFFFFFFFFFFFFFFEFLL;
  v5 = 16;
  if (!v3)
    v5 = 0;
  objc_msgSend(v6, "setSearchableItemFlags:", v4 | v5);

}

- (id)attributes
{
  void *v2;
  void *v3;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAttributes:(id)a3
{
  id v4;
  CSSearchableItemAttributeSet *v5;

  v4 = a3;
  v5 = -[CSSearchableItemAttributeSet initWithAttributes:]([CSSearchableItemAttributeSet alloc], "initWithAttributes:", v4);

  -[CSSearchableItem setAttributeSet:](self, "setAttributeSet:", v5);
}

- (id)copyReconstructedPrimaryRecipients
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  CSPerson *v16;
  void *v17;
  void *v18;
  void *v19;
  CSPerson *v20;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryRecipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    objc_msgSend(v2, "attributeForKey:", CFSTR("kMDItemPrimaryRecipientEmailAddresses"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributeForKey:", CFSTR("kMDItemRecipientEmailAddresses"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributeForKey:", CFSTR("kMDItemRecipients"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v2;
    objc_msgSend(v2, "attributeForKey:", CFSTR("kMDItemRecipientPhotosPersonIdentifiers"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v14 = objc_msgSend(v26, "indexOfObject:", v13);

          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v9 = 0;
          }
          else
          {
            if (v14 >= objc_msgSend(v24, "count"))
            {
              v9 = 0;
            }
            else
            {
              objc_msgSend(v24, "objectAtIndex:", v14);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
            }
            if (v14 < objc_msgSend(v23, "count"))
            {
              objc_msgSend(v23, "objectAtIndex:", v14);
              v15 = objc_claimAutoreleasedReturnValue();

              v10 = (void *)v15;
            }
          }
          v16 = [CSPerson alloc];
          v31 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[CSContactsWrapper sharedInstance](CSContactsWrapper, "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "CNContactEmailAddressesKeyString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[CSPerson initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:](v16, "initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:", v9, v17, v19, v10);

          objc_msgSend(v5, "addObject:", v20);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }

    v4 = 0;
    v2 = v22;
  }

  return v5;
}

- (id)copyReconstructedAdditionalRecipients
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  CSPerson *v16;
  void *v17;
  void *v18;
  void *v19;
  CSPerson *v20;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "additionalRecipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    objc_msgSend(v2, "attributeForKey:", CFSTR("kMDItemAdditionalRecipientEmailAddresses"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributeForKey:", CFSTR("kMDItemRecipientEmailAddresses"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributeForKey:", CFSTR("kMDItemRecipients"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v2;
    objc_msgSend(v2, "attributeForKey:", CFSTR("kMDItemRecipientPhotosPersonIdentifiers"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v14 = objc_msgSend(v26, "indexOfObject:", v13);

          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v9 = 0;
          }
          else
          {
            if (v14 >= objc_msgSend(v24, "count"))
            {
              v9 = 0;
            }
            else
            {
              objc_msgSend(v24, "objectAtIndex:", v14);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
            }
            if (v14 < objc_msgSend(v23, "count"))
            {
              objc_msgSend(v23, "objectAtIndex:", v14);
              v15 = objc_claimAutoreleasedReturnValue();

              v10 = (void *)v15;
            }
          }
          v16 = [CSPerson alloc];
          v31 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[CSContactsWrapper sharedInstance](CSContactsWrapper, "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "CNContactEmailAddressesKeyString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[CSPerson initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:](v16, "initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:", v9, v17, v19, v10);

          objc_msgSend(v5, "addObject:", v20);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }

    v4 = 0;
    v2 = v22;
  }

  return v5;
}

- (id)copyReconstructedHiddenAdditionalRecipients
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  CSPerson *v16;
  void *v17;
  void *v18;
  void *v19;
  CSPerson *v20;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hiddenAdditionalRecipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    objc_msgSend(v2, "attributeForKey:", CFSTR("kMDItemHiddenAdditionalRecipientEmailAddresses"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributeForKey:", CFSTR("kMDItemRecipientEmailAddresses"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributeForKey:", CFSTR("kMDItemRecipients"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v2;
    objc_msgSend(v2, "attributeForKey:", CFSTR("kMDItemRecipientPhotosPersonIdentifiers"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v14 = objc_msgSend(v26, "indexOfObject:", v13);

          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v9 = 0;
          }
          else
          {
            if (v14 >= objc_msgSend(v24, "count"))
            {
              v9 = 0;
            }
            else
            {
              objc_msgSend(v24, "objectAtIndex:", v14);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
            }
            if (v14 < objc_msgSend(v23, "count"))
            {
              objc_msgSend(v23, "objectAtIndex:", v14);
              v15 = objc_claimAutoreleasedReturnValue();

              v10 = (void *)v15;
            }
          }
          v16 = [CSPerson alloc];
          v31 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[CSContactsWrapper sharedInstance](CSContactsWrapper, "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "CNContactEmailAddressesKeyString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[CSPerson initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:](v16, "initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:", v9, v17, v19, v10);

          objc_msgSend(v5, "addObject:", v20);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }

    v4 = 0;
    v2 = v22;
  }

  return v5;
}

- (id)copyReconstructedRecipients
{
  void *v2;
  void *v3;
  void *v4;
  char *v5;
  uint64_t v6;
  BOOL v7;
  int v8;
  char *v9;
  CSPerson *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CSPerson *v17;
  void *v19;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("kMDItemRecipientEmailAddresses"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("kMDItemRecipients"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v2;
  objc_msgSend(v2, "attributeForKey:", CFSTR("kMDItemRecipientPhotosPersonIdentifiers"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v3;
  v5 = (char *)objc_msgSend(v3, "count");
  v20 = v4;
  v6 = objc_msgSend(v4, "count");
  if (v6)
    v7 = v6 == (_QWORD)v5;
  else
    v7 = 0;
  v8 = v7;
  v21 = v5;
  v22 = (void *)objc_opt_new();
  if (v5)
  {
    v9 = 0;
    do
    {
      v10 = [CSPerson alloc];
      if (v8)
      {
        objc_msgSend(v20, "objectAtIndexedSubscript:", v9);
        v5 = (char *)objc_claimAutoreleasedReturnValue();
        v11 = v5;
      }
      else
      {
        v11 = 0;
      }
      objc_msgSend(v24, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSContactsWrapper sharedInstance](CSContactsWrapper, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "CNContactEmailAddressesKeyString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[CSPerson initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:](v10, "initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:", v11, v13, v15, v16);

      if (v8)
      objc_msgSend(v22, "addObject:", v17);

      ++v9;
    }
    while (v21 != v9);
  }

  return v22;
}

- (id)copyReconstructedAuthors
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CSPerson *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CSPerson *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    v5 = (id)objc_msgSend(v3, "copy");
  }
  else
  {
    objc_msgSend(v2, "authorEmailAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "authorNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "authorPhotosPersonIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v9 = [CSPerson alloc];
      objc_msgSend(v7, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSContactsWrapper sharedInstance](CSContactsWrapper, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "CNContactEmailAddressesKeyString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v13 = v7;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[CSPerson initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:](v9, "initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:", v18, v10, v12, v14);
      v21[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v13;
    }
    else
    {
      v16 = 0;
    }
    v5 = v16;

    v4 = v5;
  }

  return v5;
}

- (uint64_t)score
{
  uint64_t v2;

  objc_copyStruct(&v2, (const void *)(a1 + 16), 16, 1, 0);
  return v2;
}

- (void)setScore:(CSSearchableItem *)self
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = v2;
  v5 = v3;
  objc_copyStruct(self->_score, &v4, 16, 1, 0);
}

- (void)standardizeAttributesForBundle:(id)a3 protectionClass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(v9, "contentTypeTree");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    objc_msgSend(v9, "contentType");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (-[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("public.item")))
      {
        if (standardizeAttributesForBundle_protectionClass__onceToken != -1)
          dispatch_once(&standardizeAttributesForBundle_protectionClass__onceToken, &__block_literal_global_4);
        objc_msgSend(v9, "setContentTypeTree:", standardizeAttributesForBundle_protectionClass__sDefaultContentTypeTreeArray);
      }
      else if ((-[__CFString hasPrefix:](v13, "hasPrefix:", CFSTR("dyn.")) & 1) == 0)
      {
        v14 = (__CFString *)MDCopyTypePedigree(v13);
        if (-[__CFString count](v14, "count"))
          objc_msgSend(v9, "setContentTypeTree:", v14);

      }
    }

  }
  -[CSSearchableItem _standardizeFileProvider:](self, "_standardizeFileProvider:", v9);
  -[CSSearchableItem _standardizePeople:](self, "_standardizePeople:", v9);
  -[CSSearchableItem _standardizeSceneClassification:](self, "_standardizeSceneClassification:", v9);
  -[CSSearchableItem _standardizeDocumentUnderstandingTopics:](self, "_standardizeDocumentUnderstandingTopics:", v9);
  -[CSSearchableItem _standardizeDocumentUnderstandingCategories:](self, "_standardizeDocumentUnderstandingCategories:", v9);
  -[CSSearchableItem _standardizeDeprecatedProperties:](self, "_standardizeDeprecatedProperties:", v9);
  -[CSSearchableItem _standardizeHTML:](self, "_standardizeHTML:", v9);
  -[CSSearchableItem _standardizeMarkAs:](self, "_standardizeMarkAs:", v9);
  -[CSSearchableItem _parseEmailHeadersForFeatures:](self, "_parseEmailHeadersForFeatures:", v9);
  -[CSSearchableItem _standardizeSiriShortcuts:](self, "_standardizeSiriShortcuts:", v9);
  -[CSSearchableItem _standardizePortrait:](self, "_standardizePortrait:", v9);
  objc_msgSend(v9, "requiresImport");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v16)
  {
    objc_msgSend(v9, "contentURL");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "fileSystemRepresentation");

    if (v18)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "contentURL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v34 = v19;
        _os_log_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Attempt to read attributes from %@", buf, 0xCu);

      }
      objc_msgSend(v9, "contentURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)_MDItemCopyXattrsForURL();

      if (v21)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "contentURL");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v34 = v22;
          v35 = 2112;
          v36 = v21;
          _os_log_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Read attributes from %@: %@", buf, 0x16u);

        }
        objc_msgSend(v9, "addAttributesFromDictionaryWithOutOverWriting:", v21);
      }
      v23 = (void *)sandbox_extension_issue_file();
      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setImportSandboxExtension:", v24);

      }
      objc_msgSend(v9, "contentType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        objc_msgSend(v9, "contentURL");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0;
        objc_msgSend(v26, "getResourceValue:forKey:error:", &v32, *MEMORY[0x1E0C99AD0], 0);
        v27 = v32;

        if (v27)
          objc_msgSend(v9, "setContentType:", v27);

      }
      free(v23);

    }
  }
  -[CSSearchableItem bundleID](self, "bundleID");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    v30 = (void *)v28;
  else
    v30 = v7;
  v31 = v30;

  objc_msgSend(v9, "_standardizeProcessorAttributesForBundle:protectionClass:", v31, v6);
  -[CSSearchableItem setAttributeSet:](self, "setAttributeSet:", v9);

}

void __77__CSSearchableItem_Internal__standardizeAttributesForBundle_protectionClass___block_invoke()
{
  void *v0;

  v0 = (void *)standardizeAttributesForBundle_protectionClass__sDefaultContentTypeTreeArray;
  standardizeAttributesForBundle_protectionClass__sDefaultContentTypeTreeArray = (uint64_t)&unk_1E242F3B8;

}

void __60__CSSearchableItem_Internal___parseEmailHeadersForFeatures___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  id v25;
  id v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v26 = a2;
  v24 = a1;
  v25 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v29)
  {
    v5 = 0;
    v6 = 0;
    v28 = *(_QWORD *)v31;
    v23 = CFSTR("kMDMailMessageHasDistributionListInCC");
    v7 = MEMORY[0x1E0C80978];
LABEL_3:
    v8 = 0;
LABEL_4:
    if (*(_QWORD *)v31 != v28)
      objc_enumerationMutation(obj);
    if ((v6 & v5 & 1) == 0)
    {
      v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
      v10 = objc_msgSend(v9, "length");
      if (!v10)
        goto LABEL_38;
      v11 = v10;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = objc_msgSend(v9, "characterAtIndex:", v12, v23);
        v15 = v14;
        if (v14 > 0x7F)
        {
          if (__maskrune(v14, 0x4000uLL))
            goto LABEL_14;
        }
        else if ((*(_DWORD *)(v7 + 4 * v14 + 60) & 0x4000) != 0)
        {
          goto LABEL_14;
        }
        v13 = v12;
        if (v15 == 60)
        {
          if (v11 - 1 <= v12)
          {
            v16 = 0;
            goto LABEL_16;
          }
          v18 = 0;
          v16 = v11 - 2;
          while (2)
          {
            v19 = objc_msgSend(v9, "characterAtIndex:", v16 + 1);
            v20 = v19;
            if (v19 > 0x7F)
            {
              if (!__maskrune(v19, 0x4000uLL))
                goto LABEL_28;
              goto LABEL_29;
            }
            if ((*(_DWORD *)(v7 + 4 * v19 + 60) & 0x4000) != 0)
              goto LABEL_29;
LABEL_28:
            v18 = v16 + 1;
            if (v20 != 62)
            {
LABEL_29:
              if (v16-- <= v12)
              {
                v16 = v18;
                goto LABEL_16;
              }
              continue;
            }
            break;
          }
          ++v12;
LABEL_16:
          if ((uint64_t)v16 > (uint64_t)v12)
          {
            objc_msgSend(v9, "substringWithRange:", v12, v16 - v12 + 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v6 & 1) != 0)
              goto LABEL_20;
            if (objc_msgSend(v26, "containsObject:", v17))
            {
              objc_msgSend(*(id *)(v24 + 32), "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kMDMailMessageHasDistributionListInTo"));
LABEL_20:
              v6 = 1;
              if ((v5 & 1) != 0)
              {
LABEL_35:
                v5 = 1;
                goto LABEL_37;
              }
            }
            else
            {
              v6 = 0;
              if ((v5 & 1) != 0)
                goto LABEL_35;
            }
            if (objc_msgSend(v25, "containsObject:", v17))
            {
              objc_msgSend(*(id *)(v24 + 32), "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], v23);
              goto LABEL_35;
            }
            v5 = 0;
LABEL_37:

          }
LABEL_38:
          if (++v8 == v29)
          {
            v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
            v29 = v22;
            if (!v22)
              break;
            goto LABEL_3;
          }
          goto LABEL_4;
        }
LABEL_14:
        if (v11 == ++v12)
        {
          v16 = 0;
          v12 = v13;
          goto LABEL_16;
        }
      }
    }
  }

}

uint64_t __70__CSSearchableItem_Internal___standardizeDocumentUnderstandingTopics___block_invoke()
{
  return 0;
}

uint64_t __74__CSSearchableItem_Internal___standardizeDocumentUnderstandingCategories___block_invoke()
{
  return 0;
}

BOOL __62__CSSearchableItem_Internal___standardizeSceneClassification___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  uint64_t v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sceneIdentifier");
  objc_msgSend(v5, "boundingBox");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(v5, "sceneType");
  v16 = objc_msgSend(v5, "mediaType");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v6 != 0;
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v17 + 24))
  {
    v18 = v8 != 0.0;
    if (v10 != 0.0)
      v18 = 1;
    if (v12 != 0.0)
      v18 = 1;
    if (v14 != 0.0)
      v18 = 1;
    *(_BYTE *)(v17 + 24) = v18;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= (_DWORD)v15 != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= (_DWORD)v16 != 0;
  if ((a3 & 1) != 0
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v35 = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v20);

    v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v22;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v23;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v24;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v26);

    v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d-%llu"), v15, v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v28);

    v29 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v30);

    v31 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v35);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v32);

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      goto LABEL_17;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
LABEL_17:
    v33 = 1;
  }
  else
  {
    v33 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != 0;
  }

  return v33;
}

- (void)extractAndStandardizePersonInformation:(id)a3 contactIdentifierKey:(id)a4 emailKey:(id)a5 nameKey:(id)a6 emailAddressExtractKey:(id)a7 photosPersonIdentifierKey:(id)a8 personTypeKey:(id)a9 nameAlternativesKey:(id)a10 faceAttributesKey:(id)a11 contactIdentifiers:(id)a12 emails:(id)a13 names:(id)a14 photosPersonIdentifiers:(id)a15 personType:(id)a16 nameAlternatives:(id)a17 nameAlternativesCounts:(id)a18 faceAttributes:(id)a19 faceAttributesCounts:(id)a20 persons:(id)a21
{
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  __CFString *v31;
  id v32;
  id v33;
  __CFString **v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  void *v39;
  int v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  int v54;
  BOOL v55;
  void *v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  uint64_t v65;
  void *v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  char v84;
  uint64_t i;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  unsigned int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const __CFString *v93;
  uint64_t j;
  uint64_t v95;
  uint64_t k;
  void *v97;
  __CFString *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  unsigned int v115;
  id v116;
  id obj;
  char v118;
  int v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  void *v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _OWORD v139[4];
  uint64_t v140;
  _OWORD v141[4];
  uint64_t v142;
  _QWORD v143[9];
  _QWORD v144[7];
  __CFString *v145;
  const __CFString *v146;
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  v104 = a3;
  v26 = a4;
  v27 = a5;
  v28 = a6;
  v116 = a7;
  v29 = a8;
  v30 = a9;
  v31 = (__CFString *)a10;
  v32 = a11;
  v114 = a12;
  v113 = a13;
  v112 = a14;
  v111 = a15;
  v110 = a16;
  v109 = a17;
  v108 = a18;
  v107 = a19;
  v106 = a20;
  v33 = a21;
  v145 = 0;
  v146 = 0;
  v102 = v27;
  v103 = v26;
  v144[0] = v26;
  v144[1] = v27;
  v100 = v29;
  v101 = v28;
  v144[2] = v28;
  v144[3] = v29;
  v99 = v30;
  v144[4] = v30;
  v144[5] = v31;
  v144[6] = v32;
  if (CFSTR("kMDItemPhotosPeopleNamesAlternatives") == v31)
  {
    v34 = MDItemPhotosPeopleNamesAlternativesCounts;
  }
  else
  {
    if (CFSTR("kMDItemPhotosSharedLibraryContributorsNames") != v31)
      goto LABEL_6;
    v34 = MDItemPhotosSharedLibraryContributorsNamesAlternativesCounts;
  }
  v145 = *v34;
LABEL_6:
  v97 = v32;
  v98 = v31;
  if (v32)
    v146 = CFSTR("kMDItemPhotosPeopleFaceAttributesCounts");
  v35 = 0;
  v36 = 0;
  v115 = 0;
  v143[0] = v114;
  v143[1] = v113;
  v143[2] = v112;
  v143[3] = v111;
  v143[4] = v110;
  v143[5] = v109;
  v143[6] = v107;
  v143[7] = v108;
  v143[8] = v106;
  v142 = 0;
  memset(v141, 0, sizeof(v141));
  v140 = 0;
  memset(v139, 0, sizeof(v139));
  do
  {
    if (v144[v35])
    {
      v36 |= 1 << v35;
      v37 = objc_msgSend((id)v143[v35], "count");
      if (v37)
        v38 = 1 << v35;
      else
        v38 = 0;
      v115 |= v38;
    }
    else
    {
      v37 = 0;
    }
    *((_QWORD *)v139 + v35) = v37;
    v39 = (void *)*((_QWORD *)v141 + v35);
    *((_QWORD *)v141 + v35) = 0;

    ++v35;
  }
  while (v35 != 9);
  if (v33)
  {
    v40 = v115;
    v105 = v33;
    if ((unsigned __int16)v36 != (unsigned __int16)v115)
    {
      v130 = 0u;
      v131 = 0u;
      v128 = 0u;
      v129 = 0u;
      v41 = v33;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v128, v138, 16);
      if (!v42)
        goto LABEL_70;
      v43 = v42;
      v44 = *(_QWORD *)v129;
      v120 = *(_QWORD *)v129;
      do
      {
        v45 = 0;
        v122 = v43;
        do
        {
          if (*(_QWORD *)v129 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v45);
          if ((v36 & 4) != 0 && (v40 & 4) == 0)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * v45), "displayName");
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            if (v47)
            {
              objc_msgSend(v46, "displayName");
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              if (v48)
                v40 |= 4u;
            }
          }
          if ((v36 & 2) != 0 && v116 && (v40 & 2) == 0)
          {
            objc_msgSend(v46, "handles");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "firstObject");
            v50 = objc_claimAutoreleasedReturnValue();
            if (v50)
            {
              v51 = (void *)v50;
              objc_msgSend(v46, "handleIdentifier");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = v41;
              v54 = objc_msgSend(v52, "isEqualToString:", v116);

              v33 = v105;
              v55 = v54 == 0;
              v41 = v53;
              v44 = v120;
              if (!v55)
                v40 |= 2u;
            }
            else
            {

            }
            v43 = v122;
          }
          if ((v36 & 1) != 0 && (v40 & 1) == 0)
          {
            objc_msgSend(v46, "contactIdentifier");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = v56 != 0;

            v40 |= v57;
          }
          if ((v36 & 8) != 0 && (v40 & 8) == 0)
          {
            objc_msgSend(v46, "photosPersonIdentifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            if (v58)
              v40 |= 8u;
          }
          if ((v36 & 0x10) != 0 && (v40 & 0x10) == 0)
          {
            objc_msgSend(v46, "personType");
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            if (v59)
              v40 |= 0x10u;
          }
          if ((v36 & 0x20) != 0 && (v40 & 0x20) == 0)
          {
            objc_msgSend(v46, "nameAlternatives");
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            if (v60)
              v40 |= 0x20u;
          }
          if ((v36 & 0x80) != 0 && (v40 & 0x80) == 0)
          {
            objc_msgSend(v46, "nameAlternatives");
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            if (v61)
              v40 |= 0x80u;
          }
          if ((v36 & 0x40) != 0 && (v40 & 0x40) == 0)
          {
            objc_msgSend(v46, "faceAttributes");
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            if (v62)
              v40 |= 0x40u;
          }
          if ((v36 & 0x100) != 0 && (v40 & 0x100) == 0)
          {
            objc_msgSend(v46, "faceAttributes");
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            if (v63)
              v40 |= 0x100u;
          }
          if ((unsigned __int16)v40 == (unsigned __int16)v36)
          {
            v40 = v36;
            goto LABEL_70;
          }
          ++v45;
        }
        while (v43 != v45);
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v128, v138, 16);
      }
      while (v43);
LABEL_70:
      v115 = v40;

    }
    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    obj = v33;
    v123 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v137, 16);
    if (!v123)
      goto LABEL_144;
    v121 = *(_QWORD *)v125;
    v64 = (v115 >> 1) & 1;
    if (!v116)
      v64 = 0;
    v119 = v64;
    v118 = 1;
LABEL_75:
    v65 = 0;
    while (1)
    {
      if (*(_QWORD *)v125 != v121)
        objc_enumerationMutation(obj);
      v66 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * v65);
      v136 = 0;
      v134 = 0u;
      v135 = 0u;
      v132 = 0u;
      v133 = 0u;
      if ((v115 & 4) != 0)
      {
        objc_msgSend(v66, "displayName");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v133 = v68;

        v67 = v68 != 0;
      }
      else
      {
        v67 = 0;
      }
      if (!v119)
        goto LABEL_85;
      objc_msgSend(v66, "handles");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "firstObject");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&v132 + 1) = v70;

      if (!v70)
        goto LABEL_85;
      objc_msgSend(v66, "handleIdentifier");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "isEqualToString:", v116);

      if ((v72 & 1) != 0)
        break;
      *((_QWORD *)&v132 + 1) = 0;
      if ((v115 & 1) == 0)
      {
LABEL_86:
        if ((v115 & 8) == 0)
          goto LABEL_87;
        goto LABEL_98;
      }
LABEL_95:
      objc_msgSend(v66, "contactIdentifier");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v132 = v73;

      if (v73)
        v67 = 1;
      if ((v115 & 8) == 0)
      {
LABEL_87:
        if ((v115 & 0x10) == 0)
          goto LABEL_88;
        goto LABEL_101;
      }
LABEL_98:
      objc_msgSend(v66, "photosPersonIdentifier");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&v133 + 1) = v74;

      if (v74)
        v67 = 1;
      if ((v115 & 0x10) == 0)
      {
LABEL_88:
        if ((v115 & 0x20) == 0)
          goto LABEL_89;
        goto LABEL_104;
      }
LABEL_101:
      objc_msgSend(v66, "personType");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v134 = v75;

      if (v75)
        v67 = 1;
      if ((v115 & 0x20) == 0)
      {
LABEL_89:
        if ((v115 & 0x80) == 0)
          goto LABEL_90;
        goto LABEL_107;
      }
LABEL_104:
      objc_msgSend(v66, "nameAlternatives");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&v134 + 1) = v76;

      if (v76)
        v67 = 1;
      if ((v115 & 0x80) == 0)
      {
LABEL_90:
        if ((v115 & 0x40) == 0)
          goto LABEL_91;
        goto LABEL_110;
      }
LABEL_107:
      v77 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v66, "nameAlternatives");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "numberWithUnsignedInteger:", objc_msgSend(v78, "count"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&v135 + 1) = v79;

      if (v79)
        v67 = 1;
      if ((v115 & 0x40) == 0)
      {
LABEL_91:
        if ((v115 & 0x100) == 0)
          goto LABEL_92;
        goto LABEL_113;
      }
LABEL_110:
      objc_msgSend(v66, "faceAttributes");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v135 = v80;

      if (v80)
        v67 = 1;
      if ((v115 & 0x100) == 0)
      {
LABEL_92:
        if (v67)
          goto LABEL_117;
        goto LABEL_142;
      }
LABEL_113:
      v81 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v66, "faceAttributes");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "numberWithUnsignedInteger:", objc_msgSend(v82, "count"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = v83;

      if (v83)
        v84 = 1;
      else
        v84 = v67;
      if ((v84 & 1) != 0)
      {
LABEL_117:
        if ((v118 & 1) != 0)
        {
          for (i = 0; i != 9; ++i)
          {
            if ((((unsigned __int16)v115 >> i) & 1) != 0)
            {
              if (*((_QWORD *)v139 + i))
                v86 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v143[i]);
              else
                v86 = objc_opt_new();
              v87 = (void *)*((_QWORD *)v141 + i);
              *((_QWORD *)v141 + i) = v86;

            }
          }
        }
        v88 = 0;
        v89 = -7;
        v90 = MEMORY[0x1E0C9AA60];
        do
        {
          if ((((unsigned __int16)v115 >> (v89 + 7)) & 1) != 0)
          {
            if (v89 < 0xFFFFFFFE)
            {
              v92 = *(_QWORD *)((char *)&v132 + v88);
              if (v89 > 1)
              {
                if (v92)
                  v93 = *(const __CFString **)((char *)&v132 + v88);
                else
                  v93 = &stru_1E2406B38;
              }
              else if (v92)
              {
                v93 = *(const __CFString **)((char *)&v132 + v88);
              }
              else
              {
                v93 = (const __CFString *)&unk_1E242FCA0;
              }
              objc_msgSend(*(id *)((char *)v141 + v88), "addObject:", v93);
            }
            else
            {
              if (*(_QWORD *)((char *)&v132 + v88))
                v91 = *(_QWORD *)((char *)&v132 + v88);
              else
                v91 = v90;
              objc_msgSend(*(id *)((char *)v141 + v88), "addObjectsFromArray:", v91);
            }
          }
          ++v89;
          v88 += 8;
        }
        while (v88 != 72);
        v118 = 0;
      }
LABEL_142:
      if (++v65 == v123)
      {
        v123 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v137, 16);
        if (!v123)
        {
LABEL_144:

          v31 = v98;
          v33 = v105;
          goto LABEL_145;
        }
        goto LABEL_75;
      }
    }
    v67 = 1;
LABEL_85:
    if ((v115 & 1) == 0)
      goto LABEL_86;
    goto LABEL_95;
  }
LABEL_145:
  for (j = 0; j != 9; ++j)
  {
    if ((((unsigned __int16)v115 >> j) & 1) != 0)
    {
      v95 = *((_QWORD *)v141 + j);
      if (!v95)
        v95 = v143[j];
      objc_msgSend(v104, "setAttribute:forKey:", v95, v144[j]);
    }
  }
  for (k = 64; k != -8; k -= 8)

}

- (void)breakOutPersonInformationInSet:(id)a3 withName:(id)a4 emails:(id)a5 contactIdentifiers:(id)a6 photosPersonIdentifiers:(id)a7 personType:(id)a8 nameAlternatives:(id)a9 nameAlternativesCounts:(id)a10 faceAttributes:(id)a11 faceAttributesCounts:(id)a12 nameKey:(id)a13 emailKey:(id)a14 contactIdentifierKey:(id)a15 emailAddressKey:(id)a16 photosPersonIdentifierKey:(id)a17 personTypeKey:(id)a18 nameAlternativesKey:(id)a19 faceAttributesKey:(id)a20 attributeSet:(id)a21
{
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;

  v46 = a3;
  v45 = a4;
  v42 = a5;
  v41 = a6;
  v44 = a7;
  v43 = a8;
  v38 = a9;
  v36 = a10;
  v35 = a11;
  v32 = a12;
  v34 = a13;
  v33 = a14;
  v37 = a15;
  v39 = a16;
  v26 = a17;
  v27 = a18;
  v28 = a19;
  v29 = a20;
  v30 = a21;
  v31 = (void *)MEMORY[0x18D782104]();
  -[CSSearchableItem extractAndStandardizePersonInformation:contactIdentifierKey:emailKey:nameKey:emailAddressExtractKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:contactIdentifiers:emails:names:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:persons:](self, "extractAndStandardizePersonInformation:contactIdentifierKey:emailKey:nameKey:emailAddressExtractKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:contactIdentifiers:emails:names:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:persons:", v30, v37, v33, v34, v39, v26, v27, v28, v29, v41, v42, v45, v44, v43, v38,
    v36,
    v35,
    v32,
    v46);
  objc_autoreleasePoolPop(v31);

}

- (void)_populateMissingPeopleWithNames:(id)a3 emailAddresses:(id)a4 allItemPersons:(id)a5 primaryItemPersons:(id)a6 additionalItemPersons:(id)a7 hiddenAdditionalItemPersons:(id)a8 personDictionary:(id)a9 contactProperties:(id)a10 nameKey:(id)a11 emailKey:(id)a12 contactIdentifierKey:(id)a13 personKey:(id)a14 photosPersonIdentifierKey:(id)a15 personTypeKey:(id)a16 nameAlternativesKey:(id)a17 faceAttributesKey:(id)a18 attributeSet:(id)a19
{
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v113;
  id v114;
  id v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void (**v123)(void *, void *, void *);
  void *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD aBlock[5];
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t (*v137)(uint64_t, uint64_t);
  void (*v138)(uint64_t);
  id v139;
  _BYTE v140[128];
  uint64_t v141;
  _BYTE v142[128];
  _QWORD v143[3];

  v143[1] = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v25 = a4;
  v113 = a5;
  v116 = a6;
  v115 = a7;
  v114 = a8;
  v26 = a9;
  v27 = a10;
  v105 = a11;
  v106 = a12;
  v107 = a13;
  v104 = a14;
  v108 = a15;
  v110 = a16;
  v111 = a17;
  v109 = a18;
  v119 = a19;
  v121 = v24;
  v28 = objc_msgSend(v24, "count");
  v120 = v25;
  v29 = objc_msgSend(v25, "count");
  if (v28)
    v30 = v29 == 0;
  else
    v30 = 1;
  v32 = !v30 && v28 == v29;
  v122 = v26;
  v33 = objc_msgSend(v26, "count");
  v103 = v27;
  v34 = objc_msgSend(v27, "count");
  v134 = 0;
  v135 = &v134;
  v136 = 0x3032000000;
  v137 = __Block_byref_object_copy__2;
  v138 = __Block_byref_object_dispose__2;
  v139 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __335__CSSearchableItem_Internal___populateMissingPeopleWithNames_emailAddresses_allItemPersons_primaryItemPersons_additionalItemPersons_hiddenAdditionalItemPersons_personDictionary_contactProperties_nameKey_emailKey_contactIdentifierKey_personKey_photosPersonIdentifierKey_personTypeKey_nameAlternativesKey_faceAttributesKey_attributeSet___block_invoke;
  aBlock[3] = &unk_1E2401788;
  aBlock[4] = &v134;
  v123 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  if (objc_msgSend(v116, "count"))
    v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v116);
  else
    v124 = 0;
  if (objc_msgSend(v115, "count"))
    v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v115);
  else
    v117 = 0;
  if (!v114)
  {
    v118 = 0;
    if (v32)
      goto LABEL_18;
LABEL_24:
    if (v33)
    {
      if (!v124)
        v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v116);
      objc_msgSend(v26, "allKeys");
      v131 = 0u;
      v132 = 0u;
      v129 = 0u;
      v130 = 0u;
      v40 = (id)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v129, v142, 16);
      if (v41)
      {
        v42 = *(_QWORD *)v130;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v130 != v42)
              objc_enumerationMutation(v40);
            v44 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * i);
            objc_msgSend(v122, "objectForKeyedSubscript:", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v141 = v44;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v141, 1);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v123[2](v123, v45, v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v124, "addObject:", v47);

          }
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v129, v142, 16);
        }
        while (v41);
      }

    }
    else
    {
      if (!v34)
        goto LABEL_36;
      if (!v124)
        v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v116);
      if (!v135[5])
      {
        +[CSContactsWrapper sharedInstance](CSContactsWrapper, "sharedInstance");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "CNContactEmailAddressesKeyString");
        v87 = objc_claimAutoreleasedReturnValue();
        v88 = (void *)v135[5];
        v135[5] = v87;

      }
      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      v40 = v103;
      v89 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v125, v140, 16);
      if (v89)
      {
        v90 = *(_QWORD *)v126;
        do
        {
          for (j = 0; j != v89; ++j)
          {
            if (*(_QWORD *)v126 != v90)
              objc_enumerationMutation(v40);
            v92 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * j);
            objc_msgSend(v92, "key");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = objc_msgSend(v93, "isEqualToString:", v135[5]);

            if (v94)
            {
              objc_msgSend(v92, "contact");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "givenName");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "value");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "allObjects");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              v123[2](v123, v96, v98);
              v99 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v92, "contact");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "identifier");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v99, "setContactIdentifier:", v101);

              objc_msgSend(v124, "addObject:", v99);
            }
          }
          v89 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v125, v140, 16);
        }
        while (v89);
      }
    }

    goto LABEL_36;
  }
  v118 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v114);
  if (!v32)
    goto LABEL_24;
LABEL_18:
  if (!v124)
    v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v116);
  v35 = 0;
  do
  {
    objc_msgSend(v24, "objectAtIndexedSubscript:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v143[0] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v123[2](v123, v36, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "addObject:", v39);

    ++v35;
  }
  while (v28 != v35);
LABEL_36:
  if (v113)
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v113);
  else
    v48 = 0;
  if (objc_msgSend(v48, "count"))
  {
    if (!v104)
      goto LABEL_44;
    objc_msgSend(v48, "array");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "setAttribute:forKey:", v49, v104);
  }
  else
  {
    v49 = v48;
    v48 = 0;
  }

LABEL_44:
  if (objc_msgSend(v124, "count"))
  {
    objc_msgSend(v124, "array");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "setAttribute:forKey:", v50, CFSTR("kMDItemPrimaryRecipientPersons"));

  }
  if (objc_msgSend(v117, "count"))
  {
    objc_msgSend(v117, "array");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "setAttribute:forKey:", v51, CFSTR("kMDItemAdditionalRecipientPersons"));

  }
  if (objc_msgSend(v118, "count"))
  {
    objc_msgSend(v118, "array");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "setAttribute:forKey:", v52, CFSTR("kMDItemHiddenAdditionalRecipientPersons"));

  }
  if (v124)
  {
    objc_msgSend(v119, "attributeForKey:", CFSTR("kMDItemPrimaryRecipients"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "attributeForKey:", CFSTR("kMDItemPrimaryRecipientEmailAddresses"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "attributeForKey:", CFSTR("kMDItemPrimaryRecipientContactIdentifiers"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v135[5];
    if (!v56)
    {
      +[CSContactsWrapper sharedInstance](CSContactsWrapper, "sharedInstance");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "CNContactEmailAddressesKeyString");
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = (void *)v135[5];
      v135[5] = v58;

      v56 = v135[5];
    }
    -[CSSearchableItem breakOutPersonInformationInSet:withName:emails:contactIdentifiers:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:nameKey:emailKey:contactIdentifierKey:emailAddressKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:](self, "breakOutPersonInformationInSet:withName:emails:contactIdentifiers:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:nameKey:emailKey:contactIdentifierKey:emailAddressKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:", v124, v53, v54, v55, 0, 0, 0, 0, 0, 0, CFSTR("kMDItemPrimaryRecipients"), CFSTR("kMDItemPrimaryRecipientEmailAddresses"), CFSTR("kMDItemPrimaryRecipientContactIdentifiers"), v56, 0,
      0,
      0,
      0,
      v119);

  }
  if (v117)
  {
    objc_msgSend(v119, "attributeForKey:", CFSTR("kMDItemAdditionalRecipients"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "attributeForKey:", CFSTR("kMDItemAdditionalRecipientEmailAddresses"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "attributeForKey:", CFSTR("kMDItemAdditionalRecipientContactIdentifiers"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v135[5];
    if (!v63)
    {
      +[CSContactsWrapper sharedInstance](CSContactsWrapper, "sharedInstance");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "CNContactEmailAddressesKeyString");
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = (void *)v135[5];
      v135[5] = v65;

      v63 = v135[5];
    }
    -[CSSearchableItem breakOutPersonInformationInSet:withName:emails:contactIdentifiers:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:nameKey:emailKey:contactIdentifierKey:emailAddressKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:](self, "breakOutPersonInformationInSet:withName:emails:contactIdentifiers:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:nameKey:emailKey:contactIdentifierKey:emailAddressKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:", v117, v60, v61, v62, 0, 0, 0, 0, 0, 0, CFSTR("kMDItemAdditionalRecipients"), CFSTR("kMDItemAdditionalRecipientEmailAddresses"), CFSTR("kMDItemAdditionalRecipientContactIdentifiers"), v63, 0,
      0,
      0,
      0,
      v119);

  }
  if (v118)
  {
    objc_msgSend(v119, "attributeForKey:", CFSTR("kMDItemHiddenAdditionalRecipients"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "attributeForKey:", CFSTR("kMDItemHiddenAdditionalRecipientEmailAddresses"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "attributeForKey:", CFSTR("kMDItemHiddenAdditionalRecipientContactIdentifiers"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v135[5];
    if (!v70)
    {
      +[CSContactsWrapper sharedInstance](CSContactsWrapper, "sharedInstance");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "CNContactEmailAddressesKeyString");
      v72 = objc_claimAutoreleasedReturnValue();
      v73 = (void *)v135[5];
      v135[5] = v72;

      v70 = v135[5];
    }
    -[CSSearchableItem breakOutPersonInformationInSet:withName:emails:contactIdentifiers:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:nameKey:emailKey:contactIdentifierKey:emailAddressKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:](self, "breakOutPersonInformationInSet:withName:emails:contactIdentifiers:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:nameKey:emailKey:contactIdentifierKey:emailAddressKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:", v118, v67, v68, v69, 0, 0, 0, 0, 0, 0, CFSTR("kMDItemHiddenAdditionalRecipients"), CFSTR("kMDItemHiddenAdditionalRecipientEmailAddresses"), CFSTR("kMDItemHiddenAdditionalRecipientContactIdentifiers"), v70, 0,
      0,
      0,
      0,
      v119);

  }
  if (v48)
  {
    objc_msgSend(v119, "attributeForKey:", v105);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "attributeForKey:", v106);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "attributeForKey:", v107);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "attributeForKey:", v108);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "attributeForKey:", v110);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "attributeForKey:", v111);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "attributeForKey:", CFSTR("kMDItemPhotosPeopleNamesAlternativesCounts"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "attributeForKey:", v109);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "attributeForKey:", CFSTR("kMDItemPhotosPeopleFaceAttributesCounts"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (v118 || v117 || v124)
    {
      objc_msgSend(v48, "removeAllObjects");
      objc_msgSend(v48, "unionOrderedSet:", v124);
      objc_msgSend(v48, "unionOrderedSet:", v117);
      objc_msgSend(v48, "unionOrderedSet:", v118);
    }
    v82 = v135[5];
    if (!v82)
    {
      +[CSContactsWrapper sharedInstance](CSContactsWrapper, "sharedInstance");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "CNContactEmailAddressesKeyString");
      v84 = objc_claimAutoreleasedReturnValue();
      v85 = (void *)v135[5];
      v135[5] = v84;

      v82 = v135[5];
    }
    -[CSSearchableItem breakOutPersonInformationInSet:withName:emails:contactIdentifiers:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:nameKey:emailKey:contactIdentifierKey:emailAddressKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:](self, "breakOutPersonInformationInSet:withName:emails:contactIdentifiers:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:nameKey:emailKey:contactIdentifierKey:emailAddressKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:", v48, v74, v75, v76, v77, v102, v78, v79, v80, v81, v105, v106, v107, v82, v108,
      v110,
      v111,
      v109,
      v119);

  }
  _Block_object_dispose(&v134, 8);

}

CSPerson *__335__CSSearchableItem_Internal___populateMissingPeopleWithNames_emailAddresses_allItemPersons_primaryItemPersons_additionalItemPersons_hiddenAdditionalItemPersons_personDictionary_contactProperties_nameKey_emailKey_contactIdentifierKey_personKey_photosPersonIdentifierKey_personTypeKey_nameAlternativesKey_faceAttributesKey_attributeSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CSPerson *v11;

  v5 = a2;
  v6 = a3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    +[CSContactsWrapper sharedInstance](CSContactsWrapper, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CNContactEmailAddressesKeyString");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  v11 = -[CSPerson initWithDisplayName:handles:handleIdentifier:]([CSPerson alloc], "initWithDisplayName:handles:handleIdentifier:", v5, v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  return v11;
}

- (id)filteredSpotlightAttributes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (filteredSpotlightAttributes_once != -1)
    dispatch_once(&filteredSpotlightAttributes_once, &__block_literal_global_193);
  -[CSSearchableItem attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet attributeForKey:](self->_attributeSet, "attributeForKey:", CFSTR("kMDItemTextContent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet attributeForKey:](self->_attributeSet, "attributeForKey:", CFSTR("kMDItemHTMLContent"));
  v5 = objc_claimAutoreleasedReturnValue();
  -[CSSearchableItemAttributeSet attributeForKey:](self->_attributeSet, "attributeForKey:", CFSTR("kMDItemHTMLContentData"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v4)
    v7 = 1;
  else
    v7 = (v5 | v6) == 0;
  v8 = &unk_1EE03A000;
  if (v7)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = (id)filteredSpotlightAttributes_coreSpotlightOnlyKeys;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          -[CSSearchableItemAttributeSet attributeForKey:](self->_attributeSet, "attributeForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {

            v15 = (id)objc_msgSend(v3, "mutableCopy");
            v8 = (_QWORD *)&unk_1EE03A000;
            goto LABEL_24;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          continue;
        break;
      }
    }

    v15 = v3;
  }
  else
  {
    v15 = (id)objc_msgSend(v3, "mutableCopy");
    if (v6)
    {
      v16 = (id)v6;
    }
    else
    {
      objc_msgSend((id)v5, "dataUsingEncoding:", 4);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;
    _MDPlainTextFromHTMLData(v16, 0x7FFFFFFFuLL, 0, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v15, "setObject:forKey:", v4, CFSTR("kMDItemTextContent"));

LABEL_24:
    objc_msgSend(v15, "removeObjectsForKeys:", v8[301]);
  }

  return v15;
}

void __57__CSSearchableItem_Internal__filteredSpotlightAttributes__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[20];

  v2[19] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("kMDItemAuthorsDictionary");
  v2[1] = CFSTR("kMDItemPrimaryRecipientsDictionary");
  v2[2] = CFSTR("kMDItemAdditionalRecipientsDictionary");
  v2[3] = CFSTR("kMDItemHiddenAdditionalRecipientsDictionary");
  v2[4] = CFSTR("kMDItemAuthorContactProperties");
  v2[5] = CFSTR("kMDItemPrimaryRecipientContactProperties");
  v2[6] = CFSTR("kMDItemAdditionalRecipientContactProperties");
  v2[7] = CFSTR("kMDItemHiddenAdditionalRecipientContactProperties");
  v2[8] = CFSTR("kMDItemHTMLContent");
  v2[9] = CFSTR("kMDItemAuthorPersons");
  v2[10] = CFSTR("kMDItemPrimaryRecipientPersons");
  v2[11] = CFSTR("kMDItemAdditionalRecipientPersons");
  v2[12] = CFSTR("kMDItemHiddenAdditionalRecipientPersons");
  v2[13] = CFSTR("kMDItemEmailHeadersDictionary");
  v2[14] = CFSTR("kMDItemRelatedUniqueIdentifier");
  v2[15] = CFSTR("kMDItemWeakRelatedUniqueIdentifier");
  v2[16] = CFSTR("kMDItemHTMLContentData");
  v2[17] = CFSTR("kMDItemAlternateNames");
  v2[18] = CFSTR("kMDItemContentURL");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 19);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)filteredSpotlightAttributes_coreSpotlightOnlyKeys;
  filteredSpotlightAttributes_coreSpotlightOnlyKeys = v0;

}

- (void)_updateWithSearchableItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "isUpdate"))
  {
    objc_msgSend(v8, "expirationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v8, "expirationDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSSearchableItem setExpirationDate:](self, "setExpirationDate:", v5);

    }
    -[CSSearchableItem attributeSet](self, "attributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAttributesFromAttributeSet:", v7);

  }
}

@end
