@implementation HKUserDomainConcept(HDSyncSupport)

+ (id)createWithCodableConcept:()HDSyncSupport profile:
{
  id v6;
  id v7;
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
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v55;
  _BYTE buf[24];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
  {
    v8 = (void *)MEMORY[0x1E0CB6D48];
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createWithCodable:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "daemon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userDomainConceptEntityRegistry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "userDomainConceptEntityClassForTypeIdentifier:", v10);

    if (!v13)
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "%@: No UDC entity class for typeIdentifier '%@', ingoring sync codable", buf, 0x16u);
      }
      v14 = 0;
      goto LABEL_34;
    }
    v14 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v13, "userDomainConceptClass")), "_initBareObject");
    v15 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v6, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hk_UUIDWithData:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setUUID:", v17);

    objc_msgSend(v14, "_setIdentifier:", v10);
    objc_msgSend(v14, "_setDeleted:", objc_msgSend(v6, "deleted"));
    objc_msgSend(v6, "creationDate");
    objc_msgSend(v14, "_setCreationTimestamp:");
    objc_msgSend(v6, "modificationDate");
    objc_msgSend(v14, "_setModificationTimestamp:");
    *(_QWORD *)buf = (int)objc_msgSend(v6, "majorVersion");
    *(_QWORD *)&buf[8] = (int)objc_msgSend(v6, "minorVersion");
    *(_QWORD *)&buf[16] = (int)objc_msgSend(v6, "patchVersion");
    objc_msgSend(v14, "_setOperatingSystemVersion:", buf);
    objc_msgSend(v6, "build");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setBuild:", v18);

    objc_msgSend(v6, "linksData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)MEMORY[0x1E0CB3710];
      v21 = objc_opt_class();
      objc_msgSend(v6, "linksData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0;
      objc_msgSend(v20, "unarchivedObjectOfClass:fromData:error:", v21, v22, &v55);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v55;

      if (v23)
      {
        objc_msgSend(v14, "_setLinkCollection:", v23);
      }
      else
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v24;
          _os_log_fault_impl(&dword_1B7802000, v26, OS_LOG_TYPE_FAULT, "%{public}@: Unable to unarchive link collection data: %{public}@", buf, 0x16u);
        }

      }
    }
    objc_msgSend(v14, "linkCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      objc_msgSend(v6, "links");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
LABEL_20:
        objc_msgSend(v6, "codings");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend(v6, "codings");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "hk_map:", &__block_literal_global_190_1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6830]), "initWithCodings:", v36);
          objc_msgSend(v14, "_setCodingCollection:", v37);

        }
        v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v6, "properties");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          objc_msgSend(v6, "properties");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "hk_map:", &__block_literal_global_195_1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject addObjectsFromArray:](v25, "addObjectsFromArray:", v40);
        }
        objc_msgSend(v6, "localizedStringProperties");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          objc_msgSend(v6, "localizedStringProperties");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "hk_map:", &__block_literal_global_198_1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject addObjectsFromArray:](v25, "addObjectsFromArray:", v43);
        }
        objc_msgSend(v6, "ontologyLocalizedEducationContent");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          v45 = (void *)MEMORY[0x1E0CB69A0];
          objc_msgSend(v6, "ontologyLocalizedEducationContent");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "createWithCodable:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject addObject:](v25, "addObject:", v47);
        }
        objc_msgSend(v6, "namedQuantities");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48)
        {
          objc_msgSend(v6, "namedQuantities");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "hk_map:", &__block_literal_global_202_2);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject addObjectsFromArray:](v25, "addObjectsFromArray:", v50);
        }
        objc_msgSend(v6, "typeData");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          objc_msgSend(v6, "typeData");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "applyCodableSubclassData:mutableUserDomainConceptProperties:", v52, v25);

        }
        if (-[NSObject count](v25, "count"))
        {
          v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D20]), "initWithProperties:", v25);
          objc_msgSend(v14, "_setPropertyCollection:", v53);

        }
LABEL_34:

        goto LABEL_35;
      }
      _HKInitializeLogging();
      HKLogHealthOntology();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "linksData");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        HKStringFromBool();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v31;
        _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEFAULT, "XXX received link collection data is nil %@", buf, 0xCu);

      }
      objc_msgSend(v6, "links");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "hk_map:", &__block_literal_global_168);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D00]), "_initWithLinks:", v27);
      objc_msgSend(v14, "_setLinkCollection:", v33);

    }
    goto LABEL_20;
  }
  v14 = 0;
LABEL_35:

  return v14;
}

- (HDCodableUserDomainConcept)codableRepresentationForSyncWithProfile:()HDSyncSupport
{
  HDCodableUserDomainConcept *v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v4 = objc_alloc_init(HDCodableUserDomainConcept);
  objc_msgSend(a1, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_dataForUUIDBytes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConcept setUuid:](v4, "setUuid:", v6);

  objc_msgSend(a1, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "codableRepresentationForSync");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConcept setIdentifier:](v4, "setIdentifier:", v8);

  -[HDCodableUserDomainConcept setDeleted:](v4, "setDeleted:", objc_msgSend(a1, "isDeleted"));
  objc_msgSend(a1, "creationTimestamp");
  -[HDCodableUserDomainConcept setCreationDate:](v4, "setCreationDate:");
  objc_msgSend(a1, "modificationTimestamp");
  -[HDCodableUserDomainConcept setModificationDate:](v4, "setModificationDate:");
  objc_msgSend(a1, "operatingSystemVersion");
  -[HDCodableUserDomainConcept setMajorVersion:](v4, "setMajorVersion:", v55);
  objc_msgSend(a1, "operatingSystemVersion");
  -[HDCodableUserDomainConcept setMinorVersion:](v4, "setMinorVersion:", v54);
  objc_msgSend(a1, "operatingSystemVersion");
  -[HDCodableUserDomainConcept setPatchVersion:](v4, "setPatchVersion:", v53);
  objc_msgSend(a1, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConcept setBuild:](v4, "setBuild:", v9);

  objc_msgSend(a1, "linkCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend(a1, "linkCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableUserDomainConcept setLinksData:](v4, "setLinksData:", v13);

  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(a1, "linkCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v50 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "codableRepresentationForSync");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableUserDomainConcept addLinks:](v4, "addLinks:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v16);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(a1, "codingCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v46 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "codableRepresentationForSync");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableUserDomainConcept addCodings:](v4, "addCodings:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v22);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = a1;
  objc_msgSend(a1, "propertyCollection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v56, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v42 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v31, "codableRepresentationForSync");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCodableUserDomainConcept addProperties:](v4, "addProperties:", v32);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v31, "codableRepresentationForSync");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableUserDomainConcept addLocalizedStringProperties:](v4, "addLocalizedStringProperties:", v32);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v31, "codableRepresentationForSync");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[HDCodableUserDomainConcept setOntologyLocalizedEducationContent:](v4, "setOntologyLocalizedEducationContent:", v32);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              objc_msgSend(v31, "codableRepresentationForSync");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[HDCodableUserDomainConcept addNamedQuantities:](v4, "addNamedQuantities:", v32);
            }
          }
        }

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v56, 16);
    }
    while (v28);
  }

  objc_msgSend(v40, "syncIdentityManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "currentSyncIdentity");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "identity");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "codableSyncIdentity");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConcept setSyncIdentity:](v4, "setSyncIdentity:", v36);

  if ((objc_msgSend(v39, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(v39, "codableSubclassData");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableUserDomainConcept setTypeData:](v4, "setTypeData:", v37);

  }
  return v4;
}

- (uint64_t)applyCodableSubclassData:()HDSyncSupport mutableUserDomainConceptProperties:
{
  objc_opt_class();
  return NSRequestConcreteImplementation();
}

- (uint64_t)codableSubclassData
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
