@implementation ATXUserNotificationDerivedData

- (NSArray)getPublicScores
{
  return (NSArray *)self->_internalScores;
}

- (ATXUserNotificationDerivedData)init
{
  ATXUserNotificationDerivedData *v2;
  uint64_t v3;
  NSMutableArray *internalScores;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXUserNotificationDerivedData;
  v2 = -[ATXUserNotificationDerivedData init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    internalScores = v2->_internalScores;
    v2->_internalScores = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)initFromModelScores:(id)a3
{
  id v4;
  ATXUserNotificationDerivedData *v5;
  ATXUserNotificationDerivedData *v6;

  v4 = a3;
  v5 = -[ATXUserNotificationDerivedData init](self, "init");
  v6 = v5;
  if (v5)
    -[ATXUserNotificationDerivedData addScores:](v5, "addScores:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ATXUserNotificationDerivedData initFromModelScores:](+[ATXUserNotificationDerivedData allocWithZone:](ATXUserNotificationDerivedData, "allocWithZone:", a3), "initFromModelScores:", self->_internalScores);
}

- (BOOL)isEqual:(id)a3
{
  ATXUserNotificationDerivedData *v4;
  ATXUserNotificationDerivedData *v5;
  BOOL v6;

  v4 = (ATXUserNotificationDerivedData *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXUserNotificationDerivedData isEqualToATXUserNotificationDerivedData:](self, "isEqualToATXUserNotificationDerivedData:", v5);

  return v6;
}

- (BOOL)isEqualToATXUserNotificationDerivedData:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *v5;
  char v6;

  v4 = self->_internalScores;
  v5 = v4;
  if (v4 == *((NSMutableArray **)a3 + 1))
    v6 = 1;
  else
    v6 = -[NSMutableArray isEqual:](v4, "isEqual:");

  return v6;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  id v5;
  ATXUserNotificationDerivedData *v6;

  v4 = a3;
  v5 = -[ATXPBUserNotificationDerivedData initFromJSON:]([ATXPBUserNotificationDerivedData alloc], "initFromJSON:", v4);

  v6 = -[ATXUserNotificationDerivedData initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)jsonRepresentation
{
  void *v2;
  void *v3;

  -[ATXUserNotificationDerivedData proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addScore:(id)a3
{
  -[NSMutableArray addObject:](self->_internalScores, "addObject:", a3);
}

- (void)addScores:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_internalScores, "addObjectsFromArray:", a3);
}

- (ATXUserNotificationDerivedData)initWithProtoData:(id)a3
{
  id v4;
  ATXPBUserNotificationDerivedData *v5;
  ATXUserNotificationDerivedData *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBUserNotificationDerivedData initWithData:]([ATXPBUserNotificationDerivedData alloc], "initWithData:", v4);

    self = -[ATXUserNotificationDerivedData initWithProto:](self, "initWithProto:", v5);
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

  -[ATXUserNotificationDerivedData proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXUserNotificationDerivedData)initWithProto:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXUserNotificationDerivedData *v7;
  NSObject *v8;
  ATXUserNotificationDerivedData *v9;

  v4 = a3;
  if (!v4)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_notification_management();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ATXDigestTimeline initWithProto:].cold.1((uint64_t)self, v8);

    goto LABEL_8;
  }
  objc_msgSend(v4, "scores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[ATXUserNotificationDerivedData initFromModelScores:](self, "initFromModelScores:", v6);
  else
    v7 = -[ATXUserNotificationDerivedData init](self, "init");
  self = v7;

  v9 = self;
LABEL_11:

  return v9;
}

ATXUserNotificationModelScore *__48__ATXUserNotificationDerivedData_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXUserNotificationModelScore *v3;

  v2 = a2;
  v3 = -[ATXUserNotificationModelScore initWithProto:]([ATXUserNotificationModelScore alloc], "initWithProto:", v2);

  return v3;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[NSMutableArray _pas_mappedArrayWithTransform:](self->_internalScores, "_pas_mappedArrayWithTransform:", &__block_literal_global_10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v3, "setScores:", v5);

  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v3, "scores");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v4);

  }
  return v3;
}

uint64_t __39__ATXUserNotificationDerivedData_proto__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
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
  -[ATXUserNotificationDerivedData encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXUserNotificationDerivedData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXUserNotificationDerivedData *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[ATXUserNotificationDerivedData initWithProtoData:](self, "initWithProtoData:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalScores, 0);
}

@end
