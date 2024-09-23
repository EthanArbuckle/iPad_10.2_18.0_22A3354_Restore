@implementation INRideVehicle(WFNaming)

- (id)wfName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "manufacturer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registrationPlate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ %@ - (%@)"), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
