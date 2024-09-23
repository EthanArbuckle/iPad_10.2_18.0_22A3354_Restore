@implementation LNAppShortcutNegativePhrase

- (LNAppShortcutNegativePhrase)initWithPhrase:(id)a3
{
  id v5;
  LNAppShortcutNegativePhrase *v6;
  uint64_t v7;
  LNStaticDeferredLocalizedString *phrase;
  LNAppShortcutNegativePhrase *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppShortcutNegativePhrase.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phrase"));

  }
  v12.receiver = self;
  v12.super_class = (Class)LNAppShortcutNegativePhrase;
  v6 = -[LNAppShortcutNegativePhrase init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    phrase = v6->_phrase;
    v6->_phrase = (LNStaticDeferredLocalizedString *)v7;

    v9 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phrase, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNAppShortcutNegativePhrase phrase](self, "phrase");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("phrase"));

}

- (LNAppShortcutNegativePhrase)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNAppShortcutNegativePhrase *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phrase"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNAppShortcutNegativePhrase initWithPhrase:](self, "initWithPhrase:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppShortcutNegativePhrase phrase](self, "phrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, phrase: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNAppShortcutNegativePhrase phrase](self, "phrase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LNAppShortcutNegativePhrase *v4;
  LNAppShortcutNegativePhrase *v5;
  LNAppShortcutNegativePhrase *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNAppShortcutNegativePhrase *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNAppShortcutNegativePhrase phrase](self, "phrase");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNAppShortcutNegativePhrase phrase](v6, "phrase");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqual:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (LNStaticDeferredLocalizedString)phrase
{
  return self->_phrase;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
