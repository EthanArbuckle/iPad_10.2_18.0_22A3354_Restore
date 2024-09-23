@implementation INTextNoteContent

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[INTextNoteContent text](self, "text", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (INTextNoteContent)initWithText:(NSString *)text
{
  NSString *v5;
  INTextNoteContent *v6;
  INTextNoteContent *v7;
  objc_super v9;

  v5 = text;
  v9.receiver = self;
  v9.super_class = (Class)INTextNoteContent;
  v6 = -[INTextNoteContent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_text, text);

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_text, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *text;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    text = self->_text;
    v7 = text == (NSString *)v5[1] || -[NSString isEqual:](text, "isEqual:");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (INTextNoteContent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  INTextNoteContent *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (INTextNoteContent *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithText:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_text, CFSTR("text"));
}

- (id)_dictionaryRepresentation
{
  NSString *text;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("text");
  text = self->_text;
  v3 = text;
  if (!text)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!text)

  return v4;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
