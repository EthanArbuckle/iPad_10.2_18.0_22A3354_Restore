@implementation HKTimeScopeControl

+ (HKTimeScopeControl)controlWithFrame:(CGRect)a3 timeScopes:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  _HKTimeScopeControlBar *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v9 = -[_HKTimeScopeControlBar initWithFrame:timeScopes:]([_HKTimeScopeControlBar alloc], "initWithFrame:timeScopes:", v8, x, y, width, height);

  return (HKTimeScopeControl *)v9;
}

- (HKTimeScopeControl)initWithFrame:(CGRect)a3 timeScopes:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  HKTimeScopeControl *v11;
  HKTimeScopeControl *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKTimeScopeControl;
  v11 = -[HKTimeScopeControl initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
    objc_storeStrong((id *)&v11->_timeScopes, a4);

  return v12;
}

- (int64_t)_timeScopeForIndex:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_timeScopes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)_indexForTimeScope:(int64_t)a3
{
  NSArray *timeScopes;
  void *v4;
  int64_t v5;

  timeScopes = self->_timeScopes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray indexOfObject:](timeScopes, "indexOfObject:", v4);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return v5;
}

- (double)minimumWidth
{
  return 0.0;
}

- (int64_t)selectedTimeScope
{
  return self->_selectedTimeScope;
}

- (void)setSelectedTimeScope:(int64_t)a3
{
  self->_selectedTimeScope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeScopes, 0);
}

@end
