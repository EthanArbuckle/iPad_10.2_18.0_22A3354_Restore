@implementation PKPaletteTapToRadarCommandExecution

+ (PKPaletteTapToRadarCommandExecution)commandExecutionWithConfiguration:(id)a3
{
  id v3;
  __objc2_class **v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a3;
  if ((_UIApplicationIsExtension() & 1) != 0)
  {
    v4 = off_1E776F8B8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.ScreenshotServicesService"));

    v4 = off_1E776F8D8;
    if (v7)
      v4 = off_1E776F8E0;
  }
  v8 = (void *)objc_msgSend(objc_alloc(*v4), "initWithConfiguration:", v3);

  return (PKPaletteTapToRadarCommandExecution *)v8;
}

- (PKPaletteTapToRadarCommandExecution)initWithConfiguration:(id)a3
{
  id v5;
  PKPaletteTapToRadarCommandExecution *v6;
  PKPaletteTapToRadarCommandExecution *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaletteTapToRadarCommandExecution;
  v6 = -[PKPaletteTapToRadarCommandExecution init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (PKPaletteTapToRadarConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
