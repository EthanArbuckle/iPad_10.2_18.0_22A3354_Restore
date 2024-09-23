@implementation SWCollaborationOption

+ (SWCollaborationOption)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (SWCollaborationOption *)+[SWCollaborationOption allocWithZone:](_SWCollaborationOption, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SWCollaborationOption;
  return (SWCollaborationOption *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (SWCollaborationOption)initWithTitle:(NSString *)title identifier:(NSString *)identifier
{
  NSString *v6;
  NSString *v7;
  SWCollaborationOption *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  NSString *subtitle;
  objc_super v15;

  v6 = title;
  v7 = identifier;
  v15.receiver = self;
  v15.super_class = (Class)SWCollaborationOption;
  v8 = -[SWCollaborationOption init](&v15, sel_init);
  if (v8)
  {
    v9 = -[NSString copy](v6, "copy");
    v10 = v8->_title;
    v8->_title = (NSString *)v9;

    v11 = -[NSString copy](v7, "copy");
    v12 = v8->_identifier;
    v8->_identifier = (NSString *)v11;

    subtitle = v8->_subtitle;
    v8->_subtitle = (NSString *)&stru_1E217B478;

  }
  return v8;
}

- (SWCollaborationOption)init
{

  return 0;
}

+ (SWCollaborationOption)optionWithTitle:(NSString *)title identifier:(NSString *)identifier
{
  NSString *v6;
  NSString *v7;
  void *v8;

  v6 = identifier;
  v7 = title;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:identifier:", v7, v6);

  return (SWCollaborationOption *)v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SWCollaborationOption title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationOption identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SWCollaborationOption isSelected](self, "isSelected"))
    v6 = CFSTR(" ✓");
  else
    v6 = &stru_1E217B478;
  -[SWCollaborationOption requiredOptionsIdentifiers](self, "requiredOptionsIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("title: %@ identifier: %@ isSelected: %@ requiredOptions: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SWCollaborationOption *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SWCollaborationOption *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = self;
  -[SWCollaborationOption title](v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyWithZone:", a3);
  -[SWCollaborationOption identifier](v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);
  v9 = -[SWCollaborationOption initWithTitle:identifier:](v4, "initWithTitle:identifier:", v6, v8);

  if (v9)
  {
    -[SWCollaborationOption subtitle](v4, "subtitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
    -[SWCollaborationOption setSubtitle:](v9, "setSubtitle:", v11);

    -[SWCollaborationOption setSelected:](v9, "setSelected:", -[SWCollaborationOption isSelected](v4, "isSelected"));
    -[SWCollaborationOption requiredOptionsIdentifiers](v4, "requiredOptionsIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWCollaborationOption setRequiredOptionsIdentifiers:](v9, "setRequiredOptionsIdentifiers:", v12);

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[SWCollaborationOption isEqualToCollaborationOption:](self, "isEqualToCollaborationOption:", v4);

  return v5;
}

- (BOOL)isEqualToCollaborationOption:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SWCollaborationOption *v8;
  _BOOL4 v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;

  v8 = (SWCollaborationOption *)a3;
  if (v8 == self)
  {
    v10 = 1;
    goto LABEL_45;
  }
  v9 = -[SWCollaborationOption isSelected](self, "isSelected");
  if (v9 != -[SWCollaborationOption isSelected](v8, "isSelected"))
  {
    v10 = 0;
    goto LABEL_45;
  }
  -[SWCollaborationOption title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[SWCollaborationOption title](v8, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v31 = 0;
      goto LABEL_11;
    }
  }
  -[SWCollaborationOption title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationOption title](v8, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v5) & 1) != 0)
  {
    v31 = 1;
LABEL_11:
    -[SWCollaborationOption identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      || (-[SWCollaborationOption identifier](v8, "identifier"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SWCollaborationOption identifier](self, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWCollaborationOption identifier](v8, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isEqual:"))
      {
        v10 = 0;
        goto LABEL_37;
      }
      v26 = v13;
      v29 = 1;
    }
    else
    {
      v29 = 0;
    }
    -[SWCollaborationOption subtitle](self, "subtitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14
      || (-[SWCollaborationOption subtitle](v8, "subtitle"), (v22 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SWCollaborationOption subtitle](self, "subtitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWCollaborationOption subtitle](v8, "subtitle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v15;
      if (!objc_msgSend(v15, "isEqual:"))
      {
        v10 = 0;
LABEL_32:

        goto LABEL_33;
      }
      v25 = v3;
      v24 = 1;
    }
    else
    {
      v25 = v3;
      v22 = 0;
      v24 = 0;
    }
    -[SWCollaborationOption requiredOptionsIdentifiers](self, "requiredOptionsIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16
      || (-[SWCollaborationOption requiredOptionsIdentifiers](v8, "requiredOptionsIdentifiers"),
          (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v23 = v6;
      -[SWCollaborationOption requiredOptionsIdentifiers](self, "requiredOptionsIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWCollaborationOption requiredOptionsIdentifiers](v8, "requiredOptionsIdentifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v17, "isEqual:", v18);

      if (v16)
      {

        if (v24)
        {
          v6 = v23;
          v3 = v25;
          goto LABEL_32;
        }
        v6 = v23;
        v3 = v25;
LABEL_33:
        if (!v14)

        if (!v29)
          goto LABEL_38;
        v13 = v26;
LABEL_37:

LABEL_38:
        if (!v12)

        if (v31)
        {

        }
        goto LABEL_42;
      }
      v6 = v23;
      v19 = (void *)v21;
    }
    else
    {
      v19 = 0;
      v10 = 1;
    }

    v3 = v25;
    if ((v24 & 1) != 0)
      goto LABEL_32;
    goto LABEL_33;
  }

  v10 = 0;
LABEL_42:
  if (!v11)

LABEL_45:
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWCollaborationOption)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  SWCollaborationOption *v13;
  uint64_t v14;
  NSString *subtitle;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *requiredOptionsIdentifiers;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = &stru_1E217B478;
  v8 = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (__CFString *)v9;
  else
    v11 = &stru_1E217B478;
  v12 = v11;

  v13 = -[SWCollaborationOption initWithTitle:identifier:](self, "initWithTitle:identifier:", v8, v12);
  if (v13)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v14 = objc_claimAutoreleasedReturnValue();
    subtitle = v13->_subtitle;
    v13->_subtitle = (NSString *)v14;

    v13->_selected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("selected"));
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("requiredOptionsIdentifiers"));
    v19 = objc_claimAutoreleasedReturnValue();
    requiredOptionsIdentifiers = v13->_requiredOptionsIdentifiers;
    v13->_requiredOptionsIdentifiers = (NSArray *)v19;

  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SWCollaborationOption title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[SWCollaborationOption identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  -[SWCollaborationOption subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("subtitle"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SWCollaborationOption isSelected](self, "isSelected"), CFSTR("selected"));
  -[SWCollaborationOption requiredOptionsIdentifiers](self, "requiredOptionsIdentifiers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("requiredOptionsIdentifiers"));

}

- (SWCollaborationOption)initWithTitle:(id)a3 identifier:(id)a4 subtitle:(id)a5 selected:(BOOL)a6 requiredOptionsIdentifiers:(id)a7
{
  id v13;
  id v14;
  SWCollaborationOption *v15;
  SWCollaborationOption *v16;

  v13 = a5;
  v14 = a7;
  v15 = -[SWCollaborationOption initWithTitle:identifier:](self, "initWithTitle:identifier:", a3, a4);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_subtitle, a5);
    v16->_selected = a6;
    objc_storeStrong((id *)&v16->_requiredOptionsIdentifiers, a7);
  }

  return v16;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(NSString *)title
{
  objc_setProperty_nonatomic_copy(self, a2, title, 16);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(NSString *)subtitle
{
  objc_setProperty_nonatomic_copy(self, a2, subtitle, 32);
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)selected
{
  self->_selected = selected;
}

- (NSArray)requiredOptionsIdentifiers
{
  return self->_requiredOptionsIdentifiers;
}

- (void)setRequiredOptionsIdentifiers:(NSArray *)requiredOptionsIdentifiers
{
  objc_setProperty_nonatomic_copy(self, a2, requiredOptionsIdentifiers, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredOptionsIdentifiers, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
