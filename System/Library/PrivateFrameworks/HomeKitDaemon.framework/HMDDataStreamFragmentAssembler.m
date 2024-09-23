@implementation HMDDataStreamFragmentAssembler

- (HMDDataStreamFragmentAssembler)initWithSequenceNumber:(id)a3 type:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDDataStreamFragmentAssembler *v10;
  HMDDataStreamFragmentAssembler *v11;
  uint64_t v12;
  NSString *type;
  uint64_t v14;
  NSMutableData *data;
  NSNumber *currentChunkSequenceNumber;
  void *v17;
  HMDDataStreamFragmentAssembler *v18;
  NSObject *v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
LABEL_9:
    _HMFPreconditionFailure();
  }
  v9 = v8;
  if (!v8)
    goto LABEL_9;
  v22.receiver = self;
  v22.super_class = (Class)HMDDataStreamFragmentAssembler;
  v10 = -[HMDDataStreamFragmentAssembler init](&v22, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_sequenceNumber, a3);
    v12 = objc_msgSend(v9, "copy");
    type = v11->_type;
    v11->_type = (NSString *)v12;

    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v14 = objc_claimAutoreleasedReturnValue();
    data = v11->_data;
    v11->_data = (NSMutableData *)v14;

    currentChunkSequenceNumber = v11->_currentChunkSequenceNumber;
    v11->_currentChunkSequenceNumber = (NSNumber *)&unk_24E96A700;

    v17 = (void *)MEMORY[0x227676638]();
    v18 = v11;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v20;
      v25 = 2112;
      v26 = v7;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Initialized data chunk assembler with sequence number: %@ type: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }

  return v11;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDataStreamFragmentAssembler sequenceNumber](self, "sequenceNumber");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Sequence Number"), v21);
  v22[0] = v20;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDataStreamFragmentAssembler type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Type"), v5);
  v22[1] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[HMDDataStreamFragmentAssembler data](self, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Data Length"), v10);
  v22[2] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDataStreamFragmentAssembler currentChunkSequenceNumber](self, "currentChunkSequenceNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Current Chunk Sequence Number"), v13);
  v22[3] = v14;
  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDataStreamFragmentAssembler assembledFragment](self, "assembledFragment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Assembled Fragment"), v16);
  v22[4] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)addFragmentChunk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  HMDDataStreamFragmentAssembler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDDataStreamFragmentAssembler *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  HMDDataStreamFragment *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDDataStreamFragment *v29;
  BOOL v30;
  void *v31;
  HMDDataStreamFragmentAssembler *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDDataStreamFragmentAssembler *v37;
  NSObject *v38;
  void *v39;
  int v41;
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138543618;
    v42 = v10;
    v43 = 2112;
    v44 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Adding chunk: %@", (uint8_t *)&v41, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDDataStreamFragmentAssembler assembledFragment](v8, "assembledFragment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = v8;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138543618;
      v42 = v15;
      v43 = 2112;
      v44 = v6;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Asked to add fragment chunk %@ but the last data chunk has already been received", (uint8_t *)&v41, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    if (a4)
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      v17 = 1;
LABEL_18:
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("HMDDataStreamFragmentAssemblerErrorDomain"), v17, 0);
      v30 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  -[HMDDataStreamFragmentAssembler currentChunkSequenceNumber](v8, "currentChunkSequenceNumber");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedLongLongValue");

  objc_msgSend(v6, "sequenceNumber");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedLongLongValue");

  if (v21 != v19 + 1)
  {
    v31 = (void *)MEMORY[0x227676638]();
    v32 = v8;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamFragmentAssembler currentChunkSequenceNumber](v32, "currentChunkSequenceNumber");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138543874;
      v42 = v34;
      v43 = 2112;
      v44 = v6;
      v45 = 2112;
      v46 = v35;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Asked to add fragment chunk %@ with non-sequential sequence number compared to current stream data chunk sequence number %@", (uint8_t *)&v41, 0x20u);

    }
    objc_autoreleasePoolPop(v31);
    if (a4)
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      v17 = 2;
      goto LABEL_18;
    }
LABEL_23:
    v30 = 0;
    goto LABEL_24;
  }
  if (v21 == -1 && (objc_msgSend(v6, "isLast") & 1) == 0)
  {
    v36 = (void *)MEMORY[0x227676638]();
    v37 = v8;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138543618;
      v42 = v39;
      v43 = 2112;
      v44 = v6;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Asked to add non-last fragment chunk with maximum allowed sequence number: %@", (uint8_t *)&v41, 0x16u);

    }
    objc_autoreleasePoolPop(v36);
    if (a4)
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      v17 = 3;
      goto LABEL_18;
    }
    goto LABEL_23;
  }
  objc_msgSend(v6, "sequenceNumber");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDataStreamFragmentAssembler setCurrentChunkSequenceNumber:](v8, "setCurrentChunkSequenceNumber:", v22);

  -[HMDDataStreamFragmentAssembler data](v8, "data");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendData:", v24);

  if (objc_msgSend(v6, "isLast"))
  {
    v25 = [HMDDataStreamFragment alloc];
    -[HMDDataStreamFragmentAssembler data](v8, "data");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamFragmentAssembler sequenceNumber](v8, "sequenceNumber");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamFragmentAssembler type](v8, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[HMDDataStreamFragment initWithData:sequenceNumber:type:](v25, "initWithData:sequenceNumber:type:", v26, v27, v28);
    -[HMDDataStreamFragmentAssembler setAssembledFragment:](v8, "setAssembledFragment:", v29);

  }
  v30 = 1;
LABEL_24:

  return v30;
}

- (NSNumber)sequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (HMDDataStreamFragment)assembledFragment
{
  return (HMDDataStreamFragment *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAssembledFragment:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)currentChunkSequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentChunkSequenceNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentChunkSequenceNumber, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_assembledFragment, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
}

@end
