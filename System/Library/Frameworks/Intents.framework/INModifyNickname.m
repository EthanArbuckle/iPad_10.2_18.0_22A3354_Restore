@implementation INModifyNickname

- (INModifyNickname)initWithTargetNickname:(id)a3 isRemoval:(id)a4
{
  id v6;
  id v7;
  INModifyNickname *v8;
  uint64_t v9;
  NSString *targetNickname;
  uint64_t v11;
  NSNumber *isRemoval;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INModifyNickname;
  v8 = -[INModifyNickname init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    targetNickname = v8->_targetNickname;
    v8->_targetNickname = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    isRemoval = v8->_isRemoval;
    v8->_isRemoval = (NSNumber *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_targetNickname, "hash");
  return -[NSNumber hash](self->_isRemoval, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  INModifyNickname *v4;
  INModifyNickname *v5;
  NSString *targetNickname;
  NSNumber *isRemoval;
  BOOL v8;

  v4 = (INModifyNickname *)a3;
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
      targetNickname = self->_targetNickname;
      v8 = 0;
      if (targetNickname == v5->_targetNickname || -[NSString isEqual:](targetNickname, "isEqual:"))
      {
        isRemoval = self->_isRemoval;
        if (isRemoval == v5->_isRemoval || -[NSNumber isEqual:](isRemoval, "isEqual:"))
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

- (INModifyNickname)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  INModifyNickname *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetNickname"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isRemoval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[INModifyNickname initWithTargetNickname:isRemoval:](self, "initWithTargetNickname:isRemoval:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *targetNickname;
  id v5;

  targetNickname = self->_targetNickname;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", targetNickname, CFSTR("targetNickname"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isRemoval, CFSTR("isRemoval"));

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
  objc_msgSend(v6, "encodeObject:", self->_targetNickname);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("targetNickname"));

  objc_msgSend(v6, "encodeObject:", self->_isRemoval);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("isRemoval"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INModifyNickname descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INModifyNickname;
  -[INModifyNickname description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INModifyNickname _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *targetNickname;
  void *v4;
  NSNumber *isRemoval;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("targetNickname");
  targetNickname = self->_targetNickname;
  v4 = targetNickname;
  if (!targetNickname)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("isRemoval");
  v10[0] = v4;
  isRemoval = self->_isRemoval;
  v6 = isRemoval;
  if (!isRemoval)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isRemoval)
  {

    if (targetNickname)
      return v7;
LABEL_9:

    return v7;
  }
  if (!targetNickname)
    goto LABEL_9;
  return v7;
}

- (NSString)targetNickname
{
  return self->_targetNickname;
}

- (NSNumber)isRemoval
{
  return self->_isRemoval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isRemoval, 0);
  objc_storeStrong((id *)&self->_targetNickname, 0);
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
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("targetNickname"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isRemoval"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTargetNickname:isRemoval:", v11, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
