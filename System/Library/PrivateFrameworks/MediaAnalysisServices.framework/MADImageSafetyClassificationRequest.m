@implementation MADImageSafetyClassificationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADImageSafetyClassificationRequest)initWithCoder:(id)a3
{
  id v4;
  MADImageSafetyClassificationRequest *v5;
  uint64_t v6;
  NSString *stagedText;
  uint64_t v8;
  NSString *conversationIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADImageSafetyClassificationRequest;
  v5 = -[MADRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StagedText"));
    v6 = objc_claimAutoreleasedReturnValue();
    stagedText = v5->_stagedText;
    v5->_stagedText = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ConversationIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    conversationIdentifier = v5->_conversationIdentifier;
    v5->_conversationIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADImageSafetyClassificationRequest;
  v4 = a3;
  -[MADRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_stagedText, CFSTR("StagedText"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_conversationIdentifier, CFSTR("ConversationIdentifier"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("stagedText: %@, "), self->_stagedText);
  objc_msgSend(v3, "appendFormat:", CFSTR("conversationIdentifier: %@, "), self->_conversationIdentifier);
  -[MADRequest results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("results: %@, "), v6);

  -[MADRequest error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), v7);

  return v3;
}

- (NSString)stagedText
{
  return self->_stagedText;
}

- (void)setStagedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (void)setConversationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_stagedText, 0);
}

@end
