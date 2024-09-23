@implementation CKSOSMessage

- (CKSOSMessage)initWithMessage:(id)a3 recipients:(id)a4
{
  id v7;
  id v8;
  CKSOSMessage *v9;
  CKSOSMessage *v10;
  uint64_t v11;
  NSArray *recipients;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKSOSMessage;
  v9 = -[CKSOSMessage init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_smsMessage, a3);
    v11 = objc_msgSend(v8, "copy");
    recipients = v10->_recipients;
    v10->_recipients = (NSArray *)v11;

  }
  return v10;
}

- (CKSOSMessage)initWithSMSMessage:(id)a3 mmsMessage:(id)a4 recipients:(id)a5
{
  id v9;
  id v10;
  id v11;
  CKSOSMessage *v12;
  CKSOSMessage *v13;
  uint64_t v14;
  NSArray *recipients;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CKSOSMessage;
  v12 = -[CKSOSMessage init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_smsMessage, a3);
    objc_storeStrong((id *)&v13->_mmsMessage, a4);
    v14 = objc_msgSend(v11, "copy");
    recipients = v13->_recipients;
    v13->_recipients = (NSArray *)v14;

  }
  return v13;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  NSArray *recipients;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_useStandalone)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (self->_location)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  recipients = self->_recipients;
  if (-[NSString length](self->_locationURL, "length"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("CKSOSMessage: recipients %@ useStandalone %@ location present? %@ location URL present? %@  handles %@ "), recipients, v4, v5, v7, self->_handles);
}

- (NSString)message
{
  return (NSString *)-[CKSOSMessage messageForReasons:](self, "messageForReasons:", 1);
}

- (id)messageForReasons:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSString *mmsMessage;
  NSString *v9;

  -[CKSOSMessage recipientReasonMessages](self, "recipientReasonMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length"))
  {
    mmsMessage = self->_mmsMessage;
    if (!mmsMessage)
      mmsMessage = self->_smsMessage;
    v9 = mmsMessage;

    v7 = v9;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_message, "copyWithZone:", a3);
  objc_msgSend(v5, "setMessage:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_smsMessage, "copyWithZone:", a3);
  objc_msgSend(v5, "setSmsMessage:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_mmsMessage, "copyWithZone:", a3);
  objc_msgSend(v5, "setMmsMessage:", v8);

  v9 = (void *)-[NSArray copyWithZone:](self->_recipients, "copyWithZone:", a3);
  objc_msgSend(v5, "setRecipients:", v9);

  v10 = (void *)objc_msgSend(self->_failureBlock, "copy");
  objc_msgSend(v5, "setFailureBlock:", v10);

  v11 = (void *)-[CLLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  objc_msgSend(v5, "setLocation:", v11);

  v12 = (void *)-[NSString copyWithZone:](self->_locationURL, "copyWithZone:", a3);
  objc_msgSend(v5, "setLocationURL:", v12);

  objc_msgSend(v5, "setUseStandalone:", self->_useStandalone);
  objc_msgSend(v5, "setIsCritical:", self->_isCritical);
  return v5;
}

- (void)setRecipients:(id)a3
{
  NSArray *v5;
  NSArray *handles;
  NSArray *v7;

  v5 = (NSArray *)a3;
  if (self->_recipients != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_recipients, a3);
    handles = self->_handles;
    self->_handles = 0;

    v5 = v7;
  }

}

- (NSArray)handles
{
  NSArray *handles;
  NSArray *recipients;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  handles = self->_handles;
  if (!handles)
  {
    recipients = self->_recipients;
    objc_msgSend(MEMORY[0x1E0D35910], "smsService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CKMakeHandlesFromRecipientsWithFallbackService(recipients, v5);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_handles;
    self->_handles = v6;

    handles = self->_handles;
  }
  return handles;
}

- (NSString)locationURL
{
  return self->_locationURL;
}

- (void)setLocationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSDictionary)recipientReasons
{
  return self->_recipientReasons;
}

- (void)setRecipientReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)recipientReasonMessages
{
  return self->_recipientReasonMessages;
}

- (void)setRecipientReasonMessages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)failureBlock
{
  return self->_failureBlock;
}

- (void)setFailureBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)useStandalone
{
  return self->_useStandalone;
}

- (void)setUseStandalone:(BOOL)a3
{
  self->_useStandalone = a3;
}

- (BOOL)isCritical
{
  return self->_isCritical;
}

- (void)setIsCritical:(BOOL)a3
{
  self->_isCritical = a3;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)smsMessage
{
  return self->_smsMessage;
}

- (void)setSmsMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)mmsMessage
{
  return self->_mmsMessage;
}

- (void)setMmsMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mmsMessage, 0);
  objc_storeStrong((id *)&self->_smsMessage, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong(&self->_failureBlock, 0);
  objc_storeStrong((id *)&self->_recipientReasonMessages, 0);
  objc_storeStrong((id *)&self->_recipientReasons, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_locationURL, 0);
}

@end
