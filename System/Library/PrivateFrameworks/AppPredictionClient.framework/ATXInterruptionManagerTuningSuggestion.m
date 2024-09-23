@implementation ATXInterruptionManagerTuningSuggestion

- (ATXInterruptionManagerTuningSuggestion)initWithSuggestionType:(int64_t)a3
{
  ATXInterruptionManagerTuningSuggestion *v4;
  ATXInterruptionManagerTuningSuggestion *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)ATXInterruptionManagerTuningSuggestion;
  v4 = -[ATXInterruptionManagerTuningSuggestion init](&v22, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_tuningSuggestionType = a3;
    v4->_suggestionType = a3;
    if (a3 == 5)
    {
      __atxlog_handle_notification_management();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[ATXInterruptionManagerTuningSuggestion initWithSuggestionType:].cold.2(v6, v14, v15, v16, v17, v18, v19, v20);
      goto LABEL_8;
    }
    if (!a3)
    {
      __atxlog_handle_notification_management();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[ATXInterruptionManagerTuningSuggestion initWithSuggestionType:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
LABEL_8:

    }
  }
  return v5;
}

- (id)feedbackKeyComponent
{
  void *v2;
  int64_t tuningSuggestionType;
  __CFString *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  tuningSuggestionType = self->_tuningSuggestionType;
  if (tuningSuggestionType >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_tuningSuggestionType);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E4D59390[(int)tuningSuggestionType];
  }
  objc_msgSend(v2, "stringWithFormat:", CFSTR("suggestion_type:%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  ATXInterruptionManagerTuningSuggestion *v4;
  ATXInterruptionManagerTuningSuggestion *v5;
  BOOL v6;

  v4 = (ATXInterruptionManagerTuningSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXInterruptionManagerTuningSuggestion isEqualToATXInterruptionManagerTuningSuggestion:](self, "isEqualToATXInterruptionManagerTuningSuggestion:", v5);

  return v6;
}

- (BOOL)isEqualToATXInterruptionManagerTuningSuggestion:(id)a3
{
  return self->_tuningSuggestionType == *((_QWORD *)a3 + 2);
}

- (unint64_t)hash
{
  return self->_tuningSuggestionType;
}

- (id)description
{
  id v3;
  int64_t tuningSuggestionType;
  __CFString *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  tuningSuggestionType = self->_tuningSuggestionType;
  if (tuningSuggestionType >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_tuningSuggestionType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E4D59390[(int)tuningSuggestionType];
  }
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Interruption Manager Tuning Suggestion:   Type: %@"), v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ATXInterruptionManagerTuningSuggestion initWithSuggestionType:](+[ATXInterruptionManagerTuningSuggestion allocWithZone:](ATXInterruptionManagerTuningSuggestion, "allocWithZone:", a3), "initWithSuggestionType:", self->_tuningSuggestionType);
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXInterruptionManagerTuningSuggestion proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXInterruptionManagerTuningSuggestion)initWithProtoData:(id)a3
{
  id v4;
  ATXPBInterruptionManagerTuningSuggestion *v5;
  ATXInterruptionManagerTuningSuggestion *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBInterruptionManagerTuningSuggestion initWithData:]([ATXPBInterruptionManagerTuningSuggestion alloc], "initWithData:", v4);

    self = -[ATXInterruptionManagerTuningSuggestion initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXInterruptionManagerTuningSuggestion)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  ATXInterruptionManagerTuningSuggestion *v6;
  NSObject *v7;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if ((-[NSObject hasType](v5, "hasType") & 1) != 0)
      {
        self = -[ATXInterruptionManagerTuningSuggestion initWithSuggestionType:](self, "initWithSuggestionType:", (int)-[NSObject type](v5, "type"));
        v6 = self;
LABEL_12:

        goto LABEL_13;
      }
      __atxlog_handle_notification_management();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[ATXInterruptionManagerTuningSuggestion initWithProto:].cold.1();

    }
    else
    {
      __atxlog_handle_notification_management();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXInterruptionManagerTuningSuggestion initWithProto:].cold.2();
    }
    v6 = 0;
    goto LABEL_12;
  }
  v6 = 0;
LABEL_13:

  return v6;
}

- (id)proto
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setType:", LODWORD(self->_tuningSuggestionType));
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
  -[ATXInterruptionManagerTuningSuggestion encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXInterruptionManagerTuningSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXInterruptionManagerTuningSuggestion *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXInterruptionManagerTuningSuggestion initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)jsonRawData
{
  int64_t tuningSuggestionType;
  __CFString *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("suggestionType");
  tuningSuggestionType = self->_tuningSuggestionType;
  if (tuningSuggestionType >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), tuningSuggestionType, v6);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E4D59390[(int)tuningSuggestionType];
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)tuningSuggestionType
{
  return self->_tuningSuggestionType;
}

- (int)suggestionType
{
  return self->_suggestionType;
}

- (void)initWithSuggestionType:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, a1, a3, "Created invalid 'unused' interruption management suggestion", a5, a6, a7, a8, 0);
}

- (void)initWithSuggestionType:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, a1, a3, "Created invalid 'total' interruption management suggestion", a5, a6, a7, a8, 0);
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

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "%@: missing 'type' field on protobuf message. Failed to decode.", v4, v5, v6, v7, 2u);

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

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "%@: Unable to construct class from ProtoBuf object", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

@end
