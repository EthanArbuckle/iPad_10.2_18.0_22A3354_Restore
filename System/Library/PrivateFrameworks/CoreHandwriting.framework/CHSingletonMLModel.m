@implementation CHSingletonMLModel

+ (id)modelWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t *, const char *, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v29;
  id v30;
  id v31;
  id v32;
  id *v33;

  v7 = a3;
  v8 = a4;
  objc_opt_self();
  if (qword_1EF568158 != -1)
    dispatch_once(&qword_1EF568158, &unk_1E77F1750);
  objc_msgSend_relativePath(v7, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = qword_1EF568150;
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = sub_1BE709884;
  v29 = &unk_1E77F3948;
  v16 = v14;
  v30 = v16;
  v17 = v7;
  v31 = v17;
  v18 = v8;
  v32 = v18;
  v33 = a5;
  dispatch_sync(v15, &v26);
  objc_msgSend_objectForKey_((void *)qword_1EF568148, v19, (uint64_t)v16, v20, v21, v22, v26, v27, v28, v29);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    ++*(_QWORD *)(v23 + 16);

  return v24;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1BE709BB0;
  v30 = sub_1BE709BC0;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1BE709BB0;
  v24 = sub_1BE709BC0;
  v25 = 0;
  v10 = qword_1EF568150;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE709BC8;
  block[3] = &unk_1E77F4078;
  v18 = &v26;
  block[4] = self;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v19 = &v20;
  dispatch_sync(v10, block);
  if (a5)
    *a5 = objc_retainAutorelease((id)v21[5]);
  v13 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (id)model
{
  return self->_model;
}

- (MLModelDescription)modelDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return (MLModelDescription *)objc_msgSend_modelDescription(self->_model, a2, v2, v3, v4, v5);
}

- (MLModelConfiguration)configuration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return (MLModelConfiguration *)objc_msgSend_configuration(self->_model, a2, v2, v3, v4, v5);
}

- (int64_t)usageCount
{
  return self->_modelUseCount;
}

+ (void)releaseModelWithKey:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = qword_1EF568150;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE709CDC;
  block[3] = &unk_1E77F1F38;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

+ (unint64_t)powerLogModelNameForModelKey:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v3 = a3;
  if ((objc_msgSend_hasSuffix_(v3, v4, (uint64_t)CFSTR("ctc_latn.bundle"), v5, v6, v7) & 1) != 0)
  {

    return 4;
  }
  else if ((objc_msgSend_hasSuffix_(v3, v8, (uint64_t)CFSTR("ctc_zh.bundle"), v9, v10, v11) & 1) != 0)
  {

    return 5;
  }
  else if ((objc_msgSend_hasSuffix_(v3, v13, (uint64_t)CFSTR("ctc_ja.bundle"), v14, v15, v16) & 1) != 0)
  {

    return 6;
  }
  else if ((objc_msgSend_hasSuffix_(v3, v17, (uint64_t)CFSTR("ctc_ko.bundle"), v18, v19, v20) & 1) != 0)
  {

    return 7;
  }
  else if ((objc_msgSend_hasSuffix_(v3, v21, (uint64_t)CFSTR("ctc_th.bundle"), v22, v23, v24) & 1) != 0)
  {

    return 8;
  }
  else if ((objc_msgSend_hasSuffix_(v3, v25, (uint64_t)CFSTR("ctc_cyrl.bundle"), v26, v27, v28) & 1) != 0
         || (objc_msgSend_hasSuffix_(v3, v29, (uint64_t)CFSTR("ctc_ar.bundle"), v30, v31, v32) & 1) != 0)
  {

    return 9;
  }
  else
  {
    if (objc_msgSend_hasSuffix_(v3, v33, (uint64_t)CFSTR("ctc_vi.bundle"), v34, v35, v36))
      v37 = 11;
    else
      v37 = 0x7FFFFFFFFFFFFFFFLL;

    return v37;
  }
}

- (NSString)modelKey
{
  return self->_modelKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_modelKey, 0);
}

@end
