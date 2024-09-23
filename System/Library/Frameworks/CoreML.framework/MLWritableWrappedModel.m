@implementation MLWritableWrappedModel

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v6 = a3;
  -[MLWrappedModel innerModel](self, "innerModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    -[MLWrappedModel reason](self, "reason");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "exceptionWithName:reason:userInfo:", CFSTR("IllegalOperation"), v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  -[MLWrappedModel innerModel](self, "innerModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_1EE43B688);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("InternalError"), CFSTR("MLModel does not conform to MLWritable"), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  -[MLWrappedModel innerModel](self, "innerModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "writeToURL:error:", v6, a4);

  return v11;
}

+ (id)wrapperAroundWritableModel:(id)a3
{
  id v3;
  MLWritableWrappedModel *v4;

  v3 = a3;
  v4 = -[MLWrappedModel initWithInnerModel:]([MLWritableWrappedModel alloc], "initWithInnerModel:", v3);

  return v4;
}

@end
