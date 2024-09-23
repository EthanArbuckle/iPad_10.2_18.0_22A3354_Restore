@implementation NSPConnectionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPConnectionInfo)initWithCoder:(id)a3
{
  id v4;
  NSPConnectionInfo *v5;
  double v6;
  uint64_t v7;
  NSString *edgeAddress;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *multipathSubflowSwitchCounts;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSDictionary *TCPInfo;
  uint64_t v21;
  NSDate *firstTxByteTimeStamp;
  double v23;
  double v24;
  double v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NSPConnectionInfo;
  v5 = -[NSPConnectionInfo init](&v27, sel_init);
  if (v5)
  {
    v5->_pathType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pathType"));
    v5->_fallbackReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fallbackReason"));
    v5->_fallbackReasonCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fallbackCategory"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fallbackDelay"));
    v5->_fallbackDelay = v6;
    v5->_edgeType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("edgeType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("edgeAddress"));
    v7 = objc_claimAutoreleasedReturnValue();
    edgeAddress = v5->_edgeAddress;
    v5->_edgeAddress = (NSString *)v7;

    v5->_isMultipath = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMultipath"));
    v5->_multipathSubflowCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("multipathSubflowCountKey"));
    v5->_multipathConnectedSubflowCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("multipathConnectedSubflowCountKey"));
    v5->_multipathPrimarySubflowInterfaceIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("multipathPrimarySubflowInterfaceIndex"));
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("multipathSubflowSwitchCounts"));
    v13 = objc_claimAutoreleasedReturnValue();
    multipathSubflowSwitchCounts = v5->_multipathSubflowSwitchCounts;
    v5->_multipathSubflowSwitchCounts = (NSDictionary *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("TCPInfo"));
    v19 = objc_claimAutoreleasedReturnValue();
    TCPInfo = v5->_TCPInfo;
    v5->_TCPInfo = (NSDictionary *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstTxByteTimeStamp"));
    v21 = objc_claimAutoreleasedReturnValue();
    firstTxByteTimeStamp = v5->_firstTxByteTimeStamp;
    v5->_firstTxByteTimeStamp = (NSDate *)v21;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("firstTxByteDelay"));
    v5->_firstTxByteDelay = v23;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("connectionDelay"));
    v5->_connectionDelay = v24;
    v5->_TFOSucceeded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TFOSucceeded"));
    v5->_IPType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("IPType"));
    v5->_interfaceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interfaceType"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeIntervalSinceLastUsage"));
    v5->_timeIntervalSinceLastUsage = v25;
    v5->_timeToFirstByte = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("timeToFirstByte"));
    v5->_tunnelConnectionError = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("tunnelConnectionError"));
    v5->_isTFOProbeSucceeded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTFOProbeSucceeded"));
    v5->_initialBytesLeftOver = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("initialBytesLeftOver"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo pathType](self, "pathType"), CFSTR("pathType"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo fallbackReason](self, "fallbackReason"), CFSTR("fallbackReason"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo fallbackReasonCategory](self, "fallbackReasonCategory"), CFSTR("fallbackCategory"));
  -[NSPConnectionInfo fallbackDelay](self, "fallbackDelay");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("fallbackDelay"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo edgeType](self, "edgeType"), CFSTR("edgeType"));
  -[NSPConnectionInfo edgeAddress](self, "edgeAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("edgeAddress"));

  objc_msgSend(v8, "encodeBool:forKey:", -[NSPConnectionInfo isMultipath](self, "isMultipath"), CFSTR("isMultipath"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo multipathSubflowCount](self, "multipathSubflowCount"), CFSTR("multipathSubflowCountKey"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo multipathConnectedSubflowCount](self, "multipathConnectedSubflowCount"), CFSTR("multipathConnectedSubflowCountKey"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo multipathPrimarySubflowInterfaceIndex](self, "multipathPrimarySubflowInterfaceIndex"), CFSTR("multipathPrimarySubflowInterfaceIndex"));
  -[NSPConnectionInfo multipathSubflowSwitchCounts](self, "multipathSubflowSwitchCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("multipathSubflowSwitchCounts"));

  -[NSPConnectionInfo TCPInfo](self, "TCPInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("TCPInfo"));

  -[NSPConnectionInfo firstTxByteTimeStamp](self, "firstTxByteTimeStamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("firstTxByteTimeStamp"));

  -[NSPConnectionInfo firstTxByteDelay](self, "firstTxByteDelay");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("firstTxByteDelay"));
  -[NSPConnectionInfo connectionDelay](self, "connectionDelay");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("connectionDelay"));
  objc_msgSend(v8, "encodeBool:forKey:", -[NSPConnectionInfo TFOSucceeded](self, "TFOSucceeded"), CFSTR("TFOSucceeded"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo IPType](self, "IPType"), CFSTR("IPType"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo interfaceType](self, "interfaceType"), CFSTR("interfaceType"));
  -[NSPConnectionInfo timeIntervalSinceLastUsage](self, "timeIntervalSinceLastUsage");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("timeIntervalSinceLastUsage"));
  -[NSPConnectionInfo timeToFirstByte](self, "timeToFirstByte");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("timeToFirstByte"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo tunnelConnectionError](self, "tunnelConnectionError"), CFSTR("tunnelConnectionError"));
  objc_msgSend(v8, "encodeBool:forKey:", -[NSPConnectionInfo isTFOProbeSucceeded](self, "isTFOProbeSucceeded"), CFSTR("isTFOProbeSucceeded"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo initialBytesLeftOver](self, "initialBytesLeftOver"), CFSTR("initialBytesLeftOver"));

}

- (id)copyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  NSPConnectionInfo *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", -[NSPConnectionInfo pathType](self, "pathType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("pathType"));

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", -[NSPConnectionInfo fallbackReason](self, "fallbackReason"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("fallbackReason"));

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", -[NSPConnectionInfo fallbackReasonCategory](self, "fallbackReasonCategory"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("fallbackCategory"));

  v7 = objc_alloc(MEMORY[0x1E0CB37E8]);
  -[NSPConnectionInfo fallbackDelay](self, "fallbackDelay");
  v8 = (void *)objc_msgSend(v7, "initWithDouble:");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("fallbackDelay"));

  -[NSPConnectionInfo edgeAddress](self, "edgeAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", -[NSPConnectionInfo edgeType](self, "edgeType"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("edgeType"));

    -[NSPConnectionInfo edgeAddress](self, "edgeAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("edgeAddress"));

  }
  if (-[NSPConnectionInfo isMultipath](self, "isMultipath"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[NSPConnectionInfo isMultipath](self, "isMultipath"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isMultipath"));

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[NSPConnectionInfo multipathSubflowCount](self, "multipathSubflowCount"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("multipathSubflowCountKey"));

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[NSPConnectionInfo multipathConnectedSubflowCount](self, "multipathConnectedSubflowCount"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("multipathConnectedSubflowCountKey"));

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[NSPConnectionInfo multipathPrimarySubflowInterfaceIndex](self, "multipathPrimarySubflowInterfaceIndex"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("multipathPrimarySubflowInterfaceIndex"));

    -[NSPConnectionInfo multipathSubflowSwitchCounts](self, "multipathSubflowSwitchCounts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
    {
      -[NSPConnectionInfo multipathSubflowSwitchCounts](self, "multipathSubflowSwitchCounts");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("multipathSubflowSwitchCounts"));

    }
  }
  -[NSPConnectionInfo TCPInfo](self, "TCPInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    v57 = self;
    v58 = v3;
    -[NSPConnectionInfo TCPInfo](self, "TCPInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v60 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_msgSend(v23, "objectForKeyedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v29, "length") == 408)
          {
            v30 = objc_msgSend(objc_retainAutorelease(v29), "bytes");
            v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", *(_QWORD *)(v30 + 100));
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, CFSTR("rxPackets"));

            v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", *(_QWORD *)(v30 + 108));
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, CFSTR("rxBytes"));

            v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", *(_QWORD *)(v30 + 68));
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v34, CFSTR("txPackets"));

            v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", *(_QWORD *)(v30 + 76));
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v35, CFSTR("txBytes"));

            v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", *(_QWORD *)(v30 + 84));
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v36, CFSTR("retransmitBytes"));

            v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", *(_QWORD *)(v30 + 284));
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v37, CFSTR("retransmitPackets"));

            v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v31);
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v38, v28);

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      }
      while (v25);
    }

    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v23);
    v3 = v58;
    objc_msgSend(v58, "setObject:forKeyedSubscript:", v39, CFSTR("TCPInfo"));

    self = v57;
  }
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", -[NSPConnectionInfo interfaceType](self, "interfaceType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("interfaceType"));

  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[NSPConnectionInfo isTFOProbeSucceeded](self, "isTFOProbeSucceeded"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("isTFOProbeSucceeded"));

  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", -[NSPConnectionInfo tunnelConnectionError](self, "tunnelConnectionError"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("tunnelConnectionError"));

  if (-[NSPConnectionInfo pathType](self, "pathType") == 1)
  {
    v43 = objc_alloc(MEMORY[0x1E0CB37E8]);
    -[NSPConnectionInfo firstTxByteDelay](self, "firstTxByteDelay");
    v44 = (void *)objc_msgSend(v43, "initWithDouble:");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("firstTxByteDelay"));

    v45 = objc_alloc(MEMORY[0x1E0CB37E8]);
    -[NSPConnectionInfo connectionDelay](self, "connectionDelay");
    v46 = (void *)objc_msgSend(v45, "initWithDouble:");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("connectionDelay"));

    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[NSPConnectionInfo TFOSucceeded](self, "TFOSucceeded"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("TFOSucceeded"));

    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", -[NSPConnectionInfo IPType](self, "IPType"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("IPType"));

    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[NSPConnectionInfo minimumRTT](self, "minimumRTT"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("minimumRTT"));

    v50 = objc_alloc(MEMORY[0x1E0CB37E8]);
    -[NSPConnectionInfo timeIntervalSinceLastUsage](self, "timeIntervalSinceLastUsage");
    v51 = (void *)objc_msgSend(v50, "initWithDouble:");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("timeIntervalSinceLastUsage"));

    v52 = objc_alloc(MEMORY[0x1E0CB37E8]);
    -[NSPConnectionInfo timeToFirstByte](self, "timeToFirstByte");
    v53 = (void *)objc_msgSend(v52, "initWithDouble:");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("timeToFirstByte"));

    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[NSPConnectionInfo initialBytesLeftOver](self, "initialBytesLeftOver"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("initialBytesLeftOver"));

  }
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v3);

  return v55;
}

+ (id)getFallbackReasonDescription:(int64_t)a3
{
  if ((unint64_t)a3 > 0x2D)
    return 0;
  else
    return off_1E4137E68[a3];
}

+ (int)fallbackReasonToErrno:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x2C)
    return 0;
  else
    return dword_19E995728[a3 - 1];
}

- (void)setFallbackReason:(int64_t)a3
{
  self->_fallbackReason = a3;
  if ((unint64_t)(a3 - 1) <= 0x2C)
    self->_fallbackReasonCategory = qword_19E9957E0[a3 - 1];
}

- (int64_t)fallbackReason
{
  return self->_fallbackReason;
}

+ (BOOL)shouldMoveToNextEdgeForFallbackReason:(int64_t)a3
{
  return ((unint64_t)a3 < 0x24) & (0x808C00026uLL >> a3);
}

+ (BOOL)shouldResolveForFallbackReason:(int64_t)a3
{
  BOOL result;

  result = +[NSPConnectionInfo shouldMoveToNextEdgeForFallbackReason:](NSPConnectionInfo, "shouldMoveToNextEdgeForFallbackReason:");
  if (a3 == 4)
    return 1;
  return result;
}

- (id)timingIntervalAtIndex:(unint64_t)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  -[NSPConnectionInfo timingIntervals](self, "timingIntervals");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    v11 = 0;
  }
  else
  {
    -[NSPConnectionInfo timingIntervals](self, "timingIntervals");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (int64_t)pathType
{
  return self->_pathType;
}

- (void)setPathType:(int64_t)a3
{
  self->_pathType = a3;
}

- (int64_t)fallbackReasonCategory
{
  return self->_fallbackReasonCategory;
}

- (double)fallbackDelay
{
  return self->_fallbackDelay;
}

- (void)setFallbackDelay:(double)a3
{
  self->_fallbackDelay = a3;
}

- (int64_t)edgeType
{
  return self->_edgeType;
}

- (void)setEdgeType:(int64_t)a3
{
  self->_edgeType = a3;
}

- (NSString)edgeAddress
{
  return self->_edgeAddress;
}

- (void)setEdgeAddress:(id)a3
{
  objc_storeStrong((id *)&self->_edgeAddress, a3);
}

- (BOOL)isMultipath
{
  return self->_isMultipath;
}

- (void)setIsMultipath:(BOOL)a3
{
  self->_isMultipath = a3;
}

- (unint64_t)multipathSubflowCount
{
  return self->_multipathSubflowCount;
}

- (void)setMultipathSubflowCount:(unint64_t)a3
{
  self->_multipathSubflowCount = a3;
}

- (unint64_t)multipathConnectedSubflowCount
{
  return self->_multipathConnectedSubflowCount;
}

- (void)setMultipathConnectedSubflowCount:(unint64_t)a3
{
  self->_multipathConnectedSubflowCount = a3;
}

- (unint64_t)multipathPrimarySubflowInterfaceIndex
{
  return self->_multipathPrimarySubflowInterfaceIndex;
}

- (void)setMultipathPrimarySubflowInterfaceIndex:(unint64_t)a3
{
  self->_multipathPrimarySubflowInterfaceIndex = a3;
}

- (NSDictionary)multipathSubflowSwitchCounts
{
  return self->_multipathSubflowSwitchCounts;
}

- (void)setMultipathSubflowSwitchCounts:(id)a3
{
  objc_storeStrong((id *)&self->_multipathSubflowSwitchCounts, a3);
}

- (NSDictionary)TCPInfo
{
  return self->_TCPInfo;
}

- (void)setTCPInfo:(id)a3
{
  objc_storeStrong((id *)&self->_TCPInfo, a3);
}

- (NSDate)firstTxByteTimeStamp
{
  return self->_firstTxByteTimeStamp;
}

- (void)setFirstTxByteTimeStamp:(id)a3
{
  objc_storeStrong((id *)&self->_firstTxByteTimeStamp, a3);
}

- (double)firstTxByteDelay
{
  return self->_firstTxByteDelay;
}

- (void)setFirstTxByteDelay:(double)a3
{
  self->_firstTxByteDelay = a3;
}

- (double)connectionDelay
{
  return self->_connectionDelay;
}

- (void)setConnectionDelay:(double)a3
{
  self->_connectionDelay = a3;
}

- (BOOL)TFOSucceeded
{
  return self->_TFOSucceeded;
}

- (void)setTFOSucceeded:(BOOL)a3
{
  self->_TFOSucceeded = a3;
}

- (int64_t)IPType
{
  return self->_IPType;
}

- (void)setIPType:(int64_t)a3
{
  self->_IPType = a3;
}

- (int64_t)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(int64_t)a3
{
  self->_interfaceType = a3;
}

- (unint64_t)minimumRTT
{
  return self->_minimumRTT;
}

- (void)setMinimumRTT:(unint64_t)a3
{
  self->_minimumRTT = a3;
}

- (double)timeIntervalSinceLastUsage
{
  return self->_timeIntervalSinceLastUsage;
}

- (void)setTimeIntervalSinceLastUsage:(double)a3
{
  self->_timeIntervalSinceLastUsage = a3;
}

- (double)timeToFirstByte
{
  return self->_timeToFirstByte;
}

- (void)setTimeToFirstByte:(double)a3
{
  self->_timeToFirstByte = a3;
}

- (int64_t)tunnelConnectionError
{
  return self->_tunnelConnectionError;
}

- (void)setTunnelConnectionError:(int64_t)a3
{
  self->_tunnelConnectionError = a3;
}

- (BOOL)isTFOProbeSucceeded
{
  return self->_isTFOProbeSucceeded;
}

- (void)setIsTFOProbeSucceeded:(BOOL)a3
{
  self->_isTFOProbeSucceeded = a3;
}

- (unint64_t)initialBytesLeftOver
{
  return self->_initialBytesLeftOver;
}

- (void)setInitialBytesLeftOver:(unint64_t)a3
{
  self->_initialBytesLeftOver = a3;
}

- (NSDictionary)exceptions
{
  return self->_exceptions;
}

- (void)setExceptions:(id)a3
{
  objc_storeStrong((id *)&self->_exceptions, a3);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceName, a3);
}

- (NSArray)timingIntervals
{
  return self->_timingIntervals;
}

- (void)setTimingIntervals:(id)a3
{
  objc_storeStrong((id *)&self->_timingIntervals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingIntervals, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_exceptions, 0);
  objc_storeStrong((id *)&self->_firstTxByteTimeStamp, 0);
  objc_storeStrong((id *)&self->_TCPInfo, 0);
  objc_storeStrong((id *)&self->_multipathSubflowSwitchCounts, 0);
  objc_storeStrong((id *)&self->_edgeAddress, 0);
}

@end
