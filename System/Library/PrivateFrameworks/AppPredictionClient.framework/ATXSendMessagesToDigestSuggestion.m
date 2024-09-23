@implementation ATXSendMessagesToDigestSuggestion

- (ATXSendMessagesToDigestSuggestion)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXSendMessagesToDigestSuggestion;
  return -[ATXSendMessagesToDigestSuggestion init](&v3, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  ATXSendMessagesToDigestSuggestion *v4;
  ATXSendMessagesToDigestSuggestion *v5;
  BOOL v6;

  v4 = (ATXSendMessagesToDigestSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXSendMessagesToDigestSuggestion isEqualToATXSendMessagesToDigestSuggestion:](self, "isEqualToATXSendMessagesToDigestSuggestion:", v5);

  return v6;
}

- (BOOL)isEqualToATXSendMessagesToDigestSuggestion:(id)a3
{
  return 1;
}

- (id)description
{
  return CFSTR("Send messages to digest suggestion");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ATXSendMessagesToDigestSuggestion init](+[ATXSendMessagesToDigestSuggestion allocWithZone:](ATXSendMessagesToDigestSuggestion, "allocWithZone:", a3), "init");
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXSendMessagesToDigestSuggestion proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXSendMessagesToDigestSuggestion)initWithProtoData:(id)a3
{
  id v4;
  ATXPBSendMessagesToDigestSuggestion *v5;
  ATXSendMessagesToDigestSuggestion *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBSendMessagesToDigestSuggestion initWithData:]([ATXPBSendMessagesToDigestSuggestion alloc], "initWithData:", v4);

    self = -[ATXSendMessagesToDigestSuggestion initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXSendMessagesToDigestSuggestion)initWithProto:(id)a3
{
  id v4;
  ATXSendMessagesToDigestSuggestion *v5;
  NSObject *v6;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_notification_management();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ATXUrgencyTuningSuggestion initWithProto:].cold.1((uint64_t)self, v6);

    goto LABEL_7;
  }
  self = -[ATXSendMessagesToDigestSuggestion init](self, "init");
  v5 = self;
LABEL_8:

  return v5;
}

- (id)proto
{
  return (id)objc_opt_new();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXSendMessagesToDigestSuggestion encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXSendMessagesToDigestSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXSendMessagesToDigestSuggestion *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXSendMessagesToDigestSuggestion initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)jsonRawData
{
  return (id)MEMORY[0x1E0C9AA70];
}

@end
