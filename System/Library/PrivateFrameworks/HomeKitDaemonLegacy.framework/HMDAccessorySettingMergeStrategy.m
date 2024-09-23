@implementation HMDAccessorySettingMergeStrategy

- (HMDAccessorySettingMergeStrategy)initWithMergeStrategy:(id)a3
{
  id v4;
  HMDAccessorySettingMergeStrategy *v5;
  id v6;
  void *v7;
  NSNumber *v8;
  NSNumber *conflictValue;
  id v10;
  void *v11;
  uint64_t v12;
  HMDAccessorySettingMergeStrategy *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDAccessorySettingMergeStrategy;
  v5 = -[HMDAccessorySettingMergeStrategy init](&v15, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      v5->_strategy = 1;
      conflictValue = v5->_conflictValue;
      v5->_conflictValue = v8;
    }
    else
    {
      v10 = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      conflictValue = v11;

      if ((HMFEqualObjects() & 1) != 0)
      {
        v12 = 3;
      }
      else if ((HMFEqualObjects() & 1) != 0)
      {
        v12 = 4;
      }
      else
      {
        if (!HMFEqualObjects())
        {

          v13 = 0;
          goto LABEL_19;
        }
        v12 = 2;
      }
      v5->_strategy = v12;
    }

  }
  v13 = v5;
LABEL_19:

  return v13;
}

- (NSNumber)conflictValue
{
  return self->_conflictValue;
}

- (int64_t)strategy
{
  return self->_strategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictValue, 0);
}

@end
