@implementation DTLocationSimulationService

+ (void)registerCapabilities:(id)a3
{
  id v4;

  v4 = a3;
  if (NSClassFromString(CFSTR("CLSimulationManager")))
    objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.LocationSimulation"), 1, a1);

}

- (DTLocationSimulationService)initWithChannel:(id)a3
{
  id v4;
  DTLocationSimulationService *v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DTLocationSimulationService;
  v5 = -[DTXService initWithChannel:](&v10, sel_initWithChannel_, v4);
  if (v5)
  {
    objc_initWeak(&location, v5);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_222B80FC0;
    v7[3] = &unk_24EB28000;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "registerDisconnectHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)simulateLocationWithLatitude:(id)a3 longitude:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;

  v5 = (objc_class *)MEMORY[0x24BDBFA80];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  objc_msgSend(v7, "doubleValue");
  v10 = v9;

  objc_msgSend(v6, "doubleValue");
  v12 = v11;

  v14 = (id)objc_msgSend(v8, "initWithLatitude:longitude:", v10, v12);
  v13 = objc_alloc_init(MEMORY[0x24BDBFAE8]);
  objc_msgSend(v13, "clearSimulatedLocations");
  objc_msgSend(v13, "appendSimulatedLocation:", v14);
  objc_msgSend(v13, "startLocationSimulation");

}

- (void)stopLocationSimulation
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDBFAE8]);
  objc_msgSend(v2, "clearSimulatedLocations");
  objc_msgSend(v2, "stopLocationSimulation");

}

@end
