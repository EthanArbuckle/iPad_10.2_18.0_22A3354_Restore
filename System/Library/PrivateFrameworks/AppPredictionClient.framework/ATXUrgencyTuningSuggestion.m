@implementation ATXUrgencyTuningSuggestion

- (ATXUrgencyTuningSuggestion)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXUrgencyTuningSuggestion;
  return -[ATXUrgencyTuningSuggestion init](&v3, sel_init);
}

- (id)feedbackKeyComponent
{
  return &stru_1E4D5DB30;
}

- (BOOL)isEqual:(id)a3
{
  ATXUrgencyTuningSuggestion *v4;
  ATXUrgencyTuningSuggestion *v5;
  BOOL v6;

  v4 = (ATXUrgencyTuningSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXUrgencyTuningSuggestion isEqualToATXUrgencyTuningSuggestion:](self, "isEqualToATXUrgencyTuningSuggestion:", v5);

  return v6;
}

- (BOOL)isEqualToATXUrgencyTuningSuggestion:(id)a3
{
  return 1;
}

- (id)description
{
  return CFSTR("Urgency Tuning suggestion");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ATXUrgencyTuningSuggestion init](+[ATXUrgencyTuningSuggestion allocWithZone:](ATXUrgencyTuningSuggestion, "allocWithZone:", a3), "init");
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXUrgencyTuningSuggestion proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXUrgencyTuningSuggestion)initWithProtoData:(id)a3
{
  id v4;
  ATXPBUrgencyTuningSuggestion *v5;
  ATXUrgencyTuningSuggestion *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBUrgencyTuningSuggestion initWithData:]([ATXPBUrgencyTuningSuggestion alloc], "initWithData:", v4);

    self = -[ATXUrgencyTuningSuggestion initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXUrgencyTuningSuggestion)initWithProto:(id)a3
{
  id v4;
  ATXUrgencyTuningSuggestion *v5;
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
  self = -[ATXUrgencyTuningSuggestion init](self, "init");
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
  -[ATXUrgencyTuningSuggestion encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXUrgencyTuningSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXUrgencyTuningSuggestion *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXUrgencyTuningSuggestion initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)jsonRawData
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%@: Unable to construct class from ProtoBuf object", (uint8_t *)&v5, 0xCu);

}

@end
