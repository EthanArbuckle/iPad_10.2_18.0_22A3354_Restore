@implementation IAMMessage

- (IAMMessage)initWithIdentifier:(id)a3 messageGroupIdentifier:(id)a4 contentPages:(id)a5 requiresCloseButton:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  IAMMessage *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSString *messageGroupIdentifier;
  uint64_t v18;
  NSArray *contentPages;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)IAMMessage;
  v13 = -[IAMMessage init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    messageGroupIdentifier = v13->_messageGroupIdentifier;
    v13->_messageGroupIdentifier = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    contentPages = v13->_contentPages;
    v13->_contentPages = (NSArray *)v18;

    v13->_requiresCloseButton = a6;
  }

  return v13;
}

- (IAMMessage)initWithICInAppMessageEntry:(id)a3
{
  id v4;
  IAMMessage *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  void *v10;
  uint64_t v11;
  NSString *messageGroupIdentifier;
  void *v13;
  uint64_t v14;
  NSArray *contentPages;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IAMMessage;
  v5 = -[IAMMessage init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "applicationMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    objc_msgSend(v4, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    messageGroupIdentifier = v5->_messageGroupIdentifier;
    v5->_messageGroupIdentifier = (NSString *)v11;

    objc_msgSend(v6, "contentPages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "iam_map:", &__block_literal_global_2);
    v14 = objc_claimAutoreleasedReturnValue();
    contentPages = v5->_contentPages;
    v5->_contentPages = (NSArray *)v14;

  }
  return v5;
}

IAMContent *__42__IAMMessage_initWithICInAppMessageEntry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  IAMContent *v3;

  v2 = a2;
  v3 = -[IAMContent initWithICMessageContent:]([IAMContent alloc], "initWithICMessageContent:", v2);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:messageGroupIdentifier:contentPages:requiresCloseButton:", self->_identifier, self->_messageGroupIdentifier, self->_contentPages, self->_requiresCloseButton);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)messageGroupIdentifier
{
  return self->_messageGroupIdentifier;
}

- (NSArray)contentPages
{
  return self->_contentPages;
}

- (BOOL)requiresCloseButton
{
  return self->_requiresCloseButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentPages, 0);
  objc_storeStrong((id *)&self->_messageGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
