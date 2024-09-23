@implementation LNCATDialog(CATSupport)

- (void)getResultWithCompletionHandler:()CATSupport
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNCATDialog+CATSupport.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  objc_msgSend(a1, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_compactMap:", &__block_literal_global_4026);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = CFSTR("locale");
  objc_msgSend(a1, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "templateDirectoryURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startAccessingSecurityScopedResource");

  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v11 = (void *)getCATClass_softClass_4028;
  v25 = getCATClass_softClass_4028;
  v12 = MEMORY[0x1E0C809B0];
  if (!getCATClass_softClass_4028)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __getCATClass_block_invoke_4029;
    v21[3] = &unk_1E45DDB30;
    v21[4] = &v22;
    __getCATClass_block_invoke_4029((uint64_t)v21);
    v11 = (void *)v23[3];
  }
  v13 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v22, 8);
  objc_msgSend(a1, "templateDirectoryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __58__LNCATDialog_CATSupport__getResultWithCompletionHandler___block_invoke_2;
  v19[3] = &unk_1E45DC8C0;
  v19[4] = a1;
  v20 = v5;
  v16 = v5;
  LODWORD(v18) = 0;
  objc_msgSend(v13, "execute:templateDir:catId:parameters:globals:callback:options:completion:", 0, v14, v15, v7, v9, 0, v18, v19);

}

@end
