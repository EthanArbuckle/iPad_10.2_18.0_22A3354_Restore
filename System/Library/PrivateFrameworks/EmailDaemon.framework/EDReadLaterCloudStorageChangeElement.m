@implementation EDReadLaterCloudStorageChangeElement

- (EDReadLaterCloudStorageChangeElement)initWithMessageID:(id)a3 readLaterDate:(id)a4 displayDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  EDReadLaterCloudStorageChangeElement *v12;
  EDReadLaterCloudStorageChangeElement *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EDReadLaterCloudStorageChangeElement;
  v12 = -[EDReadLaterCloudStorageChangeElement init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_messageID, a3);
    objc_storeStrong((id *)&v13->_readLaterDate, a4);
    objc_storeStrong((id *)&v13->_displayDate, a5);
  }

  return v13;
}

- (ECAngleBracketIDHash)messageID
{
  return self->_messageID;
}

- (NSDate)readLaterDate
{
  return self->_readLaterDate;
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_readLaterDate, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
}

@end
