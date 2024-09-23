@implementation CSUDetectionPrintNetworkOutput

- (id)detectionPrintFeatureForTapPointName:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_detectionPrintPerTapPoint, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_objectForKeyedSubscript_(self->_detectionPrintPerTapPoint, v11, (uint64_t)v6, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }
  else
  {
    if (a4)
    {
      objc_msgSend_errorForInvalidArgument_named_(CSUError, v11, (uint64_t)v6, (uint64_t)CFSTR("DetectionPrintTapPointName"), v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0;
  }
}

- (CSUDetectionPrintNetworkOutput)initWithDetectionPrintPerTapPoint:(id)a3
{
  id v5;
  CSUDetectionPrintNetworkOutput *v6;
  CSUDetectionPrintNetworkOutput *v7;
  CSUDetectionPrintNetworkOutput *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUDetectionPrintNetworkOutput;
  v6 = -[CSUDetectionPrintNetworkOutput init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_detectionPrintPerTapPoint, a3);
    v8 = v7;
  }

  return v7;
}

- (NSArray)availableTapPointNames
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSArray *)objc_msgSend_allKeys(self->_detectionPrintPerTapPoint, a2, v2, v3, v4);
}

- (NSDictionary)detectionPrintPerTapPoint
{
  return self->_detectionPrintPerTapPoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionPrintPerTapPoint, 0);
}

@end
