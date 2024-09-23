@implementation CTMessage

- (CTMessage)init
{
  CTMessage *v2;
  NSMutableArray *v3;
  NSMutableArray *recipients;
  NSMutableArray *v5;
  NSMutableArray *items;
  CTMessageAddress *sender;
  NSDate *v8;
  NSDate *date;
  CTPhoneNumber *serviceCenter;
  NSString *subject;
  NSDictionary *rawHeaders;
  NSString *contentType;
  NSMutableDictionary *v14;
  NSMutableDictionary *contentTypeParams;
  NSString *countryCode;
  CTXPCServiceSubscriptionContext *context;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CTMessage;
  v2 = -[CTMessage init](&v19, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recipients = v2->_recipients;
    v2->_recipients = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    items = v2->_items;
    v2->_items = v5;

    sender = v2->_sender;
    v2->_sender = 0;

    v8 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    date = v2->_date;
    v2->_date = v8;

    *(_QWORD *)&v2->_messageId = 0xFFFFFFFFLL;
    serviceCenter = v2->_serviceCenter;
    v2->_serviceCenter = 0;

    subject = v2->_subject;
    v2->_subject = 0;

    rawHeaders = v2->_rawHeaders;
    v2->_rawHeaders = 0;

    contentType = v2->_contentType;
    v2->_contentType = 0;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    contentTypeParams = v2->_contentTypeParams;
    v2->_contentTypeParams = v14;

    countryCode = v2->_countryCode;
    v2->_countryCode = 0;

    v2->_bypassSupportedMessageModesCheck = 0;
    context = v2->_context;
    v2->_context = 0;

    v2->_replyEnabled = 0;
    v2->_smsType = 0;
  }
  return v2;
}

- (CTMessage)initWithDate:(id)a3
{
  id v4;
  CTMessage *v5;
  uint64_t v6;
  NSDate *date;

  v4 = a3;
  v5 = -[CTMessage init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    date = v5->_date;
    v5->_date = (NSDate *)v6;

  }
  return v5;
}

- (void)setRawHeaders:(id)a3
{
  NSDictionary *v5;
  NSDictionary **p_rawHeaders;
  NSDictionary *rawHeaders;
  NSDictionary *v8;

  v5 = (NSDictionary *)a3;
  rawHeaders = self->_rawHeaders;
  p_rawHeaders = &self->_rawHeaders;
  if (rawHeaders != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_rawHeaders, a3);
    v5 = v8;
  }

}

- (void)setReplaceMessage:(unsigned int)a3
{
  self->_replaceMessage = a3;
}

- (void)addRecipient:(id)a3
{
  CTPhoneNumber *v4;
  void *v5;
  CTPhoneNumber *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
  {
    -[CTMessage addPhoneRecipient:](self, "addPhoneRecipient:", v7);
  }
  else if (objc_msgSend(v7, "rangeOfString:", CFSTR("@")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = [CTPhoneNumber alloc];
    -[CTMessage context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CTPhoneNumber initWithDigits:digits:countryCode:](v4, "initWithDigits:digits:countryCode:", objc_msgSend(v5, "slotID"), v7, CFSTR("1"));

    -[CTMessage addPhoneRecipient:](self, "addPhoneRecipient:", v6);
  }
  else
  {
    -[CTMessage addEmailRecipient:](self, "addEmailRecipient:", v7);
  }

}

- (void)removeRecipient:(id)a3
{
  uint64_t v4;

  v4 = -[NSMutableArray indexOfObject:](self->_recipients, "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_recipients, "removeObjectAtIndex:", v4);
}

- (void)removeRecipientsInArray:(id)a3
{
  if (a3)
    -[NSMutableArray removeObjectsInArray:](self->_recipients, "removeObjectsInArray:");
}

- (void)setRecipient:(id)a3
{
  NSMutableArray *recipients;
  id v5;

  if (a3)
  {
    recipients = self->_recipients;
    v5 = a3;
    -[NSMutableArray removeAllObjects](recipients, "removeAllObjects");
    -[NSMutableArray addObject:](self->_recipients, "addObject:", v5);

  }
}

- (void)setRecipients:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableArray removeAllObjects](self->_recipients, "removeAllObjects");
  v4 = v5;
  if (v5)
  {
    -[NSMutableArray addObjectsFromArray:](self->_recipients, "addObjectsFromArray:", v5);
    v4 = v5;
  }

}

- (void)addPhoneRecipient:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableArray addObject:](self->_recipients, "addObject:", v4);

}

- (void)addEmailRecipient:(id)a3
{
  id v4;
  CTEmailAddress *v5;

  v4 = a3;
  v5 = -[CTEmailAddress initWithAddress:]([CTEmailAddress alloc], "initWithAddress:", v4);

  -[NSMutableArray addObject:](self->_recipients, "addObject:", v5);
  self->_messageType = 2;

}

- (id)addText:(id)a3
{
  id v4;
  CTMessagePart *v5;
  void *v6;
  CTMessagePart *v7;

  v4 = a3;
  v5 = [CTMessagePart alloc];
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CTMessagePart initWithData:contentType:](v5, "initWithData:contentType:", v6, CFSTR("text/plain"));
  -[NSMutableArray addObject:](self->_items, "addObject:", v7);
  return v7;
}

- (id)addData:(id)a3 withContentType:(id)a4
{
  id v6;
  id v7;
  CTMessagePart *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[CTMessagePart initWithData:contentType:]([CTMessagePart alloc], "initWithData:contentType:", v7, v6);

  -[NSMutableArray addObject:](self->_items, "addObject:", v8);
  return v8;
}

- (id)addPart:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableArray addObject:](self->_items, "addObject:", v4);
  return v4;
}

- (void)removePartAtIndex:(unint64_t)a3
{
  if (-[NSMutableArray count](self->_items, "count") > a3)
    -[NSMutableArray removeObjectAtIndex:](self->_items, "removeObjectAtIndex:", a3);
}

- (id)contentTypeParameterWithName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_contentTypeParams, "objectForKey:", a3);
}

- (void)addContentTypeParameterWithName:(id)a3 value:(id)a4
{
  if (a3)
  {
    if (a4)
      -[NSMutableDictionary setObject:forKey:](self->_contentTypeParams, "setObject:forKey:", a4, a3);
  }
}

- (id)allContentTypeParameterNames
{
  return (id)-[NSMutableDictionary allKeys](self->_contentTypeParams, "allKeys");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[CTMessageAddress encodedString](self->_sender, "encodedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<[CTMessageAddress: %@]\n\t[Recipients: %@]\n\t[Items: %@]\n\t[Raw Headers: %@]\n\t[Date: %@]\n\t[message ID: %d]\n\t[message Type: %d]\n\t[service center: %@]\n\t[Content-type: %@]\n\t[Content-type params: %@]\n\t[replace message: %d]\n [reply enabled: %d]"), v4, self->_recipients, self->_items, self->_rawHeaders, self->_date, self->_messageId, self->_messageType, self->_serviceCenter, self->_contentType, self->_contentTypeParams, self->_replaceMessage, self->_replyEnabled);

  return v5;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (void)setReplyEnabled:(BOOL)a3
{
  self->_replyEnabled = a3;
}

- (NSArray)recipients
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (unsigned)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(unsigned int)a3
{
  self->_messageId = a3;
}

- (NSArray)items
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (int)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int)a3
{
  self->_messageType = a3;
}

- (CTPhoneNumber)serviceCenter
{
  return self->_serviceCenter;
}

- (void)setServiceCenter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CTMessageAddress)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)rawHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unsigned)replaceMessage
{
  return self->_replaceMessage;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uuid;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (BOOL)bypassSupportedMessageModesCheck
{
  return self->_bypassSupportedMessageModesCheck;
}

- (void)setBypassSupportedMessageModesCheck:(BOOL)a3
{
  self->_bypassSupportedMessageModesCheck = a3;
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)replyEnabled
{
  return self->_replyEnabled;
}

- (int)smsType
{
  return self->_smsType;
}

- (void)setSmsType:(int)a3
{
  self->_smsType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_lazuliGUID, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_contentTypeParams, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_serviceCenter, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_rawHeaders, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

@end
