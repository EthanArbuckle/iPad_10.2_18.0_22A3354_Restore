@implementation KMMapper_SASyncSiriKitAppVocabulary

- (KMMapper_SASyncSiriKitAppVocabulary)init
{
  KMMapper_SASyncSiriKitAppVocabulary *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *ontologyNodeToFieldTypeMap;
  KVItemBuilder *v14;
  KVItemBuilder *builder;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[18];
  _QWORD v28[20];

  v28[18] = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)KMMapper_SASyncSiriKitAppVocabulary;
  v2 = -[KMMapper_SASyncSiriKitAppVocabulary init](&v26, sel_init);
  if (v2)
  {
    v27[0] = CFSTR("personFullName");
    KVFieldTypeToNumber();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v25;
    v27[1] = CFSTR("smsGroupName");
    KVFieldTypeToNumber();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v24;
    v27[2] = CFSTR("photoTags");
    KVFieldTypeToNumber();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v23;
    v27[3] = CFSTR("photoAlbumName");
    KVFieldTypeToNumber();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v22;
    v27[4] = CFSTR("healthActivity");
    KVFieldTypeToNumber();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[4] = v21;
    v27[5] = CFSTR("carProfileName");
    KVFieldTypeToNumber();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[5] = v20;
    v27[6] = CFSTR("carName");
    KVFieldTypeToNumber();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[6] = v19;
    v27[7] = CFSTR("paymentsOrganizationName");
    KVFieldTypeToNumber();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[7] = v18;
    v27[8] = CFSTR("paymentsAccountName");
    KVFieldTypeToNumber();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[8] = v17;
    v27[9] = CFSTR("notebookTitle");
    KVFieldTypeToNumber();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v28[9] = v3;
    v27[10] = CFSTR("notebookFolderTitle");
    KVFieldTypeToNumber();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v28[10] = v4;
    v27[11] = CFSTR("appPlaylistTitle");
    KVFieldTypeToNumber();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28[11] = v5;
    v27[12] = CFSTR("appMusicArtistName");
    KVFieldTypeToNumber();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28[12] = v6;
    v27[13] = CFSTR("appAudiobookTitle");
    KVFieldTypeToNumber();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28[13] = v7;
    v27[14] = CFSTR("appAudiobookAuthor");
    KVFieldTypeToNumber();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28[14] = v8;
    v27[15] = CFSTR("appShowTitle");
    KVFieldTypeToNumber();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28[15] = v9;
    v27[16] = CFSTR("voiceCommandName");
    KVFieldTypeToNumber();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[16] = v10;
    v27[17] = CFSTR("photoMemoryName");
    KVFieldTypeToNumber();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[17] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 18);
    v12 = objc_claimAutoreleasedReturnValue();
    ontologyNodeToFieldTypeMap = v2->_ontologyNodeToFieldTypeMap;
    v2->_ontologyNodeToFieldTypeMap = (NSDictionary *)v12;

    v14 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x24BE5E8E8]);
    builder = v2->_builder;
    v2->_builder = v14;

  }
  return v2;
}

- (int64_t)targetItemType
{
  return 1;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  KMMapper_SASyncSiriKitAppVocabulary *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t i;
  void *v21;
  void *v22;
  KVItemBuilder *builder;
  void *v24;
  id v25;
  KMMapper_SASyncSiriKitAppVocabulary *v26;
  KVItemBuilder *v27;
  void *v28;
  void *v29;
  void *v30;
  KVItemBuilder *v31;
  void *v32;
  void *v33;
  id v34;
  KVItemBuilder *v35;
  void *v36;
  id v37;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
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
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE82600]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_sa_mappedDictionaryWithBlock:", &__block_literal_global);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
  if (!v11)
    goto LABEL_24;
  v12 = v11;
  v49 = 0;
  v13 = *(_QWORD *)v61;
  v41 = v6;
  v42 = v10;
  v43 = v9;
  v39 = *(_QWORD *)v61;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v61 != v13)
        objc_enumerationMutation(v10);
      v45 = v14;
      v15 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v14);
      v16 = self;
      -[NSDictionary objectForKey:](self->_ontologyNodeToFieldTypeMap, "objectForKey:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = KVFieldTypeFromNumber();

      v50 = v18;
      if (!v18)
      {
        self = v16;
        goto LABEL_22;
      }
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      objc_msgSend(v9, "objectForKey:", v15);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      if (!v47)
      {
        self = v16;
        goto LABEL_21;
      }
      v40 = v12;
      v19 = 0;
      v48 = *(_QWORD *)v57;
      self = v16;
      while (2)
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v57 != v48)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u#%u"), (unsigned __int16)v50, v49 + i);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          builder = self->_builder;
          v55 = v19;
          -[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 1, v22, &v55);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v55;

          if (!v24)
          {
            v19 = v25;
            goto LABEL_27;
          }
          v26 = self;
          v27 = self->_builder;
          objc_msgSend(v21, "intentSlotValue");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v25;
          -[KVItemBuilder addFieldWithType:value:error:](v27, "addFieldWithType:value:error:", v50, v28, &v54);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v54;

          if (!v29)
          {

LABEL_27:
            v6 = v41;
LABEL_31:
            KMMapperSetBuilderError((uint64_t)a5, v19);

            v37 = 0;
            v9 = v43;
            goto LABEL_32;
          }
          v51 = v22;
          v30 = v7;
          v31 = v26->_builder;
          objc_msgSend(v21, "vocabularyIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v19;
          -[KVItemBuilder addFieldWithType:value:error:](v31, "addFieldWithType:value:error:", 20, v32, &v53);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v53;

          if (!v33)
          {
            v19 = v34;
            v6 = v41;
            v7 = v30;
LABEL_30:
            v22 = v51;
            goto LABEL_31;
          }
          v35 = v26->_builder;
          v52 = v34;
          -[KVItemBuilder buildItemWithError:](v35, "buildItemWithError:", &v52);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v52;

          v7 = v30;
          if (!v36)
          {
            v6 = v41;
            goto LABEL_30;
          }
          self = v26;
          objc_msgSend(v30, "addObject:", v36);

        }
        v49 = (v49 + i);
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
        if (v47)
          continue;
        break;
      }

      v6 = v41;
      v10 = v42;
      v9 = v43;
      v13 = v39;
      v12 = v40;
LABEL_21:

LABEL_22:
      v14 = v45 + 1;
    }
    while (v45 + 1 != v12);
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
  }
  while (v12);
LABEL_24:

  v37 = v7;
LABEL_32:

  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
  objc_storeStrong((id *)&self->_ontologyNodeToFieldTypeMap, 0);
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end
