@implementation CADXPCInvocationContextHolder

- (void).cxx_destruct
{
  objc_storeStrong(&self->_proxy, 0);
  objc_storeStrong((id *)&self->_retainedArguments, 0);
}

- (id)proxy
{
  return self->_proxy;
}

- (void)clear
{
  NSMutableArray *retainedArguments;
  id proxy;

  retainedArguments = self->_retainedArguments;
  self->_retainedArguments = 0;

  proxy = self->_proxy;
  self->_proxy = 0;

}

- (void)retainProxy:(id)a3 andArgumentsInInvocation:(id)a4
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  NSMutableArray *v11;
  NSMutableArray *retainedArguments;
  uint64_t i;
  uint64_t v14;

  v7 = a3;
  v8 = a4;
  objc_storeStrong(&self->_proxy, a3);
  objc_msgSend(v8, "methodSignature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numberOfArguments");
  v11 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10 - 2);
  retainedArguments = self->_retainedArguments;
  self->_retainedArguments = v11;

  if (v10 >= 3)
  {
    for (i = 2; i != v10; ++i)
    {
      if (*(_BYTE *)objc_msgSend(objc_retainAutorelease(v9), "getArgumentTypeAtIndex:", i) == 64)
      {
        v14 = 0;
        objc_msgSend(v8, "getArgument:atIndex:", &v14, i);
        if (v14)
          -[NSMutableArray addObject:](self->_retainedArguments, "addObject:");
      }
    }
  }

}

@end
