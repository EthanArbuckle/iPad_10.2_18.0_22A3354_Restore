@implementation MKSIM

- (MKSIM)initWithData:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  MKSIM *v22;
  NSObject *v23;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MKSIM;
  v5 = -[MKSIM init](&v26, sel_init);
  if (!v5)
    goto LABEL_18;
  if (!v4)
  {
    +[MKLog log](MKLog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MKSIM initWithData:].cold.1();
    goto LABEL_28;
  }
  v25 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v25;
  if (v7)
  {
    +[MKLog log](MKLog, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MKSIM initWithData:].cold.5();
LABEL_21:

LABEL_29:
    v22 = 0;
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[MKLog log](MKLog, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MKSIM initWithData:].cold.4();
    goto LABEL_21;
  }
  v9 = v6;
  if (!-[NSObject count](v9, "count"))
  {
    +[MKLog log](MKLog, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MKSIM initWithData:].cold.2();
    goto LABEL_27;
  }
  -[NSObject objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", 0);
  v10 = objc_claimAutoreleasedReturnValue();
  -[NSObject mk_stringForKey:](v10, "mk_stringForKey:", CFSTR("number"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumber:", v11);

  -[NSObject mk_stringForKey:](v10, "mk_stringForKey:", CFSTR("carrier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCarrier:", v12);

  -[NSObject mk_stringForKey:](v10, "mk_stringForKey:", CFSTR("carrier_id"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCarrierID:", v13);

  -[NSObject mk_stringForKey:](v10, "mk_stringForKey:", CFSTR("mccmnc"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMccmnc:", v14);

  -[NSObject mk_stringForKey:](v10, "mk_stringForKey:", CFSTR("gid1"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGid1:", v15);

  +[MKLog log](MKLog, "log");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = v5[1];
    v18 = v5[2];
    v19 = v5[3];
    v20 = v5[4];
    v21 = v5[5];
    *(_DWORD *)buf = 138478851;
    v28 = v17;
    v29 = 2112;
    v30 = v18;
    v31 = 2112;
    v32 = v19;
    v33 = 2112;
    v34 = v20;
    v35 = 2112;
    v36 = v21;
    _os_log_impl(&dword_21EC08000, v16, OS_LOG_TYPE_INFO, "parsed a sim. number=%{private}@, carrier=%@, carrier_id=%@, mccmnc=%@, gid1=%@", buf, 0x34u);
  }

  if (!objc_msgSend((id)v5[1], "length")
    || !objc_msgSend((id)v5[2], "length")
    || !objc_msgSend((id)v5[3], "length")
    || !objc_msgSend((id)v5[4], "length")
    || !objc_msgSend((id)v5[5], "length"))
  {
    +[MKLog log](MKLog, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[MKSIM initWithData:].cold.3(v5 + 1, v5, v23);

LABEL_27:
LABEL_28:

    goto LABEL_29;
  }

LABEL_18:
  v22 = v5;
LABEL_30:

  return v22;
}

- (NSString)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
  objc_storeStrong((id *)&self->_number, a3);
}

- (NSString)carrier
{
  return self->_carrier;
}

- (void)setCarrier:(id)a3
{
  objc_storeStrong((id *)&self->_carrier, a3);
}

- (NSString)carrierID
{
  return self->_carrierID;
}

- (void)setCarrierID:(id)a3
{
  objc_storeStrong((id *)&self->_carrierID, a3);
}

- (NSString)mccmnc
{
  return self->_mccmnc;
}

- (void)setMccmnc:(id)a3
{
  objc_storeStrong((id *)&self->_mccmnc, a3);
}

- (NSString)gid1
{
  return self->_gid1;
}

- (void)setGid1:(id)a3
{
  objc_storeStrong((id *)&self->_gid1, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gid1, 0);
  objc_storeStrong((id *)&self->_mccmnc, 0);
  objc_storeStrong((id *)&self->_carrierID, 0);
  objc_storeStrong((id *)&self->_carrier, 0);
  objc_storeStrong((id *)&self->_number, 0);
}

- (void)initWithData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, v0, v1, "%@ could not initialize sim from nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, v0, v1, "%@ could not receive an array of SIMs.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithData:(os_log_t)log .cold.3(uint64_t *a1, _QWORD *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = a2[2];
  v5 = a2[3];
  v6 = a2[4];
  v7 = a2[5];
  v8 = 138478851;
  v9 = v3;
  v10 = 2112;
  v11 = v4;
  v12 = 2112;
  v13 = v5;
  v14 = 2112;
  v15 = v6;
  v16 = 2112;
  v17 = v7;
  _os_log_error_impl(&dword_21EC08000, log, OS_LOG_TYPE_ERROR, "invalid sim. number=%{private}@, carrier=%@, carrier_id=%@, mccmnc=%@, gid1=%@", (uint8_t *)&v8, 0x34u);
}

- (void)initWithData:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, v0, v1, "%@ could not initialize because an invalid json format was received.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithData:.cold.5()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_21EC08000, v1, OS_LOG_TYPE_ERROR, "%@ could not initialize because an underlying error occurred unexpectedly. error=%@", v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

@end
