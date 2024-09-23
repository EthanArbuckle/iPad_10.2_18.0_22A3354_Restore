@implementation HMDAccessoryTransportReachabilityReport

- (HMDAccessoryTransportReachabilityReport)initWithLinkType:(id)a3 hasAdvertisement:(BOOL)a4 protocol:(id)a5 protocolVersion:(id)a6 reachable:(BOOL)a7 reachableLastChangedTime:(id)a8 reason:(id)a9
{
  id v15;
  id v16;
  id v17;
  HMDAccessoryTransportReachabilityReport *v18;
  HMDAccessoryTransportReachabilityReport *v19;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a5;
  v15 = a6;
  v16 = a8;
  v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)HMDAccessoryTransportReachabilityReport;
  v18 = -[HMDAccessoryTransportReachabilityReport init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_linkType, a3);
    v19->_hasAdvertisement = a4;
    objc_storeStrong((id *)&v19->_protocol, a5);
    objc_storeStrong((id *)&v19->_protocolVersion, a6);
    v19->_reachable = a7;
    objc_storeStrong((id *)&v19->_reachableLastChangedTime, a8);
    objc_storeStrong((id *)&v19->_reason, a9);
  }

  return v19;
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (NSDate)reachableLastChangedTime
{
  return self->_reachableLastChangedTime;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)hasAdvertisement
{
  return self->_hasAdvertisement;
}

- (NSString)linkType
{
  return self->_linkType;
}

- (NSString)protocol
{
  return self->_protocol;
}

- (NSString)protocolVersion
{
  return self->_protocolVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_linkType, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_reachableLastChangedTime, 0);
}

@end
