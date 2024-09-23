@implementation CPTripPreviewTextConfiguration

- (CPTripPreviewTextConfiguration)initWithStartButtonTitle:(NSString *)startButtonTitle additionalRoutesButtonTitle:(NSString *)additionalRoutesButtonTitle overviewButtonTitle:(NSString *)overviewButtonTitle
{
  NSString *v9;
  NSString *v10;
  NSString *v11;
  CPTripPreviewTextConfiguration *v12;
  CPTripPreviewTextConfiguration *v13;
  objc_super v15;

  v9 = startButtonTitle;
  v10 = additionalRoutesButtonTitle;
  v11 = overviewButtonTitle;
  v15.receiver = self;
  v15.super_class = (Class)CPTripPreviewTextConfiguration;
  v12 = -[CPTripPreviewTextConfiguration init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_startButtonTitle, startButtonTitle);
    objc_storeStrong((id *)&v13->_additionalRoutesButtonTitle, additionalRoutesButtonTitle);
    objc_storeStrong((id *)&v13->_overviewButtonTitle, overviewButtonTitle);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPTripPreviewTextConfiguration)initWithCoder:(id)a3
{
  id v4;
  CPTripPreviewTextConfiguration *v5;
  uint64_t v6;
  NSString *startButtonTitle;
  uint64_t v8;
  NSString *additionalRoutesButtonTitle;
  uint64_t v10;
  NSString *overviewButtonTitle;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPTripPreviewTextConfiguration;
  v5 = -[CPTripPreviewTextConfiguration init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPTripPreviewTextConfigurationStartButtonTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    startButtonTitle = v5->_startButtonTitle;
    v5->_startButtonTitle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPTripPreviewTextConfigurationAdditionalRoutesButtonTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    additionalRoutesButtonTitle = v5->_additionalRoutesButtonTitle;
    v5->_additionalRoutesButtonTitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPTripPreviewTextConfigurationOverviewButtonTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    overviewButtonTitle = v5->_overviewButtonTitle;
    v5->_overviewButtonTitle = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CPTripPreviewTextConfiguration startButtonTitle](self, "startButtonTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CPTripPreviewTextConfigurationStartButtonTitle"));

  -[CPTripPreviewTextConfiguration additionalRoutesButtonTitle](self, "additionalRoutesButtonTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CPTripPreviewTextConfigurationAdditionalRoutesButtonTitle"));

  -[CPTripPreviewTextConfiguration overviewButtonTitle](self, "overviewButtonTitle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("CPTripPreviewTextConfigurationOverviewButtonTitle"));

}

- (NSString)startButtonTitle
{
  return self->_startButtonTitle;
}

- (NSString)additionalRoutesButtonTitle
{
  return self->_additionalRoutesButtonTitle;
}

- (NSString)overviewButtonTitle
{
  return self->_overviewButtonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overviewButtonTitle, 0);
  objc_storeStrong((id *)&self->_additionalRoutesButtonTitle, 0);
  objc_storeStrong((id *)&self->_startButtonTitle, 0);
}

@end
