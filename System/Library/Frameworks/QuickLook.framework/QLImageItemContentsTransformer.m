@implementation QLImageItemContentsTransformer

+ (id)allowedOutputClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)QLImageItemContentsTransformer;
  -[QLImageItemTransformer transformedContentsFromURL:context:error:](&v13, sel_transformedContentsFromURL_context_error_, v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE7BF80], "imageItemContentsWithImage:imageURL:", v9, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v9;
  }
  v11 = v10;

  return v11;
}

- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)QLImageItemContentsTransformer;
  -[QLImageItemTransformer transformedContentsFromData:context:error:](&v13, sel_transformedContentsFromData_context_error_, v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE7BF78], "imageItemContentsWithImage:imageData:", v9, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v9;
  }
  v11 = v10;

  return v11;
}

@end
