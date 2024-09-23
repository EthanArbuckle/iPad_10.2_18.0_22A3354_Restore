@implementation MFMessageReferenceContext

- (ECEmailAddressConvertible)sender
{
  ECEmailAddressConvertible *sender;

  sender = self->_sender;
  if (sender)
    return sender;
  MFDatabaseEncodedStringForAddressList(self->_senderList);
  return (ECEmailAddressConvertible *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSender:(id)a3
{
  ECEmailAddressConvertible *v4;
  ECEmailAddressConvertible *v5;
  ECEmailAddressConvertible *sender;
  NSArray *senderList;
  ECEmailAddressConvertible *v8;

  v4 = (ECEmailAddressConvertible *)a3;
  if (self->_sender != v4)
  {
    v8 = v4;
    v5 = (ECEmailAddressConvertible *)-[ECEmailAddressConvertible copy](v4, "copy");
    sender = self->_sender;
    self->_sender = v5;

    senderList = self->_senderList;
    self->_senderList = 0;

    v4 = v8;
  }

}

- (NSArray)senderList
{
  NSArray *senderList;
  NSArray *v3;
  void *v4;

  senderList = self->_senderList;
  if (senderList)
  {
    v3 = senderList;
  }
  else
  {
    -[ECEmailAddressConvertible stringValue](self->_sender, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MFAddressListFromDatabaseEncodedString(v4);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setSenderList:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *senderList;
  ECEmailAddressConvertible *sender;
  NSArray *v8;

  v4 = (NSArray *)a3;
  if (self->_senderList != v4)
  {
    v8 = v4;
    v5 = (NSArray *)-[NSArray copy](v4, "copy");
    senderList = self->_senderList;
    self->_senderList = v5;

    sender = self->_sender;
    self->_sender = 0;

    v4 = v8;
  }

}

- (ECEmailAddressConvertible)to
{
  ECEmailAddressConvertible *to;

  to = self->_to;
  if (to)
    return to;
  MFDatabaseEncodedStringForAddressList(self->_toList);
  return (ECEmailAddressConvertible *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setTo:(id)a3
{
  ECEmailAddressConvertible *v4;
  ECEmailAddressConvertible *v5;
  ECEmailAddressConvertible *to;
  NSArray *toList;
  ECEmailAddressConvertible *v8;

  v4 = (ECEmailAddressConvertible *)a3;
  if (self->_to != v4)
  {
    v8 = v4;
    v5 = (ECEmailAddressConvertible *)-[ECEmailAddressConvertible copy](v4, "copy");
    to = self->_to;
    self->_to = v5;

    toList = self->_toList;
    self->_toList = 0;

    v4 = v8;
  }

}

- (NSArray)toList
{
  NSArray *toList;
  NSArray *v3;
  void *v4;

  toList = self->_toList;
  if (toList)
  {
    v3 = toList;
  }
  else
  {
    -[ECEmailAddressConvertible stringValue](self->_to, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MFAddressListFromDatabaseEncodedString(v4);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setToList:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *toList;
  ECEmailAddressConvertible *to;
  NSArray *v8;

  v4 = (NSArray *)a3;
  if (self->_toList != v4)
  {
    v8 = v4;
    v5 = (NSArray *)-[NSArray copy](v4, "copy");
    toList = self->_toList;
    self->_toList = v5;

    to = self->_to;
    self->_to = 0;

    v4 = v8;
  }

}

- (ECEmailAddressConvertible)cc
{
  ECEmailAddressConvertible *cc;

  cc = self->_cc;
  if (cc)
    return cc;
  MFDatabaseEncodedStringForAddressList(self->_ccList);
  return (ECEmailAddressConvertible *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setCc:(id)a3
{
  ECEmailAddressConvertible *v4;
  ECEmailAddressConvertible *v5;
  ECEmailAddressConvertible *cc;
  NSArray *ccList;
  ECEmailAddressConvertible *v8;

  v4 = (ECEmailAddressConvertible *)a3;
  if (self->_cc != v4)
  {
    v8 = v4;
    v5 = (ECEmailAddressConvertible *)-[ECEmailAddressConvertible copy](v4, "copy");
    cc = self->_cc;
    self->_cc = v5;

    ccList = self->_ccList;
    self->_ccList = 0;

    v4 = v8;
  }

}

- (NSArray)ccList
{
  NSArray *ccList;
  NSArray *v3;
  void *v4;

  ccList = self->_ccList;
  if (ccList)
  {
    v3 = ccList;
  }
  else
  {
    -[ECEmailAddressConvertible stringValue](self->_cc, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MFAddressListFromDatabaseEncodedString(v4);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setCcList:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *ccList;
  ECEmailAddressConvertible *cc;
  NSArray *v8;

  v4 = (NSArray *)a3;
  if (self->_ccList != v4)
  {
    v8 = v4;
    v5 = (NSArray *)-[NSArray copy](v4, "copy");
    ccList = self->_ccList;
    self->_ccList = v5;

    cc = self->_cc;
    self->_cc = 0;

    v4 = v8;
  }

}

- (ECEmailAddressConvertible)bcc
{
  ECEmailAddressConvertible *bcc;

  bcc = self->_bcc;
  if (bcc)
    return bcc;
  MFDatabaseEncodedStringForAddressList(self->_bccList);
  return (ECEmailAddressConvertible *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setBcc:(id)a3
{
  ECEmailAddressConvertible *v4;
  ECEmailAddressConvertible *v5;
  ECEmailAddressConvertible *bcc;
  NSArray *bccList;
  ECEmailAddressConvertible *v8;

  v4 = (ECEmailAddressConvertible *)a3;
  if (self->_bcc != v4)
  {
    v8 = v4;
    v5 = (ECEmailAddressConvertible *)-[ECEmailAddressConvertible copy](v4, "copy");
    bcc = self->_bcc;
    self->_bcc = v5;

    bccList = self->_bccList;
    self->_bccList = 0;

    v4 = v8;
  }

}

- (NSArray)bccList
{
  NSArray *bccList;
  NSArray *v3;
  void *v4;

  bccList = self->_bccList;
  if (bccList)
  {
    v3 = bccList;
  }
  else
  {
    -[ECEmailAddressConvertible stringValue](self->_bcc, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MFAddressListFromDatabaseEncodedString(v4);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setBccList:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *bccList;
  ECEmailAddressConvertible *bcc;
  NSArray *v8;

  v4 = (NSArray *)a3;
  if (self->_bccList != v4)
  {
    v8 = v4;
    v5 = (NSArray *)-[NSArray copy](v4, "copy");
    bccList = self->_bccList;
    self->_bccList = v5;

    bcc = self->_bcc;
    self->_bcc = 0;

    v4 = v8;
  }

}

- (NSSet)participants
{
  id v3;
  id v4;
  void (**v5)(void *, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSSet *v10;
  _QWORD aBlock[4];
  id v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__MFMessageReferenceContext_participants__block_invoke;
  aBlock[3] = &unk_1E4E8CED0;
  v4 = v3;
  v13 = v4;
  v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[MFMessageReferenceContext senderList](self, "senderList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6);

  -[MFMessageReferenceContext toList](self, "toList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v7);

  -[MFMessageReferenceContext ccList](self, "ccList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v8);

  -[MFMessageReferenceContext bccList](self, "bccList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v9);

  v10 = (NSSet *)v4;
  return v10;
}

void __41__MFMessageReferenceContext_participants__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__MFMessageReferenceContext_participants__block_invoke_2;
  v3[3] = &unk_1E4E8E250;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v3);

}

void __41__MFMessageReferenceContext_participants__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10 = v3;
  objc_msgSend(v10, "emailAddressValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "simpleAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v10, "stringValue");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v4, "addObject:", v9);
}

- (MFMailMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (int64_t)libraryID
{
  return self->_libraryID;
}

- (void)setLibraryID:(int64_t)a3
{
  self->_libraryID = a3;
}

- (int64_t)messageIDHash
{
  return self->_messageIDHash;
}

- (void)setMessageIDHash:(int64_t)a3
{
  self->_messageIDHash = a3;
}

- (ECSubject)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (EFMutableInt64Set)references
{
  return self->_references;
}

- (void)setReferences:(id)a3
{
  objc_storeStrong((id *)&self->_references, a3);
}

- (NSMutableDictionary)messageIDsBySubject
{
  return self->_messageIDsBySubject;
}

- (void)setMessageIDsBySubject:(id)a3
{
  objc_storeStrong((id *)&self->_messageIDsBySubject, a3);
}

- (int64_t)mailboxID
{
  return self->_mailboxID;
}

- (void)setMailboxID:(int64_t)a3
{
  self->_mailboxID = a3;
}

- (int64_t)conversationIDHash
{
  return self->_conversationIDHash;
}

- (void)setConversationIDHash:(int64_t)a3
{
  self->_conversationIDHash = a3;
}

- (unint64_t)conversationFlagsRef
{
  return self->_conversationFlagsRef;
}

- (void)setConversationFlagsRef:(unint64_t *)a3
{
  self->_conversationFlagsRef = a3;
}

- (double)dateSentInterval
{
  return self->_dateSentInterval;
}

- (void)setDateSentInterval:(double)a3
{
  self->_dateSentInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIDsBySubject, 0);
  objc_storeStrong((id *)&self->_references, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_bccList, 0);
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_ccList, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_toList, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_senderList, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

@end
