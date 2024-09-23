@implementation HMMTRHAPService

- (HMMTRHAPService)initWithType:(id)a3 instanceID:(id)a4 parsedCharacteristics:(id)a5 serviceProperties:(unint64_t)a6 linkedServices:(id)a7 endpoint:(id)a8
{
  id v15;
  HMMTRHAPService *v16;
  HMMTRHAPService *v17;
  objc_super v19;

  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)HMMTRHAPService;
  v16 = -[HAPService initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:](&v19, sel_initWithType_instanceID_parsedCharacteristics_serviceProperties_linkedServices_, a3, a4, a5, a6, a7);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->_endpoint, a8);

  return v17;
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
}

+ (id)chipPluginServiceForCharacteristic:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
