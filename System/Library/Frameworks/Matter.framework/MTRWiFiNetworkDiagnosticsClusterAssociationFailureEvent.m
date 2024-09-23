@implementation MTRWiFiNetworkDiagnosticsClusterAssociationFailureEvent

- (MTRWiFiNetworkDiagnosticsClusterAssociationFailureEvent)init
{
  MTRWiFiNetworkDiagnosticsClusterAssociationFailureEvent *v2;
  MTRWiFiNetworkDiagnosticsClusterAssociationFailureEvent *v3;
  NSNumber *associationFailureCause;
  NSNumber *status;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRWiFiNetworkDiagnosticsClusterAssociationFailureEvent;
  v2 = -[MTRWiFiNetworkDiagnosticsClusterAssociationFailureEvent init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    associationFailureCause = v2->_associationFailureCause;
    v2->_associationFailureCause = (NSNumber *)&unk_250591B18;

    status = v3->_status;
    v3->_status = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRWiFiNetworkDiagnosticsClusterAssociationFailureEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRWiFiNetworkDiagnosticsClusterAssociationFailureEvent);
  objc_msgSend_associationFailureCause(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssociationFailureCause_(v4, v8, (uint64_t)v7);

  objc_msgSend_status(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: associationFailureCause:%@; status:%@; >"),
    v5,
    self->_associationFailureCause,
    self->_status);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)associationFailureCause
{
  return self->_associationFailureCause;
}

- (void)setAssociationFailureCause:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(NSNumber *)status
{
  objc_setProperty_nonatomic_copy(self, a2, status, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_associationFailureCause, 0);
}

@end
