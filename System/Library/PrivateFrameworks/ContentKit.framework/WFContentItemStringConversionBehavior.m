@implementation WFContentItemStringConversionBehavior

- (WFContentItemStringConversionBehavior)initWithProperty:(id)a3 description:(id)a4
{
  id v8;
  id v9;
  WFContentItemStringConversionBehavior *v10;
  WFContentItemStringConversionBehavior *v11;
  uint64_t v12;
  NSString *behaviorDescription;
  WFContentItemStringConversionBehavior *v14;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContentItemStringConversionBehavior.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("description"));

  }
  v17.receiver = self;
  v17.super_class = (Class)WFContentItemStringConversionBehavior;
  v10 = -[WFContentItemStringConversionBehavior init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_property, a3);
    v12 = objc_msgSend(v9, "copy");
    behaviorDescription = v11->_behaviorDescription;
    v11->_behaviorDescription = (NSString *)v12;

    v14 = v11;
  }

  return v11;
}

- (WFContentProperty)property
{
  return self->_property;
}

- (NSString)behaviorDescription
{
  return self->_behaviorDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorDescription, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

+ (id)accessingProperty:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentItemStringConversionBehavior.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("property"));

  }
  v6 = objc_alloc((Class)a1);
  objc_msgSend(v5, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithProperty:description:", v5, v7);

  return v8;
}

+ (id)coercingToStringWithDescription:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProperty:description:", 0, v4);

  return v5;
}

@end
