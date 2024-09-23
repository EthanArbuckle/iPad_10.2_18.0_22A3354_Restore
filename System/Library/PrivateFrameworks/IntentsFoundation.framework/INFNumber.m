@implementation INFNumber

+ (id)numberWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:", v4);

  return v5;
}

- (INFNumber)initWithIdentifier:(id)a3
{
  id v5;
  INFNumber *v6;
  INFNumber *v7;
  NSNumber *value;

  v5 = a3;
  v6 = -[INFNumber init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    value = v7->_value;
    v7->_value = (NSNumber *)&unk_1E977AB38;

  }
  return v7;
}

- (id)contributingSentenceContext
{
  void *v3;

  +[INFSentenceContext sentenceContext](INFSentenceContext, "sentenceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumber:", self->_value);
  return v3;
}

- (id)stringForContext:(id)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v4, "setNumberStyle:", 1);
  objc_msgSend(v4, "stringFromNumber:", self->_value);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dictionaryRepresentation
{
  return 0;
}

- (id)identifier
{
  return self->_identifier;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
