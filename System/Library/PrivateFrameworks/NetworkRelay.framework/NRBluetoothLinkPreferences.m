@implementation NRBluetoothLinkPreferences

- (NRBluetoothLinkPreferences)init
{
  NRBluetoothLinkPreferences *v2;
  NRBluetoothLinkPreferences *v3;
  NRBluetoothLinkPreferences *v4;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NRBluetoothLinkPreferences;
  v2 = -[NRLinkPreferences initWithLinkType:](&v15, sel_initWithLinkType_, 1);
  v3 = v2;
  if (!v2)
  {
    v6 = nrCopyLogObj_433();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v7 = v6;
      v8 = os_log_type_enabled(v6, OS_LOG_TYPE_FAULT);

      if (!v8)
        goto LABEL_3;
    }
    v9 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v9, 17, (uint64_t)"Failed to initialize link preferences object", v10, v11, v12, v13, v14, (uint64_t)v15.receiver);

    goto LABEL_3;
  }
  v4 = v2;
LABEL_3:

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NRBluetoothLinkPreferences;
  v5 = -[NRLinkPreferences copyWithZone:](&v13, sel_copyWithZone_);
  -[NRBluetoothLinkPreferences inputBytesPerSecond](self, "inputBytesPerSecond");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setInputBytesPerSecond:", v7);

  -[NRBluetoothLinkPreferences outputBytesPerSecond](self, "outputBytesPerSecond");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setOutputBytesPerSecond:", v9);

  -[NRBluetoothLinkPreferences packetsPerSecond](self, "packetsPerSecond");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setPacketsPerSecond:", v11);

  return v5;
}

- (BOOL)isNotEmpty
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[NRBluetoothLinkPreferences inputBytesPerSecond](self, "inputBytesPerSecond");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "unsignedLongLongValue"))
  {
    v4 = 1;
  }
  else
  {
    -[NRBluetoothLinkPreferences outputBytesPerSecond](self, "outputBytesPerSecond");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "unsignedLongLongValue"))
    {
      v4 = 1;
    }
    else
    {
      -[NRBluetoothLinkPreferences packetsPerSecond](self, "packetsPerSecond");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "unsignedLongLongValue") != 0;

    }
  }

  return v4;
}

- (id)copyEncodedXPCDict
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NRBluetoothLinkPreferences;
  v3 = -[NRLinkPreferences copyEncodedXPCDict](&v8, sel_copyEncodedXPCDict);
  -[NRBluetoothLinkPreferences inputBytesPerSecond](self, "inputBytesPerSecond");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NRLPAddUint64ToXPCDict(v3, "InputBPS", v4);

  -[NRBluetoothLinkPreferences outputBytesPerSecond](self, "outputBytesPerSecond");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NRLPAddUint64ToXPCDict(v3, "OutputBPS", v5);

  -[NRBluetoothLinkPreferences packetsPerSecond](self, "packetsPerSecond");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NRLPAddUint64ToXPCDict(v3, "PacketsPerSecond", v6);

  return v3;
}

- (id)copyLongDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v10.receiver = self;
  v10.super_class = (Class)NRBluetoothLinkPreferences;
  -[NRLinkPreferences description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[NRBluetoothLinkPreferences inputBytesPerSecond](self, "inputBytesPerSecond");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nInput bytes/sec: %llu"), objc_msgSend(v6, "unsignedLongLongValue"));

  -[NRBluetoothLinkPreferences outputBytesPerSecond](self, "outputBytesPerSecond");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nOutput bytes/sec: %llu"), objc_msgSend(v7, "unsignedLongLongValue"));

  -[NRBluetoothLinkPreferences packetsPerSecond](self, "packetsPerSecond");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nPackets/sec: %llu"), objc_msgSend(v8, "unsignedLongLongValue"));

  return v5;
}

- (id)copyShortDescription
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NRBluetoothLinkPreferences inputBytesPerSecond](self, "inputBytesPerSecond");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");
  -[NRBluetoothLinkPreferences outputBytesPerSecond](self, "outputBytesPerSecond");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue");
  -[NRBluetoothLinkPreferences packetsPerSecond](self, "packetsPerSecond");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("LinkPrefBT[%lluibps,%lluobps,%llupps]"), v5, v7, objc_msgSend(v8, "unsignedLongLongValue"));

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  NRBluetoothLinkPreferences *v4;
  NRBluetoothLinkPreferences *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  BOOL v12;

  v4 = (NRBluetoothLinkPreferences *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = objc_msgSend(*(id *)&self->_reportedToABC, "unsignedLongLongValue");
      -[NRBluetoothLinkPreferences inputBytesPerSecond](v5, "inputBytesPerSecond");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == objc_msgSend(v7, "unsignedLongLongValue"))
      {
        v8 = -[NSNumber unsignedLongLongValue](self->_inputBytesPerSecond, "unsignedLongLongValue");
        -[NRBluetoothLinkPreferences outputBytesPerSecond](v5, "outputBytesPerSecond");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == objc_msgSend(v9, "unsignedLongLongValue"))
        {
          v10 = -[NSNumber unsignedLongLongValue](self->_outputBytesPerSecond, "unsignedLongLongValue");
          -[NRBluetoothLinkPreferences packetsPerSecond](v5, "packetsPerSecond");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v10 == objc_msgSend(v11, "unsignedLongLongValue");

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(*(id *)&self->_reportedToABC, "hash");
  v4 = -[NSNumber hash](self->_inputBytesPerSecond, "hash") ^ v3;
  return v4 ^ -[NSNumber hash](self->_outputBytesPerSecond, "hash");
}

- (void)setInputBytesPerSecond:(id)a3
{
  uint64_t v4;
  void *v5;

  checkAndCapValue(a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(void **)&self->_reportedToABC;
  *(_QWORD *)&self->_reportedToABC = v4;

}

- (void)setOutputBytesPerSecond:(id)a3
{
  NSNumber *v4;
  NSNumber *inputBytesPerSecond;

  checkAndCapValue(a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  inputBytesPerSecond = self->_inputBytesPerSecond;
  self->_inputBytesPerSecond = v4;

}

- (void)setPacketsPerSecond:(id)a3
{
  NSNumber *v4;
  NSNumber *outputBytesPerSecond;

  checkAndCapValue(a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  outputBytesPerSecond = self->_outputBytesPerSecond;
  self->_outputBytesPerSecond = v4;

}

- (void)combinePreferences:(id)a3
{
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  NSNumber *v12;
  void *inputBytesPerSecond;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  NSNumber *v17;
  void *outputBytesPerSecond;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;

  v43 = a3;
  if (!objc_msgSend(v43, "isNotEmpty"))
    goto LABEL_11;
  v4 = objc_msgSend(*(id *)&self->_reportedToABC, "unsignedLongLongValue");
  objc_msgSend(v43, "inputBytesPerSecond");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue") + v4;

  if (!HIDWORD(v6))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(id *)&self->_reportedToABC;
    *(_QWORD *)&self->_reportedToABC = v7;
LABEL_4:

    goto LABEL_5;
  }
  v19 = nrCopyLogObj_433();
  if (sNRCopyLogToStdErr)
  {

LABEL_19:
    v8 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v8, 16, (uint64_t)"%s%.30s:%-4d %llu > UINT32_MAX, capping", v25, v26, v27, v28, v29, (uint64_t)");
    goto LABEL_4;
  }
  v23 = v19;
  v24 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

  if (v24)
    goto LABEL_19;
LABEL_5:
  v9 = -[NSNumber unsignedLongLongValue](self->_inputBytesPerSecond, "unsignedLongLongValue");
  objc_msgSend(v43, "outputBytesPerSecond");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedLongLongValue") + v9;

  if (HIDWORD(v11))
  {
    v20 = nrCopyLogObj_433();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v30 = v20;
      v31 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

      if (!v31)
        goto LABEL_8;
    }
    inputBytesPerSecond = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)inputBytesPerSecond, 16, (uint64_t)"%s%.30s:%-4d %llu > UINT32_MAX, capping", v32, v33, v34, v35, v36, (uint64_t)");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    inputBytesPerSecond = self->_inputBytesPerSecond;
    self->_inputBytesPerSecond = v12;
  }

LABEL_8:
  v14 = -[NSNumber unsignedLongLongValue](self->_outputBytesPerSecond, "unsignedLongLongValue");
  objc_msgSend(v43, "packetsPerSecond");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedLongLongValue") + v14;

  if (HIDWORD(v16))
  {
    v21 = nrCopyLogObj_433();
    v22 = v21;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v37 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (!v37)
        goto LABEL_11;
    }
    outputBytesPerSecond = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)outputBytesPerSecond, 16, (uint64_t)"%s%.30s:%-4d %llu > UINT32_MAX, capping", v38, v39, v40, v41, v42, (uint64_t)");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16);
    v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    outputBytesPerSecond = self->_outputBytesPerSecond;
    self->_outputBytesPerSecond = v17;
  }

LABEL_11:
}

- (NSNumber)inputBytesPerSecond
{
  return *(NSNumber **)&self->_reportedToABC;
}

- (NSNumber)outputBytesPerSecond
{
  return self->_inputBytesPerSecond;
}

- (NSNumber)packetsPerSecond
{
  return self->_outputBytesPerSecond;
}

- (unint64_t)startTime
{
  return (unint64_t)self->_packetsPerSecond;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_packetsPerSecond = (NSNumber *)a3;
}

- (BOOL)reportedToABC
{
  return *(&self->super._linkType + 1);
}

- (void)setReportedToABC:(BOOL)a3
{
  *(&self->super._linkType + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputBytesPerSecond, 0);
  objc_storeStrong((id *)&self->_inputBytesPerSecond, 0);
  objc_storeStrong((id *)&self->_reportedToABC, 0);
}

@end
