@implementation HKCDADocument

- (HKCDADocument)initWithDocumentData:(id)a3 compressedDocumentData:(id)a4 title:(id)a5 patientName:(id)a6 authorName:(id)a7 custodianName:(id)a8
{
  id v15;
  id v16;
  id v17;
  HKCDADocument *v18;
  HKCDADocument *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HKCDADocument;
  v18 = -[HKCDADocument init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_internalDocumentData, a3);
    objc_storeStrong((id *)&v19->_compressedDocumentData, a4);
    v19->_compressionLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v19->_title, a5);
    objc_storeStrong((id *)&v19->_patientName, a6);
    objc_storeStrong((id *)&v19->_authorName, a7);
    objc_storeStrong((id *)&v19->_custodianName, a8);
  }

  return v19;
}

- (HKCDADocument)initWithCoder:(id)a3 omittedContentFlags:(int64_t)a4
{
  char v4;
  id v6;
  HKCDADocument *v7;
  HKCDADocument *v8;
  NSData *internalDocumentData;
  uint64_t v10;
  NSData *compressedDocumentData;
  uint64_t v12;
  uint64_t v13;
  NSString *title;
  uint64_t v15;
  NSString *patientName;
  uint64_t v17;
  NSString *authorName;
  uint64_t v19;
  NSString *custodianName;
  objc_super v22;

  v4 = a4;
  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKCDADocument;
  v7 = -[HKCDADocument init](&v22, sel_init);
  v8 = v7;
  if (v7)
  {
    internalDocumentData = v7->_internalDocumentData;
    v7->_internalDocumentData = 0;

    if ((v4 & 2) != 0)
    {
      compressedDocumentData = v8->_compressedDocumentData;
      v8->_compressedDocumentData = 0;
    }
    else
    {
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compressedDocumentData"));
      v10 = objc_claimAutoreleasedReturnValue();
      compressedDocumentData = v8->_compressedDocumentData;
      v8->_compressedDocumentData = (NSData *)v10;
    }

    v8->_compressionLock._os_unfair_lock_opaque = 0;
    v12 = objc_opt_class();
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v12, CFSTR("title"));
    v13 = objc_claimAutoreleasedReturnValue();
    title = v8->_title;
    v8->_title = (NSString *)v13;

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v12, CFSTR("patient_name"));
    v15 = objc_claimAutoreleasedReturnValue();
    patientName = v8->_patientName;
    v8->_patientName = (NSString *)v15;

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v12, CFSTR("author_name"));
    v17 = objc_claimAutoreleasedReturnValue();
    authorName = v8->_authorName;
    v8->_authorName = (NSString *)v17;

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v12, CFSTR("custodian_name"));
    v19 = objc_claimAutoreleasedReturnValue();
    custodianName = v8->_custodianName;
    v8->_custodianName = (NSString *)v19;

  }
  return v8;
}

- (NSData)documentData
{
  return self->_internalDocumentData;
}

- (id)_compressedDocumentData
{
  return self->_compressedDocumentData;
}

- (id)_validateConfiguration
{
  os_unfair_lock_s *p_compressionLock;
  NSData *compressedDocumentData;
  void *v6;

  p_compressionLock = &self->_compressionLock;
  os_unfair_lock_lock(&self->_compressionLock);
  if (self->_internalDocumentData)
  {
    os_unfair_lock_unlock(p_compressionLock);
  }
  else
  {
    compressedDocumentData = self->_compressedDocumentData;
    os_unfair_lock_unlock(p_compressionLock);
    if (!compressedDocumentData)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("CDA document data must not be nil"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
  }
  v6 = 0;
  return v6;
}

- (BOOL)_compressDocumentDataForTransfer:(id *)a3
{
  os_unfair_lock_s *p_compressionLock;
  BOOL v6;
  NSData *internalDocumentData;
  NSData *v8;
  NSData *compressedDocumentData;
  id v10;

  p_compressionLock = &self->_compressionLock;
  os_unfair_lock_lock(&self->_compressionLock);
  if (self->_compressedDocumentData)
    goto LABEL_2;
  internalDocumentData = self->_internalDocumentData;
  if (!internalDocumentData)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Incorrect state of compression data for HKCDADocumentSample"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_11;
    if (!a3)
      goto LABEL_7;
    goto LABEL_10;
  }
  +[_HKCompressionEngine processDataWithFunction:algorithm:content:progressBlock:](_HKCompressionEngine, "processDataWithFunction:algorithm:content:progressBlock:", 0, 3, internalDocumentData, 0);
  v8 = (NSData *)objc_claimAutoreleasedReturnValue();
  compressedDocumentData = self->_compressedDocumentData;
  self->_compressedDocumentData = v8;

  if (!self->_compressedDocumentData)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to compress HKCDADocumentSample data"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_11:

      v6 = 0;
      goto LABEL_12;
    }
    if (!a3)
    {
LABEL_7:
      _HKLogDroppedError(v10);
      goto LABEL_11;
    }
LABEL_10:
    v10 = objc_retainAutorelease(v10);
    *a3 = v10;
    goto LABEL_11;
  }
LABEL_2:
  v6 = 1;
LABEL_12:
  os_unfair_lock_unlock(p_compressionLock);
  return v6;
}

- (BOOL)_decompressDocumentDataForDelivery:(id *)a3
{
  os_unfair_lock_s *p_compressionLock;
  BOOL v6;
  NSData *compressedDocumentData;
  NSData *v8;
  NSData *internalDocumentData;
  NSData *v10;
  void *v11;
  const __CFString *v12;
  NSData *v13;

  p_compressionLock = &self->_compressionLock;
  os_unfair_lock_lock(&self->_compressionLock);
  if (!self->_internalDocumentData)
  {
    compressedDocumentData = self->_compressedDocumentData;
    if (compressedDocumentData)
    {
      +[_HKCompressionEngine processDataWithFunction:algorithm:content:progressBlock:](_HKCompressionEngine, "processDataWithFunction:algorithm:content:progressBlock:", 1, 3, compressedDocumentData, 0);
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();
      internalDocumentData = self->_internalDocumentData;
      self->_internalDocumentData = v8;

      if (self->_internalDocumentData)
      {
        v10 = self->_compressedDocumentData;
        self->_compressedDocumentData = 0;
        v6 = 1;
LABEL_13:

        goto LABEL_14;
      }
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = CFSTR("Failed to decompress HKCDADocumentSample data");
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = CFSTR("Incorrect state of decompression data for HKCDADocumentSample");
    }
    objc_msgSend(v11, "hk_error:format:", 100, v12);
    v13 = (NSData *)(id)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (v13)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError(v13);
    }

    v6 = 0;
    goto LABEL_13;
  }
  v6 = 1;
LABEL_14:
  os_unfair_lock_unlock(p_compressionLock);
  return v6;
}

- (void)encodeWithCoder:(id)a3 omittedContentFlags:(int64_t)a4
{
  char v4;
  id v7;
  void *v8;
  id v9;

  v4 = a4;
  v7 = a3;
  v9 = v7;
  if ((v4 & 2) == 0)
  {
    os_unfair_lock_lock(&self->_compressionLock);
    if (!self->_compressedDocumentData)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCDADocumentSample.m"), 564, CFSTR("HKCDADocumentSample object does not have compressed data for transfer."));

    }
    objc_msgSend(v9, "encodeObject:forKey:");
    os_unfair_lock_unlock(&self->_compressionLock);
    v7 = v9;
  }
  objc_msgSend(v7, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_patientName, CFSTR("patient_name"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_authorName, CFSTR("author_name"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_custodianName, CFSTR("custodian_name"));

}

- (id)_descriptionFieldTitle:(id)a3 content:(id)a4 maxSize:(unint64_t)a5
{
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "length");
  v10 = v9 - a5;
  if (v9 <= a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"%@\"), v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "substringToIndex:", a5);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"%@...(%ld more)\"), v7, v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)v11;
  }

  return v12;
}

- (id)description
{
  id v3;
  void *v4;
  const __CFString *v5;
  HKCDADocument *v6;
  void *v7;
  uint64_t v8;
  NSData *compressedDocumentData;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  os_unfair_lock_lock(&self->_compressionLock);
  if (self->_internalDocumentData)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_internalDocumentData, 4);
    v5 = CFSTR("documentData");
    v6 = self;
    v7 = v4;
    v8 = 40;
LABEL_5:
    -[HKCDADocument _descriptionFieldTitle:content:maxSize:](v6, "_descriptionFieldTitle:content:maxSize:", v5, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

    goto LABEL_6;
  }
  compressedDocumentData = self->_compressedDocumentData;
  if (compressedDocumentData)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%ld bytes)"), -[NSData length](compressedDocumentData, "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("compressedDocumentData");
    v6 = self;
    v7 = v4;
    v8 = 50;
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock(&self->_compressionLock);
  -[HKCDADocument _descriptionFieldTitle:content:maxSize:](self, "_descriptionFieldTitle:content:maxSize:", CFSTR("title"), self->_title, 25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  -[HKCDADocument _descriptionFieldTitle:content:maxSize:](self, "_descriptionFieldTitle:content:maxSize:", CFSTR("patientName"), self->_patientName, 25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  -[HKCDADocument _descriptionFieldTitle:content:maxSize:](self, "_descriptionFieldTitle:content:maxSize:", CFSTR("authorName"), self->_authorName, 25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  -[HKCDADocument _descriptionFieldTitle:content:maxSize:](self, "_descriptionFieldTitle:content:maxSize:", CFSTR("custodianName"), self->_custodianName, 25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)patientName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)authorName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)custodianName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_custodianName, 0);
  objc_storeStrong((id *)&self->_authorName, 0);
  objc_storeStrong((id *)&self->_patientName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_compressedDocumentData, 0);
  objc_storeStrong((id *)&self->_internalDocumentData, 0);
}

@end
