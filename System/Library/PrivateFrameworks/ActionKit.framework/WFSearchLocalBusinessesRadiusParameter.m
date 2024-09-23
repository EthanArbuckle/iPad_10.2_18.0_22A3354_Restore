@implementation WFSearchLocalBusinessesRadiusParameter

- (BOOL)shouldUseMetricSystem
{
  return objc_msgSend(MEMORY[0x24BEC1540], "usesMetricSystemForUnitType:", *MEMORY[0x24BEC19E8]);
}

- (id)defaultSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[WFSearchLocalBusinessesRadiusParameter shouldUseMetricSystem](self, "shouldUseMetricSystem"))
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.5);
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3F18]), "initWithValue:", v4);
  if (-[WFSearchLocalBusinessesRadiusParameter shouldUseMetricSystem](self, "shouldUseMetricSystem"))
    objc_msgSend(MEMORY[0x24BDD1928], "kilometers");
  else
    objc_msgSend(MEMORY[0x24BDD1928], "miles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BEC3FC0]);
  objc_msgSend(v6, "symbol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithMagnitudeState:unitString:", v5, v8);

  objc_msgSend(v9, "serializedRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
