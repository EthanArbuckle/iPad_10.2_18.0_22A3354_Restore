@implementation MMMarkdown

+ (id)HTMLStringWithMarkdown:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "HTMLStringWithMarkdown:extensions:fromSelector:error:", a3, 0, a2, a4);
}

+ (id)HTMLStringWithMarkdown:(id)a3 extensions:(unint64_t)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "HTMLStringWithMarkdown:extensions:fromSelector:error:", a3, a4, a2, a5);
}

+ (id)HTMLStringWithMarkdown:(id)a3 extensions:(unint64_t)a4 fromSelector:(SEL)a5 error:(id *)a6
{
  id v9;
  void *v10;
  MMParser *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v9 = a3;
  if (!v9)
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("[%@ %@]: nil argument for markdown"), v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v20, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v10 = v9;
  if (objc_msgSend(v9, "length"))
  {
    v11 = -[MMParser initWithExtensions:]([MMParser alloc], "initWithExtensions:", a4);
    v12 = (void *)objc_opt_new();
    -[MMParser parseMarkdown:error:](v11, "parseMarkdown:error:", v10, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "generateHTML:", v13);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = &stru_24F8BBA48;
  }

  return v14;
}

@end
