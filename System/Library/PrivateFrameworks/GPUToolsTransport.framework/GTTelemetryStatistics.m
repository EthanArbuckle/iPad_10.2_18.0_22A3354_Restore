@implementation GTTelemetryStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTTelemetryStatistics)initWithCoder:(id)a3
{
  id v4;
  GTTelemetryStatistics *v5;
  uint64_t v6;
  NSArray *devices;
  uint64_t v8;
  NSArray *queues;
  uint64_t v10;
  NSArray *layers;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GTTelemetryStatistics;
  v5 = -[GTTelemetryStatistics init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("devices"));
    v6 = objc_claimAutoreleasedReturnValue();
    devices = v5->_devices;
    v5->_devices = (NSArray *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("queues"));
    v8 = objc_claimAutoreleasedReturnValue();
    queues = v5->_queues;
    v5->_queues = (NSArray *)v8;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("layers"));
    v10 = objc_claimAutoreleasedReturnValue();
    layers = v5->_layers;
    v5->_layers = (NSArray *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *devices;
  id v5;

  devices = self->_devices;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", devices, CFSTR("devices"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_queues, CFSTR("queues"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_layers, CFSTR("layers"));

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTTelemetryStatistics;
  -[GTTelemetryStatistics description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)queues
{
  return self->_queues;
}

- (void)setQueues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)layers
{
  return self->_layers;
}

- (void)setLayers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_queues, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
