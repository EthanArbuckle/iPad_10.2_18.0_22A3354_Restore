@implementation _MFMailComposeContentVariation

- (_MFMailComposeContentVariation)initWithName:(id)a3
{
  id v4;
  _MFMailComposeContentVariation *v5;
  uint64_t v6;
  NSString *name;
  _MFMailComposeContentVariation *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MFMailComposeContentVariation;
  v5 = -[_MFMailComposeContentVariation init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)addAttachmentIdentifier:(id)a3
{
  NSMutableArray *attachmentIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MFMailComposeContentVariation.m"), 31, CFSTR("The actual type of the identifier is required to be a string for NSSecureCoding conformance."));

  }
  attachmentIdentifiers = self->_attachmentIdentifiers;
  if (!attachmentIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_attachmentIdentifiers;
    self->_attachmentIdentifiers = v6;

    attachmentIdentifiers = self->_attachmentIdentifiers;
  }
  -[NSMutableArray addObject:](attachmentIdentifiers, "addObject:", v9);

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p; name = %@>"),
               self,
               self,
               self->_name);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_MFMailComposeContentVariation)initWithCoder:(id)a3
{
  id v4;
  _MFMailComposeContentVariation *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *body;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *attachmentIdentifiers;
  _MFMailComposeContentVariation *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_MFMailComposeContentVariation;
  v5 = -[_MFMailComposeContentVariation init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("body")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
      v8 = objc_claimAutoreleasedReturnValue();
      body = v5->_body;
      v5->_body = (NSString *)v8;

      v5->_bodyIsHTML = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("bodyIsHTML"));
    }
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("attachmentIdentifiers"));
    v13 = objc_claimAutoreleasedReturnValue();
    attachmentIdentifiers = v5->_attachmentIdentifiers;
    v5->_attachmentIdentifiers = (NSMutableArray *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *body;
  NSMutableArray *attachmentIdentifiers;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_name, CFSTR("name"));
  body = self->_body;
  if (body)
  {
    objc_msgSend(v6, "encodeObject:forKey:", body, CFSTR("body"));
    objc_msgSend(v6, "encodeBool:forKey:", self->_bodyIsHTML, CFSTR("bodyIsHTML"));
  }
  attachmentIdentifiers = self->_attachmentIdentifiers;
  if (attachmentIdentifiers)
    objc_msgSend(v6, "encodeObject:forKey:", attachmentIdentifiers, CFSTR("attachmentIdentifiers"));

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)bodyIsHTML
{
  return self->_bodyIsHTML;
}

- (void)setBodyIsHTML:(BOOL)a3
{
  self->_bodyIsHTML = a3;
}

- (NSArray)attachmentIdentifiers
{
  return &self->_attachmentIdentifiers->super;
}

- (void)setAttachmentIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attachmentIdentifiers, 0);
}

@end
