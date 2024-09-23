@implementation INHomeContent

- (INHomeContent)initWithFilter:(id)a3 actions:(id)a4
{
  id v6;
  id v7;
  INHomeContent *v8;
  uint64_t v9;
  INHomeFilter *filter;
  uint64_t v11;
  NSArray *actions;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INHomeContent;
  v8 = -[INHomeContent init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    filter = v8->_filter;
    v8->_filter = (INHomeFilter *)v9;

    v11 = objc_msgSend(v7, "copy");
    actions = v8->_actions;
    v8->_actions = (NSArray *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[INHomeFilter hash](self->_filter, "hash");
  return -[NSArray hash](self->_actions, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  INHomeContent *v4;
  INHomeContent *v5;
  INHomeFilter *filter;
  NSArray *actions;
  BOOL v8;

  v4 = (INHomeContent *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      filter = self->_filter;
      v8 = 0;
      if (filter == v5->_filter || -[INHomeFilter isEqual:](filter, "isEqual:"))
      {
        actions = self->_actions;
        if (actions == v5->_actions || -[NSArray isEqual:](actions, "isEqual:"))
          v8 = 1;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (INHomeContent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  INHomeContent *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("actions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[INHomeContent initWithFilter:actions:](self, "initWithFilter:actions:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  INHomeFilter *filter;
  id v5;

  filter = self->_filter;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", filter, CFSTR("filter"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actions, CFSTR("actions"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_filter);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("filter"));

  objc_msgSend(v6, "encodeObject:", self->_actions);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("actions"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INHomeContent descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INHomeContent;
  -[INHomeContent description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INHomeContent _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INHomeFilter *filter;
  void *v4;
  NSArray *actions;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("filter");
  filter = self->_filter;
  v4 = filter;
  if (!filter)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("actions");
  v10[0] = v4;
  actions = self->_actions;
  v6 = actions;
  if (!actions)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!actions)
  {

    if (filter)
      return v7;
LABEL_9:

    return v7;
  }
  if (!filter)
    goto LABEL_9;
  return v7;
}

- (INHomeFilter)filter
{
  return self->_filter;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_filter, 0);
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
  void *v15;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("filter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("actions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFilter:actions:", v11, v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
