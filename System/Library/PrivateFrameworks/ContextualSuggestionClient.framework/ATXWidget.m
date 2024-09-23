@implementation ATXWidget

- (ATXWidget)initWithIdentifier:(id)a3 chsWidget:(id)a4 suggestedWidget:(BOOL)a5
{
  return -[ATXWidget initWithIdentifier:chsWidget:suggestedWidget:source:](self, "initWithIdentifier:chsWidget:suggestedWidget:source:", a3, a4, a5, 0);
}

- (ATXWidget)initWithIdentifier:(id)a3 chsWidget:(id)a4 suggestedWidget:(BOOL)a5 source:(id)a6
{
  id v10;
  id v11;
  id v12;
  ATXWidget *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSString *source;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ATXWidget;
  v13 = -[ATXWidget init](&v19, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_chsWidget, a4);
    v13->_suggestedWidget = a5;
    v16 = objc_msgSend(v12, "copy");
    source = v13->_source;
    v13->_source = (NSString *)v16;

  }
  return v13;
}

- (ATXWidget)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  ATXWidget *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suggestedWidget"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ATXWidget initWithIdentifier:chsWidget:suggestedWidget:source:](self, "initWithIdentifier:chsWidget:suggestedWidget:source:", v5, v6, v7, v8);
  return v9;
}

- (id)copyWithSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[ATXWidget identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXWidget chsWidget](self, "chsWidget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXWidget isSuggestedWidget](self, "isSuggestedWidget");
  v9 = (void *)objc_msgSend(v4, "copy");

  v10 = (void *)objc_msgSend(v5, "initWithIdentifier:chsWidget:suggestedWidget:source:", v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ATXWidget identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[ATXWidget chsWidget](self, "chsWidget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("widget"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ATXWidget isSuggestedWidget](self, "isSuggestedWidget"), CFSTR("suggestedWidget"));
  -[ATXWidget source](self, "source");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("source"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  ATXWidget *v4;
  ATXWidget *v5;
  BOOL v6;

  v4 = (ATXWidget *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXWidget isEqualToATXWidget:](self, "isEqualToATXWidget:", v5);

  return v6;
}

- (BOOL)isEqualToATXWidget:(id)a3
{
  id *v4;
  NSString *identifier;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  CHSWidget *chsWidget;
  CHSWidget *v11;
  CHSWidget *v12;
  CHSWidget *v13;
  char v14;
  NSString *v15;
  NSString *v16;
  char v17;

  v4 = (id *)a3;
  identifier = self->_identifier;
  v6 = (NSString *)v4[2];
  if (identifier == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = identifier;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_12;
  }
  chsWidget = self->_chsWidget;
  v11 = (CHSWidget *)v4[3];
  if (chsWidget == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = chsWidget;
    v14 = -[CHSWidget isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_12;
  }
  if (self->_suggestedWidget != *((unsigned __int8 *)v4 + 8))
  {
LABEL_12:
    v17 = 0;
    goto LABEL_15;
  }
  v15 = self->_source;
  v16 = v15;
  if (v15 == v4[5])
    v17 = 1;
  else
    v17 = -[NSString isEqual:](v15, "isEqual:");

LABEL_15:
  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  -[ATXWidget identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[ATXWidget chsWidget](self, "chsWidget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  v7 = 31 * v6 + -[ATXWidget isSuggestedWidget](self, "isSuggestedWidget");
  -[ATXWidget source](self, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash") - v7 + 32 * v7;

  return v9;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[ATXWidget identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXWidget chsWidget](self, "chsWidget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXWidget isSuggestedWidget](self, "isSuggestedWidget"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[ATXWidget source](self, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<ATXWidget: (identifier: %@, chsWidget: %@, isSuggestedWidget: %@, source: %@)>"), v4, v5, v6, v7);

  return v8;
}

- (NSDictionary)dictionaryRepresentation
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
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  v16[0] = CFSTR("identifier");
  -[ATXWidget identifier](self, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v15;
  v16[1] = CFSTR("chsWidget");
  -[ATXWidget chsWidget](self, "chsWidget");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v3;
  v16[2] = CFSTR("intent");
  -[ATXWidget chsWidget](self, "chsWidget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v8;
  v16[3] = CFSTR("isSuggestedWidget");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ATXWidget isSuggestedWidget](self, "isSuggestedWidget"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v9;
  v16[4] = CFSTR("source");
  -[ATXWidget source](self, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[4] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)

  if (!v7)
  return (NSDictionary *)v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CHSWidget)chsWidget
{
  return self->_chsWidget;
}

- (BOOL)isSuggestedWidget
{
  return self->_suggestedWidget;
}

- (void)setDictionaryRepresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_chsWidget, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
