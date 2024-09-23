@implementation LAKeyStoreSecretCoder

- (void)wrapData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (!objc_msgSend(v6, "length"))
  {
    v18 = CFSTR("Invalid data size");
LABEL_10:
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v8);
    goto LABEL_14;
  }
  if (!-[LAKeyStoreSecretCoder _isCoderAvailable](self, "_isCoderAvailable"))
  {
    v18 = CFSTR("Required data coder not found");
    goto LABEL_10;
  }
  -[LAKeyStoreSecretCoder _generateNonce](self, "_generateNonce");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || objc_msgSend(0, "length") == 16)
  {
    v9 = objc_alloc((Class)getTKBERTLVRecordClass());
    v10 = (void *)objc_msgSend(objc_alloc((Class)getTKBERTLVRecordClass()), "initWithTag:value:", 2, v8);
    v19[0] = v10;
    v11 = (void *)objc_msgSend(objc_alloc((Class)getTKBERTLVRecordClass()), "initWithTag:value:", 3, v6);
    v19[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithTag:records:", 1, v12);

    objc_msgSend(v13, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && (v16 = objc_msgSend(v14, "length"), v16 >= objc_msgSend(v6, "length") + 16))
    {
      ((void (**)(id, void *, void *))v7)[2](v7, v15, 0);
    }
    else
    {
      +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Could not encode data"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v17);

    }
  }
  else
  {
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Could not generate nonce"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v13);
  }

LABEL_14:
}

- (void)unwrapData:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  id TKBERTLVRecordClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if (-[LAKeyStoreSecretCoder _isCoderAvailable](self, "_isCoderAvailable"))
  {
    objc_msgSend(getTKBERTLVRecordClass(), "recordFromData:", v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7 || objc_msgSend(v7, "tag") != 1)
    {
      +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Invalid format"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v11);
LABEL_15:

      goto LABEL_16;
    }
    TKBERTLVRecordClass = getTKBERTLVRecordClass();
    objc_msgSend(v8, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(TKBERTLVRecordClass, "sequenceOfRecordsFromData:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count") != 2)
      goto LABEL_13;
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "tag") == 2)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (v15 != 16)
        goto LABEL_13;
      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "tag") == 3)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "length");

        if (v18)
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "value");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *, void *))v6)[2](v6, v20, 0);

LABEL_14:
          goto LABEL_15;
        }
LABEL_13:
        +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Invalid format"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, 0, v19);
        goto LABEL_14;
      }
    }

    goto LABEL_13;
  }
  +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Required data decoder not found"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v8);
LABEL_16:

}

- (id)_generateNonce
{
  _BYTE bytes[16];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x10uLL, bytes))
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", bytes, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isCoderAvailable
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getTKTLVRecordClass_softClass;
  v9 = getTKTLVRecordClass_softClass;
  if (!getTKTLVRecordClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getTKTLVRecordClass_block_invoke;
    v5[3] = &unk_1E70792C0;
    v5[4] = &v6;
    __getTKTLVRecordClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return v3 && getTKBERTLVRecordClass() != 0;
}

@end
