@implementation _FEFocusDebuggerStringOutput

+ (id)outputWithString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:", v4);

  return v5;
}

- (_FEFocusDebuggerStringOutput)init
{
  return -[_FEFocusDebuggerStringOutput initWithString:](self, "initWithString:", &stru_250D3AA90);
}

- (_FEFocusDebuggerStringOutput)initWithString:(id)a3
{
  id v5;
  _FEFocusDebuggerStringOutput *v6;
  uint64_t v7;
  NSString *outputString;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusDebugger.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputString"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_FEFocusDebuggerStringOutput;
  v6 = -[_FEFocusDebuggerStringOutput init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    outputString = v6->_outputString;
    v6->_outputString = (NSString *)v7;

  }
  return v6;
}

- (NSString)description
{
  if (self->_outputString)
    return self->_outputString;
  else
    return (NSString *)&stru_250D3AA90;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputString, 0);
}

@end
