@implementation MXCallStackFrame

- (MXCallStackFrame)initWithBinaryName:(id)a3 binaryUUID:(id)a4 address:(id)a5 binaryOffset:(id)a6 sampleCount:(id)a7 withDepth:(unint64_t)a8 subFrameArray:(id)a9
{
  id v16;
  id v17;
  MXCallStackFrame *v18;
  id *p_isa;
  MXCallStackFrame *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v16 = a7;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MXCallStackFrame;
  v18 = -[MXCallStackFrame init](&v26, sel_init);
  p_isa = (id *)&v18->super.isa;
  if (!v18)
    goto LABEL_5;
  if (a8 <= 0x82)
  {
    objc_storeStrong((id *)&v18->_binaryName, a3);
    objc_storeStrong(p_isa + 3, a4);
    objc_storeStrong(p_isa + 2, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
    objc_storeStrong(p_isa + 6, a9);
LABEL_5:
    v20 = p_isa;
    goto LABEL_6;
  }
  v20 = 0;
LABEL_6:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *binaryName;
  id v5;

  binaryName = self->_binaryName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", binaryName, CFSTR("binaryName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_binaryUUID, CFSTR("binaryUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_address, CFSTR("address"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_offsetInBinary, CFSTR("offsetIntoBinaryTextSegment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sampleCount, CFSTR("sampleCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subFrames, CFSTR("subFrames"));

}

- (MXCallStackFrame)initWithCoder:(id)a3
{
  id v4;
  MXCallStackFrame *v5;
  uint64_t v6;
  NSString *binaryName;
  uint64_t v8;
  NSUUID *binaryUUID;
  uint64_t v10;
  NSNumber *address;
  uint64_t v12;
  NSNumber *offsetInBinary;
  uint64_t v14;
  NSNumber *sampleCount;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *subFrames;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MXCallStackFrame;
  v5 = -[MXCallStackFrame init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("binaryName"));
    v6 = objc_claimAutoreleasedReturnValue();
    binaryName = v5->_binaryName;
    v5->_binaryName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("binaryUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    binaryUUID = v5->_binaryUUID;
    v5->_binaryUUID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
    v10 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offsetIntoBinaryTextSegment"));
    v12 = objc_claimAutoreleasedReturnValue();
    offsetInBinary = v5->_offsetInBinary;
    v5->_offsetInBinary = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sampleCount"));
    v14 = objc_claimAutoreleasedReturnValue();
    sampleCount = v5->_sampleCount;
    v5->_sampleCount = (NSNumber *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("subFrames"));
    v19 = objc_claimAutoreleasedReturnValue();
    subFrames = v5->_subFrames;
    v5->_subFrames = (NSArray *)v19;

  }
  return v5;
}

- (id)toDictionary
{
  id v3;
  void *v4;
  NSNumber *sampleCount;
  NSString *binaryName;
  NSNumber *address;
  NSUUID *binaryUUID;
  void *v9;
  NSNumber *offsetInBinary;
  id v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = v3;
  sampleCount = self->_sampleCount;
  if (sampleCount)
    objc_msgSend(v3, "setObject:forKey:", sampleCount, CFSTR("sampleCount"));
  binaryName = self->_binaryName;
  if (binaryName)
    objc_msgSend(v4, "setObject:forKey:", binaryName, CFSTR("binaryName"));
  address = self->_address;
  if (address)
    objc_msgSend(v4, "setObject:forKey:", address, CFSTR("address"));
  binaryUUID = self->_binaryUUID;
  if (binaryUUID)
  {
    -[NSUUID UUIDString](binaryUUID, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("binaryUUID"));

  }
  offsetInBinary = self->_offsetInBinary;
  if (offsetInBinary)
    objc_msgSend(v4, "setObject:forKey:", offsetInBinary, CFSTR("offsetIntoBinaryTextSegment"));
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = self->_subFrames;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "toDictionary", (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v11, "count"))
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("subFrames"));

  return v4;
}

- (NSString)binaryName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)address
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)binaryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)offsetInBinary
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)sampleCount
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)subFrames
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSubFrames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subFrames, 0);
  objc_storeStrong((id *)&self->_sampleCount, 0);
  objc_storeStrong((id *)&self->_offsetInBinary, 0);
  objc_storeStrong((id *)&self->_binaryUUID, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_binaryName, 0);
}

@end
