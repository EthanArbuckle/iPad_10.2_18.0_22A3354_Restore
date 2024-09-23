@implementation FBKQuestionChoice

+ (id)choiceFromArray:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  FBKQuestionChoice *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_24E15EAF8;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  FBKNilIfNSNull(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "stringValue");
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  if (v10)
  {
    v12 = -[FBKQuestionChoice initWithTitle:value:]([FBKQuestionChoice alloc], "initWithTitle:value:", v8, v10);
  }
  else
  {
    +[FBKLog model](FBKLog, "model");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[FBKQuestionChoice choiceFromArray:].cold.1(v13, v14, v15);

    v12 = 0;
  }

  return v12;
}

- (FBKQuestionChoice)initWithTitle:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  FBKQuestionChoice *v9;
  FBKQuestionChoice *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FBKQuestionChoice;
  v9 = -[FBKQuestionChoice init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_canSelect = 1;
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong(&v10->_value, a4);
  }

  return v10;
}

- (FBKQuestionChoice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FBKQuestionChoice *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[FBKQuestionChoice initWithTitle:value:](self, "initWithTitle:value:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FBKQuestionChoice title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[FBKQuestionChoice value](self, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("value"));

}

- (BOOL)isPrompt
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[FBKQuestionChoice value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[FBKQuestionChoice value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqual:", CFSTR("-1"));

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)diffableHashWithContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  -[FBKQuestionChoice value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)value
{
  return objc_getProperty(self, a2, 24, 1);
}

- (BOOL)canSelect
{
  return self->_canSelect;
}

- (void)setCanSelect:(BOOL)a3
{
  self->_canSelect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (void)choiceFromArray:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_5(&dword_21D9A9000, a1, a3, "FBKQuestion choice had nil title/value, will ignore", v3);
}

@end
