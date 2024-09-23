@implementation _DPDediscoError

- (_DPDediscoError)initWithCode:(int64_t)a3 description:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  _DPDediscoError *v9;
  objc_super v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = *MEMORY[0x1E0CB2D50];
  v13[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)_DPDediscoError;
  v9 = -[_DPDediscoError initWithDomain:code:userInfo:](&v11, sel_initWithDomain_code_userInfo_, CFSTR("com.apple.DPDedisco"), a3, v8);

  return v9;
}

- (_DPDediscoError)initWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id *v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _DPDediscoError *v21;
  objc_super v23;
  uint64_t v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v9 = *MEMORY[0x1E0CB3388];
    v26[0] = *MEMORY[0x1E0CB2D50];
    v26[1] = v9;
    v27[0] = a5;
    v27[1] = a4;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = a5;
    v12 = a4;
    v13 = (id *)v27;
    v14 = v26;
    v15 = v10;
    v16 = 2;
  }
  else
  {
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = a5;
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = a5;
    v19 = 0;
    v13 = &v25;
    v14 = &v24;
    v15 = v17;
    v16 = 1;
  }
  objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v13, v14, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)_DPDediscoError;
  v21 = -[_DPDediscoError initWithDomain:code:userInfo:](&v23, sel_initWithDomain_code_userInfo_, CFSTR("com.apple.DPDedisco"), a3, v20);

  return v21;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCode:description:", a3, v5);

  return v6;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCode:underlyingError:description:", a3, v8, v7);

  return v9;
}

- (BOOL)logAndStoreInError:(id *)a3
{
  NSObject *v5;

  +[_DPLog service](_DPLog, "service");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_DPDediscoError logAndStoreInError:].cold.1((uint64_t)self, v5);

  if (a3)
    *a3 = objc_retainAutorelease(self);
  return 1;
}

- (void)logAndStoreInError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D3FAA000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

@end
