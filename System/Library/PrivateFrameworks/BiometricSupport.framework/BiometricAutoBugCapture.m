@implementation BiometricAutoBugCapture

- (BiometricAutoBugCapture)initWithDomain:(id)a3 process:(id)a4 dispatchQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  BiometricAutoBugCapture *v12;
  SDRDiagnosticReporter *v13;
  SDRDiagnosticReporter *reporter;
  BiometricAutoBugCapture *v15;
  BiometricAutoBugCapture *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)BiometricAutoBugCapture;
  v12 = -[BiometricAutoBugCapture init](&v23, sel_init);
  if (v12)
  {
    v13 = (SDRDiagnosticReporter *)objc_alloc_init(NSClassFromString(CFSTR("SDRDiagnosticReporter")));
    reporter = v12->_reporter;
    v12->_reporter = v13;

    if (v12->_reporter)
    {
      objc_storeStrong((id *)&v12->_domain, a3);
      objc_storeStrong((id *)&v12->_process, a4);
      objc_storeStrong((id *)&v12->_dispatchQueue, a5);
      v12->_serialLogEnabled = 0;
      getBootArgs();
      v15 = (BiometricAutoBugCapture *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = -[BiometricAutoBugCapture rangeOfString:](v15, "rangeOfString:", CFSTR("serial="));
        if (v18)
        {
          v19 = v17 + v18;
          if (v17 + v18 < (unint64_t)-[BiometricAutoBugCapture length](v16, "length"))
          {
            -[BiometricAutoBugCapture substringWithRange:](v16, "substringWithRange:", v19, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v12->_serialLogEnabled = objc_msgSend(v20, "BOOLValue");

          }
        }
      }
    }
    else
    {
      if (__osLog)
        v22 = __osLog;
      else
        v22 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v25 = "_reporter";
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = &unk_21491C593;
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BiometricAutoBugCapture.m";
        v32 = 1024;
        v33 = 33;
        _os_log_impl(&dword_2148C7000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v16 = v12;
      v12 = 0;
    }

  }
  return v12;
}

- (id)getTypeForReason:(unint64_t)a3
{
  if (a3 - 4097 > 4)
    return CFSTR("Default");
  else
    return off_24D2410F8[a3 - 4097];
}

- (id)getSubtypeForReason:(unint64_t)a3
{
  if (a3 - 4097 > 4)
    return CFSTR("Default");
  else
    return off_24D241120[a3 - 4097];
}

- (id)getSignatureWithType:(id)a3 subtype:(id)a4
{
  return (id)-[SDRDiagnosticReporter signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:](self->_reporter, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", self->_domain, a3, a4, self->_process, 0);
}

- (id)getSignatureForReason:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[BiometricAutoBugCapture getTypeForReason:](self, "getTypeForReason:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiometricAutoBugCapture getSubtypeForReason:](self, "getSubtypeForReason:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v11 = 136316162;
    v12 = "type";
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = &unk_21491C593;
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BiometricAutoBugCapture.m";
    v19 = 1024;
    v20 = 143;
    goto LABEL_15;
  }
  if (!v6)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v11 = 136316162;
    v12 = "subtype";
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = &unk_21491C593;
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BiometricAutoBugCapture.m";
    v19 = 1024;
    v20 = 144;
LABEL_15:
    _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
LABEL_16:
    v8 = 0;
    goto LABEL_4;
  }
  -[BiometricAutoBugCapture getSignatureWithType:subtype:](self, "getSignatureWithType:subtype:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

  return v8;
}

- (BOOL)sendAutoBugCaptureEvent:(unint64_t)a3
{
  void *v4;
  BOOL v5;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[BiometricAutoBugCapture getSignatureForReason:](self, "getSignatureForReason:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[BiometricAutoBugCapture sendSignature:withDuration:](self, "sendSignature:withDuration:", v4, *(double *)&DEFAULT_SNAPSHOT_TIME);
  }
  else
  {
    if (__osLog)
      v7 = __osLog;
    else
      v7 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136316162;
      v9 = "signature";
      v10 = 2048;
      v11 = 0;
      v12 = 2080;
      v13 = &unk_21491C593;
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BiometricAutoBugCapture.m";
      v16 = 1024;
      v17 = 156;
      _os_log_impl(&dword_2148C7000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v8, 0x30u);
    }
    v5 = 0;
  }

  return v5;
}

- (void)sendAutoBugCaptureEvent:(unint64_t)a3 withContext:(id)a4 replyBlock:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  -[BiometricAutoBugCapture getSignatureForReason:](self, "getSignatureForReason:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (v8)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BEB3580]);
    -[BiometricAutoBugCapture sendSignature:withDuration:replyBlock:](self, "sendSignature:withDuration:replyBlock:", v11, v9, 0.0);
  }
  else
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "Failed to create ABC signature\n", v13, 2u);
    }
    if (v9)
      v9[2](v9, *MEMORY[0x24BEB34D0]);
  }

}

- (void)sendSignature:(id)a3 withDuration:(double)a4 replyBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  double v16;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__BiometricAutoBugCapture_sendSignature_withDuration_replyBlock___block_invoke;
  v13[3] = &unk_24D2410D8;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

void __65__BiometricAutoBugCapture_sendSignature_withDuration_replyBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)os_transaction_create();
  v3 = (void *)MEMORY[0x2199D8AE0]();
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = *(double *)(a1 + 56);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__BiometricAutoBugCapture_sendSignature_withDuration_replyBlock___block_invoke_2;
  v10[3] = &unk_24D2410B0;
  v11 = v4;
  v12 = *(id *)(a1 + 48);
  if ((objc_msgSend(v5, "snapshotWithSignature:duration:event:payload:reply:", v11, 0, 0, v10, v6) & 1) == 0)
  {
    if (__osLog)
      v7 = __osLog;
    else
      v7 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_2148C7000, v7, OS_LOG_TYPE_ERROR, "Failed to send auto bug capture signature: %@\n", buf, 0xCu);
    }
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, *MEMORY[0x24BEB34D0]);
  }

  objc_autoreleasePoolPop(v3);
}

void __65__BiometricAutoBugCapture_sendSignature_withDuration_replyBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  _WORD v22[17];

  *(_QWORD *)&v22[13] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BEB3550]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    if (__osLog)
      v6 = __osLog;
    else
      v6 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *MEMORY[0x24BEB3540];
      v9 = v6;
      objc_msgSend(v3, "objectForKeyedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v7;
      v21 = 2112;
      *(_QWORD *)v22 = v10;
      _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_DEFAULT, "Successfully send auto bug capture signature: %@ with sessionID: %@\n", (uint8_t *)&v19, 0x16u);

    }
    v11 = *MEMORY[0x24BEB34D8];
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BEB3520]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = objc_msgSend(v12, "intValue");
    else
      v11 = *MEMORY[0x24BEB34D0];
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *MEMORY[0x24BEB3538];
      v16 = v13;
      objc_msgSend(v3, "objectForKeyedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412802;
      v20 = v14;
      v21 = 1024;
      *(_DWORD *)v22 = v11;
      v22[2] = 2112;
      *(_QWORD *)&v22[3] = v17;
      _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_DEFAULT, "Dampened auto bug capture signature: %@ with error code: %d reason: %@\n", (uint8_t *)&v19, 0x1Cu);

    }
  }
  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v18, v11);

}

- (BOOL)sendSignature:(id)a3 withDuration:(double)a4
{
  -[BiometricAutoBugCapture sendSignature:withDuration:replyBlock:](self, "sendSignature:withDuration:replyBlock:", a3, 0, a4);
  return 1;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSString)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
  objc_storeStrong((id *)&self->_process, a3);
}

- (SDRDiagnosticReporter)reporter
{
  return self->_reporter;
}

- (BOOL)serialLogEnabled
{
  return self->_serialLogEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
