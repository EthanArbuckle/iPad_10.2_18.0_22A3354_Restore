@implementation ATXBlendingBiomeStreamLoggerContextWrapper

- (ATXBlendingBiomeStreamLoggerContextWrapper)initWithEvent:(id)a3 loggerContext:(id)a4
{
  id v7;
  id v8;
  ATXBlendingBiomeStreamLoggerContextWrapper *v9;
  ATXBlendingBiomeStreamLoggerContextWrapper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXBlendingBiomeStreamLoggerContextWrapper;
  v9 = -[ATXBlendingBiomeStreamLoggerContextWrapper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_event, a3);
    objc_storeStrong((id *)&v10->_loggerContext, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  BMStoreEvent *event;
  id v5;

  event = self->_event;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", event, CFSTR("codingKeyForBiomeEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_loggerContext, CFSTR("codingKeyForLoggerContext"));

}

- (ATXBlendingBiomeStreamLoggerContextWrapper)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXBlendingBiomeStreamLoggerContextWrapper *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codingKeyForBiomeEvent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXBlendingBiomeStreamLoggerContextWrapper checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v5, CFSTR("codingKeyForBiomeEvent"), v4, CFSTR("com.apple.duetexpertd.ATXBlendingBiomeStreamLoggerContextWrapper"), -1))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codingKeyForLoggerContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ATXBlendingBiomeStreamLoggerContextWrapper checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v7, CFSTR("codingKeyForLoggerContext"), v4, CFSTR("com.apple.duetexpertd.ATXBlendingBiomeStreamLoggerContextWrapper"), -1))
    {
      v6 = 0;
    }
    else
    {
      self = -[ATXBlendingBiomeStreamLoggerContextWrapper initWithEvent:loggerContext:](self, "initWithEvent:loggerContext:", v5, v7);
      v6 = self;
    }

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ATXBlendingBiomeStreamLoggerContextWrapper *v4;
  ATXBlendingBiomeStreamLoggerContextWrapper *v5;
  BOOL v6;

  v4 = (ATXBlendingBiomeStreamLoggerContextWrapper *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXBlendingBiomeStreamLoggerContextWrapper isEqualToATXBlendingBiomeStreamLoggerContextWrapper:](self, "isEqualToATXBlendingBiomeStreamLoggerContextWrapper:", v5);

  return v6;
}

- (BOOL)isEqualToATXBlendingBiomeStreamLoggerContextWrapper:(id)a3
{
  id *v4;
  BMStoreEvent *event;
  BMStoreEvent *v6;
  BMStoreEvent *v7;
  BMStoreEvent *v8;
  char v9;
  char v10;
  ATXBlendingBiomeStreamLoggerContext *v11;
  ATXBlendingBiomeStreamLoggerContext *v12;

  v4 = (id *)a3;
  event = self->_event;
  v6 = (BMStoreEvent *)v4[1];
  if (event == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = event;
    v9 = -[BMStoreEvent isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_loggerContext;
  v12 = v11;
  if (v11 == v4[2])
    v10 = 1;
  else
    v10 = -[ATXBlendingBiomeStreamLoggerContext isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

- (unint64_t)hash
{
  return (char *)self->_loggerContext - (char *)self->_event + 32 * (uint64_t)self->_event;
}

- (BMStoreEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (ATXBlendingBiomeStreamLoggerContext)loggerContext
{
  return self->_loggerContext;
}

- (void)setLoggerContext:(id)a3
{
  objc_storeStrong((id *)&self->_loggerContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggerContext, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
