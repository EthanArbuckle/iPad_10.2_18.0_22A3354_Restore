@implementation FPSpotlightIndexState

- (FPSpotlightIndexState)init
{
  FPSpotlightIndexState *v2;
  FPSpotlightIndexState *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FPSpotlightIndexState;
  v2 = -[FPSpotlightIndexState init](&v5, sel_init);
  v3 = v2;
  if (v2)
    objc_storeStrong((id *)&v2->_lastPage, &_NSFileProviderInitialPageSortedByDate);
  return v3;
}

- (FPSpotlightIndexState)initWithPage:(id)a3 changeToken:(id)a4
{
  id v7;
  id v8;
  FPSpotlightIndexState *v9;
  FPSpotlightIndexState *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FPSpotlightIndexState;
  v9 = -[FPSpotlightIndexState init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lastPage, a3);
    objc_storeStrong((id *)&v10->_lastChangeToken, a4);
  }

  return v10;
}

- (FPSpotlightIndexState)initWithChangeToken:(id)a3
{
  id v5;
  FPSpotlightIndexState *v6;
  FPSpotlightIndexState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPSpotlightIndexState;
  v6 = -[FPSpotlightIndexState init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_lastChangeToken, a3);

  return v7;
}

+ (FPSpotlightIndexState)stateWithData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  FPSpotlightIndexState *v6;
  unint64_t v7;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  _DWORD v13[2];

  v3 = a3;
  v4 = v3;
  memset(v13, 0, 5);
  if (v3)
  {
    if ((unint64_t)objc_msgSend(v3, "length") > 4)
    {
      objc_msgSend(v4, "getBytes:length:", v13, 5);
      if (LOBYTE(v13[0]) != 1)
      {
        fp_current_or_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT))
          +[FPSpotlightIndexState stateWithData:].cold.5();
        goto LABEL_13;
      }
      if (*(_WORD *)((char *)v13 + 1))
      {
        v7 = *(unsigned __int16 *)((char *)v13 + 1) + 5;
        if (v7 > objc_msgSend(v4, "length"))
        {
          fp_current_or_default_log();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT))
            +[FPSpotlightIndexState stateWithData:].cold.4();
          goto LABEL_13;
        }
        objc_msgSend(v4, "subdataWithRange:", 5, *(unsigned __int16 *)((char *)v13 + 1));
        v5 = objc_claimAutoreleasedReturnValue();
        v9 = *(unsigned __int16 *)((char *)v13 + 1) + 5;
      }
      else
      {
        v5 = 0;
        v9 = 5;
      }
      if (*(_WORD *)((char *)v13 + 3))
      {
        v10 = v9 + *(unsigned __int16 *)((char *)v13 + 3);
        if (v10 > objc_msgSend(v4, "length"))
        {
          fp_current_or_default_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
            +[FPSpotlightIndexState stateWithData:].cold.3();

          goto LABEL_13;
        }
        objc_msgSend(v4, "subdataWithRange:", v9, *(unsigned __int16 *)((char *)v13 + 3));
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      if (v5 | v12)
      {
        v6 = -[FPSpotlightIndexState initWithPage:changeToken:]([FPSpotlightIndexState alloc], "initWithPage:changeToken:", v5, v12);

        goto LABEL_14;
      }
      fp_current_or_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG))
        +[FPSpotlightIndexState stateWithData:].cold.2((os_log_t)v5);
    }
    else
    {
      fp_current_or_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT))
        +[FPSpotlightIndexState stateWithData:].cold.1((uint64_t)v4, v5);
    }
LABEL_13:
    v6 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v6 = 0;
LABEL_15:

  return v6;
}

- (NSData)dataRepresentation
{
  NSData *lastChangeToken;
  NSData **p_lastChangeToken;
  NSData *lastPage;
  NSData **p_lastPage;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  char v12;
  __int16 v13;
  __int16 v14;

  p_lastChangeToken = &self->_lastChangeToken;
  lastChangeToken = self->_lastChangeToken;
  p_lastPage = &self->_lastPage;
  lastPage = self->_lastPage;
  if (!((unint64_t)lastChangeToken | (unint64_t)lastPage))
    return (NSData *)0;
  if (-[NSData length](lastPage, "length") <= 0x1F4 && -[NSData length](*p_lastChangeToken, "length") < 0x401)
  {
    v9 = objc_opt_new();
    v12 = 1;
    v13 = -[NSData length](*p_lastPage, "length");
    v14 = -[NSData length](*p_lastChangeToken, "length");
    -[NSObject appendBytes:length:](v9, "appendBytes:length:", &v12, 5);
    if (*p_lastPage)
      -[NSObject appendData:](v9, "appendData:");
    if (*p_lastChangeToken)
      -[NSObject appendData:](v9, "appendData:");
    if ((unint64_t)-[NSObject length](v9, "length") < 0x401)
    {
      v10 = v9;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPSpotlightIndexState.m"), 137, CFSTR("UNREACHABLE: index state is too large! %@"), v9);

  }
  else
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[FPSpotlightIndexState dataRepresentation].cold.1((uint64_t *)p_lastPage, (uint64_t *)p_lastChangeToken, v9);
  }
  v10 = 0;
LABEL_8:

  return (NSData *)v10;
}

- (unint64_t)phase
{
  return self->_lastPage == 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSData *v6;
  void *v7;
  int v8;
  BOOL v9;
  NSData *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "lastPage");
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v6 == self->_lastPage)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v5, "lastPage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", self->_lastPage);

    }
    objc_msgSend(v5, "lastChangeToken");
    v10 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (v10 == self->_lastChangeToken)
    {
      v9 = v8 != 0;
    }
    else
    {
      objc_msgSend(v5, "lastChangeToken");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", self->_lastChangeToken);
      if (v8)
        v9 = v12;
      else
        v9 = 0;

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[FPSpotlightIndexState phase](self, "phase");
  v6 = -[FPSpotlightIndexState phase](self, "phase");
  v7 = 16;
  if (!v6)
    v7 = 8;
  v8 = *(uint64_t *)((char *)&self->super.isa + v7);
  v9 = CFSTR("changes");
  if (!v5)
    v9 = CFSTR("gathering");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("@<%@: %p, %@ from %@>"), v4, self, v9, v8);
}

- (NSData)lastPage
{
  return self->_lastPage;
}

- (NSData)lastChangeToken
{
  return self->_lastChangeToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChangeToken, 0);
  objc_storeStrong((id *)&self->_lastPage, 0);
}

+ (void)stateWithData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_FAULT, "[CRIT] couldn't parse data header: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

+ (void)stateWithData:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] can't extract pageToken, nor changeToken from provided data", v1, 2u);
}

+ (void)stateWithData:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_12(&dword_1A0A34000, v0, v1, "[CRIT] couldn't read change token of size %u from data: %@");
  OUTLINED_FUNCTION_3();
}

+ (void)stateWithData:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_12(&dword_1A0A34000, v0, v1, "[CRIT] couldn't read page of size %u from data: %@");
  OUTLINED_FUNCTION_3();
}

+ (void)stateWithData:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_12(&dword_1A0A34000, v0, v1, "[CRIT] unexpected data version (%u): %@");
  OUTLINED_FUNCTION_3();
}

- (void)dataRepresentation
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1A0A34000, log, OS_LOG_TYPE_ERROR, "[ERROR] vendor token is too large! page:%@ change:%@", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_3();
}

@end
