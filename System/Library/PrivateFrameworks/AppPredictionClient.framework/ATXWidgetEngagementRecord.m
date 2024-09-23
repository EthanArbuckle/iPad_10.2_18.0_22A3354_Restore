@implementation ATXWidgetEngagementRecord

- (ATXWidgetEngagementRecord)initWithDate:(id)a3 type:(int64_t)a4
{
  return -[ATXWidgetEngagementRecord initWithDate:type:widgetBundleId:containerBundleIdentifier:widgetKind:layoutSize:](self, "initWithDate:type:widgetBundleId:containerBundleIdentifier:widgetKind:layoutSize:", a3, a4, 0, 0, 0, 0);
}

- (ATXWidgetEngagementRecord)initWithDate:(id)a3 type:(int64_t)a4 widgetBundleId:(id)a5 containerBundleIdentifier:(id)a6 widgetKind:(id)a7 layoutSize:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  ATXWidgetEngagementRecord *v18;
  ATXWidgetEngagementRecord *v19;
  objc_super v22;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ATXWidgetEngagementRecord;
  v18 = -[ATXWidgetEngagementRecord init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_date, a3);
    v19->_type = a4;
    objc_storeStrong((id *)&v19->_widgetBundleId, a5);
    objc_storeStrong((id *)&v19->_containerBundleIdentifier, a6);
    objc_storeStrong((id *)&v19->_widgetKind, a7);
    v19->_widgetFamily = CHSWidgetFamilyFromATXStackLayoutSize(a8);
  }

  return v19;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)widgetBundleId
{
  return self->_widgetBundleId;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (int64_t)widgetFamily
{
  return self->_widgetFamily;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetBundleId, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
