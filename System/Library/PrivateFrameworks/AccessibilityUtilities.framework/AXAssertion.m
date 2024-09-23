@implementation AXAssertion

+ (BOOL)isSupported
{
  return +[AXSpringBoardServer isAvailable](AXSpringBoardServer, "isAvailable");
}

+ (id)assertionWithType:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:identifier:", v6, v5);

  return v7;
}

+ (void)ensureAssertionsHaveBeenProcessedWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = (void (**)(_QWORD))a3;
  if (objc_msgSend(a1, "isSupported"))
  {
    +[AXSpringBoardServer server](AXSpringBoardServer, "server");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_ensureAssertionsHaveBeenProcessedWithCompletion:", v4);

  }
  else
  {
    AXLogAssertions();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[AXAssertion ensureAssertionsHaveBeenProcessedWithCompletion:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    if (v4)
      v4[2](v4);
  }

}

- (AXAssertion)initWithType:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  AXAssertion *v8;
  AXAssertion *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXAssertion;
  v8 = -[AXAssertion init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AXAssertion setAssertionType:](v8, "setAssertionType:", v6);
    -[AXAssertion setIdentifier:](v9, "setIdentifier:", v7);
    -[AXAssertion _notifyServerAssertionWasAcquired](v9, "_notifyServerAssertionWasAcquired");
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[AXAssertion _notifyServerAssertionWasRelinquished](self, "_notifyServerAssertionWasRelinquished");
  v3.receiver = self;
  v3.super_class = (Class)AXAssertion;
  -[AXAssertion dealloc](&v3, sel_dealloc);
}

- (BOOL)_hasValidAssertionType
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  if (_hasValidAssertionType_onceToken != -1)
    dispatch_once(&_hasValidAssertionType_onceToken, &__block_literal_global_11);
  -[AXAssertion assertionType](self, "assertionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)_hasValidAssertionType__ValidAssertionTypes;
    -[AXAssertion assertionType](self, "assertionType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __37__AXAssertion__hasValidAssertionType__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4[0] = CFSTR("Disable System Gestures");
  v4[1] = CFSTR("Disable Speak This! Gesture");
  v4[2] = CFSTR("Disable Notification Center gesture");
  v4[3] = CFSTR("Disable Control Center gesture");
  v4[4] = CFSTR("Disable Dashboard gestures");
  v4[5] = CFSTR("Disable SecurePay AX Features");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)_hasValidAssertionType__ValidAssertionTypes;
  _hasValidAssertionType__ValidAssertionTypes = v2;

}

- (void)_notifyServerAssertionWasAcquired
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  AXLogAssertions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[AXAssertion assertionType](self, "assertionType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAssertion identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v4;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_18C62B000, v3, OS_LOG_TYPE_INFO, "Assertion acquired: %@, %@", buf, 0x16u);

  }
  if (-[AXAssertion _hasValidAssertionType](self, "_hasValidAssertionType"))
  {
    if (objc_msgSend((id)objc_opt_class(), "isSupported"))
    {
      +[AXSpringBoardServer server](AXSpringBoardServer, "server");
      v6 = objc_claimAutoreleasedReturnValue();
      -[AXAssertion assertionType](self, "assertionType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXAssertion identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject acquireAssertionWithType:identifier:](v6, "acquireAssertionWithType:identifier:", v7, v8);

    }
    else
    {
      AXLogAssertions();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[AXAssertion ensureAssertionsHaveBeenProcessedWithCompletion:].cold.1(v6, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    -[AXAssertion assertionType](self, "assertionType");
    v6 = objc_claimAutoreleasedReturnValue();
    _AXAssert();
  }

}

- (void)_notifyServerAssertionWasRelinquished
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  AXLogAssertions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[AXAssertion assertionType](self, "assertionType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAssertion identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v4;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_18C62B000, v3, OS_LOG_TYPE_INFO, "Assertion released: %@, %@", buf, 0x16u);

  }
  if (-[AXAssertion _hasValidAssertionType](self, "_hasValidAssertionType"))
  {
    if (objc_msgSend((id)objc_opt_class(), "isSupported"))
    {
      +[AXSpringBoardServer server](AXSpringBoardServer, "server");
      v6 = objc_claimAutoreleasedReturnValue();
      -[AXAssertion assertionType](self, "assertionType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXAssertion identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject relinquishAssertionWithType:identifier:](v6, "relinquishAssertionWithType:identifier:", v7, v8);

    }
    else
    {
      AXLogAssertions();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[AXAssertion ensureAssertionsHaveBeenProcessedWithCompletion:].cold.1(v6, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    -[AXAssertion assertionType](self, "assertionType");
    v6 = objc_claimAutoreleasedReturnValue();
    _AXAssert();
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXAssertion assertionType](self, "assertionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAssertion identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXAssertion:<%p> Type:%@ ClientID:%@"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)assertionType
{
  return self->_assertionType;
}

- (void)setAssertionType:(id)a3
{
  objc_storeStrong((id *)&self->_assertionType, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_assertionType, 0);
}

+ (void)ensureAssertionsHaveBeenProcessedWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18C62B000, a1, a3, "AX SystemApp Assertions not implemented on this platform", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
