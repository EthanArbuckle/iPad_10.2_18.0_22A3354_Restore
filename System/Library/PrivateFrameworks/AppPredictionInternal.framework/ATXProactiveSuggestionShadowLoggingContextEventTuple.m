@implementation ATXProactiveSuggestionShadowLoggingContextEventTuple

- (ATXProactiveSuggestionShadowLoggingContextEventTuple)init
{
  void *v3;
  ATXProactiveSuggestionShadowLoggingContextEventTuple *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXProactiveSuggestionShadowLoggingContextEventTuple initWithEvent:shadowLoggingContext:](self, "initWithEvent:shadowLoggingContext:", 0, v3);

  return v4;
}

- (ATXProactiveSuggestionShadowLoggingContextEventTuple)initWithEvent:(id)a3 shadowLoggingContext:(id)a4
{
  id v7;
  id v8;
  ATXProactiveSuggestionShadowLoggingContextEventTuple *v9;
  ATXProactiveSuggestionShadowLoggingContextEventTuple *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXProactiveSuggestionShadowLoggingContextEventTuple;
  v9 = -[ATXProactiveSuggestionShadowLoggingContextEventTuple init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_event, a3);
    objc_storeStrong((id *)&v10->_shadowLoggingContext, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  ATXProactiveSuggestionShadowLoggingContextEventTuple *v4;
  ATXProactiveSuggestionShadowLoggingContextEventTuple *v5;
  BOOL v6;

  v4 = (ATXProactiveSuggestionShadowLoggingContextEventTuple *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXProactiveSuggestionShadowLoggingContextEventTuple isEqualToATXProactiveSuggestionShadowLoggingContextEventTuple:](self, "isEqualToATXProactiveSuggestionShadowLoggingContextEventTuple:", v5);

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionShadowLoggingContextEventTuple:(id)a3
{
  id *v4;
  BMStoreEvent *event;
  BMStoreEvent *v6;
  BMStoreEvent *v7;
  BMStoreEvent *v8;
  char v9;
  char v10;
  ATXProactiveSuggestionShadowLoggingContext *v11;
  ATXProactiveSuggestionShadowLoggingContext *v12;

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
  v11 = self->_shadowLoggingContext;
  v12 = v11;
  if (v11 == v4[2])
    v10 = 1;
  else
    v10 = -[ATXProactiveSuggestionShadowLoggingContext isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

- (unint64_t)hash
{
  return (char *)self->_shadowLoggingContext - (char *)self->_event + 32 * (uint64_t)self->_event;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BMStoreEvent *event;
  id v5;

  event = self->_event;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", event, CFSTR("event"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shadowLoggingContext, CFSTR("loggingContext"));

}

- (ATXProactiveSuggestionShadowLoggingContextEventTuple)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  ATXProactiveSuggestionShadowLoggingContextEventTuple *v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_blending_ecosystem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("loggingContext"), v4, 1, CFSTR("com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingContextEventTuple"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D81610];
    v10 = objc_opt_class();
    __atxlog_handle_blending_ecosystem();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("event"), v4, 0, CFSTR("com.apple.duetexpertd.ATXProactiveSuggestionShadowLoggingContextEventTuple"), -1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[ATXProactiveSuggestionShadowLoggingContextEventTuple initWithEvent:shadowLoggingContext:](self, "initWithEvent:shadowLoggingContext:", v12, v8);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BMStoreEvent)event
{
  return self->_event;
}

- (ATXProactiveSuggestionShadowLoggingContext)shadowLoggingContext
{
  return self->_shadowLoggingContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowLoggingContext, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
