@implementation MKClient

- (MKClient)initWithHostname:(id)a3 brand:(id)a4 model:(id)a5 name:(id)a6 os:(id)a7 version:(id)a8 locale:(id)a9 inputMethodLanguages:(id)a10 activatedCellularPlans:(unint64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  MKClient *v25;
  MKClient *v26;
  objc_super v28;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v28.receiver = self;
  v28.super_class = (Class)MKClient;
  v25 = -[MKClient init](&v28, sel_init);
  v26 = v25;
  if (v25)
  {
    -[MKClient setHostname:](v25, "setHostname:", v17);
    -[MKClient setBrand:](v26, "setBrand:", v18);
    -[MKClient setModel:](v26, "setModel:", v19);
    -[MKClient setName:](v26, "setName:", v20);
    -[MKClient setOs:](v26, "setOs:", v21);
    -[MKClient setVersion:](v26, "setVersion:", v22);
    -[MKClient setLocale:](v26, "setLocale:", v23);
    -[MKClient setInputMethodLanguages:](v26, "setInputMethodLanguages:", v24);
    -[MKClient setActivatedCellularPlans:](v26, "setActivatedCellularPlans:", a11);
  }

  return v26;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)brand
{
  return self->_brand;
}

- (void)setBrand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)os
{
  return self->_os;
}

- (void)setOs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)inputMethodLanguages
{
  return self->_inputMethodLanguages;
}

- (void)setInputMethodLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_inputMethodLanguages, a3);
}

- (unint64_t)activatedCellularPlans
{
  return self->_activatedCellularPlans;
}

- (void)setActivatedCellularPlans:(unint64_t)a3
{
  self->_activatedCellularPlans = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMethodLanguages, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_os, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
}

@end
