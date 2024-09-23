@implementation NFVehicleReport

- (NFVehicleReport)initWithSESVehicleReport:(id)a3
{
  id v5;
  NFVehicleReport *v6;
  NFVehicleReport *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFVehicleReport;
  v6 = -[NFVehicleReport init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_vehicleReport, a3);

  return v7;
}

- (BOOL)isRKEFunctionSupported:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[NFVehicleReport vehicleReport](self, "vehicleReport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRKEFunctionSupported:", v4);

  return v6;
}

- (id)getSupportedRKEFunctions
{
  void *v2;
  void *v3;

  -[NFVehicleReport vehicleReport](self, "vehicleReport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getSupportedRKEFunctions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isRKEFunctionInProgress:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[NFVehicleReport vehicleReport](self, "vehicleReport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRKEFunctionInProgress:", v4);

  return v6;
}

- (id)getRKEFunctionsInProgress
{
  void *v2;
  void *v3;

  -[NFVehicleReport vehicleReport](self, "vehicleReport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getRKEFunctionsInProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getStatusForRKEFunction:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NFVehicleReport vehicleReport](self, "vehicleReport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getStatusForRKEFunction:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NFVehicleReport vehicleReport](self, "vehicleReport");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("report"));

}

- (NFVehicleReport)initWithCoder:(id)a3
{
  id v4;
  NFVehicleReport *v5;
  uint64_t v6;
  SESVehicleReport *vehicleReport;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFVehicleReport;
  v5 = -[NFVehicleReport init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("report"));
    v6 = objc_claimAutoreleasedReturnValue();
    vehicleReport = v5->_vehicleReport;
    v5->_vehicleReport = (SESVehicleReport *)v6;

  }
  return v5;
}

- (NSString)keyIdentifier
{
  void *v2;
  void *v3;

  -[NFVehicleReport vehicleReport](self, "vehicleReport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[NFVehicleReport vehicleReport](self, "vehicleReport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SESVehicleReport)vehicleReport
{
  return self->_vehicleReport;
}

- (void)setVehicleReport:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleReport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleReport, 0);
}

@end
