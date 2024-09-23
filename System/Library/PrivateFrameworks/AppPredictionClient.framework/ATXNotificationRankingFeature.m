@implementation ATXNotificationRankingFeature

- (ATXNotificationRankingFeature)initWithWeight:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  ATXNotificationRankingFeature *v9;
  ATXNotificationRankingFeature *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXNotificationRankingFeature;
  v9 = -[ATXNotificationRankingFeature init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_weight, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (double)score
{
  double v3;
  double v4;
  double v5;

  -[NSNumber doubleValue](self->_weight, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->_value, "doubleValue");
  return v4 * v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXNotificationRankingFeature *v4;
  void *v5;
  void *v6;
  ATXNotificationRankingFeature *v7;

  v4 = [ATXNotificationRankingFeature alloc];
  v5 = (void *)-[NSNumber copy](self->_weight, "copy");
  v6 = (void *)-[NSNumber copy](self->_value, "copy");
  v7 = -[ATXNotificationRankingFeature initWithWeight:value:](v4, "initWithWeight:value:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *weight;
  id v5;

  weight = self->_weight;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", weight, CFSTR("weight"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));

}

- (ATXNotificationRankingFeature)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  ATXNotificationRankingFeature *v15;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(v4, "error"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        self = -[ATXNotificationRankingFeature initWithWeight:value:](self, "initWithWeight:value:", v5, v7);
        v15 = self;
        goto LABEL_6;
      }
    }
    __atxlog_handle_notification_categorization();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ATXNotificationRankingFeature initWithCoder:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);

  }
  else
  {
    __atxlog_handle_notification_categorization();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXNotificationRankingFeature initWithCoder:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v15 = 0;
LABEL_6:

  return v15;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)weight
{
  return self->_weight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weight, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: Failed to decode weight", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: Failed to decode value", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
