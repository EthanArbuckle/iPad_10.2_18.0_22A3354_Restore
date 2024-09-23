@implementation EDSearchableIndexPersistenceRichLinkDatum

- (EDSearchableIndexPersistenceRichLinkDatum)initWithMessageID:(id)a3 richLinkID:(id)a4 mailboxID:(int64_t)a5 title:(id)a6 url:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  EDSearchableIndexPersistenceRichLinkDatum *v16;
  uint64_t v17;
  EDPersistedMessageID *messageID;
  uint64_t v19;
  EDPersistedRichLinkID *richLinkID;
  uint64_t v21;
  NSString *title;
  uint64_t v23;
  NSString *url;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)EDSearchableIndexPersistenceRichLinkDatum;
  v16 = -[EDSearchableIndexPersistenceRichLinkDatum init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    messageID = v16->_messageID;
    v16->_messageID = (EDPersistedMessageID *)v17;

    v19 = objc_msgSend(v13, "copy");
    richLinkID = v16->_richLinkID;
    v16->_richLinkID = (EDPersistedRichLinkID *)v19;

    v16->_mailboxID = a5;
    v21 = objc_msgSend(v14, "copy");
    title = v16->_title;
    v16->_title = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    url = v16->_url;
    v16->_url = (NSString *)v23;

  }
  return v16;
}

- (EDPersistedMessageID)messageID
{
  return self->_messageID;
}

- (EDPersistedRichLinkID)richLinkID
{
  return self->_richLinkID;
}

- (int64_t)mailboxID
{
  return self->_mailboxID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_richLinkID, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
}

@end
