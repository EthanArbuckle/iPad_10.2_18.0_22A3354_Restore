@implementation MFMailDataMessageStore

+ (Class)classForMimePart
{
  return (Class)objc_opt_class();
}

- (MailAccount)account
{
  return 0;
}

- (MFMailboxUid)mailbox
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailDataMessageStore;
  -[MFDataMessageStore mailboxUid](&v3, sel_mailboxUid);
  return (MFMailboxUid *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldDownloadBodyDataForMessage:(id)a3
{
  return 0;
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(a4, "parentPart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mimeBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "storageLocationForAttachment:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5
{
  return a3;
}

@end
