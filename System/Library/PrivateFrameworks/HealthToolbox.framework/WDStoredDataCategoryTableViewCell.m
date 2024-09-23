@implementation WDStoredDataCategoryTableViewCell

- (void)setDisplayType:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_displayType, a3);
  v5 = a3;
  objc_msgSend(v5, "localization");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDStoredDataCategoryTableViewCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

}

- (HKDisplayCategory)category
{
  return (HKDisplayCategory *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setCategory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
