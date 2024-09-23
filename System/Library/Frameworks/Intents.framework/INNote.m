@implementation INNote

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[INNote title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_intents_readableTitleWithLocalizer:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)-[INNote copy](self, "copy");
    -[INNote contents](self, "contents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __68__INNote_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
      v10[3] = &unk_1E228C4F0;
      v10[4] = v8;
      v11 = v7;
      objc_msgSend(v9, "_injectProxiesForImages:completion:", v6, v10);

    }
    else
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v8);
    }

  }
}

uint64_t __68__INNote_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_setContents:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[INNote contents](self, "contents", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "_intents_cacheableObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v10 = v3;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[INNote contents](self, "contents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_intents_updateContainerWithCache:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (INNote)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INNote;
  return -[INNote init](&v3, sel_init);
}

- (INNote)initWithTitle:(INSpeakableString *)title contents:(NSArray *)contents groupName:(INSpeakableString *)groupName createdDateComponents:(NSDateComponents *)createdDateComponents modifiedDateComponents:(NSDateComponents *)modifiedDateComponents identifier:(NSString *)identifier
{
  INSpeakableString *v14;
  NSArray *v15;
  INSpeakableString *v16;
  NSDateComponents *v17;
  NSDateComponents *v18;
  NSString *v19;
  INNote *v20;
  uint64_t v21;
  INSpeakableString *v22;
  uint64_t v23;
  NSArray *v24;
  uint64_t v25;
  INSpeakableString *v26;
  uint64_t v27;
  NSDateComponents *v28;
  uint64_t v29;
  NSDateComponents *v30;
  uint64_t v31;
  NSString *v32;
  objc_super v34;

  v14 = title;
  v15 = contents;
  v16 = groupName;
  v17 = createdDateComponents;
  v18 = modifiedDateComponents;
  v19 = identifier;
  v34.receiver = self;
  v34.super_class = (Class)INNote;
  v20 = -[INNote init](&v34, sel_init);
  if (v20)
  {
    v21 = -[INSpeakableString copy](v14, "copy");
    v22 = v20->_title;
    v20->_title = (INSpeakableString *)v21;

    v23 = -[NSArray copy](v15, "copy");
    v24 = v20->_contents;
    v20->_contents = (NSArray *)v23;

    v25 = -[INSpeakableString copy](v16, "copy");
    v26 = v20->_groupName;
    v20->_groupName = (INSpeakableString *)v25;

    v27 = -[NSDateComponents copy](v17, "copy");
    v28 = v20->_createdDateComponents;
    v20->_createdDateComponents = (NSDateComponents *)v27;

    v29 = -[NSDateComponents copy](v18, "copy");
    v30 = v20->_modifiedDateComponents;
    v20->_modifiedDateComponents = (NSDateComponents *)v29;

    v31 = -[NSString copy](v19, "copy");
    v32 = v20->_identifier;
    v20->_identifier = (NSString *)v31;

  }
  return v20;
}

- (INNote)initWithTitle:(id)a3 contents:(id)a4 groupName:(id)a5 createdDateComponents:(id)a6 modifiedDateComponents:(id)a7 identifier:(id)a8 accountIdentifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  INNote *v22;
  uint64_t v23;
  INSpeakableString *title;
  uint64_t v25;
  NSArray *contents;
  uint64_t v27;
  INSpeakableString *groupName;
  uint64_t v29;
  NSDateComponents *createdDateComponents;
  uint64_t v31;
  NSDateComponents *modifiedDateComponents;
  uint64_t v33;
  NSString *identifier;
  uint64_t v35;
  NSString *accountIdentifier;
  objc_super v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)INNote;
  v22 = -[INNote init](&v38, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    title = v22->_title;
    v22->_title = (INSpeakableString *)v23;

    v25 = objc_msgSend(v16, "copy");
    contents = v22->_contents;
    v22->_contents = (NSArray *)v25;

    v27 = objc_msgSend(v17, "copy");
    groupName = v22->_groupName;
    v22->_groupName = (INSpeakableString *)v27;

    v29 = objc_msgSend(v18, "copy");
    createdDateComponents = v22->_createdDateComponents;
    v22->_createdDateComponents = (NSDateComponents *)v29;

    v31 = objc_msgSend(v19, "copy");
    modifiedDateComponents = v22->_modifiedDateComponents;
    v22->_modifiedDateComponents = (NSDateComponents *)v31;

    v33 = objc_msgSend(v20, "copy");
    identifier = v22->_identifier;
    v22->_identifier = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    accountIdentifier = v22->_accountIdentifier;
    v22->_accountIdentifier = (NSString *)v35;

  }
  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;

  v3 = -[INSpeakableString hash](self->_title, "hash");
  v4 = -[NSArray hash](self->_contents, "hash") ^ v3;
  v5 = -[INSpeakableString hash](self->_groupName, "hash");
  v6 = v4 ^ v5 ^ -[NSDateComponents hash](self->_createdDateComponents, "hash");
  v7 = -[NSDateComponents hash](self->_modifiedDateComponents, "hash");
  v8 = v7 ^ -[NSString hash](self->_identifier, "hash");
  return v6 ^ v8 ^ -[NSString hash](self->_accountIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INNote *v4;
  INNote *v5;
  INSpeakableString *title;
  NSArray *contents;
  INSpeakableString *groupName;
  NSDateComponents *createdDateComponents;
  NSDateComponents *modifiedDateComponents;
  NSString *identifier;
  NSString *accountIdentifier;
  BOOL v13;

  v4 = (INNote *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      title = self->_title;
      v13 = 0;
      if (title == v5->_title || -[INSpeakableString isEqual:](title, "isEqual:"))
      {
        contents = self->_contents;
        if (contents == v5->_contents || -[NSArray isEqual:](contents, "isEqual:"))
        {
          groupName = self->_groupName;
          if (groupName == v5->_groupName || -[INSpeakableString isEqual:](groupName, "isEqual:"))
          {
            createdDateComponents = self->_createdDateComponents;
            if (createdDateComponents == v5->_createdDateComponents
              || -[NSDateComponents isEqual:](createdDateComponents, "isEqual:"))
            {
              modifiedDateComponents = self->_modifiedDateComponents;
              if (modifiedDateComponents == v5->_modifiedDateComponents
                || -[NSDateComponents isEqual:](modifiedDateComponents, "isEqual:"))
              {
                identifier = self->_identifier;
                if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
                {
                  accountIdentifier = self->_accountIdentifier;
                  if (accountIdentifier == v5->_accountIdentifier
                    || -[NSString isEqual:](accountIdentifier, "isEqual:"))
                  {
                    v13 = 1;
                  }
                }
              }
            }
          }
        }
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (INNote)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  INNote *v19;
  void *v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("contents"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdDateComponents"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modifiedDateComponents"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("identifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v17, CFSTR("accountIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[INNote initWithTitle:contents:groupName:createdDateComponents:modifiedDateComponents:identifier:accountIdentifier:](self, "initWithTitle:contents:groupName:createdDateComponents:modifiedDateComponents:identifier:accountIdentifier:", v21, v7, v8, v9, v10, v14, v18);
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  INSpeakableString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contents, CFSTR("contents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupName, CFSTR("groupName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_createdDateComponents, CFSTR("createdDateComponents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modifiedDateComponents, CFSTR("modifiedDateComponents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_title);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("title"));

  objc_msgSend(v6, "encodeObject:", self->_contents);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("contents"));

  objc_msgSend(v6, "encodeObject:", self->_groupName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("groupName"));

  objc_msgSend(v6, "encodeObject:", self->_createdDateComponents);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("createdDateComponents"));

  objc_msgSend(v6, "encodeObject:", self->_modifiedDateComponents);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("modifiedDateComponents"));

  objc_msgSend(v6, "encodeObject:", self->_identifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("identifier"));

  objc_msgSend(v6, "encodeObject:", self->_accountIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("accountIdentifier"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INNote descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INNote;
  -[INNote description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INNote _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t title;
  NSArray *contents;
  uint64_t v5;
  INSpeakableString *groupName;
  uint64_t v7;
  NSDateComponents *createdDateComponents;
  uint64_t v9;
  NSDateComponents *modifiedDateComponents;
  void *v11;
  NSString *identifier;
  void *v13;
  NSString *accountIdentifier;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[7];
  _QWORD v24[9];

  v24[7] = *MEMORY[0x1E0C80C00];
  title = (uint64_t)self->_title;
  v22 = title;
  v23[0] = CFSTR("title");
  if (!title)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    title = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)title;
  v24[0] = title;
  v23[1] = CFSTR("contents");
  contents = self->_contents;
  v5 = (uint64_t)contents;
  if (!contents)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v5;
  v24[1] = v5;
  v23[2] = CFSTR("groupName");
  groupName = self->_groupName;
  v7 = (uint64_t)groupName;
  if (!groupName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v7;
  v24[2] = v7;
  v23[3] = CFSTR("createdDateComponents");
  createdDateComponents = self->_createdDateComponents;
  v9 = (uint64_t)createdDateComponents;
  if (!createdDateComponents)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v9;
  v24[3] = v9;
  v23[4] = CFSTR("modifiedDateComponents");
  modifiedDateComponents = self->_modifiedDateComponents;
  v11 = modifiedDateComponents;
  if (!modifiedDateComponents)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[4] = v11;
  v23[5] = CFSTR("identifier");
  identifier = self->_identifier;
  v13 = identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[5] = v13;
  v23[6] = CFSTR("accountIdentifier");
  accountIdentifier = self->_accountIdentifier;
  v15 = accountIdentifier;
  if (!accountIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[6] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (accountIdentifier)
  {
    if (identifier)
      goto LABEL_17;
  }
  else
  {

    if (identifier)
    {
LABEL_17:
      if (modifiedDateComponents)
        goto LABEL_18;
      goto LABEL_26;
    }
  }

  if (modifiedDateComponents)
  {
LABEL_18:
    if (createdDateComponents)
      goto LABEL_19;
    goto LABEL_27;
  }
LABEL_26:

  if (createdDateComponents)
  {
LABEL_19:
    if (groupName)
      goto LABEL_20;
LABEL_28:

    if (contents)
      goto LABEL_21;
    goto LABEL_29;
  }
LABEL_27:

  if (!groupName)
    goto LABEL_28;
LABEL_20:
  if (contents)
    goto LABEL_21;
LABEL_29:

LABEL_21:
  if (!v22)

  return v16;
}

- (INSpeakableString)title
{
  return self->_title;
}

- (NSArray)contents
{
  return self->_contents;
}

- (void)_setContents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (INSpeakableString)groupName
{
  return self->_groupName;
}

- (NSDateComponents)createdDateComponents
{
  return self->_createdDateComponents;
}

- (NSDateComponents)modifiedDateComponents
{
  return self->_modifiedDateComponents;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modifiedDateComponents, 0);
  objc_storeStrong((id *)&self->_createdDateComponents, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("contents"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("groupName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("createdDateComponents"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("modifiedDateComponents"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("accountIdentifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:contents:groupName:createdDateComponents:modifiedDateComponents:identifier:accountIdentifier:", v11, v14, v17, v20, v23, v24, v25);

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

@end
