@implementation AMDCommandLineOption

- (AMDCommandLineOption)initWithName:(id)a3 withDefaultValue:(id)a4 withHelpText:(id)a5 withShortName:(id)a6 andIsBoolFlag:(BOOL)a7
{
  AMDCommandLineOption *v7;
  AMDCommandLineOption *v13;
  objc_super v14;
  BOOL v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  AMDCommandLineOption *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = 0;
  objc_storeStrong(&v17, a5);
  v16 = 0;
  objc_storeStrong(&v16, a6);
  v15 = a7;
  v7 = v20;
  v20 = 0;
  v14.receiver = v7;
  v14.super_class = (Class)AMDCommandLineOption;
  v20 = -[AMDCommandLineOption init](&v14, sel_init);
  objc_storeStrong((id *)&v20, v20);
  -[AMDCommandLineOption setName:](v20, "setName:", location[0]);
  -[AMDCommandLineOption setDefaultValue:](v20, "setDefaultValue:", v18);
  -[AMDCommandLineOption setHelpText:](v20, "setHelpText:", v17);
  -[AMDCommandLineOption setIsBool:](v20, "setIsBool:", v15);
  -[AMDCommandLineOption setShortName:](v20, "setShortName:", v16);
  v13 = v20;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v20, 0);
  return v13;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
  objc_storeStrong(&self->_defaultValue, a3);
}

- (NSString)helpText
{
  return self->_helpText;
}

- (void)setHelpText:(id)a3
{
  objc_storeStrong((id *)&self->_helpText, a3);
}

- (BOOL)isBool
{
  return self->_isBool;
}

- (void)setIsBool:(BOOL)a3
{
  self->_isBool = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)shortName
{
  return self->_shortName;
}

- (void)setShortName:(id)a3
{
  objc_storeStrong((id *)&self->_shortName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_helpText, 0);
  objc_storeStrong(&self->_defaultValue, 0);
}

@end
