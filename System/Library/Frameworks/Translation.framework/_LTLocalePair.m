@implementation _LTLocalePair

- (_LTLocalePair)initWithSourceLocale:(id)a3 targetLocale:(id)a4
{
  id v7;
  id v8;
  _LTLocalePair *v9;
  _LTLocalePair *v10;
  _LTLocalePair *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_LTLocalePair;
  v9 = -[_LTLocalePair init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceLocale, a3);
    objc_storeStrong((id *)&v10->_targetLocale, a4);
    v11 = v10;
  }

  return v10;
}

- (_LTLocalePair)initWithCoder:(id)a3
{
  id v4;
  _LTLocalePair *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSLocale *sourceLocale;
  void *v10;
  void *v11;
  uint64_t v12;
  NSLocale *targetLocale;
  _LTLocalePair *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_LTLocalePair;
  v5 = -[_LTLocalePair init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceLocaleIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localeWithLocaleIdentifier:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    sourceLocale = v5->_sourceLocale;
    v5->_sourceLocale = (NSLocale *)v8;

    v10 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetLocaleIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localeWithLocaleIdentifier:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    targetLocale = v5->_targetLocale;
    v5->_targetLocale = (NSLocale *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSLocale *sourceLocale;
  id v5;
  void *v6;
  id v7;

  sourceLocale = self->_sourceLocale;
  v5 = a3;
  -[NSLocale localeIdentifier](sourceLocale, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("sourceLocaleIdentifier"));

  -[NSLocale localeIdentifier](self->_targetLocale, "localeIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("targetLocaleIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (_LTLocalePair)pairWithIdentifiers:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
  {
    v5 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localeWithLocaleIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localeWithLocaleIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    if (v7 && v10)
      v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSourceLocale:targetLocale:", v7, v10);

  }
  else
  {
    v11 = 0;
  }

  return (_LTLocalePair *)v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_LTLocalePair initWithSourceLocale:targetLocale:]([_LTLocalePair alloc], "initWithSourceLocale:targetLocale:", self->_sourceLocale, self->_targetLocale);
}

- (id)combinedLocaleIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_LTLocalePair sourceLocale](self, "sourceLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ltLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTLocalePair targetLocale](self, "targetLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_ltLocaleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)reversedPair
{
  _LTLocalePair *v3;
  void *v4;
  void *v5;
  _LTLocalePair *v6;

  v3 = [_LTLocalePair alloc];
  -[_LTLocalePair targetLocale](self, "targetLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTLocalePair sourceLocale](self, "sourceLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_LTLocalePair initWithSourceLocale:targetLocale:](v3, "initWithSourceLocale:targetLocale:", v4, v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _LTLocalePair *v4;
  _LTLocalePair *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (_LTLocalePair *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_LTLocalePair sourceLocale](self, "sourceLocale");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTLocalePair sourceLocale](v5, "sourceLocale");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "_ltEqual:", v7))
      {
        -[_LTLocalePair targetLocale](self, "targetLocale");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_LTLocalePair targetLocale](v5, "targetLocale");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "_ltEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)isBidirectionalEqual:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (-[_LTLocalePair isEqual:](self, "isEqual:", v4))
  {
    v5 = 1;
  }
  else
  {
    -[_LTLocalePair reversedPair](self, "reversedPair");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqual:", v4);

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_LTLocalePair identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)oppositeToLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "_ltLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTLocalePair sourceLocale](self, "sourceLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_ltLocaleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    -[_LTLocalePair targetLocale](self, "targetLocale");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "_ltLocaleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTLocalePair targetLocale](self, "targetLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_ltLocaleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqualToString:", v12);

    if (!v13)
    {
      v14 = 0;
      goto LABEL_7;
    }
    -[_LTLocalePair sourceLocale](self, "sourceLocale");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v9;
LABEL_7:

  return v14;
}

- (id)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_LTLocalePair sourceLocale](self, "sourceLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTLocalePair targetLocale](self, "targetLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)canonicalIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  -[_LTLocalePair sourceLocale](self, "sourceLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  -[_LTLocalePair targetLocale](self, "targetLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%@"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)canonicalLocalePair
{
  void *v2;
  void *v3;

  -[_LTLocalePair canonicalIdentifier](self, "canonicalIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_LTLocalePair pairWithIdentifiers:](_LTLocalePair, "pairWithIdentifiers:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTLocalePair sourceLocale](self, "sourceLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTLocalePair targetLocale](self, "targetLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: source:%@ target:%@>"), v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isPassthrough
{
  void *v3;
  void *v4;
  char v5;

  -[_LTLocalePair sourceLocale](self, "sourceLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTLocalePair targetLocale](self, "targetLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_ltEqual:", v4);

  return v5;
}

- (BOOL)isVariantPair
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  if (-[_LTLocalePair isPassthrough](self, "isPassthrough"))
    return 0;
  -[_LTLocalePair sourceLocale](self, "sourceLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTLocalePair targetLocale](self, "targetLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  return v8;
}

- (NSLocale)sourceLocale
{
  return self->_sourceLocale;
}

- (NSLocale)targetLocale
{
  return self->_targetLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_storeStrong((id *)&self->_sourceLocale, 0);
}

@end
