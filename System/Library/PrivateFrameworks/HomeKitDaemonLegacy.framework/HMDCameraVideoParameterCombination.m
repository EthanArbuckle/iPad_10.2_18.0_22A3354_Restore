@implementation HMDCameraVideoParameterCombination

- (HMDCameraVideoParameterCombination)initWithProfile:(id)a3 level:(id)a4 videoTier:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDCameraVideoParameterCombination *v12;
  HMDCameraVideoParameterCombination *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraVideoParameterCombination;
  v12 = -[HMDCameraVideoParameterCombination init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_profile, a3);
    objc_storeStrong((id *)&v13->_level, a4);
    objc_storeStrong((id *)&v13->_videoTier, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCameraVideoParameterCombination profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoParameterCombination level](self, "level");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoParameterCombination videoTier](self, "videoTier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<profile = %@, level = %@, tier = %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HMDCameraVideoParameterCombination *v4;
  HMDCameraVideoParameterCombination *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (HMDCameraVideoParameterCombination *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMDCameraVideoParameterCombination profile](self, "profile");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraVideoParameterCombination profile](v5, "profile");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[HMDCameraVideoParameterCombination level](self, "level");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraVideoParameterCombination level](v5, "level");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          -[HMDCameraVideoParameterCombination videoTier](self, "videoTier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraVideoParameterCombination videoTier](v5, "videoTier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (HMDH264Profile)profile
{
  return self->_profile;
}

- (HMDH264Level)level
{
  return self->_level;
}

- (HMDCameraVideoTier)videoTier
{
  return self->_videoTier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoTier, 0);
  objc_storeStrong((id *)&self->_level, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
