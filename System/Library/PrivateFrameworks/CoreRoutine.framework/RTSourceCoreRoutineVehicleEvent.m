@implementation RTSourceCoreRoutineVehicleEvent

- (RTSourceCoreRoutineVehicleEvent)initWithVehicleEvent:(id)a3
{
  id v5;
  RTSourceCoreRoutineVehicleEvent *v6;
  RTSourceCoreRoutineVehicleEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTSourceCoreRoutineVehicleEvent;
  v6 = -[RTSourceCoreRoutineVehicleEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_vehicleEvent, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTSourceCoreRoutineVehicleEvent)initWithCoder:(id)a3
{
  id v4;
  RTSourceCoreRoutineVehicleEvent *v5;
  uint64_t v6;
  RTVehicleEvent *vehicleEvent;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTSourceCoreRoutineVehicleEvent;
  v5 = -[RTSourceCoreRoutine initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vehicleEvent"));
    v6 = objc_claimAutoreleasedReturnValue();
    vehicleEvent = v5->_vehicleEvent;
    v5->_vehicleEvent = (RTVehicleEvent *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTSourceCoreRoutineVehicleEvent;
  v4 = a3;
  -[RTSourceCoreRoutine encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_vehicleEvent, CFSTR("vehicleEvent"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithVehicleEvent:", self->_vehicleEvent);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RTSourceCoreRoutineVehicleEvent;
  if (-[RTSource isEqual:](&v12, sel_isEqual_, v5))
  {
    v6 = v5;
    -[RTSourceCoreRoutineVehicleEvent vehicleEvent](self, "vehicleEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "vehicleEvent"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[RTSourceCoreRoutineVehicleEvent vehicleEvent](self, "vehicleEvent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "vehicleEvent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v7)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v10 = 1;
    }

    goto LABEL_9;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RTSourceCoreRoutineVehicleEvent;
  v3 = -[RTSource hash](&v7, sel_hash);
  -[RTSourceCoreRoutineVehicleEvent vehicleEvent](self, "vehicleEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTSourceCoreRoutineVehicleEvent vehicleEvent](self, "vehicleEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, vehicleEvent, %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (RTVehicleEvent)vehicleEvent
{
  return self->_vehicleEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleEvent, 0);
}

@end
