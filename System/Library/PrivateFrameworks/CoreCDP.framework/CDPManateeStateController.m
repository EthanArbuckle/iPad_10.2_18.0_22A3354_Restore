@implementation CDPManateeStateController

- (void)isManateeAvailable:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a2, a3, "\"CDPManateeStateController: Manatee not available due to iCDP eligibility issue: %{public}@\", a5, a6, a7, a8, 2u);
}

- (BOOL)isManateeAvailable:(id *)a3
{
  NSObject *v5;
  void *v6;
  CDPContext *context;
  BOOL v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[CDPContext altDSID](self->_context, "altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 141558274;
    v32 = 1752392040;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"CDPManateeStateController: Trying to determine manatee availability for altDSID: %{mask.hash}@\", buf, 0x16u);

  }
  context = self->_context;
  v30 = 0;
  v8 = -[CDPContext isiCDPEligibleWithError:](context, "isiCDPEligibleWithError:", &v30);
  v9 = v30;
  v10 = v9;
  if (v8)
  {
    v29 = v9;
    v11 = -[CDPManateeStateController _checkCircleStateWithError:](self, "_checkCircleStateWithError:", &v29);
    v12 = v29;

    if (v11)
    {
      v13 = 1;
LABEL_16:
      v10 = v12;
      goto LABEL_17;
    }
    _CDPLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CDPManateeStateController isManateeAvailable:].cold.1((uint64_t)v12, v21, v22, v23, v24, v25, v26, v27);

    if (!a3)
    {
      v13 = 0;
      goto LABEL_16;
    }
    v10 = v12;
    goto LABEL_14;
  }
  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[CDPManateeStateController isManateeAvailable:].cold.2((uint64_t)v10, v14, v15, v16, v17, v18, v19, v20);

  if (a3)
  {
LABEL_14:
    v10 = objc_retainAutorelease(v10);
    v13 = 0;
    *a3 = v10;
    goto LABEL_17;
  }
  v13 = 0;
LABEL_17:

  return v13;
}

- (CDPManateeStateController)initWithContext:(id)a3 circleProxy:(id)a4
{
  id v7;
  id v8;
  CDPManateeStateController *v9;
  id *p_isa;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  CDPManateeStateController *v15;
  NSObject *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CDPManateeStateController;
  v9 = -[CDPManateeStateController init](&v18, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (!v9)
  {
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CDPManateeStateController initWithContext:circleProxy:].cold.1(a2);
    goto LABEL_11;
  }

  +[CDPContext preflightContext:](CDPContext, "preflightContext:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CDPManateeStateController initWithContext:circleProxy:].cold.2((uint64_t)p_isa, a2);
    goto LABEL_11;
  }
  v12 = v11;
  objc_storeStrong(p_isa + 2, v11);

  v13 = v8;
  if (!v13)
  {
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CDPManateeStateController initWithContext:circleProxy:].cold.3((uint64_t)p_isa, a2);
LABEL_11:

    v15 = 0;
    goto LABEL_12;
  }
  v14 = v13;
  objc_storeStrong(p_isa + 1, a4);

  v15 = p_isa;
LABEL_12:

  return v15;
}

- (CDPManateeStateController)initWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  CDPCircleProxyImpl *v6;
  CDPManateeStateController *v7;

  v4 = a3;
  if (!v4)
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CDPManateeStateController initWithContext:].cold.1(v5);

    +[CDPContext contextForPrimaryAccount](CDPContext, "contextForPrimaryAccount");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = -[CDPCircleProxyImpl initWithContext:]([CDPCircleProxyImpl alloc], "initWithContext:", v4);
  v7 = -[CDPManateeStateController initWithContext:circleProxy:](self, "initWithContext:circleProxy:", v4, v6);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_circleProxy, 0);
}

- (CDPManateeStateController)init
{
  void *v3;
  CDPManateeStateController *v4;

  +[CDPContext contextForPrimaryAccount](CDPContext, "contextForPrimaryAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CDPManateeStateController initWithContext:](self, "initWithContext:", v3);

  return v4;
}

- (BOOL)_checkCircleStateWithError:(id *)a3
{
  NSObject *v5;
  CDPDCircleProxy *circleProxy;
  uint64_t v7;
  id v8;
  BOOL v9;
  id v11;
  uint8_t buf[16];

  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"CDPManateeStateController: Checking security eligibility state...\", buf, 2u);
  }

  circleProxy = self->_circleProxy;
  v11 = 0;
  v7 = -[CDPDCircleProxy cachedCliqueStatus:](circleProxy, "cachedCliqueStatus:", &v11);
  v8 = v11;
  if (v7 == 1)
  {
    v9 = self->_circleProxy != 0;
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:underlyingError:", -5403, v8);
    v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)initWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
}

- (void)initWithContext:(const char *)a1 circleProxy:.cold.1(const char *a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (void *)objc_opt_class();
  v3 = OUTLINED_FUNCTION_11(v2);
  NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6_0(&dword_20D7E6000, v5, v6, "\"[%{public}@ %{public}@]: Value for '%{public}s' was nil, failing init\", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_8();
}

- (void)initWithContext:(uint64_t)a1 circleProxy:(const char *)a2 .cold.2(uint64_t a1, const char *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (void *)objc_opt_class();
  v4 = OUTLINED_FUNCTION_11(v3);
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6_0(&dword_20D7E6000, v6, v7, "\"[%{public}@ %{public}@]: Value for '%{public}s' was nil, failing init\", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_8();
}

- (void)initWithContext:(uint64_t)a1 circleProxy:(const char *)a2 .cold.3(uint64_t a1, const char *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (void *)objc_opt_class();
  v4 = OUTLINED_FUNCTION_11(v3);
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6_0(&dword_20D7E6000, v6, v7, "\"[%{public}@ %{public}@]: Value for '%{public}s' was nil, failing init\", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_8();
}

- (void)isManateeAvailable:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a2, a3, "\"CDPManateeStateController: Manatee not available due to circle failure with error: %{public}@\", a5, a6, a7, a8, 2u);
}

@end
