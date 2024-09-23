@implementation ATXTurnOffNotificationsForAppSuggestion

- (id)feedbackKeyComponent
{
  return &stru_1E4D5DB30;
}

- (BOOL)isEqual:(id)a3
{
  ATXTurnOffNotificationsForAppSuggestion *v4;
  ATXTurnOffNotificationsForAppSuggestion *v5;
  BOOL v6;

  v4 = (ATXTurnOffNotificationsForAppSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXTurnOffNotificationsForAppSuggestion isEqualToATXTurnOffNotificationsForAppSuggestion:](self, "isEqualToATXTurnOffNotificationsForAppSuggestion:", v5);

  return v6;
}

- (BOOL)isEqualToATXTurnOffNotificationsForAppSuggestion:(id)a3
{
  return 1;
}

- (id)description
{
  return CFSTR("Turn Off Notifications For App Suggestion");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ATXTurnOffNotificationsForAppSuggestion init](+[ATXTurnOffNotificationsForAppSuggestion allocWithZone:](ATXTurnOffNotificationsForAppSuggestion, "allocWithZone:", a3), "init");
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXTurnOffNotificationsForAppSuggestion proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXTurnOffNotificationsForAppSuggestion)initWithProtoData:(id)a3
{
  id v4;
  ATXPBTurnOffNotificationsForAppSuggestion *v5;
  ATXTurnOffNotificationsForAppSuggestion *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBTurnOffNotificationsForAppSuggestion initWithData:]([ATXPBTurnOffNotificationsForAppSuggestion alloc], "initWithData:", v4);

    self = -[ATXTurnOffNotificationsForAppSuggestion initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXTurnOffNotificationsForAppSuggestion)initWithProto:(id)a3
{
  id v4;
  ATXTurnOffNotificationsForAppSuggestion *v5;
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
  self = -[ATXTurnOffNotificationsForAppSuggestion init](self, "init");
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
  -[ATXTurnOffNotificationsForAppSuggestion encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXTurnOffNotificationsForAppSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXTurnOffNotificationsForAppSuggestion *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXTurnOffNotificationsForAppSuggestion initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)jsonRawData
{
  return (id)MEMORY[0x1E0C9AA70];
}

@end
