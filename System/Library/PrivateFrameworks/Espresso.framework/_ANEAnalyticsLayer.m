@implementation _ANEAnalyticsLayer

- (_ANEAnalyticsLayer)initWithName:(id)a3 weight:(id)a4
{
  id v7;
  id v8;
  _ANEAnalyticsLayer *v9;
  _ANEAnalyticsLayer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_ANEAnalyticsLayer;
  v9 = -[_ANEAnalyticsLayer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layerName, a3);
    objc_storeStrong((id *)&v10->_weight, a4);
  }

  return v10;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[_ANEAnalyticsLayer layerName](self, "layerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v3;
  v8 = CFSTR("weight");
  -[_ANEAnalyticsLayer weight](self, "weight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)layerName
{
  return self->_layerName;
}

- (NSNumber)weight
{
  return self->_weight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weight, 0);
  objc_storeStrong((id *)&self->_layerName, 0);
}

+ (id)objectWithName:(id)a3 weight:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:weight:", v6, v7);

  return v8;
}

@end
