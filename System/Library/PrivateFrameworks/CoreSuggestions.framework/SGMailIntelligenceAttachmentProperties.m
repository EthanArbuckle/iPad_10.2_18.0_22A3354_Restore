@implementation SGMailIntelligenceAttachmentProperties

- (SGMailIntelligenceAttachmentProperties)initWithFileName:(id)a3 fileSizeInBytes:(id)a4 fileDescription:(id)a5 keywords:(id)a6 authors:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SGMailIntelligenceAttachmentProperties *v17;
  SGMailIntelligenceAttachmentProperties *v18;
  void *v20;
  void *v21;
  id v23;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v23 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMailIntelligenceWarning.m"), 533, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileName != nil"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMailIntelligenceWarning.m"), 534, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileSizeInBytes != nil"));

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)SGMailIntelligenceAttachmentProperties;
  v17 = -[SGMailIntelligenceAttachmentProperties init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fileName, a3);
    objc_storeStrong((id *)&v18->_fileSizeInBytes, a4);
    objc_storeStrong((id *)&v18->_fileDescription, a5);
    objc_storeStrong((id *)&v18->_keywords, a6);
    objc_storeStrong((id *)&v18->_authors, a7);
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *fileName;
  id v5;

  fileName = self->_fileName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fileName, CFSTR("fileName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileSizeInBytes, CFSTR("fileSizeInBytes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileDescription, CFSTR("fileDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keywords, CFSTR("keywords"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authors, CFSTR("authors"));

}

- (SGMailIntelligenceAttachmentProperties)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  SGMailIntelligenceAttachmentProperties *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  void *v33;
  uint64_t v34;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = objc_opt_class();
  sgMailIntelligenceLogHandle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v5, CFSTR("fileName"), v3, 0, v6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D81610];
  v8 = objc_opt_class();
  sgMailIntelligenceLogHandle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, CFSTR("fileSizeInBytes"), v3, 1, CFSTR("SGErrorDomain"), 11, v9);
  v34 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D81610];
  v11 = objc_opt_class();
  sgMailIntelligenceLogHandle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v11, CFSTR("fileDescription"), v3, 0, CFSTR("SGErrorDomain"), 11, v12);
  v32 = objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D81610];
  v14 = (void *)MEMORY[0x1A8583A40]();
  v15 = objc_alloc(MEMORY[0x1E0C99E60]);
  v16 = objc_opt_class();
  v17 = (void *)objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v14);
  sgMailIntelligenceLogHandle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("keywords"), v3, 0, CFSTR("SGErrorDomain"), 11, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D81610];
  v21 = (void *)MEMORY[0x1A8583A40]();
  v22 = objc_alloc(MEMORY[0x1E0C99E60]);
  v23 = objc_opt_class();
  v24 = (void *)objc_msgSend(v22, "initWithObjects:", v23, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v21);
  sgMailIntelligenceLogHandle();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v24, CFSTR("authors"), v3, 0, CFSTR("SGErrorDomain"), 11, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  if (!v33)
  {
    v28 = (void *)v34;
    goto LABEL_10;
  }
  v28 = (void *)v34;
  if (!v34)
  {
LABEL_10:
    v29 = (void *)v32;
    goto LABEL_11;
  }
  v29 = (void *)v32;
  if (v32 && v19 && v26)
  {
    objc_msgSend(v3, "error");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
      v27 = 0;
    else
      v27 = -[SGMailIntelligenceAttachmentProperties initWithFileName:fileSizeInBytes:fileDescription:keywords:authors:]([SGMailIntelligenceAttachmentProperties alloc], "initWithFileName:fileSizeInBytes:fileDescription:keywords:authors:", v33, v34, v32, v19, v26);
  }
LABEL_11:

  return v27;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGMailIntelligenceAttachmentProperties: %@ (%@B) %@>"), self->_fileName, self->_fileSizeInBytes, self->_fileDescription);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (NSNumber)fileSizeInBytes
{
  return self->_fileSizeInBytes;
}

- (NSString)fileDescription
{
  return self->_fileDescription;
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (NSArray)authors
{
  return self->_authors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authors, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_fileDescription, 0);
  objc_storeStrong((id *)&self->_fileSizeInBytes, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
