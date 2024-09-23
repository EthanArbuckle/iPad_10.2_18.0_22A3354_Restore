@implementation EDSearchableIndexDataSample

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[EDSearchableIndexDataSample subject](self, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubject:", v5);

  -[EDSearchableIndexDataSample toEmailAddresses](self, "toEmailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToEmailAddresses:", v6);

  -[EDSearchableIndexDataSample deleted](self, "deleted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeleted:", v7);

  -[EDSearchableIndexDataSample transactionID](self, "transactionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransactionID:", v8);

  -[EDSearchableIndexDataSample flags](self, "flags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlags:", v9);

  -[EDSearchableIndexDataSample indexedAsEmptySubject](self, "indexedAsEmptySubject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIndexedAsEmptySubject:", v10);

  -[EDSearchableIndexDataSample dateReceived](self, "dateReceived");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDateReceived:", v11);

  -[EDSearchableIndexDataSample userInfo](self, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInfo:", v12);

  return v4;
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)toEmailAddresses
{
  return self->_toEmailAddresses;
}

- (void)setToEmailAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(id)a3
{
  objc_storeStrong((id *)&self->_transactionID, a3);
}

- (NSNumber)flags
{
  return self->_flags;
}

- (void)setFlags:(id)a3
{
  objc_storeStrong((id *)&self->_flags, a3);
}

- (NSNumber)indexedAsEmptySubject
{
  return self->_indexedAsEmptySubject;
}

- (void)setIndexedAsEmptySubject:(id)a3
{
  objc_storeStrong((id *)&self->_indexedAsEmptySubject, a3);
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (void)setDateReceived:(id)a3
{
  objc_storeStrong((id *)&self->_dateReceived, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_indexedAsEmptySubject, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_toEmailAddresses, 0);
  objc_storeStrong((id *)&self->_subject, 0);
}

@end
