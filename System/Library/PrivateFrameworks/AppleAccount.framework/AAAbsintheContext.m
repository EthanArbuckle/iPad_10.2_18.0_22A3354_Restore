@implementation AAAbsintheContext

- (AAAbsintheContext)init
{
  AAAbsintheContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AAAbsintheContext;
  result = -[AAAbsintheContext init](&v3, sel_init);
  if (result)
    result->_contextRef = 0;
  return result;
}

- (void)dealloc
{
  NACContextOpaque_ *contextRef;
  objc_super v4;

  contextRef = self->_contextRef;
  if (contextRef)
    IW1PcFszqNK((uint64_t)contextRef);
  v4.receiver = self;
  v4.super_class = (Class)AAAbsintheContext;
  -[AAAbsintheContext dealloc](&v4, sel_dealloc);
}

- (id)TgBfoO2wtF5L:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAAbsintheContext.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("certificateData"));

  }
  if (self->_contextRef)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAAbsintheContext.m"), 48, CFSTR("Proxy already initialized!"));

  }
  v8 = objc_retainAutorelease(v7);
  KxmB0CKvgWt(objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
  if ((_DWORD)v9)
  {
    v10 = v9;
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AAAbsintheContext TgBfoO2wtF5L:error:].cold.1(v10);

    if (a4)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v18 = CFSTR("AAAbsintheError");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "aa_errorWithCode:userInfo:", -4403, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:deallocator:", 0, 0, &__block_literal_global_27);
  }

  return a4;
}

uint64_t __40__AAAbsintheContext_TgBfoO2wtF5L_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return Be81a395Bf0(a2);
}

- (BOOL)R6XtwiyjL3q2:(id)a3 error:(id *)a4
{
  id v7;
  NACContextOpaque_ *contextRef;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAAbsintheContext.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionInfo"));

  }
  contextRef = self->_contextRef;
  v9 = objc_retainAutorelease(v7);
  nDYmeMqvWb((uint64_t)contextRef, objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
  v11 = v10;
  if ((_DWORD)v10)
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AAAbsintheContext R6XtwiyjL3q2:error:].cold.1(v11);

    if (a4)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v18 = CFSTR("AAAbsintheError");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "aa_errorWithCode:userInfo:", -4403, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return (_DWORD)v11 == 0;
}

- (id)cao1NI5PNJBn:(id)a3 error:(id *)a4
{
  NACContextOpaque_ *contextRef;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v17 = 0;
  contextRef = self->_contextRef;
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  t1BoNctgaUu66((uint64_t)contextRef, v7, v8, (uint64_t)&v17);
  if ((_DWORD)v9)
  {
    v10 = v9;
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AAAbsintheContext cao1NI5PNJBn:error:].cold.1(v10);

    if (v17)
      Be81a395Bf0(v17);
    if (a4)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v18 = CFSTR("AAAbsintheError");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "aa_errorWithCode:userInfo:", -4403, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else
  {
    v16 = objc_alloc(MEMORY[0x1E0C99D50]);
    return (id)objc_msgSend(v16, "initWithBytesNoCopy:length:deallocator:", v17, 0, &__block_literal_global_34_0);
  }
}

uint64_t __40__AAAbsintheContext_cao1NI5PNJBn_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return Be81a395Bf0(a2);
}

- (void)TgBfoO2wtF5L:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_19EACA000, v2, v3, "Failed to initialize context: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_10();
}

- (void)R6XtwiyjL3q2:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_19EACA000, v2, v3, "Failed to establish key: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_10();
}

- (void)cao1NI5PNJBn:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_19EACA000, v2, v3, "Failed to generate signature: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_10();
}

@end
