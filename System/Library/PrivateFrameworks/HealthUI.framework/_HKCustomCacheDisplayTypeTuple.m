@implementation _HKCustomCacheDisplayTypeTuple

- (_HKCustomCacheDisplayTypeTuple)initWithCustomCache:(id)a3 displayType:(id)a4
{
  id v7;
  id v8;
  _HKCustomCacheDisplayTypeTuple *v9;
  _HKCustomCacheDisplayTypeTuple *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKCustomCacheDisplayTypeTuple;
  v9 = -[_HKCustomCacheDisplayTypeTuple init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_chartCache, a3);
    objc_storeStrong((id *)&v10->_displayType, a4);
  }

  return v10;
}

- (HKChartCache)chartCache
{
  return self->_chartCache;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_chartCache, 0);
}

@end
