@implementation _DASWidgetInfo

- (id)_initWithBudgetID:(id)a3 extensionBundleID:(id)a4
{
  id v6;
  id v7;
  _DASWidgetInfo *v8;
  uint64_t v9;
  NSString *budgetID;
  uint64_t v11;
  NSString *extensionBundleID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_DASWidgetInfo;
  v8 = -[_DASWidgetInfo init](&v14, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = objc_msgSend(v6, "copy");
      budgetID = v8->_budgetID;
      v8->_budgetID = (NSString *)v9;

    }
    v11 = objc_msgSend(v7, "copy");
    extensionBundleID = v8->_extensionBundleID;
    v8->_extensionBundleID = (NSString *)v11;

  }
  return v8;
}

- (NSString)widgetID
{
  NSString *v3;
  NSString *v4;
  NSString *v5;

  v3 = self->_budgetID;
  v4 = v3;
  if (self->_budgetID)
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (void)setWidgetID:(id)a3
{
  NSString *v4;
  NSString *budgetID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  budgetID = self->_budgetID;
  self->_budgetID = v4;

}

- (NSString)extensionBundleID
{
  return self->_extensionBundleID;
}

- (NSString)budgetID
{
  return self->_budgetID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budgetID, 0);
  objc_storeStrong((id *)&self->_extensionBundleID, 0);
}

@end
