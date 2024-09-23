@implementation FMDExtVendorContext

- (FMDExtVendorContext)init
{
  NSObject *v3;
  objc_super v5;
  uint8_t buf[16];

  LogCategory_Extensions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9939000, v3, OS_LOG_TYPE_DEFAULT, "Initialized vendor context", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)FMDExtVendorContext;
  return -[FMDExtVendorContext init](&v5, sel_init);
}

- (void)fetchAllAccessoriesInfo:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_Extensions();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[FMDExtVendorContext fetchAllAccessoriesInfo:withCompletion:]";
    _os_log_impl(&dword_1C9939000, v8, OS_LOG_TYPE_DEFAULT, "EXTENSION API: %s", (uint8_t *)&v15, 0xCu);
  }

  -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_opt_respondsToSelector(),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchAllAccessoriesInfoWithInfo:withCompletion:", v6, v7);

  }
  else
  {
    LogCategory_Extensions();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[FMDExtVendorContext fetchAllAccessoriesInfo:withCompletion:].cold.1(self);

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)connectionStatusForAccessory:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  LogCategory_Extensions();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[FMDExtVendorContext connectionStatusForAccessory:withCompletion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1C9939000, v8, OS_LOG_TYPE_DEFAULT, "EXTENSION API: %s called for accessory %@", (uint8_t *)&v15, 0x16u);
  }

  -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_opt_respondsToSelector(),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "connectionStatusForAccessory:withCompletion:", v6, v7);
  }
  else
  {
    LogCategory_Extensions();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[FMDExtVendorContext connectionStatusForAccessory:withCompletion:].cold.1(self);

    objc_msgSend(MEMORY[0x1E0CB35C8], "fm_cancelledError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v13);
  }

}

- (void)getStyleForAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  LogCategory_Extensions();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315394;
    v19 = "-[FMDExtVendorContext getStyleForAccessory:info:withCompletion:]";
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_1C9939000, v11, OS_LOG_TYPE_DEFAULT, "EXTENSION API: %s called for accessory %@", (uint8_t *)&v18, 0x16u);
  }

  -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12
    && (v13 = (void *)v12,
        -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_opt_respondsToSelector(),
        v14,
        v13,
        (v15 & 1) != 0))
  {
    -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "getStyleForAccessory:info:withCompletion:", v8, v9, v10);
  }
  else
  {
    LogCategory_Extensions();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[FMDExtVendorContext getStyleForAccessory:info:withCompletion:].cold.1(self);

    objc_msgSend(MEMORY[0x1E0CB35C8], "fm_cancelledError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v16);
  }

}

- (void)safetyAlertForAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  LogCategory_Extensions();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315394;
    v19 = "-[FMDExtVendorContext safetyAlertForAccessory:info:withCompletion:]";
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_1C9939000, v11, OS_LOG_TYPE_DEFAULT, "EXTENSION API: %s called for accessory %@", (uint8_t *)&v18, 0x16u);
  }

  -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12
    && (v13 = (void *)v12,
        -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_opt_respondsToSelector(),
        v14,
        v13,
        (v15 & 1) != 0))
  {
    -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safetyAlertForAccessory:info:withCompletion:", v8, v9, v10);
  }
  else
  {
    LogCategory_Extensions();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[FMDExtVendorContext safetyAlertForAccessory:info:withCompletion:].cold.1(self);

    objc_msgSend(MEMORY[0x1E0CB35C8], "fm_cancelledError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v16);
  }

}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMDExtVendorContext;
  if (-[FMDExtVendorContext respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMDExtVendorContext;
  -[FMDExtVendorContext methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selector");
  v6 = objc_opt_respondsToSelector();

  LogCategory_Extensions();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1C9939000, v8, OS_LOG_TYPE_DEFAULT, "VendorCntext forwardInvocation %@ to delegate %@", buf, 0x16u);

    }
    -[FMDExtVendorContext accessoryProvider](self, "accessoryProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invokeWithTarget:", v10);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FMDExtVendorContext forwardInvocation:].cold.1(v4, v8);

    v11.receiver = self;
    v11.super_class = (Class)FMDExtVendorContext;
    -[FMDExtVendorContext forwardInvocation:](&v11, sel_forwardInvocation_, v4);
  }

}

- (FMDExtAccessoryProtocol)accessoryProvider
{
  return self->_accessoryProvider;
}

- (void)setAccessoryProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryProvider, 0);
}

- (void)fetchAllAccessoriesInfo:(void *)a1 withCompletion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "accessoryProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1C9939000, v2, v3, "Accessory provider %@ does not support %s", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)connectionStatusForAccessory:(void *)a1 withCompletion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "accessoryProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1C9939000, v2, v3, "Accessory provider %@ does not support %s", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)getStyleForAccessory:(void *)a1 info:withCompletion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "accessoryProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1C9939000, v2, v3, "Accessory provider %@ does not support %s", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)safetyAlertForAccessory:(void *)a1 info:withCompletion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "accessoryProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1C9939000, v2, v3, "Accessory provider %@ does not support %s", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)forwardInvocation:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector((SEL)objc_msgSend(a1, "selector"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9939000, a2, OS_LOG_TYPE_ERROR, "Invocation %@ not supported", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_7();
}

@end
