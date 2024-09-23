@implementation MSSendMailIntent

- (id)_privacySafeDescription
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = objc_alloc(MEMORY[0x1E0D1E6B8]);
  -[MSSendMailIntent sender](self, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v3, "initWithString:", v4);

  v5 = objc_alloc(MEMORY[0x1E0D1E7A0]);
  -[MSSendMailIntent subject](self, "subject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v5, "initWithString:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  -[MSSendMailIntent identifier](self, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ef_publicDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSSendMailIntent to](self, "to");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v21, "count");
  -[MSSendMailIntent cc](self, "cc");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v20, "count");
  -[MSSendMailIntent bcc](self, "bcc");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v19, "count");
  objc_msgSend(v24, "ef_publicDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSSendMailIntent attachments](self, "attachments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  -[MSSendMailIntent isDraft](self, "isDraft");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("draft");
  if (!v15)
    v16 = &stru_1E7171180;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@ %p> ID:%@ Sender:%@ toCount:%lu ccCount:%lu bccCount:%lu subject:%@ attachment:%lu %@"), v8, self, v23, v22, v9, v10, v11, v12, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MSSendMailIntent _privacySafeDescription](self, "_privacySafeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D1EF48];
  -[MSSendMailIntent body](self, "body");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullyOrPartiallyRedactedStringForString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D1EF48];
  -[MSSendMailIntent userTypedContent](self, "userTypedContent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fullyOrPartiallyRedactedStringForString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ body:%@ typedContent:%@"), v4, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

@end
