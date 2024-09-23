@implementation HMDDataStreamFragmentChunk

- (HMDDataStreamFragmentChunk)initWithData:(id)a3 sequenceNumber:(id)a4 fragmentSequenceNumber:(id)a5 type:(id)a6 isLast:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HMDDataStreamFragmentChunk *v18;
  HMDDataStreamFragmentChunk *v19;
  uint64_t v20;
  NSNumber *sequenceNumber;
  uint64_t v22;
  NSNumber *fragmentSequenceNumber;
  uint64_t v24;
  NSString *type;
  HMDDataStreamFragmentChunk *v27;
  SEL v28;
  id v29;
  objc_super v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v14)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v15)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v17 = v16;
  if (!v16)
  {
LABEL_11:
    v27 = (HMDDataStreamFragmentChunk *)_HMFPreconditionFailure();
    return -[HMDDataStreamFragmentChunk initWithDictionaryRepresentation:](v27, v28, v29);
  }
  v30.receiver = self;
  v30.super_class = (Class)HMDDataStreamFragmentChunk;
  v18 = -[HMDDataStreamFragmentChunk init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_data, a3);
    v20 = objc_msgSend(v14, "copy");
    sequenceNumber = v19->_sequenceNumber;
    v19->_sequenceNumber = (NSNumber *)v20;

    v22 = objc_msgSend(v15, "copy");
    fragmentSequenceNumber = v19->_fragmentSequenceNumber;
    v19->_fragmentSequenceNumber = (NSNumber *)v22;

    v24 = objc_msgSend(v17, "copy");
    type = v19->_type;
    v19->_type = (NSString *)v24;

    v19->_last = a7;
  }

  return v19;
}

- (HMDDataStreamFragmentChunk)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDDataStreamFragmentChunk *v13;
  HMDDataStreamFragmentChunk *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v32;
  void *contexta;
  void *context;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("metadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "hmf_numberForKey:", CFSTR("dataChunkSequenceNumber"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v7, "hmf_numberForKey:", CFSTR("dataSequenceNumber"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v7, "hmf_stringForKey:", CFSTR("dataType"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v7, "hmf_numberForKey:", CFSTR("isLastDataChunk"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v11;
            if (v11)
            {
              v13 = -[HMDDataStreamFragmentChunk initWithData:sequenceNumber:fragmentSequenceNumber:type:isLast:](self, "initWithData:sequenceNumber:fragmentSequenceNumber:type:isLast:", v5, v8, v9, v10, objc_msgSend(v11, "BOOLValue"));
              v14 = v13;
            }
            else
            {
              context = (void *)MEMORY[0x227676638]();
              v13 = self;
              HMFGetOSLogHandle();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v36 = v32;
                v37 = 2112;
                v38 = CFSTR("isLastDataChunk");
                v39 = 2112;
                v40 = v4;
                _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Could not determine isLast (key=%@) from stream data dictionary: %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(context);
              v14 = 0;
            }

          }
          else
          {
            v27 = (void *)MEMORY[0x227676638]();
            v13 = self;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              contexta = v27;
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v36 = v29;
              v37 = 2112;
              v38 = CFSTR("dataType");
              v39 = 2112;
              v40 = v4;
              _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not determine type (key=%@) from stream data dictionary: %@", buf, 0x20u);

              v27 = contexta;
            }

            objc_autoreleasePoolPop(v27);
            v14 = 0;
          }

        }
        else
        {
          v24 = (void *)MEMORY[0x227676638]();
          v13 = self;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v36 = v26;
            v37 = 2112;
            v38 = CFSTR("dataSequenceNumber");
            v39 = 2112;
            v40 = v4;
            _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not determine fragment sequence number (key=%@) from stream data dictionary: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v24);
          v14 = 0;
        }

      }
      else
      {
        v21 = (void *)MEMORY[0x227676638]();
        v13 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v36 = v23;
          v37 = 2112;
          v38 = CFSTR("dataChunkSequenceNumber");
          v39 = 2112;
          v40 = v4;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not determine sequence number (key=%@) from stream data dictionary: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v21);
        v14 = 0;
      }

    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v20;
        v37 = 2112;
        v38 = CFSTR("metadata");
        v39 = 2112;
        v40 = v4;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not determine metadata (key=%@) from stream data dictionary: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      v14 = 0;
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v17;
      v37 = 2112;
      v38 = CFSTR("data");
      v39 = 2112;
      v40 = v4;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not determine data (key=%@) from stream data dictionary: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    v14 = 0;
  }

  return v14;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("metadata");
  v11[0] = CFSTR("dataChunkSequenceNumber");
  -[HMDDataStreamFragmentChunk sequenceNumber](self, "sequenceNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("dataSequenceNumber");
  -[HMDDataStreamFragmentChunk fragmentSequenceNumber](self, "fragmentSequenceNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = CFSTR("dataType");
  -[HMDDataStreamFragmentChunk type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  v11[3] = CFSTR("isLastDataChunk");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDDataStreamFragmentChunk isLast](self, "isLast"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("data");
  v14[0] = v7;
  -[HMDDataStreamFragmentChunk data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v9;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
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
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[HMDDataStreamFragmentChunk data](self, "data");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v21, "length"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Data Length"), v20);
  v22[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDataStreamFragmentChunk sequenceNumber](self, "sequenceNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Sequence Number"), v7);
  v22[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDataStreamFragmentChunk fragmentSequenceNumber](self, "fragmentSequenceNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Fragment Sequence Number"), v10);
  v22[2] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDataStreamFragmentChunk type](self, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Type"), v13);
  v22[3] = v14;
  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDataStreamFragmentChunk isLast](self, "isLast");
  HMFBooleanToString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Is Last"), v16);
  v22[4] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v20;
  void *v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamFragmentChunk data](self, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToData:", v9))
    {
      objc_msgSend(v7, "sequenceNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamFragmentChunk sequenceNumber](self, "sequenceNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToNumber:", v11))
      {
        objc_msgSend(v7, "fragmentSequenceNumber");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDataStreamFragmentChunk fragmentSequenceNumber](self, "fragmentSequenceNumber");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToNumber:", v13))
        {
          objc_msgSend(v7, "type");
          v14 = objc_claimAutoreleasedReturnValue();
          -[HMDDataStreamFragmentChunk type](self, "type");
          v15 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v14;
          v16 = (void *)v14;
          v17 = (void *)v15;
          if (objc_msgSend(v16, "isEqualToString:", v15))
          {
            v20 = objc_msgSend(v7, "isLast");
            v18 = v20 ^ -[HMDDataStreamFragmentChunk isLast](self, "isLast") ^ 1;
          }
          else
          {
            LOBYTE(v18) = 0;
          }

        }
        else
        {
          LOBYTE(v18) = 0;
        }

      }
      else
      {
        LOBYTE(v18) = 0;
      }

    }
    else
    {
      LOBYTE(v18) = 0;
    }

  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  -[HMDDataStreamFragmentChunk data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMDDataStreamFragmentChunk sequenceNumber](self, "sequenceNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMDDataStreamFragmentChunk fragmentSequenceNumber](self, "fragmentSequenceNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[HMDDataStreamFragmentChunk type](self, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10 ^ -[HMDDataStreamFragmentChunk isLast](self, "isLast");
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)sequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)fragmentSequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isLast
{
  return self->_last;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_fragmentSequenceNumber, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
