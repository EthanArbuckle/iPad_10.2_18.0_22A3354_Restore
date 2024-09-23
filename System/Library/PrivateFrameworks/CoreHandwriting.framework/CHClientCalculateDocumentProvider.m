@implementation CHClientCalculateDocumentProvider

- (CHClientCalculateDocumentProvider)initWithDeclaredVariables:(id)a3
{
  return (CHClientCalculateDocumentProvider *)((uint64_t (*)(CHClientCalculateDocumentProvider *, char *, id, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_initWithDeclaredVariables_recognizedExpressions_, a3, MEMORY[0x1E0C9AA60]);
}

- (CHClientCalculateDocumentProvider)initWithDeclaredVariables:(id)a3 recognizedExpressions:(id)a4
{
  id v7;
  id v8;
  CHClientCalculateDocumentProvider *v9;
  CHClientCalculateDocumentProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHClientCalculateDocumentProvider;
  v9 = -[CHClientCalculateDocumentProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_declaredVariables, a3);
    objc_storeStrong((id *)&v10->_recognizedExpressions, a4);
  }

  return v10;
}

- (NSSet)declaredVariables
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)recognizedExpressions
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizedExpressions, 0);
  objc_storeStrong((id *)&self->_declaredVariables, 0);
}

@end
