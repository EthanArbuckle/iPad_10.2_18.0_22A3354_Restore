@implementation MCMActionArgumentBase

- (MCMActionArgumentBase)initWithString:(id)a3
{
  id v5;
  MCMActionArgumentBase *v6;
  MCMActionArgumentBase *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMActionArgumentBase;
  v6 = -[MCMActionArgumentBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_string, a3);

  return v7;
}

- (NSURL)fileURL
{
  return 0;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
