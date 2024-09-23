@implementation SWCollaborationOptionsGroup

+ (SWCollaborationOptionsGroup)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (SWCollaborationOptionsGroup *)+[SWCollaborationOptionsGroup allocWithZone:](_SWCollaborationOptionsGroup, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SWCollaborationOptionsGroup;
  return (SWCollaborationOptionsGroup *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (SWCollaborationOptionsGroup)initWithIdentifier:(NSString *)identifier options:(NSArray *)options
{
  NSString *v6;
  NSArray *v7;
  SWCollaborationOptionsGroup *v8;
  SWCollaborationOptionsGroup *v9;
  NSString *title;
  uint64_t v11;
  NSString *v12;
  NSString *footer;
  uint64_t v14;
  NSArray *v15;
  objc_super v17;

  v6 = identifier;
  v7 = options;
  v17.receiver = self;
  v17.super_class = (Class)SWCollaborationOptionsGroup;
  v8 = -[SWCollaborationOptionsGroup init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    title = v8->_title;
    v8->_title = (NSString *)&stru_1E217B478;

    v11 = -[NSString copy](v6, "copy");
    v12 = v9->_identifier;
    v9->_identifier = (NSString *)v11;

    footer = v9->_footer;
    v9->_footer = (NSString *)&stru_1E217B478;

    v14 = -[NSArray copy](v7, "copy");
    v15 = v9->_options;
    v9->_options = (NSArray *)v14;

  }
  return v9;
}

+ (SWCollaborationOptionsGroup)optionsGroupWithIdentifier:(NSString *)identifier options:(NSArray *)options
{
  NSArray *v6;
  NSString *v7;
  void *v8;

  v6 = options;
  v7 = identifier;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:options:", v7, v6);

  return (SWCollaborationOptionsGroup *)v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[SWCollaborationOptionsGroup title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SWCollaborationOptionsGroup title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

  }
  else
  {
    v5 = (void *)objc_opt_new();
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SWCollaborationOptionsGroup options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v5, "length"))
          objc_msgSend(v5, "appendString:", CFSTR("\n"));
        objc_msgSend(v11, "title");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isSelected"))
          v13 = CFSTR("YES");
        else
          v13 = CFSTR("NO");
        objc_msgSend(v5, "appendFormat:", CFSTR("- %@: %@"), v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[SWCollaborationOptionsGroup footer](self, "footer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SWCollaborationOptionsGroup footer](self, "footer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v15);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[SWCollaborationOptionsGroup isEqualToCollaborationOptionsGroup:](self, "isEqualToCollaborationOptionsGroup:", v4);

  return v5;
}

- (BOOL)isEqualToCollaborationOptionsGroup:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SWCollaborationOptionsGroup *v9;
  void *v10;
  char v11;
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
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;

  v9 = (SWCollaborationOptionsGroup *)a3;
  if (v9 == self)
  {
    v11 = 1;
    goto LABEL_46;
  }
  -[SWCollaborationOptionsGroup title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    || (-[SWCollaborationOptionsGroup title](v9, "title"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWCollaborationOptionsGroup title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWCollaborationOptionsGroup title](v9, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

      v11 = 0;
      goto LABEL_43;
    }
    v32 = 1;
  }
  else
  {
    v32 = 0;
  }
  -[SWCollaborationOptionsGroup identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[SWCollaborationOptionsGroup identifier](v9, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v31 = 0;
      goto LABEL_19;
    }
  }
  v7 = v3;
  -[SWCollaborationOptionsGroup identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationOptionsGroup identifier](v9, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqual:", v14) & 1) != 0)
  {
    v28 = v14;
    v29 = v13;
    v31 = 1;
    v3 = v7;
LABEL_19:
    -[SWCollaborationOptionsGroup footer](self, "footer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15
      || (-[SWCollaborationOptionsGroup footer](v9, "footer"), (v23 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SWCollaborationOptionsGroup footer](self, "footer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWCollaborationOptionsGroup footer](v9, "footer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isEqual:"))
      {
        v11 = 0;
LABEL_34:

LABEL_35:
        if (!v15)

        if (v31)
        {

        }
        if (!v12)

        if (!v32)
          goto LABEL_43;
        goto LABEL_42;
      }
      v27 = v6;
      v26 = 1;
    }
    else
    {
      v27 = v6;
      v23 = 0;
      v26 = 0;
    }
    -[SWCollaborationOptionsGroup options](self, "options");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16
      || (-[SWCollaborationOptionsGroup options](v9, "options"), (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v24 = v7;
      v25 = v3;
      -[SWCollaborationOptionsGroup options](self, "options", v21, v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWCollaborationOptionsGroup options](v9, "options");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v17, "isEqual:", v18);

      if (v16)
      {

        v7 = v24;
        if (!v26)
        {
          v3 = v25;
          v6 = v27;
          goto LABEL_35;
        }
        v3 = v25;
        v6 = v27;
        goto LABEL_34;
      }
      v7 = v24;
      v3 = v25;
      v19 = v22;
    }
    else
    {
      v19 = 0;
      v11 = 1;
    }

    v6 = v27;
    if ((v26 & 1) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }

  if (v12)
  else

  v11 = 0;
  v3 = v7;
  if ((v32 & 1) != 0)
  {
LABEL_42:

  }
LABEL_43:
  if (!v10)

LABEL_46:
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = objc_alloc((Class)objc_opt_class());
  -[SWCollaborationOptionsGroup identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[SWCollaborationOptionsGroup options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  v10 = (void *)objc_msgSend(v5, "initWithIdentifier:options:", v7, v9);

  if (v10)
  {
    -[SWCollaborationOptionsGroup title](self, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
    objc_msgSend(v10, "setTitle:", v12);

    -[SWCollaborationOptionsGroup footer](self, "footer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
    objc_msgSend(v10, "setFooter:", v14);

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWCollaborationOptionsGroup)initWithCoder:(id)a3
{
  id v4;
  SWCollaborationOptionsGroup *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSString *footer;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *options;

  v4 = a3;
  v5 = -[SWCollaborationOptionsGroup init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("footer"));
    v10 = objc_claimAutoreleasedReturnValue();
    footer = v5->_footer;
    v5->_footer = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("options"));
    v16 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSArray *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SWCollaborationOptionsGroup title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[SWCollaborationOptionsGroup identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  -[SWCollaborationOptionsGroup footer](self, "footer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("footer"));

  -[SWCollaborationOptionsGroup options](self, "options");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("options"));

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(NSString *)title
{
  objc_setProperty_nonatomic_copy(self, a2, title, 8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(NSString *)footer
{
  objc_setProperty_nonatomic_copy(self, a2, footer, 24);
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(NSArray *)options
{
  objc_setProperty_nonatomic_copy(self, a2, options, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
