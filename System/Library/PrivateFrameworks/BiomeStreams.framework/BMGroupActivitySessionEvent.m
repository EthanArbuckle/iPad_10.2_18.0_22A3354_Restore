@implementation BMGroupActivitySessionEvent

- (BMGroupActivitySessionEvent)initWithIsActive:(BOOL)a3 sourceBundleID:(id)a4 activitySessionID:(id)a5 activityID:(id)a6 messagesChatGuid:(id)a7 participantHandles:(id)a8 memberHandles:(id)a9 experienceType:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  BMGroupActivitySessionEvent *v23;
  BMGroupActivitySessionEvent *v24;
  uint64_t v25;
  NSString *sourceBundleID;
  uint64_t v27;
  NSString *activitySessionID;
  uint64_t v29;
  NSString *activityID;
  uint64_t v31;
  NSString *messagesChatGuid;
  uint64_t v33;
  NSArray *participantHandles;
  uint64_t v35;
  NSArray *memberHandles;
  uint64_t v37;
  NSString *experienceType;
  objc_super v40;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v40.receiver = self;
  v40.super_class = (Class)BMGroupActivitySessionEvent;
  v23 = -[BMEventBase init](&v40, sel_init);
  v24 = v23;
  if (v23)
  {
    v23->_isActive = a3;
    v25 = objc_msgSend(v16, "copy");
    sourceBundleID = v24->_sourceBundleID;
    v24->_sourceBundleID = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    activitySessionID = v24->_activitySessionID;
    v24->_activitySessionID = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    activityID = v24->_activityID;
    v24->_activityID = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    messagesChatGuid = v24->_messagesChatGuid;
    v24->_messagesChatGuid = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    participantHandles = v24->_participantHandles;
    v24->_participantHandles = (NSArray *)v33;

    v35 = objc_msgSend(v21, "copy");
    memberHandles = v24->_memberHandles;
    v24->_memberHandles = (NSArray *)v35;

    v37 = objc_msgSend(v22, "copy");
    experienceType = v24->_experienceType;
    v24->_experienceType = (NSString *)v37;

  }
  return v24;
}

- (NSString)description
{
  id v3;
  const __CFString *v4;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_isActive)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  return (NSString *)(id)objc_msgSend(v3, "initWithFormat:", CFSTR("GroupActivitySessionEvent event with sourceBundleID: %@ activitySessionID: %@ activityID: %@ messagesChatGuid: %@ participantHandles: %@ memberHandles: %@ experienceType: %@ isActive: %@"), self->_sourceBundleID, self->_activitySessionID, self->_activityID, self->_messagesChatGuid, self->_participantHandles, self->_memberHandles, self->_experienceType, v4);
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMGroupActivitySessionEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMGroupActivitySessionEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BMGroupActivitySessionEvent *v13;
  NSObject *v14;
  unsigned int v16;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BMGroupActivitySessionEvent initWithProto:].cold.1((uint64_t)self, v14);

    goto LABEL_7;
  }
  v5 = v4;
  v16 = objc_msgSend(v5, "isActive");
  objc_msgSend(v5, "sourceBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activitySessionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messagesChatGuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "participantHandles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "memberHandles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "experienceType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  self = -[BMGroupActivitySessionEvent initWithIsActive:sourceBundleID:activitySessionID:activityID:messagesChatGuid:participantHandles:memberHandles:experienceType:](self, "initWithIsActive:sourceBundleID:activitySessionID:activityID:messagesChatGuid:participantHandles:memberHandles:experienceType:", v16, v6, v7, v8, v9, v10, v11, v12);
  v13 = self;
LABEL_8:

  return v13;
}

- (BMGroupActivitySessionEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBGroupActivitySessionEvent *v5;
  BMGroupActivitySessionEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBGroupActivitySessionEvent initWithData:]([BMPBGroupActivitySessionEvent alloc], "initWithData:", v4);

    self = -[BMGroupActivitySessionEvent initWithProto:](self, "initWithProto:", v5);
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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setIsActive:", -[BMGroupActivitySessionEvent isActive](self, "isActive"));
  -[BMGroupActivitySessionEvent sourceBundleID](self, "sourceBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceBundleId:", v4);

  -[BMGroupActivitySessionEvent activitySessionID](self, "activitySessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActivitySessionId:", v5);

  -[BMGroupActivitySessionEvent activityID](self, "activityID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActivityId:", v6);

  -[BMGroupActivitySessionEvent messagesChatGuid](self, "messagesChatGuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMessagesChatGuid:", v7);

  -[BMGroupActivitySessionEvent participantHandles](self, "participantHandles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v3, "setParticipantHandles:", v9);

  -[BMGroupActivitySessionEvent memberHandles](self, "memberHandles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v3, "setMemberHandles:", v11);

  -[BMGroupActivitySessionEvent experienceType](self, "experienceType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExperienceType:", v12);

  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isActive);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_sourceBundleID, "hash");
  v6 = v5 ^ -[NSString hash](self->_activitySessionID, "hash") ^ v4;
  v7 = -[NSString hash](self->_activityID, "hash");
  v8 = v6 ^ v7 ^ -[NSString hash](self->_experienceType, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMGroupActivitySessionEvent isActive](self, "isActive");
    if (v6 != objc_msgSend(v5, "isActive"))
    {
LABEL_3:
      v7 = 0;
LABEL_16:

      goto LABEL_17;
    }
    -[BMGroupActivitySessionEvent sourceBundleID](self, "sourceBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", v9))
    {
      -[BMGroupActivitySessionEvent activitySessionID](self, "activitySessionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activitySessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", v11))
      {
        -[BMGroupActivitySessionEvent activityID](self, "activityID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "activityID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v13))
        {
          -[BMGroupActivitySessionEvent experienceType](self, "experienceType");
          v26 = v12;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "experienceType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v14, "isEqualToString:", v15);

          if (!v27)
            goto LABEL_3;
          -[BMGroupActivitySessionEvent messagesChatGuid](self, "messagesChatGuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            -[BMGroupActivitySessionEvent messagesChatGuid](self, "messagesChatGuid");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "messagesChatGuid");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = objc_msgSend(v17, "isEqualToString:", v18);

          }
          else
          {
            v7 = 0;
          }
          -[BMGroupActivitySessionEvent participantHandles](self, "participantHandles");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "count"))
          {
            objc_msgSend(v5, "participantHandles");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "count");

            if (!v22)
            {
LABEL_23:
              -[BMGroupActivitySessionEvent memberHandles](self, "memberHandles");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v8, "count"))
                goto LABEL_15;
              objc_msgSend(v5, "memberHandles");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "count");

              if (!v25)
                goto LABEL_16;
              -[BMGroupActivitySessionEvent memberHandles](self, "memberHandles");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "memberHandles");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v7 = objc_msgSend(v8, "isEqualToArray:", v9);
LABEL_14:

LABEL_15:
              goto LABEL_16;
            }
            -[BMGroupActivitySessionEvent participantHandles](self, "participantHandles");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "participantHandles");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = objc_msgSend(v20, "isEqualToArray:", v23);

          }
          goto LABEL_23;
        }

      }
    }
    v7 = 0;
    goto LABEL_14;
  }
  v7 = 0;
LABEL_17:

  return v7;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (NSString)activitySessionID
{
  return self->_activitySessionID;
}

- (NSString)activityID
{
  return self->_activityID;
}

- (NSString)messagesChatGuid
{
  return self->_messagesChatGuid;
}

- (NSArray)participantHandles
{
  return self->_participantHandles;
}

- (NSArray)memberHandles
{
  return self->_memberHandles;
}

- (NSString)experienceType
{
  return self->_experienceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experienceType, 0);
  objc_storeStrong((id *)&self->_memberHandles, 0);
  objc_storeStrong((id *)&self->_participantHandles, 0);
  objc_storeStrong((id *)&self->_messagesChatGuid, 0);
  objc_storeStrong((id *)&self->_activityID, 0);
  objc_storeStrong((id *)&self->_activitySessionID, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBGroupActivitySessionEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
