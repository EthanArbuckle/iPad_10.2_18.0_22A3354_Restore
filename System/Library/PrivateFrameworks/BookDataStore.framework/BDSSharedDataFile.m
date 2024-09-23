@implementation BDSSharedDataFile

- (BDSSharedDataFile)initWithURL:(id)a3
{
  id v5;
  BDSSharedDataFile *v6;
  BDSSharedDataFile *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BDSSharedDataFile;
  v6 = -[BDSSharedDataFile init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_url, a3);

  return v7;
}

- (id)load:(id *)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_227DAA520;
  v21 = sub_227DAA530;
  v22 = 0;
  v5 = objc_alloc_init(MEMORY[0x24BDD1570]);
  objc_msgSend_url(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_227DAA538;
  v15[3] = &unk_24F08B130;
  v15[4] = &v17;
  objc_msgSend_coordinateReadingItemAtURL_options_error_byAccessor_(v5, v11, (uint64_t)v10, 0, (uint64_t)&v16, v15);
  v12 = v16;

  if (a3 && v12)
    *a3 = objc_retainAutorelease(v12);
  v13 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v13;
}

- (BOOL)save:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id *v13;
  id v14;
  const char *v15;
  void *v16;
  char v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  id obj;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v6 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_227DAA520;
  v28 = sub_227DAA530;
  v29 = 0;
  v7 = objc_alloc_init(MEMORY[0x24BDD1570]);
  objc_msgSend_url(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id *)(v25 + 5);
  obj = (id)v25[5];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_227DAA710;
  v19[3] = &unk_24F08B158;
  v21 = &v30;
  v14 = v6;
  v20 = v14;
  v22 = &v24;
  objc_msgSend_coordinateWritingItemAtURL_options_error_byAccessor_(v7, v15, (uint64_t)v12, 0, (uint64_t)&obj, v19);
  objc_storeStrong(v13, obj);

  if (a4)
  {
    v16 = (void *)v25[5];
    if (v16)
      *a4 = objc_retainAutorelease(v16);
  }
  v17 = *((_BYTE *)v31 + 24);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v17;
}

- (BOOL)remove:(id *)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id *v11;
  const char *v12;
  void *v13;
  char v14;
  _QWORD v16[6];
  id obj;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_227DAA520;
  v22 = sub_227DAA530;
  v23 = 0;
  v5 = objc_alloc_init(MEMORY[0x24BDD1570]);
  objc_msgSend_url(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id *)(v19 + 5);
  obj = (id)v19[5];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_227DAA8EC;
  v16[3] = &unk_24F08B180;
  v16[4] = &v24;
  v16[5] = &v18;
  objc_msgSend_coordinateWritingItemAtURL_options_error_byAccessor_(v5, v12, (uint64_t)v10, 1, (uint64_t)&obj, v16);
  objc_storeStrong(v11, obj);

  if (a3)
  {
    v13 = (void *)v19[5];
    if (v13)
      *a3 = objc_retainAutorelease(v13);
  }
  v14 = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v14;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
