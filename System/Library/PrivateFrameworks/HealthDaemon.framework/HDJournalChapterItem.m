@implementation HDJournalChapterItem

- (HDJournalChapterItem)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDJournalChapterItem)initWithEntryClassName:(id)a3 serializedEntryData:(id)a4
{
  id v6;
  id v7;
  HDJournalChapterItem *v8;
  uint64_t v9;
  NSString *entryClassName;
  uint64_t v11;
  NSData *serializedEntryData;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDJournalChapterItem;
  v8 = -[HDJournalChapterItem init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    entryClassName = v8->_entryClassName;
    v8->_entryClassName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    serializedEntryData = v8->_serializedEntryData;
    v8->_serializedEntryData = (NSData *)v11;

  }
  return v8;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDJournalChapterItem;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@ %ld>"), -[HDJournalChapterItem class](&v3, sel_class), self, self->_entryClassName, -[NSData length](self->_serializedEntryData, "length"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)size
{
  return -[NSData length](self->_serializedEntryData, "length");
}

- (id)deserializedEntryWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), self->_serializedEntryData, a3);
}

- (NSString)entryClassName
{
  return self->_entryClassName;
}

- (NSData)serializedEntryData
{
  return self->_serializedEntryData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedEntryData, 0);
  objc_storeStrong((id *)&self->_entryClassName, 0);
}

@end
