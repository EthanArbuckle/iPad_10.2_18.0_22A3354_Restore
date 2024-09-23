@implementation INModifyRelationship

- (INModifyRelationship)initWithTargetRelationship:(id)a3 isRemoval:(id)a4
{
  id v6;
  id v7;
  INModifyRelationship *v8;
  uint64_t v9;
  NSString *targetRelationship;
  uint64_t v11;
  NSNumber *isRemoval;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INModifyRelationship;
  v8 = -[INModifyRelationship init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    targetRelationship = v8->_targetRelationship;
    v8->_targetRelationship = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    isRemoval = v8->_isRemoval;
    v8->_isRemoval = (NSNumber *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_targetRelationship, "hash");
  return -[NSNumber hash](self->_isRemoval, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  INModifyRelationship *v4;
  INModifyRelationship *v5;
  NSString *targetRelationship;
  NSNumber *isRemoval;
  BOOL v8;

  v4 = (INModifyRelationship *)a3;
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
      targetRelationship = self->_targetRelationship;
      v8 = 0;
      if (targetRelationship == v5->_targetRelationship
        || -[NSString isEqual:](targetRelationship, "isEqual:"))
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

- (INModifyRelationship)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  INModifyRelationship *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetRelationship"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isRemoval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[INModifyRelationship initWithTargetRelationship:isRemoval:](self, "initWithTargetRelationship:isRemoval:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *targetRelationship;
  id v5;

  targetRelationship = self->_targetRelationship;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", targetRelationship, CFSTR("targetRelationship"));
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
  objc_msgSend(v6, "encodeObject:", self->_targetRelationship);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("targetRelationship"));

  objc_msgSend(v6, "encodeObject:", self->_isRemoval);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("isRemoval"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INModifyRelationship descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INModifyRelationship;
  -[INModifyRelationship description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INModifyRelationship _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *targetRelationship;
  void *v4;
  NSNumber *isRemoval;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("targetRelationship");
  targetRelationship = self->_targetRelationship;
  v4 = targetRelationship;
  if (!targetRelationship)
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

    if (targetRelationship)
      return v7;
LABEL_9:

    return v7;
  }
  if (!targetRelationship)
    goto LABEL_9;
  return v7;
}

- (NSString)targetRelationship
{
  return self->_targetRelationship;
}

- (NSNumber)isRemoval
{
  return self->_isRemoval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isRemoval, 0);
  objc_storeStrong((id *)&self->_targetRelationship, 0);
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
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("targetRelationship"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isRemoval"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTargetRelationship:isRemoval:", v11, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
