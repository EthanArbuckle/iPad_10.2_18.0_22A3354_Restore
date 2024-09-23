@implementation DriverApprovalState

- (DriverApprovalState)initWithSwiftDriverApprovalState:(id)a3
{
  id v5;
  DriverApprovalState *v6;
  DriverApprovalState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DriverApprovalState;
  v6 = -[DriverApprovalState init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_swiftDriverApprovalState, a3);

  return v7;
}

- (id)displayName
{
  return -[_SwiftDriverApprovalState displayName](self->_swiftDriverApprovalState, "displayName");
}

- (id)usageText
{
  return -[_SwiftDriverApprovalState usageText](self->_swiftDriverApprovalState, "usageText");
}

- (BOOL)updatePending
{
  return -[_SwiftDriverApprovalState updatePending](self->_swiftDriverApprovalState, "updatePending");
}

- (BOOL)driverIsApproved
{
  return -[_SwiftDriverApprovalState driverIsApproved](self->_swiftDriverApprovalState, "driverIsApproved");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftDriverApprovalState, 0);
}

@end
