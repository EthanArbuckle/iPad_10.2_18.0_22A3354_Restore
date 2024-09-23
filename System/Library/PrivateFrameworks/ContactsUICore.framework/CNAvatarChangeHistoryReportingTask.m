@implementation CNAvatarChangeHistoryReportingTask

- (CNAvatarChangeHistoryReportingTask)initWithIdentifiers:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  CNAvatarChangeHistoryReportingTask *v8;
  uint64_t v9;
  NSArray *identifiers;
  CNAvatarChangeHistoryReportingTask *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNAvatarChangeHistoryReportingTask;
  v8 = -[CNTask initWithName:](&v13, sel_initWithName_, CFSTR("com.apple.contacts.ui.avatar-cache.change-history-reporting"));
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifiers = v8->_identifiers;
    v8->_identifiers = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_delegate, a4);
    v11 = v8;
  }

  return v8;
}

- (id)run:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = *MEMORY[0x1E0D137F8];
  -[CNAvatarChangeHistoryReportingTask identifiers](self, "identifiers", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if ((v4 & 1) == 0)
  {
    -[CNAvatarChangeHistoryReportingTask delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarChangeHistoryReportingTask identifiers](self, "identifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateContactsWithIdentifiers:", v7);

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (CNAvatarCacheChangeListenerDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
