@implementation EDSearchableIndexAttachmentItemMetadatum

- (EDSearchableIndexAttachmentItemMetadatum)initWithAttachmentFileURL:(id)a3 name:(id)a4 domainIdentifier:(id)a5 accountIdentifier:(id)a6 mailboxIdentifiers:(id)a7 messageIDHeader:(id)a8 senderAddress:(id)a9 recipientAddresses:(id)a10 dateReceived:(id)a11 dateSent:(id)a12
{
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  EDSearchableIndexAttachmentItemMetadatum *v25;
  EDSearchableIndexAttachmentItemMetadatum *v26;
  uint64_t v27;
  NSString *name;
  uint64_t v29;
  NSString *domainIdentifier;
  uint64_t v31;
  NSString *accountIdentifier;
  uint64_t v33;
  NSArray *mailboxIdentifiers;
  uint64_t v35;
  NSString *messageIDHeader;
  uint64_t v37;
  NSString *senderAddress;
  uint64_t v39;
  NSArray *recipientAddresses;
  id v43;
  id v44;
  id v45;
  id v46;
  objc_super v47;

  v44 = a3;
  v46 = a4;
  v18 = a5;
  v45 = a6;
  v19 = a7;
  v20 = a8;
  v21 = v18;
  v22 = a9;
  v23 = a10;
  v43 = a11;
  v24 = a12;
  v47.receiver = self;
  v47.super_class = (Class)EDSearchableIndexAttachmentItemMetadatum;
  v25 = -[EDSearchableIndexAttachmentItemMetadatum init](&v47, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_attachmentFileURL, a3);
    v27 = objc_msgSend(v46, "copy");
    name = v26->_name;
    v26->_name = (NSString *)v27;

    v29 = objc_msgSend(v21, "copy");
    domainIdentifier = v26->_domainIdentifier;
    v26->_domainIdentifier = (NSString *)v29;

    v31 = objc_msgSend(v45, "copy");
    accountIdentifier = v26->_accountIdentifier;
    v26->_accountIdentifier = (NSString *)v31;

    v33 = objc_msgSend(v19, "copy");
    mailboxIdentifiers = v26->_mailboxIdentifiers;
    v26->_mailboxIdentifiers = (NSArray *)v33;

    v35 = objc_msgSend(v20, "copy");
    messageIDHeader = v26->_messageIDHeader;
    v26->_messageIDHeader = (NSString *)v35;

    v37 = objc_msgSend(v22, "copy");
    senderAddress = v26->_senderAddress;
    v26->_senderAddress = (NSString *)v37;

    v39 = objc_msgSend(v23, "copy");
    recipientAddresses = v26->_recipientAddresses;
    v26->_recipientAddresses = (NSArray *)v39;

    objc_storeStrong((id *)&v26->_dateReceived, a11);
    objc_storeStrong((id *)&v26->_dateSent, a12);
  }

  return v26;
}

- (BOOL)canReadAttachmentFile
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[EDSearchableIndexAttachmentItemMetadatum attachmentFileURL](self, "attachmentFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isFileURL") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isReadableFileAtPath:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (UTType)contentType
{
  UTType *contentType;
  void *v4;
  void *v5;
  void *v6;
  UTType *v7;
  UTType *v8;

  contentType = self->_contentType;
  if (!contentType)
  {
    v4 = (void *)MEMORY[0x1E0CEC3F8];
    -[EDSearchableIndexAttachmentItemMetadatum name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSearchableIndexAttachmentItemMetadatum attachmentFileURL](self, "attachmentFileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "em_contentTypeForFilename:fileURL:", v5, v6);
    v7 = (UTType *)objc_claimAutoreleasedReturnValue();
    v8 = self->_contentType;
    self->_contentType = v7;

    contentType = self->_contentType;
  }
  return contentType;
}

- (NSURL)attachmentFileURL
{
  return self->_attachmentFileURL;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSArray)mailboxIdentifiers
{
  return self->_mailboxIdentifiers;
}

- (NSString)messageIDHeader
{
  return self->_messageIDHeader;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (NSArray)recipientAddresses
{
  return self->_recipientAddresses;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_messageIDHeader, 0);
  objc_storeStrong((id *)&self->_mailboxIdentifiers, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attachmentFileURL, 0);
}

@end
