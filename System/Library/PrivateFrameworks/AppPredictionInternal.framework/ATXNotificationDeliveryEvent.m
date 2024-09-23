@implementation ATXNotificationDeliveryEvent

- (ATXNotificationDeliveryEvent)initWithDeliveryUI:(unint64_t)a3 suggestionUUIDs:(id)a4
{
  id v7;
  ATXNotificationDeliveryEvent *v8;
  ATXNotificationDeliveryEvent *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ATXNotificationDeliveryEvent;
  v8 = -[ATXNotificationDeliveryEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_deliveryUI = a3;
    objc_storeStrong((id *)&v8->_suggestionUUIDs, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  ATXNotificationDeliveryEvent *v4;
  ATXNotificationDeliveryEvent *v5;
  BOOL v6;

  v4 = (ATXNotificationDeliveryEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXNotificationDeliveryEvent isEqualToATXNotificationDeliveryEvent:](self, "isEqualToATXNotificationDeliveryEvent:", v5);

  return v6;
}

- (BOOL)isEqualToATXNotificationDeliveryEvent:(id)a3
{
  _QWORD *v4;
  NSArray *v5;
  NSArray *v6;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "deliveryUI") == self->_deliveryUI)
  {
    v5 = self->_suggestionUUIDs;
    v6 = v5;
    if (v5 == (NSArray *)v4[2])
      v7 = 1;
    else
      v7 = -[NSArray isEqual:](v5, "isEqual:");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (id)jsonRawData
{
  NSArray *suggestionUUIDs;
  __CFString *v4;
  unint64_t deliveryUI;
  __CFString *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  suggestionUUIDs = self->_suggestionUUIDs;
  if (suggestionUUIDs)
  {
    -[NSArray description](suggestionUUIDs, "description");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("nil");
  }
  v9[0] = CFSTR("deliveryUI");
  deliveryUI = self->_deliveryUI;
  if (deliveryUI >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deliveryUI, v9[0]);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E82E7350[(int)deliveryUI];
  }
  v9[1] = CFSTR("suggestionUUIDs");
  v10[0] = v6;
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXNotificationDeliveryEvent jsonRawData](self, "jsonRawData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ATXNotificationDeliveryEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBNotificationDeliveryEvent *v5;
  ATXNotificationDeliveryEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBNotificationDeliveryEvent initWithData:]([ATXPBNotificationDeliveryEvent alloc], "initWithData:", v4);

    self = -[ATXNotificationDeliveryEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXNotificationDeliveryEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXNotificationDeliveryEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  ATXNotificationDeliveryEvent *v9;
  NSObject *v10;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_notification_management();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXMinimalAction initWithProto:].cold.1((uint64_t)self, v10);

    goto LABEL_7;
  }
  v5 = v4;
  v6 = objc_msgSend(v5, "deliveryUI");
  objc_msgSend(v5, "suggestionUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_174);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[ATXNotificationDeliveryEvent initWithDeliveryUI:suggestionUUIDs:](self, "initWithDeliveryUI:suggestionUUIDs:", v6, v8);

  v9 = self;
LABEL_8:

  return v9;
}

id __46__ATXNotificationDeliveryEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDeliveryUI:", LODWORD(self->_deliveryUI));
  -[NSArray _pas_mappedArrayWithTransform:](self->_suggestionUUIDs, "_pas_mappedArrayWithTransform:", &__block_literal_global_14_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v3, "setSuggestionUUIDs:", v5);

  return v3;
}

uint64_t __37__ATXNotificationDeliveryEvent_proto__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

- (unint64_t)deliveryUI
{
  return self->_deliveryUI;
}

- (NSArray)suggestionUUIDs
{
  return self->_suggestionUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionUUIDs, 0);
}

@end
