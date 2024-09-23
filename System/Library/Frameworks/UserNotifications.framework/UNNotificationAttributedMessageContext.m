@implementation UNNotificationAttributedMessageContext

- (id)_initWithSendMessageIntent:(id)a3 attributedContent:(id)a4
{
  id v6;
  id v7;
  UNNotificationAttributedMessageContext *v8;
  uint64_t v9;
  INSendMessageIntent *sendMessageIntent;
  uint64_t v11;
  NSAttributedString *attributedContent;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UNNotificationAttributedMessageContext;
  v8 = -[UNNotificationAttributedMessageContext init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    sendMessageIntent = v8->_sendMessageIntent;
    v8->_sendMessageIntent = (INSendMessageIntent *)v9;

    v11 = objc_msgSend(v7, "copy");
    attributedContent = v8->_attributedContent;
    v8->_attributedContent = (NSAttributedString *)v11;

  }
  return v8;
}

+ (id)contextWithSendMessageIntent:(id)a3 attributedContent:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithSendMessageIntent:attributedContent:", v6, v5);

  return v7;
}

- (INSendMessageIntent)sendMessageIntent
{
  return self->_sendMessageIntent;
}

- (void)setSendMessageIntent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSAttributedString)attributedContent
{
  return self->_attributedContent;
}

- (void)setAttributedContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedContent, 0);
  objc_storeStrong((id *)&self->_sendMessageIntent, 0);
}

@end
