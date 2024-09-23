@implementation MBDeviceTransferConnectionInfo

+ (int64_t)connectionTypeFromLinkType:(int)a3
{
  if ((a3 - 1) > 8)
    return 0;
  else
    return qword_1D5259AD0[a3 - 1];
}

- (MBDeviceTransferConnectionInfo)init
{
  MBDeviceTransferConnectionInfo *v2;
  MBDeviceTransferConnectionInfo *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MBDeviceTransferConnectionInfo;
  v2 = -[MBDeviceTransferConnectionInfo init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MBDeviceTransferConnectionInfo setConnectionState:](v2, "setConnectionState:", 0);
    -[MBDeviceTransferConnectionInfo setConnectionType:](v3, "setConnectionType:", 0);
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBDeviceTransferConnectionInfo)initWithCoder:(id)a3
{
  id v4;
  MBDeviceTransferConnectionInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MBDeviceTransferConnectionInfo;
  v5 = -[MBDeviceTransferConnectionInfo init](&v7, sel_init);
  if (v5)
  {
    -[MBDeviceTransferConnectionInfo setConnectionState:](v5, "setConnectionState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("connectionState")));
    -[MBDeviceTransferConnectionInfo setConnectionType:](v5, "setConnectionType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("connectionType")));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setConnectionState:", -[MBDeviceTransferConnectionInfo connectionState](self, "connectionState"));
  objc_msgSend(v4, "setConnectionType:", -[MBDeviceTransferConnectionInfo connectionType](self, "connectionType"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MBDeviceTransferConnectionInfo connectionState](self, "connectionState"), CFSTR("connectionState"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MBDeviceTransferConnectionInfo connectionType](self, "connectionType"), CFSTR("connectionType"));

}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%s: %p; connectionState=%ld, connectionType=%ld"),
               class_getName(v4),
               self,
               -[MBDeviceTransferConnectionInfo connectionState](self, "connectionState"),
               -[MBDeviceTransferConnectionInfo connectionType](self, "connectionType"));
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(int64_t)a3
{
  self->_connectionType = a3;
}

@end
