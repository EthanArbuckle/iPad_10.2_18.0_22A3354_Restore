@implementation WDClinicalSettingsViewAnalyticsDataViewControllerFileCell

- (WDClinicalSettingsViewAnalyticsDataViewControllerFileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDClinicalSettingsViewAnalyticsDataViewControllerFileCell *v4;
  WDClinicalSettingsViewAnalyticsDataViewControllerFileCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDClinicalSettingsViewAnalyticsDataViewControllerFileCell;
  v4 = -[WDClinicalSettingsViewAnalyticsDataViewControllerFileCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[WDClinicalSettingsViewAnalyticsDataViewControllerFileCell setAccessoryType:](v4, "setAccessoryType:", 1);
  return v5;
}

- (void)setFileURL:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_fileURL, a3);
  v5 = a3;
  objc_msgSend(v5, "lastPathComponent");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[WDClinicalSettingsViewAnalyticsDataViewControllerFileCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalSettingsViewAnalyticsDataViewControllerFileCell fileURL](self, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
