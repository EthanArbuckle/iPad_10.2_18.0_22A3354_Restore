@implementation CHSWidgetRelevanceRelevantContextAttribute

- (CHSWidgetRelevanceRelevantContextAttribute)initWithRelevantContext:(id)a3
{
  id v4;
  CHSWidgetRelevanceRelevantContextAttribute *v5;
  uint64_t v6;
  LNRelevantContext *context;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSWidgetRelevanceRelevantContextAttribute;
  v5 = -[CHSWidgetRelevanceAttribute _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    context = v5->_context;
    v5->_context = (LNRelevantContext *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_context, CFSTR("context"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  return -[LNRelevantContext hash](self->_context, "hash");
}

- (BOOL)isEqual:(id)a3
{
  CHSWidgetRelevanceRelevantContextAttribute *v4;
  char v5;

  v4 = (CHSWidgetRelevanceRelevantContextAttribute *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = BSEqualObjects();
    else
      v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHSWidgetRelevanceRelevantContextAttribute)initWithCoder:(id)a3
{
  id v4;
  CHSWidgetRelevanceRelevantContextAttribute *v5;
  uint64_t v6;
  LNRelevantContext *context;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSWidgetRelevanceRelevantContextAttribute;
  v5 = -[CHSWidgetRelevanceAttribute initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v6 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (LNRelevantContext *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_context, CFSTR("context"));
}

- (LNRelevantContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
