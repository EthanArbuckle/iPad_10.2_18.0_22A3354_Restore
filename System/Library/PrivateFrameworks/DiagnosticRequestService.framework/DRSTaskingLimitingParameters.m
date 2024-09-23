@implementation DRSTaskingLimitingParameters

- (DRSTaskingLimitingParameters)initWithAcceptConfigCountCap:(unint64_t)a3 taskingHysteresisInterval:(double)a4
{
  DRSTaskingLimitingParameters *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DRSTaskingLimitingParameters;
  result = -[DRSTaskingLimitingParameters init](&v7, sel_init);
  if (result)
  {
    result->_acceptedConfigCountCap = a3;
    result->_taskingHysteresisInterval = a4;
  }
  return result;
}

+ (id)defaultDeviceParameters
{
  void *v3;
  void *v4;

  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parametersForPlatform:isInternal:isSeed:isCarrier:taskingIsEnabled:", objc_msgSend(v3, "platform"), objc_msgSend(v3, "isInternal"), objc_msgSend(v3, "isSeed"), objc_msgSend(v3, "isCarrier"), objc_msgSend(v3, "isTaskingEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_disabledParameters
{
  if (_disabledParameters_onceToken != -1)
    dispatch_once(&_disabledParameters_onceToken, &__block_literal_global_7);
  return (id)_disabledParameters_parameters;
}

void __51__DRSTaskingLimitingParameters__disabledParameters__block_invoke()
{
  DRSTaskingLimitingParameters *v0;
  void *v1;

  v0 = -[DRSTaskingLimitingParameters initWithAcceptConfigCountCap:taskingHysteresisInterval:]([DRSTaskingLimitingParameters alloc], "initWithAcceptConfigCountCap:taskingHysteresisInterval:", 0, 3600.0);
  v1 = (void *)_disabledParameters_parameters;
  _disabledParameters_parameters = (uint64_t)v0;

}

+ (id)_internalParameters
{
  if (_internalParameters_onceToken != -1)
    dispatch_once(&_internalParameters_onceToken, &__block_literal_global_148);
  return (id)_internalParameters_parameters;
}

void __51__DRSTaskingLimitingParameters__internalParameters__block_invoke()
{
  DRSTaskingLimitingParameters *v0;
  void *v1;

  v0 = -[DRSTaskingLimitingParameters initWithAcceptConfigCountCap:taskingHysteresisInterval:]([DRSTaskingLimitingParameters alloc], "initWithAcceptConfigCountCap:taskingHysteresisInterval:", 5, 3600.0);
  v1 = (void *)_internalParameters_parameters;
  _internalParameters_parameters = (uint64_t)v0;

}

+ (id)_seedParameters
{
  if (_seedParameters_onceToken != -1)
    dispatch_once(&_seedParameters_onceToken, &__block_literal_global_149);
  return (id)_seedParameters_parameters;
}

void __47__DRSTaskingLimitingParameters__seedParameters__block_invoke()
{
  DRSTaskingLimitingParameters *v0;
  void *v1;

  v0 = -[DRSTaskingLimitingParameters initWithAcceptConfigCountCap:taskingHysteresisInterval:]([DRSTaskingLimitingParameters alloc], "initWithAcceptConfigCountCap:taskingHysteresisInterval:", 2, 3600.0);
  v1 = (void *)_seedParameters_parameters;
  _seedParameters_parameters = (uint64_t)v0;

}

+ (id)_customerParameters
{
  if (_customerParameters_onceToken != -1)
    dispatch_once(&_customerParameters_onceToken, &__block_literal_global_150);
  return (id)_customerParameters_parameters;
}

void __51__DRSTaskingLimitingParameters__customerParameters__block_invoke()
{
  DRSTaskingLimitingParameters *v0;
  void *v1;

  v0 = -[DRSTaskingLimitingParameters initWithAcceptConfigCountCap:taskingHysteresisInterval:]([DRSTaskingLimitingParameters alloc], "initWithAcceptConfigCountCap:taskingHysteresisInterval:", 2, 3600.0);
  v1 = (void *)_customerParameters_parameters;
  _customerParameters_parameters = (uint64_t)v0;

}

+ (id)parametersForPlatform:(unsigned __int8)a3 isInternal:(BOOL)a4 isSeed:(BOOL)a5 isCarrier:(BOOL)a6 taskingIsEnabled:(BOOL)a7
{
  void *v7;

  if (a7 && a3 != 5 && a3 && !a6)
  {
    if (a4)
    {
      objc_msgSend(a1, "_internalParameters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a5)
        objc_msgSend(a1, "_seedParameters");
      else
        objc_msgSend(a1, "_customerParameters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(a1, "_disabledParameters", a3, a4, a5, a6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  DRSTaskingLimitingParameters *v4;
  DRSTaskingLimitingParameters *v5;
  DRSTaskingLimitingParameters *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  BOOL v11;

  v4 = (DRSTaskingLimitingParameters *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[DRSTaskingLimitingParameters taskingHysteresisInterval](v6, "taskingHysteresisInterval");
    v8 = v7;
    -[DRSTaskingLimitingParameters taskingHysteresisInterval](self, "taskingHysteresisInterval");
    if (v8 == v9)
    {
      v10 = -[DRSTaskingLimitingParameters acceptedConfigCountCap](v6, "acceptedConfigCountCap");
      v11 = v10 == -[DRSTaskingLimitingParameters acceptedConfigCountCap](self, "acceptedConfigCountCap");
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (double)perTeamTaskingHysteresisInterval
{
  double v2;

  -[DRSTaskingLimitingParameters taskingHysteresisInterval](self, "taskingHysteresisInterval");
  return v2 * 5.0;
}

- (unint64_t)acceptedConfigCountCap
{
  return self->_acceptedConfigCountCap;
}

- (double)taskingHysteresisInterval
{
  return self->_taskingHysteresisInterval;
}

@end
