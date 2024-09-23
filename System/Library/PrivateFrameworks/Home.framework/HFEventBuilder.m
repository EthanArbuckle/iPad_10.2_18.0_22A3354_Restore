@implementation HFEventBuilder

- (id)compareToObject:(id)a3
{
  id v4;
  HFComparisonResult *v5;

  v4 = a3;
  v5 = -[HFComparisonResult initWithObjectA:objectB:]([HFComparisonResult alloc], "initWithObjectA:objectB:", self, v4);

  return v5;
}

+ (id)eventBuilderForEvent:(id)a3
{
  id v3;
  objc_class *v4;
  NSObject *v5;
  void *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (v4 = (objc_class *)objc_opt_class()) == 0)
  {
    HFLogForCategory(0x28uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "No HFEventBuilder can handle the event: %@", (uint8_t *)&v8, 0xCu);
    }

    v4 = 0;
  }
  v6 = (void *)objc_msgSend([v4 alloc], "initWithEvent:", v3);

  return v6;
}

- (HFEventBuilder)init
{
  return -[HFEventBuilder initWithEvent:](self, "initWithEvent:", 0);
}

- (HFEventBuilder)initWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HFEventBuilder;
  return -[HFEventBuilder init](&v4, sel_init, a3);
}

- (id)buildNewEventsFromCurrentState
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFEventBuilder.m"), 68, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFEventBuilder buildNewEventsFromCurrentState]", objc_opt_class());

  return 0;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFEventBuilder.m"), 74, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFEventBuilder naturalLanguageNameWithOptions:]", objc_opt_class());

  return 0;
}

- (id)comparisonKey
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventType, 0);
}

@end
