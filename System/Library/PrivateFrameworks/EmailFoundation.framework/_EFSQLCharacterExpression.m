@implementation _EFSQLCharacterExpression

- (_EFSQLCharacterExpression)initWithCharacter:(unsigned __int16)a3
{
  _EFSQLCharacterExpression *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_EFSQLCharacterExpression;
  result = -[_EFSQLCharacterExpression init](&v5, sel_init);
  if (result)
    result->_character = a3;
  return result;
}

- (NSString)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EFSQLCharacterExpression ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return (NSString *)v3;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  objc_msgSend(a3, "appendFormat:", CFSTR("'%C'"), self->_character);
}

- (unsigned)character
{
  return self->_character;
}

@end
