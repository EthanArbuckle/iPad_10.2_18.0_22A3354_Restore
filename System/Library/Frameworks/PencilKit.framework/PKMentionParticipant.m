@implementation PKMentionParticipant

+ (id)mentionWithDisplayName:(id)a3 identifier:(id)a4 color:(id)a5
{
  id v7;
  id v8;
  id v9;
  PKMentionParticipant *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PKMentionParticipant initWithDisplayName:identifier:color:]([PKMentionParticipant alloc], "initWithDisplayName:identifier:color:", v9, v8, v7);

  return v10;
}

- (PKMentionParticipant)initWithDisplayName:(id)a3 identifier:(id)a4 color:(id)a5
{
  UIColor *v8;
  id v9;
  id v10;
  PKMentionParticipant *v11;
  uint64_t v12;
  NSString *displayName;
  uint64_t v14;
  NSString *identifier;
  UIColor *color;
  objc_super v18;

  v8 = (UIColor *)a5;
  v18.receiver = self;
  v18.super_class = (Class)PKMentionParticipant;
  v9 = a4;
  v10 = a3;
  v11 = -[PKMentionParticipant init](&v18, sel_init);
  v12 = objc_msgSend(v10, "copy", v18.receiver, v18.super_class);

  displayName = v11->_displayName;
  v11->_displayName = (NSString *)v12;

  v14 = objc_msgSend(v9, "copy");
  identifier = v11->_identifier;
  v11->_identifier = (NSString *)v14;

  color = v11->_color;
  v11->_color = v8;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMentionParticipant identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PKMentionParticipant displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMentionParticipant identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMentionParticipant color](self, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%p, \"%@\", \"%@\", %@"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
