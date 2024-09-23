@implementation ATXSendToDigestSuggestion

- (ATXSendToDigestSuggestion)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXSendToDigestSuggestion;
  return -[ATXSendToDigestSuggestion init](&v3, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  ATXSendToDigestSuggestion *v4;
  ATXSendToDigestSuggestion *v5;
  BOOL v6;

  v4 = (ATXSendToDigestSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXSendToDigestSuggestion isEqualToATXSendToDigestSuggestion:](self, "isEqualToATXSendToDigestSuggestion:", v5);

  return v6;
}

- (id)feedbackKeyComponent
{
  return &stru_1E4D5DB30;
}

- (BOOL)isEqualToATXSendToDigestSuggestion:(id)a3
{
  return 1;
}

- (id)description
{
  return CFSTR("Send to digest suggestion");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ATXSendToDigestSuggestion init](+[ATXSendToDigestSuggestion allocWithZone:](ATXSendToDigestSuggestion, "allocWithZone:", a3), "init");
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXSendToDigestSuggestion proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXSendToDigestSuggestion)initWithProtoData:(id)a3
{
  id v4;
  ATXPBSendToDigestSuggestion *v5;
  ATXSendToDigestSuggestion *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBSendToDigestSuggestion initWithData:]([ATXPBSendToDigestSuggestion alloc], "initWithData:", v4);

    self = -[ATXSendToDigestSuggestion initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXSendToDigestSuggestion)initWithProto:(id)a3
{
  id v4;
  ATXSendToDigestSuggestion *v5;
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
  self = -[ATXSendToDigestSuggestion init](self, "init");
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
  -[ATXSendToDigestSuggestion encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXSendToDigestSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXSendToDigestSuggestion *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXSendToDigestSuggestion initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)jsonRawData
{
  return (id)MEMORY[0x1E0C9AA70];
}

@end
