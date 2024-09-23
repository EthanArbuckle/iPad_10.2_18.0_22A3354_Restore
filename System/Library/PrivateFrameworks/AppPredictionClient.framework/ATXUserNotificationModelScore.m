@implementation ATXUserNotificationModelScore

- (id)initFromModelScoreData:(id)a3 modelVersion:(unint64_t)a4 score:(double)a5 scoreTimestamp:(double)a6 scoreUUID:(id)a7 scoreInfo:(id)a8
{
  id v15;
  id v16;
  id v17;
  ATXUserNotificationModelScore *v18;
  ATXUserNotificationModelScore *v19;
  objc_super v21;

  v15 = a3;
  v16 = a7;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)ATXUserNotificationModelScore;
  v18 = -[ATXUserNotificationModelScore init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_modelId, a3);
    v19->_modelVersion = a4;
    v19->_score = a5;
    v19->_scoreTimestamp = a6;
    objc_storeStrong((id *)&v19->_scoreUUID, a7);
    objc_storeStrong((id *)&v19->_scoreInfo, a8);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  ATXUserNotificationModelScore *v4;
  ATXUserNotificationModelScore *v5;
  BOOL v6;

  v4 = (ATXUserNotificationModelScore *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXUserNotificationModelScore isEqualToATXUserNotificationModelScore:](self, "isEqualToATXUserNotificationModelScore:", v5);

  return v6;
}

- (BOOL)isEqualToATXUserNotificationModelScore:(id)a3
{
  id *v4;
  NSString *modelId;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  char v10;
  NSUUID *scoreUUID;
  NSUUID *v13;
  NSUUID *v14;
  NSUUID *v15;
  char v16;
  NSData *v17;
  NSData *v18;

  v4 = (id *)a3;
  modelId = self->_modelId;
  v6 = (NSString *)v4[1];
  if (modelId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = modelId;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_8;
  }
  if ((id)self->_modelVersion != v4[2]
    || self->_score != *((double *)v4 + 3)
    || self->_scoreTimestamp != *((double *)v4 + 4))
  {
    goto LABEL_8;
  }
  scoreUUID = self->_scoreUUID;
  v13 = (NSUUID *)v4[5];
  if (scoreUUID == v13)
  {

  }
  else
  {
    v14 = v13;
    v15 = scoreUUID;
    v16 = -[NSUUID isEqual:](v15, "isEqual:", v14);

    if ((v16 & 1) == 0)
    {
LABEL_8:
      v10 = 0;
      goto LABEL_9;
    }
  }
  v17 = self->_scoreInfo;
  v18 = v17;
  if (v17 == v4[6])
    v10 = 1;
  else
    v10 = -[NSData isEqual:](v17, "isEqual:");

LABEL_9:
  return v10;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  id v5;
  ATXUserNotificationModelScore *v6;

  v4 = a3;
  v5 = -[ATXPBUserNotificationModelScore initFromJSON:]([ATXPBUserNotificationModelScore alloc], "initFromJSON:", v4);

  v6 = -[ATXUserNotificationModelScore initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)jsonRepresentation
{
  void *v2;
  void *v3;

  -[ATXUserNotificationModelScore proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXUserNotificationModelScore)initWithProtoData:(id)a3
{
  id v4;
  ATXPBUserNotificationModelScore *v5;
  ATXUserNotificationModelScore *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBUserNotificationModelScore initWithData:]([ATXPBUserNotificationModelScore alloc], "initWithData:", v4);

    self = -[ATXUserNotificationModelScore initWithProto:](self, "initWithProto:", v5);
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

  -[ATXUserNotificationModelScore proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXUserNotificationModelScore)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  ATXUserNotificationModelScore *v16;
  NSObject *v17;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_notification_management();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[ATXDigestTimeline initWithProto:].cold.1((uint64_t)self, v17);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "modelId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "modelVersion");
  objc_msgSend(v5, "score");
  v9 = v8;
  objc_msgSend(v5, "scoreTimestamp");
  v11 = v10;
  v12 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "scoreUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithUUIDString:", v13);
  objc_msgSend(v5, "scoreInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  self = (ATXUserNotificationModelScore *)-[ATXUserNotificationModelScore initFromModelScoreData:modelVersion:score:scoreTimestamp:scoreUUID:scoreInfo:](self, "initFromModelScoreData:modelVersion:score:scoreTimestamp:scoreUUID:scoreInfo:", v6, v7, v14, v15, v9, v11);
  v16 = self;
LABEL_8:

  return v16;
}

- (id)proto
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setModelId:", self->_modelId);
  objc_msgSend(v3, "setModelVersion:", self->_modelVersion);
  objc_msgSend(v3, "setScore:", self->_score);
  objc_msgSend(v3, "setScoreTimestamp:", self->_scoreTimestamp);
  -[NSUUID UUIDString](self->_scoreUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScoreUUID:", v4);

  objc_msgSend(v3, "setScoreInfo:", self->_scoreInfo);
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
  -[ATXUserNotificationModelScore encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXUserNotificationModelScore)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXUserNotificationModelScore *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[ATXUserNotificationModelScore initWithProtoData:](self, "initWithProtoData:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)modelId
{
  return self->_modelId;
}

- (unint64_t)modelVersion
{
  return self->_modelVersion;
}

- (double)score
{
  return self->_score;
}

- (double)scoreTimestamp
{
  return self->_scoreTimestamp;
}

- (NSUUID)scoreUUID
{
  return self->_scoreUUID;
}

- (NSData)scoreInfo
{
  return self->_scoreInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreInfo, 0);
  objc_storeStrong((id *)&self->_scoreUUID, 0);
  objc_storeStrong((id *)&self->_modelId, 0);
}

@end
