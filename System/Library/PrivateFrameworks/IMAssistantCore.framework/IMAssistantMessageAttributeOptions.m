@implementation IMAssistantMessageAttributeOptions

- (IMAssistantMessageAttributeOptions)initWithAttributes:(unint64_t)a3
{
  return -[IMAssistantMessageAttributeOptions initWithAttributes:sanitizer:](self, "initWithAttributes:sanitizer:", a3, 0);
}

- (IMAssistantMessageAttributeOptions)initWithAttributes:(unint64_t)a3 sanitizer:(id)a4
{
  id v6;
  IMAssistantMessageAttributeOptions *v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)IMAssistantMessageAttributeOptions;
  v7 = -[IMAssistantMessageAttributeOptions init](&v9, sel_init);
  if (v7)
  {
    if (v6)
      a3 = objc_msgSend(v6, "sanitize:", a3);
    v7->_attributes = a3;
  }

  return v7;
}

- (BOOL)includeRead
{
  return -[IMAssistantMessageAttributeOptions attributes](self, "attributes") & 1;
}

- (BOOL)includeUnread
{
  return (-[IMAssistantMessageAttributeOptions attributes](self, "attributes") >> 1) & 1;
}

+ (id)optionsWithAttributes:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", a3);
}

+ (id)optionsWithAttributes:(unint64_t)a3 sanitizer:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:sanitizer:", a3, v6);

  return v7;
}

- (unint64_t)attributes
{
  return self->_attributes;
}

@end
