@implementation ML3DatabaseNaturalStatement

- (ML3DatabaseNaturalStatement)initWithSQL:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  ML3DatabaseNaturalStatement *v8;
  uint64_t v9;
  NSString *sql;
  NSMutableArray *v11;
  NSMutableArray *parameters;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ML3DatabaseNaturalStatement;
  v8 = -[ML3DatabaseNaturalStatement init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    sql = v8->_sql;
    v8->_sql = (NSString *)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    parameters = v8->_parameters;
    v8->_parameters = v11;

    if (v7)
      -[NSMutableArray addObjectsFromArray:](v8->_parameters, "addObjectsFromArray:", v7);
  }

  return v8;
}

- (void)setParameter:(id)a3 forPosition:(unint64_t)a4
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4 - 1;
  if (v6 >= -[NSMutableArray count](self->_parameters, "count"))
  {
    v7 = -[NSMutableArray count](self->_parameters, "count");
    if (v7 <= v6)
    {
      v8 = v7;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray setObject:atIndexedSubscript:](self->_parameters, "setObject:atIndexedSubscript:", v9, v8);

        ++v8;
      }
      while (v8 <= v6);
    }
  }
  -[NSMutableArray setObject:atIndexedSubscript:](self->_parameters, "setObject:atIndexedSubscript:", v10, v6);

}

- (ML3DatabaseNaturalStatement)initWithCoder:(id)a3
{
  id v4;
  ML3DatabaseNaturalStatement *v5;
  uint64_t v6;
  NSString *sql;
  NSMutableArray *v8;
  NSMutableArray *parameters;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ML3DatabaseNaturalStatement;
  v5 = -[ML3DatabaseNaturalStatement init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ML3DatabaseNaturalStatementSQLKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    sql = v5->_sql;
    v5->_sql = (NSString *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    parameters = v5->_parameters;
    v5->_parameters = v8;

    MSVPropertyListDataClasses();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setByAddingObject:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("ML3DatabaseNaturalStatementParametersKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[NSMutableArray addObjectsFromArray:](v5->_parameters, "addObjectsFromArray:", v12);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sql;
  id v5;

  sql = self->_sql;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sql, CFSTR("ML3DatabaseNaturalStatementSQLKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameters, CFSTR("ML3DatabaseNaturalStatementParametersKey"));

}

- (NSString)sql
{
  return self->_sql;
}

- (void)setSql:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableArray)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_sql, 0);
}

+ (id)naturalStatementWithSQL:(id)a3 parameters:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSQL:parameters:", v6, v5);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
