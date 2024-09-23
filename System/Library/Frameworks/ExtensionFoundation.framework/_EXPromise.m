@implementation _EXPromise

- (_EXPromise)initWithPromiseBlock:(id)a3
{
  id v4;
  _EXPromise *v5;
  uint64_t v6;
  NSUUID *identifier;
  void *v8;
  id promiseBlock;
  _QWORD aBlock[4];
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_EXPromise;
  v5 = -[_EXPromise init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __35___EXPromise_initWithPromiseBlock___block_invoke;
    aBlock[3] = &unk_1E2CFCF98;
    v12 = v4;
    v8 = _Block_copy(aBlock);
    promiseBlock = v5->_promiseBlock;
    v5->_promiseBlock = v8;

  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  NSUUID *identifier;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  NSUUID *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _EXDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138543362;
    v8 = identifier;
  }

  +[_EXPromiseManager sharedInstance](_EXPromiseManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterPromise:", self);

  v6.receiver = self;
  v6.super_class = (Class)_EXPromise;
  -[_EXPromise dealloc](&v6, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSUUID **p_identifier;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_identifier = &self->_identifier;
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _EXDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_EXPromise encodeWithCoder:].cold.1((uint64_t)p_identifier, v12, v13, v14, v15, v16, v17, v18);

    v19 = objc_alloc(MEMORY[0x1E0C99DA0]);
    objc_exception_throw((id)objc_msgSend(v19, "initWithName:reason:userInfo:", CFSTR("EXPromiseCoderException"), CFSTR("This class may only be encoded by an NSXPCCoder"), MEMORY[0x1E0C9AA70]));
  }
  v6 = v4;
  _EXDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v8;
    _os_log_impl(&dword_190C25000, v7, OS_LOG_TYPE_DEFAULT, "Registering promise to send over XPC connection: %{public}@", (uint8_t *)&v20, 0xCu);

  }
  +[_EXPromiseManager sharedInstance](_EXPromiseManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerPromise:", self);

  +[_EXPromiseManager sharedInstance](_EXPromiseManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("endpoint"));

}

- (_EXPromise)initWithCoder:(id)a3
{
  id v4;
  _EXPromise *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id promiseBlock;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_EXPromise;
  v5 = -[_EXPromise init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpoint"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6)
      v8 = v7 == 0;
    else
      v8 = 1;
    if (v8)
    {
      v15 = objc_alloc(MEMORY[0x1E0C99DA0]);
    }
    v9 = (void *)v7;
    objc_storeStrong((id *)&v5->_identifier, v6);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __28___EXPromise_initWithCoder___block_invoke;
    v16[3] = &unk_1E2CFCFC0;
    v17 = v6;
    v18 = v9;
    v10 = v9;
    v11 = v6;
    v12 = _Block_copy(v16);
    promiseBlock = v5->_promiseBlock;
    v5->_promiseBlock = v12;

  }
  return v5;
}

- (id)resolveObjectOfClass:(Class)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXPromise resolveObjectOfClasses:error:](self, "resolveObjectOfClasses:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)resolveObjectOfClass:(Class)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(v6, "setWithObject:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_EXPromise resolveObjectOfClasses:completion:](self, "resolveObjectOfClasses:completion:", v8, v7);

}

- (id)resolveObjectOfClasses:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  id promiseBlock;
  _QWORD aBlock[4];
  id v12;

  (*((void (**)(void))self->_promiseBlock + 2))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43___EXPromise_resolveObjectOfClasses_error___block_invoke;
  aBlock[3] = &unk_1E2CFCFE8;
  v7 = v6;
  v12 = v7;
  v8 = _Block_copy(aBlock);
  promiseBlock = self->_promiseBlock;
  self->_promiseBlock = v8;

  if (a4 && !v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 9, MEMORY[0x1E0C9AA70]);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)resolveObjectOfClasses:(id)a3 completion:(id)a4
{
  void (**v5)(id, id, _QWORD);
  void (**promiseBlock)(void);
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  v5 = (void (**)(id, id, _QWORD))a4;
  promiseBlock = (void (**)(void))self->_promiseBlock;
  v17 = 0;
  promiseBlock[2]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __48___EXPromise_resolveObjectOfClasses_completion___block_invoke;
  v15 = &unk_1E2CFD010;
  v9 = v7;
  v16 = v9;
  v10 = _Block_copy(&v12);
  v11 = self->_promiseBlock;
  self->_promiseBlock = v10;

  if (v9)
  {
    v5[2](v5, v9, 0);
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 9, MEMORY[0x1E0C9AA70], v12, v13, v14, v15);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    ((void (**)(id, id, id))v5)[2](v5, 0, v8);
  }

}

- (id)promiseBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_promiseBlock, 0);
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6();
}

@end
