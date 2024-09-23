@implementation ICHashtag

+ (NSString)localizedSectionTitle
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Tags"), CFSTR("Tags"), 0, 1);
}

+ (id)canonicalHashtagsInContext:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "allVisibleHashtagsInContext:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "standardizedContent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (!v11
          || (objc_msgSend(v11, "creationDate"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v9, "creationDate"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v13, "compare:", v14),
              v14,
              v13,
              v15 >= 1))
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v10);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  v16 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_standardizedContent);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortDescriptorWithKey:ascending:", v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sortedArrayUsingDescriptors:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)allVisibleHashtagsInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "predicateForVisibleObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)recordType
{
  return (NSString *)CFSTR("Hashtag");
}

- (id)recordZoneName
{
  return CFSTR("Notes");
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10;
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
  BOOL v23;
  objc_super v25;

  v10 = a3;
  if (a5)
  {
    v11 = (void *)MEMORY[0x1E0D641A0];
    -[ICHashtag className](self, "className");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ICStringFromSyncingApproach(a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICHashtag(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:]", 1, 0, CFSTR("Object %@ does not support sync approach: %@"), v12, v13);

LABEL_5:
    v23 = 0;
    goto LABEL_6;
  }
  v25.receiver = self;
  v25.super_class = (Class)ICHashtag;
  if (!-[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:](&v25, sel_mergeCloudKitRecord_accountID_approach_mergeableFieldState_, v10, a4, 0, a6))goto LABEL_5;
  objc_msgSend(v10, "recordID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "recordName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHashtag setIdentifier:](self, "setIdentifier:", v15);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CreationDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHashtag setCreationDate:](self, "setCreationDate:", v16);

  objc_msgSend(v10, "encryptedValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("DisplayTextEncrypted"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ic_stringValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHashtag setDisplayText:](self, "setDisplayText:", v19);

  objc_msgSend(v10, "encryptedValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("StandardizedContentEncrypted"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ic_stringValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHashtag setStandardizedContent:](self, "setStandardizedContent:", v22);

  v23 = 1;
LABEL_6:

  return v23;
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
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
  objc_super v21;

  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0D641A0];
    -[ICHashtag className](self, "className", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ICStringFromSyncingApproach(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICHashtag(CloudKit) makeCloudKitRecordForApproach:mergeableFieldState:]", 1, 0, CFSTR("Object %@ does not support sync approach: %@"), v7, v8);

    return 0;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)ICHashtag;
    -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:](&v21, sel_makeCloudKitRecordForApproach_mergeableFieldState_, 0, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject creationDate](self, "creationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[ICCloudSyncingObject creationDate](self, "creationDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("CreationDate"));

    }
    -[ICHashtag displayText](self, "displayText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[ICHashtag displayText](self, "displayText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "ic_dataValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "encryptedValues");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("DisplayTextEncrypted"));

    }
    -[ICHashtag standardizedContent](self, "standardizedContent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[ICHashtag standardizedContent](self, "standardizedContent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ic_dataValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "encryptedValues");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("StandardizedContentEncrypted"));

    }
    return v10;
  }
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a5;
  objc_msgSend(a3, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICHashtag hashtagWithIdentifier:context:](ICHashtag, "hashtagWithIdentifier:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v7 = a4;
  v8 = a3;
  +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[ICHashtag newHashtagWithIdentifier:displayText:account:](ICHashtag, "newHashtagWithIdentifier:displayText:account:", v11, &stru_1E76DB108, v9);

  objc_msgSend(v9, "addHashtagsObject:", v12);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCreationDate:", v13);

  objc_msgSend(v12, "mergeCloudKitRecord:accountID:approach:", v8, v7, 0);
  objc_msgSend(v12, "setServerRecord:", v8);

  objc_msgSend(v12, "setInCloud:", 1);
  objc_msgSend(v12, "clearChangeCountWithReason:", CFSTR("Created tag"));
  objc_msgSend(v12, "updateParentReferenceIfNecessary");

  return v12;
}

- (BOOL)isInICloudAccount
{
  ICHashtag *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ICHashtag managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__ICHashtag_CloudKit__isInICloudAccount__block_invoke;
  v5[3] = &unk_1E76C76B0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __40__ICHashtag_CloudKit__isInICloudAccount__block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isInCloud"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "account");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "accountType") == 1;

  }
}

- (void)deleteFromLocalDatabase
{
  +[ICHashtag purgeHashtag:](ICHashtag, "purgeHashtag:", self);
}

- (BOOL)supportsDeletionByTTL
{
  return 1;
}

- (int64_t)visibilityTestingType
{
  return 1;
}

- (unint64_t)searchResultsSection
{
  return 4;
}

- (unint64_t)searchResultType
{
  return 4;
}

- (NSArray)authorsExcludingCurrentUser
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)searchResultCanBeDeletedFromNoteContext
{
  return 0;
}

- (BOOL)isHiddenFromIndexing
{
  return !-[ICCloudSyncingObject isVisible](self, "isVisible");
}

- (BOOL)isMovable
{
  return 0;
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)CFSTR("Modern");
}

- (NSString)searchIndexingIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[ICHashtag objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URIRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)searchDomainIdentifier
{
  void *v2;
  void *v3;

  -[ICHashtag account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CSSearchableItemAttributeSet)userActivityContentAttributeSet
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithItemContentType:", CFSTR("com.apple.notes.spotlightrecord"));
  -[ICCloudSyncingObject creationDate](self, "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentCreationDate:", v4);

  -[ICCloudSyncingObject creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAddedDate:", v5);

  return (CSSearchableItemAttributeSet *)v3;
}

- (CSSearchableItemAttributeSet)searchableItemAttributeSet
{
  void *v3;
  void *v4;

  -[ICHashtag userActivityContentAttributeSet](self, "userActivityContentAttributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHashtag displayText](self, "displayText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayName:", v4);
  objc_msgSend(v3, "setTextContent:", v4);
  objc_msgSend(v3, "setIc_searchResultType:", 4);
  objc_msgSend(v3, "ic_populateValuesForSpecializedFields");
  objc_msgSend(v3, "setDataOwnerType:", &unk_1E771A480);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICHashtag associateAppEntityWithSearchableItemAttributeSet:](self, "associateAppEntityWithSearchableItemAttributeSet:", v3);

  return (CSSearchableItemAttributeSet *)v3;
}

- (id)searchableTextContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHashtag displayText](self, "displayText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[ICHashtag standardizedContent](self, "standardizedContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dataForTypeIdentifier:(id)a3
{
  return 0;
}

- (id)fileURLForTypeIdentifier:(id)a3
{
  return 0;
}

- (BOOL)shouldSyncMinimumSupportedNotesVersion
{
  return 1;
}

+ (id)hashtagWithDisplayText:(id)a3 account:(id)a4 createIfNecessary:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "standardizedHashtagRepresentationForDisplayText:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hashtagWithStandardizedContent:account:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 && v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(a1, "newHashtagWithIdentifier:displayText:account:", v13, v8, v9);
    objc_msgSend(v11, "updateChangeCountWithReason:", CFSTR("Created tag"));

  }
  return v11;
}

+ (id)newHashtagWithIdentifier:(id)a3 displayText:(id)a4 account:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(a1, "newObjectWithIdentifier:context:", v10, v11);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCreationDate:", v13);

  objc_msgSend(v9, "ic_withoutHashtagPrefix");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDisplayText:", v14);

  objc_msgSend(a1, "standardizedHashtagRepresentationForDisplayText:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setStandardizedContent:", v15);
  objc_msgSend(v8, "persistentStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assignToPersistentStore:", v16);

  objc_msgSend(v8, "addHashtagsObject:", v12);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v12, CFSTR("ICAccountDidAddHashtagNotificationHashtagKey"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("ICAccountDidAddHashtagNotification"), v8, v18);

  return v12;
}

- (BOOL)canRenameTagWithNewDisplayText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  +[ICHashtag standardizedHashtagRepresentationForDisplayText:](ICHashtag, "standardizedHashtagRepresentationForDisplayText:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHashtag account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICHashtag hashtagWithStandardizedContent:account:](ICHashtag, "hashtagWithStandardizedContent:account:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICHashtag standardizedContent](self, "standardizedContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v4);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (id)hashtagWithIdentifier:(id)a3 context:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("identifier = %@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)hashtagsWithStandardizedContent:(id)a3 onlyVisible:(BOOL)a4 account:(id)a5 context:(id)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v7 = a4;
  v16[1] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  if (a3)
  {
    objc_msgSend(a1, "predicateForHashtagWithStandardizedContent:onlyVisible:account:", a3, v7, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:context:", v11, v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((standardizedContent) != nil)", "+[ICHashtag hashtagsWithStandardizedContent:onlyVisible:account:context:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "standardizedContent");
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

+ (id)hashtagsWithStandardizedContent:(id)a3 context:(id)a4
{
  return (id)objc_msgSend(a1, "hashtagsWithStandardizedContent:onlyVisible:account:context:", a3, 1, 0, a4);
}

+ (id)hashtagObjectIDsWithStandardizedContents:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  id v16;

  v6 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __62__ICHashtag_hashtagObjectIDsWithStandardizedContents_context___block_invoke;
  v14 = &unk_1E76CEFE8;
  v15 = v6;
  v16 = a1;
  v7 = v6;
  objc_msgSend(a3, "ic_flatMap:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __62__ICHashtag_hashtagObjectIDsWithStandardizedContents_context___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 40), "hashtagsWithStandardizedContent:context:", a2, *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_compactMap:", &__block_literal_global_59);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __62__ICHashtag_hashtagObjectIDsWithStandardizedContents_context___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

+ (id)hashtagObjectIDWithStandardizedContent:(id)a3 context:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hashtagObjectIDsWithStandardizedContents:context:", v9, v7, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)hashtagWithStandardizedContent:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hashtagsWithStandardizedContent:onlyVisible:account:context:", v7, 1, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)hashtagWithStandardizedContent:(id)a3 onlyVisible:(BOOL)a4 account:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hashtagsWithStandardizedContent:onlyVisible:account:context:", v9, v5, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)allVisibleHashtagsForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "predicateForHashtagWithStandardizedContent:onlyVisible:account:", 0, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)enumerateHashtagsInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6
{
  objc_msgSend(a1, "ic_enumerateObjectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:context:batchSize:saveAfterBatch:usingBlock:", 0, 0, 0, a3, a4, a5, a6);
}

+ (id)predicateForHashtagWithStandardizedContent:(id)a3 onlyVisible:(BOOL)a4 account:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  if (v6)
  {
    objc_msgSend(a1, "predicateForVisibleObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
  if (v9)
  {
    v12 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithFormat:", CFSTR("account.identifier == %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v14);

  }
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("standardizedContent == %@"), v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v15);

  }
  v16 = (void *)MEMORY[0x1E0CB3528];
  v17 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (void)purgeHashtag:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("ICAccountDidPurgeHashtagNotification"), 0, 0);

  objc_msgSend(v4, "managedObjectContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteObject:", v4);

}

+ (id)standardizedHashtagRepresentationForDisplayText:(id)a3
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

  v3 = (void *)MEMORY[0x1E0C99DC8];
  v4 = a3;
  objc_msgSend(v3, "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByFoldingWithOptions:locale:", 257, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ic_trimmedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3500];
  objc_msgSend(MEMORY[0x1E0CB3940], "ic_hashtagCharacterString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "characterSetWithCharactersInString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_stringByTrimmingLeadingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "uppercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (void)dedupeHashtagsInAccount:(id)a3
{
  objc_msgSend(a1, "dedupeHashtagsInAccount:atomicityExploitationCallback:", a3, 0);
}

+ (void)dedupeHashtagsInAccount:(id)a3 atomicityExploitationCallback:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
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
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  _BYTE v78[128];
  _QWORD v79[3];
  uint8_t v80[128];
  uint8_t buf[4];
  uint64_t v82;
  __int16 v83;
  void *v84;
  _QWORD v85[3];
  _QWORD v86[2];
  _QWORD v87[4];

  v87[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v66 = a4;
  v7 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[ICHashtag dedupeHashtagsInAccount:atomicityExploitationCallback:].cold.2(v6, v7);

  v8 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("creationDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "expressionForFunction:arguments:", CFSTR("min:"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v12, "setName:", CFSTR("minCreationDate"));
  objc_msgSend(v12, "setExpression:", v11);
  objc_msgSend(v12, "setExpressionResultType:", 900);
  v13 = (void *)MEMORY[0x1E0CB3528];
  +[ICCloudSyncingObject predicateForVisibleObjects](ICCloudSyncingObject, "predicateForVisibleObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v14;
  v15 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateWithFormat:", CFSTR("account.identifier == %@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)v19;
  objc_msgSend(a1, "fetchRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPredicate:", v19);
  objc_msgSend(v21, "setPropertiesToGroupBy:", &unk_1E771AC08);
  v85[0] = CFSTR("standardizedContent");
  v85[1] = v12;
  v85[2] = CFSTR("objectID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPropertiesToFetch:", v22);

  objc_msgSend(v21, "setResultType:", 2);
  objc_msgSend(v6, "managedObjectContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0;
  objc_msgSend(v23, "executeFetchRequest:error:", v21, &v77);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v77;

  if (v25)
  {
    v26 = (void *)MEMORY[0x1E0D641A0];
    objc_msgSend(v6, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICHashtag dedupeHashtagsInAccount:atomicityExploitationCallback:]", 1, 0, CFSTR("Failed to fetch unique hashtags for account %@: %@"), v27, v25);
    v28 = v66;
  }
  else
  {
    v67 = a1;
    v60 = v21;
    v61 = v12;
    v62 = v11;
    v63 = v20;
    v29 = os_log_create("com.apple.notes", "CoreData");
    v65 = v24;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_msgSend(v24, "count");
      objc_msgSend(v6, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v82 = v30;
      v83 = 2112;
      v84 = v31;
      _os_log_impl(&dword_1BD918000, v29, OS_LOG_TYPE_DEFAULT, "Found %lu unique hashtags for account: %@", buf, 0x16u);

      v24 = v65;
    }
    v64 = v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v33 = v24;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v74 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("objectID"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v39);

          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("standardizedContent"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v40);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
      }
      while (v35);
    }

    v28 = v66;
    if (v66)
      (*((void (**)(id))v66 + 2))(v66);
    objc_msgSend(v67, "fetchRequest");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)MEMORY[0x1E0CB3528];
    v20 = v63;
    v79[0] = v63;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("standardizedContent IN %@"), v32);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v43;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (self IN %@)"), v27);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v79[2] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 3);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "andPredicateWithSubpredicates:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setPredicate:", v46);

    v6 = v64;
    objc_msgSend(v64, "managedObjectContext");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0;
    objc_msgSend(v47, "executeFetchRequest:error:", v41, &v72);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v72;

    if (v25)
    {
      v49 = (void *)MEMORY[0x1E0D641A0];
      objc_msgSend(v64, "identifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICHashtag dedupeHashtagsInAccount:atomicityExploitationCallback:]", 1, 0, CFSTR("Failed to fetch hashtags to delete for account %@: %@"), v50, v25);
    }
    else
    {
      v59 = v41;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v58 = v48;
      v51 = v48;
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
      if (v52)
      {
        v53 = v52;
        v54 = *(_QWORD *)v69;
        do
        {
          for (j = 0; j != v53; ++j)
          {
            if (*(_QWORD *)v69 != v54)
              objc_enumerationMutation(v51);
            v56 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
            v57 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
              +[ICHashtag dedupeHashtagsInAccount:atomicityExploitationCallback:].cold.1(buf, v56, &v82, v57);

            objc_msgSend(v56, "markForDeletion");
          }
          v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
        }
        while (v53);
      }

      v6 = v64;
      objc_msgSend(v64, "managedObjectContext");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "ic_save");
      v28 = v66;
      v20 = v63;
      v25 = 0;
      v41 = v59;
      v48 = v58;
    }

    v12 = v61;
    v11 = v62;
    v21 = v60;
    v24 = v65;
  }

}

+ (BOOL)regenerateStandardizedContentForAllHashtagsInContext:(id)a3 hasChanges:(BOOL *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  BOOL v20;
  void *v22;
  BOOL *v23;
  char v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "predicateForHashtagWithStandardizedContent:onlyVisible:account:", 0, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v6;
  objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v7, v6);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v9)
  {

    v20 = 0;
    if (!a4)
      goto LABEL_17;
    goto LABEL_16;
  }
  v10 = v9;
  v22 = v7;
  v23 = a4;
  v24 = 0;
  v11 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      v14 = (void *)MEMORY[0x1C3B7AC74]();
      objc_msgSend(v13, "displayText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "standardizedHashtagRepresentationForDisplayText:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "standardizedContent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      if ((v18 & 1) == 0)
      {
        objc_msgSend(v13, "standardizedContent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICInlineAttachment regenerateTokenContentIdentifierForHashtagAttachmentsInContext:currentTokenContentIdentifier:save:](ICInlineAttachment, "regenerateTokenContentIdentifierForHashtagAttachmentsInContext:currentTokenContentIdentifier:save:", v25, v19, 0);

        objc_msgSend(v13, "setStandardizedContent:", v16);
        objc_msgSend(v13, "updateChangeCountWithReason:", CFSTR("Regenerated standardized content"));
        v24 = 1;
      }

      objc_autoreleasePoolPop(v14);
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v10);

  if ((v24 & 1) != 0)
  {
    objc_msgSend(v25, "ic_save");
    v20 = 1;
  }
  else
  {
    v20 = 0;
  }
  v7 = v22;
  a4 = v23;
  if (v23)
LABEL_16:
    *a4 = v20;
LABEL_17:

  return 1;
}

+ (id)renameHashtagsWithStandardizedContent:(id)a3 newDisplayText:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  _UNKNOWN **v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _QWORD v66[3];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v7 = a4;
  v8 = a5;
  if (!objc_msgSend(v7, "length"))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "newDisplayText.length", "+[ICHashtag renameHashtagsWithStandardizedContent:newDisplayText:context:]", 1, 0, CFSTR("Hashtag must have a non-empty display text"));
  v9 = &off_1E76C5000;
  +[ICHashtag standardizedHashtagRepresentationForDisplayText:](ICHashtag, "standardizedHashtagRepresentationForDisplayText:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v7;
  objc_msgSend(v7, "ic_withHashtagPrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  +[ICAccount allActiveAccountsInContext:](ICAccount, "allActiveAccountsInContext:", v8);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
  if (v45)
  {
    v43 = *(_QWORD *)v61;
    v44 = v8;
    v50 = v11;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v61 != v43)
          objc_enumerationMutation(obj);
        v49 = v12;
        v13 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v12);
        objc_msgSend(v9[429], "hashtagWithStandardizedContent:account:", v51, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "markForDeletion");
        v48 = v14;
        if (v14)
        {
          objc_msgSend(v9[429], "hashtagWithDisplayText:account:createIfNecessary:", v42, v13, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v15);

        }
        v47 = v13;
        v16 = (void *)MEMORY[0x1E0CB3528];
        +[ICBaseAttachment predicateForVisibleObjects](ICInlineAttachment, "predicateForVisibleObjects");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v66[0] = v17;
        +[ICInlineAttachment predicateForTypeUTI:](ICInlineAttachment, "predicateForTypeUTI:", CFSTR("com.apple.notes.inlinetextattachment.hashtag"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v66[1] = v18;
        +[ICInlineAttachment predicateForTokenContentIdentifier:](ICInlineAttachment, "predicateForTokenContentIdentifier:", v51);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v66[2] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "andPredicateWithSubpredicates:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICInlineAttachment ic_objectsMatchingPredicate:context:](ICInlineAttachment, "ic_objectsMatchingPredicate:context:", v21, v8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v23 = v22;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v57;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v57 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
              objc_msgSend(v28, "setTokenContentIdentifier:", v10);
              objc_msgSend(v28, "setAltText:", v50);
              objc_msgSend(v28, "updateChangeCountWithReason:", CFSTR("Renamed tag"));
              v29 = (id)objc_msgSend(v28, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICInlineAttachmentDataChangedNotification"));
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
          }
          while (v25);
        }
        v46 = v23;

        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        +[ICFolder visibleSmartFoldersForHashtagStandardizedContent:account:](ICFolder, "visibleSmartFoldersForHashtagStandardizedContent:account:", v51, v47);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v53;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v53 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
              objc_msgSend(v35, "smartFolderQuery");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "replacingTagIdentifier:withNewTagIdentifier:", v51, v10);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setSmartFolderQuery:", v37);

              objc_msgSend(v35, "updateChangeCountWithReason:", CFSTR("Renamed tag"));
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
          }
          while (v32);
        }

        +[ICInlineAttachment regenerateDerivedDataForInlineAttachments:reason:](ICInlineAttachment, "regenerateDerivedDataForInlineAttachments:reason:", v46, CFSTR("Renamed tag"));
        v11 = v50;
        v12 = v49 + 1;
        v8 = v44;
        v9 = &off_1E76C5000;
      }
      while (v49 + 1 != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
    }
    while (v45);
  }

  v38 = (void *)objc_msgSend(v41, "copy");
  return v38;
}

- (id)ic_loggingValues
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  ICHashtag *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICHashtag;
  -[ICCloudSyncingObject ic_loggingValues](&v12, sel_ic_loggingValues);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ICHashtag managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__ICHashtag_ic_loggingValues__block_invoke;
  v9[3] = &unk_1E76C73B0;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = v6;
  return v7;
}

void __29__ICHashtag_ic_loggingValues__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 40), "creationDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (const __CFString *)v2;
  else
    v4 = CFSTR("nil");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, CFSTR("creationDate"));

  objc_msgSend(*(id *)(a1 + 40), "standardizedContent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_sha256");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("nil");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, CFSTR("standardizedContentHash"));

}

- (void)associateAppEntityWithSearchableItemAttributeSet:(id)a3
{
  id v4;
  ICHashtag *v5;

  v4 = a3;
  v5 = self;
  ICHashtag.associateAppEntity(with:)((CSSearchableItemAttributeSet)v4);

}

+ (void)dedupeHashtagsInAccount:(_QWORD *)a3 atomicityExploitationCallback:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "ic_loggingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1BD918000, a4, OS_LOG_TYPE_DEBUG, "Deleting duplicate hashtag: %@", a1, 0xCu);

}

+ (void)dedupeHashtagsInAccount:(void *)a1 atomicityExploitationCallback:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Attempting to de-dupe hashtags for account: %@", (uint8_t *)&v4, 0xCu);

}

@end
