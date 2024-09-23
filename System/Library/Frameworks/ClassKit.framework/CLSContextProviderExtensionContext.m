@implementation CLSContextProviderExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (qword_1ED0FB608 != -1)
    dispatch_once(&qword_1ED0FB608, &unk_1E9749A50);
  return (id)qword_1ED0FB610;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1ED0FB618 != -1)
    dispatch_once(&qword_1ED0FB618, &unk_1E974A820);
  return (id)qword_1ED0FB620;
}

- (void)getMainAppContextPathWithCompletion:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_shared(CLSDataStore, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mainAppContext(v6, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1D407FDD4;
    v18[3] = &unk_1E974A848;
    v20 = v3;
    v19 = v10;
    objc_msgSend_saveWithCompletion_(v6, v11, (uint64_t)v18);

    v12 = v20;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v9, (uint64_t)CFSTR("Failed to create main app context path"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v17, (uint64_t)CFSTR("com.apple.ClassKit"), 100, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v3 + 2))(v3, 0, v12);
  }

}

- (void)updateDescendantsOfContextPath:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  int isEqualToString;
  const char *v27;
  uint64_t v28;
  id *v29;
  id v30;
  void *v31;
  dispatch_block_t v32;
  id v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  id *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend_shared(CLSDataStore, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mainAppContext(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  v56 = (id *)&v55;
  v57 = 0x3032000000;
  v58 = sub_1D40801BC;
  v59 = sub_1D40801CC;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = sub_1D40801BC;
  v53 = sub_1D40801CC;
  v54 = 0;
  if (!objc_msgSend_count(v6, v14, v15))
  {
    v29 = v56;
    v30 = v13;
    v20 = v29[5];
    v29[5] = v30;
    goto LABEL_12;
  }
  objc_msgSend_firstObject(v6, v16, v17);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend_identifier(v13, v18, v19);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {

      v20 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  objc_msgSend_identifier(v13, v18, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend_identifier(v13, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v20, v25, (uint64_t)v24);

    if (isEqualToString)
    {
LABEL_9:
      if (objc_msgSend_count(v6, v27, v28) == 1)
      {
        objc_storeStrong(v56 + 5, v13);
      }
      else
      {
        v32 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E9749850);
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = sub_1D40801D8;
        v44[3] = &unk_1E974A870;
        v47 = &v49;
        v45 = v6;
        v48 = &v55;
        v33 = v32;
        v46 = v33;
        objc_msgSend_contextsMatchingIdentifierPath_completion_(v10, v34, (uint64_t)v45, v44);
        dispatch_block_wait(v33, 0xFFFFFFFFFFFFFFFFLL);

      }
    }
  }
LABEL_12:

  v36 = (uint64_t)v56[5];
  if (v36)
  {
    objc_msgSend_updateDescendantsOfContext_completion_(self, v35, v36, v7);
  }
  else
  {
    if (!v50[5])
    {
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v61 = *MEMORY[0x1E0CB2D50];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v35, (uint64_t)CFSTR("Invalid context path: %@"), v6);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = v38;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v39, (uint64_t)v62, &v61, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v37, v41, (uint64_t)CFSTR("com.apple.ClassKit"), 2, v40);
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = (void *)v50[5];
      v50[5] = v42;

    }
    if (v7)
      v7[2](v7, v50[5]);
  }
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
}

- (void)updateDescendantsOfContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend__principalObject(self, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateDescendantsOfContext_completion_(v11, v10, (uint64_t)v7, v6);

}

@end
