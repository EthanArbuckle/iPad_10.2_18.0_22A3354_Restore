@implementation PHPerson

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (PHPerson)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHPerson *v9;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *displayName;
  uint64_t v14;
  NSString *uuid;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  NSString *personUri;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSDictionary *contactMatchingDictionary;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  unsigned __int16 v37;
  unint64_t v38;
  uint64_t v39;
  NSString *mdID;
  objc_super v42;

  v8 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PHPerson;
  v9 = -[PHObject initWithFetchDictionary:propertyHint:photoLibrary:](&v42, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("fullName"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v9->_name;
    v9->_name = (NSString *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("displayName"));
    v12 = objc_claimAutoreleasedReturnValue();
    displayName = v9->_displayName;
    v9->_displayName = (NSString *)v12;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("personUUID"));
    v14 = objc_claimAutoreleasedReturnValue();
    uuid = v9->super._uuid;
    v9->super._uuid = (NSString *)v14;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("detectionType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_detectionType = objc_msgSend(v16, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_type = objc_msgSend(v17, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("manualOrder"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_manualOrder = objc_msgSend(v18, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mergeCandidateConfidence"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v9->_mergeCandidateConfidence = v20;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("personUri"));
    v21 = objc_claimAutoreleasedReturnValue();
    personUri = v9->_personUri;
    v9->_personUri = (NSString *)v21;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inPersonNamingModel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_inPersonNamingModel = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("faceCount"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_faceCount = objc_msgSend(v24, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("verifiedType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_verifiedType = objc_msgSend(v25, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("questionType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_questionType = objc_msgSend(v26, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ageType"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_ageType = objc_msgSend(v27, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("genderType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_genderType = objc_msgSend(v28, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("genderType"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_sexType = objc_msgSend(v29, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("assetSortOrder"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_assetSortOrder = objc_msgSend(v30, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("contactMatchingDictionary"));
    v31 = objc_claimAutoreleasedReturnValue();
    contactMatchingDictionary = v9->_contactMatchingDictionary;
    v9->_contactMatchingDictionary = (NSDictionary *)v31;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("keyFacePickSource"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_keyFacePickSource = objc_msgSend(v33, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isMeConfidence"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    v9->_isMeConfidence = v35;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("suggestedForClientType"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "integerValue");

    if (v37 == 1)
    {
      v38 = v37;
    }
    else
    {
      if (v37)
      {
LABEL_7:
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mdID"));
        v39 = objc_claimAutoreleasedReturnValue();
        mdID = v9->_mdID;
        v9->_mdID = (NSString *)v39;

        goto LABEL_8;
      }
      v38 = 0;
    }
    v9->_persistedSuggestionForClient = v38;
    goto LABEL_7;
  }
LABEL_8:

  return v9;
}

- (BOOL)isVerified
{
  return self->_verifiedType != 0;
}

- (BOOL)isMe
{
  return self->_isMeConfidence > 0.0;
}

- (void)markAsNeedingKeyFace
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PHObject photoLibrary](self, "photoLibrary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetsdClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryInternalClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObject uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markPersonAsNeedingKeyFace:completionHandler:", v5, &__block_literal_global_206);

}

- (id)linkedContactWithKeysToFetch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PHObject photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sharedContactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHPerson personUri](self, "personUri");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unifiedContactWithIdentifier:keysToFetch:error:", v7, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0D71680], "contactWithMatchingDictionary:keysToFetch:contactStore:", self->_contactMatchingDictionary, v4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHPerson;
  -[PHObject description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PHPerson;
  -[PHObject description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPerson name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPerson displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObject uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PHPerson type](self, "type");
  v7 = -[PHPerson detectionType](self, "detectionType");
  v8 = -[PHPerson manualOrder](self, "manualOrder");
  -[PHPerson mergeCandidateConfidence](self, "mergeCandidateConfidence");
  v10 = v9;
  -[PHPerson personUri](self, "personUri");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" name=%@, displayName=%@, identifier=%@, type=%d, detectionType=%d, manualOrder=%d, mergeCandidateConfidence=%lf, personUri=%@, inPersonNamingModel=%d, faceCount=%d, verified=%d"), v14, v4, v5, v6, v7, v8, v10, v11, -[PHPerson isInPersonNamingModel](self, "isInPersonNamingModel"), -[PHPerson faceCount](self, "faceCount"), -[PHPerson isVerified](self, "isVerified"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_createPropertyObjectOfClass:(Class)a3 preFetchedProperties:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v32;
  _QWORD v33[4];
  __CFString *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  PHPerson *v39;
  uint64_t *v40;
  Class v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v6 = a4;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__23874;
  v46 = __Block_byref_object_dispose__23875;
  ph_objc_getAssociatedObject(self, a3);
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v43[5];
  if (!v7)
  {
    -[objc_class keyPathToPrimaryObject](a3, "keyPathToPrimaryObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v9 = objc_msgSend([a3 alloc], "initWithFetchDictionary:person:prefetched:", v6, self, 1);
      v10 = (__CFString *)v43[5];
      v43[5] = v9;
    }
    else
    {
      -[objc_class entityName](a3, "entityName");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = CFSTR("Person");
      if (v11)
        v13 = (__CFString *)v11;
      v14 = v13;

      v15 = (void *)MEMORY[0x1E0CB3880];
      -[PHObject objectID](self, "objectID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(v15, "predicateWithFormat:", CFSTR("%K == %@"), v8, v16);
      else
        objc_msgSend(v15, "predicateWithFormat:", CFSTR("self == %@"), v16);
      v17 = objc_claimAutoreleasedReturnValue();

      -[objc_class propertiesToFetch](a3, "propertiesToFetch");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[objc_class propertiesToSortBy](a3, "propertiesToSortBy");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)v17;
        v20 = v14;
      }
      else
      {
        v19 = (void *)v17;
        v20 = v14;
        v32 = 0;
      }
      -[PHObject photoLibrary](self, "photoLibrary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class propertySetName](a3, "propertySetName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectFetchingManagedObjectContextForObject:propertySet:", self, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __62__PHPerson__createPropertyObjectOfClass_preFetchedProperties___block_invoke;
      v33[3] = &unk_1E35DB1E0;
      v10 = v20;
      v34 = v10;
      v24 = v19;
      v35 = v24;
      v25 = v18;
      v36 = v25;
      v26 = v32;
      v37 = v26;
      v27 = v23;
      v38 = v27;
      v39 = self;
      v40 = &v42;
      v41 = a3;
      objc_msgSend(v27, "performBlockAndWait:", v33);

    }
    ph_objc_setAssociatedObjectIfNotSet(self, a3, (void *)v43[5]);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v43[5];
    v43[5] = v28;

    v7 = (void *)v43[5];
  }
  v30 = v7;
  _Block_object_dispose(&v42, 8);

  return v30;
}

- (id)_createPropertyObjectOfClass:(Class)a3
{
  return -[PHPerson _createPropertyObjectOfClass:preFetchedProperties:](self, "_createPropertyObjectOfClass:preFetchedProperties:", a3, 0);
}

- (id)userFeedbackProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 4);
  return -[PHPerson _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (NSString)name
{
  return self->_name;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)manualOrder
{
  return self->_manualOrder;
}

- (double)mergeCandidateConfidence
{
  return self->_mergeCandidateConfidence;
}

- (NSString)personUri
{
  return self->_personUri;
}

- (BOOL)isInPersonNamingModel
{
  return self->_inPersonNamingModel;
}

- (int64_t)faceCount
{
  return self->_faceCount;
}

- (NSDictionary)contactMatchingDictionary
{
  return self->_contactMatchingDictionary;
}

- (signed)detectionType
{
  return self->_detectionType;
}

- (int64_t)verifiedType
{
  return self->_verifiedType;
}

- (unsigned)questionType
{
  return self->_questionType;
}

- (unsigned)ageType
{
  return self->_ageType;
}

- (unsigned)genderType
{
  return self->_genderType;
}

- (unsigned)sexType
{
  return self->_sexType;
}

- (int64_t)assetSortOrder
{
  return self->_assetSortOrder;
}

- (signed)keyFacePickSource
{
  return self->_keyFacePickSource;
}

- (double)isMeConfidence
{
  return self->_isMeConfidence;
}

- (unint64_t)persistedSuggestionForClient
{
  return self->_persistedSuggestionForClient;
}

- (NSString)mdID
{
  return self->_mdID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mdID, 0);
  objc_storeStrong((id *)&self->_contactMatchingDictionary, 0);
  objc_storeStrong((id *)&self->_personUri, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __62__PHPerson__createPropertyObjectOfClass_preFetchedProperties___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const __CFString *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setPropertiesToFetch:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "setResultType:", 2);
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
    objc_msgSend(v2, "setSortDescriptors:", *(_QWORD *)(a1 + 56));
  v3 = *(void **)(a1 + 64);
  v13 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (!v4)
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 88), "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch property set %@ data for %@: %@", buf, 0x20u);

    }
    goto LABEL_11;
  }
  if (objc_msgSend(*(id *)(a1 + 88), "isToMany"))
  {
    v14 = CFSTR("fetchedResults");
    v15 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  }
  else
  {
    objc_msgSend(v4, "firstObject");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
LABEL_11:
    v9 = (void *)MEMORY[0x1E0C9AA70];
  v10 = objc_msgSend(objc_alloc(*(Class *)(a1 + 88)), "initWithFetchDictionary:person:prefetched:", v9, *(_QWORD *)(a1 + 72), 0);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

void __32__PHPerson_markAsNeedingKeyFace__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    PLPhotoKitGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_ERROR, "Error marking person as needing key face: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

+ (id)managedEntityName
{
  return CFSTR("Person");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHPerson");
  return CFSTR("PHPerson");
}

+ (BOOL)managedObjectSupportsPersonFilters
{
  return 1;
}

+ (BOOL)managedObjectSupportsKeyFaces
{
  return 1;
}

+ (BOOL)managedObjectSupportsDetectionType
{
  return 1;
}

+ (BOOL)managedObjectSupportsTorsoOnly
{
  return 1;
}

+ (id)identifierCode
{
  return CFSTR("070");
}

+ (id)_composePropertiesToFetchWithHint:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) == 0)
  {
    if ((v3 & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(a1, "corePropertiesToFetch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "extendPropertiesToFetch:withProperties:", v5, v8);

    if ((v3 & 4) == 0)
      return v5;
    goto LABEL_4;
  }
  objc_msgSend(a1, "identifierPropertiesToFetch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extendPropertiesToFetch:withProperties:", v5, v7);

  if ((v3 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v3 & 4) != 0)
LABEL_4:
    objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  return v5;
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (propertiesToFetchWithHint__onceToken_24131 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_24131, &__block_literal_global_24132);
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__23874;
  v9 = __Block_byref_object_dispose__23875;
  v10 = 0;
  pl_dispatch_sync();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

+ (id)identifierPropertiesToFetch
{
  pl_dispatch_once();
  return (id)identifierPropertiesToFetch_array;
}

+ (id)corePropertiesToFetch
{
  if (corePropertiesToFetch_onceToken_24128 != -1)
    dispatch_once(&corePropertiesToFetch_onceToken_24128, &__block_literal_global_113);
  return (id)corePropertiesToFetch_array_24129;
}

+ (BOOL)managedObjectSupportsCustomUUIDKey
{
  return 1;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_1;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PHPerson_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_24119 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_24119, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_24120, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

+ (id)localIdentifierExpressionForFetchRequests
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("personUUID"));
}

+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___PHPerson;
  objc_msgSendSuper2(&v21, sel_fetchPredicateFromComparisonPredicate_options_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
LABEL_13:
    v12 = v7;
    goto LABEL_14;
  }
  objc_msgSend(v6, "leftExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "expressionType") == 3)
  {
    objc_msgSend(v8, "keyPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("verified")) || objc_msgSend(v9, "expressionType"))
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("verifiedType")))
    {
      if (objc_msgSend(v9, "expressionType"))
      {
        v11 = 0;
      }
      else
      {
        objc_msgSend(v9, "constantValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v16;
        if (v16 && !objc_msgSend(v16, "intValue"))
        {
          v17 = (void *)MEMORY[0x1E0CB35D0];
          v22[0] = v8;
          v18 = (void *)MEMORY[0x1E0C99D20];
          v19 = v8;
          objc_msgSend(v18, "arrayWithObjects:count:", v22, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "expressionForFunction:arguments:", CFSTR("noindex:"), v20);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v8, v9, objc_msgSend(v6, "comparisonPredicateModifier"), objc_msgSend(v6, "predicateOperatorType"), objc_msgSend(v6, "options"));

    }
    else
    {
      v7 = 0;
    }

    goto LABEL_13;
  }
  objc_msgSend(v9, "constantValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "BOOLValue"))
    v15 = CFSTR("verifiedType != %d");
  else
    v15 = CFSTR("noindex:(verifiedType) == %d");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v15, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v12;
}

+ (id)fetchMePersonWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_141);
}

+ (id)fetchPersonsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_144);
}

+ (id)fetchPersonsWithType:(int64_t)a3 options:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PHPerson_fetchPersonsWithType_options___block_invoke;
  v5[3] = &__block_descriptor_40_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v5[4] = a3;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchPersonsWithQuestionType:(unsigned __int16)a3 options:(id)a4
{
  _QWORD v5[4];
  unsigned __int16 v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PHPerson_fetchPersonsWithQuestionType_options___block_invoke;
  v5[3] = &__block_descriptor_34_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v6 = a3;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchPersonsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__PHPerson_fetchPersonsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchPersonsWithMdIDs:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHPerson.m"), 468, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options.photoLibrary"));

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__PHPerson_fetchPersonsWithMdIDs_options___block_invoke;
  v14[3] = &unk_1E35DFCC0;
  v15 = v7;
  v10 = v7;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v8, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)fetchPersonsWithObjectIDs:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__PHPerson_fetchPersonsWithObjectIDs_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchPersonsInAsset:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    +[PHQuery queryForPersonsInAsset:options:](PHQuery, "queryForPersonsInAsset:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)fetchPersonsInAssets:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    +[PHQuery queryForPersonsInAssets:withOptions:](PHQuery, "queryForPersonsInAssets:withOptions:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executeQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)fetchPersonsInAssetsFetchResult:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    +[PHQuery queryForPersonsInAssetsFetchResult:withOptions:](PHQuery, "queryForPersonsInAssetsFetchResult:withOptions:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executeQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)fetchPersonsForAssetCollection:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  if (a3)
  {
    v6 = a3;
    objc_msgSend(v5, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      +[PHQuery queryForPersonsInAssetsFetchResult:withOptions:](PHQuery, "queryForPersonsInAssetsFetchResult:withOptions:", v9, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "executeQuery");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)fetchPersonsInSocialGroup:(id)a3 option:(id)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    +[PHGraphQuery graphQueryForPersonsInSocialGroup:options:](PHGraphQuery, "graphQueryForPersonsInSocialGroup:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)fetchPersonForShareParticipant:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    +[PHQuery queryForPersonWithShareParticipant:options:](PHQuery, "queryForPersonWithShareParticipant:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)fetchPersonWithFace:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    +[PHQuery queryForPersonWithFace:options:](PHQuery, "queryForPersonWithFace:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)fetchPersonsWithFaces:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  +[PHQuery queryForPersonsWithFaces:options:](PHQuery, "queryForPersonsWithFaces:options:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchRejectedPersonsForFace:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    +[PHQuery queryForRejectedPersonsForFace:options:](PHQuery, "queryForRejectedPersonsForFace:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)fetchPersonForFaceCrop:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  +[PHQuery queryForPersonForFaceCrop:options:](PHQuery, "queryForPersonForFaceCrop:options:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchPersonAssociatedWithFaceGroup:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__PHPerson_fetchPersonAssociatedWithFaceGroup_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchAssociatedPersonsGroupedByFaceGroupLocalIdentifierForFaceGroups:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v23;
  id v24;
  id obj;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__23874;
  v39 = __Block_byref_object_dispose__23875;
  v40 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
  v23 = a1;
  v9 = 0;
  if (v8)
  {
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (!v9)
          v9 = v12;
        objc_msgSend(v12, "localIdentifier", v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHObject uuidFromLocalIdentifier:](PHFaceGroup, "uuidFromLocalIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v7, "addObject:", v14);
        }
        else
        {
          PLPhotoKitGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v42 = v12;
            v43 = 2112;
            v44 = v13;
            _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Cannot have uuid == nil for a PHFaceGroup. Skipping faceGroup: %@ with localIdentifier: %@", buf, 0x16u);
          }

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
    }
    while (v8);
  }

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v24, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D71940];
  objc_msgSend(v16, "photoLibrary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __89__PHPerson_fetchAssociatedPersonsGroupedByFaceGroupLocalIdentifierForFaceGroups_options___block_invoke;
  v26[3] = &unk_1E35DB020;
  v29 = &v35;
  v19 = v16;
  v27 = v19;
  v20 = v24;
  v28 = v20;
  v30 = v23;
  objc_msgSend(v17, "batchFetchAssociatedPersonByFaceGroupUUIDWithFaceGroupUUIDs:predicate:library:completion:", v7, 0, v18, v26);

  v21 = (id)v36[5];
  _Block_object_dispose(&v35, 8);

  return v21;
}

+ (id)fetchMergeCandidatePersonsForPerson:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    +[PHQuery queryForMergeCandidatePersonsForPerson:options:](PHQuery, "queryForMergeCandidatePersonsForPerson:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)fetchMergeCandidateWithConfidencePersonsForPerson:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    +[PHQuery queryForMergeCandidateWithConfidencePersonsForPerson:options:](PHQuery, "queryForMergeCandidateWithConfidencePersonsForPerson:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)fetchInvalidMergeCandidatePersonsForPerson:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    +[PHQuery queryForInvalidMergeCandidatePersonsForPerson:options:](PHQuery, "queryForInvalidMergeCandidatePersonsForPerson:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)fetchFinalMergeTargetPersonsForPersonWithUUID:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  PHManualFetchResult *v13;
  void *v14;
  PHManualFetchResult *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__23874;
  v28 = __Block_byref_object_dispose__23875;
  v29 = 0;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "managedObjectContextForCurrentQueueQoS");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__PHPerson_fetchFinalMergeTargetPersonsForPersonWithUUID_options___block_invoke;
    v17[3] = &unk_1E35DEC10;
    v18 = v6;
    v11 = v10;
    v19 = v11;
    v20 = v7;
    v21 = v9;
    v22 = &v24;
    v23 = a1;
    objc_msgSend(v11, "performBlockAndWait:", v17);

  }
  if (v25[5])
  {
    v30[0] = v25[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }
  v13 = [PHManualFetchResult alloc];
  objc_msgSend(v7, "fetchPropertySetsAsSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PHManualFetchResult initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v13, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v12, v9, CFSTR("PHPerson"), v14, 0, 1);

  _Block_object_dispose(&v24, 8);
  return v15;
}

+ (id)_assetLocalIdentifiersForAssetCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = CFSTR("PHAssetPropertySetIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v6);

  objc_msgSend(v5, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v5, "setSortDescriptors:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v5, "setChunkSizeForFetch:", 2000);
  +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "localIdentifier", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

+ (id)_momentLocalIdentifiersForAssetCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "assetCollectionType") == 3)
  {
    objc_msgSend(v3, "localIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

    goto LABEL_21;
  }
  if (objc_msgSend(v3, "assetCollectionType") != 5)
  {
    objc_msgSend(v3, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = CFSTR("PHAssetPropertySetIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFetchPropertySets:", v7);

    objc_msgSend(v4, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(v4, "setSortDescriptors:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(v4, "setChunkSizeForFetch:", 2000);
    if (objc_msgSend(v3, "assetCollectionType") == 6)
    {
      +[PHAssetCollection fetchMomentsInHighlight:options:](PHAssetCollection, "fetchMomentsInHighlight:options:", v3, v4);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "assetCollectionType") == 4)
    {
      +[PHAssetCollection fetchMomentsBackingMemory:options:](PHAssetCollection, "fetchMomentsBackingMemory:options:", v3, v4);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v3, "assetCollectionType") != 8)
      {
        +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v3, v4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHAssetCollection fetchAssetCollectionsContainingAssets:withType:options:](PHAssetCollection, "fetchAssetCollectionsContainingAssets:withType:options:", v17, 3, v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      +[PHAssetCollection fetchMomentsBackingSuggestion:options:](PHAssetCollection, "fetchMomentsBackingSuggestion:options:", v3, v4);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v8;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "localIdentifier", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    goto LABEL_20;
  }
  objc_msgSend(v3, "momentLocalIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v5;
}

+ (id)fetchSuggestedPersonsForAssetCollection:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_fetchSuggestedRecipientsForFocusedAssetCollection:assetCollection:options:client:", 0, v6, v7, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_fetchSuggestedPersonsForRecipients:options:photoLibrary:", v8, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)fetchSuggestedPersonsForFocusedAssetCollection:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_fetchSuggestedRecipientsForFocusedAssetCollection:assetCollection:options:client:", v6, 0, v7, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_fetchSuggestedPersonsForRecipients:options:photoLibrary:", v8, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)fetchSuggestedRecipientsForAssetCollection:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(a1, "_fetchSuggestedRecipientsForFocusedAssetCollection:assetCollection:options:client:", 0, a3, a4, 2);
}

+ (id)fetchSuggestedRecipientsForFocusedAssetCollection:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(a1, "_fetchSuggestedRecipientsForFocusedAssetCollection:assetCollection:options:client:", a3, 0, a4, 2);
}

+ (id)batchFetchSuggestedRecipientsForAssets:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  _OWORD v19[4];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[PHMoment fetchMomentUUIDByAssetUUIDForAssets:options:](PHMoment, "fetchMomentUUIDByAssetUUIDForAssets:options:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "photoLibrary");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", &unk_1E3655AE0, CFSTR("PHPeopleSuggestionClientKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v10 = objc_msgSend(v6, "sharingStream");
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("PHSuggestedRecipientsSharingStreamKey"));

      }
    }
    if (!v8)
    {
      memset(v19, 0, sizeof(v19));
      v12 = v5;
      if (objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", v19, v24, 16))
      {
        objc_msgSend(**((id **)&v19[0] + 1), "photoLibrary");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

    }
    -[NSObject photoAnalysisClient](v8, "photoAnalysisClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v14, "requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID:options:error:", v7, v9, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;
    if (v15)
    {
      PLPhotoKitGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v7;
        v22 = 2112;
        v23 = v15;
        _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "Can't request suggested recipients for momentUUIDByAssetUUID %@: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v5;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Can't suggest recipients without valid input: %@", buf, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)_fetchSuggestedPersonsForRecipients:(id)a3 options:(id)a4 photoLibrary:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  PHManualFetchResult *v23;
  void *v24;
  PHManualFetchResult *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v35;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v15), "objectForKeyedSubscript:", CFSTR("localIdentifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "length"))
            objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v13);
    }

    +[PHPerson fetchPersonsWithLocalIdentifiers:options:](PHPerson, "fetchPersonsWithLocalIdentifiers:options:", v10, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fetchedObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __69__PHPerson__fetchSuggestedPersonsForRecipients_options_photoLibrary___block_invoke;
    v32[3] = &unk_1E35DB048;
    v33 = v10;
    v20 = v10;
    objc_msgSend(v18, "sortedArrayUsingComparator:", v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v19;
    v28 = 3221225472;
    v29 = __69__PHPerson__fetchSuggestedPersonsForRecipients_options_photoLibrary___block_invoke_2;
    v30 = &unk_1E35DB070;
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = v31;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", &v27);
    v23 = [PHManualFetchResult alloc];
    objc_msgSend(v8, "fetchPropertySetsAsSet", v27, v28, v29, v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PHManualFetchResult initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v23, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v22, v9, CFSTR("PHPerson"), v24, 0, 1);

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (id)_fetchSuggestedRecipientsForFocusedAssetCollection:(id)a3 assetCollection:(id)a4 options:(id)a5 client:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  dispatch_block_t v23;
  NSObject *v24;
  dispatch_time_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  void *v32;
  void *v33;
  _QWORD block[4];
  id v35;
  id v36;
  NSObject *v37;
  id v38;
  uint64_t *v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t v47[8];
  uint8_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint8_t buf[4];
  dispatch_time_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
    v13 = v11;
  else
    v13 = v10;
  objc_msgSend(v13, "photoLibrary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "photoAnalysisClient");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithObject:forKey:", v15, CFSTR("PHPeopleSuggestionClientKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v17 = objc_msgSend(v12, "sharingStream");
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("PHSuggestedRecipientsSharingStreamKey"));

    }
  }
  if (v10)
  {
    objc_msgSend(a1, "_assetLocalIdentifiersForAssetCollection:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    objc_msgSend(a1, "_momentLocalIdentifiersForAssetCollection:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v47 = 0;
    v48 = v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__23874;
    v51 = __Block_byref_object_dispose__23875;
    v52 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__23874;
    v45 = __Block_byref_object_dispose__23875;
    v46 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__PHPerson__fetchSuggestedRecipientsForFocusedAssetCollection_assetCollection_options_client___block_invoke;
    block[3] = &unk_1E35DB098;
    v39 = &v41;
    v35 = v32;
    v21 = v19;
    v36 = v21;
    v22 = v20;
    v37 = v22;
    v38 = v16;
    v40 = v47;
    v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
    dispatch_get_global_queue(21, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v24, v23);

    if (qos_class_self() < 0x16)
      v25 = -1;
    else
      v25 = dispatch_time(0, 150000000);
    PLPhotoKitGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v54 = v25;
      _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_DEFAULT, "Calling requestSuggestedRecipientsForAssetLocalIdentifiers with timeout %llu", buf, 0xCu);
    }

    if (dispatch_block_wait(v23, v25))
    {
      PLPhotoKitGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v54 = (dispatch_time_t)v22;
        _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_ERROR, "Timeout while requesting suggested recipients for moment identifier %@", buf, 0xCu);
      }

    }
    if (*((_QWORD *)v48 + 5))
    {
      PLPhotoKitGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = *((_QWORD *)v48 + 5);
        *(_DWORD *)buf = 138412546;
        v54 = (dispatch_time_t)v22;
        v55 = 2112;
        v56 = v29;
        _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_ERROR, "Can't request suggested recipients for moment identifier %@: %@", buf, 0x16u);
      }

    }
    v30 = (id)v42[5];

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(v47, 8);

    goto LABEL_25;
  }
  if (v11)
  {
    v19 = 0;
    v13 = v11;
    goto LABEL_11;
  }
  PLPhotoKitGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v47 = 0;
    _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, "Can't suggest recipients without valid input collection.", v47, 2u);
  }
  v30 = 0;
LABEL_25:

  return v30;
}

+ (id)momentCountsByPersonUUIDForPersonsWithUUIDs:(id)a3 afterDate:(id)a4 photoLibrary:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v27 = a4;
  v7 = a5;
  v8 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D716C8], "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setResultType:", 2);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K IN %@"), CFSTR("personForFace"), CFSTR("personUUID"), v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K.%K > %@"), CFSTR("assetForFace"), CFSTR("moment"), CFSTR("startDate"), v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  v41[0] = v26;
  v41[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v13);

  v14 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v14, "setName:", CFSTR("personUUID"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("%K.%K"), CFSTR("personForFace"), CFSTR("personUUID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setExpression:", v15);

  objc_msgSend(v14, "setExpressionResultType:", 700);
  v16 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v16, "setName:", CFSTR("momentUUID"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("%K.%K.uuid"), CFSTR("assetForFace"), CFSTR("moment"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setExpression:", v17);

  objc_msgSend(v16, "setExpressionResultType:", 700);
  v40[0] = v14;
  v40[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToGroupBy:", v18);

  v39[0] = v14;
  v39[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToFetch:", v19);

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__23874;
  v37 = __Block_byref_object_dispose__23875;
  v38 = 0;
  objc_msgSend(v7, "photoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __79__PHPerson_momentCountsByPersonUUIDForPersonsWithUUIDs_afterDate_photoLibrary___block_invoke;
  v29[3] = &unk_1E35DEE50;
  v21 = v7;
  v30 = v21;
  v22 = v10;
  v31 = v22;
  v32 = &v33;
  objc_msgSend(v20, "performBlockAndWait:", v29);

  v23 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v23;
}

+ (id)fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__23874;
  v22 = __Block_byref_object_dispose__23875;
  v23 = 0;
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D71940];
    objc_msgSend(v7, "internalPredicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "includedDetectionTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContextForCurrentQueueQoS");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__PHPerson_fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs_options___block_invoke;
    v17[3] = &unk_1E35DB0C0;
    v17[4] = &v18;
    objc_msgSend(v9, "batchFetchPersonUUIDsByAssetUUIDWithAssetUUIDs:predicate:includedDetectionTypes:inManagedObjectContext:completion:", v6, v10, v11, v12, v17);

    v13 = (id)v19[5];
  }
  else
  {
    PLPhotoKitGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v15;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "No photo library in %@", buf, 0xCu);

    }
    v13 = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v13;
}

+ (id)fetchVerifiedPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K != %d) && (%K >= 1)"), CFSTR("personForFace.verifiedType"), 0, CFSTR("personForFace.faceCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "internalPredicate");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = (void *)MEMORY[0x1E0CB3528];
      v16[0] = v8;
      v16[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = v8;
    }
    objc_msgSend(v7, "setInternalPredicate:", v13);
    objc_msgSend(a1, "fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:options:", v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v14;
}

+ (id)fetchPersonsGroupedByAssetLocalIdentifierForAssets:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__23874;
  v41 = __Block_byref_object_dispose__23875;
  v42 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v11)
  {
    v28 = a1;
    v12 = 0;
    v13 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v15, "uuid", v28);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v16);

        if (!v12)
          v12 = v15;
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v11);

    if (v12)
    {
      if (v8)
      {
        +[PHQuery queryForPersonsWithOptions:](PHQuery, "queryForPersonsWithOptions:", v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fetchRequest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = 0;
      }
      +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v8, v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0D71940];
      objc_msgSend(v18, "predicate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "includedDetectionTypes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "photoLibrary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __71__PHPerson_fetchPersonsGroupedByAssetLocalIdentifierForAssets_options___block_invoke;
      v29[3] = &unk_1E35DB110;
      v31 = &v37;
      v26 = v21;
      v30 = v26;
      v32 = v28;
      objc_msgSend(v22, "batchFetchPersonsByAssetUUIDWithAssetUUIDs:predicate:includedDetectionTypes:library:completion:", v9, v23, v24, v25, v29);

      v20 = (id)v38[5];
      goto LABEL_19;
    }
  }
  else
  {

  }
  PLPhotoKitGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v44 = v19;
    _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "Cannot run without assets %@", buf, 0xCu);

  }
  v20 = (id)MEMORY[0x1E0C9AA70];
LABEL_19:

  _Block_object_dispose(&v37, 8);
  return v20;
}

+ (id)fetchPersonCountGroupedByAssetLocalIdentifierForAssets:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v34;
  _QWORD v35[4];
  NSObject *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v15, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        if (!v12)
          v12 = v15;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v11);

    if (v12)
    {
      if (v7)
      {
        +[PHQuery queryForPersonsWithOptions:](PHQuery, "queryForPersonsWithOptions:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fetchRequest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = 0;
      }
      +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v7, v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "photoLibrary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0D71940];
      v34 = v18;
      objc_msgSend(v18, "predicate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "includedDetectionTypes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      objc_msgSend(v24, "fetchPersonCountByAssetUUIDForAssetUUIDs:predicate:includedDetectionTypes:library:error:", v8, v25, v26, v23, &v37);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v37;

      if (v27)
      {
        v29 = v28;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __75__PHPerson_fetchPersonCountGroupedByAssetLocalIdentifierForAssets_options___block_invoke;
        v35[3] = &unk_1E35DB138;
        v31 = v30;
        v36 = v31;
        objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v35);
        v32 = v36;
      }
      else
      {
        PLPhotoKitGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v28;
          v43 = v28;
          _os_log_impl(&dword_1991EC000, v32, OS_LOG_TYPE_ERROR, "Error fetching person counts by asset: %@", buf, 0xCu);
        }
        else
        {
          v29 = v28;
        }
        v31 = 0;
      }

      v19 = v31;
      v21 = v19;
      goto LABEL_25;
    }
  }
  else
  {

  }
  PLPhotoKitGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v20;
    _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Cannot run without assets %@", buf, 0xCu);

  }
  v21 = MEMORY[0x1E0C9AA70];
LABEL_25:

  return v21;
}

+ (id)personToKeepForCloudConsistencyFromPersons:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (v6)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "uuid");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "uuid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "compare:", v11);

          if (v12 != -1)
            continue;
        }
        v13 = v9;

        v6 = v13;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)fullNameFromContact:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D71940], "fullNameFromContact:", a3);
}

+ (id)displayNameFromContact:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D71940], "displayNameFromContact:", a3);
}

+ (id)fetchPersonsForContacts:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "identifier", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  objc_msgSend(a1, "fetchPersonsForContactIdentifiers:options:", v8, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)fetchPersonsForContactIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__PHPerson_fetchPersonsForContactIdentifiers_options___block_invoke;
  v11[3] = &unk_1E35DECB8;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)batchFetchRelationshipInferencesForPersons:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  NSObject *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "localIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v4, "addObject:", v12);
        if (!v8)
        {
          objc_msgSend(v11, "photoLibrary");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            objc_msgSend(v11, "photoLibrary");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  if (!objc_msgSend(v4, "count"))
  {
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "[Person Knowledge] personLocalIdentifiers.count == 0, not requesting contact inferences";
LABEL_25:
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
    }
LABEL_26:
    v14 = 0;
    goto LABEL_27;
  }
  if (!v8)
  {
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "[Person Knowledge] No photo library found for persons";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  objc_msgSend(v8, "photoAnalysisClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v13, "requestRelationshipInferencesForPersonLocalIdentifiers:error:", v4, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;

  if (v15)
  {
    PLPhotoKitGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v15;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "[Person Knowledge] Error requesting relationship inferences for persons: %@", buf, 0xCu);
    }

  }
LABEL_27:

  return v14;
}

+ (id)batchFetchContactInferencesForPersons:(id)a3 queryOptions:(unint64_t)a4
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)fetchSuggestedPersonsForClient:(unint64_t)a3 options:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a4;
  if (a3 - 4 >= 2)
  {
    if (a3 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(a1, "_fetchSuggestedPersonsForClient:options:", 1, v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_requestSuggestedPersonsForClient:options:", a3, v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:

  return v8;
}

+ (id)_requestSuggestedPersonsForClient:(unint64_t)a3 options:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHPerson.m"), 1244, CFSTR("Caller need to set a PHPhotoLibrary on options."));

  }
  v21 = CFSTR("PHPeopleSuggestionClientKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "photoAnalysisClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v11, "requestSuggestedPersonsWithOptions:error:", v10, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;

  if (v12)
  {
    objc_msgSend(a1, "_fetchSuggestedPersonsForRecipients:options:photoLibrary:", v12, v7, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Error requesting suggested persons for client: %@", buf, 0xCu);
    }

    v14 = 0;
  }

  return v14;
}

+ (id)_fetchSuggestedPersonsForClient:(unint64_t)a3 options:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  uint64_t v47;
  _BYTE v48[128];
  _QWORD v49[2];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHPerson.m"), 1267, CFSTR("Caller need to set a PHPhotoLibrary on options."));

  }
  v9 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v9, "setPersonContext:", 1);
  objc_msgSend(v9, "setShouldPrefetchCount:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("suggestedForClientType == %d || type == %d"), a3, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInternalPredicate:", v10);

  +[PHPerson fetchPersonsWithOptions:](PHPerson, "fetchPersonsWithOptions:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "count") < 0x14)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v12 = v11;
    v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v43 != v17)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "localIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v19);

        }
        v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v16);
    }

    v37 = v8;
    objc_msgSend(v8, "librarySpecificFetchOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPersonContext:", 1);
    objc_msgSend(v20, "setShouldPrefetchCount:", 1);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("faceCount"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v21;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSortDescriptors:", v23);

    +[PHPerson fetchPersonsWithOptions:](PHPerson, "fetchPersonsWithOptions:", v20);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v39;
LABEL_14:
      v28 = 0;
      while (1)
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v28), "localIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v29);

        if ((unint64_t)objc_msgSend(v14, "count") > 0x13)
          break;
        if (v26 == ++v28)
        {
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
          if (v26)
            goto LABEL_14;
          break;
        }
      }
    }

    v8 = v37;
    if (objc_msgSend(v14, "count") || (v32 = objc_msgSend(v37, "countOfUnclusteredFaces")) == 0)
    {
      objc_msgSend(v14, "allObjects");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHPerson fetchPersonsWithLocalIdentifiers:options:](PHPerson, "fetchPersonsWithLocalIdentifiers:options:", v30, v7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v31;
      v13 = v12;
    }
    else
    {
      v33 = v32;
      PLPhotoKitGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v47 = v33;
        _os_log_impl(&dword_1991EC000, v34, OS_LOG_TYPE_DEFAULT, "No persons returned in people home, returning nil fetch result as the library is not analyzed yet; countOfUncl"
          "usteredFaces: %lu",
          buf,
          0xCu);
      }

      v13 = 0;
    }

  }
  else
  {
    v12 = v11;
    v13 = v12;
  }

  return v13;
}

+ (id)fetchPersonsWithUserFeedbackWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_214);
}

+ (id)fetchPersonsWithAutonamingSuggestionFeatureUserFeedbackWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_216);
}

+ (id)fetchPersonsWithUserFeedbackOfAllTypesWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_221);
}

+ (Class)propertySetClassForPropertySet:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = propertySetClassForPropertySet__onceToken_24017;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&propertySetClassForPropertySet__onceToken_24017, &__block_literal_global_228);
  objc_msgSend((id)propertySetClassForPropertySet__propertySetClassByPropertySetName_24018, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

+ (id)propertySetAccessorsByPropertySet
{
  if (propertySetAccessorsByPropertySet_onceToken_24011 != -1)
    dispatch_once(&propertySetAccessorsByPropertySet_onceToken_24011, &__block_literal_global_229);
  return (id)propertySetAccessorsByPropertySet_accessorByPropertySetName_24012;
}

+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (objc_msgSend(CFSTR("PHPersonPropertySetIdentifier"), "length"))
    v4 = objc_msgSend(v3, "containsObject:", CFSTR("PHPersonPropertySetIdentifier"));
  else
    v4 = 0;
  if (objc_msgSend(CFSTR("PHPersonPropertySetCore"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHPersonPropertySetCore")))
  {
    v4 |= 2uLL;
  }
  if (objc_msgSend(CFSTR("PHPersonPropertySetUserFeedback"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHPersonPropertySetUserFeedback")))
  {
    v4 |= 4uLL;
  }
  if (!objc_msgSend(v3, "containsObject:", CFSTR("PHPersonPropertySetIdentifier")))
    v4 |= 2uLL;

  return v4;
}

+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3
{
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("PHPersonPropertySetIdentifier"), "length");
  if ((v3 & 1) != 0 && v5)
    objc_msgSend(v4, "addObject:", CFSTR("PHPersonPropertySetIdentifier"));
  v6 = objc_msgSend(CFSTR("PHPersonPropertySetCore"), "length");
  if ((v3 & 2) != 0 && v6)
    objc_msgSend(v4, "addObject:", CFSTR("PHPersonPropertySetCore"));
  v7 = objc_msgSend(CFSTR("PHPersonPropertySetUserFeedback"), "length");
  if ((v3 & 4) != 0 && v7)
    objc_msgSend(v4, "addObject:", CFSTR("PHPersonPropertySetUserFeedback"));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __45__PHPerson_propertySetAccessorsByPropertySet__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PHPersonPropertySetIdentifier");
  v2[1] = CFSTR("PHPersonPropertySetCore");
  v3[0] = CFSTR("self");
  v3[1] = CFSTR("self");
  v2[2] = CFSTR("PHPersonPropertySetUserFeedback");
  v3[2] = CFSTR("userFeedbackProperties");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertySetAccessorsByPropertySet_accessorByPropertySetName_24012;
  propertySetAccessorsByPropertySet_accessorByPropertySetName_24012 = v0;

}

void __43__PHPerson_propertySetClassForPropertySet___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PHPersonPropertySetIdentifier");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("PHPersonPropertySetCore");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("PHPersonPropertySetUserFeedback");
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertySetClassForPropertySet__propertySetClassByPropertySetName_24018;
  propertySetClassForPropertySet__propertySetClassByPropertySetName_24018 = v0;

}

id __62__PHPerson_fetchPersonsWithUserFeedbackOfAllTypesWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "setIsExclusivePredicate:", 1);
  +[PHQuery queryForPersonsWithNonNilUserFeedbackWithTypes:options:](PHQuery, "queryForPersonsWithNonNilUserFeedbackWithTypes:options:", &unk_1E36573D8, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "executeQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __79__PHPerson_fetchPersonsWithAutonamingSuggestionFeatureUserFeedbackWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "setIsExclusivePredicate:", 1);
  +[PHQuery queryForPersonsWithNonNilUserFeedbackWithTypes:options:](PHQuery, "queryForPersonsWithNonNilUserFeedbackWithTypes:options:", &unk_1E36573C0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "executeQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __52__PHPerson_fetchPersonsWithUserFeedbackWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "setIsExclusivePredicate:", 1);
  +[PHQuery queryForPersonsWithNonNilUserFeedbackWithTypes:options:](PHQuery, "queryForPersonsWithNonNilUserFeedbackWithTypes:options:", &unk_1E36573A8, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "executeQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __54__PHPerson_fetchPersonsForContactIdentifiers_options___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  +[PHQuery queryForPersonsWithContactIdentifiers:options:](PHQuery, "queryForPersonsWithContactIdentifiers:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "executeQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __75__PHPerson_fetchPersonCountGroupedByAssetLocalIdentifierForAssets_options___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  +[PHObject localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v6);

}

void __71__PHPerson_fetchPersonsGroupedByAssetLocalIdentifierForAssets_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__PHPerson_fetchPersonsGroupedByAssetLocalIdentifierForAssets_options___block_invoke_2;
    v11[3] = &unk_1E35DB0E8;
    v12 = *(id *)(a1 + 32);
    v13 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  else
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "Error batch fetching person groups by asset: %@", buf, 0xCu);
    }

  }
}

void __71__PHPerson_fetchPersonsGroupedByAssetLocalIdentifierForAssets_options___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PHPersonPLAdapter *v14;
  PHPersonPLAdapter *v15;
  void *v16;
  PHManualFetchResult *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[PHObject localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v14 = [PHPersonPLAdapter alloc];
        v15 = -[PHObjectPLAdapter initWithPLManagedObject:photoLibrary:](v14, "initWithPLManagedObject:photoLibrary:", v13, *(_QWORD *)(a1 + 32), (_QWORD)v18);
        v16 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithFetchDictionary:propertyHint:photoLibrary:", v15, 2, *(_QWORD *)(a1 + 32));
        objc_msgSend(v7, "addObject:", v16);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v17 = -[PHManualFetchResult initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:]([PHManualFetchResult alloc], "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v7, *(_QWORD *)(a1 + 32), CFSTR("PHPerson"), 0, 0, 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v17, v6);

}

void __68__PHPerson_fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  if (v6)
  {
    PLPhotoKitGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Error batch fetching person uuids groups by assets: %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

void __79__PHPerson_momentCountsByPersonUUIDForPersonsWithUUIDs_afterDate_photoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v37 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v37);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v37;

  if (v5)
  {
    v27 = v6;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v28 = v5;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("personUUID"), v27);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("momentUUID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
              -[NSObject addObject:](v10, "addObject:", v17);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v13);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[NSObject allObjects](v10, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
          v25 = -[NSObject countForObject:](v10, "countForObject:", v24, v27);
          if (v25)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v26, v24);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
      }
      while (v21);
    }

    v6 = v27;
    v5 = v28;
  }
  else
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v6;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "Error batch fetching moment counts by person uuids: %@", buf, 0xCu);
    }
  }

}

void __94__PHPerson__fetchSuggestedRecipientsForFocusedAssetCollection_assetCollection_options_client___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = *(_QWORD *)(a1[9] + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v2, "requestSuggestedRecipientsForAssetLocalIdentifiers:momentLocalIdentifiers:options:error:", v3, v4, v5, &obj);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = *(_QWORD *)(a1[8] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

uint64_t __69__PHPerson__fetchSuggestedPersonsForRecipients_options_photoLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v5 = a3;
  objc_msgSend(a2, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v6);
  v9 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v7);
  if (v8 < v9)
    v10 = -1;
  else
    v10 = v8 > v9;

  return v10;
}

void __69__PHPerson__fetchSuggestedPersonsForRecipients_options_photoLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __66__PHPerson_fetchFinalMergeTargetPersonsForPersonWithUUID_options___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  PHPersonPLAdapter *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = (void *)MEMORY[0x1E0D71940];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchFinalMergeTargetPersonForPersonWithUUID:context:predicate:", v3, v4, v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v6 = -[PHObjectPLAdapter initWithPLManagedObject:photoLibrary:]([PHPersonPLAdapter alloc], "initWithPLManagedObject:photoLibrary:", v11, *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "fetchPropertySetsAsSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(objc_alloc(*(Class *)(a1 + 72)), "initWithFetchDictionary:propertyHint:photoLibrary:", v6, +[PHPerson propertyFetchHintsForPropertySets:](PHPerson, "propertyFetchHintsForPropertySets:", v7), *(_QWORD *)(a1 + 56));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

void __89__PHPerson_fetchAssociatedPersonsGroupedByFaceGroupLocalIdentifierForFaceGroups_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  __int128 v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __89__PHPerson_fetchAssociatedPersonsGroupedByFaceGroupLocalIdentifierForFaceGroups_options___block_invoke_2;
    v11[3] = &unk_1E35DAFF8;
    v12 = *(id *)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    v14 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  else
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "Error batch fetching associated person by face group: %@", buf, 0xCu);
    }

  }
}

void __89__PHPerson_fetchAssociatedPersonsGroupedByFaceGroupLocalIdentifierForFaceGroups_options___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  PHPersonPLAdapter *v7;
  void *v8;
  void *v9;
  PHManualFetchResult *v10;
  void *v11;
  PHManualFetchResult *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[PHObject localIdentifierWithUUID:](PHFaceGroup, "localIdentifierWithUUID:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PHObjectPLAdapter initWithPLManagedObject:photoLibrary:]([PHPersonPLAdapter alloc], "initWithPLManagedObject:photoLibrary:", v5, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "fetchPropertySetsAsSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 56)), "initWithFetchDictionary:propertyHint:photoLibrary:", v7, +[PHPerson propertyFetchHintsForPropertySets:](PHPerson, "propertyFetchHintsForPropertySets:", v8), *(_QWORD *)(a1 + 32));
  v10 = [PHManualFetchResult alloc];
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PHManualFetchResult initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v10, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v11, *(_QWORD *)(a1 + 32), CFSTR("PHPerson"), v8, 0, 1);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v12, v6);
}

id __55__PHPerson_fetchPersonAssociatedWithFaceGroup_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssociatedPersonForFaceGroup:withOptions:](PHQuery, "queryForAssociatedPersonForFaceGroup:withOptions:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __46__PHPerson_fetchPersonsWithObjectIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForPersonsWithObjectIDs:options:](PHQuery, "queryForPersonsWithObjectIDs:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __42__PHPerson_fetchPersonsWithMdIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForPersonsWithMdIDs:options:](PHQuery, "queryForPersonsWithMdIDs:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __53__PHPerson_fetchPersonsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForPersonsWithLocalIdentifiers:options:](PHQuery, "queryForPersonsWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __49__PHPerson_fetchPersonsWithQuestionType_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForPersonsWithQuestionType:options:](PHQuery, "queryForPersonsWithQuestionType:options:", *(unsigned __int16 *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __41__PHPerson_fetchPersonsWithType_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForPersonsWithType:options:](PHQuery, "queryForPersonsWithType:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __36__PHPerson_fetchPersonsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForPersonsWithOptions:](PHQuery, "queryForPersonsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __37__PHPerson_fetchMePersonWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0D71940];
  v3 = a2;
  objc_msgSend(v2, "predicateForMePerson");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  +[PHQuery queryForPersonsWithOptions:](PHQuery, "queryForPersonsWithOptions:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "executeQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __48__PHPerson_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[15];

  v4[14] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("name");
  v4[1] = CFSTR("displayName");
  v4[2] = CFSTR("uuid");
  v4[3] = CFSTR("detectionType");
  v4[4] = CFSTR("type");
  v4[5] = CFSTR("manualOrder");
  v4[6] = CFSTR("mergeCandidateConfidence");
  v4[7] = CFSTR("personUri");
  v4[8] = CFSTR("inPersonNamingModel");
  v4[9] = CFSTR("faceCount");
  v4[10] = CFSTR("contactMatchingDictionary");
  v4[11] = CFSTR("persistedSuggestionForClient");
  v4[12] = CFSTR("keyFacePickSource");
  v4[13] = CFSTR("isMeConfidence");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 14);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_24120;
  transformValueExpression_forKeyPath___passThroughSet_24120 = v2;

}

void __24__PHPerson_entityKeyMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PHEntityKeyMap *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  _QWORD v46[21];
  _QWORD v47[23];

  v47[21] = *MEMORY[0x1E0C80C00];
  v19 = [PHEntityKeyMap alloc];
  v45 = CFSTR("uuid");
  v46[0] = CFSTR("personUUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v24;
  v46[1] = CFSTR("detectionType");
  v44 = CFSTR("detectionType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v23;
  v46[2] = CFSTR("fullName");
  v43 = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v22;
  v46[3] = CFSTR("displayName");
  v42 = CFSTR("displayName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v21;
  v46[4] = CFSTR("type");
  v41 = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v47[4] = v20;
  v46[5] = CFSTR("manualOrder");
  v40 = CFSTR("manualOrder");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v47[5] = v18;
  v46[6] = CFSTR("mergeCandidateConfidence");
  v39 = CFSTR("mergeCandidateConfidence");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47[6] = v17;
  v46[7] = CFSTR("personUri");
  v38 = CFSTR("personUri");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47[7] = v16;
  v46[8] = CFSTR("inPersonNamingModel");
  v37 = CFSTR("inPersonNamingModel");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47[8] = v15;
  v46[9] = CFSTR("faceCount");
  v36 = CFSTR("faceCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v47[9] = v14;
  v46[10] = CFSTR("verifiedType");
  v35 = CFSTR("verifiedType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v47[10] = v13;
  v46[11] = CFSTR("questionType");
  v34 = CFSTR("questionType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47[11] = v12;
  v46[12] = CFSTR("ageType");
  v33 = CFSTR("ageType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v47[12] = v0;
  v46[13] = CFSTR("genderType");
  v32 = CFSTR("genderType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v47[13] = v1;
  v46[14] = CFSTR("genderType");
  v31 = CFSTR("sexType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v47[14] = v2;
  v46[15] = CFSTR("contactMatchingDictionary");
  v30 = CFSTR("contactMatchingDictionary");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v47[15] = v3;
  v46[16] = CFSTR("suggestedForClientType");
  v29 = CFSTR("persistedSuggestionForClient");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47[16] = v4;
  v46[17] = CFSTR("mdID");
  v28 = CFSTR("mdID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47[17] = v5;
  v46[18] = CFSTR("assetSortOrder");
  v27 = CFSTR("assetSortOrder");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47[18] = v6;
  v46[19] = CFSTR("keyFacePickSource");
  v26 = CFSTR("keyFacePickSource");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47[19] = v7;
  v46[20] = CFSTR("isMeConfidence");
  v25 = CFSTR("isMeConfidence");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47[20] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v19, "initWithPropertyKeysByEntityKey:", v9);
  v11 = (void *)entityKeyMap_pl_once_object_1;
  entityKeyMap_pl_once_object_1 = v10;

}

void __33__PHPerson_corePropertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[21];

  v3[20] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D718A8], "objectIDDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  v3[1] = CFSTR("fullName");
  v3[2] = CFSTR("displayName");
  v3[3] = CFSTR("detectionType");
  v3[4] = CFSTR("type");
  v3[5] = CFSTR("manualOrder");
  v3[6] = CFSTR("mergeCandidateConfidence");
  v3[7] = CFSTR("personUri");
  v3[8] = CFSTR("inPersonNamingModel");
  v3[9] = CFSTR("faceCount");
  v3[10] = CFSTR("verifiedType");
  v3[11] = CFSTR("questionType");
  v3[12] = CFSTR("ageType");
  v3[13] = CFSTR("genderType");
  v3[14] = CFSTR("contactMatchingDictionary");
  v3[15] = CFSTR("suggestedForClientType");
  v3[16] = CFSTR("mdID");
  v3[17] = CFSTR("assetSortOrder");
  v3[18] = CFSTR("keyFacePickSource");
  v3[19] = CFSTR("isMeConfidence");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 20);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)corePropertiesToFetch_array_24129;
  corePropertiesToFetch_array_24129 = v1;

}

void __39__PHPerson_identifierPropertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D718A8], "objectIDDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  v3[1] = CFSTR("personUUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)identifierPropertiesToFetch_array;
  identifierPropertiesToFetch_array = v1;

}

void __38__PHPerson_propertiesToFetchWithHint___block_invoke_108(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_24134;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "_composePropertiesToFetchWithHint:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_24134;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, v11);

  }
}

void __38__PHPerson_propertiesToFetchWithHint___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_24134;
  propertiesToFetchWithHint__propertiesToFetchByHint_24134 = v0;

  v2 = dispatch_queue_create("com.apple.photos.personpropertyhints", 0);
  v3 = (void *)propertiesToFetchWithHint__propertyQueue_24133;
  propertiesToFetchWithHint__propertyQueue_24133 = (uint64_t)v2;

}

- (id)objectReference
{
  return +[PHObjectReference referenceForObject:](PHPersonReference, "referenceForObject:", self);
}

+ (id)fetchPersonsForReferences:(id)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  PHLocalIdentifierForObjectReferencesAndLibrary((uint64_t)a3, (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPersonContext:", 5);
  +[PHPerson fetchPersonsWithLocalIdentifiers:options:](PHPerson, "fetchPersonsWithLocalIdentifiers:options:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)personSuggestionsForPerson:(id)a3 confirmedPersonSuggestions:(id)a4 rejectedPersonSuggestions:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_block_t v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__40923;
  v22 = __Block_byref_object_dispose__40924;
  v23 = (id)MEMORY[0x1E0C9AA60];
  v11 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_40925);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __107__PHPerson_VisionService__personSuggestionsForPerson_confirmedPersonSuggestions_rejectedPersonSuggestions___block_invoke_2;
  v15[3] = &unk_1E35DEEE8;
  v17 = &v18;
  v12 = v11;
  v16 = v12;
  objc_msgSend(a1, "personSuggestionsForPerson:confirmedPersonSuggestions:rejectedPersonSuggestions:completion:", v8, v9, v10, v15);
  dispatch_block_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  v13 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v13;
}

+ (int64_t)personSuggestionsForPerson:(id)a3 confirmedPersonSuggestions:(id)a4 rejectedPersonSuggestions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int64_t v16;
  _QWORD v18[4];
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photoAnalysisClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __118__PHPerson_VisionService__personSuggestionsForPerson_confirmedPersonSuggestions_rejectedPersonSuggestions_completion___block_invoke;
    v18[3] = &unk_1E35DEF10;
    v19 = v13;
    v16 = objc_msgSend(a1, "_personSuggestionsForPerson:confirmedPersonSuggestions:rejectedPersonSuggestions:fromClient:completion:", v10, v11, v12, v15, v18);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (int64_t)_personSuggestionsForPerson:(id)a3 confirmedPersonSuggestions:(id)a4 rejectedPersonSuggestions:(id)a5 fromClient:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  int64_t v31;
  void *v33;
  id v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v36 = a6;
  v34 = a7;
  objc_msgSend(v12, "localIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoLibrary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v16 = v13;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v46;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v46 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(a1, "_personSuggestionMarkedAsConfirmed:fromPersonSuggestion:", 1, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v20));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v15, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v18);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v23 = v14;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v42;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v42 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(a1, "_personSuggestionMarkedAsConfirmed:fromPersonSuggestion:", 0, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v27));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
          objc_msgSend(v22, "addObject:", v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v25);
  }

  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __130__PHPerson_VisionService___personSuggestionsForPerson_confirmedPersonSuggestions_rejectedPersonSuggestions_fromClient_completion___block_invoke;
  v37[3] = &unk_1E35DEF38;
  v38 = v33;
  v39 = v34;
  v40 = a1;
  v29 = v34;
  v30 = v33;
  v31 = objc_msgSend(v36, "suggestedPersonsForPersonWithLocalIdentifier:toBeConfirmedPersonSuggestions:toBeRejectedPersonSuggestions:completion:", v35, v15, v22, v37);

  return v31;
}

+ (id)_personSuggestionMarkedAsConfirmed:(BOOL)a3 fromPersonSuggestion:(id)a4
{
  _BOOL8 v4;
  id v5;
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
  void *v20;
  _QWORD v21[6];
  _QWORD v22[7];

  v4 = a3;
  v22[6] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    v6 = (void *)MEMORY[0x19AEBEADC]();
    objc_msgSend(v5, "keyFace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "localIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "person");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "localIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = CFSTR("faceCSN");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "clusterSequenceNumber"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v12;
        v22[1] = v9;
        v21[1] = CFSTR("faceIdentifier");
        v21[2] = CFSTR("personIdentifier");
        v22[2] = v20;
        v21[3] = CFSTR("personFaceCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "faceCount"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v22[3] = v13;
        v21[4] = CFSTR("confirmed");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22[4] = v14;
        v21[5] = CFSTR("similarityScore");
        v15 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "similarityScore");
        objc_msgSend(v15, "numberWithDouble:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22[5] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71958]), "initWithSuggestionDictionary:", v17);
      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)_packageSuggestionList:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(a1, "_convertToPersonSuggestion:photoLibrary:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

+ (id)_convertToPersonSuggestion:(id)a3 photoLibrary:(id)a4
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
  PHPersonSuggestion *v19;
  PHPersonSuggestion *v20;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMinimumUnverifiedFaceCount:", 1);
  v24[0] = CFSTR("PHPersonPropertySetUserFeedback");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchPropertySets:", v8);

  objc_msgSend(v5, "personLocalIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHPerson fetchPersonsWithLocalIdentifiers:options:](PHPerson, "fetchPersonsWithLocalIdentifiers:options:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v5, "keyFaceLocalIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFace fetchFacesWithLocalIdentifiers:options:](PHFace, "fetchFacesWithLocalIdentifiers:options:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = objc_msgSend(v5, "confirmed");
      v19 = [PHPersonSuggestion alloc];
      objc_msgSend(v5, "similarityScore");
      v20 = -[PHPersonSuggestion initWithKeyFace:person:confirmed:similarityScore:](v19, "initWithKeyFace:person:confirmed:similarityScore:", v17, v12, v18);
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (int64_t)updateKeyFacesOfPersons:(id)a3 forceUpdate:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int64_t v19;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoAnalysisClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v17), "localIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __74__PHPerson_VisionService__updateKeyFacesOfPersons_forceUpdate_completion___block_invoke;
    v21[3] = &unk_1E35DEF68;
    v22 = v8;
    v19 = objc_msgSend(v11, "updateKeyFacesOfPersonsWithLocalIdentifiers:forceUpdate:completion:", v12, v6, v21);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __74__PHPerson_VisionService__updateKeyFacesOfPersons_forceUpdate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __130__PHPerson_VisionService___personSuggestionsForPerson_confirmedPersonSuggestions_rejectedPersonSuggestions_fromClient_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v7 = 0;
  v8 = v6;
  if (a2 && !v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "_packageSuggestionList:photoLibrary:", a2, *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __118__PHPerson_VisionService__personSuggestionsForPerson_confirmedPersonSuggestions_rejectedPersonSuggestions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __107__PHPerson_VisionService__personSuggestionsForPerson_confirmedPersonSuggestions_rejectedPersonSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
