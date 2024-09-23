@implementation IMTUConversationItem

- (IMTUConversationItem)initWithSender:(id)a3 time:(id)a4 guid:(id)a5 messageSummaryInfo:(id)a6
{
  id v10;
  IMTUConversationItem *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)IMTUConversationItem;
  v11 = -[IMItem initWithSender:time:guid:type:](&v15, sel_initWithSender_time_guid_type_, a3, a4, a5, 6);
  if (v11)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("conversationAVMode"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = (void *)v12;
    else
      v13 = &unk_1E3FFE438;
    v11->_avMode = objc_msgSend(v13, "unsignedIntegerValue");

  }
  return v11;
}

- (IMTUConversationItem)initWithCoder:(id)a3
{
  id v4;
  IMTUConversationItem *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)IMTUConversationItem;
  v5 = -[IMItem initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_flags = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("flags"));
    v5->_avMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("conversationAVMode"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMTUConversationItem)initWithDictionary:(id)a3
{
  id v4;
  IMTUConversationItem *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMTUConversationItem;
  v5 = -[IMItem initWithDictionary:](&v10, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("flags"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_flags = objc_msgSend(v6, "unsignedLongLongValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("conversationAVMode"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = (void *)v7;
    else
      v8 = &unk_1E3FFE438;
    v5->_avMode = objc_msgSend(v8, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMTUConversationItem;
  v4 = a3;
  -[IMItem encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_flags, CFSTR("flags"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_avMode, CFSTR("conversationAVMode"));

}

- (id)copyDictionaryRepresentation
{
  __CFDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMTUConversationItem;
  v3 = -[IMItem copyDictionaryRepresentation](&v8, sel_copyDictionaryRepresentation);
  v4 = (void *)MEMORY[0x1A1AE8394]();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_flags);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    CFDictionarySetValue(v3, CFSTR("flags"), v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_avMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    CFDictionarySetValue(v3, CFSTR("conversationAVMode"), v6);

  objc_autoreleasePoolPop(v4);
  return v3;
}

- (BOOL)isFromMe
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (NSDictionary)messageSummaryInfo
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("conversationAVMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMTUConversationItem avMode](self, "avMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (void)setAvMode:(unint64_t)a3
{
  self->_avMode = a3;
}

@end
