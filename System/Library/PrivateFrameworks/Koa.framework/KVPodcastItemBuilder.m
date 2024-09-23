@implementation KVPodcastItemBuilder

- (KVPodcastItemBuilder)init
{
  KVPodcastItemBuilder *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KVPodcastItemBuilder;
  v2 = -[KVPodcastItemBuilder init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(KVItemBuilder);
    builder = v2->_builder;
    v2->_builder = v3;

  }
  return v2;
}

- (id)playlistItemWithName:(id)a3 itemId:(id)a4 error:(id *)a5
{
  id v8;
  KVItemBuilder *builder;
  const char *v10;
  void *v11;
  const char *v12;
  id v13;
  KVItemBuilder *v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  builder = self->_builder;
  v23 = 0;
  objc_msgSend_setItemType_itemId_error_(builder, v10, 16, (uint64_t)a4, &v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;
  if (v11)
  {
    v14 = self->_builder;
    v22 = v13;
    objc_msgSend_addFieldWithType_value_error_(v14, v12, 702, (uint64_t)v8, &v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v22;

    if (v15)
    {
      objc_msgSend__buildItemWithError_(self, v17, (uint64_t)a5, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v13 = v16;
  }
  v20 = qword_1ED114588;
  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[KVPodcastItemBuilder playlistItemWithName:itemId:error:]";
    v26 = 2112;
    v27 = v13;
    _os_log_error_impl(&dword_1B70E7000, v20, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  v19 = 0;
  if (a5 && v13)
  {
    v16 = objc_retainAutorelease(v13);
    v19 = 0;
    *a5 = v16;
  }
  else
  {
    v16 = v13;
  }
LABEL_11:

  return v19;
}

- (id)podcastItemWithTitle:(id)a3 itemId:(id)a4 artistName:(id)a5 error:(id *)a6
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
  KVItemBuilder *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  builder = self->_builder;
  v30 = 0;
  objc_msgSend_setItemType_itemId_error_(builder, v13, 16, (uint64_t)a4, &v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v30;
  if (v14)
  {
    v17 = self->_builder;
    v29 = v16;
    objc_msgSend_addFieldWithType_value_error_(v17, v15, 700, (uint64_t)v10, &v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v29;

    if (!v18)
    {

      goto LABEL_7;
    }
    v21 = self->_builder;
    v28 = v19;
    objc_msgSend_addFieldWithType_value_error_(v21, v20, 701, (uint64_t)v11, &v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v28;

    if (v22)
    {
      objc_msgSend__buildItemWithError_(self, v23, (uint64_t)a6, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  v19 = v16;
LABEL_7:
  v26 = qword_1ED114588;
  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[KVPodcastItemBuilder podcastItemWithTitle:itemId:artistName:error:]";
    v33 = 2112;
    v34 = v19;
    _os_log_error_impl(&dword_1B70E7000, v26, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  v25 = 0;
  if (a6 && v19)
  {
    v16 = objc_retainAutorelease(v19);
    v25 = 0;
    *a6 = v16;
  }
  else
  {
    v16 = v19;
  }
LABEL_13:

  return v25;
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
      v13 = "-[KVPodcastItemBuilder _buildItemWithError:]";
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
