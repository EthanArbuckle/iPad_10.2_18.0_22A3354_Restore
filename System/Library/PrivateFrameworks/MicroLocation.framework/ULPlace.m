@implementation ULPlace

- (ULPlace)initWithIdentifier:(id)a3 score:(id)a4
{
  id v6;
  id v7;
  ULPlace *v8;
  ULPlace *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ULPlace;
  v8 = -[ULPlace init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ULPlace setIdentifier:](v8, "setIdentifier:", v6);
    -[ULPlace setScore:](v9, "setScore:", v7);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = objc_alloc((Class)objc_opt_class());
  -[ULPlace identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[ULPlace score](self, "score");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  v10 = (void *)objc_msgSend(v5, "initWithIdentifier:score:", v7, v9);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_score, CFSTR("score"));

}

- (ULPlace)initWithCoder:(id)a3
{
  id v4;
  ULPlace *v5;
  void *v6;
  uint64_t v7;
  NSUUID *identifier;
  void *v9;
  uint64_t v10;
  NSNumber *score;
  ULPlace *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ULPlace;
  v5 = -[ULPlace init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v7 = objc_claimAutoreleasedReturnValue();

    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("score"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v10 = objc_claimAutoreleasedReturnValue();

    score = v5->_score;
    v5->_score = (NSNumber *)v10;

    v12 = v5;
  }

  return v5;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(v6, "appendFormat:", CFSTR(", identifier: %@"), self->_identifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(", score: %@"), self->_score);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[ULPlace identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {

    }
    else
    {
      -[ULPlace identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v10)
      {
        v8 = 0;
LABEL_10:

        goto LABEL_11;
      }
    }
    -[ULPlace score](self, "score");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "score");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", v12))
    {

      v8 = 1;
    }
    else
    {
      -[ULPlace score](self, "score");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "score");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13 != v14;

      v8 = !v15;
    }
    goto LABEL_10;
  }
  v8 = 0;
LABEL_11:

  return v8 & 1;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSUUID hash](self->_identifier, "hash");
  return -[NSNumber hash](self->_score, "hash") ^ v3;
}

- (ULPlace)init
{
  __assert_rtn("-[ULPlace init]", "ULConnectionDelegateTypes.m", 697, "NO");
}

+ (id)new
{
  __assert_rtn("+[ULPlace new]", "ULConnectionDelegateTypes.m", 702, "NO");
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_storeStrong((id *)&self->_score, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
