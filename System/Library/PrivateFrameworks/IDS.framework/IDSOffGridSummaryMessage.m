@implementation IDSOffGridSummaryMessage

- (IDSOffGridSummaryMessage)initWithSummary:(id)a3 totalPendingMessagesCount:(id)a4
{
  id v7;
  id v8;
  IDSOffGridSummaryMessage *v9;
  id *p_isa;
  IDSOffGridSummaryMessage *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)IDSOffGridSummaryMessage;
    v9 = -[IDSOffGridSummaryMessage init](&v13, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_pendingCounts, a3);
      objc_storeStrong(p_isa + 1, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOffGridSummaryMessage)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  IDSOffGridSummaryMessage *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("pc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tc"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[IDSOffGridSummaryMessage initWithSummary:totalPendingMessagesCount:]([IDSOffGridSummaryMessage alloc], "initWithSummary:totalPendingMessagesCount:", v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *pendingCounts;
  id v5;

  pendingCounts = self->_pendingCounts;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", pendingCounts, CFSTR("pc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalPendingMessagesCount, CFSTR("tc"));

}

- (NSNumber)totalPendingMessagesCount
{
  return self->_totalPendingMessagesCount;
}

- (NSDictionary)pendingCounts
{
  return self->_pendingCounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCounts, 0);
  objc_storeStrong((id *)&self->_totalPendingMessagesCount, 0);
}

@end
