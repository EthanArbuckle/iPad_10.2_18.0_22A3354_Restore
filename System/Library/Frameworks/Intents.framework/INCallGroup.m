@implementation INCallGroup

- (INCallGroup)initWithGroupName:(NSString *)groupName groupId:(NSString *)groupId
{
  NSString *v6;
  NSString *v7;
  INCallGroup *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  objc_super v14;

  v6 = groupName;
  v7 = groupId;
  v14.receiver = self;
  v14.super_class = (Class)INCallGroup;
  v8 = -[INCallGroup init](&v14, sel_init);
  if (v8)
  {
    v9 = -[NSString copy](v6, "copy");
    v10 = v8->_groupName;
    v8->_groupName = (NSString *)v9;

    v11 = -[NSString copy](v7, "copy");
    v12 = v8->_groupId;
    v8->_groupId = (NSString *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_groupName, "hash");
  return -[NSString hash](self->_groupId, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  INCallGroup *v4;
  INCallGroup *v5;
  NSString *groupName;
  NSString *groupId;
  BOOL v8;

  v4 = (INCallGroup *)a3;
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
      groupName = self->_groupName;
      v8 = 0;
      if (groupName == v5->_groupName || -[NSString isEqual:](groupName, "isEqual:"))
      {
        groupId = self->_groupId;
        if (groupId == v5->_groupId || -[NSString isEqual:](groupId, "isEqual:"))
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

- (INCallGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  INCallGroup *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[INCallGroup initWithGroupName:groupId:](self, "initWithGroupName:groupId:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *groupName;
  id v5;

  groupName = self->_groupName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", groupName, CFSTR("groupName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupId, CFSTR("groupId"));

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
  objc_msgSend(v6, "encodeObject:", self->_groupName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("groupName"));

  objc_msgSend(v6, "encodeObject:", self->_groupId);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("groupId"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INCallGroup descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INCallGroup;
  -[INCallGroup description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCallGroup _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *groupName;
  void *v4;
  NSString *groupId;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("groupName");
  groupName = self->_groupName;
  v4 = groupName;
  if (!groupName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("groupId");
  v10[0] = v4;
  groupId = self->_groupId;
  v6 = groupId;
  if (!groupId)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!groupId)
  {

    if (groupName)
      return v7;
LABEL_9:

    return v7;
  }
  if (!groupName)
    goto LABEL_9;
  return v7;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSString)groupId
{
  return self->_groupId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
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
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("groupName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("groupId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGroupName:groupId:", v11, v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
