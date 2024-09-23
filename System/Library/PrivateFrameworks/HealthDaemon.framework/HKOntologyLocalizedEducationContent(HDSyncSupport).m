@implementation HKOntologyLocalizedEducationContent(HDSyncSupport)

- (HDCodableOntologyLocalizedEducationContent)codableRepresentationForSync
{
  HDCodableOntologyLocalizedEducationContent *v2;
  uint64_t v3;
  id v4;
  HDCodableOntologyLocalizedEducationContentSection *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  HDCodableSectionData *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  id obj;
  uint64_t v20;
  void *v21;
  HDCodableOntologyLocalizedEducationContent *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(HDCodableOntologyLocalizedEducationContent);
  -[HDCodableOntologyLocalizedEducationContent setVersion:](v2, "setVersion:", objc_msgSend(a1, "version"));
  objc_msgSend(a1, "timestamp");
  -[HDCodableOntologyLocalizedEducationContent setTimestamp:](v2, "setTimestamp:");
  v22 = v2;
  -[HDCodableOntologyLocalizedEducationContent setDeleted:](v2, "setDeleted:", objc_msgSend(a1, "isDeleted"));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v21 = a1;
  objc_msgSend(a1, "sections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v23)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v4 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * v3);
        if (v21)
        {
          v25 = v3;
          v5 = objc_alloc_init(HDCodableOntologyLocalizedEducationContentSection);
          -[HDCodableOntologyLocalizedEducationContentSection setSectionType:](v5, "setSectionType:", objc_msgSend(v4, "sectionType"));
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          v24 = v4;
          objc_msgSend(v4, "sectionData");
          v26 = (id)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
          if (v6)
          {
            v7 = v6;
            v8 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v7; ++i)
              {
                if (*(_QWORD *)v32 != v8)
                  objc_enumerationMutation(v26);
                v10 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * i);
                v11 = objc_alloc_init(HDCodableSectionData);
                v35 = 0u;
                v36 = 0u;
                v37 = 0u;
                v38 = 0u;
                objc_msgSend(v10, "stringValues");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
                if (v13)
                {
                  v14 = v13;
                  v15 = *(_QWORD *)v36;
                  do
                  {
                    for (j = 0; j != v14; ++j)
                    {
                      if (*(_QWORD *)v36 != v15)
                        objc_enumerationMutation(v12);
                      -[HDCodableSectionData addStringValues:](v11, "addStringValues:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
                    }
                    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
                  }
                  while (v14);
                }

                -[HDCodableSectionData setSectionDataType:](v11, "setSectionDataType:", objc_msgSend(v10, "sectionDataType"));
                -[HDCodableSectionData setVersion:](v11, "setVersion:", objc_msgSend(v10, "version"));
                objc_msgSend(v10, "timestamp");
                -[HDCodableSectionData setTimestamp:](v11, "setTimestamp:");
                -[HDCodableSectionData setDeleted:](v11, "setDeleted:", objc_msgSend(v10, "deleted"));

                -[HDCodableOntologyLocalizedEducationContentSection addSectionData:](v5, "addSectionData:", v11);
              }
              v7 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
            }
            while (v7);
          }

          v4 = v24;
          v3 = v25;
        }
        else
        {
          v5 = 0;
        }

        -[HDCodableOntologyLocalizedEducationContent addSections:](v22, "addSections:", v5);
        ++v3;
      }
      while (v3 != v23);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      v23 = v17;
    }
    while (v17);
  }

  return v22;
}

+ (id)createWithCodable:()HDSyncSupport
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  _QWORD v13[5];

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v4, "sections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__HKOntologyLocalizedEducationContent_HDSyncSupport__createWithCodable___block_invoke;
    v13[3] = &__block_descriptor_40_e59__16__0__HDCodableOntologyLocalizedEducationContentSection_8l;
    v13[4] = a1;
    objc_msgSend(v5, "hk_map:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x1E0CB69A0]);
    if (v6)
      v8 = v6;
    else
      v8 = (void *)MEMORY[0x1E0C9AA60];
    v9 = objc_msgSend(v4, "version");
    objc_msgSend(v4, "timestamp");
    v11 = (void *)objc_msgSend(v7, "initWithSections:version:timestamp:deleted:", v8, v9, objc_msgSend(v4, "deleted"), v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
