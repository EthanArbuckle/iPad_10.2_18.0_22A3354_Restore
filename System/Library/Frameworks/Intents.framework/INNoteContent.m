@implementation INNoteContent

- (id)_intents_cacheableObjects
{
  return 0;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  return 0;
}

- (INNoteContent)initWithCoder:(id)a3
{
  INNoteContent *v4;

  v4 = (INNoteContent *)objc_alloc_init((Class)objc_opt_class());

  return v4;
}

- (NSString)description
{
  return (NSString *)-[INNoteContent descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INNoteContent;
  -[INNoteContent description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INNoteContent _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
