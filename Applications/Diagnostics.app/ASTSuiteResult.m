@implementation ASTSuiteResult

- (ASTSuiteResult)initWithName:(id)a3 components:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASTSuiteResult;
  return -[ASTSuiteResult init](&v5, "init", a3, a4);
}

- (ASTSuiteResult)initWithDictionary:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASTSuiteResult;
  return -[ASTSuiteResult init](&v5, "init", a3, a4);
}

- (NSString)suiteName
{
  return self->_suiteName;
}

- (void)setSuiteName:(id)a3
{
  objc_storeStrong((id *)&self->_suiteName, a3);
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
  objc_storeStrong((id *)&self->_components, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_suiteName, 0);
}

@end
