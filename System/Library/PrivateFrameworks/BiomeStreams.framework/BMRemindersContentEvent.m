@implementation BMRemindersContentEvent

- (BMRemindersContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 notes:(id)a8 isAllDay:(BOOL)a9 completionDateTimestamp:(double)a10 dueDateTimestamp:(double)a11 priority:(int)a12 contentProtection:(id)a13
{
  id v22;
  id v23;
  id v24;
  id v25;
  BMRemindersContentEvent *v26;
  BMRemindersContentEvent *v27;
  void *v29;
  id obj;
  id v33;
  id v34;
  objc_super v35;

  v22 = a3;
  v23 = a4;
  v24 = a5;
  obj = a7;
  v34 = a7;
  v25 = a8;
  v33 = a13;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMRemindersContentEvent.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

  }
  v35.receiver = self;
  v35.super_class = (Class)BMRemindersContentEvent;
  v26 = -[BMRemindersContentEvent init](&v35, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_uniqueId, a3);
    objc_storeStrong((id *)&v27->_domainId, a4);
    objc_storeStrong((id *)&v27->_personaId, a5);
    v27->_absoluteTimestamp = a6;
    objc_storeStrong((id *)&v27->_title, obj);
    objc_storeStrong((id *)&v27->_notes, a8);
    v27->_isAllDay = a9;
    v27->_completionDateTimestamp = a10;
    v27->_dueDateTimestamp = a11;
    v27->_priority = a12;
    objc_storeStrong((id *)&v27->_contentProtection, a13);
  }

  return v27;
}

- (BMRemindersContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 notes:(id)a7 isAllDay:(BOOL)a8 completionDateTimestamp:(double)a9 dueDateTimestamp:(double)a10 priority:(int)a11 contentProtection:(id)a12
{
  uint64_t v13;

  LODWORD(v13) = a11;
  return -[BMRemindersContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:title:notes:isAllDay:completionDateTimestamp:dueDateTimestamp:priority:contentProtection:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:title:notes:isAllDay:completionDateTimestamp:dueDateTimestamp:priority:contentProtection:", a3, a4, 0, a6, a7, a8, a5, a9, a10, v13, a12);
}

- (BMRemindersContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 notes:(id)a7 isAllDay:(BOOL)a8 completionDateTimestamp:(double)a9 dueDateTimestamp:(double)a10 priority:(int)a11
{
  return -[BMRemindersContentEvent initWithUniqueId:domainId:absoluteTimestamp:title:notes:isAllDay:completionDateTimestamp:dueDateTimestamp:priority:contentProtection:](self, "initWithUniqueId:domainId:absoluteTimestamp:title:notes:isAllDay:completionDateTimestamp:dueDateTimestamp:priority:contentProtection:", a3, a4, a6, a7, a8, *(_QWORD *)&a11, a5, a9, a10, 0);
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
      +[BMRemindersContentEvent eventWithData:dataVersion:].cold.1(a4, v8);

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  void *v2;
  void *v3;

  -[BMRemindersContentEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMRemindersContentEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (!v4)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMRemindersContentEvent json].cold.1((uint64_t)v5, v6);

  }
  return v4;
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
  -[BMRemindersContentEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMRemindersContentEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMRemindersContentEvent *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMRemindersContentEvent initWithProtoData:](self, "initWithProtoData:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMRemindersContentEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMRemindersContentEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  void *v18;
  BMRemindersContentEvent *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  void *v37;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasUniqueId](v5, "hasUniqueId")
        && -[NSObject hasAbsoluteTimestamp](v5, "hasAbsoluteTimestamp")
        && -[NSObject hasIsAllDay](v5, "hasIsAllDay")
        && -[NSObject hasCompletionDateTimestamp](v5, "hasCompletionDateTimestamp")
        && -[NSObject hasDueDateTimestamp](v5, "hasDueDateTimestamp")
        && (-[NSObject hasPriority](v5, "hasPriority") & 1) != 0)
      {
        -[NSObject uniqueId](v5, "uniqueId");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject domainId](v5, "domainId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject personaId](v5, "personaId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
        v9 = v8;
        -[NSObject title](v5, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject notes](v5, "notes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSObject isAllDay](v5, "isAllDay");
        -[NSObject completionDateTimestamp](v5, "completionDateTimestamp");
        v14 = v13;
        -[NSObject dueDateTimestamp](v5, "dueDateTimestamp");
        v16 = v15;
        v17 = -[NSObject priority](v5, "priority");
        -[NSObject contentProtection](v5, "contentProtection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v36) = v17;
        self = -[BMRemindersContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:title:notes:isAllDay:completionDateTimestamp:dueDateTimestamp:priority:contentProtection:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:title:notes:isAllDay:completionDateTimestamp:dueDateTimestamp:priority:contentProtection:", v37, v6, v7, v10, v11, v12, v9, v14, v16, v36, v18);

        v19 = self;
LABEL_17:

        goto LABEL_18;
      }
      __biome_log_for_category();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        -[BMRemindersContentEvent initWithProto:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMRemindersContentEvent initWithProto:].cold.2(v5, v20, v21, v22, v23, v24, v25, v26);
    }
    v19 = 0;
    goto LABEL_17;
  }
  v19 = 0;
LABEL_18:

  return v19;
}

- (BMRemindersContentEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBRemindersContentEvent *v5;
  BMRemindersContentEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBRemindersContentEvent initWithData:]([BMPBRemindersContentEvent alloc], "initWithData:", v4);

    self = -[BMRemindersContentEvent initWithProto:](self, "initWithProto:", v5);
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

  v3 = (void *)objc_opt_new();
  -[BMRemindersContentEvent uniqueId](self, "uniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUniqueId:", v4);

  -[BMRemindersContentEvent domainId](self, "domainId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDomainId:", v5);

  -[BMRemindersContentEvent personaId](self, "personaId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersonaId:", v6);

  -[BMRemindersContentEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  -[BMRemindersContentEvent title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v7);

  -[BMRemindersContentEvent notes](self, "notes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNotes:", v8);

  objc_msgSend(v3, "setIsAllDay:", -[BMRemindersContentEvent isAllDay](self, "isAllDay"));
  -[BMRemindersContentEvent completionDateTimestamp](self, "completionDateTimestamp");
  objc_msgSend(v3, "setCompletionDateTimestamp:");
  -[BMRemindersContentEvent dueDateTimestamp](self, "dueDateTimestamp");
  objc_msgSend(v3, "setDueDateTimestamp:");
  objc_msgSend(v3, "setPriority:", -[BMRemindersContentEvent priority](self, "priority"));
  -[BMRemindersContentEvent contentProtection](self, "contentProtection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentProtection:", v9);

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_uniqueId, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMRemindersContentEvent proto](self, "proto");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proto");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  NSString *uniqueId;

  uniqueId = self->_uniqueId;
  if (a4 && !uniqueId)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMStreamErrorDomain"), 3, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return uniqueId != 0;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)domainId
{
  return self->_domainId;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)notes
{
  return self->_notes;
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (double)completionDateTimestamp
{
  return self->_completionDateTimestamp;
}

- (double)dueDateTimestamp
{
  return self->_dueDateTimestamp;
}

- (int)priority
{
  return self->_priority;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMRemindersContentEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMRemindersContentEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMRemindersContentEvent: tried to initialize with a proto missing required data.", a5, a6, a7, a8, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMRemindersContentEvent: tried to initialize with a non-BMRemindersContentEvent proto", a5, a6, a7, a8, 0);
}

@end
