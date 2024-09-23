@implementation DYFunctionStream

- (void)reset
{
  -[DYFunctionStream doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setResetMarker
{
  -[DYFunctionStream doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)clearResetMarker
{
  -[DYFunctionStream doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)resetToFunction:(const Function *)a3
{
  -[DYFunctionStream doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (const)peekFunction
{
  -[DYFunctionStream doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (const)readFunction
{
  -[DYFunctionStream doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (unint64_t)readFunctions:(Function *)a3 maxCount:(unint64_t)a4
{
  -[DYFunctionStream doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (void)enumerateFunctionsUsingBlock:(id)a3
{
  const Function *v5;
  char v6;

  v6 = 0;
  do
  {
    v5 = -[DYFunctionStream readFunction](self, "readFunction");
    if (!v5)
      break;
    (*((void (**)(id, const Function *, char *))a3 + 2))(a3, v5, &v6);
  }
  while (!v6);
}

@end
