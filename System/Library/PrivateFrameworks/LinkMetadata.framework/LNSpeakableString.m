@implementation LNSpeakableString

- (LNSpeakableString)initWithSpoken:(id)a3 printed:(id)a4
{
  id v7;
  id v8;
  void *v9;
  LNSpeakableString *v10;
  uint64_t v11;
  LNStaticDeferredLocalizedString *spoken;
  uint64_t v13;
  LNStaticDeferredLocalizedString *printed;
  LNSpeakableString *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNSpeakableString.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("spoken"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNSpeakableString.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("printed"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNSpeakableString;
  v10 = -[LNSpeakableString init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    spoken = v10->_spoken;
    v10->_spoken = (LNStaticDeferredLocalizedString *)v11;

    v13 = objc_msgSend(v9, "copy");
    printed = v10->_printed;
    v10->_printed = (LNStaticDeferredLocalizedString *)v13;

    v15 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  LNSpeakableString *v4;
  LNSpeakableString *v5;
  LNSpeakableString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (LNSpeakableString *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNSpeakableString spoken](self, "spoken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNSpeakableString spoken](v6, "spoken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[LNSpeakableString printed](self, "printed");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNSpeakableString printed](v6, "printed");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNSpeakableString spoken](self, "spoken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNSpeakableString printed](self, "printed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSpeakableString spoken](self, "spoken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSpeakableString printed](self, "printed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, spoken: %@, printed: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (LNSpeakableString)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  LNSpeakableString *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spoken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("printed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      self = -[LNSpeakableString initWithSpoken:printed:](self, "initWithSpoken:printed:", v5, v6);
      v7 = self;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNSpeakableString spoken](self, "spoken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("spoken"));

  -[LNSpeakableString printed](self, "printed");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("printed"));

}

- (LNStaticDeferredLocalizedString)spoken
{
  return self->_spoken;
}

- (LNStaticDeferredLocalizedString)printed
{
  return self->_printed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printed, 0);
  objc_storeStrong((id *)&self->_spoken, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
