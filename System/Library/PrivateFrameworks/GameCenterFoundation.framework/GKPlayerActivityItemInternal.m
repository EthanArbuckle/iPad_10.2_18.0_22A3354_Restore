@implementation GKPlayerActivityItemInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_9 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_9, &__block_literal_global_40);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_9;
}

void __55__GKPlayerActivityItemInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("uuid");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("scrollId");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("activityType");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("layoutType");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("timeStamp");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("message");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("summaryMessage");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("relationships");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("instrumentationKey");
  v3[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_9;
  secureCodedPropertyKeys_sSecureCodedKeys_9 = v0;

}

- (GKPlayerActivityItemInternal)initWithDictionary:(id)a3
{
  id v4;
  GKPlayerActivityItemInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  GKPlayerActivityRelationships *v21;
  void *v22;
  GKPlayerActivityRelationships *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)GKPlayerActivityItemInternal;
  v5 = -[GKPlayerActivityItemInternal init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityItemInternal setUuid:](v5, "setUuid:", v7);

    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_gkDateFromServerTimestamp:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityItemInternal setTimeStamp:](v5, "setTimeStamp:", v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityItemInternal setMessage:](v5, "setMessage:", v11);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("summary"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityItemInternal setSummaryMessage:](v5, "setSummaryMessage:", v12);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityItemInternal setScrollId:](v5, "setScrollId:", v13);

    -[GKPlayerActivityItemInternal scrollId](v5, "scrollId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (!v15)
    {
      -[GKPlayerActivityItemInternal uuid](v5, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayerActivityItemInternal setScrollId:](v5, "setScrollId:", v16);

    }
    +[GKPlayerActivityItemInternal constantToTypeMap](GKPlayerActivityItemInternal, "constantToTypeMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      v20 = objc_msgSend(v19, "integerValue");
    else
      v20 = 0;
    -[GKPlayerActivityItemInternal setActivityType:](v5, "setActivityType:", v20);
    v21 = [GKPlayerActivityRelationships alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("relationships"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[GKPlayerActivityRelationships initWithDictionary:](v21, "initWithDictionary:", v22);
    -[GKPlayerActivityItemInternal setRelationships:](v5, "setRelationships:", v23);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("style"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("layout"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToString:", CFSTR("MILESTONE")))
      v26 = 2;
    else
      v26 = 1;
    -[GKPlayerActivityItemInternal setLayoutType:](v5, "setLayoutType:", v26);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("instKey"));
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27)
      v29 = (const __CFString *)v27;
    else
      v29 = &stru_1E75BB5A8;
    -[GKPlayerActivityItemInternal setInstrumentationKey:](v5, "setInstrumentationKey:", v29);

  }
  return v5;
}

+ (id)typeToConstantMap
{
  if (typeToConstantMap_onceToken != -1)
    dispatch_once(&typeToConstantMap_onceToken, &__block_literal_global_72);
  return (id)typeToConstantMap_typeToConstMap;
}

void __49__GKPlayerActivityItemInternal_typeToConstantMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E75FB0E8;
  v2[1] = &unk_1E75FB100;
  v3[0] = CFSTR("GAME_WITH_PLAYERS");
  v3[1] = CFSTR("PLAYER_WITH_GAME");
  v2[2] = &unk_1E75FB118;
  v2[3] = &unk_1E75FB130;
  v3[2] = CFSTR("FRIEND");
  v3[3] = CFSTR("ACHIEVEMENT");
  v2[4] = &unk_1E75FB148;
  v2[5] = &unk_1E75FB160;
  v3[4] = CFSTR("SCORE");
  v3[5] = CFSTR("SCORES");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)typeToConstantMap_typeToConstMap;
  typeToConstantMap_typeToConstMap = v0;

}

+ (id)typeToConstantMapMetrics
{
  if (typeToConstantMapMetrics_onceToken != -1)
    dispatch_once(&typeToConstantMapMetrics_onceToken, &__block_literal_global_79);
  return (id)typeToConstantMapMetrics_typeToConstMap;
}

void __56__GKPlayerActivityItemInternal_typeToConstantMapMetrics__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E75FB0E8;
  v2[1] = &unk_1E75FB100;
  v3[0] = CFSTR("multiFriendStartedPlaying");
  v3[1] = CFSTR("friendStartedPlaying");
  v2[2] = &unk_1E75FB118;
  v2[3] = &unk_1E75FB130;
  v3[2] = CFSTR("newFriend");
  v3[3] = CFSTR("achievement");
  v2[4] = &unk_1E75FB148;
  v2[5] = &unk_1E75FB160;
  v3[4] = CFSTR("leaderboard");
  v3[5] = CFSTR("leaderboard");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)typeToConstantMapMetrics_typeToConstMap;
  typeToConstantMapMetrics_typeToConstMap = v0;

}

+ (id)constantToTypeMap
{
  if (constantToTypeMap_onceToken != -1)
    dispatch_once(&constantToTypeMap_onceToken, &__block_literal_global_80_0);
  return (id)constantToTypeMap_constToTypeMap;
}

void __49__GKPlayerActivityItemInternal_constantToTypeMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("GAME_WITH_PLAYERS");
  v2[1] = CFSTR("PLAYER_WITH_GAME");
  v3[0] = &unk_1E75FB0E8;
  v3[1] = &unk_1E75FB100;
  v2[2] = CFSTR("FRIEND");
  v2[3] = CFSTR("ACHIEVEMENT");
  v3[2] = &unk_1E75FB118;
  v3[3] = &unk_1E75FB130;
  v2[4] = CFSTR("SCORE");
  v2[5] = CFSTR("SCORES");
  v3[4] = &unk_1E75FB148;
  v3[5] = &unk_1E75FB160;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)constantToTypeMap_constToTypeMap;
  constantToTypeMap_constToTypeMap = v0;

}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  GKPlayerActivityItemInternal *v16;

  v16 = self;
  v15 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  -[GKPlayerActivityItemInternal uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityItemInternal scrollId](self, "scrollId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKPlayerActivityItemInternal activityType](self, "activityType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKPlayerActivityItemInternal layoutType](self, "layoutType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityItemInternal message](self, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityItemInternal summaryMessage](self, "summaryMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityItemInternal timeStamp](self, "timeStamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityItemInternal relationships](self, "relationships");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityItemInternal instrumentationKey](self, "instrumentationKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@ %p>: {\n            \tuuid: %@ \n            \tscrollId: %@ \n            \tactivityType: %@ \n            \tlayoutType: %@ \n            \tmessage: %@ \n            \tsummaryMessage: %@ \n            \ttimestamp: %@ \n            \trelations: %@ \n            \tinstrumentationKey: %@ \n            }"), v3, &v16, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)scrollId
{
  return self->_scrollId;
}

- (void)setScrollId:(id)a3
{
  objc_storeStrong((id *)&self->_scrollId, a3);
}

- (int64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(int64_t)a3
{
  self->_activityType = a3;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
  objc_storeStrong((id *)&self->_timeStamp, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)summaryMessage
{
  return self->_summaryMessage;
}

- (void)setSummaryMessage:(id)a3
{
  objc_storeStrong((id *)&self->_summaryMessage, a3);
}

- (GKPlayerActivityRelationships)relationships
{
  return self->_relationships;
}

- (void)setRelationships:(id)a3
{
  objc_storeStrong((id *)&self->_relationships, a3);
}

- (NSString)instrumentationKey
{
  return self->_instrumentationKey;
}

- (void)setInstrumentationKey:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentationKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentationKey, 0);
  objc_storeStrong((id *)&self->_relationships, 0);
  objc_storeStrong((id *)&self->_summaryMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_scrollId, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
