@implementation KVLinkOOVItemBuilder

- (KVLinkOOVItemBuilder)init
{
  KVLinkOOVItemBuilder *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KVLinkOOVItemBuilder;
  v2 = -[KVLinkOOVItemBuilder init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(KVItemBuilder);
    builder = v2->_builder;
    v2->_builder = v3;

  }
  return v2;
}

- (id)linkOOVItemWithPhrase:(id)a3 itemId:(id)a4 customPronunciations:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  KVItemBuilder *builder;
  const char *v13;
  void *v14;
  const char *v15;
  id v16;
  KVItemBuilder *v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  KVItemBuilder *v43;
  void *v44;
  KVLinkOOVItemBuilder *v45;
  id *v46;
  NSObject *v48;
  id *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  id v56;
  uint8_t v57[128];
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  builder = self->_builder;
  v56 = 0;
  objc_msgSend_setItemType_itemId_error_(builder, v13, 11, (uint64_t)a4, &v56);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v56;
  if (v14)
  {
    v17 = self->_builder;
    v55 = v16;
    objc_msgSend_addFieldWithType_value_error_(v17, v15, 500, (uint64_t)v10, &v55);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v55;

    if (v18)
    {
      objc_msgSend_null(MEMORY[0x1E0C99E38], v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqual_(v11, v24, (uint64_t)v23, v25) & 1) != 0)
      {

      }
      else
      {
        v33 = objc_msgSend_count(v11, v26, v27, v28);

        if (v33)
        {
          v49 = a6;
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v34 = v11;
          v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v51, (uint64_t)v57, 16);
          if (v36)
          {
            v38 = v36;
            v39 = *(_QWORD *)v52;
            while (2)
            {
              v40 = 0;
              v41 = v19;
              do
              {
                if (*(_QWORD *)v52 != v39)
                  objc_enumerationMutation(v34);
                v42 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v40);
                v43 = self->_builder;
                v50 = v41;
                objc_msgSend_addFieldWithType_value_error_(v43, v37, 501, v42, &v50, v49);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = v50;

                if (!v44)
                {
                  v48 = qword_1ED114588;
                  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v59 = "-[KVLinkOOVItemBuilder linkOOVItemWithPhrase:itemId:customPronunciations:error:]";
                    v60 = 2112;
                    v61 = v19;
                    _os_log_error_impl(&dword_1B70E7000, v48, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
                  }
                  if (v49 && v19)
                    *v49 = objc_retainAutorelease(v19);

                  v32 = 0;
                  goto LABEL_24;
                }
                ++v40;
                v41 = v19;
              }
              while (v38 != v40);
              v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v51, (uint64_t)v57, 16);
              if (v38)
                continue;
              break;
            }
          }

          v45 = self;
          v46 = v49;
          goto LABEL_23;
        }
      }
      v45 = self;
      v46 = a6;
LABEL_23:
      objc_msgSend__buildItemWithError_(v45, v29, (uint64_t)v46, v30, v49);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    v16 = v19;
  }
  v31 = qword_1ED114588;
  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v59 = "-[KVLinkOOVItemBuilder linkOOVItemWithPhrase:itemId:customPronunciations:error:]";
    v60 = 2112;
    v61 = v16;
    _os_log_error_impl(&dword_1B70E7000, v31, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  v32 = 0;
  if (a6 && v16)
  {
    v19 = objc_retainAutorelease(v16);
    v32 = 0;
    *a6 = v19;
  }
  else
  {
    v19 = v16;
  }
LABEL_24:

  return v32;
}

- (id)_buildItemWithError:(id *)a3
{
  uint64_t v3;
  KVItemBuilder *builder;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  builder = self->_builder;
  v11 = 0;
  objc_msgSend_buildItemWithError_(builder, a2, (uint64_t)&v11, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = qword_1ED114588;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[KVLinkOOVItemBuilder _buildItemWithError:]";
      v14 = 2112;
      v15 = v7;
      _os_log_error_impl(&dword_1B70E7000, v9, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      if (!a3)
        goto LABEL_7;
    }
    else if (!a3)
    {
      goto LABEL_7;
    }
    if (v7)
      *a3 = objc_retainAutorelease(v7);
  }
LABEL_7:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
}

+ (void)initialize
{
  if (qword_1ED114580 != -1)
    dispatch_once(&qword_1ED114580, &unk_1E6B7B4A0);
}

@end
