@implementation MFMailboxProvider

- (id)_transformMailbox:(id)a3 legacyMailboxToMailboxMap:(id)a4 objectIDToLegacyMailboxMap:(id)a5
{
  -[MFMailboxUidTransformer transformMailboxUid:uidToMailboxMap:objectIDToUidMap:](self->_mailboxUidTransformer, "transformMailboxUid:uidToMailboxMap:objectIDToUidMap:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_fetchMailboxesForAccount:(id)a3
{
  objc_msgSend(a3, "forceFetchMailboxList");
}

- (id)legacyMailboxForObjectID:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFMailboxProvider;
  -[EDMailboxProvider legacyMailboxForObjectID:](&v4, sel_legacyMailboxForObjectID_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MFMailboxProvider)initWithAccountsProvider:(id)a3
{
  id v4;
  MFMailboxProvider *v5;
  MFMailboxUidTransformer *v6;
  MFMailboxUidTransformer *mailboxUidTransformer;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFMailboxProvider;
  v5 = -[EDMailboxProvider initWithAccountsProvider:](&v15, sel_initWithAccountsProvider_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(MFMailboxUidTransformer);
    mailboxUidTransformer = v5->_mailboxUidTransformer;
    v5->_mailboxUidTransformer = v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__mailboxInvalidated_, CFSTR("MailboxUidDidBecomeInvalidNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v5, sel__didChangeMailboxList_, CFSTR("AccountMailboxListingDidChange"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v5, sel__willReloadMailboxList_, CFSTR("AccountMailboxListingWillLoad"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v5, sel__didReloadMailboxList_, CFSTR("AccountMailboxListingDidLoad"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel__willFetchMailboxList_, CFSTR("AccountMailboxListingWillFetch"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v5, sel__didFetchMailboxList_, CFSTR("AccountMailboxListingDidFetch"), 0);

  }
  return v5;
}

- (void)test_tearDown
{
  void *v4;
  void *v5;
  objc_super v6;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailboxProvider.m"), 40, CFSTR("%s can only be called from unit tests"), "-[MFMailboxProvider test_tearDown]");

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)MFMailboxProvider;
  -[EDMailboxProvider test_tearDown](&v6, sel_test_tearDown);
}

- (MFMailboxUidTransformer)mailboxUidTransformer
{
  return self->_mailboxUidTransformer;
}

- (void)setMailboxUidTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxUidTransformer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxUidTransformer, 0);
}

@end
