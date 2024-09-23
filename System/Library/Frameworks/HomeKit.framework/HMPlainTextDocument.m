@implementation HMPlainTextDocument

- (HMPlainTextDocument)initWithString:(id)a3
{
  id v4;
  HMPlainTextDocument *v5;
  _HMDocument *v6;
  _HMDocument *document;
  HMPlainTextDocument *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMPlainTextDocument;
  v5 = -[HMPlainTextDocument init](&v10, sel_init);
  if (v5
    && (v6 = -[_HMDocument initWithString:]([_HMDocument alloc], "initWithString:", v4),
        document = v5->_document,
        v5->_document = v6,
        document,
        !v5->_document))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (HMPlainTextDocument)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  HMPlainTextDocument *v7;
  _HMDocument *v8;
  _HMDocument *document;
  HMPlainTextDocument *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMPlainTextDocument;
  v7 = -[HMPlainTextDocument init](&v12, sel_init);
  if (v7
    && (v8 = -[_HMDocument initWithData:error:]([_HMDocument alloc], "initWithData:error:", v6, a4),
        document = v7->_document,
        v7->_document = v8,
        document,
        !v7->_document))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (HMPlainTextDocument)initWithURL:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  HMPlainTextDocument *v9;

  v6 = (void *)MEMORY[0x1E0CB3620];
  v7 = a3;
  objc_msgSend(v6, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMPlainTextDocument initWithURL:fileManager:error:](self, "initWithURL:fileManager:error:", v7, v8, a4);

  return v9;
}

- (HMPlainTextDocument)initWithURL:(id)a3 fileManager:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  HMPlainTextDocument *v10;
  _HMDocument *v11;
  _HMDocument *document;
  HMPlainTextDocument *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMPlainTextDocument;
  v10 = -[HMPlainTextDocument init](&v15, sel_init);
  if (v10
    && (v11 = -[_HMDocument initWithURL:fileManager:error:]([_HMDocument alloc], "initWithURL:fileManager:error:", v8, v9, a5), document = v10->_document, v10->_document = v11, document, !v10->_document))
  {
    v13 = 0;
  }
  else
  {
    v13 = v10;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMPlainTextDocument stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMPlainTextDocument *v4;
  HMPlainTextDocument *v5;
  HMPlainTextDocument *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMPlainTextDocument *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMPlainTextDocument document](self, "document");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMPlainTextDocument document](v6, "document");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (NSString)stringValue
{
  void *v2;
  void *v3;

  -[HMPlainTextDocument document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSAttributedString)attributedString
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  __int128 v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E3AB0B98;
    v8 = 0;
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!UIKitLibraryCore_frameworkLibrary)
    return (NSAttributedString *)0;
  *(_QWORD *)&v7 = 0;
  *((_QWORD *)&v7 + 1) = &v7;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__23098;
  v10 = __Block_byref_object_dispose__23099;
  v11 = 0;
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__HMPlainTextDocument_attributedString__block_invoke;
  v6[3] = &unk_1E3AB0B58;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = *(id *)(*((_QWORD *)&v7 + 1) + 40);
  _Block_object_dispose(&v7, 8);

  return (NSAttributedString *)v4;
}

- (HMPlainTextDocument)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMPlainTextDocument *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.stringValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMPlainTextDocument initWithString:](self, "initWithString:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMPlainTextDocument stringValue](self, "stringValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.stringValue"));

}

- (_HMDocument)document
{
  return (_HMDocument *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_document, 0);
}

void __39__HMPlainTextDocument_attributedString__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id *v8;
  void *v9;
  id v10;
  id *v11;
  void *v12;
  id v13;
  id *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[2];
  _BYTE buf[24];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fastestEncoding");

  objc_msgSend(*v2, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v8 = (id *)getNSDocumentTypeDocumentAttributeSymbolLoc_ptr;
  v33 = getNSDocumentTypeDocumentAttributeSymbolLoc_ptr;
  if (!getNSDocumentTypeDocumentAttributeSymbolLoc_ptr)
  {
    v9 = (void *)UIKitLibrary();
    v8 = (id *)dlsym(v9, "NSDocumentTypeDocumentAttribute");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v8;
    getNSDocumentTypeDocumentAttributeSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(buf, 8);
  if (!v8)
    goto LABEL_15;
  v10 = *v8;
  v29 = v10;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v11 = (id *)getNSPlainTextDocumentTypeSymbolLoc_ptr;
  v33 = getNSPlainTextDocumentTypeSymbolLoc_ptr;
  if (!getNSPlainTextDocumentTypeSymbolLoc_ptr)
  {
    v12 = (void *)UIKitLibrary();
    v11 = (id *)dlsym(v12, "NSPlainTextDocumentType");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v11;
    getNSPlainTextDocumentTypeSymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(buf, 8);
  if (!v11)
    goto LABEL_15;
  v13 = *v11;
  v31[0] = v13;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v14 = (id *)getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr;
  v33 = getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr;
  if (!getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr)
  {
    v15 = (void *)UIKitLibrary();
    v14 = (id *)dlsym(v15, "NSCharacterEncodingDocumentAttribute");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v14;
    getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(buf, 8);
  if (!v14)
  {
LABEL_15:
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v30 = *v14;
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = v30;
  objc_msgSend(v16, "numberWithUnsignedInteger:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v29, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v20 = objc_msgSend(v7, "initWithData:options:documentAttributes:error:", v6, v19, 0, &v28);
  v21 = v28;
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v20;

  if (v21)
  {
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Create NSAttributedString failed with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_23120 != -1)
    dispatch_once(&logCategory__hmf_once_t2_23120, &__block_literal_global_23121);
  return (id)logCategory__hmf_once_v3_23122;
}

void __34__HMPlainTextDocument_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_23122;
  logCategory__hmf_once_v3_23122 = v0;

}

@end
