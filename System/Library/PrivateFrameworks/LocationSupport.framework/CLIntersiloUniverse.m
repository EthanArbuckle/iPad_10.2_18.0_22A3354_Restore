@implementation CLIntersiloUniverse

+ (id)newSharedVendorUniverseWithSilo:(id)a3
{
  id v3;
  CLIntersiloUniverse *v4;
  void *v5;
  CLIntersiloUniverse *v6;

  v3 = a3;
  v4 = [CLIntersiloUniverse alloc];
  +[CLServiceVendor sharedInstance](CLServiceVendor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CLIntersiloUniverse initWithSilo:vendor:](v4, "initWithSilo:vendor:", v3, v5);

  return v6;
}

- (CLIntersiloUniverse)initWithSilo:(id)a3 vendor:(id)a4
{
  id v7;
  id v8;
  CLIntersiloUniverse *v9;
  CLIntersiloUniverse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CLIntersiloUniverse;
  v9 = -[CLIntersiloUniverse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_silo, a3);
    objc_storeStrong((id *)&v10->_vendor, a4);
  }

  return v10;
}

- (CLServiceVendor)vendor
{
  return self->_vendor;
}

- (CLSilo)silo
{
  return self->_silo;
}

+ (id)newIsolatedUniverseWithOnlySilo:(id)a3
{
  id v3;
  CLIntersiloUniverse *v4;
  id v5;
  CLIntersiloUniverse *v6;

  v3 = a3;
  v4 = [CLIntersiloUniverse alloc];
  v5 = objc_alloc(MEMORY[0x1E0CB38C8]);
  v6 = -[CLIntersiloUniverse initWithSilo:vendor:](v4, "initWithSilo:vendor:", v3, v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_silo, 0);
}

@end
