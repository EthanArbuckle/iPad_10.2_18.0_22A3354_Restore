@implementation MIBUDeviceStatus

- (MIBUDeviceStatus)init
{
  MIBUDeviceStatus *v2;
  MIBUDeviceStatus *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUDeviceStatus;
  v2 = -[MIBUDeviceStatus init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MIBUDeviceStatus setState:](v2, "setState:", 0);
    -[MIBUDeviceStatus setOperation:](v3, "setOperation:", 0);
    -[MIBUDeviceStatus setOperationDetails:](v3, "setOperationDetails:", 0);
    -[MIBUDeviceStatus setOperationError:](v3, "setOperationError:", 0);
    -[MIBUDeviceStatus setBatteryLevel:](v3, "setBatteryLevel:", 0);
    -[MIBUDeviceStatus setThermalDetails:](v3, "setThermalDetails:", 0);
    -[MIBUDeviceStatus setBatteryDetails:](v3, "setBatteryDetails:", 0);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  char v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  v5 = objc_msgSend(v4, "state");
  if (v5 != -[MIBUDeviceStatus state](self, "state"))
    goto LABEL_10;
  v6 = objc_msgSend(v4, "operation");
  if (v6 != -[MIBUDeviceStatus operation](self, "operation"))
    goto LABEL_10;
  objc_msgSend(v4, "operationError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBUDeviceStatus operationError](self, "operationError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  if (!v11)
    goto LABEL_10;
  objc_msgSend(v4, "operationError");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "code");
  -[MIBUDeviceStatus operationError](self, "operationError");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "code");

  if (v13 != v15)
    goto LABEL_10;
  objc_msgSend(v4, "batteryLevel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBUDeviceStatus batteryLevel](self, "batteryLevel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqualToNumber:", v17);

  if (!v18)
    goto LABEL_10;
  objc_msgSend(v4, "operationDetails");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBUDeviceStatus operationDetails](self, "operationDetails");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqualToDictionary:", v20);

  if (!v21)
    goto LABEL_10;
  objc_msgSend(v4, "thermalDetails");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBUDeviceStatus thermalDetails](self, "thermalDetails");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "isEqualToDictionary:", v23);

  if (v24)
  {
    objc_msgSend(v4, "batteryDetails");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBUDeviceStatus batteryDetails](self, "batteryDetails");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqualToDictionary:", v26);

  }
  else
  {
LABEL_10:
    v27 = 0;
  }

  return v27;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(unint64_t)a3
{
  self->_operation = a3;
}

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
  objc_storeStrong((id *)&self->_operationError, a3);
}

- (NSNumber)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(id)a3
{
  objc_storeStrong((id *)&self->_batteryLevel, a3);
}

- (NSDictionary)operationDetails
{
  return self->_operationDetails;
}

- (void)setOperationDetails:(id)a3
{
  objc_storeStrong((id *)&self->_operationDetails, a3);
}

- (NSDictionary)thermalDetails
{
  return self->_thermalDetails;
}

- (void)setThermalDetails:(id)a3
{
  objc_storeStrong((id *)&self->_thermalDetails, a3);
}

- (NSDictionary)batteryDetails
{
  return self->_batteryDetails;
}

- (void)setBatteryDetails:(id)a3
{
  objc_storeStrong((id *)&self->_batteryDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryDetails, 0);
  objc_storeStrong((id *)&self->_thermalDetails, 0);
  objc_storeStrong((id *)&self->_operationDetails, 0);
  objc_storeStrong((id *)&self->_batteryLevel, 0);
  objc_storeStrong((id *)&self->_operationError, 0);
}

@end
