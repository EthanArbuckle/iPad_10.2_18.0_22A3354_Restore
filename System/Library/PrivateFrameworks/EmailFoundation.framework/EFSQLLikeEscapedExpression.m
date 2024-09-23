@implementation EFSQLLikeEscapedExpression

- (EFSQLLikeEscapedExpression)initWithValue:(id)a3
{
  return -[EFSQLLikeEscapedExpression initWithValue:pattern:](self, "initWithValue:pattern:", a3, 3);
}

- (EFSQLLikeEscapedExpression)initWithValue:(id)a3 pattern:(unint64_t)a4
{
  return -[EFSQLLikeEscapedExpression initWithValue:pattern:escapeCharacter:](self, "initWithValue:pattern:escapeCharacter:", a3, a4, 92);
}

- (EFSQLLikeEscapedExpression)initWithValue:(id)a3 pattern:(unint64_t)a4 escapeCharacter:(unsigned __int16)a5
{
  id v9;
  EFSQLLikeEscapedExpression *v10;
  EFSQLLikeEscapedExpression *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EFSQLLikeEscapedExpression;
  v10 = -[EFSQLLikeEscapedExpression init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_value, a3);
    v11->_escapeCharacter = a5;
    v11->_pattern = a4;
  }

  return v11;
}

- (NSString)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLLikeEscapedExpression ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return (NSString *)v3;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EFSQLLikeEscapedExpression _stringForPattern:literal:](self, self->_pattern, self->_value);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_renderSQLExpressionInto:", v5);
  objc_msgSend(v5, "appendFormat:", CFSTR(" ESCAPE '%C'"), self->_escapeCharacter);

}

- (id)_stringForPattern:(void *)a3 literal:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    switch(a2)
    {
      case 0:
        v7 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "ef_stringByEscapingSQLLikeSpecialCharactersWithEscapeCharater:", objc_msgSend(a1, "escapeCharacter"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%%"), v8);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      case 1:
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "ef_stringByEscapingSQLLikeSpecialCharactersWithEscapeCharater:", objc_msgSend(a1, "escapeCharacter"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%%%@%%"), v8);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      case 2:
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "ef_stringByEscapingSQLLikeSpecialCharactersWithEscapeCharater:", objc_msgSend(a1, "escapeCharacter"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%%%@"), v8);
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
        a1 = (id)v9;

        break;
      case 3:
        a1 = v5;
        break;
      default:
        break;
    }
  }

  return a1;
}

- (NSString)value
{
  return self->_value;
}

- (unsigned)escapeCharacter
{
  return self->_escapeCharacter;
}

- (unint64_t)pattern
{
  return self->_pattern;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
