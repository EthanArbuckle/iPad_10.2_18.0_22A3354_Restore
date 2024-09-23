@implementation CNClassKitServices

+ (id)objectsMatching:(id)a3 fromStore:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (objc_class *)MEMORY[0x1E0D13B20];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "completionHandlerAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectsMatching:completion:", v7, v9);

  v10 = (void *)MEMORY[0x1E0D13B60];
  objc_msgSend(v8, "future");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resultWithFuture:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
