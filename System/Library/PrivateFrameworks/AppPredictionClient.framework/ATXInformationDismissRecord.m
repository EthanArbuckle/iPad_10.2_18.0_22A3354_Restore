@implementation ATXInformationDismissRecord

- (ATXInformationDismissRecord)initWithWidgetBundleId:(id)a3 criterion:(id)a4 blockWidgetUntilDate:(id)a5 blockCriterionUntilDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ATXInformationDismissRecord *v14;
  uint64_t v15;
  NSString *widgetBundleId;
  uint64_t v17;
  NSString *criterion;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ATXInformationDismissRecord;
  v14 = -[ATXInformationDismissRecord init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    widgetBundleId = v14->_widgetBundleId;
    v14->_widgetBundleId = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    criterion = v14->_criterion;
    v14->_criterion = (NSString *)v17;

    objc_storeStrong((id *)&v14->_blockWidgetUntilDate, a5);
    objc_storeStrong((id *)&v14->_blockCriterionUntilDate, a6);
  }

  return v14;
}

- (NSString)widgetBundleId
{
  return self->_widgetBundleId;
}

- (NSString)criterion
{
  return self->_criterion;
}

- (NSDate)blockWidgetUntilDate
{
  return self->_blockWidgetUntilDate;
}

- (NSDate)blockCriterionUntilDate
{
  return self->_blockCriterionUntilDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockCriterionUntilDate, 0);
  objc_storeStrong((id *)&self->_blockWidgetUntilDate, 0);
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_widgetBundleId, 0);
}

@end
