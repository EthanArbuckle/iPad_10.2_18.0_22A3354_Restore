@implementation HMFNetworkDiagnosticPing

- (HMFNetworkDiagnosticPing)initWithDevice:(id)a3 delegate:(id)a4 queue:(id)a5
{
  HMFNetworkDiagnosticPing *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMFNetworkDiagnosticPing;
  v5 = -[HMFNetworkDiagnostic initWithDevice:delegate:queue:](&v7, sel_initWithDevice_delegate_queue_, a3, a4, a5);
  if (v5)
  {
    v5->_identifier = arc4random();
    v5->_runDuration = -1.0;
    v5->_sockHandle_ipv4 = -1;
    v5->_sockHandle_ipv6 = -1;
  }
  return v5;
}

- (id)workContext
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__HMFNetworkDiagnosticPing_workContext__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  if (_MergedGlobals_1_2 != -1)
    dispatch_once(&_MergedGlobals_1_2, block);
  return (id)qword_1ED013320;
}

void __39__HMFNetworkDiagnosticPing_workContext__block_invoke(uint64_t a1)
{
  HMFDispatchContext *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = [HMFDispatchContext alloc];
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[HMFDispatchContext initWithQueue:](v2, "initWithQueue:", v5);
  v4 = (void *)qword_1ED013320;
  qword_1ED013320 = v3;

}

- (id)addressIPV6
{
  void *v2;
  void *v3;
  void *v4;

  -[HMFNetworkDiagnostic device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_34);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __39__HMFNetworkDiagnosticPing_addressIPV6__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addressFamily") == 2;
}

- (id)addressIPV4
{
  void *v2;
  void *v3;
  void *v4;

  -[HMFNetworkDiagnostic device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_2_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __39__HMFNetworkDiagnosticPing_addressIPV4__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addressFamily") == 1;
}

- (id)shortDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%hu"), objc_opt_class(), -[HMFNetworkDiagnosticPing identifier](self, "identifier"));
}

- (id)delayFuture:(double)a3
{
  HMFPromise **p_delayPromise;
  HMFPromise *delayPromise;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[5];

  if (a3 <= 0.0)
  {
    +[HMFFuture futureWithNoValue](HMFFuture, "futureWithNoValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    p_delayPromise = &self->_delayPromise;
    delayPromise = self->_delayPromise;
    self->_delayPromise = 0;

    +[HMFFuture futureWithPromise:](HMFFuture, "futureWithPromise:", p_delayPromise);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__HMFNetworkDiagnosticPing_delayFuture___block_invoke;
    block[3] = &unk_1E3B37AF8;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  }
  return v7;
}

void __40__HMFNetworkDiagnosticPing_delayFuture___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delayPromise");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fulfillWithNoValue");

}

- (id)runWithDelay:(double)a3
{
  void *v5;
  void *v6;
  _QWORD v8[6];

  -[HMFNetworkDiagnosticPing workContext](self, "workContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__HMFNetworkDiagnosticPing_runWithDelay___block_invoke;
  v8[3] = &unk_1E3B38C18;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  +[HMFFuture inContext:perform:](HMFFuture, "inContext:perform:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __41__HMFNetworkDiagnosticPing_runWithDelay___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v29;
  _QWORD v30[5];
  id v31;

  if ((objc_msgSend(*(id *)(a1 + 32), "isStarted") & 1) != 0)
    return 1;
  objc_msgSend(*(id *)(a1 + 32), "setStarted:", 1);
  objc_msgSend(*(id *)(a1 + 32), "pingDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "pingDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "diagnostic:didStartWithDevice:", v6, v7);

  }
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v8, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v8, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMFSystemInfo systemInfo](HMFSystemInfo, "systemInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("ID: %@ -> Source: %@"), v11, v13);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "addresses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addressString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "deviceID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "host");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Target: %@/%@/%@"), v17, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ -> %@"), v29, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dataUsingEncoding:", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "delayFuture:", *(double *)(a1 + 40));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __41__HMFNetworkDiagnosticPing_runWithDelay___block_invoke_2;
  v30[3] = &unk_1E3B38BC8;
  v30[4] = *(_QWORD *)(a1 + 32);
  v25 = v23;
  v31 = v25;
  objc_msgSend(v24, "then:", v30);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (!v26)
    _HMFPreconditionFailure(CFSTR("future"));
  v27 = v26;
  v2 = 3;

  return v2;
}

uint64_t __41__HMFNetworkDiagnosticPing_runWithDelay___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sendPing:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__HMFNetworkDiagnosticPing_runWithDelay___block_invoke_3;
  v11[3] = &unk_1E3B391D0;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "recover:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __41__HMFNetworkDiagnosticPing_runWithDelay___block_invoke_4;
  v10[3] = &unk_1E3B38910;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "finally:", v10);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    _HMFPreconditionFailure(CFSTR("future"));
  v8 = v7;

  return 3;
}

uint64_t __41__HMFNetworkDiagnosticPing_runWithDelay___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "stopWithError:", v3);
  v4 = v3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __41__HMFNetworkDiagnosticPing_runWithDelay___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stopWithError:", 0);
  return 1;
}

- (id)run
{
  return -[HMFNetworkDiagnosticPing runWithDelay:](self, "runWithDelay:", 0.0);
}

- (id)_sendPing:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[HMFNetworkDiagnosticPing _configure](self, "_configure");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__HMFNetworkDiagnosticPing__sendPing___block_invoke;
  v10[3] = &unk_1E3B38BC8;
  v10[4] = self;
  v11 = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__HMFNetworkDiagnosticPing__sendPing___block_invoke_2;
  v9[3] = &unk_1E3B391D0;
  v6 = v4;
  objc_msgSend(v5, "then:orRecover:", v10, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __38__HMFNetworkDiagnosticPing__sendPing___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sendData:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    _HMFPreconditionFailure(CFSTR("future"));
  v5 = v4;

  return 3;
}

uint64_t __38__HMFNetworkDiagnosticPing__sendPing___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC355C]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v7;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to configure with error: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v8 = v3;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (void)stopWithError:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[HMFNetworkDiagnosticPing sockHandle_ipv4](self, "sockHandle_ipv4") != -1)
  {
    close(-[HMFNetworkDiagnosticPing sockHandle_ipv4](self, "sockHandle_ipv4"));
    -[HMFNetworkDiagnosticPing setSockHandle_ipv4:](self, "setSockHandle_ipv4:", 0xFFFFFFFFLL);
  }
  if (-[HMFNetworkDiagnosticPing sockHandle_ipv6](self, "sockHandle_ipv6") != -1)
  {
    close(-[HMFNetworkDiagnosticPing sockHandle_ipv6](self, "sockHandle_ipv6"));
    -[HMFNetworkDiagnosticPing setSockHandle_ipv6:](self, "setSockHandle_ipv6:", 0xFFFFFFFFLL);
  }
  if (-[HMFNetworkDiagnosticPing socket_ipv4](self, "socket_ipv4"))
  {
    CFSocketInvalidate(-[HMFNetworkDiagnosticPing socket_ipv4](self, "socket_ipv4"));
    -[HMFNetworkDiagnosticPing setSocket_ipv4:](self, "setSocket_ipv4:", 0);
  }
  if (-[HMFNetworkDiagnosticPing socket_ipv6](self, "socket_ipv6"))
  {
    CFSocketInvalidate(-[HMFNetworkDiagnosticPing socket_ipv6](self, "socket_ipv6"));
    -[HMFNetworkDiagnosticPing setSocket_ipv6:](self, "setSocket_ipv6:", 0);
  }
  -[HMFNetworkDiagnostic device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  if (-[HMFNetworkDiagnostic isStarted](self, "isStarted"))
  {
    -[HMFNetworkDiagnosticPing pingDelegate](self, "pingDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      if (v10)
      {
        v7 = v10;
      }
      else
      {
        -[HMFNetworkDiagnosticPing readPromise](self, "readPromise");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 14);
          v7 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = 0;
        }

      }
      -[HMFNetworkDiagnosticPing pingDelegate](self, "pingDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "diagnostic:didCompleteWithError:", self, v7);

    }
  }
  -[HMFNetworkDiagnostic setStarted:](self, "setStarted:", 0);

}

- (void)stop
{
  -[HMFNetworkDiagnosticPing stopWithError:](self, "stopWithError:", 0);
}

- (id)dumpReport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  uint64_t v35;
  void *v36;
  __CFString *v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __CFString *v66;
  void *v67;

  -[HMFNetworkDiagnostic device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_15);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMFNetworkDiagnostic device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "serviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@\t\t"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isHAP") & 1) == 0 && (objc_msgSend(v6, "isAirPlay") & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "serviceType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@\t"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  v13 = HMFIsCustomerBuild();
  v62 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "deviceID");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = CFSTR("??:??:??:??:??:??");
  if (v14)
    v16 = (const __CFString *)v14;
  v61 = v16;
  objc_msgSend(v6, "category");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("-");
  v60 = v19;
  objc_msgSend(v6, "stateNumber");
  v20 = objc_claimAutoreleasedReturnValue();
  v64 = (void *)v20;
  if (v20)
    v21 = (const __CFString *)v20;
  else
    v21 = CFSTR("-");
  v59 = v21;
  objc_msgSend(v6, "configNumber");
  v22 = objc_claimAutoreleasedReturnValue();
  v63 = (void *)v22;
  if (v22)
    v23 = (const __CFString *)v22;
  else
    v23 = CFSTR("-");
  v58 = v23;
  objc_msgSend(v6, "statusFlag");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (const __CFString *)v24;
  else
    v26 = CFSTR("-");
  -[HMFNetworkDiagnosticPing runDuration](self, "runDuration");
  v28 = v27;
  v65 = (void *)v18;
  if (v13)
  {
    if (v27 < 0.0)
    {
      v66 = CFSTR("-");
    }
    else
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      -[HMFNetworkDiagnosticPing runDuration](self, "runDuration");
      objc_msgSend(v29, "stringWithFormat:", CFSTR("%.3fs"), v30);
      v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v33 = objc_msgSend(v67, "count");
    if (v33)
    {
      objc_msgSend(v67, "componentsJoinedByString:", CFSTR(","));
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = CFSTR("(N/A)");
    }
    v50 = (void *)MEMORY[0x1E0CB37E8];
    -[HMFNetworkDiagnostic device](self, "device");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "numberWithUnsignedShort:", objc_msgSend(v51, "port"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "stringWithFormat:", CFSTR("%@%@\t%@\t\t%@\t%@\t%@\t%@\t\t (%@) / (%@) / %@ / %@\n"), v9, v61, v60, v59, v58, v26, v66, CFSTR("<private>"), CFSTR("<private>"), v34, v52);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    v48 = v65;
    v47 = v67;
    if (v28 < 0.0)
      goto LABEL_39;
LABEL_38:

    goto LABEL_39;
  }
  v57 = v9;
  v55 = v26;
  if (v27 < 0.0)
  {
    v66 = CFSTR("-");
  }
  else
  {
    v31 = (void *)MEMORY[0x1E0CB3940];
    -[HMFNetworkDiagnosticPing runDuration](self, "runDuration");
    objc_msgSend(v31, "stringWithFormat:", CFSTR("%.3fs"), v32);
    v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "model");
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  v37 = CFSTR("(N/A)");
  if (v35)
    v38 = (const __CFString *)v35;
  else
    v38 = CFSTR("(N/A)");
  v54 = v38;
  objc_msgSend(v6, "serviceName");
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v39;
  if (v39)
    v41 = (const __CFString *)v39;
  else
    v41 = CFSTR("(N/A)");
  v42 = objc_msgSend(v67, "count");
  v56 = v15;
  if (v42)
  {
    objc_msgSend(v67, "componentsJoinedByString:", CFSTR(","));
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)MEMORY[0x1E0CB37E8];
  -[HMFNetworkDiagnostic device](self, "device");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "numberWithUnsignedShort:", objc_msgSend(v44, "port"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v41;
  v9 = v57;
  objc_msgSend(v62, "stringWithFormat:", CFSTR("%@%@\t%@\t\t%@\t%@\t%@\t%@\t\t (%@) / (%@) / %@ / %@\n"), v57, v61, v60, v59, v58, v55, v66, v54, v53, v37, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  v47 = v67;
  v15 = v56;
  v48 = v65;
  if (v28 >= 0.0)
    goto LABEL_38;
LABEL_39:

  return v46;
}

uint64_t __38__HMFNetworkDiagnosticPing_dumpReport__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addressString");
}

- (id)_configure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CFSocketNativeHandle v7;
  void *v9;
  HMFNetworkDiagnosticPing *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  CFSocketContext v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HMFNetworkDiagnosticPing addressIPV4](self, "addressIPV4");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[HMFNetworkDiagnosticPing addressIPV6](self, "addressIPV6");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v9 = (void *)MEMORY[0x1A1AC355C]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMFNetworkDiagnostic device](v10, "device");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "shortDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v19.version) = 138543618;
        *(CFIndex *)((char *)&v19.version + 4) = (CFIndex)v12;
        WORD2(v19.info) = 2114;
        *(void **)((char *)&v19.info + 6) = v14;
        _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_ERROR, "%{public}@No valid address for device: %{public}@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = 4;
      goto LABEL_15;
    }
  }
  -[HMFNetworkDiagnosticPing addressIPV4](self, "addressIPV4");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[HMFNetworkDiagnosticPing setSockHandle_ipv4:](self, "setSockHandle_ipv4:", socket(2, 2, 1));
  -[HMFNetworkDiagnosticPing addressIPV6](self, "addressIPV6");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[HMFNetworkDiagnosticPing setSockHandle_ipv6:](self, "setSockHandle_ipv6:", socket(30, 2, 58));
  v19.version = 0;
  v19.info = self;
  memset(&v19.retain, 0, 24);
  -[HMFNetworkDiagnosticPing setSocket_ipv4:](self, "setSocket_ipv4:", create_socket(-[HMFNetworkDiagnosticPing sockHandle_ipv4](self, "sockHandle_ipv4"), &v19));
  v7 = -[HMFNetworkDiagnosticPing sockHandle_ipv6](self, "sockHandle_ipv6");
  v19.version = 0;
  v19.info = self;
  memset(&v19.retain, 0, 24);
  -[HMFNetworkDiagnosticPing setSocket_ipv6:](self, "setSocket_ipv6:", create_socket(v7, &v19));
  if (-[HMFNetworkDiagnosticPing socket_ipv4](self, "socket_ipv4")
    || -[HMFNetworkDiagnosticPing socket_ipv6](self, "socket_ipv6"))
  {
    +[HMFFuture futureWithNoValue](HMFFuture, "futureWithNoValue");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)MEMORY[0x1E0CB35C8];
  v16 = 15;
LABEL_15:
  objc_msgSend(v15, "hmfErrorWithCode:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMFFuture futureWithError:](HMFFuture, "futureWithError:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_sendData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];

  v4 = a3;
  -[HMFNetworkDiagnosticPing addressIPV4](self, "addressIPV4");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetworkDiagnosticPing _sendData:address:](self, "_sendData:address:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __38__HMFNetworkDiagnosticPing__sendData___block_invoke_2;
  v14[3] = &unk_1E3B391D0;
  v14[4] = self;
  objc_msgSend(v6, "then:orRecover:", &__block_literal_global_35, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __38__HMFNetworkDiagnosticPing__sendData___block_invoke_36;
  v12[3] = &unk_1E3B39238;
  v12[4] = self;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v8, "finally:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __38__HMFNetworkDiagnosticPing__sendData___block_invoke()
{
  return 1;
}

uint64_t __38__HMFNetworkDiagnosticPing__sendData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC355C]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addressIPV4");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to send data via address: %{public}@ with error: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

  return 1;
}

uint64_t __38__HMFNetworkDiagnosticPing__sendData___block_invoke_36(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v1, "addressIPV6");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_sendData:address:", v2, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    _HMFPreconditionFailure(CFSTR("future"));
  v5 = v4;

  return 3;
}

- (id)_sendData:(id)a3 address:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFSocket *v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  unsigned __int16 *v30;
  unint64_t v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  HMFNetworkDiagnosticPing *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  const void *v44;
  size_t v45;
  id v46;
  const sockaddr *v47;
  ssize_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  HMFNetworkDiagnosticPing *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  int v65;
  uint64_t v66;
  void *v67;
  CFSocketRef v68;
  void *v70;
  uint64_t v71;
  void *v72;
  id v73;
  CFSocketRef v74;
  id v75;
  uint8_t buf[4];
  id v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  uint64_t v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    +[HMFFuture futureWithNoValue](HMFFuture, "futureWithNoValue");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  if (objc_msgSend(v7, "addressFamily") == 1)
  {
    v9 = -[HMFNetworkDiagnosticPing socket_ipv4](self, "socket_ipv4");
    if (v9)
      goto LABEL_4;
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMFFuture futureWithError:](HMFFuture, "futureWithError:", v63);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_42;
  }
  v9 = -[HMFNetworkDiagnosticPing socket_ipv6](self, "socket_ipv6");
  if (!v9)
    goto LABEL_29;
LABEL_4:
  v74 = v9;
  v10 = objc_msgSend(v8, "addressFamily");
  if (v10 == 1)
    v11 = 8;
  else
    v11 = -128;
  LODWORD(v72) = v11;
  objc_msgSend(v8, "dataUsingEncoding:", 1);
  v73 = (id)objc_claimAutoreleasedReturnValue();
  v12 = -[HMFNetworkDiagnosticPing identifier](self, "identifier");
  v13 = -[HMFNetworkDiagnosticPing sequenceNumber](self, "sequenceNumber");
  v75 = v6;
  v14 = v6;
  v15 = v14;
  if ((unint64_t)objc_msgSend(v14, "length") <= 0x37)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 56);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v14)
      objc_msgSend(v16, "appendData:", v14);
    v18 = objc_msgSend(v14, "length");
    v19 = 56 - v18;
    MEMORY[0x1E0C80A78](v18, v20, v21);
    v23 = (char *)&v70 - v22;
    RandomBytes();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v23, v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendData:", v24);

    v15 = (void *)objc_msgSend(v17, "copy");
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", objc_msgSend(v15, "length") + 8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
    __assert_rtn("pingPacketWithType", "HMFNetworkDiagnosticPing.m", 448, "packet");
  v26 = objc_retainAutorelease(v25);
  v27 = objc_msgSend(v26, "mutableBytes");
  *(_BYTE *)v27 = (_BYTE)v72;
  *(_BYTE *)(v27 + 1) = 0;
  *(_WORD *)(v27 + 2) = 0;
  *(_WORD *)(v27 + 4) = __rev16(v12);
  *(_WORD *)(v27 + 6) = __rev16(v13);
  v28 = objc_retainAutorelease(v15);
  memcpy((void *)(v27 + 8), (const void *)objc_msgSend(v28, "bytes"), objc_msgSend(v28, "length"));
  if (v10 != 1)
    goto LABEL_19;
  v29 = objc_retainAutorelease(v26);
  v30 = (unsigned __int16 *)objc_msgSend(v29, "bytes");
  v31 = objc_msgSend(v29, "length");
  if (v31 < 2)
  {
    v32 = 0;
    if (!v31)
      goto LABEL_18;
  }
  else
  {
    v32 = 0;
    do
    {
      v33 = *v30++;
      v32 += v33;
      v31 -= 2;
    }
    while (v31 > 1);
    if (!v31)
      goto LABEL_18;
  }
  v32 += *(unsigned __int8 *)v30;
LABEL_18:
  *(_WORD *)(v27 + 2) = ~(HIWORD(v32) + v32 + (((v32 >> 16) + (unsigned __int16)v32) >> 16));
LABEL_19:

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v14, 4);
  v35 = (void *)MEMORY[0x1A1AC355C]();
  v36 = self;
  HMFGetOSLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v26, "length"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFNetworkDiagnostic device](v36, "device");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "shortDescription");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v77 = v38;
    v78 = 2112;
    v79 = v39;
    v80 = 2112;
    v81 = v34;
    v82 = 2114;
    v83 = v41;
    _os_log_impl(&dword_19B546000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Sending data (%@: %@) to device: %{public}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v35);
  -[HMFNetworkDiagnosticPing setReadPromise:](v36, "setReadPromise:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetworkDiagnosticPing setPingStartDate:](v36, "setPingStartDate:", v42);

  LODWORD(v42) = CFSocketGetNative(v74);
  v43 = objc_retainAutorelease(v26);
  v44 = (const void *)objc_msgSend(v43, "bytes");
  v45 = objc_msgSend(v43, "length");
  v46 = objc_retainAutorelease(v73);
  v47 = (const sockaddr *)objc_msgSend(v46, "bytes");
  v74 = (CFSocketRef)v46;
  v48 = sendto((int)v42, v44, v45, 0, v47, objc_msgSend(v46, "length"));
  v49 = objc_msgSend(v43, "length");
  if (v48 == -1)
    v50 = 6;
  else
    v50 = 15;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetworkDiagnosticPing pingStartDate](v36, "pingStartDate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "timeIntervalSinceDate:", v52);
  v54 = v53;

  v55 = (void *)MEMORY[0x1A1AC355C]();
  v56 = v36;
  HMFGetOSLogHandle();
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
  {
    v70 = v55;
    v72 = v34;
    HMFGetLogIdentifier(v56);
    v73 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v43, "length"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFNetworkDiagnostic device](v56, "device");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "shortDescription");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v50;
    if (v48 == v49)
    {
      v61 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", v50);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138544386;
    v77 = v73;
    v78 = 2112;
    v79 = v58;
    v80 = 2114;
    v81 = v60;
    v82 = 2114;
    v83 = v61;
    v84 = 2048;
    v85 = v54;
    _os_log_impl(&dword_19B546000, v57, OS_LOG_TYPE_INFO, "%{public}@Sent data (%@) to device: %{public}@ with error: %{public}@. Duration: %.3fs", buf, 0x34u);
    if (v48 != v49)

    v50 = v71;
    v34 = v72;
    v55 = v70;
  }

  objc_autoreleasePoolPop(v55);
  v64 = -[HMFNetworkDiagnosticPing sequenceNumber](v56, "sequenceNumber");
  v65 = v64 + 1;
  v66 = (unsigned __int16)(v64 + 1);
  -[HMFNetworkDiagnosticPing setSequenceNumber:](v56, "setSequenceNumber:", v66);
  if ((_DWORD)v66 != v65)
    -[HMFNetworkDiagnosticPing setSequenceNumber:](v56, "setSequenceNumber:", 0);
  if (v48 == v49)
  {
    +[HMFFuture futureWithPromise:](HMFFuture, "futureWithPromise:", &v56->_readPromise);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "timeout:", 1.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", v50);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMFFuture futureWithError:](HMFFuture, "futureWithError:", v67);
  }
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v74;

  v6 = v75;
LABEL_42:

  return v62;
}

- (void)_readDataFromSocket:(__CFSocket *)a3
{
  void *v3;
  CFSocketRef v4;
  CFSocketNativeHandle Native;
  ssize_t v6;
  ssize_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  HMFNetAddress *v13;
  int v14;
  id v15;
  id v16;
  _BYTE *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  int v23;
  unsigned __int8 *v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int16 *v34;
  int v35;
  unint64_t v36;
  int v37;
  unsigned __int16 *v38;
  int v39;
  socklen_t v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  double v48;
  sockaddr v49;
  _BYTE v50[65535];
  uint64_t v51;

  v3 = (void *)MEMORY[0x1E0C80A78](self, a2, a3);
  v51 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v49.sa_len = 0;
  *(_QWORD *)&v49.sa_data[6] = 0;
  v40 = 16;
  Native = CFSocketGetNative(v4);
  v6 = recvfrom(Native, v50, 0xFFFFuLL, 0, &v49, &v40);
  if ((v6 & 0x8000000000000000) == 0)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pingStartDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = v10;

    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", v50, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMFNetAddress initWithSocketAddress:]([HMFNetAddress alloc], "initWithSocketAddress:", &v49);
    if (-[HMFNetAddress addressFamily](v13, "addressFamily") == 1)
    {
      v14 = objc_msgSend(v3, "identifier");
      v15 = v12;
      if ((unint64_t)objc_msgSend(v15, "length") < 0x1C
        || (v16 = objc_retainAutorelease(v15), v17 = (_BYTE *)objc_msgSend(v16, "bytes"), (*v17 & 0xF0) != 0x40)
        || v17[9] != 1
        || (v18 = 4 * (*v17 & 0xF), objc_msgSend(v16, "length") < (unint64_t)(v18 + 8)))
      {

        goto LABEL_36;
      }

      v15 = objc_retainAutorelease(v16);
      v34 = (unsigned __int16 *)(objc_msgSend(v15, "mutableBytes") + v18);
      if (*(_BYTE *)v34 || *((_BYTE *)v34 + 1))
        goto LABEL_36;
      v35 = v34[1];
      v34[1] = 0;
      v36 = objc_msgSend(v15, "length") - v18;
      if (v36 < 2)
      {
        v37 = 0;
        v38 = v34;
      }
      else
      {
        v37 = 0;
        v38 = v34;
        do
        {
          v39 = *v38++;
          v37 += v39;
          v36 -= 2;
        }
        while (v36 > 1);
      }
      if (v36)
        v37 += *(unsigned __int8 *)v38;
      v34[1] = v35;
      if (v35 != (unsigned __int16)~(HIWORD(v37) + v37 + (((v37 >> 16) + (unsigned __int16)v37) >> 16))
        || v14 != bswap32(v34[2]) >> 16)
      {
        goto LABEL_36;
      }
      v25 = 28;
    }
    else
    {
      if (-[HMFNetAddress addressFamily](v13, "addressFamily") != 2)
      {
LABEL_37:

        return;
      }
      v23 = objc_msgSend(v3, "identifier");
      v15 = v12;
      if ((unint64_t)objc_msgSend(v15, "length") < 8
        || (v15 = objc_retainAutorelease(v15), v24 = (unsigned __int8 *)objc_msgSend(v15, "bytes"), *v24 != 129)
        || v24[1]
        || v23 != bswap32(*((unsigned __int16 *)v24 + 2)) >> 16)
      {
LABEL_36:

        goto LABEL_37;
      }
      v25 = 8;
    }
    objc_msgSend(v12, "replaceBytesInRange:withBytes:length:", 0, v25, 0, 0);

    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v12, 4);
    v26 = (void *)MEMORY[0x1A1AC355C]();
    v27 = v3;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v27);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v30 = v15;
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v27, "device");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "shortDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v42 = v29;
      v43 = 2112;
      v44 = v30;
      v45 = 2114;
      v46 = v32;
      v47 = 2048;
      v48 = v11;
      _os_log_impl(&dword_19B546000, v28, OS_LOG_TYPE_INFO, "%{public}@Receive data (%@) from device: %{public}@. Duration: %.3fs", buf, 0x2Au);

      if (!v15)
    }

    objc_autoreleasePoolPop(v26);
    objc_msgSend(v27, "setRunDuration:", v11);
    objc_msgSend(v27, "readPromise");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "fulfillWithNoValue");

    objc_msgSend(v27, "setReadPromise:", 0);
    goto LABEL_36;
  }
  v19 = (void *)MEMORY[0x1A1AC355C]();
  v20 = v3;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v22;
    _os_log_impl(&dword_19B546000, v21, OS_LOG_TYPE_ERROR, "%{public}@Receive invalid data", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned __int16)a3
{
  self->_identifier = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned __int16)a3
{
  self->_sequenceNumber = a3;
}

- (double)runDuration
{
  return self->_runDuration;
}

- (void)setRunDuration:(double)a3
{
  self->_runDuration = a3;
}

- (int)sockHandle_ipv4
{
  return self->_sockHandle_ipv4;
}

- (void)setSockHandle_ipv4:(int)a3
{
  self->_sockHandle_ipv4 = a3;
}

- (int)sockHandle_ipv6
{
  return self->_sockHandle_ipv6;
}

- (void)setSockHandle_ipv6:(int)a3
{
  self->_sockHandle_ipv6 = a3;
}

- (__CFSocket)socket_ipv4
{
  return self->_socket_ipv4;
}

- (void)setSocket_ipv4:(__CFSocket *)a3
{
  self->_socket_ipv4 = a3;
}

- (__CFSocket)socket_ipv6
{
  return self->_socket_ipv6;
}

- (void)setSocket_ipv6:(__CFSocket *)a3
{
  self->_socket_ipv6 = a3;
}

- (NSDate)pingStartDate
{
  return self->_pingStartDate;
}

- (void)setPingStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_pingStartDate, a3);
}

- (HMFPromise)readPromise
{
  return self->_readPromise;
}

- (void)setReadPromise:(id)a3
{
  objc_storeStrong((id *)&self->_readPromise, a3);
}

- (HMFPromise)delayPromise
{
  return self->_delayPromise;
}

- (void)setDelayPromise:(id)a3
{
  objc_storeStrong((id *)&self->_delayPromise, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayPromise, 0);
  objc_storeStrong((id *)&self->_readPromise, 0);
  objc_storeStrong((id *)&self->_pingStartDate, 0);
}

@end
