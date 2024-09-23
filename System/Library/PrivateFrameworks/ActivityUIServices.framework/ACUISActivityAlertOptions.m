@implementation ACUISActivityAlertOptions

- (ACUISActivityAlertOptions)initWithAlertConfiguration:(id)a3 presentationOptions:(id)a4
{
  id v7;
  id v8;
  ACUISActivityAlertOptions *v9;
  ACUISActivityAlertOptions *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ACUISActivityAlertOptions;
  v9 = -[ACUISActivityAlertOptions init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_alertConfiguration, a3);
    objc_storeStrong((id *)&v10->_presentationOptions, a4);
  }

  return v10;
}

- (TLAlertConfiguration)alertConfiguration
{
  return self->_alertConfiguration;
}

- (ACAlertPresentationOptions)presentationOptions
{
  return self->_presentationOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationOptions, 0);
  objc_storeStrong((id *)&self->_alertConfiguration, 0);
}

@end
