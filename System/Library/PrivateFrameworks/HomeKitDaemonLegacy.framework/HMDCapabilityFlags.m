@implementation HMDCapabilityFlags

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCapabilityFlags bytesData](self, "bytesData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMD.rqcp"));

}

- (HMDCapabilityFlags)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDCapabilityFlags *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMD.rqcp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[HMDCapabilityFlags initWithData:](self, "initWithData:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCapabilityFlags bytesData](self, "bytesData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[HMDCapabilityFlags %@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDCapabilityFlags)initWithCapabilityOptions:(unint64_t)a3
{
  id v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HMDCapabilityFlags *v15;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = 0;
  v7 = 0;
  v8 = 0;
  do
  {
    if ((a3 >> v6))
      v8 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", (a3 >> v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

    ++v7;
    v6 += 8;
  }
  while (v7 != 8);
  v10 = v8 + 1;
  v11 = malloc_type_malloc(v8 + 1, 0x100004077774924uLL);
  bzero(v11, v8 + 1);
  if (v8 != -1)
  {
    v12 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v11 + v12) = objc_msgSend(v13, "unsignedCharValue");

      ++v12;
    }
    while (v10 != v12);
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v11, v10, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDCapabilityFlags initWithData:](self, "initWithData:", v14);

  return v15;
}

- (HMDCapabilityFlags)initWithCapabilities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  size_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  unint64_t v19;
  void *v20;
  HMDCapabilityFlags *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", CFSTR("@max.self"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if ((v7 & 7) == 0 && v7 >= 8)
    v9 = v7 >> 3;
  else
    v9 = (v7 >> 3) + 1;
  if (v9 >= 9)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Ran over 64 bits, you sure this is expected?", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }
  v13 = malloc_type_malloc(v9, 0xB3867B94uLL);
  bzero(v13, v9);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v23);
        *((_BYTE *)v13 + (v19 >> 3)) |= 1 << (v19 & 7);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v13, v9, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HMDCapabilityFlags initWithData:](self, "initWithData:", v20);

  return v21;
}

- (HMDCapabilityFlags)initWithData:(id)a3
{
  id v5;
  HMDCapabilityFlags *v6;
  HMDCapabilityFlags *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCapabilityFlags;
  v6 = -[HMDCapabilityFlags init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bytesData, a3);

  return v7;
}

- (BOOL)hasCapabilities:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  BOOL v16;

  v4 = a3;
  objc_msgSend(v4, "bytesData");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "bytes");

  -[HMDCapabilityFlags bytesData](self, "bytesData");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "bytes");

  objc_msgSend(v4, "bytesData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    v11 = 0;
    while (1)
    {
      -[HMDCapabilityFlags bytesData](self, "bytesData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (v11 >= v13 || (*(unsigned __int8 *)(v6 + v11) & ~*(unsigned __int8 *)(v8 + v11)) != 0)
        break;
      ++v11;
      objc_msgSend(v4, "bytesData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (v11 >= v15)
        goto LABEL_6;
    }
    v16 = 0;
  }
  else
  {
LABEL_6:
    v16 = 1;
  }

  return v16;
}

- (NSData)bytesData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bytesData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  return CFSTR("HMDCapabilityFlags");
}

@end
