@implementation FCCFitnessPlusPlanPostNotificationRequest

- (FCCFitnessPlusPlanPostNotificationRequest)initWithType:(id)a3
{
  return -[FCCFitnessPlusPlanPostNotificationRequest initWithType:force:](self, "initWithType:force:", a3, 0);
}

- (FCCFitnessPlusPlanPostNotificationRequest)initWithType:(id)a3 force:(BOOL)a4
{
  id v7;
  FCCFitnessPlusPlanPostNotificationRequest *v8;
  FCCFitnessPlusPlanPostNotificationRequest *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCCFitnessPlusPlanPostNotificationRequest;
  v8 = -[FCCFitnessPlusPlanPostNotificationRequest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_type, a3);
    v9->_force = a4;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FCCFitnessPlusPlanPostNotificationRequest: type: %@, force: %{BOOL}d"), self->_type, self->_force);
}

- (FCCFitnessPlusPlanPostNotificationRequest)initWithTransportData:(id)a3
{
  id v4;
  FCCFitnessPlusPlanPostNotificationRequestProtobuf *v5;
  void *v6;
  uint64_t v7;
  FCCFitnessPlusPlanPostNotificationRequest *v8;

  v4 = a3;
  v5 = -[FCCFitnessPlusPlanPostNotificationRequestProtobuf initWithData:]([FCCFitnessPlusPlanPostNotificationRequestProtobuf alloc], "initWithData:", v4);

  -[FCCFitnessPlusPlanPostNotificationRequestProtobuf type](v5, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FCCFitnessPlusPlanPostNotificationRequestProtobuf hasForce](v5, "hasForce"))
    v7 = -[FCCFitnessPlusPlanPostNotificationRequestProtobuf force](v5, "force");
  else
    v7 = 0;
  v8 = -[FCCFitnessPlusPlanPostNotificationRequest initWithType:force:](self, "initWithType:force:", v6, v7);

  return v8;
}

- (id)transportData
{
  FCCFitnessPlusPlanPostNotificationRequestProtobuf *v3;
  void *v4;

  v3 = objc_alloc_init(FCCFitnessPlusPlanPostNotificationRequestProtobuf);
  -[FCCFitnessPlusPlanPostNotificationRequestProtobuf setType:](v3, "setType:", self->_type);
  -[FCCFitnessPlusPlanPostNotificationRequestProtobuf setForce:](v3, "setForce:", self->_force);
  -[FCCFitnessPlusPlanPostNotificationRequestProtobuf data](v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)type
{
  return self->_type;
}

- (BOOL)force
{
  return self->_force;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
}

@end
