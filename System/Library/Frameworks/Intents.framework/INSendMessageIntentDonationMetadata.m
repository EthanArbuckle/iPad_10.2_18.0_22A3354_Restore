@implementation INSendMessageIntentDonationMetadata

- (INSendMessageIntentDonationMetadata)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INSendMessageIntentDonationMetadata;
  return (INSendMessageIntentDonationMetadata *)-[INIntentDonationMetadata _init](&v3, sel__init);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INSendMessageIntentDonationMetadata;
  return -[INSendMessageIntentDonationMetadata hash](&v3, sel_hash) ^ self->_mentionsCurrentUser ^ self->_recipientCount;
}

- (BOOL)isEqual:(id)a3
{
  INSendMessageIntentDonationMetadata *v4;
  INSendMessageIntentDonationMetadata *v5;
  INSendMessageIntentDonationMetadata *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  NSUInteger v11;
  BOOL v12;

  v4 = (INSendMessageIntentDonationMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
    goto LABEL_13;
  }
  v6 = v4;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v6 = 0;
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v7 = -[INSendMessageIntentDonationMetadata mentionsCurrentUser](self, "mentionsCurrentUser");
  if (v7 != -[INSendMessageIntentDonationMetadata mentionsCurrentUser](v6, "mentionsCurrentUser"))
    goto LABEL_10;
  v8 = -[INSendMessageIntentDonationMetadata isReplyToCurrentUser](self, "isReplyToCurrentUser");
  if (v8 != -[INSendMessageIntentDonationMetadata isReplyToCurrentUser](v6, "isReplyToCurrentUser"))
    goto LABEL_10;
  v9 = -[INSendMessageIntentDonationMetadata isBusinessChat](self, "isBusinessChat");
  if (v9 != -[INSendMessageIntentDonationMetadata isBusinessChat](v6, "isBusinessChat"))
    goto LABEL_10;
  v10 = -[INSendMessageIntentDonationMetadata notifyRecipientAnyway](self, "notifyRecipientAnyway");
  if (v10 != -[INSendMessageIntentDonationMetadata notifyRecipientAnyway](v6, "notifyRecipientAnyway"))
    goto LABEL_10;
  v11 = -[INSendMessageIntentDonationMetadata recipientCount](self, "recipientCount");
  v12 = v11 == -[INSendMessageIntentDonationMetadata recipientCount](v6, "recipientCount");
LABEL_11:

LABEL_13:
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INSendMessageIntentDonationMetadata;
  v4 = -[INIntentDonationMetadata copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setMentionsCurrentUser:", -[INSendMessageIntentDonationMetadata mentionsCurrentUser](self, "mentionsCurrentUser"));
  objc_msgSend(v4, "setReplyToCurrentUser:", -[INSendMessageIntentDonationMetadata isReplyToCurrentUser](self, "isReplyToCurrentUser"));
  objc_msgSend(v4, "setBusinessChat:", -[INSendMessageIntentDonationMetadata isBusinessChat](self, "isBusinessChat"));
  objc_msgSend(v4, "setNotifyRecipientAnyway:", -[INSendMessageIntentDonationMetadata notifyRecipientAnyway](self, "notifyRecipientAnyway"));
  objc_msgSend(v4, "setRecipientCount:", -[INSendMessageIntentDonationMetadata recipientCount](self, "recipientCount"));
  return v4;
}

- (INSendMessageIntentDonationMetadata)initWithCoder:(id)a3
{
  id v4;
  INSendMessageIntentDonationMetadata *v5;
  INSendMessageIntentDonationMetadata *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)INSendMessageIntentDonationMetadata;
  v5 = -[INIntentDonationMetadata initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_mentionsCurrentUser = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mentionsCurrentUser"));
    v5->_replyToCurrentUser = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("replyToCurrentUser"));
    v5->_businessChat = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("businessChat"));
    v5->_notifyRecipientAnyway = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("notifyRecipientAnyway"));
    v5->_recipientCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("recipientCount"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INSendMessageIntentDonationMetadata;
  v4 = a3;
  -[INIntentDonationMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_mentionsCurrentUser, CFSTR("mentionsCurrentUser"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_replyToCurrentUser, CFSTR("replyToCurrentUser"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_businessChat, CFSTR("businessChat"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_notifyRecipientAnyway, CFSTR("notifyRecipientAnyway"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_recipientCount, CFSTR("recipientCount"));

}

- (BOOL)mentionsCurrentUser
{
  return self->_mentionsCurrentUser;
}

- (void)setMentionsCurrentUser:(BOOL)mentionsCurrentUser
{
  self->_mentionsCurrentUser = mentionsCurrentUser;
}

- (BOOL)isReplyToCurrentUser
{
  return self->_replyToCurrentUser;
}

- (void)setReplyToCurrentUser:(BOOL)replyToCurrentUser
{
  self->_replyToCurrentUser = replyToCurrentUser;
}

- (BOOL)notifyRecipientAnyway
{
  return self->_notifyRecipientAnyway;
}

- (void)setNotifyRecipientAnyway:(BOOL)notifyRecipientAnyway
{
  self->_notifyRecipientAnyway = notifyRecipientAnyway;
}

- (NSUInteger)recipientCount
{
  return self->_recipientCount;
}

- (void)setRecipientCount:(NSUInteger)recipientCount
{
  self->_recipientCount = recipientCount;
}

- (BOOL)isBusinessChat
{
  return self->_businessChat;
}

- (void)setBusinessChat:(BOOL)a3
{
  self->_businessChat = a3;
}

+ (Class)_intentClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
