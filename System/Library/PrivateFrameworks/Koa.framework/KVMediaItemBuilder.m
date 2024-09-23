@implementation KVMediaItemBuilder

- (KVMediaItemBuilder)init
{
  KVMediaItemBuilder *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  NSMutableArray *v5;
  NSMutableArray *fields;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KVMediaItemBuilder;
  v2 = -[KVMediaItemBuilder init](&v8, sel_init);
  if (v2)
  {
    if (qword_1ED114580 != -1)
      dispatch_once(&qword_1ED114580, &unk_1E6B7B4A0);
    v3 = objc_alloc_init(KVItemBuilder);
    builder = v2->_builder;
    v2->_builder = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    fields = v2->_fields;
    v2->_fields = v5;

  }
  return v2;
}

- (id)_buildMediaItemWithId:(id)a3 otherFields:(id)a4
{
  id v6;
  id v7;
  KVItemBuilder *builder;
  const char *v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t i;
  void *v22;
  void *v23;
  KVItemBuilder *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  NSObject *v32;
  const char *v33;
  void *v34;
  void *v35;
  KVItemBuilder *v36;
  const char *v37;
  uint64_t v38;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  builder = self->_builder;
  v53 = 0;
  objc_msgSend_setItemType_itemId_error_(builder, v9, 5, (uint64_t)v6, &v53);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v53;

  if (!v10)
  {
    v32 = qword_1ED114588;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v55 = "-[KVMediaItemBuilder _buildMediaItemWithId:otherFields:]";
      v56 = 2112;
      v57 = v6;
      v58 = 2112;
      v59 = v11;
      v33 = "%s Failed to set item type for media item: %@ error: %@";
LABEL_23:
      _os_log_error_impl(&dword_1B70E7000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x20u);
    }
LABEL_24:
    v35 = 0;
    goto LABEL_25;
  }
  v45 = v7;
  v46 = v6;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v12 = v7;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v49, (uint64_t)v62, 16);
  if (v14)
  {
    v18 = v14;
    v19 = *(_QWORD *)v50;
    v20 = v11;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v50 != v19)
          objc_enumerationMutation(v12);
        v22 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend_value(v22, v15, v16, v17, v45);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          v24 = self->_builder;
          v25 = objc_msgSend_fieldType(v22, v15, v16, v17);
          objc_msgSend_value(v22, v26, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v20;
          objc_msgSend_addFieldWithType_value_error_(v24, v30, v25, (uint64_t)v29, &v48);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v48;

          if (!v31)
          {
            v34 = (void *)qword_1ED114588;
            v6 = v46;
            if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
            {
              v40 = v34;
              objc_msgSend_value(v22, v41, v42, v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v55 = "-[KVMediaItemBuilder _buildMediaItemWithId:otherFields:]";
              v56 = 2112;
              v57 = v46;
              v58 = 2112;
              v59 = v44;
              v60 = 2112;
              v61 = v11;
              _os_log_error_impl(&dword_1B70E7000, v40, OS_LOG_TYPE_ERROR, "%s Failed to add field to media item: %@ field: %@ error: %@", buf, 0x2Au);

            }
            v35 = 0;
            v7 = v45;
            goto LABEL_25;
          }
          v20 = v11;
        }
      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v49, (uint64_t)v62, 16);
      if (v18)
        continue;
      break;
    }
  }
  else
  {
    v20 = v11;
  }

  v36 = self->_builder;
  v47 = v20;
  objc_msgSend_buildItemWithError_(v36, v37, (uint64_t)&v47, v38);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v47;

  if (!v35)
  {
    v32 = qword_1ED114588;
    v7 = v45;
    v6 = v46;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v55 = "-[KVMediaItemBuilder _buildMediaItemWithId:otherFields:]";
      v56 = 2112;
      v57 = v46;
      v58 = 2112;
      v59 = v11;
      v33 = "%s Failed to build media item: %@ error: %@";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  v7 = v45;
  v6 = v46;
LABEL_25:

  return v35;
}

- (id)albumArtistItemWithName:(id)a3 itemId:(id)a4
{
  id v6;
  id v7;
  KVFieldValue *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [KVFieldValue alloc];
  v10 = (void *)objc_msgSend_initWithFieldType_value_(v8, v9, 202, (uint64_t)v7);

  v16[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__buildMediaItemWithId_otherFields_(self, v13, (uint64_t)v6, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)songArtistItemWithName:(id)a3 itemId:(id)a4
{
  id v6;
  id v7;
  KVFieldValue *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [KVFieldValue alloc];
  v10 = (void *)objc_msgSend_initWithFieldType_value_(v8, v9, 226, (uint64_t)v7);

  v16[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__buildMediaItemWithId_otherFields_(self, v13, (uint64_t)v6, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)albumItemWithName:(id)a3 itemId:(id)a4 albumArtistId:(id)a5
{
  id v8;
  id v9;
  NSMutableArray *fields;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  KVFieldValue *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  NSMutableArray *v22;
  KVFieldValue *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;

  v8 = a4;
  v9 = a5;
  fields = self->_fields;
  v11 = a3;
  objc_msgSend_removeAllObjects(fields, v12, v13, v14);
  v15 = self->_fields;
  v16 = [KVFieldValue alloc];
  v18 = (void *)objc_msgSend_initWithFieldType_value_(v16, v17, 204, (uint64_t)v11);

  objc_msgSend_addObject_(v15, v19, (uint64_t)v18, v20);
  if (v9)
  {
    v22 = self->_fields;
    v23 = [KVFieldValue alloc];
    v25 = (void *)objc_msgSend_initWithFieldType_value_(v23, v24, 201, (uint64_t)v9);
    objc_msgSend_addObject_(v22, v26, (uint64_t)v25, v27);

  }
  objc_msgSend__buildMediaItemWithId_otherFields_(self, v21, (uint64_t)v8, (uint64_t)self->_fields);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)genreItemWithName:(id)a3 itemId:(id)a4
{
  id v6;
  id v7;
  KVFieldValue *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [KVFieldValue alloc];
  v10 = (void *)objc_msgSend_initWithFieldType_value_(v8, v9, 210, (uint64_t)v7);

  v16[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__buildMediaItemWithId_otherFields_(self, v13, (uint64_t)v6, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)songItemWithName:(id)a3 itemId:(id)a4 albumArtistId:(id)a5 songArtistId:(id)a6 albumId:(id)a7 genreId:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSMutableArray *fields;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *v24;
  KVFieldValue *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  NSMutableArray *v31;
  KVFieldValue *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  NSMutableArray *v37;
  KVFieldValue *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  NSMutableArray *v43;
  KVFieldValue *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  NSMutableArray *v49;
  KVFieldValue *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  fields = self->_fields;
  v20 = a3;
  objc_msgSend_removeAllObjects(fields, v21, v22, v23);
  v24 = self->_fields;
  v25 = [KVFieldValue alloc];
  v27 = (void *)objc_msgSend_initWithFieldType_value_(v25, v26, 228, (uint64_t)v20);

  objc_msgSend_addObject_(v24, v28, (uint64_t)v27, v29);
  if (v15)
  {
    v31 = self->_fields;
    v32 = [KVFieldValue alloc];
    v34 = (void *)objc_msgSend_initWithFieldType_value_(v32, v33, 201, (uint64_t)v15);
    objc_msgSend_addObject_(v31, v35, (uint64_t)v34, v36);

  }
  if (v16)
  {
    v37 = self->_fields;
    v38 = [KVFieldValue alloc];
    v40 = (void *)objc_msgSend_initWithFieldType_value_(v38, v39, 225, (uint64_t)v16);
    objc_msgSend_addObject_(v37, v41, (uint64_t)v40, v42);

  }
  if (v17)
  {
    v43 = self->_fields;
    v44 = [KVFieldValue alloc];
    v46 = (void *)objc_msgSend_initWithFieldType_value_(v44, v45, 203, (uint64_t)v17);
    objc_msgSend_addObject_(v43, v47, (uint64_t)v46, v48);

  }
  if (v18)
  {
    v49 = self->_fields;
    v50 = [KVFieldValue alloc];
    v52 = (void *)objc_msgSend_initWithFieldType_value_(v50, v51, 209, (uint64_t)v18);
    objc_msgSend_addObject_(v49, v53, (uint64_t)v52, v54);

  }
  objc_msgSend__buildMediaItemWithId_otherFields_(self, v30, (uint64_t)v14, (uint64_t)self->_fields);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  return v55;
}

- (id)musicVideoItemWithName:(id)a3 itemId:(id)a4 albumArtistId:(id)a5 songArtistId:(id)a6 albumId:(id)a7 genreId:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSMutableArray *fields;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *v24;
  KVFieldValue *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  NSMutableArray *v31;
  KVFieldValue *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  NSMutableArray *v37;
  KVFieldValue *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  NSMutableArray *v43;
  KVFieldValue *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  NSMutableArray *v49;
  KVFieldValue *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  fields = self->_fields;
  v20 = a3;
  objc_msgSend_removeAllObjects(fields, v21, v22, v23);
  v24 = self->_fields;
  v25 = [KVFieldValue alloc];
  v27 = (void *)objc_msgSend_initWithFieldType_value_(v25, v26, 214, (uint64_t)v20);

  objc_msgSend_addObject_(v24, v28, (uint64_t)v27, v29);
  if (v15)
  {
    v31 = self->_fields;
    v32 = [KVFieldValue alloc];
    v34 = (void *)objc_msgSend_initWithFieldType_value_(v32, v33, 201, (uint64_t)v15);
    objc_msgSend_addObject_(v31, v35, (uint64_t)v34, v36);

  }
  if (v16)
  {
    v37 = self->_fields;
    v38 = [KVFieldValue alloc];
    v40 = (void *)objc_msgSend_initWithFieldType_value_(v38, v39, 225, (uint64_t)v16);
    objc_msgSend_addObject_(v37, v41, (uint64_t)v40, v42);

  }
  if (v17)
  {
    v43 = self->_fields;
    v44 = [KVFieldValue alloc];
    v46 = (void *)objc_msgSend_initWithFieldType_value_(v44, v45, 203, (uint64_t)v17);
    objc_msgSend_addObject_(v43, v47, (uint64_t)v46, v48);

  }
  if (v18)
  {
    v49 = self->_fields;
    v50 = [KVFieldValue alloc];
    v52 = (void *)objc_msgSend_initWithFieldType_value_(v50, v51, 209, (uint64_t)v18);
    objc_msgSend_addObject_(v49, v53, (uint64_t)v52, v54);

  }
  objc_msgSend__buildMediaItemWithId_otherFields_(self, v30, (uint64_t)v14, (uint64_t)self->_fields);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  return v55;
}

- (id)tvShowItemWithName:(id)a3 itemId:(id)a4
{
  id v6;
  id v7;
  KVFieldValue *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [KVFieldValue alloc];
  v10 = (void *)objc_msgSend_initWithFieldType_value_(v8, v9, 232, (uint64_t)v7);

  v16[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__buildMediaItemWithId_otherFields_(self, v13, (uint64_t)v6, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)tvEpisodeItemWithName:(id)a3 itemId:(id)a4 showId:(id)a5
{
  id v8;
  id v9;
  NSMutableArray *fields;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  KVFieldValue *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  NSMutableArray *v22;
  KVFieldValue *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;

  v8 = a4;
  v9 = a5;
  fields = self->_fields;
  v11 = a3;
  objc_msgSend_removeAllObjects(fields, v12, v13, v14);
  v15 = self->_fields;
  v16 = [KVFieldValue alloc];
  v18 = (void *)objc_msgSend_initWithFieldType_value_(v16, v17, 230, (uint64_t)v11);

  objc_msgSend_addObject_(v15, v19, (uint64_t)v18, v20);
  if (v9)
  {
    v22 = self->_fields;
    v23 = [KVFieldValue alloc];
    v25 = (void *)objc_msgSend_initWithFieldType_value_(v23, v24, 231, (uint64_t)v9);
    objc_msgSend_addObject_(v22, v26, (uint64_t)v25, v27);

  }
  objc_msgSend__buildMediaItemWithId_otherFields_(self, v21, (uint64_t)v8, (uint64_t)self->_fields);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)movieItemWithName:(id)a3 itemId:(id)a4
{
  id v6;
  id v7;
  KVFieldValue *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [KVFieldValue alloc];
  v10 = (void *)objc_msgSend_initWithFieldType_value_(v8, v9, 212, (uint64_t)v7);

  v16[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__buildMediaItemWithId_otherFields_(self, v13, (uint64_t)v6, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)audioBookArtistItemWithName:(id)a3 itemId:(id)a4
{
  id v6;
  id v7;
  KVFieldValue *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [KVFieldValue alloc];
  v10 = (void *)objc_msgSend_initWithFieldType_value_(v8, v9, 206, (uint64_t)v7);

  v16[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__buildMediaItemWithId_otherFields_(self, v13, (uint64_t)v6, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)audioBookItemWithName:(id)a3 itemId:(id)a4 artistId:(id)a5
{
  id v8;
  id v9;
  NSMutableArray *fields;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  KVFieldValue *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  NSMutableArray *v22;
  KVFieldValue *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;

  v8 = a4;
  v9 = a5;
  fields = self->_fields;
  v11 = a3;
  objc_msgSend_removeAllObjects(fields, v12, v13, v14);
  v15 = self->_fields;
  v16 = [KVFieldValue alloc];
  v18 = (void *)objc_msgSend_initWithFieldType_value_(v16, v17, 208, (uint64_t)v11);

  objc_msgSend_addObject_(v15, v19, (uint64_t)v18, v20);
  if (v9)
  {
    v22 = self->_fields;
    v23 = [KVFieldValue alloc];
    v25 = (void *)objc_msgSend_initWithFieldType_value_(v23, v24, 205, (uint64_t)v9);
    objc_msgSend_addObject_(v22, v26, (uint64_t)v25, v27);

  }
  objc_msgSend__buildMediaItemWithId_otherFields_(self, v21, (uint64_t)v8, (uint64_t)self->_fields);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)playlistItemWithName:(id)a3 itemId:(id)a4
{
  id v6;
  id v7;
  KVFieldValue *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [KVFieldValue alloc];
  v10 = (void *)objc_msgSend_initWithFieldType_value_(v8, v9, 216, (uint64_t)v7);

  v16[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__buildMediaItemWithId_otherFields_(self, v13, (uint64_t)v6, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

+ (void)initialize
{
  if (qword_1ED114580 != -1)
    dispatch_once(&qword_1ED114580, &unk_1E6B7B4A0);
}

@end
