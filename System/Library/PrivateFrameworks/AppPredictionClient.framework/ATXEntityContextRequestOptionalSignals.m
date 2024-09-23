@implementation ATXEntityContextRequestOptionalSignals

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXEntityContextRequestOptionalSignals)initWithEntityID:(id)a3
{
  id v4;
  ATXEntityContextRequestOptionalSignals *v5;
  uint64_t v6;
  NSString *entityID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXEntityContextRequestOptionalSignals;
  v5 = -[ATXEntityContextRequestOptionalSignals init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    entityID = v5->_entityID;
    v5->_entityID = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[ATXEntityContextRequestOptionalSignals entityID](self, "entityID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entityID"));

  -[ATXEntityContextRequestOptionalSignals isFromPinnedMessage](self, "isFromPinnedMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("isFromPinnedMessage"));

  -[ATXEntityContextRequestOptionalSignals isFromGroupMessage](self, "isFromGroupMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("isFromGroupMessage"));

  -[ATXEntityContextRequestOptionalSignals isMentionedInGroup](self, "isMentionedInGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("isMentionedInGroup"));

  -[ATXEntityContextRequestOptionalSignals isAudioMessage](self, "isAudioMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("isAudioMessage"));

  -[ATXEntityContextRequestOptionalSignals isFromMailingList](self, "isFromMailingList");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("isFromMailingList"));

}

- (ATXEntityContextRequestOptionalSignals)initWithCoder:(id)a3
{
  id v4;
  ATXEntityContextRequestOptionalSignals *v5;
  uint64_t v6;
  NSString *entityID;
  uint64_t v8;
  NSNumber *isFromPinnedMessage;
  uint64_t v10;
  NSNumber *isFromGroupMessage;
  uint64_t v12;
  NSNumber *isMentionedInGroup;
  uint64_t v14;
  NSNumber *isAudioMessage;
  uint64_t v16;
  NSNumber *isFromMailingList;
  ATXEntityContextRequestOptionalSignals *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ATXEntityContextRequestOptionalSignals;
  v5 = -[ATXEntityContextRequestOptionalSignals init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityID"));
    v6 = objc_claimAutoreleasedReturnValue();
    entityID = v5->_entityID;
    v5->_entityID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isFromPinnedMessage"));
    v8 = objc_claimAutoreleasedReturnValue();
    isFromPinnedMessage = v5->_isFromPinnedMessage;
    v5->_isFromPinnedMessage = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isFromGroupMessage"));
    v10 = objc_claimAutoreleasedReturnValue();
    isFromGroupMessage = v5->_isFromGroupMessage;
    v5->_isFromGroupMessage = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isMentionedInGroup"));
    v12 = objc_claimAutoreleasedReturnValue();
    isMentionedInGroup = v5->_isMentionedInGroup;
    v5->_isMentionedInGroup = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isAudioMessage"));
    v14 = objc_claimAutoreleasedReturnValue();
    isAudioMessage = v5->_isAudioMessage;
    v5->_isAudioMessage = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isFromMailingList"));
    v16 = objc_claimAutoreleasedReturnValue();
    isFromMailingList = v5->_isFromMailingList;
    v5->_isFromMailingList = (NSNumber *)v16;

    v18 = v5;
  }

  return v5;
}

- (NSString)entityID
{
  return self->_entityID;
}

- (void)setEntityID:(id)a3
{
  objc_storeStrong((id *)&self->_entityID, a3);
}

- (NSNumber)isFromPinnedMessage
{
  return self->_isFromPinnedMessage;
}

- (void)setIsFromPinnedMessage:(id)a3
{
  objc_storeStrong((id *)&self->_isFromPinnedMessage, a3);
}

- (NSNumber)isFromGroupMessage
{
  return self->_isFromGroupMessage;
}

- (void)setIsFromGroupMessage:(id)a3
{
  objc_storeStrong((id *)&self->_isFromGroupMessage, a3);
}

- (NSNumber)isMentionedInGroup
{
  return self->_isMentionedInGroup;
}

- (void)setIsMentionedInGroup:(id)a3
{
  objc_storeStrong((id *)&self->_isMentionedInGroup, a3);
}

- (NSNumber)isAudioMessage
{
  return self->_isAudioMessage;
}

- (void)setIsAudioMessage:(id)a3
{
  objc_storeStrong((id *)&self->_isAudioMessage, a3);
}

- (NSNumber)isFromMailingList
{
  return self->_isFromMailingList;
}

- (void)setIsFromMailingList:(id)a3
{
  objc_storeStrong((id *)&self->_isFromMailingList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isFromMailingList, 0);
  objc_storeStrong((id *)&self->_isAudioMessage, 0);
  objc_storeStrong((id *)&self->_isMentionedInGroup, 0);
  objc_storeStrong((id *)&self->_isFromGroupMessage, 0);
  objc_storeStrong((id *)&self->_isFromPinnedMessage, 0);
  objc_storeStrong((id *)&self->_entityID, 0);
}

@end
