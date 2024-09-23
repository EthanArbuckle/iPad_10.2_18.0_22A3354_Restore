@implementation CTSimLabel

- (CTSimLabel)initWithId:(id)a3 andText:(id)a4 andDidSetup:(BOOL)a5
{
  id v9;
  id v10;
  CTSimLabel *v11;
  CTSimLabel *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CTSimLabel;
  v11 = -[CTSimLabel init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_unique_id, a3);
    objc_storeStrong((id *)&v12->_text, a4);
    v12->_didSetup = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CTSimLabel *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  _BOOL4 v14;

  v8 = (CTSimLabel *)a3;
  if (v8 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTSimLabel unique_id](self, "unique_id");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTSimLabel unique_id](v8, "unique_id");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        -[CTSimLabel unique_id](self, "unique_id");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSimLabel unique_id](v8, "unique_id");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqualToString:", v4))
        {
          LOBYTE(v11) = 0;
          goto LABEL_15;
        }
      }
      -[CTSimLabel text](self, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTSimLabel text](v8, "text");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v13
        || (-[CTSimLabel text](self, "text"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            -[CTSimLabel text](v8, "text"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v5, "isEqualToString:", v6)))
      {
        v14 = -[CTSimLabel didSetup](self, "didSetup");
        v11 = v14 ^ -[CTSimLabel didSetup](v8, "didSetup") ^ 1;
        if (v12 == v13)
        {

LABEL_14:
          if (v9 == v10)
          {
LABEL_16:

            goto LABEL_17;
          }
LABEL_15:

          goto LABEL_16;
        }
      }
      else
      {
        LOBYTE(v11) = 0;
      }

      goto LABEL_14;
    }
    LOBYTE(v11) = 0;
  }
LABEL_17:

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSimLabel unique_id](self, "unique_id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", unique-id=%@"), v4);

  -[CTSimLabel text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", text=%@"), v5);

  v6 = -[CTSimLabel didSetup](self, "didSetup");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR(", didSetup=%@"), v7);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTSimLabel unique_id](self, "unique_id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setUnique_id:", v6);

  -[CTSimLabel text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setText:", v8);

  objc_msgSend(v4, "setDidSetup:", -[CTSimLabel didSetup](self, "didSetup"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CTSimLabel unique_id](self, "unique_id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("unique-id"));

  -[CTSimLabel text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("text"));

  objc_msgSend(v6, "encodeBool:forKey:", -[CTSimLabel didSetup](self, "didSetup"), CFSTR("didSetup"));
}

- (CTSimLabel)initWithCoder:(id)a3
{
  id v4;
  CTSimLabel *v5;
  uint64_t v6;
  NSString *unique_id;
  uint64_t v8;
  NSString *text;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTSimLabel;
  v5 = -[CTSimLabel init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unique-id"));
    v6 = objc_claimAutoreleasedReturnValue();
    unique_id = v5->_unique_id;
    v5->_unique_id = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v8 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v8;

    v5->_didSetup = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didSetup"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)unique_id
{
  return self->_unique_id;
}

- (void)setUnique_id:(id)a3
{
  objc_storeStrong((id *)&self->_unique_id, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (BOOL)didSetup
{
  return self->_didSetup;
}

- (void)setDidSetup:(BOOL)a3
{
  self->_didSetup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_unique_id, 0);
}

@end
