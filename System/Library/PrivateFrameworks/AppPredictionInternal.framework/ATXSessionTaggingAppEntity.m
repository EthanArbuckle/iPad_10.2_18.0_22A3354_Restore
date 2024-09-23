@implementation ATXSessionTaggingAppEntity

- (id)entityKey
{
  return (id)objc_msgSend((id)objc_opt_class(), "keyForBundleId:", self->_bundleId);
}

+ (id)keyForBundleId:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ATXModeAppEntity_%@"), a3);
}

+ (id)genreIdForBundleId:(id)a3
{
  id v3;
  void *v4;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.calculator")) & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.camera")) & 1) != 0)
  {
LABEL_4:
    v4 = &unk_1E83CD768;
    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.compass")) & 1) != 0)
  {
LABEL_6:
    v4 = &unk_1E83CD780;
    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.DocumentsApp")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.facetime")) & 1) != 0)
    {
LABEL_10:
      v4 = &unk_1E83CD798;
      goto LABEL_7;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.Maps")) & 1) != 0)
      goto LABEL_6;
    if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.mobilecal")) & 1) == 0
      && (objc_msgSend(v3, "isEqual:", CFSTR("com.apple.mobilemail")) & 1) == 0
      && (objc_msgSend(v3, "isEqual:", CFSTR("com.apple.mobilenotes")) & 1) == 0)
    {
      if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.mobileslideshow")) & 1) != 0)
        goto LABEL_4;
      if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.Music")) & 1) != 0)
      {
        v4 = &unk_1E83CD7B0;
        goto LABEL_7;
      }
      if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.NanoAlarm")) & 1) != 0)
      {
        v4 = &unk_1E83CD7C8;
        goto LABEL_7;
      }
      if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.news")) & 1) != 0)
      {
        v4 = &unk_1E83CD7E0;
        goto LABEL_7;
      }
      if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.podcasts")) & 1) != 0)
        goto LABEL_23;
      if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.reminders")) & 1) == 0)
      {
        if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.stocks")) & 1) != 0)
        {
          v4 = &unk_1E83CD810;
          goto LABEL_7;
        }
        if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.tv")) & 1) == 0)
        {
          if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.weather")) & 1) != 0)
          {
            v4 = &unk_1E83CD828;
            goto LABEL_7;
          }
          if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.MobileSMS")) & 1) == 0)
          {
            +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "genreIdForBundleId:", v3);
            v4 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_7;
          }
          goto LABEL_10;
        }
LABEL_23:
        v4 = &unk_1E83CD7F8;
        goto LABEL_7;
      }
    }
  }
LABEL_2:
  v4 = &unk_1E83CD750;
LABEL_7:

  return v4;
}

- (void)_resetAffinityVectorToDefault
{
  void *v3;
  void *v4;
  ATXModeEntityAffinityVector *v5;
  ATXModeEntityAffinityVector *affinityVector;
  id v7;

  objc_msgSend((id)objc_opt_class(), "genreIdForBundleId:", self->_bundleId);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ATXModeMetadataConstants defaultAppGenreModeAffinities](self->_modeMetadataConstants, "defaultAppGenreModeAffinities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = -[ATXModeEntityAffinityVector initWithAffinities:shouldResize:]([ATXModeEntityAffinityVector alloc], "initWithAffinities:shouldResize:", v4, 1);
      affinityVector = self->_affinityVector;
      self->_affinityVector = v5;
    }
    else
    {
      affinityVector = self->_affinityVector;
      self->_affinityVector = 0;
    }

  }
  else
  {
    v4 = self->_affinityVector;
    self->_affinityVector = 0;
  }

}

- (void)_resetAffinityVectorToDefault_v2
{
  void *v3;
  void *affinityVector;
  ATXModeEntityAffinityVector *v5;
  ATXModeEntityAffinityVector *affinityVector_v2;
  id v7;

  objc_msgSend((id)objc_opt_class(), "genreIdForBundleId:", self->_bundleId);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ATXModeMetadataConstants defaultAppGenreModeAffinities_v2](self->_modeMetadataConstants, "defaultAppGenreModeAffinities_v2");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v7);
    affinityVector = (void *)objc_claimAutoreleasedReturnValue();

    if (affinityVector)
    {
      v5 = -[ATXModeEntityAffinityVector initWithAffinities:shouldResize:]([ATXModeEntityAffinityVector alloc], "initWithAffinities:shouldResize:", affinityVector, 0);
      affinityVector_v2 = self->_affinityVector_v2;
      self->_affinityVector_v2 = v5;
    }
    else
    {
      affinityVector_v2 = self->_affinityVector_v2;
      self->_affinityVector_v2 = 0;
    }

  }
  else
  {
    affinityVector = self->_affinityVector;
    self->_affinityVector = 0;
  }

}

- (ATXSessionTaggingAppEntity)initWithBundleId:(id)a3 modeMetadataConstants:(id)a4
{
  id v7;
  id v8;
  ATXSessionTaggingAppEntity *v9;
  ATXSessionTaggingAppEntity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXSessionTaggingAppEntity;
  v9 = -[ATXSessionTaggingAppEntity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleId, a3);
    objc_storeStrong((id *)&v10->_modeMetadataConstants, a4);
    -[ATXSessionTaggingAppEntity _resetAffinityVectorToDefault](v10, "_resetAffinityVectorToDefault");
    -[ATXSessionTaggingAppEntity _resetAffinityVectorToDefault_v2](v10, "_resetAffinityVectorToDefault_v2");
  }

  return v10;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (ATXModeMetadataConstants)modeMetadataConstants
{
  return self->_modeMetadataConstants;
}

- (ATXModeEntityAffinityVector)affinityVector
{
  return self->_affinityVector;
}

- (ATXModeEntityAffinityVector)affinityVector_v2
{
  return self->_affinityVector_v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affinityVector_v2, 0);
  objc_storeStrong((id *)&self->_affinityVector, 0);
  objc_storeStrong((id *)&self->_modeMetadataConstants, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
