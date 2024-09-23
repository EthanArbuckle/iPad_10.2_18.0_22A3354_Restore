@implementation MSRemovalEvent

- (MSRemovalEvent)initWithServiceId:(id)a3
{
  id v4;
  MSRemovalEvent *v5;
  MSRemovalEvent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSRemovalEvent;
  v5 = -[MSRemovalEvent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MSRemovalEvent setServiceId:](v5, "setServiceId:", v4);

  return v6;
}

- (NSString)serviceId
{
  return self->_serviceId;
}

- (void)setServiceId:(id)a3
{
  objc_storeStrong((id *)&self->_serviceId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceId, 0);
}

@end
