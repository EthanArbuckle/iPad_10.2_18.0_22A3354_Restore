@implementation FCCPauseRingsPostNotificationRequest

- (FCCPauseRingsPostNotificationRequest)initWithForce:(BOOL)a3
{
  FCCPauseRingsPostNotificationRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FCCPauseRingsPostNotificationRequest;
  result = -[FCCPauseRingsPostNotificationRequest init](&v5, sel_init);
  if (result)
    result->_force = a3;
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FCCPauseRingsPostNotificationRequest: force: %{BOOL}d"), self->_force);
}

- (FCCPauseRingsPostNotificationRequest)initWithTransportData:(id)a3
{
  id v4;
  FCCPauseRingsPostNotificationRequestProtobuf *v5;
  uint64_t v6;
  FCCPauseRingsPostNotificationRequest *v7;

  v4 = a3;
  v5 = -[FCCPauseRingsPostNotificationRequestProtobuf initWithData:]([FCCPauseRingsPostNotificationRequestProtobuf alloc], "initWithData:", v4);

  if (-[FCCPauseRingsPostNotificationRequestProtobuf hasForce](v5, "hasForce"))
    v6 = -[FCCPauseRingsPostNotificationRequestProtobuf force](v5, "force");
  else
    v6 = 0;
  v7 = -[FCCPauseRingsPostNotificationRequest initWithForce:](self, "initWithForce:", v6);

  return v7;
}

- (id)transportData
{
  FCCPauseRingsPostNotificationRequestProtobuf *v3;
  void *v4;

  v3 = objc_alloc_init(FCCPauseRingsPostNotificationRequestProtobuf);
  -[FCCPauseRingsPostNotificationRequestProtobuf setForce:](v3, "setForce:", self->_force);
  -[FCCPauseRingsPostNotificationRequestProtobuf data](v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)force
{
  return self->_force;
}

@end
