@implementation _ICNAAttachmentReportToAccount

- (_ICNAAttachmentReportToAccount)init
{
  _ICNAAttachmentReportToAccount *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *countOfAttachmentByUTI;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ICNAAttachmentReportToAccount;
  v2 = -[_ICNAAttachmentReportToAccount init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    countOfAttachmentByUTI = v2->_countOfAttachmentByUTI;
    v2->_countOfAttachmentByUTI = v3;

  }
  return v2;
}

- (void)reportAttachmentTypeUTI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = a3;
    -[_ICNAAttachmentReportToAccount countOfAttachmentByUTI](self, "countOfAttachmentByUTI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 + 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[_ICNAAttachmentReportToAccount countOfAttachmentByUTI](self, "countOfAttachmentByUTI");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v4);

  }
}

- (id)attachmentUTISummary
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_ICNAAttachmentReportToAccount countOfAttachmentByUTI](self, "countOfAttachmentByUTI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54___ICNAAttachmentReportToAccount_attachmentUTISummary__block_invoke;
  v6[3] = &unk_1E771BF90;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NSMutableDictionary)countOfAttachmentByUTI
{
  return self->_countOfAttachmentByUTI;
}

- (void)setCountOfAttachmentByUTI:(id)a3
{
  objc_storeStrong((id *)&self->_countOfAttachmentByUTI, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countOfAttachmentByUTI, 0);
}

@end
