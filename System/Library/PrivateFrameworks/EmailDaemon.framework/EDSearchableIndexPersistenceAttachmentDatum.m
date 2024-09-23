@implementation EDSearchableIndexPersistenceAttachmentDatum

- (EDSearchableIndexPersistenceAttachmentDatum)initWithAttachmentPersistentID:(id)a3 messagePersistentID:(id)a4 attachmentID:(id)a5 name:(id)a6 mailboxID:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  EDSearchableIndexPersistenceAttachmentDatum *v16;
  uint64_t v17;
  EDPersistedAttachmentID *attachmentPersistentID;
  uint64_t v19;
  EDPersistedMessageID *messagePersistentID;
  uint64_t v21;
  NSString *attachmentID;
  uint64_t v23;
  NSString *name;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)EDSearchableIndexPersistenceAttachmentDatum;
  v16 = -[EDSearchableIndexPersistenceAttachmentDatum init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    attachmentPersistentID = v16->_attachmentPersistentID;
    v16->_attachmentPersistentID = (EDPersistedAttachmentID *)v17;

    v19 = objc_msgSend(v13, "copy");
    messagePersistentID = v16->_messagePersistentID;
    v16->_messagePersistentID = (EDPersistedMessageID *)v19;

    v21 = objc_msgSend(v14, "copy");
    attachmentID = v16->_attachmentID;
    v16->_attachmentID = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    name = v16->_name;
    v16->_name = (NSString *)v23;

    v16->_mailboxID = a7;
  }

  return v16;
}

- (EDPersistedAttachmentID)attachmentPersistentID
{
  return self->_attachmentPersistentID;
}

- (EDPersistedMessageID)messagePersistentID
{
  return self->_messagePersistentID;
}

- (NSString)attachmentID
{
  return self->_attachmentID;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)mailboxID
{
  return self->_mailboxID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
  objc_storeStrong((id *)&self->_messagePersistentID, 0);
  objc_storeStrong((id *)&self->_attachmentPersistentID, 0);
}

@end
