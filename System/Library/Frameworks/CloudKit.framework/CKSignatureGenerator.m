@implementation CKSignatureGenerator

- (CKSignatureGenerator)init
{
  CKSignatureGenerator *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  CKSignatureGenerator *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKSignatureGenerator *result;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  char *v17;
  const char *v18;
  objc_super v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;

  v19.receiver = self;
  v19.super_class = (Class)CKSignatureGenerator;
  v2 = -[CKSignatureGenerator init](&v19, sel_init);
  v6 = v2;
  if (!v2)
    return v6;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v7 = off_1EDF75398;
  v23 = off_1EDF75398;
  if (!off_1EDF75398)
  {
    v8 = sub_18A7BA544((uint64_t)v2, v3, v4, v5);
    v7 = dlsym(v8, "MMCSSignatureGeneratorCreate");
    v21[3] = (uint64_t)v7;
    off_1EDF75398 = v7;
  }
  _Block_object_dispose(&v20, 8);
  if (v7)
  {
    v6->_generator = (void *)((uint64_t (*)(void))v7)();
    v6->_valid = 1;
    return v6;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v14, (uint64_t)"void *__MMCSSignatureGeneratorCreate(void)", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v13, v18, (uint64_t)v16, (uint64_t)CFSTR("CKSignatureGenerator.m"), 24, CFSTR("%s"), v17);

  __break(1u);
  return result;
}

- (CKSignatureGenerator)initWithBoundaryKey:(id)a3
{
  id v4;
  CKSignatureGenerator *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CKSignatureGenerator *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CKSignatureGenerator *result;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  char *v20;
  const char *v21;
  objc_super v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKSignatureGenerator;
  v5 = -[CKSignatureGenerator init](&v22, sel_init);
  v9 = v5;
  if (!v5)
    goto LABEL_6;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v10 = off_1EDF753A0;
  v26 = off_1EDF753A0;
  if (!off_1EDF753A0)
  {
    v11 = sub_18A7BA544((uint64_t)v5, v6, v7, v8);
    v10 = dlsym(v11, "MMCSSignatureGeneratorCreateWithBoundaryKey");
    v24[3] = (uint64_t)v10;
    off_1EDF753A0 = v10;
  }
  _Block_object_dispose(&v23, 8);
  if (v10)
  {
    v9->_generator = (void *)((uint64_t (*)(id))v10)(v4);
    v9->_valid = 1;
LABEL_6:

    return v9;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v17, (uint64_t)"void *__MMCSSignatureGeneratorCreateWithBoundaryKey(CFDataRef)", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v16, v21, (uint64_t)v19, (uint64_t)CFSTR("CKSignatureGenerator.m"), 28, CFSTR("%s"), v20);

  __break(1u);
  return result;
}

- (CKSignatureGenerator)initWithVerificationKey:(id)a3
{
  id v4;
  CKSignatureGenerator *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CKSignatureGenerator *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CKSignatureGenerator *result;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  char *v20;
  const char *v21;
  objc_super v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKSignatureGenerator;
  v5 = -[CKSignatureGenerator init](&v22, sel_init);
  v9 = v5;
  if (!v5)
    goto LABEL_6;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v10 = off_1EDF753A8;
  v26 = off_1EDF753A8;
  if (!off_1EDF753A8)
  {
    v11 = sub_18A7BA544((uint64_t)v5, v6, v7, v8);
    v10 = dlsym(v11, "MMCSSignatureGeneratorCreateWithVerificationKey");
    v24[3] = (uint64_t)v10;
    off_1EDF753A8 = v10;
  }
  _Block_object_dispose(&v23, 8);
  if (v10)
  {
    v9->_generator = (void *)((uint64_t (*)(id))v10)(v4);
    v9->_valid = 1;
LABEL_6:

    return v9;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v17, (uint64_t)"void *__MMCSSignatureGeneratorCreateWithVerificationKey(CFDataRef)", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v16, v21, (uint64_t)v19, (uint64_t)CFSTR("CKSignatureGenerator.m"), 33, CFSTR("%s"), v20);

  __break(1u);
  return result;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  objc_super v6;

  v5 = (void *)objc_msgSend__newSignatureByFinishingGenerator(self, a2, v2, v3);
  if (v5)
    free(v5);
  v6.receiver = self;
  v6.super_class = (Class)CKSignatureGenerator;
  -[CKSignatureGenerator dealloc](&v6, sel_dealloc);
}

- (char)_newSignatureByFinishingGenerator
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  char *result;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;

  if (!objc_msgSend_isValid(self, a2, v2, v3))
    return 0;
  objc_msgSend_setValid_(self, v5, 0, v6);
  v10 = objc_msgSend_generator(self, v7, v8, v9);
  v14 = v10;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v15 = off_1EDF753B0;
  v30 = off_1EDF753B0;
  if (!off_1EDF753B0)
  {
    v16 = sub_18A7BA544(v10, v11, v12, v13);
    v15 = dlsym(v16, "MMCSSignatureGeneratorFinish");
    v28[3] = (uint64_t)v15;
    off_1EDF753B0 = v15;
  }
  _Block_object_dispose(&v27, 8);
  if (v15)
  {
    result = (char *)((uint64_t (*)(uint64_t))v15)(v14);
    self->_generator = 0;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v22, (uint64_t)"unsigned char *__MMCSSignatureGeneratorFinish(void *)", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v21, v26, (uint64_t)v24, (uint64_t)CFSTR("CKSignatureGenerator.m"), 40, CFSTR("%s"), v25);

    __break(1u);
  }
  return result;
}

- (void)updateWithBytes:(const void *)a3 length:(unint64_t)a4
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;

  if ((objc_msgSend_isValid(self, a2, (uint64_t)a3, a4) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, CFSTR("CKSignatureGenerator.m"), 119, CFSTR("Attempted to update an invalidated signature generator"));

  }
  v11 = objc_msgSend_generator(self, v8, v9, v10);
  sub_18A7B9B4C(v11, (const char *)a3, a4, v12);
}

- (void)updateWithData:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  id v27;

  v5 = a3;
  if ((objc_msgSend_isValid(self, v6, v7, v8) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, (uint64_t)self, CFSTR("CKSignatureGenerator.m"), 124, CFSTR("Attempted to update an invalidated signature generator"));

  }
  v27 = v5;
  v15 = objc_msgSend_generator(self, v12, v13, v14);
  v19 = (const char *)objc_msgSend_bytes(v27, v16, v17, v18);
  v23 = objc_msgSend_length(v27, v20, v21, v22);
  sub_18A7B9B4C(v15, v19, v23, v24);

}

- (id)dataByFinishingSignature
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;

  v4 = objc_msgSend__newSignatureByFinishingGenerator(self, a2, v2, v3);
  v5 = (void *)MEMORY[0x1E0C99D50];
  sub_18A7B9D70(v4, v6, v7, v8);
  return (id)objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v5, v10, v4, v9, 1);
}

+ (id)signatureWithFileDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  id result;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  char *v25;
  const char *v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void *v31;

  v5 = *(_QWORD *)&a3;
  v27 = 0;
  v28 = 0;
  if (a4)
    v6 = &v27;
  else
    v6 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v7 = off_1EDF753C0;
  v31 = off_1EDF753C0;
  if (!off_1EDF753C0)
  {
    v8 = sub_18A7BA544((uint64_t)a1, a2, *(uint64_t *)&a3, (uint64_t)a4);
    v7 = dlsym(v8, "MMCSSignatureCreateFromFileDescriptor");
    v29[3] = (uint64_t)v7;
    off_1EDF753C0 = v7;
  }
  _Block_object_dispose(&v28, 8);
  if (v7)
  {
    v15 = ((uint64_t (*)(uint64_t, id *))v7)(v5, v6);
    if (v27)
    {
      if (!a4)
      {
        CFRelease(v27);
        if (v15)
          goto LABEL_11;
        goto LABEL_13;
      }
      *a4 = v27;
    }
    if (v15)
    {
LABEL_11:
      v16 = (void *)MEMORY[0x1E0C99D50];
      sub_18A7B9D70(v15, v12, v13, v14);
      objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v16, v18, v15, v17, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      return v19;
    }
LABEL_13:
    v19 = 0;
    return v19;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v22, (uint64_t)"unsigned char *__MMCSSignatureCreateFromFileDescriptor(int, CFErrorRef *)", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v21, v26, (uint64_t)v24, (uint64_t)CFSTR("CKSignatureGenerator.m"), 43, CFSTR("%s"), v25);

  __break(1u);
  return result;
}

+ (id)signatureWithFileDescriptor:(int)a3 boundaryKey:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  id result;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  char *v31;
  const char *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;

  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v11 = v7;
  v33 = 0;
  v34 = 0;
  if (a5)
    v12 = &v33;
  else
    v12 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v13 = off_1EDF753C8;
  v37 = off_1EDF753C8;
  if (!off_1EDF753C8)
  {
    v14 = sub_18A7BA544((uint64_t)v7, v8, v9, v10);
    v13 = dlsym(v14, "MMCSSignatureCreateWithBoundaryKeyFromFileDescriptor");
    v35[3] = (uint64_t)v13;
    off_1EDF753C8 = v13;
  }
  _Block_object_dispose(&v34, 8);
  if (v13)
  {
    v21 = ((uint64_t (*)(void *, uint64_t, id *))v13)(v11, v6, v12);
    if (v33)
    {
      if (!a5)
      {
        CFRelease(v33);
        if (v21)
          goto LABEL_11;
        goto LABEL_13;
      }
      *a5 = v33;
    }
    if (v21)
    {
LABEL_11:
      v22 = (void *)MEMORY[0x1E0C99D50];
      sub_18A7B9D70(v21, v18, v19, v20);
      objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v22, v24, v21, v23, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

      return v25;
    }
LABEL_13:
    v25 = 0;
    goto LABEL_14;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v15, v16, v17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v28, (uint64_t)"unsigned char *__MMCSSignatureCreateWithBoundaryKeyFromFileDescriptor(CFDataRef, int, CFErrorRef *)", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v27, v32, (uint64_t)v30, (uint64_t)CFSTR("CKSignatureGenerator.m"), 46, CFSTR("%s"), v31);

  __break(1u);
  return result;
}

+ (BOOL)isValidSignature:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  BOOL result;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  void *v43;

  v3 = a3;
  if (!objc_msgSend_length(v3, v4, v5, v6)
    || (v10 = objc_msgSend_length(v3, v7, v8, v9),
        v14 = objc_msgSend_bytes(v3, v11, v12, v13),
        sub_18A7B9D70(v14, v15, v16, v17),
        v10 != v21))
  {
    v32 = 0;
    goto LABEL_8;
  }
  v22 = objc_msgSend_bytes(v3, v18, v19, v20);
  v26 = v22;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v27 = off_1EDF753D0;
  v43 = off_1EDF753D0;
  if (!off_1EDF753D0)
  {
    v28 = sub_18A7BA544(v22, v23, v24, v25);
    v27 = dlsym(v28, "MMCSSignatureIsValid");
    v41[3] = (uint64_t)v27;
    off_1EDF753D0 = v27;
  }
  _Block_object_dispose(&v40, 8);
  if (v27)
  {
    v32 = ((unsigned int (*)(uint64_t))v27)(v26) != 0;
LABEL_8:

    return v32;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v29, v30, v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v35, (uint64_t)"Boolean __MMCSSignatureIsValid(const unsigned char *)", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v34, v39, (uint64_t)v37, (uint64_t)CFSTR("CKSignatureGenerator.m"), 52, CFSTR("%s"), v38);

  __break(1u);
  return result;
}

+ (BOOL)isValidV2Signature:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  BOOL result;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  void *v43;

  v3 = a3;
  if (!objc_msgSend_length(v3, v4, v5, v6)
    || (v10 = objc_msgSend_length(v3, v7, v8, v9),
        v14 = objc_msgSend_bytes(v3, v11, v12, v13),
        sub_18A7B9D70(v14, v15, v16, v17),
        v10 != v21))
  {
    v32 = 0;
    goto LABEL_8;
  }
  v22 = objc_msgSend_bytes(v3, v18, v19, v20);
  v26 = v22;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v27 = off_1EDF6EF10;
  v43 = off_1EDF6EF10;
  if (!off_1EDF6EF10)
  {
    v28 = sub_18A7BA544(v22, v23, v24, v25);
    v27 = dlsym(v28, "MMCSSignatureIsValidV2");
    v41[3] = (uint64_t)v27;
    off_1EDF6EF10 = v27;
  }
  _Block_object_dispose(&v40, 8);
  if (v27)
  {
    v32 = ((unsigned int (*)(uint64_t))v27)(v26) != 0;
LABEL_8:

    return v32;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v29, v30, v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v35, (uint64_t)"Boolean __MMCSSignatureIsValidV2(const unsigned char *)", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v34, v39, (uint64_t)v37, (uint64_t)CFSTR("CKSignatureGenerator.m"), 55, CFSTR("%s"), v38);

  __break(1u);
  return result;
}

+ (id)signatureForStreamingAsset
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t i;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v17;
  _BYTE v18[20];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v5 = (void *)objc_msgSend_initWithCapacity_(v2, v3, 21, v4);
  v17 = 3;
  objc_msgSend_appendBytes_length_(v5, v6, (uint64_t)&v17, 1);
  for (i = 0; i != 20; ++i)
    v18[i] = arc4random();
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v8, (uint64_t)v18, 20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendData_(v5, v10, (uint64_t)v9, v11);
  v15 = (void *)objc_msgSend_copy(v5, v12, v13, v14);

  return v15;
}

- (void)generator
{
  return self->_generator;
}

- (void)setGenerator:(void *)a3
{
  self->_generator = a3;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
