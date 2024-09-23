@implementation MADServiceVideoProcessingSubtask

+ (Class)taskClassForRequest:(id)a3
{
  id v3;
  int v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  if (v4)
    v5 = (void *)objc_opt_class();
  else
    v5 = 0;
  return (Class)v5;
}

+ (id)taskWithRequest:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "taskClassForRequest:", v16)), "initWithRequest:forAsset:cancelBlock:progressHandler:andCompletionHandler:", v16, v15, v14, v13, v12);

  return v17;
}

- (NSString)signpostPayload
{
  return self->_signpostPayload;
}

- (void)setSignpostPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostPayload, 0);
}

+ (void)unimplementedExceptionForMethodName:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADServiceVideoProcessingSubtask %@] should not be called"), v3);
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NotImplementedException"), objc_claimAutoreleasedReturnValue(), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (MADServiceVideoProcessingSubtask)initWithRequest:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 andCompletionHandler:(id)a7
{
  objc_msgSend((id)objc_opt_class(), "unimplementedExceptionForMethodName:", CFSTR("initWithRequest:forAsset:cancelBlock:andCompletionHandler:"));

  return 0;
}

@end
