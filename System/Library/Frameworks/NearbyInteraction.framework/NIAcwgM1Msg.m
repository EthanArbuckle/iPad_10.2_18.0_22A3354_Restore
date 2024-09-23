@implementation NIAcwgM1Msg

- (NIAcwgM1Msg)initWithSupportedUwbConfigIds:(id)a3 supportedPulseShapeCombos:(id)a4 channelBitmask:(unsigned __int8)a5 uwbSessionId:(unsigned int)a6
{
  id v11;
  id v12;
  NIAcwgM1Msg *v13;
  NIAcwgM1Msg *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NIAcwgM1Msg;
  v13 = -[NIAcwgM1Msg init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_supportedUwbConfigIds, a3);
    objc_storeStrong((id *)&v14->_supportedPulseShapeCombos, a4);
    v14->_channelBitmask = a5;
    v14->_uwbSessionId = a6;
  }

  return v14;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("supportedUwbConfigIds:%@\n"), self->_supportedUwbConfigIds);
  objc_msgSend(v6, "appendFormat:", CFSTR("supportedPulseShapeCombos:%@\n"), self->_supportedPulseShapeCombos);
  objc_msgSend(v6, "appendFormat:", CFSTR("channelBitmask:0x%02x\n"), self->_channelBitmask);
  objc_msgSend(v6, "appendFormat:", CFSTR("uwbSessionId:0x%08x (%u)>"), self->_uwbSessionId, self->_uwbSessionId);
  return v6;
}

- (AcwgM1MsgStruct)toStruct
{
  AcwgM1MsgStruct *result;
  void *__p[3];
  void *v7[3];

  nsNumberArrayToStdVector<unsigned short>(self->_supportedUwbConfigIds, (uint64_t)v7);
  nsNumberArrayToStdVector<unsigned char>(self->_supportedPulseShapeCombos, (uint64_t *)__p);
  rose::alisha::AcwgM1MsgStruct::AcwgM1MsgStruct((uint64_t)retstr, (uint64_t)v7, (uint64_t)__p, self->_channelBitmask, self->_uwbSessionId);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  result = (AcwgM1MsgStruct *)v7[0];
  if (v7[0])
  {
    v7[1] = v7[0];
    operator delete(v7[0]);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSupportedUwbConfigIds:supportedPulseShapeCombos:channelBitmask:uwbSessionId:", self->_supportedUwbConfigIds, self->_supportedPulseShapeCombos, self->_channelBitmask, self->_uwbSessionId);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedUwbConfigIds, CFSTR("supportedUwbConfigIds"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedPulseShapeCombos, CFSTR("supportedPulseShapeCombos"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_channelBitmask, CFSTR("channelBitmask"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_uwbSessionId, CFSTR("uwbSessionId"));

}

- (NIAcwgM1Msg)initWithCoder:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *supportedUwbConfigIds;
  NSArray *v7;
  NSArray *supportedPulseShapeCombos;

  v4 = a3;
  if (self)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("supportedUwbConfigIds"));
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    supportedUwbConfigIds = self->_supportedUwbConfigIds;
    self->_supportedUwbConfigIds = v5;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("supportedPulseShapeCombos"));
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    supportedPulseShapeCombos = self->_supportedPulseShapeCombos;
    self->_supportedPulseShapeCombos = v7;

    self->_channelBitmask = objc_msgSend(v4, "decodeIntForKey:", CFSTR("channelBitmask"));
    self->_uwbSessionId = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("uwbSessionId"));
  }

  return self;
}

- (NSArray)supportedUwbConfigIds
{
  return self->_supportedUwbConfigIds;
}

- (NSArray)supportedPulseShapeCombos
{
  return self->_supportedPulseShapeCombos;
}

- (unsigned)channelBitmask
{
  return self->_channelBitmask;
}

- (unsigned)uwbSessionId
{
  return self->_uwbSessionId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPulseShapeCombos, 0);
  objc_storeStrong((id *)&self->_supportedUwbConfigIds, 0);
}

@end
