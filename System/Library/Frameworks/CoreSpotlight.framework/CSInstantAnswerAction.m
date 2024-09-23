@implementation CSInstantAnswerAction

+ (id)actionWithType:(id)a3 andUrl:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:andUrl:", v7, v6);

  return v8;
}

- (CSInstantAnswerAction)initWithType:(id)a3 andUrl:(id)a4
{
  id v6;
  id v7;
  CSInstantAnswerAction *v8;
  CSInstantAnswerAction *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSInstantAnswerAction;
  v8 = -[CSInstantAnswerAction init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CSInstantAnswerAction setType:](v8, "setType:", v6);
    -[CSInstantAnswerAction setUrl:](v9, "setUrl:", v7);
  }

  return v9;
}

- (CSInstantAnswerAction)initWithAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CSInstantAnswerAction *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CSInstantAnswerAction initWithType:andUrl:](self, "initWithType:andUrl:", v5, v6);
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[CSInstantAnswerAction type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSInstantAnswerAction url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithType:andUrl:", v5, v6);

  return v7;
}

- (id)attributes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("type");
  -[CSInstantAnswerAction type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("url");
  v8[0] = v3;
  -[CSInstantAnswerAction url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CSInstantAnswerAction type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSInstantAnswerAction url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ %@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
