@implementation AVTimeRangeMark

- (AVTimeRangeMark)initWithStartValue:(float)a3 endValue:(float)a4 identifier:(id)a5 markUIProvider:(id)a6
{
  id v11;
  id v12;
  AVTimeRangeMark *v13;
  AVTimeRangeMark *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AVTimeRangeMark;
  v13 = -[AVTimeRangeMark init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_startValue = a3;
    v13->_endValue = a4;
    objc_storeStrong((id *)&v13->_identifer, a5);
    objc_storeWeak((id *)&v14->_markUIProvider, v12);
  }

  return v14;
}

- (float)startValue
{
  return self->_startValue;
}

- (float)endValue
{
  return self->_endValue;
}

- (NSString)identifer
{
  return self->_identifer;
}

- (AVTimeRangeMarkUIProvider)markUIProvider
{
  return (AVTimeRangeMarkUIProvider *)objc_loadWeakRetained((id *)&self->_markUIProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_markUIProvider);
  objc_storeStrong((id *)&self->_identifer, 0);
}

@end
