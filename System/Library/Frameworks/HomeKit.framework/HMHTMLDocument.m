@implementation HMHTMLDocument

- (HMHTMLDocument)initWithString:(id)a3
{
  id v4;
  HMHTMLDocument *v5;
  _HMDocument *v6;
  _HMDocument *document;
  HMHTMLDocument *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMHTMLDocument;
  v5 = -[HMHTMLDocument init](&v10, sel_init);
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

- (HMHTMLDocument)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  HMHTMLDocument *v7;
  _HMDocument *v8;
  _HMDocument *document;
  HMHTMLDocument *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMHTMLDocument;
  v7 = -[HMHTMLDocument init](&v12, sel_init);
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

- (HMHTMLDocument)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  HMHTMLDocument *v7;
  _HMDocument *v8;
  _HMDocument *document;
  HMHTMLDocument *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMHTMLDocument;
  v7 = -[HMHTMLDocument init](&v12, sel_init);
  if (v7
    && (v8 = -[_HMDocument initWithURL:error:]([_HMDocument alloc], "initWithURL:error:", v6, a4),
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

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMHTMLDocument stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMHTMLDocument *v4;
  HMHTMLDocument *v5;
  HMHTMLDocument *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMHTMLDocument *)a3;
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
      -[HMHTMLDocument document](self, "document");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMHTMLDocument document](v6, "document");
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

  -[HMHTMLDocument document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSAttributedString)attributedString
{
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
  void *v20;
  id v22;
  id v23;
  _QWORD v24[2];
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!UIKitLibraryCore_frameworkLibrary_38562)
  {
    v25 = xmmword_1E3AB3BA0;
    v26 = 0;
    UIKitLibraryCore_frameworkLibrary_38562 = _sl_dlopen();
  }
  if (UIKitLibraryCore_frameworkLibrary_38562)
  {
    -[HMHTMLDocument stringValue](self, "stringValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "fastestEncoding");

    -[HMHTMLDocument stringValue](self, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataUsingEncoding:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x1E0CB3498]);
    *(_QWORD *)&v25 = 0;
    *((_QWORD *)&v25 + 1) = &v25;
    v26 = 0x2020000000;
    v8 = (id *)getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_38565;
    v27 = getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_38565;
    if (!getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_38565)
    {
      v9 = (void *)UIKitLibrary_38566();
      v8 = (id *)dlsym(v9, "NSDocumentTypeDocumentAttribute");
      *(_QWORD *)(*((_QWORD *)&v25 + 1) + 24) = v8;
      getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_38565 = (uint64_t)v8;
    }
    _Block_object_dispose(&v25, 8);
    if (!v8)
      goto LABEL_16;
    v10 = *v8;
    v22 = v10;
    *(_QWORD *)&v25 = 0;
    *((_QWORD *)&v25 + 1) = &v25;
    v26 = 0x2020000000;
    v11 = (id *)getNSHTMLTextDocumentTypeSymbolLoc_ptr;
    v27 = getNSHTMLTextDocumentTypeSymbolLoc_ptr;
    if (!getNSHTMLTextDocumentTypeSymbolLoc_ptr)
    {
      v12 = (void *)UIKitLibrary_38566();
      v11 = (id *)dlsym(v12, "NSHTMLTextDocumentType");
      *(_QWORD *)(*((_QWORD *)&v25 + 1) + 24) = v11;
      getNSHTMLTextDocumentTypeSymbolLoc_ptr = (uint64_t)v11;
    }
    _Block_object_dispose(&v25, 8);
    if (!v11)
      goto LABEL_16;
    v13 = *v11;
    v24[0] = v13;
    *(_QWORD *)&v25 = 0;
    *((_QWORD *)&v25 + 1) = &v25;
    v26 = 0x2020000000;
    v14 = (id *)getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_38570;
    v27 = getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_38570;
    if (!getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_38570)
    {
      v15 = (void *)UIKitLibrary_38566();
      v14 = (id *)dlsym(v15, "NSCharacterEncodingDocumentAttribute");
      *(_QWORD *)(*((_QWORD *)&v25 + 1) + 24) = v14;
      getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_38570 = (uint64_t)v14;
    }
    _Block_object_dispose(&v25, 8);
    if (!v14)
    {
LABEL_16:
      dlerror();
      abort_report_np();
      __break(1u);
    }
    v23 = *v14;
    v16 = (void *)MEMORY[0x1E0CB37E8];
    v17 = v23;
    objc_msgSend(v16, "numberWithUnsignedInteger:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v22, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v7, "initWithData:options:documentAttributes:error:", v6, v19, 0, 0);

  }
  else
  {
    v20 = 0;
  }
  return (NSAttributedString *)v20;
}

- (BOOL)validateAndReturnError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;

  -[HMHTMLDocument stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeOfString:options:", CFSTR("<!DOCTYPE"), 1);

  -[HMHTMLDocument stringValue](self, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 1;
    v11 = objc_msgSend(v7, "rangeOfString:options:", CFSTR("<!DOCTYPE html"), 1);

    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      return v10;
    if (a3)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = CFSTR("Invalid value type.");
      v14 = CFSTR("Invalid Doctype.");
      v15 = 43;
LABEL_9:
      objc_msgSend(v12, "hmErrorWithCode:description:reason:suggestion:", v15, v13, v14, 0);
      v10 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v10;
    }
    return 0;
  }
  v9 = objc_msgSend(v7, "containsString:", CFSTR("<html>"));

  if ((v9 & 1) == 0)
  {
    if (a3)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = CFSTR("Not found.");
      v14 = CFSTR("Failed to find valid html tag.");
      v15 = 2;
      goto LABEL_9;
    }
    return 0;
  }
  return 1;
}

- (HMHTMLDocument)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMHTMLDocument *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.stringValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMHTMLDocument initWithString:](self, "initWithString:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMHTMLDocument stringValue](self, "stringValue");
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
