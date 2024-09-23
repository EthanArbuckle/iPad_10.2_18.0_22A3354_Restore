@implementation NPEdgeLatency

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPEdgeLatency)initWithProbeEndpoint:(id)a3 probeTFO:(BOOL)a4
{
  id v7;
  NPEdgeLatency *v8;
  NPEdgeLatency *v9;
  NPAverage *v10;
  NPAverage *roundTripAverage;
  NPAverage *v12;
  NPAverage *roundTripAverageObserved;
  NSDate *v14;
  NSDate *creationDate;
  uint64_t v16;
  NSNumber *addressFamily;
  objc_super v19;

  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NPEdgeLatency;
  v8 = -[NPEdgeLatency init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_roundTripTime = 0xFFFFFFFFLL;
    v10 = -[NPAverage initWithSampleSize:]([NPAverage alloc], "initWithSampleSize:", 5);
    roundTripAverage = v9->_roundTripAverage;
    v9->_roundTripAverage = v10;

    v12 = -[NPAverage initWithSampleSize:]([NPAverage alloc], "initWithSampleSize:", 5);
    roundTripAverageObserved = v9->_roundTripAverageObserved;
    v9->_roundTripAverageObserved = v12;

    v14 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    creationDate = v9->_creationDate;
    v9->_creationDate = v14;

    v9->_probeCount = 0;
    objc_storeStrong((id *)&v9->_probeEndpoint, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      __assert_rtn("-[NPEdgeLatency initWithProbeEndpoint:probeTFO:]", "NPEdgeLatency.m", 195, "[probeEndpoint isKindOfClass:[NWAddressEndpoint class]]");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "addressFamily"));
    v16 = objc_claimAutoreleasedReturnValue();
    addressFamily = v9->_addressFamily;
    v9->_addressFamily = (NSNumber *)v16;

    v9->_probeTFO = a4;
  }

  return v9;
}

- (void)addRoundTripSample:(unint64_t)a3
{
  NPAverage *roundTripAverage;

  roundTripAverage = self->_roundTripAverage;
  if (roundTripAverage)
  {
    -[NPAverage addSample:](roundTripAverage, "addSample:", a3);
    a3 = -[NPAverage average](self->_roundTripAverage, "average");
  }
  self->_roundTripTime = a3;
}

- (void)addRoundTripSamples:(id)a3
{
  NPAverage *roundTripAverage;

  roundTripAverage = self->_roundTripAverage;
  if (roundTripAverage)
  {
    -[NPAverage addSamples:](roundTripAverage, "addSamples:", a3);
    self->_roundTripTime = -[NPAverage average](self->_roundTripAverage, "average");
  }
}

- (unint64_t)getRoundTripSample:(unint64_t)a3
{
  NPAverage *roundTripAverage;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;

  roundTripAverage = self->_roundTripAverage;
  if (!roundTripAverage)
    return 0xFFFFFFFFLL;
  -[NPAverage samples](roundTripAverage, "samples");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    return 0xFFFFFFFFLL;
  v7 = (void *)v6;
  -[NPAverage samples](self->_roundTripAverage, "samples");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 <= a3)
    return 0xFFFFFFFFLL;
  -[NPAverage samples](self->_roundTripAverage, "samples");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  return v12;
}

- (void)addRoundTripSampleObserved:(unint64_t)a3
{
  NPAverage *roundTripAverageObserved;

  roundTripAverageObserved = self->_roundTripAverageObserved;
  if (roundTripAverageObserved)
    -[NPAverage addSample:](roundTripAverageObserved, "addSample:", a3);
}

- (NPEdgeLatency)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NPEdgeLatency *v6;
  uint64_t v7;
  NSDate *creationDate;
  uint64_t v9;
  NPAverage *roundTripAverage;
  uint64_t v11;
  NPAverage *roundTripAverageObserved;
  uint64_t v13;
  NSNumber *addressFamily;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProbeEndpoint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NPEdgeLatency initWithProbeEndpoint:probeTFO:](self, "initWithProbeEndpoint:probeTFO:", v5, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ProbeTFO")));
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CreationDate"));
    v7 = objc_claimAutoreleasedReturnValue();
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v7;

    v6->_probeCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ProbeCount"));
    v6->_interfaceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("IFType"));
    v6->_edgeIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EdgeIndex"));
    v6->_roundTripTime = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("RTT"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RTTAverage"));
    v9 = objc_claimAutoreleasedReturnValue();
    roundTripAverage = v6->_roundTripAverage;
    v6->_roundTripAverage = (NPAverage *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RTTAverageObserved"));
    v11 = objc_claimAutoreleasedReturnValue();
    roundTripAverageObserved = v6->_roundTripAverageObserved;
    v6->_roundTripAverageObserved = (NPAverage *)v11;

    v6->_passedReprobeThreshold = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PassedReprobeThreshold"));
    v6->_TFOStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("TFOStatus"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "addressFamily"));
    v13 = objc_claimAutoreleasedReturnValue();
    addressFamily = v6->_addressFamily;
    v6->_addressFamily = (NSNumber *)v13;

    v6->_probeNoTFOCookie = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ProbeTFONoCookie"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[NPEdgeLatency edgeIndex](self, "edgeIndex"), CFSTR("EdgeIndex"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[NPEdgeLatency roundTripTime](self, "roundTripTime"), CFSTR("RTT"));
  -[NPEdgeLatency roundTripAverage](self, "roundTripAverage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("RTTAverage"));

  -[NPEdgeLatency roundTripAverageObserved](self, "roundTripAverageObserved");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("RTTAverageObserved"));

  objc_msgSend(v8, "encodeBool:forKey:", -[NPEdgeLatency passedReprobeThreshold](self, "passedReprobeThreshold"), CFSTR("PassedReprobeThreshold"));
  -[NPEdgeLatency creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("CreationDate"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[NPEdgeLatency probeCount](self, "probeCount"), CFSTR("ProbeCount"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[NPEdgeLatency interfaceType](self, "interfaceType"), CFSTR("IFType"));
  -[NPEdgeLatency probeEndpoint](self, "probeEndpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("ProbeEndpoint"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[NPEdgeLatency TFOStatus](self, "TFOStatus"), CFSTR("TFOStatus"));
  objc_msgSend(v8, "encodeBool:forKey:", -[NPEdgeLatency probeTFO](self, "probeTFO"), CFSTR("ProbeTFO"));
  objc_msgSend(v8, "encodeBool:forKey:", -[NPEdgeLatency probeNoTFOCookie](self, "probeNoTFOCookie"), CFSTR("ProbeTFONoCookie"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NPEdgeLatency *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = -[NPEdgeLatency init](+[NPEdgeLatency allocWithZone:](NPEdgeLatency, "allocWithZone:"), "init");
  -[NPEdgeLatency setRoundTripTime:](v5, "setRoundTripTime:", -[NPEdgeLatency roundTripTime](self, "roundTripTime"));
  -[NPEdgeLatency setEdgeIndex:](v5, "setEdgeIndex:", -[NPEdgeLatency edgeIndex](self, "edgeIndex"));
  -[NPEdgeLatency roundTripAverage](self, "roundTripAverage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[NPEdgeLatency setRoundTripAverage:](v5, "setRoundTripAverage:", v7);

  -[NPEdgeLatency roundTripAverageObserved](self, "roundTripAverageObserved");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[NPEdgeLatency setRoundTripAverageObserved:](v5, "setRoundTripAverageObserved:", v9);

  -[NPEdgeLatency setPassedReprobeThreshold:](v5, "setPassedReprobeThreshold:", -[NPEdgeLatency passedReprobeThreshold](self, "passedReprobeThreshold"));
  -[NPEdgeLatency creationDate](self, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPEdgeLatency setCreationDate:](v5, "setCreationDate:", v10);

  -[NPEdgeLatency setProbeCount:](v5, "setProbeCount:", -[NPEdgeLatency probeCount](self, "probeCount"));
  -[NPEdgeLatency addressFamily](self, "addressFamily");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPEdgeLatency setAddressFamily:](v5, "setAddressFamily:", v11);

  -[NPEdgeLatency setInterfaceType:](v5, "setInterfaceType:", -[NPEdgeLatency interfaceType](self, "interfaceType"));
  -[NPEdgeLatency setTFOStatus:](v5, "setTFOStatus:", -[NPEdgeLatency TFOStatus](self, "TFOStatus"));
  -[NPEdgeLatency setProbeTFO:](v5, "setProbeTFO:", -[NPEdgeLatency probeTFO](self, "probeTFO"));
  -[NPEdgeLatency probeEndpoint](self, "probeEndpoint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPEdgeLatency setProbeEndpoint:](v5, "setProbeEndpoint:", v12);

  -[NPEdgeLatency setProbeNoTFOCookie:](v5, "setProbeNoTFOCookie:", -[NPEdgeLatency probeNoTFOCookie](self, "probeNoTFOCookie"));
  return v5;
}

- (NSString)addressFamilyString
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;

  -[NPEdgeLatency addressFamily](self, "addressFamily");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  v4 = CFSTR("unknown");
  if (v3 == 30)
    v4 = CFSTR("IPv6");
  if (v3 == 2)
    return (NSString *)CFSTR("IPv4");
  else
    return &v4->isa;
}

- (NSString)TFOStatusString
{
  uint64_t v3;
  void *v4;
  const char *v5;

  v3 = -[NPEdgeLatency TFOStatus](self, "TFOStatus");
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v3 > 3)
    v5 = "Unknown";
  else
    v5 = TFOStatusString_names[-[NPEdgeLatency TFOStatus](self, "TFOStatus")];
  objc_msgSend(v4, "stringWithUTF8String:", v5);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)connectionParametersString
{
  id v3;
  _BOOL4 v4;
  const __CFString *v5;

  if (!-[NPEdgeLatency probeTFO](self, "probeTFO"))
    return (NSString *)CFSTR("TCP");
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = -[NPEdgeLatency probeNoTFOCookie](self, "probeNoTFOCookie");
  v5 = CFSTR("Cookie");
  if (v4)
    v5 = CFSTR("NoCookie");
  return (NSString *)(id)objc_msgSend(v3, "initWithFormat:", CFSTR("TFO %@"), v5);
}

- (BOOL)isTFOEnabled
{
  return -[NPEdgeLatency TFOStatus](self, "TFOStatus") == 2;
}

- (id)description
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = -[NPEdgeLatency edgeIndex](self, "edgeIndex");
  -[NPEdgeLatency probeEndpoint](self, "probeEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Edge %lu(%@) RTT %lu"), v4, v7, -[NPEdgeLatency roundTripTime](self, "roundTripTime"));

  -[NPEdgeLatency roundTripAverage](self, "roundTripAverage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "appendFormat:", CFSTR(" (%@)"), v9);
  -[NPEdgeLatency roundTripAverageObserved](self, "roundTripAverageObserved");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v3, "appendFormat:", CFSTR(" (observed %@)"), v11);
  if (-[NPEdgeLatency passedReprobeThreshold](self, "passedReprobeThreshold"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" (passed reprobe threshold)"));
  -[NPEdgeLatency connectionParametersString](self, "connectionParametersString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPEdgeLatency TFOStatusString](self, "TFOStatusString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" (%@ %@)"), v12, v13);

  if (-[NPEdgeLatency interfaceType](self, "interfaceType"))
  {
    +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", -[NPEdgeLatency interfaceType](self, "interfaceType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" (%@)"), v14);

  }
  return v3;
}

- (BOOL)fillTestLatency
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BYTE v10[2];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[NSPManager sharedManager](NSPManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useTestLatencyMap");

  if (v4)
  {
    v10[0] = -[NPEdgeLatency probeTFO](self, "probeTFO");
    v10[1] = -[NPEdgeLatency probeNoTFOCookie](self, "probeNoTFOCookie");
    +[NSPManager sharedManager](NSPManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPEdgeLatency probeEndpoint](self, "probeEndpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "getTestLatencyRTT:parameters:", v6, v10);

    nplog_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v12 = v7;
      _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "Got Test RTT %lu", buf, 0xCu);
    }

    if (v7)
    {
      -[NPEdgeLatency addRoundTripSample:](self, "addRoundTripSample:", v7);
      if (-[NPEdgeLatency probeTFO](self, "probeTFO"))
      {
        if (v7 != 0xFFFFFFFFLL)
          -[NPEdgeLatency setTFOStatus:](self, "setTFOStatus:", 2);
      }
    }
  }
  return v4;
}

- (void)measureLatencyWithTimeout:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  dispatch_source_t v16;
  NSObject *v17;
  int64_t v18;
  dispatch_time_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[NPEdgeLatency probeConnection](self, "probeConnection");
  if (objc_claimAutoreleasedReturnValue())
    __assert_rtn("-[NPEdgeLatency measureLatencyWithTimeout:completionHandler:]", "NPEdgeLatency.m", 380, "self.probeConnection == nil");
  -[NPEdgeLatency setCurrentTimeout:](self, "setCurrentTimeout:", v6);
  -[NPEdgeLatency setNeedReprobe:](self, "setNeedReprobe:", 0);
  -[NPEdgeLatency probeEndpoint](self, "probeEndpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
    v10 = objc_msgSend(v6, "unsignedLongLongValue");
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "hostname");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPEdgeLatency connectionParametersString](self, "connectionParametersString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v12;
      v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_DEFAULT, "Probing %@ %@", buf, 0x16u);

    }
    if (-[NPEdgeLatency probeTFO](self, "probeTFO"))
    {
      objc_msgSend(v9, "setEnableTFO:", 1);
      objc_msgSend(v9, "setEnableTFONoCookie:", -[NPEdgeLatency probeNoTFOCookie](self, "probeNoTFOCookie"));
      *(_DWORD *)buf = -1;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setInitialDataPayload:", v14);

    }
    else
    {
      -[NPEdgeLatency setTFOStatus:](self, "setTFOStatus:", 3);
    }
    NPGetInternalQueue();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v15);
    -[NPEdgeLatency setProbeTimer:](self, "setProbeTimer:", v16);

    -[NPEdgeLatency probeTimer](self, "probeTimer");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v10)
      v18 = 1000000 * v10;
    else
      v18 = 3000000000;
    v19 = dispatch_time(0, v18);
    dispatch_source_set_timer(v17, v19, 0xFFFFFFFFFFFFFFFFLL, 0x2710uLL);

    -[NPEdgeLatency probeTimer](self, "probeTimer");
    v20 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __61__NPEdgeLatency_measureLatencyWithTimeout_completionHandler___block_invoke;
    handler[3] = &unk_1E4137410;
    handler[4] = self;
    dispatch_source_set_event_handler(v20, handler);

    -[NPEdgeLatency probeTimer](self, "probeTimer");
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v21);

    -[NPEdgeLatency setProbeCount:](self, "setProbeCount:", -[NPEdgeLatency probeCount](self, "probeCount") + 1);
    if (-[NPEdgeLatency fillTestLatency](self, "fillTestLatency"))
    {
      -[NPEdgeLatency probeTimer](self, "probeTimer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[NPEdgeLatency probeTimer](self, "probeTimer");
        v23 = objc_claimAutoreleasedReturnValue();
        dispatch_source_cancel(v23);

        -[NPEdgeLatency setProbeTimer:](self, "setProbeTimer:", 0);
      }
      v7[2](v7);
    }
    else
    {
      -[NPEdgeLatency setProbeCompletionHandler:](self, "setProbeCompletionHandler:", v7);
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCECD0]), "initWithEndpoint:parameters:", v8, v9);
      -[NPEdgeLatency setProbeConnection:](self, "setProbeConnection:", v24);

      -[NPEdgeLatency probeConnection](self, "probeConnection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObserver:forKeyPath:options:context:", self, CFSTR("state"), 4, 0);

      -[NPEdgeLatency setIsObserving:](self, "setIsObserving:", 1);
    }

  }
  else
  {
    -[NPEdgeLatency addRoundTripSample:](self, "addRoundTripSample:", 0xFFFFFFFFLL);
    v7[2](v7);
  }

}

void __61__NPEdgeLatency_measureLatencyWithTimeout_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  nplog_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "probeEndpoint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hostname");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19E8FE000, v2, OS_LOG_TYPE_DEFAULT, "RTT probe timeout for %@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "probeConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addRoundTripSample:", 0xFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 32), "probeConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

}

- (void)pingPong
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  int v8;

  v8 = -1;
  -[NPEdgeLatency probeConnection](self, "probeConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v8, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__NPEdgeLatency_pingPong__block_invoke;
  v6[3] = &unk_1E4137398;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v5, "write:completionHandler:", v4, v6);

}

void __25__NPEdgeLatency_pingPong__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  NPGetInternalQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__NPEdgeLatency_pingPong__block_invoke_2;
  block[3] = &unk_1E4137348;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __25__NPEdgeLatency_pingPong__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    nplog_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "probeEndpoint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hostname");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", objc_msgSend(*(id *)(a1 + 40), "interfaceType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_error_impl(&dword_19E8FE000, v2, OS_LOG_TYPE_ERROR, "%@: Failed to write byte for RTT probe (%@), %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "cancel");
  }
  else
  {
    v3 = *(void **)(a1 + 48);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __25__NPEdgeLatency_pingPong__block_invoke_128;
    v10[3] = &unk_1E4137D58;
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 40);
    v11 = v4;
    v12 = v5;
    objc_msgSend(v4, "readMinimumLength:maximumLength:completionHandler:", 1, 0x7FFFFFFFLL, v10);

  }
}

void __25__NPEdgeLatency_pingPong__block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  NPGetInternalQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __25__NPEdgeLatency_pingPong__block_invoke_2_129;
  v12[3] = &unk_1E4137D30;
  v13 = v5;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v14 = v8;
  v15 = v9;
  v16 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

uint64_t __25__NPEdgeLatency_pingPong__block_invoke_2_129(uint64_t a1)
{
  void *v2;
  unint64_t RTTFromFrame;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (!v2 || !objc_msgSend(v2, "length"))
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "probeEndpoint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hostname");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", objc_msgSend(*(id *)(a1 + 48), "interfaceType"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(a1 + 56);
      v21 = 138412802;
      v22 = v18;
      v23 = 2112;
      v24 = (unint64_t)v19;
      v25 = 2112;
      v26 = v20;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "%@: Failed to read frame for RTT probe (%@), %@", (uint8_t *)&v21, 0x20u);

    }
    v10 = *(void **)(a1 + 48);
    v11 = 0xFFFFFFFFLL;
    goto LABEL_15;
  }
  RTTFromFrame = getRTTFromFrame(*(void **)(a1 + 32));
  if (!+[NPUtilities hasPacketDrop:](NPUtilities, "hasPacketDrop:", *(_QWORD *)(a1 + 40))
    && RTTFromFrame != 0xFFFFFFFF
    || objc_msgSend(*(id *)(a1 + 48), "reprobeCount") > 2)
  {
    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "probeEndpoint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hostname");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", objc_msgSend(*(id *)(a1 + 48), "interfaceType"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412802;
      v22 = v14;
      v23 = 2048;
      v24 = RTTFromFrame;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_DEFAULT, "%@: Got RTT of %lu (%@)", (uint8_t *)&v21, 0x20u);

    }
    v10 = *(void **)(a1 + 48);
    v11 = RTTFromFrame;
LABEL_15:
    objc_msgSend(v10, "addRoundTripSample:", v11);
    return objc_msgSend(*(id *)(a1 + 40), "cancel");
  }
  nplog_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "probeEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hostname");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 48), "roundTripTime");
    +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", objc_msgSend(*(id *)(a1 + 48), "interfaceType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412802;
    v22 = v6;
    v23 = 2048;
    v24 = v7;
    v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_DEFAULT, "%@: Discard RTT of %lu (%@), reprobe due to lost packets", (uint8_t *)&v21, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 48), "setNeedReprobe:", 1);
  objc_msgSend(*(id *)(a1 + 48), "setReprobeCount:", objc_msgSend(*(id *)(a1 + 48), "reprobeCount") + 1);
  return objc_msgSend(*(id *)(a1 + 40), "cancel");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  objc_super v14;
  _QWORD block[4];
  id v16;
  NPEdgeLatency *v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("state")))
  {
    NPGetInternalQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__NPEdgeLatency_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E4137D80;
    v16 = v11;
    v17 = self;
    v18 = a6;
    dispatch_async(v13, block);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NPEdgeLatency;
    -[NPEdgeLatency observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

void __64__NPEdgeLatency_observeValueForKeyPath_ofObject_change_context___block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void (**v12)(_QWORD);
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  objc_msgSend(a1[5], "probeConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    switch(objc_msgSend(v2, "state"))
    {
      case 0:
      case 2:
      case 4:
        v4 = a1[6];
        objc_msgSend(v4, "addRoundTripSample:", 0xFFFFFFFFLL);
        objc_msgSend(v2, "cancel");

        break;
      case 3:
        objc_msgSend(v2, "connectedPath");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "interface");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "setInterfaceType:", objc_msgSend(v6, "type"));

        nplog_obj();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(a1[5], "probeEndpoint");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "hostname");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", objc_msgSend(a1[5], "interfaceType"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v21 = v16;
          v22 = 2112;
          v23 = v17;
          _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "%@: Probe connection connected over %@", buf, 0x16u);

        }
        objc_msgSend(v2, "parameters");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "enableTFO");

        if (v9)
        {
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __64__NPEdgeLatency_observeValueForKeyPath_ofObject_change_context___block_invoke_132;
          v18[3] = &unk_1E4137D58;
          v18[4] = a1[5];
          v19 = v2;
          objc_msgSend(v19, "readMinimumLength:maximumLength:completionHandler:", 1, 0x7FFFFFFFLL, v18);

        }
        else
        {
          objc_msgSend(a1[5], "pingPong");
        }
        break;
      case 5:
        objc_msgSend(a1[5], "probeTimer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(a1[5], "probeTimer");
          v11 = objc_claimAutoreleasedReturnValue();
          dispatch_source_cancel(v11);

          objc_msgSend(a1[5], "setProbeTimer:", 0);
        }
        if (objc_msgSend(a1[5], "isObserving"))
        {
          objc_msgSend(v2, "removeObserver:forKeyPath:context:", a1[5], CFSTR("state"), a1[6]);
          objc_msgSend(a1[5], "setIsObserving:", 0);
        }
        objc_msgSend(a1[5], "probeCompletionHandler");
        v12 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "setProbeConnection:", 0);
        objc_msgSend(a1[5], "setProbeCompletionHandler:", 0);
        if (objc_msgSend(a1[5], "needReprobe"))
        {
          v13 = a1[5];
          objc_msgSend(v13, "currentTimeout");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "measureLatencyWithTimeout:completionHandler:", v14, v12);

        }
        else
        {
          if (!v12)
            break;
          v12[2](v12);
        }

        break;
      default:
        break;
    }
  }

}

void __64__NPEdgeLatency_observeValueForKeyPath_ofObject_change_context___block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  NPGetInternalQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__NPEdgeLatency_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  v11[3] = &unk_1E4137D30;
  v12 = v6;
  v13 = v5;
  v8 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, v11);

}

uint64_t __64__NPEdgeLatency_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || (v4 = *(void **)(a1 + 40)) != 0 && !objc_msgSend(v4, "length"))
  {
    nplog_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "probeEndpoint");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hostname");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", objc_msgSend(*(id *)(a1 + 48), "interfaceType"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_error_impl(&dword_19E8FE000, v2, OS_LOG_TYPE_ERROR, "%@: Failed to read byte for RTT probe (%@), %@", (uint8_t *)&v9, 0x20u);

    }
    return objc_msgSend(*(id *)(a1 + 56), "cancel");
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 48), "TFOStatus")
      && objc_msgSend(*(id *)(a1 + 56), "state") != 5
      && objc_msgSend(*(id *)(a1 + 56), "TFOSucceeded"))
    {
      objc_msgSend(*(id *)(a1 + 48), "setTFOStatus:", 2);
    }
    return objc_msgSend(*(id *)(a1 + 48), "pingPong");
  }
}

- (BOOL)isMatched:(id)a3 parameters:(networkParameters *)a4
{
  id v6;
  void *v7;
  int v8;

  v6 = a3;
  -[NPEdgeLatency probeEndpoint](self, "probeEndpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  return v8
      && (!a4
       || a4->var0 == -[NPEdgeLatency probeTFO](self, "probeTFO")
       && (!-[NPEdgeLatency probeTFO](self, "probeTFO")
        || a4->var1 == -[NPEdgeLatency probeNoTFOCookie](self, "probeNoTFOCookie")));
}

- (BOOL)isMatched:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  BOOL v7;
  _BYTE v9[2];

  v4 = a3;
  v9[0] = objc_msgSend(v4, "probeTFO");
  v9[1] = objc_msgSend(v4, "probeNoTFOCookie");
  v5 = -[NPEdgeLatency edgeIndex](self, "edgeIndex");
  if (v5 == objc_msgSend(v4, "edgeIndex"))
  {
    objc_msgSend(v4, "probeEndpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NPEdgeLatency isMatched:parameters:](self, "isMatched:parameters:", v6, v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isComplete:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  char v9;
  void *v10;

  v3 = a3;
  -[NPEdgeLatency roundTripAverage](self, "roundTripAverage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "samples");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[NPEdgeLatency roundTripAverage](self, "roundTripAverage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 >= objc_msgSend(v8, "size");
  if (v9 && v3)
  {
    -[NPEdgeLatency roundTripAverage](self, "roundTripAverage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isAnyValid");

  }
  return v9;
}

- (unint64_t)edgeIndex
{
  return self->_edgeIndex;
}

- (void)setEdgeIndex:(unint64_t)a3
{
  self->_edgeIndex = a3;
}

- (NWEndpoint)probeEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProbeEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)roundTripTime
{
  return self->_roundTripTime;
}

- (void)setRoundTripTime:(unint64_t)a3
{
  self->_roundTripTime = a3;
}

- (NPAverage)roundTripAverage
{
  return (NPAverage *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRoundTripAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NPAverage)roundTripAverageObserved
{
  return (NPAverage *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRoundTripAverageObserved:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)addressFamily
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAddressFamily:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (int64_t)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(int64_t)a3
{
  self->_interfaceType = a3;
}

- (BOOL)probeTFO
{
  return self->_probeTFO;
}

- (void)setProbeTFO:(BOOL)a3
{
  self->_probeTFO = a3;
}

- (BOOL)probeNoTFOCookie
{
  return self->_probeNoTFOCookie;
}

- (void)setProbeNoTFOCookie:(BOOL)a3
{
  self->_probeNoTFOCookie = a3;
}

- (int64_t)TFOStatus
{
  return self->_TFOStatus;
}

- (void)setTFOStatus:(int64_t)a3
{
  self->_TFOStatus = a3;
}

- (int64_t)probeCount
{
  return self->_probeCount;
}

- (void)setProbeCount:(int64_t)a3
{
  self->_probeCount = a3;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)passedReprobeThreshold
{
  return self->_passedReprobeThreshold;
}

- (void)setPassedReprobeThreshold:(BOOL)a3
{
  self->_passedReprobeThreshold = a3;
}

- (int64_t)reprobeCount
{
  return self->_reprobeCount;
}

- (void)setReprobeCount:(int64_t)a3
{
  self->_reprobeCount = a3;
}

- (OS_dispatch_source)probeTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 104, 1);
}

- (void)setProbeTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NWTCPConnection)probeConnection
{
  return (NWTCPConnection *)objc_getProperty(self, a2, 112, 1);
}

- (void)setProbeConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (id)probeCompletionHandler
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setProbeCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSNumber)currentTimeout
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCurrentTimeout:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)needReprobe
{
  return self->_needReprobe;
}

- (void)setNeedReprobe:(BOOL)a3
{
  self->_needReprobe = a3;
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimeout, 0);
  objc_storeStrong(&self->_probeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_probeConnection, 0);
  objc_storeStrong((id *)&self->_probeTimer, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_addressFamily, 0);
  objc_storeStrong((id *)&self->_roundTripAverageObserved, 0);
  objc_storeStrong((id *)&self->_roundTripAverage, 0);
  objc_storeStrong((id *)&self->_probeEndpoint, 0);
}

@end
