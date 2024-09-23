@implementation PHAdjustmentDataResult

- (BOOL)containsValidData
{
  void *v2;
  BOOL v3;

  -[PHAdjustmentDataResult adjustmentData](self, "adjustmentData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)allowedInfoKeys
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHAdjustmentDataResult;
  -[PHCompositeMediaResult allowedInfoKeys](&v5, sel_allowedInfoKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("PHAdjustmentDataKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAdjustmentData:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._mutableInfo, "setObject:forKeyedSubscript:", a3, CFSTR("PHAdjustmentDataKey"));
}

- (id)adjustmentData
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mutableInfo, "objectForKeyedSubscript:", CFSTR("PHAdjustmentDataKey"));
}

@end
