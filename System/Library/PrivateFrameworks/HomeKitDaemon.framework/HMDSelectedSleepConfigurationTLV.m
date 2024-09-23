@implementation HMDSelectedSleepConfigurationTLV

- (HMDSelectedSleepConfigurationTLV)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDSelectedSleepConfigurationTLV;
  return -[HMDSelectedSleepConfigurationTLV init](&v3, sel_init);
}

- (HMDSelectedSleepConfigurationTLV)initWithOperationType:(id)a3 operationStatus:(id)a4 backoffTime:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDSelectedSleepConfigurationTLV *v12;
  HMDSelectedSleepConfigurationTLV *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDSelectedSleepConfigurationTLV;
  v12 = -[HMDSelectedSleepConfigurationTLV init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_operationType, a3);
    objc_storeStrong((id *)&v13->_operationStatus, a4);
    objc_storeStrong((id *)&v13->_backoffTime, a5);
  }

  return v13;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  BOOL v18;
  uint64_t v19;
  id *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 >= 1)
  {
    v21 = a4;
    v22 = v6;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = v7 + v8;
    while (1)
    {
      v29 = 0;
      v27 = 0;
      v28 = 0;
      v26 = 0;
      if (TLV8GetNext())
      {
        if (v21)
        {
          HMErrorFromOSStatus();
          v18 = 0;
          *v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
        v6 = v22;
        goto LABEL_25;
      }
      if (!v28)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 3, 0);
        v19 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v19;
        if (v19)
          goto LABEL_14;
        goto LABEL_20;
      }
      if (v29 == 3)
        break;
      if (v29 == 2)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v9;
        v15 = &v24;
        +[HMDSleepConfigurationOperationStatusWrapper parsedFromData:error:](HMDSleepConfigurationOperationStatusWrapper, "parsedFromData:error:", v14, &v24);
        v16 = v11;
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      if (v29 == 1)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v9;
        v15 = &v25;
        +[HMDSleepConfigurationOperationTypeWrapper parsedFromData:error:](HMDSleepConfigurationOperationTypeWrapper, "parsedFromData:error:", v14, &v25);
        v16 = v12;
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v17 = *v15;

        v9 = v17;
      }
      if (v26 >= v13)
      {
        if (v9)
        {
LABEL_14:
          v6 = v22;
          if (v21)
          {
            v9 = objc_retainAutorelease(v9);
            v18 = 0;
            *v21 = v9;
          }
          else
          {
            v18 = 0;
          }
          goto LABEL_25;
        }
LABEL_20:
        v6 = v22;
        goto LABEL_21;
      }
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v9;
    v15 = &v23;
    objc_msgSend(MEMORY[0x24BE1BC28], "parsedFromData:error:", v14, &v23);
    v16 = v10;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v10 = 0;
  v11 = 0;
  v12 = 0;
LABEL_21:
  -[HMDSelectedSleepConfigurationTLV setOperationType:](self, "setOperationType:", v12);
  -[HMDSelectedSleepConfigurationTLV setOperationStatus:](self, "setOperationStatus:", v11);
  -[HMDSelectedSleepConfigurationTLV setBackoffTime:](self, "setBackoffTime:", v10);
  v9 = 0;
  v18 = 1;
LABEL_25:

  return v18;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  TLV8BufferInit();
  -[HMDSelectedSleepConfigurationTLV operationType](self, "operationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDSelectedSleepConfigurationTLV operationType](self, "operationType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v6, "serializeWithError:", &v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v21;

    if (v8)
      goto LABEL_15;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
    {
LABEL_8:

      goto LABEL_9;
    }

  }
  -[HMDSelectedSleepConfigurationTLV operationStatus](self, "operationStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDSelectedSleepConfigurationTLV operationStatus](self, "operationStatus");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v11, "serializeWithError:", &v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v20;

    if (v8)
      goto LABEL_15;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_8;

  }
  -[HMDSelectedSleepConfigurationTLV backoffTime](self, "backoffTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_20;
  -[HMDSelectedSleepConfigurationTLV backoffTime](self, "backoffTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v14, "serializeWithError:", &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;

  if (v8)
  {
LABEL_15:

    if (a3)
    {
      v12 = objc_retainAutorelease(v8);
      v8 = v12;
      goto LABEL_17;
    }
LABEL_18:
    v15 = 0;
    goto LABEL_21;
  }
  v16 = objc_retainAutorelease(v7);
  objc_msgSend(v16, "bytes");
  objc_msgSend(v16, "length");
  v17 = TLV8BufferAppend();

  if (!v17)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_21;
  }
LABEL_9:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_18;
  }
  HMErrorFromOSStatus();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_17:
  v15 = 0;
  *a3 = v12;
LABEL_21:
  TLV8BufferFree();

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDSelectedSleepConfigurationTLV *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDSelectedSleepConfigurationTLV *v8;

  v4 = +[HMDSelectedSleepConfigurationTLV allocWithZone:](HMDSelectedSleepConfigurationTLV, "allocWithZone:", a3);
  -[HMDSelectedSleepConfigurationTLV operationType](self, "operationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSelectedSleepConfigurationTLV operationStatus](self, "operationStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSelectedSleepConfigurationTLV backoffTime](self, "backoffTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDSelectedSleepConfigurationTLV initWithOperationType:operationStatus:backoffTime:](v4, "initWithOperationType:operationStatus:backoffTime:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HMDSelectedSleepConfigurationTLV *v6;
  HMDSelectedSleepConfigurationTLV *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = (HMDSelectedSleepConfigurationTLV *)a3;
  if (self == v6)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[HMDSelectedSleepConfigurationTLV operationType](self, "operationType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSelectedSleepConfigurationTLV operationType](v7, "operationType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[HMDSelectedSleepConfigurationTLV operationType](self, "operationType");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSelectedSleepConfigurationTLV operationType](v7, "operationType");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_19;
        }
      }
      -[HMDSelectedSleepConfigurationTLV operationStatus](self, "operationStatus");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSelectedSleepConfigurationTLV operationStatus](v7, "operationStatus");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        -[HMDSelectedSleepConfigurationTLV operationStatus](self, "operationStatus");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSelectedSleepConfigurationTLV operationStatus](v7, "operationStatus");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      -[HMDSelectedSleepConfigurationTLV backoffTime](self, "backoffTime");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSelectedSleepConfigurationTLV backoffTime](v7, "backoffTime");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HMDSelectedSleepConfigurationTLV backoffTime](self, "backoffTime");
        v23 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSelectedSleepConfigurationTLV backoffTime](v7, "backoffTime");
        v22 = v4;
        v18 = v9;
        v19 = v8;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v17, "isEqual:", v20);

        v8 = v19;
        v9 = v18;
        v4 = v22;

        v3 = v23;
      }
      v13 = v24;
      v11 = v25;
      if (v25 == v12)
      {
LABEL_18:

        if (v8 == v9)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    v10 = 0;
  }
LABEL_21:

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDSelectedSleepConfigurationTLV operationType](self, "operationType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSelectedSleepConfigurationTLV operationStatus](self, "operationStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSelectedSleepConfigurationTLV backoffTime](self, "backoffTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDSelectedSleepConfigurationTLV operationType=%@, operationStatus=%@, backoffTime=%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (HMDSleepConfigurationOperationTypeWrapper)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(id)a3
{
  objc_storeStrong((id *)&self->_operationType, a3);
}

- (HMDSleepConfigurationOperationStatusWrapper)operationStatus
{
  return self->_operationStatus;
}

- (void)setOperationStatus:(id)a3
{
  objc_storeStrong((id *)&self->_operationStatus, a3);
}

- (HAPTLVUnsignedNumberValue)backoffTime
{
  return self->_backoffTime;
}

- (void)setBackoffTime:(id)a3
{
  objc_storeStrong((id *)&self->_backoffTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backoffTime, 0);
  objc_storeStrong((id *)&self->_operationStatus, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDSelectedSleepConfigurationTLV *v6;
  HMDSelectedSleepConfigurationTLV *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDSelectedSleepConfigurationTLV);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDSelectedSleepConfigurationTLV parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
    v8 = v10;
    if (v8)
    {

      v7 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }

  }
  return v7;
}

@end
