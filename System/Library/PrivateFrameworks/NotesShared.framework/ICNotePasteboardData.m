@implementation ICNotePasteboardData

- (ICNotePasteboardData)init
{
  -[ICNotePasteboardData doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICNotePasteboardData)initWithAttributedStringData:(id)a3 dataPersister:(id)a4
{
  id v7;
  id v8;
  ICNotePasteboardData *v9;
  ICNotePasteboardData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICNotePasteboardData;
  v9 = -[ICNotePasteboardData init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attributedStringData, a3);
    objc_storeStrong((id *)&v10->_dataPersister, a4);
  }

  return v10;
}

- (id)persistenceData
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

+ (id)pasteboardDataFromPersistenceData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  id v17;

  v3 = (objc_class *)MEMORY[0x1E0CB3710];
  v4 = a3;
  v17 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initForReadingFromData:error:", v4, &v17);

  v6 = v17;
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ICNotePasteboardData pasteboardDataFromPersistenceData:].cold.2((uint64_t)v6, v7);

  }
  objc_opt_class();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_9;
  objc_msgSend(v9, "dataPersister");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v11 = (void *)v10,
        objc_msgSend(v9, "dataPersister"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "verifyDataFiles"),
        v12,
        v11,
        v13))
  {
    v14 = v9;
  }
  else
  {
LABEL_9:
    v15 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[ICNotePasteboardData pasteboardDataFromPersistenceData:].cold.1(v15);

    v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICNotePasteboardData)initWithCoder:(id)a3
{
  id v4;
  ICNotePasteboardData *v5;
  void *v6;
  uint64_t v7;
  NSData *attributedStringData;
  void *v9;
  uint64_t v10;
  ICDataPersister *dataPersister;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICNotePasteboardData;
  v5 = -[ICNotePasteboardData init](&v13, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributedStringData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v7 = objc_claimAutoreleasedReturnValue();
    attributedStringData = v5->_attributedStringData;
    v5->_attributedStringData = (NSData *)v7;

    objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataPersister"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v10 = objc_claimAutoreleasedReturnValue();
    dataPersister = v5->_dataPersister;
    v5->_dataPersister = (ICDataPersister *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ICNotePasteboardData attributedStringData](self, "attributedStringData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("attributedStringData"));

  -[ICNotePasteboardData dataPersister](self, "dataPersister");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICNotePasteboardData dataPersister](self, "dataPersister");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("dataPersister"));

  }
}

- (NSData)attributedStringData
{
  return self->_attributedStringData;
}

- (ICDataPersister)dataPersister
{
  return self->_dataPersister;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataPersister, 0);
  objc_storeStrong((id *)&self->_attributedStringData, 0);
}

+ (void)pasteboardDataFromPersistenceData:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Missing data files for pasteboard data", v1, 2u);
}

+ (void)pasteboardDataFromPersistenceData:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "Error creating unarchiver: %@", (uint8_t *)&v2, 0xCu);
}

@end
