@implementation CLSiloHeartbeatRecord

- (CLSilo)silo
{
  return self->_silo;
}

- (id)initTrackingServiceClass:(Class)a3 name:(id)a4
{
  id v7;
  CLSiloHeartbeatRecord *v8;
  CLSiloHeartbeatRecord *v9;
  uint64_t v10;
  CLSilo *silo;
  CLSiloHeartbeatRecord *v12;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLSiloHeartbeatRecord;
  v8 = -[CLSiloHeartbeatRecord init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_svcClass, a3);
    objc_storeStrong((id *)&v9->_svcName, a4);
    -[objc_class getSilo](a3, "getSilo");
    v10 = objc_claimAutoreleasedReturnValue();
    silo = v9->_silo;
    v9->_silo = (CLSilo *)v10;

    v9->_residentCount = 1;
    v12 = v9;
  }

  return v9;
}

- (void)syn
{
  int *p_synCount;
  unsigned int v3;

  p_synCount = &self->_synCount;
  do
    v3 = __ldxr((unsigned int *)p_synCount);
  while (__stxr(v3 + 1, (unsigned int *)p_synCount));
}

- (void)ack
{
  int *p_ackCount;
  unsigned int v3;

  p_ackCount = &self->_ackCount;
  do
    v3 = __ldxr((unsigned int *)p_ackCount);
  while (__stxr(v3 + 1, (unsigned int *)p_ackCount));
}

- (Class)svcClass
{
  return self->_svcClass;
}

- (NSString)svcName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int)residentCount
{
  return self->_residentCount;
}

- (void)setResidentCount:(int)a3
{
  self->_residentCount = a3;
}

- (int)synCount
{
  return self->_synCount;
}

- (int)ackCount
{
  return self->_ackCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_svcName, 0);
  objc_storeStrong((id *)&self->_svcClass, 0);
  objc_storeStrong((id *)&self->_silo, 0);
}

@end
