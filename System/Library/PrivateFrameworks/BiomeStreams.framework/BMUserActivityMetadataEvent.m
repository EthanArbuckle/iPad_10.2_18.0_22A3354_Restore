@implementation BMUserActivityMetadataEvent

- (BMUserActivityMetadataEvent)initWithAbsoluteTimestamp:(double)a3 userActivityData:(id)a4 title:(id)a5 activityType:(id)a6 associatedBundleId:(id)a7 associatedURLString:(id)a8 modeIdentifier:(id)a9 topics:(id)a10 hasAssociatedImageRepresentation:(BOOL)a11 uuid:(id)a12
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  BMUserActivityMetadataEvent *v27;
  BMUserActivityMetadataEvent *v28;
  uint64_t v29;
  NSString *title;
  uint64_t v31;
  NSString *activityType;
  uint64_t v33;
  NSString *modeIdentifier;
  uint64_t v35;
  NSString *associatedBundleId;
  uint64_t v37;
  NSString *associatedURLString;
  uint64_t v39;
  NSString *uuid;
  id v42;
  objc_super v43;

  v42 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a12;
  v43.receiver = self;
  v43.super_class = (Class)BMUserActivityMetadataEvent;
  v27 = -[BMUserActivityMetadataEvent init](&v43, sel_init);
  v28 = v27;
  if (v27)
  {
    v27->_absoluteTimestamp = a3;
    objc_storeStrong((id *)&v27->_userActivityData, a4);
    v29 = objc_msgSend(v20, "copy");
    title = v28->_title;
    v28->_title = (NSString *)v29;

    v31 = objc_msgSend(v21, "copy");
    activityType = v28->_activityType;
    v28->_activityType = (NSString *)v31;

    v33 = objc_msgSend(v24, "copy");
    modeIdentifier = v28->_modeIdentifier;
    v28->_modeIdentifier = (NSString *)v33;

    v35 = objc_msgSend(v22, "copy");
    associatedBundleId = v28->_associatedBundleId;
    v28->_associatedBundleId = (NSString *)v35;

    v37 = objc_msgSend(v23, "copy");
    associatedURLString = v28->_associatedURLString;
    v28->_associatedURLString = (NSString *)v37;

    objc_storeStrong((id *)&v28->_topics, a10);
    v28->_hasAssociatedImageRepresentation = a11;
    v39 = objc_msgSend(v26, "copy");
    uuid = v28->_uuid;
    v28->_uuid = (NSString *)v39;

  }
  return v28;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[BMUserActivityMetadataTopic eventWithData:dataVersion:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  NSString *title;
  NSString *activityType;
  __CFString *v7;
  const __CFString *modeIdentifier;
  NSArray *topics;
  const __CFString *associatedURLString;
  void *v11;
  NSString *uuid;
  void *v13;
  _QWORD v15[10];
  _QWORD v16[11];

  v16[10] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("absoluteTimestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = CFSTR("userActivityDataLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSData length](self->_userActivityData, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  activityType = self->_activityType;
  v16[1] = v4;
  v16[2] = title;
  v15[2] = CFSTR("title");
  v15[3] = CFSTR("activityType");
  v7 = CFSTR("nil");
  modeIdentifier = (const __CFString *)self->_modeIdentifier;
  topics = self->_topics;
  if (!modeIdentifier)
    modeIdentifier = CFSTR("nil");
  v16[3] = activityType;
  v16[4] = modeIdentifier;
  v15[4] = CFSTR("modeIdentifier");
  v15[5] = CFSTR("associatedBundleId");
  associatedURLString = (const __CFString *)self->_associatedURLString;
  if (!associatedURLString)
    associatedURLString = CFSTR("nil");
  v16[5] = self->_associatedBundleId;
  v16[6] = associatedURLString;
  v15[6] = CFSTR("associatedURLString");
  v15[7] = CFSTR("topicIdentifiers");
  if (topics)
  {
    -[NSArray _pas_mappedArrayWithTransform:](topics, "_pas_mappedArrayWithTransform:", &__block_literal_global_0);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v16[7] = v7;
  v15[8] = CFSTR("hasAssociatedImageRepresentation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasAssociatedImageRepresentation);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[9] = CFSTR("uuid");
  uuid = self->_uuid;
  v16[8] = v11;
  v16[9] = uuid;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (topics)
  return v13;
}

uint64_t __39__BMUserActivityMetadataEvent_jsonDict__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonDict");
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMUserActivityMetadataEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMUserActivityMetadataEvent json].cold.1();

  }
  return v4;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMUserActivityMetadataEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMUserActivityMetadataEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  BMUserActivityMetadataEvent *v14;
  NSObject *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasAbsoluteTimestamp](v5, "hasAbsoluteTimestamp")
        && -[NSObject hasUserActivityData](v5, "hasUserActivityData")
        && -[NSObject hasTitle](v5, "hasTitle")
        && -[NSObject hasActivityType](v5, "hasActivityType")
        && -[NSObject hasAssociatedBundleId](v5, "hasAssociatedBundleId")
        && (-[NSObject hasUuid](v5, "hasUuid") & 1) != 0)
      {
        -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
        v7 = v6;
        -[NSObject userActivityData](v5, "userActivityData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject title](v5, "title");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject activityType](v5, "activityType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject associatedBundleId](v5, "associatedBundleId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject associatedURLString](v5, "associatedURLString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject modeIdentifier](v5, "modeIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject topics](v5, "topics");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_pas_mappedArrayWithTransform:", &__block_literal_global_133_0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSObject hasAssociatedImageRepresentation](v5, "hasAssociatedImageRepresentation");
        -[NSObject uuid](v5, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v17) = v12;
        self = -[BMUserActivityMetadataEvent initWithAbsoluteTimestamp:userActivityData:title:activityType:associatedBundleId:associatedURLString:modeIdentifier:topics:hasAssociatedImageRepresentation:uuid:](self, "initWithAbsoluteTimestamp:userActivityData:title:activityType:associatedBundleId:associatedURLString:modeIdentifier:topics:hasAssociatedImageRepresentation:uuid:", v21, v19, v8, v18, v9, v10, v7, v11, v17, v13);

        v14 = self;
LABEL_17:

        goto LABEL_18;
      }
      __biome_log_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[BMUserActivityMetadataEvent initWithProto:].cold.1();

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMUserActivityMetadataEvent initWithProto:].cold.2((uint64_t)self, v5);
    }
    v14 = 0;
    goto LABEL_17;
  }
  v14 = 0;
LABEL_18:

  return v14;
}

BMUserActivityMetadataTopic *__45__BMUserActivityMetadataEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BMUserActivityMetadataTopic *v3;

  v2 = a2;
  v3 = -[BMUserActivityMetadataTopic initWithProto:]([BMUserActivityMetadataTopic alloc], "initWithProto:", v2);

  return v3;
}

- (BMUserActivityMetadataEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBUserActivityMetadataEvent *v5;
  BMUserActivityMetadataEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBUserActivityMetadataEvent initWithData:]([BMPBUserActivityMetadataEvent alloc], "initWithData:", v4);

    self = -[BMUserActivityMetadataEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  BMPBUserActivityMetadataEvent *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(BMPBUserActivityMetadataEvent);
  -[BMPBUserActivityMetadataEvent setAbsoluteTimestamp:](v3, "setAbsoluteTimestamp:", self->_absoluteTimestamp);
  -[BMPBUserActivityMetadataEvent setUserActivityData:](v3, "setUserActivityData:", self->_userActivityData);
  -[BMPBUserActivityMetadataEvent setTitle:](v3, "setTitle:", self->_title);
  -[BMPBUserActivityMetadataEvent setActivityType:](v3, "setActivityType:", self->_activityType);
  -[BMPBUserActivityMetadataEvent setAssociatedBundleId:](v3, "setAssociatedBundleId:", self->_associatedBundleId);
  -[BMPBUserActivityMetadataEvent setAssociatedURLString:](v3, "setAssociatedURLString:", self->_associatedURLString);
  -[BMPBUserActivityMetadataEvent setModeIdentifier:](v3, "setModeIdentifier:", self->_modeIdentifier);
  -[NSArray _pas_mappedArrayWithTransform:](self->_topics, "_pas_mappedArrayWithTransform:", &__block_literal_global_134);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[BMPBUserActivityMetadataEvent setTopics:](v3, "setTopics:", v5);

  -[BMPBUserActivityMetadataEvent setHasAssociatedImageRepresentation:](v3, "setHasAssociatedImageRepresentation:", self->_hasAssociatedImageRepresentation);
  -[BMPBUserActivityMetadataEvent setUuid:](v3, "setUuid:", self->_uuid);
  return v3;
}

uint64_t __36__BMUserActivityMetadataEvent_proto__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_associatedBundleId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_associatedURLString, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  double absoluteTimestamp;
  double v9;
  NSData *userActivityData;
  NSData *v11;
  uint64_t v12;
  int v13;
  char v14;
  NSString *title;
  NSString *v16;
  uint64_t v17;
  NSString *activityType;
  NSString *v19;
  uint64_t v20;
  int v21;
  NSString *associatedBundleId;
  NSString *v23;
  uint64_t v24;
  NSString *associatedURLString;
  uint64_t v26;
  NSString *modeIdentifier;
  uint64_t v28;
  uint64_t v29;
  NSString *v30;
  void *v31;
  int hasAssociatedImageRepresentation;
  NSString *uuid;
  NSString *v34;
  uint64_t v35;
  NSString *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  void *v41;
  NSString *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  NSString *v47;
  int v48;
  void *v49;
  void *v50;
  NSString *v51;
  int v52;
  void *v53;
  void *v54;
  int v55;
  int v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    absoluteTimestamp = self->_absoluteTimestamp;
    objc_msgSend(v7, "absoluteTimestamp");
    if (absoluteTimestamp != v9)
    {
      v14 = 0;
LABEL_77:

      goto LABEL_78;
    }
    userActivityData = self->_userActivityData;
    v11 = userActivityData;
    if (!userActivityData)
    {
      objc_msgSend(v7, "userActivityData");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v60 = 0;
        v13 = 0;
        goto LABEL_12;
      }
      v60 = (void *)v12;
      v11 = self->_userActivityData;
    }
    objc_msgSend(v7, "userActivityData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSData isEqualToData:](v11, "isEqualToData:", v3))
    {

      v14 = 0;
      goto LABEL_75;
    }
    v13 = 1;
LABEL_12:
    title = self->_title;
    v16 = title;
    if (!title)
    {
      objc_msgSend(v7, "title");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v57 = 0;
        v59 = 0;
        goto LABEL_19;
      }
      v57 = (void *)v17;
      v16 = self->_title;
    }
    objc_msgSend(v7, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v16, "isEqualToString:", v4))
    {
      v14 = 0;
      goto LABEL_71;
    }
    v59 = 1;
LABEL_19:
    activityType = self->_activityType;
    v19 = activityType;
    if (!activityType)
    {
      objc_msgSend(v7, "activityType");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        v55 = v13;
        v56 = 0;
        v53 = 0;
        goto LABEL_26;
      }
      v53 = (void *)v20;
      v19 = self->_activityType;
    }
    objc_msgSend(v7, "activityType");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v19, "isEqualToString:"))
    {
      v14 = 0;
      v21 = v59;
      goto LABEL_69;
    }
    v55 = v13;
    v56 = 1;
LABEL_26:
    associatedBundleId = self->_associatedBundleId;
    v23 = associatedBundleId;
    if (!associatedBundleId)
    {
      objc_msgSend(v7, "associatedBundleId");
      v24 = objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        v49 = 0;
        v52 = 0;
        goto LABEL_33;
      }
      v49 = (void *)v24;
      v23 = self->_associatedBundleId;
    }
    objc_msgSend(v7, "associatedBundleId");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v23, "isEqualToString:"))
    {
      v14 = 0;
      v21 = v59;
      goto LABEL_65;
    }
    v52 = 1;
LABEL_33:
    associatedURLString = self->_associatedURLString;
    v51 = associatedURLString;
    if (!associatedURLString)
    {
      objc_msgSend(v7, "associatedURLString");
      v26 = objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        v46 = 0;
        v48 = 0;
        goto LABEL_40;
      }
      v46 = (void *)v26;
      associatedURLString = self->_associatedURLString;
    }
    objc_msgSend(v7, "associatedURLString");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](associatedURLString, "isEqualToString:"))
    {
      v14 = 0;
      v21 = v59;
      goto LABEL_62;
    }
    v48 = 1;
LABEL_40:
    modeIdentifier = self->_modeIdentifier;
    v47 = modeIdentifier;
    if (!modeIdentifier)
    {
      objc_msgSend(v7, "modeIdentifier");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        v44 = 0;
        v45 = 0;
        goto LABEL_47;
      }
      v44 = (void *)v28;
      modeIdentifier = self->_modeIdentifier;
    }
    objc_msgSend(v7, "modeIdentifier");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = modeIdentifier;
    v31 = (void *)v29;
    if (!-[NSString isEqualToString:](v30, "isEqualToString:", v29))
    {

      v14 = 0;
      v21 = v59;
      goto LABEL_60;
    }
    v43 = v31;
    v45 = 1;
LABEL_47:
    hasAssociatedImageRepresentation = self->_hasAssociatedImageRepresentation;
    if (hasAssociatedImageRepresentation != objc_msgSend(v7, "hasAssociatedImageRepresentation"))
    {
      v14 = 0;
      v21 = v59;
      goto LABEL_58;
    }
    uuid = self->_uuid;
    v34 = uuid;
    if (!uuid)
    {
      objc_msgSend(v7, "uuid");
      v35 = objc_claimAutoreleasedReturnValue();
      if (!v35)
      {
        v38 = 0;
        v14 = 1;
        v21 = v59;
LABEL_57:

LABEL_58:
        if ((v45 & 1) == 0)
          goto LABEL_60;
        goto LABEL_59;
      }
      v40 = v35;
      v34 = self->_uuid;
    }
    v36 = v34;
    objc_msgSend(v7, "uuid", v40);
    v42 = uuid;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NSString isEqual:](v36, "isEqual:", v37);

    if (v42)
    {
      v21 = v59;
      if (!v45)
      {
LABEL_60:
        if (v47)
        {
          if (!v48)
            goto LABEL_63;
        }
        else
        {

          if ((v48 & 1) == 0)
          {
LABEL_63:
            if (v51)
            {
              if (!v52)
                goto LABEL_66;
            }
            else
            {

              if ((v52 & 1) == 0)
              {
LABEL_66:
                if (associatedBundleId)
                {
                  if (v56)
                  {
LABEL_68:
                    v13 = v55;
LABEL_69:

                    if (activityType)
                      goto LABEL_70;
LABEL_83:

                    if ((v21 & 1) == 0)
                    {
LABEL_72:
                      if (title)
                      {
                        if (!v13)
                          goto LABEL_75;
                      }
                      else
                      {

                        if ((v13 & 1) == 0)
                        {
LABEL_75:
                          if (!userActivityData)

                          goto LABEL_77;
                        }
                      }

                      goto LABEL_75;
                    }
LABEL_71:

                    goto LABEL_72;
                  }
                }
                else
                {

                  if ((v56 & 1) != 0)
                    goto LABEL_68;
                }
                v13 = v55;
                if (activityType)
                {
LABEL_70:
                  if (!v21)
                    goto LABEL_72;
                  goto LABEL_71;
                }
                goto LABEL_83;
              }
            }
LABEL_65:

            goto LABEL_66;
          }
        }
LABEL_62:

        goto LABEL_63;
      }
LABEL_59:

      goto LABEL_60;
    }
    v21 = v59;
    v38 = v41;
    goto LABEL_57;
  }
  v14 = 0;
LABEL_78:

  return v14;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSString)associatedBundleId
{
  return self->_associatedBundleId;
}

- (NSString)associatedURLString
{
  return self->_associatedURLString;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (NSArray)topics
{
  return self->_topics;
}

- (BOOL)hasAssociatedImageRepresentation
{
  return self->_hasAssociatedImageRepresentation;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedURLString, 0);
  objc_storeStrong((id *)&self->_associatedBundleId, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
}

- (void)json
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_18D810000, v0, OS_LOG_TYPE_ERROR, "Unable to create JSON from object", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMPBUserActivityMetadataEvent: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBInferredModeEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
