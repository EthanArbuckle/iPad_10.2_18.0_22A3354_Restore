@implementation EDSearchableIndexRichLinkItemMetadatum

- (EDSearchableIndexRichLinkItemMetadatum)initWithDomainIdentifier:(id)a3 accountIdentifier:(id)a4 mailboxIdentifiers:(id)a5 senderAddress:(id)a6 recipientAddresses:(id)a7 dateReceived:(id)a8 dateSent:(id)a9 url:(id)a10 richLinkID:(id)a11 title:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  EDSearchableIndexRichLinkItemMetadatum *v24;
  uint64_t v25;
  NSString *domainIdentifier;
  uint64_t v27;
  NSString *accountIdentifier;
  uint64_t v29;
  NSArray *mailboxIdentifiers;
  uint64_t v31;
  NSString *senderAddress;
  uint64_t v33;
  NSArray *recipientAddresses;
  uint64_t v35;
  NSString *url;
  uint64_t v37;
  EDPersistedRichLinkID *richLinkID;
  uint64_t v39;
  NSString *title;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;

  v45 = a3;
  v44 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v43 = a8;
  v42 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v46.receiver = self;
  v46.super_class = (Class)EDSearchableIndexRichLinkItemMetadatum;
  v24 = -[EDSearchableIndexRichLinkItemMetadatum init](&v46, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v45, "copy", v42, v43);
    domainIdentifier = v24->_domainIdentifier;
    v24->_domainIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v44, "copy");
    accountIdentifier = v24->_accountIdentifier;
    v24->_accountIdentifier = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    mailboxIdentifiers = v24->_mailboxIdentifiers;
    v24->_mailboxIdentifiers = (NSArray *)v29;

    v31 = objc_msgSend(v19, "copy");
    senderAddress = v24->_senderAddress;
    v24->_senderAddress = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    recipientAddresses = v24->_recipientAddresses;
    v24->_recipientAddresses = (NSArray *)v33;

    objc_storeStrong((id *)&v24->_dateReceived, a8);
    objc_storeStrong((id *)&v24->_dateSent, a9);
    v35 = objc_msgSend(v21, "copy");
    url = v24->_url;
    v24->_url = (NSString *)v35;

    v37 = objc_msgSend(v22, "copy");
    richLinkID = v24->_richLinkID;
    v24->_richLinkID = (EDPersistedRichLinkID *)v37;

    v39 = objc_msgSend(v23, "copy");
    title = v24->_title;
    v24->_title = (NSString *)v39;

  }
  return v24;
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

- (NSString)title
{
  return self->_title;
}

- (EDPersistedRichLinkID)richLinkID
{
  return self->_richLinkID;
}

- (NSString)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_richLinkID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_mailboxIdentifiers, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

@end
