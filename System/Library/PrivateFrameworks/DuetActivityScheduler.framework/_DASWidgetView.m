@implementation _DASWidgetView

- (_DASWidgetView)initWithViewID:(id)a3 budgetID:(id)a4 extensionBundleID:(id)a5 from:(id)a6 to:(id)a7
{
  id v12;
  id v13;
  id v14;
  _DASWidgetView *v15;
  uint64_t v16;
  NSString *viewID;
  uint64_t v18;
  NSDate *startDate;
  uint64_t v20;
  NSDate *endDate;
  objc_super v23;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)_DASWidgetView;
  v15 = -[_DASWidgetInfo _initWithBudgetID:extensionBundleID:](&v23, sel__initWithBudgetID_extensionBundleID_, a4, a5);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    viewID = v15->_viewID;
    v15->_viewID = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    startDate = v15->_startDate;
    v15->_startDate = (NSDate *)v18;

    v20 = objc_msgSend(v14, "copy");
    endDate = v15->_endDate;
    v15->_endDate = (NSDate *)v20;

  }
  return v15;
}

+ (id)viewFrom:(id)a3 to:(id)a4 forWidgetID:(id)a5
{
  id v7;
  id v8;
  id v9;
  _DASWidgetView *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_DASWidgetView initWithViewID:budgetID:extensionBundleID:from:to:]([_DASWidgetView alloc], "initWithViewID:budgetID:extensionBundleID:from:to:", v7, v7, CFSTR("unknown"), v9, v8);

  return v10;
}

- (NSString)viewID
{
  return self->_viewID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BOOL)inStack
{
  return self->_inStack;
}

- (void)setInStack:(BOOL)a3
{
  self->_inStack = a3;
}

- (int64_t)pageID
{
  return self->_pageID;
}

- (void)setPageID:(int64_t)a3
{
  self->_pageID = a3;
}

- (double)timeUntilContentExpiration
{
  return self->_timeUntilContentExpiration;
}

- (void)setTimeUntilContentExpiration:(double)a3
{
  self->_timeUntilContentExpiration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_viewID, 0);
}

@end
