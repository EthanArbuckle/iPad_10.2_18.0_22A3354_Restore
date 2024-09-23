@implementation ACUISActivitySceneDescriptor

- (ACUISActivitySceneDescriptor)initWithActivitySceneDescriptor:(id)a3 acActivityDescriptor:(id)a4
{
  id v6;
  id v7;
  ACUISActivitySceneDescriptor *v8;
  uint64_t v9;
  NSData *activityDescriptorData;
  unint64_t v11;
  uint64_t v12;
  ACUISActivityMetricsRequest *v13;
  void *v14;
  uint64_t v15;
  ACUISActivityMetricsRequest *metricsRequest;
  uint64_t v17;
  NSString *payloadIdentifier;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ACUISActivitySceneDescriptor;
  v8 = -[ACUISActivitySceneDescriptor init](&v20, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "activityDescriptorData");
    v9 = objc_claimAutoreleasedReturnValue();
    activityDescriptorData = v8->_activityDescriptorData;
    v8->_activityDescriptorData = (NSData *)v9;

    v11 = objc_msgSend(v6, "activitySceneType");
    if (v11 >= 4)
      v12 = 1;
    else
      v12 = v11;
    v8->_activitySceneType = v12;
    objc_storeStrong((id *)&v8->_activityDescriptor, a4);
    v13 = [ACUISActivityMetricsRequest alloc];
    objc_msgSend(v6, "metricsRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ACUISActivityMetricsRequest _initWithMetricsRequest:](v13, "_initWithMetricsRequest:", v14);
    metricsRequest = v8->_metricsRequest;
    v8->_metricsRequest = (ACUISActivityMetricsRequest *)v15;

    objc_msgSend(v6, "payloadID");
    v17 = objc_claimAutoreleasedReturnValue();
    payloadIdentifier = v8->_payloadIdentifier;
    v8->_payloadIdentifier = (NSString *)v17;

  }
  return v8;
}

- (ACUISActivitySceneDescriptor)initWithActivityDescriptor:(id)a3 payloadIdentifier:(id)a4 activitySceneType:(int64_t)a5 metricsRequest:(id)a6
{
  id v10;
  id v11;
  ACUISActivitySceneDescriptor *v12;
  uint64_t v13;
  NSData *activityDescriptorData;
  uint64_t v15;
  NSString *payloadIdentifier;
  objc_super v18;

  v10 = a3;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ACUISActivitySceneDescriptor;
  v12 = -[ACUISActivitySceneDescriptor init](&v18, sel_init);
  if (v12)
  {
    objc_msgSend(v10, "descriptorData");
    v13 = objc_claimAutoreleasedReturnValue();
    activityDescriptorData = v12->_activityDescriptorData;
    v12->_activityDescriptorData = (NSData *)v13;

    v12->_activitySceneType = a5;
    objc_storeStrong((id *)&v12->_activityDescriptor, a3);
    objc_storeStrong((id *)&v12->_metricsRequest, a6);
    v15 = -[NSString copy](v12->_payloadIdentifier, "copy");
    payloadIdentifier = v12->_payloadIdentifier;
    v12->_payloadIdentifier = (NSString *)v15;

  }
  return v12;
}

- (NSString)activityIdentifier
{
  return (NSString *)-[ACActivityDescriptor activityIdentifier](self->_activityDescriptor, "activityIdentifier");
}

- (ACUISActivitySceneMetrics)metrics
{
  _BOOL4 v2;
  ACUISActivitySceneMetrics *v3;
  double v4;
  double v5;

  v2 = -[ACUISActivitySceneDescriptor useFallbackMetrics](self, "useFallbackMetrics");
  v3 = [ACUISActivitySceneMetrics alloc];
  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v2)
  {
    v4 = 370.0;
    v5 = 200.0;
  }
  return -[ACUISActivitySceneMetrics initWithSize:cornerRadius:](v3, "initWithSize:cornerRadius:", v4, v5, 12.0);
}

- (id)_activitySceneDescriptor
{
  _TtC18ActivityUIServices23ActivitySceneDescriptor *v3;
  NSData *activityDescriptorData;
  int64_t activitySceneType;
  void *v6;
  _TtC18ActivityUIServices23ActivitySceneDescriptor *v7;

  v3 = [_TtC18ActivityUIServices23ActivitySceneDescriptor alloc];
  activityDescriptorData = self->_activityDescriptorData;
  if (self->_activitySceneType >= 4uLL)
    activitySceneType = 1;
  else
    activitySceneType = self->_activitySceneType;
  -[ACUISActivityMetricsRequest _activityMetricsRequest](self->_metricsRequest, "_activityMetricsRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ActivitySceneDescriptor initWithActivitySceneType:activityDescriptor:metricsRequest:payloadID:](v3, "initWithActivitySceneType:activityDescriptor:metricsRequest:payloadID:", activitySceneType, activityDescriptorData, v6, self->_payloadIdentifier);

  return v7;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (int64_t)activitySceneType
{
  return self->_activitySceneType;
}

- (ACActivityDescriptor)activityDescriptor
{
  return self->_activityDescriptor;
}

- (ACUISActivityMetricsRequest)metricsRequest
{
  return self->_metricsRequest;
}

- (NSData)activityDescriptorData
{
  return self->_activityDescriptorData;
}

- (BOOL)useFallbackMetrics
{
  return self->_useFallbackMetrics;
}

- (void)setUseFallbackMetrics:(BOOL)a3
{
  self->_useFallbackMetrics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_metricsRequest, 0);
  objc_storeStrong((id *)&self->_activityDescriptor, 0);
  objc_storeStrong((id *)&self->_activityDescriptorData, 0);
}

@end
