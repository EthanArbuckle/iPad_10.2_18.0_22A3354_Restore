@implementation ATXNotificationSmartPauseSuggestion

- (ATXNotificationSmartPauseSuggestion)initWithSuggestionExpiration:(id)a3 pauseDuration:(double)a4
{
  id v7;
  ATXNotificationSmartPauseSuggestion *v8;
  ATXNotificationSmartPauseSuggestion *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXNotificationSmartPauseSuggestion;
  v8 = -[ATXNotificationSmartPauseSuggestion init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_suggestionExpiration, a3);
    v9->_suggestionDuration = a4;
  }

  return v9;
}

- (id)feedbackKeyComponent
{
  return &stru_1E4D5DB30;
}

- (BOOL)isEqual:(id)a3
{
  ATXNotificationSmartPauseSuggestion *v4;
  ATXNotificationSmartPauseSuggestion *v5;
  BOOL v6;

  v4 = (ATXNotificationSmartPauseSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXNotificationSmartPauseSuggestion isEqualToATXNotificationSmartPauseSuggestion:](self, "isEqualToATXNotificationSmartPauseSuggestion:", v5);

  return v6;
}

- (BOOL)isEqualToATXNotificationSmartPauseSuggestion:(id)a3
{
  id *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;

  v4 = (id *)a3;
  -[NSDate timeIntervalSinceReferenceDate](self->_suggestionExpiration, "timeIntervalSinceReferenceDate");
  v6 = v5;
  objc_msgSend(v4[1], "timeIntervalSinceReferenceDate");
  v8 = v6 - v7;
  v9 = -v8;
  if (v8 >= 0.0)
    v9 = v8;
  if (v9 <= 300.0)
  {
    v11 = self->_suggestionDuration - *((double *)v4 + 2);
    if (v11 < 0.0)
      v11 = -v11;
    v10 = v11 <= 300.0;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  double v3;

  -[NSDate timeIntervalSinceReferenceDate](self->_suggestionExpiration, "timeIntervalSinceReferenceDate");
  return (unint64_t)(self->_suggestionDuration / 300.0)
       - (unint64_t)(v3 / 300.0)
       + 32 * (unint64_t)(v3 / 300.0);
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Smart Pause:   Expiration: %@, Duration: %f"), self->_suggestionExpiration, *(_QWORD *)&self->_suggestionDuration);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ATXNotificationSmartPauseSuggestion initWithSuggestionExpiration:pauseDuration:](+[ATXNotificationSmartPauseSuggestion allocWithZone:](ATXNotificationSmartPauseSuggestion, "allocWithZone:", a3), "initWithSuggestionExpiration:pauseDuration:", self->_suggestionExpiration, self->_suggestionDuration);
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXNotificationSmartPauseSuggestion proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXNotificationSmartPauseSuggestion)initWithProtoData:(id)a3
{
  id v4;
  ATXPBNotificationSmartPauseSuggestion *v5;
  ATXNotificationSmartPauseSuggestion *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBNotificationSmartPauseSuggestion initWithData:]([ATXPBNotificationSmartPauseSuggestion alloc], "initWithData:", v4);

    self = -[ATXNotificationSmartPauseSuggestion initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXNotificationSmartPauseSuggestion)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  ATXNotificationSmartPauseSuggestion *v8;
  NSObject *v9;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_notification_management();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXNotificationSmartPauseSuggestion initWithProto:].cold.3();
      v8 = 0;
      goto LABEL_17;
    }
    v5 = v4;
    if ((-[NSObject hasExpirationTimestamp](v5, "hasExpirationTimestamp") & 1) != 0)
    {
      v6 = (void *)MEMORY[0x1E0C99D68];
      -[NSObject expirationTimestamp](v5, "expirationTimestamp");
      objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
      v7 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject hasPauseDuration](v5, "hasPauseDuration") & 1) != 0)
      {
        -[NSObject pauseDuration](v5, "pauseDuration");
        self = -[ATXNotificationSmartPauseSuggestion initWithSuggestionExpiration:pauseDuration:](self, "initWithSuggestionExpiration:pauseDuration:", v7);
        v8 = self;
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      __atxlog_handle_notification_management();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[ATXNotificationSmartPauseSuggestion initWithProto:].cold.1();

    }
    else
    {
      __atxlog_handle_notification_management();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[ATXNotificationSmartPauseSuggestion initWithProto:].cold.2();
    }
    v8 = 0;
    goto LABEL_16;
  }
  v8 = 0;
LABEL_18:

  return v8;
}

- (id)proto
{
  void *v3;

  v3 = (void *)objc_opt_new();
  -[NSDate timeIntervalSinceReferenceDate](self->_suggestionExpiration, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setExpirationTimestamp:");
  objc_msgSend(v3, "setPauseDuration:", self->_suggestionDuration);
  return v3;
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
  -[ATXNotificationSmartPauseSuggestion encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXNotificationSmartPauseSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXNotificationSmartPauseSuggestion *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXNotificationSmartPauseSuggestion initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (NSDate)suggestionExpiration
{
  return self->_suggestionExpiration;
}

- (double)suggestionDuration
{
  return self->_suggestionDuration;
}

- (void)setSuggestionDuration:(double)a3
{
  self->_suggestionDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionExpiration, 0);
}

- (void)initWithProto:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "%@: missing pauseDuration.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)initWithProto:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "%@: missing expirationTimestamp.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)initWithProto:.cold.3()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "%@: Unable to construct class from ProtoBuf object", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

@end
