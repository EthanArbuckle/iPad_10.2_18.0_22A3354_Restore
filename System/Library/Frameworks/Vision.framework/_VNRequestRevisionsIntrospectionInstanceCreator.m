@implementation _VNRequestRevisionsIntrospectionInstanceCreator

- (id)_newVNTargetedImageRequestInstanceOfClass:(Class)a3 withCompletionHandler:(id)a4 revision:(unint64_t)a5 error:(id *)a6
{
  id v6;
  void *v7;
  void *v8;

  v6 = [a3 alloc];
  objc_msgSend(MEMORY[0x1E0C9DDC8], "blackImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithTargetedCIImage:options:", v7, MEMORY[0x1E0C9AA70]);

  return v8;
}

@end
