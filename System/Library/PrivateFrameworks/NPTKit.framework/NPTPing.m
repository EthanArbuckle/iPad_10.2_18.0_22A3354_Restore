@implementation NPTPing

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTPing)initWithNetworkActivityParent:(id)a3
{
  id v5;
  NPTPing *v6;
  NPTPingResult *v7;
  SimplePing *v8;
  SimplePing *pinger;
  NSMutableArray *v10;
  NSMutableArray *pings;
  uint64_t v12;
  OS_nw_activity *pingActivity;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NPTPing;
  v6 = -[NPTPing init](&v15, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(NPTPingResult);
    -[NPTPing setResults:](v6, "setResults:", v7);

    v8 = -[SimplePing initWithHostName:]([SimplePing alloc], "initWithHostName:", CFSTR("npt.cdn-apple.com"));
    pinger = v6->pinger;
    v6->pinger = v8;

    -[SimplePing setDelegate:](v6->pinger, "setDelegate:", v6);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pings = v6->pings;
    v6->pings = v10;

    v12 = nw_activity_create();
    pingActivity = v6->pingActivity;
    v6->pingActivity = (OS_nw_activity *)v12;

    objc_storeStrong((id *)&v6->activityParent, a3);
    nw_activity_set_parent_activity();
  }

  return v6;
}

- (NPTPing)initWithNetworkActivityParent:(id)a3 pingTarget:(id)a4
{
  id v7;
  id v8;
  NPTPing *v9;
  NPTPingResult *v10;
  SimplePing *v11;
  SimplePing *pinger;
  NSMutableArray *v13;
  NSMutableArray *pings;
  uint64_t v15;
  OS_nw_activity *pingActivity;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NPTPing;
  v9 = -[NPTPing init](&v18, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(NPTPingResult);
    -[NPTPing setResults:](v9, "setResults:", v10);

    v11 = -[SimplePing initWithHostName:]([SimplePing alloc], "initWithHostName:", v8);
    pinger = v9->pinger;
    v9->pinger = v11;

    -[SimplePing setDelegate:](v9->pinger, "setDelegate:", v9);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pings = v9->pings;
    v9->pings = v13;

    v15 = nw_activity_create();
    pingActivity = v9->pingActivity;
    v9->pingActivity = (OS_nw_activity *)v15;

    objc_storeStrong((id *)&v9->activityParent, a3);
    nw_activity_set_parent_activity();
  }

  return v9;
}

- (void)startWithNumberOfPings:(unint64_t)a3 forcingIPv4:(BOOL)a4 forcingIPv6:(BOOL)a5
{
  -[NPTPing startWithNumberOfPings:forcingIPv4:forcingIPv6:completion:](self, "startWithNumberOfPings:forcingIPv4:forcingIPv6:completion:", a3, a4, a5, 0);
}

- (void)startWithNumberOfPings:(unint64_t)a3 forcingIPv4:(BOOL)a4 forcingIPv6:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  unint64_t v15;
  uint64_t v16;

  v6 = a5;
  v7 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  -[NPTPing setCompletion:](self, "setCompletion:", a6);
  nw_activity_activate();
  self->pingCount = a3;
  if (v7 && !v6)
  {
    v10 = 1;
LABEL_7:
    -[SimplePing setAddressStyle:](self->pinger, "setAddressStyle:", v10);
    goto LABEL_8;
  }
  if (v6 && !v7)
  {
    v10 = 2;
    goto LABEL_7;
  }
LABEL_8:
  -[NPTPing delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NPTPing delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pingWillStartPinging");

  }
  +[NPTLogger network](NPTLogger, "network");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134217984;
    v15 = a3;
    _os_log_impl(&dword_20E71B000, v13, OS_LOG_TYPE_DEFAULT, "Will test ping latency by sending %lu pings to Apple CDN Server", (uint8_t *)&v14, 0xCu);
  }

  -[SimplePing start](self->pinger, "start");
}

- (void)sendPing
{
  NSMutableArray *pings;
  Ping *v4;

  pings = self->pings;
  v4 = objc_alloc_init(Ping);
  -[NSMutableArray addObject:](pings, "addObject:", v4);

  -[SimplePing sendPingWithData:](self->pinger, "sendPingWithData:", 0);
}

- (void)stop
{
  void *v3;
  uint64_t v4;
  NPTPingResult *v5;
  NSMutableArray *pings;
  void *v7;
  NPTPingResult *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  double v27;
  double v28;
  unint64_t pingCount;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  double v42;
  double v43;
  unint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void (**v50)(_QWORD, _QWORD, _QWORD);
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id location;

  -[NPTPing results](self, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = [NPTPingResult alloc];
  pings = self->pings;
  -[SimplePing hostName](self->pinger, "hostName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NPTPingResult initWithPings:usingAddress:](v5, "initWithPings:usingAddress:", pings, v7);
  -[NPTPing setResults:](self, "setResults:", v8);

  -[NPTPing results](self, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)v4;
  objc_msgSend(v9, "setError:", v4);

  -[SimplePing stop](self->pinger, "stop");
  -[NPTPing results](self, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "percentLost");
  if (v11 == 0.0)
  {
    -[NPTPing results](self, "results");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count") == self->pingCount;

  }
  else
  {

    v14 = 0;
  }
  nw_activity_complete_with_reason();
  -[NPTPing delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[NPTPing delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTPing results](self, "results");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pingDidFinishWithResults:", v17);

  }
  -[NPTPing completion](self, "completion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_initWeak(&location, self);
    if (v14)
    {
      v19 = 0;
    }
    else
    {
      v57 = (void *)MEMORY[0x24BDD17C8];
      -[NPTPing results](self, "results");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");
      -[NPTPing results](self, "results");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");
      -[NPTPing results](self, "results");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "percentLost");
      v28 = v27;
      pingCount = self->pingCount;
      -[NPTPing results](self, "results");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "percentLost");
      objc_msgSend(v57, "stringWithFormat:", CFSTR("Errors encountered with ping. Sent: %ld Received: %ld Expected: %lu Percent Lost: %f"), v22, (unint64_t)((v28 / -100.0 + 1.0) * (double)v25), pingCount, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[NPTPing results](self, "results");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "error");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        v53 = (void *)MEMORY[0x24BDD17C8];
        -[NPTPing results](self, "results");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "error");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "localizedDescription");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPTPing results](self, "results");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "pings");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "count");
        -[NPTPing results](self, "results");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "pings");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "count");
        -[NPTPing results](self, "results");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "percentLost");
        v43 = v42;
        v44 = self->pingCount;
        -[NPTPing results](self, "results");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "percentLost");
        objc_msgSend(v53, "stringWithFormat:", CFSTR("%@. Sent: %ld Received: %ld Expected: %lu Percent Lost: %.02f"), v54, v37, (unint64_t)((v43 / -100.0 + 1.0) * (double)v40), v44, v46);
        v47 = objc_claimAutoreleasedReturnValue();

        v32 = (void *)v47;
      }
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setValue:forKey:", v32, *MEMORY[0x24BDD0FC8]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPTKit"), -1, v48);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTPing results](self, "results");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setError:", v19);

    }
    -[NPTPing completion](self, "completion");
    v50 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v51 = objc_loadWeakRetained(&location);
    objc_msgSend(v51, "results");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v50)[2](v50, v52, v19);

    objc_destroyWeak(&location);
  }

}

- (void)simplePing:(id)a3 didReceivePingResponsePacket:(id)a4 sequenceNumber:(unsigned __int16)a5
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a5;
  -[NSMutableArray objectAtIndex:](self->pings, "objectAtIndex:", a5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWasSuccessful:", 1);

  v8 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  -[NSMutableArray objectAtIndex:](self->pings, "objectAtIndex:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEndTime:", v8);

  if (-[NSMutableArray count](self->pings, "count") >= self->pingCount)
    -[NPTPing stop](self, "stop");
  else
    -[NPTPing sendPing](self, "sendPing");
}

- (void)simplePing:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);

  v6 = a4;
  v7 = a3;
  +[NPTLogger network](NPTLogger, "network");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[NPTPing simplePing:didFailWithError:].cold.1(v6);

  objc_msgSend(v7, "stop");
  -[NPTPing results](self, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[NPTPing results](self, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setError:", v6);

  }
  -[NPTPing delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NPTPing delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pingDidFinishWithError:", v6);

  }
  -[NPTPing completion](self, "completion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NPTPing completion](self, "completion");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v15)[2](v15, 0, v6);

  }
}

- (void)simplePing:(id)a3 didTimeOut:(id)a4 sequenceNumber:(unsigned __int16)a5 error:(id)a6
{
  unsigned int v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v6 = a5;
  v8 = a6;
  +[NPTLogger network](NPTLogger, "network");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[NPTPing simplePing:didTimeOut:sequenceNumber:error:].cold.1(v8, v6, v9);

  -[NPTPing results](self, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[NPTPing results](self, "results");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setError:", v8);

  }
  if (!-[NSMutableArray count](self->pings, "count"))
    goto LABEL_8;
  -[NSMutableArray objectAtIndex:](self->pings, "objectAtIndex:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWasSuccessful:", 0);

  v14 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  -[NSMutableArray objectAtIndex:](self->pings, "objectAtIndex:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEndTime:", v14);

  if (-[NSMutableArray count](self->pings, "count") < self->pingCount)
    -[NPTPing sendPing](self, "sendPing");
  else
LABEL_8:
    -[NPTPing stop](self, "stop");

}

- (void)simplePing:(id)a3 didFailToSendPacket:(id)a4 sequenceNumber:(unsigned __int16)a5 error:(id)a6
{
  unsigned int v6;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a5;
  v8 = a6;
  +[NPTLogger network](NPTLogger, "network");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[NPTPing simplePing:didFailToSendPacket:sequenceNumber:error:].cold.1(v8);

  -[NSMutableArray objectAtIndex:](self->pings, "objectAtIndex:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWasSuccessful:", 0);

  v11 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  -[NSMutableArray objectAtIndex:](self->pings, "objectAtIndex:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEndTime:", v11);

  -[NPTPing results](self, "results");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[NPTPing results](self, "results");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setError:", v8);

  }
  if (-[NSMutableArray count](self->pings, "count") >= self->pingCount)
    -[NPTPing stop](self, "stop");
  else
    -[NPTPing sendPing](self, "sendPing");

}

- (void)simplePing:(id)a3 didReceiveUnexpectedPacket:(id)a4
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;

  +[NPTLogger network](NPTLogger, "network", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[NPTPing simplePing:didReceiveUnexpectedPacket:].cold.1(v5);

  -[NSMutableArray objectAtIndex:](self->pings, "objectAtIndex:", -[NSMutableArray count](self->pings, "count") - 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWasSuccessful:", 0);

  v7 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  -[NSMutableArray objectAtIndex:](self->pings, "objectAtIndex:", -[NSMutableArray count](self->pings, "count") - 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEndTime:", v7);

  if (-[NSMutableArray count](self->pings, "count") >= self->pingCount)
    -[NPTPing stop](self, "stop");
  else
    -[NPTPing sendPing](self, "sendPing");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NPTPing results](self, "results");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("pingResults"));

}

- (NPTPing)initWithCoder:(id)a3
{
  id v3;
  NPTPing *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NPTPing;
  v3 = a3;
  v4 = -[NPTPing init](&v7, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pingResults"), v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPTPing setResults:](v4, "setResults:", v5);
  return v4;
}

- (void)cancel
{
  -[SimplePing stop](self->pinger, "stop");
}

- (id)copyWithZone:(_NSZone *)a3
{
  NPTPing *v4;
  void *v5;

  v4 = -[NPTPing init](+[NPTPing allocWithZone:](NPTPing, "allocWithZone:", a3), "init");
  -[NPTPing results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPing setResults:](v4, "setResults:", v5);

  return v4;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (NPTPingResult)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->pingActivity, 0);
  objc_storeStrong((id *)&self->activityParent, 0);
  objc_storeStrong((id *)&self->pings, 0);
  objc_storeStrong((id *)&self->pinger, 0);
}

- (void)simplePing:(void *)a1 didFailWithError:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_20E71B000, v2, v3, "Failed to send pings with error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)simplePing:(NSObject *)a3 didTimeOut:sequenceNumber:error:.cold.1(void *a1, unsigned __int16 a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 1024;
  v9 = a2;
  _os_log_error_impl(&dword_20E71B000, a3, OS_LOG_TYPE_ERROR, "Time out with error: %{public}@ , Sequence Number %hu", (uint8_t *)&v6, 0x12u);

}

- (void)simplePing:(void *)a1 didFailToSendPacket:sequenceNumber:error:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_20E71B000, v2, v3, "Failed to send packet with error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)simplePing:(os_log_t)log didReceiveUnexpectedPacket:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20E71B000, log, OS_LOG_TYPE_ERROR, "Ping not successful: Did receive unexpected packet", v1, 2u);
}

@end
