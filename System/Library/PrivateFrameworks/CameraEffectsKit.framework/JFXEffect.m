@implementation JFXEffect

+ (BOOL)effectIDIsNone:(id)a3
{
  return objc_msgSend(MEMORY[0x24BE79010], "effectIDIsNone:", a3);
}

+ (int64_t)defaultPlayableAspectRatio
{
  return 2;
}

+ (int64_t)defaultPlayableAspectRatioPreservationMode
{
  return 0;
}

- (void)dealloc
{
  PVEffect *renderEffect;
  NSMutableDictionary *effectParameters;
  NSMutableDictionary *dirtyEffectParameters;
  objc_super v6;

  -[NSLock lock](self->_paramLock, "lock");
  renderEffect = self->_renderEffect;
  self->_renderEffect = 0;

  effectParameters = self->_effectParameters;
  self->_effectParameters = 0;

  dirtyEffectParameters = self->_dirtyEffectParameters;
  self->_dirtyEffectParameters = 0;

  -[NSLock unlock](self->_paramLock, "unlock");
  v6.receiver = self;
  v6.super_class = (Class)JFXEffect;
  -[JFXEffect dealloc](&v6, sel_dealloc);
}

- (JFXEffect)initWithEffectID:(id)a3
{
  id v5;
  JFXEffect *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *effectParameters;
  NSMutableDictionary *v9;
  NSMutableDictionary *dirtyEffectParameters;
  NSLock *v11;
  NSLock *paramLock;
  void *v13;
  uint64_t v14;
  JFXEffectContentDataSource *contentDataSource;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)JFXEffect;
  v6 = -[JFXEffect init](&v17, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    effectParameters = v6->_effectParameters;
    v6->_effectParameters = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dirtyEffectParameters = v6->_dirtyEffectParameters;
    v6->_dirtyEffectParameters = v9;

    v11 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    paramLock = v6->_paramLock;
    v6->_paramLock = v11;

    objc_storeStrong((id *)&v6->_effectID, a3);
    v6->_isNone = +[JFXEffect effectIDIsNone:](JFXEffect, "effectIDIsNone:", v6->_effectID);
    v6->_renderSize = (CGSize)*MEMORY[0x24BDBF148];
    -[JFXEffect setPlayableAspectRatio:](v6, "setPlayableAspectRatio:", objc_msgSend((id)objc_opt_class(), "defaultPlayableAspectRatio"));
    -[JFXEffect setPlayableAspectRatioPreservationMode:](v6, "setPlayableAspectRatioPreservationMode:", objc_msgSend((id)objc_opt_class(), "defaultPlayableAspectRatioPreservationMode"));
    if (-[JFXEffect type](v6, "type") && !-[JFXEffect isNone](v6, "isNone"))
    {
      +[JFXEffectFactory sharedInstance](JFXEffectFactory, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "createEffectContentDataSourceForEffectID:ofType:", v6->_effectID, -[JFXEffect type](v6, "type"));
      v14 = objc_claimAutoreleasedReturnValue();
      contentDataSource = v6->_contentDataSource;
      v6->_contentDataSource = (JFXEffectContentDataSource *)v14;

    }
    if (-[JFXEffect loopedRangeRenderIsCacheable](v6, "loopedRangeRenderIsCacheable"))
      -[JFXEffect setParameter:forKey:](v6, "setParameter:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE795C8]);
    -[JFXEffect setParameter:forKey:](v6, "setParameter:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE79678]);
  }

  return v6;
}

- (int)type
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_alloc((Class)objc_opt_class());
  -[JFXEffect effectID](self, "effectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "initWithEffectID:", v5);

  -[JFXEffect renderSize](self, "renderSize");
  objc_msgSend((id)v6, "setRenderSize:");
  -[NSLock lock](self->_paramLock, "lock");
  objc_msgSend(*(id *)(v6 + 48), "lock");
  v7 = -[NSMutableDictionary mutableDeepCopy](self->_effectParameters, "mutableDeepCopy");
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  v9 = -[NSMutableDictionary mutableDeepCopy](self->_dirtyEffectParameters, "mutableDeepCopy");
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  objc_storeStrong((id *)(v6 + 72), self->_motionDocumentFolderPath);
  objc_msgSend(*(id *)(v6 + 48), "unlock");
  -[NSLock unlock](self->_paramLock, "unlock");
  return (id)v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)JFXEffect;
  -[JFXEffect description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (void *)MEMORY[0x24BE79010];
  -[JFXEffect effectID](self, "effectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectTypeForEffectID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BE79010];
  -[JFXEffect effectID](self, "effectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayNameForEffectID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR(" %@: %@"), v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (unint64_t)contentAvailability
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[JFXEffect contentDataSource](self, "contentDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contentAvailability");

  return v5;
}

- (BOOL)isContentAvailable
{
  void *v3;
  void *v4;
  char v5;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[JFXEffect contentDataSource](self, "contentDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isContentAvailable");

  return v5;
}

- (BOOL)isContentNew
{
  void *v3;
  void *v4;
  char v5;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[JFXEffect contentDataSource](self, "contentDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isContentNew");

  return v5;
}

- (NSString)contentVersion
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentVersion");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("nodatasource");
  }
  return (NSString *)v5;
}

- (void)setHidden:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v4, *MEMORY[0x24BE795F0]);

}

- (void)setOpacity:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v4, *MEMORY[0x24BE796D8]);

}

- (float)opacity
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  double v8;

  -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE796D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v6 = v5;
  }
  else
  {
    -[JFXEffect renderEffect](self, "renderEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topLevelOpacity");
    v6 = v8;

  }
  return v6;
}

- (BOOL)isHidden
{
  void *v2;
  char v3;

  -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE795F0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)enablePresentationState:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;

  v3 = a3;
  v5 = -[JFXEffect forceRenderAtPosterFrame](self, "forceRenderAtPosterFrame") ^ a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v6, *MEMORY[0x24BE79630]);

  }
  return v5;
}

- (void)setForceRenderAtPosterFrame:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v4, *MEMORY[0x24BE79630]);

}

- (BOOL)forceRenderAtPosterFrame
{
  void *v2;
  void *v3;
  char v4;

  -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE79630]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setBuildInAnimation:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v4, *MEMORY[0x24BE79678]);

}

- (BOOL)buildInAnimation
{
  void *v2;
  char v3;

  -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE79678]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)renderEffectResourcesAreReady
{
  void *v2;
  char v3;

  -[JFXEffect renderEffect](self, "renderEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resourcesAreReady");

  return v3;
}

- (BOOL)loopedRangeRenderIsCacheable
{
  return 0;
}

- (void)setRenderSize:(CGSize)a3
{
  BOOL v5;
  double v6;

  if (self->_renderSize.width != a3.width || self->_renderSize.height != a3.height)
  {
    self->_renderSize = a3;
    v5 = a3.height == *(double *)(MEMORY[0x24BDBF148] + 8) && a3.width == *MEMORY[0x24BDBF148] || a3.height <= 0.0;
    v6 = a3.width / a3.height;
    if (v5)
      v6 = 0.0;
    -[JFXEffect setOutputAspect:](self, "setOutputAspect:", v6);
  }
}

- (double)outputAspect
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE79610]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setOutputAspect:(double)a3
{
  id v4;

  if (fabs(a3) >= 0.0001)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v4, *MEMORY[0x24BE79610]);

  }
  else
  {
    -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", 0, *MEMORY[0x24BE79610]);
  }
}

- (BOOL)isConfiguredForOutputAspect:(double)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  double v8;

  if (-[JFXEffect isNone](self, "isNone"))
    return 1;
  -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE79610]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    v5 = vabdd_f64(a3, v8) < 0.0001;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isConfiguredForOutputAspectMatchingSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  if (-[JFXEffect isNone](self, "isNone"))
    return 1;
  if (height <= 0.0)
    return 0;
  return -[JFXEffect isConfiguredForOutputAspect:](self, "isConfiguredForOutputAspect:", width / height);
}

- (int64_t)playableAspectRatio
{
  void *v2;
  void *v3;
  double v4;
  unint64_t v5;
  int64_t v6;

  -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE79620]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = aspectRatioForMultiplier(v4);
  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_class(), "defaultPlayableAspectRatio");
  }
  v6 = v5;

  return v6;
}

- (void)setPlayableAspectRatio:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", multiplierForAspectRatio(a3));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v4, *MEMORY[0x24BE79620]);

}

- (int64_t)playableAspectRatioPreservationMode
{
  void *v2;
  void *v3;
  uint64_t v4;
  int64_t v5;

  -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE79628]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = aspectRatioPreservationModeFromPVViewContentMode(objc_msgSend(v2, "integerValue"));
  else
    v4 = objc_msgSend((id)objc_opt_class(), "defaultPlayableAspectRatioPreservationMode");
  v5 = v4;

  return v5;
}

- (void)setPlayableAspectRatioPreservationMode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", PVViewContentModeFromAspectRatioPreservationMode(a3));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v4, *MEMORY[0x24BE79628]);

}

- (CGRect)playableRectInOutputSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = rectWithAspectRatioAndPreservationModeInRectWithSize(-[JFXEffect playableAspectRatio](self, "playableAspectRatio"), -[JFXEffect playableAspectRatioPreservationMode](self, "playableAspectRatioPreservationMode"), a3.width, a3.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)playableScaleInOutputSize:(CGSize)a3
{
  double height;
  double width;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;

  height = a3.height;
  width = a3.width;
  v6 = PVViewContentModeFromAspectRatioPreservationMode(-[JFXEffect playableAspectRatioPreservationMode](self, "playableAspectRatioPreservationMode"));
  v7 = multiplierForAspectRatio(-[JFXEffect playableAspectRatio](self, "playableAspectRatio"));
  v8 = 1.0;
  if (!v6)
    goto LABEL_22;
  if (v7 > -0.0000001)
  {
    v8 = 1.0;
    if (v7 < 0.0000001)
      goto LABEL_22;
  }
  v9 = height * v7;
  if (v6 > 2)
  {
    if (v6 == 3 || v6 == 13)
    {
      v7 = width;
    }
    else if (v6 == 14)
    {
      v7 = height * v7;
    }
    goto LABEL_21;
  }
  if (v6 == 1)
  {
    if (width <= height)
    {
      v10 = height;
      if (v9 < width)
        v10 = width / v7;
    }
    else
    {
      v10 = width / v7;
      if (width / v7 < height)
        v10 = height;
    }
    goto LABEL_20;
  }
  if (v6 == 2)
  {
    v10 = width / v7;
    if (width / v7 > height)
      v10 = height;
LABEL_20:
    v7 = v7 * v10;
  }
LABEL_21:
  v8 = v7 / v9;
LABEL_22:
  if (v8 >= 0.0000001 || v8 <= -0.0000001)
    return v8;
  else
    return 1.0;
}

- (void)setForceDisableLooping:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v4, *MEMORY[0x24BE79688]);

}

- (BOOL)forceDisableLooping
{
  void *v2;
  void *v3;
  char v4;

  -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE79688]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)accessibilityName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSString *effectID;
  id v10;
  int v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedAccessibilityName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSString stringByAppendingString:](self->_effectID, "stringByAppendingString:", CFSTR("_Accessibility Name"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v4, &stru_24EE5C428, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length") && !objc_msgSend(v7, "isEqualToString:", v4))
    {
      v10 = v7;
    }
    else
    {
      JFXLog_pickerUI();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        effectID = self->_effectID;
        v12 = 138412290;
        v13 = effectID;
        _os_log_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEFAULT, "Missing accessibility name for effect: %@", (uint8_t *)&v12, 0xCu);
      }

      -[JFXEffect displayName](self, "displayName");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v10;

  }
  return v5;
}

- (id)displayName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[JFXEffect isNone](self, "isNone"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("None_Effect_Display Name"), &stru_24EE5C428, 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[NSString stringByAppendingString:](self->_effectID, "stringByAppendingString:", CFSTR("_Display Name"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", v3, &stru_24EE5C428, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedDisplayName");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;
LABEL_7:

  return v6;
}

- (void)setRenderStartOffset:(id *)a3
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v4, *MEMORY[0x24BE79638]);

}

- ($70930193D4F448A53BB9343C0237EB5F)rangeForPresentationRange:(SEL)a3
{
  __int128 v4;

  v4 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&a4->var1.var1;
  return self;
}

- (BOOL)isEqual:(id)a3
{
  JFXEffect *v4;
  JFXEffect *v5;
  JFXEffect *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  char v11;

  v4 = (JFXEffect *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[JFXEffect effectID](self, "effectID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXEffect effectID](v6, "effectID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqualToString:", v8))
        {
          v9 = -[JFXEffect type](self, "type");
          v10 = -[JFXEffect type](v6, "type");

          if (v9 != v10)
          {
            v11 = 0;
            goto LABEL_12;
          }
          -[JFXEffect effectParameters](v6, "effectParameters");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSLock lock](self->_paramLock, "lock");
          v11 = -[NSMutableDictionary isEqual:](self->_effectParameters, "isEqual:", v7);
          -[NSLock unlock](self->_paramLock, "unlock");
        }
        else
        {

          v11 = 0;
        }

LABEL_12:
        goto LABEL_13;
      }
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v3 = 2654435761 * -[JFXEffect type](self, "type");
  -[NSLock lock](self->_paramLock, "lock");
  -[JFXEffect effectID](self, "effectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  v6 = v5 ^ -[NSMutableDictionary hash](self->_effectParameters, "hash");

  -[NSLock unlock](self->_paramLock, "unlock");
  return v6;
}

- (BOOL)isAppearanceEqual:(id)a3
{
  return -[JFXEffect isAppearanceEqual:forPurpose:](self, "isAppearanceEqual:forPurpose:", a3, 0);
}

- (BOOL)isAppearanceEqual:(id)a3 forPurpose:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[JFXEffect effectID](self, "effectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setEffectParameters:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *effectParameters;
  NSMutableDictionary *v6;
  NSMutableDictionary *dirtyEffectParameters;
  id v8;

  v8 = a3;
  -[NSLock lock](self->_paramLock, "lock");
  if (v8)
  {
    v4 = (NSMutableDictionary *)objc_msgSend(v8, "mutableCopy");
    effectParameters = self->_effectParameters;
    self->_effectParameters = v4;

    v6 = (NSMutableDictionary *)objc_msgSend(v8, "mutableCopy");
    dirtyEffectParameters = self->_dirtyEffectParameters;
    self->_dirtyEffectParameters = v6;

  }
  else
  {
    -[NSMutableDictionary removeAllObjects](self->_effectParameters, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_dirtyEffectParameters, "removeAllObjects");
  }
  -[NSLock unlock](self->_paramLock, "unlock");

}

- (void)addEffectParameters:(id)a3
{
  NSLock *paramLock;
  id v5;

  if (a3)
  {
    paramLock = self->_paramLock;
    v5 = a3;
    -[NSLock lock](paramLock, "lock");
    -[NSMutableDictionary addEntriesFromDictionary:](self->_effectParameters, "addEntriesFromDictionary:", v5);
    -[NSMutableDictionary addEntriesFromDictionary:](self->_dirtyEffectParameters, "addEntriesFromDictionary:", v5);

    -[NSLock unlock](self->_paramLock, "unlock");
  }
}

- (void)removeEffectParameters:(id)a3
{
  NSLock *paramLock;
  id v5;

  if (a3)
  {
    paramLock = self->_paramLock;
    v5 = a3;
    -[NSLock lock](paramLock, "lock");
    -[NSMutableDictionary removeObjectsForKeys:](self->_effectParameters, "removeObjectsForKeys:", v5);
    -[NSMutableDictionary removeObjectsForKeys:](self->_dirtyEffectParameters, "removeObjectsForKeys:", v5);

    -[NSLock unlock](self->_paramLock, "unlock");
  }
}

- (NSDictionary)effectParameters
{
  void *v3;

  -[NSLock lock](self->_paramLock, "lock");
  v3 = (void *)-[NSMutableDictionary copy](self->_effectParameters, "copy");
  -[NSLock unlock](self->_paramLock, "unlock");
  return (NSDictionary *)v3;
}

- (void)setParameter:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSLock lock](self->_paramLock, "lock");
  if (v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_effectParameters, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7 || (objc_msgSend(v7, "isEqual:", v9) & 1) == 0)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_effectParameters, "setObject:forKeyedSubscript:", v9, v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dirtyEffectParameters, "setObject:forKeyedSubscript:", v9, v6);
    }

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_dirtyEffectParameters, "removeObjectForKey:", v6);
    -[NSMutableDictionary removeObjectForKey:](self->_effectParameters, "removeObjectForKey:", v6);
  }
  -[NSLock unlock](self->_paramLock, "unlock");

}

- (id)parameterForKey:(id)a3
{
  NSLock *paramLock;
  id v5;
  void *v6;

  paramLock = self->_paramLock;
  v5 = a3;
  -[NSLock lock](paramLock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_effectParameters, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_paramLock, "unlock");
  return v6;
}

- (BOOL)loadRenderEffect
{
  void *v3;
  char v4;

  -[JFXEffect renderEffectWillLoad](self, "renderEffectWillLoad");
  -[JFXEffect renderEffect](self, "renderEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "loadResources");

  return v4;
}

- (void)loadRenderEffectInBackgroundWithCompletionOnMainQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[JFXEffect renderEffectWillLoad](self, "renderEffectWillLoad");
  -[JFXEffect renderEffect](self, "renderEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    dispatch_get_global_queue(25, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __67__JFXEffect_loadRenderEffectInBackgroundWithCompletionOnMainQueue___block_invoke;
    v12[3] = &unk_24EE59110;
    v7 = &v13;
    v13 = v4;
    v8 = v4;
    objc_msgSend(v5, "loadResourcesOnQueue:completion:", v6, v12);

  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __67__JFXEffect_loadRenderEffectInBackgroundWithCompletionOnMainQueue___block_invoke_3;
    v10[3] = &unk_24EE580C8;
    v7 = &v11;
    v11 = v4;
    v9 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);
  }

}

void __67__JFXEffect_loadRenderEffectInBackgroundWithCompletionOnMainQueue___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__JFXEffect_loadRenderEffectInBackgroundWithCompletionOnMainQueue___block_invoke_2;
  v3[3] = &unk_24EE590E8;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __67__JFXEffect_loadRenderEffectInBackgroundWithCompletionOnMainQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __67__JFXEffect_loadRenderEffectInBackgroundWithCompletionOnMainQueue___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loadRenderEffectOnQueue:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = a3;
  -[JFXEffect renderEffectWillLoad](self, "renderEffectWillLoad");
  -[JFXEffect renderEffect](self, "renderEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __48__JFXEffect_loadRenderEffectOnQueue_completion___block_invoke;
    v14[3] = &unk_24EE59110;
    v9 = &v15;
    v15 = v6;
    v10 = v6;
    objc_msgSend(v8, "loadResourcesOnQueue:completion:", v7, v14);
  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __48__JFXEffect_loadRenderEffectOnQueue_completion___block_invoke_2;
    v12[3] = &unk_24EE580C8;
    v9 = &v13;
    v13 = v6;
    v11 = v6;
    dispatch_async(v7, v12);
  }

}

uint64_t __48__JFXEffect_loadRenderEffectOnQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__JFXEffect_loadRenderEffectOnQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)renderEffect
{
  -[NSLock lock](self->_paramLock, "lock");
  -[JFXEffect _createCachedRenderEffect_noLock](self, "_createCachedRenderEffect_noLock");
  -[PVEffect setInspectableProperties:](self->_renderEffect, "setInspectableProperties:", self->_effectParameters);
  if (-[NSMutableDictionary count](self->_dirtyEffectParameters, "count"))
  {
    -[PVEffect updateInspectableProperties:](self->_renderEffect, "updateInspectableProperties:", self->_dirtyEffectParameters);
    -[NSMutableDictionary removeAllObjects](self->_dirtyEffectParameters, "removeAllObjects");
  }
  -[NSLock unlock](self->_paramLock, "unlock");
  return self->_renderEffect;
}

- (void)setHDR:(BOOL)a3
{
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", CFSTR("1"), *MEMORY[0x24BE795B8]);
  }
  else
  {
    v5[0] = *MEMORY[0x24BE795B8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffect removeEffectParameters:](self, "removeEffectParameters:", v4);

  }
}

- (void)setMotionDocumentFolderPath:(id)a3
{
  PVEffect *renderEffect;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[NSLock lock](self->_paramLock, "lock");
  if (!-[NSString isEqualToString:](self->_motionDocumentFolderPath, "isEqualToString:", v11))
  {
    objc_storeStrong((id *)&self->_motionDocumentFolderPath, a3);
    renderEffect = self->_renderEffect;
    self->_renderEffect = 0;

    objc_msgSend(MEMORY[0x24BE79008], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffect effectID](self, "effectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isContentIDRegistered:", v7);

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BE79008], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXEffect effectID](self, "effectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unregisterContentID:", v10);

    }
  }
  -[NSLock unlock](self->_paramLock, "unlock");

}

- (void)_createCachedRenderEffect_noLock
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PVEffect *v26;
  PVEffect *renderEffect;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  PVEffect *v32;
  PVEffect *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (!self->_renderEffect)
  {
    -[JFXEffect motionDocumentFolderPath](self, "motionDocumentFolderPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0x24BE79000uLL;
    if (v3)
      goto LABEL_5;
    -[JFXEffect JFX_defaultMotionDocumentFolderLocalURL](self, "JFX_defaultMotionDocumentFolderLocalURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x24BE79008], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffect effectID](self, "effectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentPathForID:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x24BE79008], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXEffect effectID](self, "effectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isContentIDRegistered:", v8);

      if ((v9 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "contentsOfDirectoryAtPath:error:", v3, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        v14 = v12;
        if (v13)
        {
          v15 = v13;
          v16 = *(_QWORD *)v35;
LABEL_8:
          v17 = 0;
          while (1)
          {
            if (*(_QWORD *)v35 != v16)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v17);
            objc_msgSend(v18, "pathExtension", (_QWORD)v34);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v19, "isEqualToString:", CFSTR("moti")) & 1) != 0
              || (objc_msgSend(v19, "isEqualToString:", CFSTR("moef")) & 1) != 0)
            {
              break;
            }

            if (v15 == ++v17)
            {
              v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
              if (v15)
                goto LABEL_8;
              v14 = v12;
              v4 = 0x24BE79000;
              goto LABEL_18;
            }
          }
          v14 = v18;

          v4 = 0x24BE79000uLL;
          if (!v14)
            goto LABEL_19;
          objc_msgSend(v3, "stringByAppendingPathComponent:", v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE79008], "sharedInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[JFXEffect effectID](self, "effectID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[JFXEffect contentProperties](self, "contentProperties");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "registerContentFile:forID:properties:", v20, v22, v23);

        }
LABEL_18:

LABEL_19:
      }
      objc_msgSend(*(id *)(v4 + 8), "sharedInstance", (_QWORD)v34);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXEffect effectID](self, "effectID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "createContentInstance:", v25);
      v26 = (PVEffect *)objc_claimAutoreleasedReturnValue();
      renderEffect = self->_renderEffect;
      self->_renderEffect = v26;

    }
    else
    {
      -[JFXEffect contentDataSource](self, "contentDataSource");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28
        || (v29 = (void *)v28,
            -[JFXEffect contentDataSource](self, "contentDataSource"),
            v30 = (void *)objc_claimAutoreleasedReturnValue(),
            v31 = objc_msgSend(v30, "isContentAvailable"),
            v30,
            v29,
            (v31 & 1) == 0))
      {
        v32 = (PVEffect *)objc_msgSend(MEMORY[0x24BE79010], "newEffectWithID:", self->_effectID);
        v33 = self->_renderEffect;
        self->_renderEffect = v32;

      }
    }
    -[NSMutableDictionary addEntriesFromDictionary:](self->_dirtyEffectParameters, "addEntriesFromDictionary:", self->_effectParameters);
  }
}

- (id)contentProperties
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("effectType");
  NSStringFromJFXEffectType(-[JFXEffect type](self, "type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PVCGPointQuad)_convertRenderEffectPoints:(SEL)a3 toBasisRect:(PVCGPointQuad *)a4 basisOrigin:(CGRect)a5
{
  void *v7;
  void *v8;

  -[JFXEffect renderEffect](self, "renderEffect", a5.origin.x, a5.origin.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outputSize");

  -[JFXEffect renderEffect](self, "renderEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "origin");

  return (PVCGPointQuad *)pv_transform_PVCGPointQuad_between_coordinate_systems();
}

- (void)_convertRenderEffectPoints:(CGPoint *)a3 numPoints:(unint64_t)a4 toBasisRect:(CGRect)a5 basisOrigin:(int)a6
{
  double height;
  double width;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  unsigned int v22;
  double v23;
  CGPoint *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double y;
  double x;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;

  height = a5.size.height;
  width = a5.size.width;
  -[JFXEffect renderEffect](self, "renderEffect", a5.origin.x, a5.origin.y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "outputSize");
  v14 = v13;
  v31 = v15;

  -[JFXEffect renderEffect](self, "renderEffect");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "origin");

  if (a4)
  {
    v18 = 0;
    v20 = *MEMORY[0x24BDBEFB0];
    v19 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v30 = v14 * 0.5;
    v29 = v14 * -0.5;
    v21 = width / v14;
    v22 = 1;
    v23 = height / v31;
    do
    {
      v24 = &a3[v18];
      y = v24->y;
      x = v24->x;
      if (v17 == 2)
      {
        v28 = v30;
        v27 = v31 * 0.5;
        if (a6 == 1)
          goto LABEL_16;
        v25 = v19;
        v26 = v20;
        if (!a6)
        {
          v26 = v30;
          v25 = v31 * 0.5;
        }
      }
      else if (v17 == 1)
      {
        v27 = v31;
        v28 = v20;
        if (!a6 || (v27 = v31 * 0.5, v28 = v29, v25 = v19, v26 = v20, a6 == 2))
        {
LABEL_16:
          memset(&v34, 0, sizeof(v34));
          CGAffineTransformMakeScale(&v34, v21, v23);
          v35 = v34;
          CGAffineTransformTranslate(&v36, &v35, v28, v27);
          v34 = v36;
          v35 = v36;
          CGAffineTransformScale(&v36, &v35, 1.0, -1.0);
          goto LABEL_17;
        }
      }
      else
      {
        v25 = v19;
        v26 = v20;
        if (!v17)
        {
          v27 = v31;
          v28 = v20;
          if (a6 == 1)
            goto LABEL_16;
          v25 = v19;
          v26 = v20;
          if (a6 == 2)
          {
            v25 = v31 * -0.5;
            v26 = v29;
          }
        }
      }
      memset(&v34, 0, sizeof(v34));
      CGAffineTransformMakeScale(&v34, v21, v23);
      v35 = v34;
      CGAffineTransformTranslate(&v36, &v35, v26, v25);
LABEL_17:
      v34 = v36;
      *(float64x2_t *)v24 = vaddq_f64(*(float64x2_t *)&v36.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v36.c, y), *(float64x2_t *)&v36.a, x));
      v18 = v22++;
    }
    while (v18 < a4);
  }
}

- (void)_convertRenderEffectPoints:(CGPoint *)a3 numPoints:(unint64_t)a4 fromBasisRect:(CGRect)a5 basisOrigin:(int)a6
{
  double height;
  double width;
  void *v12;
  int v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat *p_y;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  unint64_t v27;
  unsigned int v28;
  CGPoint *v29;
  CGAffineTransform v30;

  height = a5.size.height;
  width = a5.size.width;
  -[JFXEffect renderEffect](self, "renderEffect", a5.origin.x, a5.origin.y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "origin");

  -[JFXEffect renderEffect](self, "renderEffect");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "outputSize");
  v16 = v15;
  v18 = v17;

  if (a6 <= 1 && v13 == 2 && a4)
  {
    v19 = height * 0.5;
    p_y = &a3->y;
    v21 = a4;
    do
    {
      *(p_y - 1) = *(p_y - 1) - width * 0.5;
      if (a6)
        v22 = v19 - *p_y;
      else
        v22 = v19 + *p_y;
      *p_y = v22;
      p_y += 2;
      --v21;
    }
    while (v21);
  }
  v23 = v16 / width;
  v24 = v18 / height;
  if ((v24 != 1.0 || v23 != 1.0) && a4 != 0)
  {
    v27 = 0;
    v28 = 1;
    do
    {
      v29 = &a3[v27];
      CGAffineTransformMakeScale(&v30, v23, v24);
      *(float64x2_t *)v29 = vaddq_f64(*(float64x2_t *)&v30.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v30.c, v29->y), *(float64x2_t *)&v30.a, v29->x));
      v27 = v28++;
    }
    while (v27 < a4);
  }
}

- (CGAffineTransform)_affineTransformFromEffectRect:(SEL)a3 toSize:(CGRect)a4 basisOrigin:(CGSize)a5
{
  double height;
  double width;
  double v9;
  double v10;
  void *v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGAffineTransform *result;
  double v21;
  double v22;
  double v23;
  double v24;

  height = a5.height;
  width = a5.width;
  v9 = a4.size.height;
  v10 = a4.size.width;
  -[JFXEffect renderEffect](self, "renderEffect", a4.origin.x, a4.origin.y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "origin");

  -[JFXEffect renderEffect](self, "renderEffect");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "outputSize");
  v17 = v16;
  v19 = v18;

  v21 = 0.0;
  v22 = v10 * 0.5;
  v23 = v9 * 0.5;
  v24 = v9 * -0.5 + 0.0;
  if (a6 != 1)
    v24 = 0.0;
  if (a6)
    v23 = v24;
  if (v14 != 2)
  {
    v22 = 0.0;
    v23 = 0.0;
  }
  if (a6 <= 1)
    v21 = v23;
  else
    v22 = 0.0;
  retstr->a = v17 / width;
  retstr->b = 0.0;
  retstr->c = 0.0;
  retstr->d = v19 / height;
  retstr->tx = v22;
  retstr->ty = v21;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (JFXEffect)initWithCoder:(id)a3
{
  id v4;
  JFXEffect *v5;
  uint64_t v6;
  NSString *effectID;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSMutableDictionary *effectParameters;
  uint64_t v13;
  NSMutableDictionary *v14;
  NSObject *v15;
  uint64_t v16;
  NSMutableDictionary *dirtyEffectParameters;
  NSLock *v18;
  NSLock *paramLock;
  void *v20;
  uint64_t v21;
  JFXEffectContentDataSource *contentDataSource;
  void *v23;
  void *v24;
  id v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)JFXEffect;
  v5 = -[JFXEffect init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "setClass:forClassName:", objc_opt_class(), CFSTR("PCMatrix44Double"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("JTEffectEffectIDCoderKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    effectID = v5->_effectID;
    v5->_effectID = (NSString *)v6;

    v5->_isNone = +[JFXEffect effectIDIsNone:](JFXEffect, "effectIDIsNone:", v5->_effectID);
    -[JFXEffect parametersClassWhitelist](v5, "parametersClassWhitelist");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v8, CFSTR("JTEffectEffectParameterCoderKey"), &v26);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v26;
    v11 = objc_msgSend(v9, "mutableCopy");
    effectParameters = v5->_effectParameters;
    v5->_effectParameters = (NSMutableDictionary *)v11;

    if (v10)
    {
      v13 = objc_opt_new();
      v14 = v5->_effectParameters;
      v5->_effectParameters = (NSMutableDictionary *)v13;

      JFXLog_core();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[JFXEffect initWithCoder:].cold.1((uint64_t)v10, v15);

    }
    v16 = objc_opt_new();
    dirtyEffectParameters = v5->_dirtyEffectParameters;
    v5->_dirtyEffectParameters = (NSMutableDictionary *)v16;

    v18 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    paramLock = v5->_paramLock;
    v5->_paramLock = v18;

    if (-[JFXEffect type](v5, "type") && !-[JFXEffect isNone](v5, "isNone"))
    {
      +[JFXEffectFactory sharedInstance](JFXEffectFactory, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "createEffectContentDataSourceForEffectID:ofType:", v5->_effectID, -[JFXEffect type](v5, "type"));
      v21 = objc_claimAutoreleasedReturnValue();
      contentDataSource = v5->_contentDataSource;
      v5->_contentDataSource = (JFXEffectContentDataSource *)v21;

    }
    -[JFXEffect parameterForKey:](v5, "parameterForKey:", *MEMORY[0x24BE79620]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      -[JFXEffect setPlayableAspectRatio:](v5, "setPlayableAspectRatio:", objc_msgSend((id)objc_opt_class(), "defaultPlayableAspectRatio"));
    -[JFXEffect parameterForKey:](v5, "parameterForKey:", *MEMORY[0x24BE79628]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
      -[JFXEffect setPlayableAspectRatioPreservationMode:](v5, "setPlayableAspectRatioPreservationMode:", objc_msgSend((id)objc_opt_class(), "defaultPlayableAspectRatioPreservationMode"));
    if (-[JFXEffect loopedRangeRenderIsCacheable](v5, "loopedRangeRenderIsCacheable"))
      -[JFXEffect setParameter:forKey:](v5, "setParameter:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE795C8]);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *effectID;
  id v5;
  id v6;

  effectID = self->_effectID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", effectID, CFSTR("JTEffectEffectIDCoderKey"));
  -[JFXEffect serializableEffectParameters](self, "serializableEffectParameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("JTEffectEffectParameterCoderKey"));

}

- (id)parametersClassWhitelist
{
  if (parametersClassWhitelist_onceToken != -1)
    dispatch_once(&parametersClassWhitelist_onceToken, &__block_literal_global_21);
  return (id)parametersClassWhitelist_parametersClassWhitelist;
}

void __37__JFXEffect_parametersClassWhitelist__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 13);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)parametersClassWhitelist_parametersClassWhitelist;
  parametersClassWhitelist_parametersClassWhitelist = v2;

}

- (id)serializableEffectParameters
{
  void *v2;
  void *v3;

  -[JFXEffect effectParameters](self, "effectParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x24BE79610]);
  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x24BE79678]);
  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x24BE79688]);
  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x24BE79630]);
  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x24BE795F8]);
  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x24BE795D0]);
  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x24BE795C8]);
  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x24BE79668]);
  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x24BE796D0]);
  return v3;
}

- (PVMatrix44Double)topLevelTransformObject
{
  return (PVMatrix44Double *)-[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE796E0]);
}

- (void)setTopLevelTransformObject:(id)a3
{
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", a3, *MEMORY[0x24BE796E0]);
}

- (void)topLevelTransform
{
  void *v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;

  objc_msgSend(a1, "topLevelTransformObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    objc_msgSend(v3, "SIMDDouble4x4");
    v3 = v9;
  }
  else
  {
    v4 = (_OWORD *)MEMORY[0x24BDAEDE8];
    v5 = *(_OWORD *)(MEMORY[0x24BDAEDE8] + 80);
    a2[4] = *(_OWORD *)(MEMORY[0x24BDAEDE8] + 64);
    a2[5] = v5;
    v6 = v4[7];
    a2[6] = v4[6];
    a2[7] = v6;
    v7 = v4[1];
    *a2 = *v4;
    a2[1] = v7;
    v8 = v4[3];
    a2[2] = v4[2];
    a2[3] = v8;
  }

}

- (void)setTopLevelTransform:(_OWORD *)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  _OWORD v9[8];

  v4 = a3[5];
  v9[4] = a3[4];
  v9[5] = v4;
  v5 = a3[7];
  v9[6] = a3[6];
  v9[7] = v5;
  v6 = a3[1];
  v9[0] = *a3;
  v9[1] = v6;
  v7 = a3[3];
  v9[2] = a3[2];
  v9[3] = v7;
  objc_msgSend(MEMORY[0x24BE790A8], "matrixWithSIMDDouble4x4:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTopLevelTransformObject:", v8);

}

- (uint64_t)topLevelTransformRelativeTo:(void *)a1@<X0> basisOrigin:(_OWORD *)a2@<X8>
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "topLevelTransform");
  objc_msgSend(a1, "renderEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "origin");

  objc_msgSend(a1, "renderEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputSize");

  a2[6] = 0u;
  a2[7] = 0u;
  a2[4] = 0u;
  a2[5] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  *a2 = 0u;
  a2[1] = 0u;
  return pv_simd_matrix_convert_coordinate_system();
}

- (uint64_t)setTopLevelTransform:(__n128)a3 relativeTo:(uint64_t)a4 basisOrigin:(__int128 *)a5
{
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;

  objc_msgSend(a1, "renderEffect");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "origin");

  objc_msgSend(a1, "renderEffect");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "outputSize");

  a33 = 0u;
  a34 = 0u;
  a31 = 0u;
  a32 = 0u;
  a29 = 0u;
  a30 = 0u;
  a27 = 0u;
  a28 = 0u;
  v38 = a5[5];
  a23 = a5[4];
  a24 = v38;
  v39 = a5[7];
  a25 = a5[6];
  a26 = v39;
  v40 = a5[1];
  a19 = *a5;
  a20 = v40;
  v41 = a5[3];
  a21 = a5[2];
  a22 = v41;
  pv_simd_matrix_convert_coordinate_system();
  a15 = a31;
  a16 = a32;
  a17 = a33;
  a18 = a34;
  a11 = a27;
  a12 = a28;
  a13 = a29;
  a14 = a30;
  return objc_msgSend(a1, "setTopLevelTransform:", &a11);
}

- (PVTransformAnimation)transformAnimation
{
  return (PVTransformAnimation *)-[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE796E8]);
}

- (void)setTransformAnimation:(id)a3
{
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", a3, *MEMORY[0x24BE796E8]);
}

- (void)setParentTransformAnimation:(id)a3
{
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", a3, *MEMORY[0x24BE79618]);
}

- (CGAffineTransform)addTransform:(SEL)a3 withComponentTime:(CGAffineTransform *)a4 relativeTo:(id *)a5 basisOrigin:(CGRect)a6
{
  __int128 v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  _OWORD v10[3];

  v7 = *(_OWORD *)&a4->c;
  v10[0] = *(_OWORD *)&a4->a;
  v10[1] = v7;
  v10[2] = *(_OWORD *)&a4->tx;
  v9 = *a5;
  return -[JFXEffect addTransform:withComponentTime:relativeTo:basisOrigin:ignoreTranslation:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:ignoreTranslation:", v10, &v9, *(_QWORD *)&a7, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (CGAffineTransform)addTransform:(SEL)a3 withComponentTime:(CGAffineTransform *)a4 relativeTo:(id *)a5 basisOrigin:(CGRect)a6 ignoreTranslation:(int)a7
{
  _BOOL4 v8;
  double height;
  double width;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  __int128 v23;
  __int128 v24;
  CGFloat *p_ty;
  CGFloat *p_tx;
  __int128 v27;
  double *v28;
  double v29;
  double *v30;
  double v31;
  double v32;
  BOOL v33;
  void *v34;
  void *v35;
  double v36;
  BOOL v37;
  double v38;
  double v39;
  double v40;
  BOOL v41;
  int v42;
  double v43;
  CGFloat a;
  CGFloat b;
  __int128 v46;
  __int128 v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  int8x16_t v56;
  __int128 __x;
  int8x16_t v58;
  int8x16_t v59;
  _OWORD v60[8];
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v63;
  CGAffineTransform v64;
  CGAffineTransform v65;
  CGAffineTransform v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  CGAffineTransform v70;
  CGAffineTransform v71;
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGAffineTransform v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  CGAffineTransform v80;
  __int128 v81;
  int8x16_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  CGAffineTransform v86;

  v8 = a8;
  height = a6.size.height;
  width = a6.size.width;
  -[JFXEffect renderEffect](self, "renderEffect", a6.origin.x, a6.origin.y);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "outputSize");
  v18 = v17;
  v20 = v19;

  -[JFXEffect renderEffect](self, "renderEffect");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "origin");

  v24 = *(_OWORD *)&a4->a;
  v23 = *(_OWORD *)&a4->c;
  p_ty = &a4->ty;
  v27 = *(_OWORD *)&a4->tx;
  p_tx = &a4->tx;
  v55 = *(_OWORD *)(MEMORY[0x24BE79710] + 80);
  v56 = *(int8x16_t *)(MEMORY[0x24BE79710] + 64);
  v82 = v56;
  v83 = v55;
  v53 = *(_OWORD *)(MEMORY[0x24BE79710] + 112);
  v54 = *(_OWORD *)(MEMORY[0x24BE79710] + 96);
  v84 = v54;
  v85 = v53;
  v51 = *(_OWORD *)(MEMORY[0x24BE79710] + 16);
  v52 = *MEMORY[0x24BE79710];
  *(_OWORD *)&v80.a = *MEMORY[0x24BE79710];
  *(_OWORD *)&v80.c = v51;
  v49 = *(_OWORD *)(MEMORY[0x24BE79710] + 48);
  v50 = *(_OWORD *)(MEMORY[0x24BE79710] + 32);
  *(_OWORD *)&v80.tx = v50;
  v81 = v49;
  *(_OWORD *)&v74.c = 0u;
  __x = v24;
  *(_OWORD *)&v74.a = v24;
  v75 = 0u;
  *(_OWORD *)&v74.tx = v23;
  v77 = xmmword_226AB71E0;
  v76 = 0u;
  v79 = xmmword_226AB71D0;
  v78 = v27;
  pv_transform_info_make();
  if (v8)
    v28 = (double *)MEMORY[0x24BDBF148];
  else
    v28 = p_tx;
  v29 = *MEMORY[0x24BDBF148];
  v30 = (double *)(MEMORY[0x24BDBF148] + 8);
  v59 = v82;
  v58 = vextq_s8(v82, v82, 8uLL);
  if (!v8)
    v30 = p_ty;
  v31 = *v30;
  v32 = *v28;
  v33 = *(double *)(MEMORY[0x24BDBF148] + 8) == *v30 && v29 == v32;
  if (!v33 && !v8)
  {
    -[JFXEffect transformAnimation](self, "transformAnimation", v29);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
    {
      *(_QWORD *)&v81 = 0;
      memset(&v80, 0, sizeof(v80));
      *(_OWORD *)&v74.a = *(_OWORD *)&a5->var0;
      *(_QWORD *)&v74.c = a5->var3;
      objc_msgSend(v34, "transformInfoAtTime:", &v74);
      v74 = v80;
      *(_QWORD *)&v75 = v81;
      if ((PVTransformAnimationInfoIsIdentity() & 1) == 0)
      {
        v32 = v32 / v80.ty;
        v31 = v31 / v80.ty;
      }
    }
    -[JFXEffect playableScaleInOutputSize:](self, "playableScaleInOutputSize:", width, height, v49, v50, v51, v52, v53, v54, v55, *(_OWORD *)&v56, __x, *(_OWORD *)&v58, *(_OWORD *)&v59);
    v37 = fabs(v36 + -1.0) < 0.0001;
    v38 = v32 / v36;
    v39 = v31 / v36;
    if (v37)
      v40 = v32;
    else
      v40 = v38;
    if (!v37)
      v31 = v39;
    if (a7 != 2)
    {
      if (a7 == 1)
      {
        v41 = (v22 & 0xFFFFFFFD) == 0;
        goto LABEL_24;
      }
      if (a7)
      {
        memset(&v86, 0, sizeof(v86));
        CGAffineTransformMakeScale(&v86, v18 / width, v20 / height);
LABEL_30:
        v32 = v31 * v86.c + v86.a * v40;
        v31 = v31 * v86.d + v86.b * v40;

        goto LABEL_31;
      }
    }
    v41 = v22 == 1;
LABEL_24:
    v42 = v41;
    memset(&v86, 0, sizeof(v86));
    CGAffineTransformMakeScale(&v86, v18 / width, v20 / height);
    if (v42)
    {
      v74 = v86;
      CGAffineTransformScale(&v80, &v74, 1.0, -1.0);
      v86 = v80;
    }
    goto LABEL_30;
  }
LABEL_31:
  v43 = atan2(*((long double *)&__x + 1), *(long double *)&__x);
  v82 = v56;
  v83 = v55;
  v84 = v54;
  v85 = v53;
  *(_OWORD *)&v80.a = v52;
  *(_OWORD *)&v80.c = v51;
  *(_OWORD *)&v80.tx = v50;
  v81 = v49;
  -[JFXEffect topLevelTransform](self, "topLevelTransform");
  pv_transform_info_make();
  memset(&v74, 0, sizeof(v74));
  a = v80.a;
  b = v80.b;
  CGAffineTransformMakeTranslation(&v74, -v80.a, -v80.b);
  memset(&v86, 0, sizeof(v86));
  CGAffineTransformMakeTranslation(&v86, v32, v31);
  memset(&v73, 0, sizeof(v73));
  CGAffineTransformMakeRotation(&v73, -v43);
  memset(&v72, 0, sizeof(v72));
  CGAffineTransformMakeScale(&v72, *(CGFloat *)v59.i64, *(CGFloat *)v58.i64);
  memset(&v71, 0, sizeof(v71));
  CGAffineTransformMakeTranslation(&v71, a, b);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  -[JFXEffect topLevelTransform](self, "topLevelTransform");
  *(_OWORD *)&v70.a = v67;
  *(_OWORD *)&v70.c = v68;
  *(_OWORD *)&v70.tx = v69;
  t1 = v72;
  t2 = v71;
  CGAffineTransformConcat(&v63, &t1, &t2);
  t1 = v73;
  CGAffineTransformConcat(&v64, &t1, &v63);
  t1 = v86;
  CGAffineTransformConcat(&v65, &t1, &v64);
  t1 = v74;
  CGAffineTransformConcat(&v66, &t1, &v65);
  CGAffineTransformConcat(retstr, &v70, &v66);
  v46 = *(_OWORD *)&retstr->c;
  v47 = *(_OWORD *)&retstr->tx;
  v60[0] = *(_OWORD *)&retstr->a;
  v60[1] = 0u;
  v60[2] = v46;
  memset(&v60[3], 0, 32);
  v60[5] = xmmword_226AB71E0;
  v60[6] = v47;
  v60[7] = xmmword_226AB71D0;
  return (CGAffineTransform *)-[JFXEffect setTopLevelTransform:](self, "setTopLevelTransform:", v60);
}

- (void)setTopLevelAdditionalScale:(CGPoint)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", a3.x, a3.y);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v4, *MEMORY[0x24BE796D0]);

}

- (void)removeTopLevelAdditionalScale
{
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", 0, *MEMORY[0x24BE796D0]);
}

- (id)JFX_defaultMotionDocumentFolderLocalURL
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (-[JFXEffect contentDataSource](self, "contentDataSource"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_2558C8C40),
        v4,
        v5))
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setContentType:", 5);
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localAssetsWithFilteringOptions:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "localURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (NSString)effectID
{
  return self->_effectID;
}

- (BOOL)isNone
{
  return self->_isNone;
}

- (CGSize)renderSize
{
  double width;
  double height;
  CGSize result;

  width = self->_renderSize.width;
  height = self->_renderSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (JFXEffectContentDataSource)contentDataSource
{
  return self->_contentDataSource;
}

- (NSString)motionDocumentFolderPath
{
  return self->_motionDocumentFolderPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionDocumentFolderPath, 0);
  objc_storeStrong((id *)&self->_contentDataSource, 0);
  objc_storeStrong((id *)&self->_paramLock, 0);
  objc_storeStrong((id *)&self->_dirtyEffectParameters, 0);
  objc_storeStrong((id *)&self->_effectParameters, 0);
  objc_storeStrong((id *)&self->_renderEffect, 0);
  objc_storeStrong((id *)&self->_effectID, 0);
}

- (id)requestAllAssetsWithOptions:(id)a3 progressAndCancellationHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[JFXEffect contentDataSource](self, "contentDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_2558C8C40);

  if ((v12 & 1) != 0)
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__23;
    v25 = __Block_byref_object_dispose__23;
    v26 = 0;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __108__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressAndCancellationHandler_completionHandler___block_invoke;
    v18[3] = &unk_24EE5BA58;
    v19 = v9;
    v20 = &v21;
    v18[4] = self;
    objc_msgSend(v13, "requestAllAssetsWithOptions:progressHandler:completionHandler:", v8, v18, v10);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v22[5];
    v22[5] = v14;

    v16 = (id)v22[5];
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
    v16 = 0;
  }

  return v16;
}

uint64_t __108__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressAndCancellationHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;
  char v3;

  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    v3 = 0;
    result = (*(uint64_t (**)(uint64_t, char *))(result + 16))(result, &v3);
    if (v3)
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        return objc_msgSend(*(id *)(a1 + 32), "cancelAssetRequest:");
    }
  }
  return result;
}

- (id)requestAssetWithOptions:(id)a3 progressAndCancellationHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[JFXEffect contentDataSource](self, "contentDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_2558C8C40);

  if ((v12 & 1) != 0)
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__23;
    v25 = __Block_byref_object_dispose__23;
    v26 = 0;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __104__JFXEffect_AssetDownloading__requestAssetWithOptions_progressAndCancellationHandler_completionHandler___block_invoke;
    v18[3] = &unk_24EE5BA58;
    v19 = v9;
    v20 = &v21;
    v18[4] = self;
    objc_msgSend(v13, "requestAssetWithOptions:progressHandler:completionHandler:", v8, v18, v10);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v22[5];
    v22[5] = v14;

    v16 = (id)v22[5];
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
    v16 = 0;
  }

  return v16;
}

uint64_t __104__JFXEffect_AssetDownloading__requestAssetWithOptions_progressAndCancellationHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;
  char v3;

  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    v3 = 0;
    result = (*(uint64_t (**)(uint64_t, char *))(result + 16))(result, &v3);
    if (v3)
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        return objc_msgSend(*(id *)(a1 + 32), "cancelAssetRequest:");
    }
  }
  return result;
}

- (id)requestAssetWithOptions:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[JFXEffect contentDataSource](self, "contentDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_2558C8C40);

  if ((v12 & 1) != 0)
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke;
    v19[3] = &unk_24EE5BA80;
    v19[4] = self;
    v20 = v9;
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_60;
    v17[3] = &unk_24EE5BAA8;
    v17[4] = self;
    v18 = v10;
    objc_msgSend(v13, "requestAssetWithOptions:progressHandler:completionHandler:", v8, v19, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
    v15 = 0;
  }

  return v15;
}

uint64_t __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke(uint64_t a1, double a2)
{
  NSObject *v4;
  uint64_t result;

  JFXLog_DebugEffectAssetDownloading();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_cold_1(a1);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(double))(result + 16))(a2);
  return result;
}

void __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_60(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;

  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (a3)
  {
    JFXLog_DebugEffectAssetDownloading();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_60_cold_1();
  }
  else if (v8)
  {
    JFXLog_DebugEffectAssetDownloading();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_60_cold_3();
  }
  else
  {
    if (v7)
      goto LABEL_8;
    JFXLog_DebugEffectAssetDownloading();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_60_cold_2();
  }

LABEL_8:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)requestAllAssetsWithOptions:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[JFXEffect contentDataSource](self, "contentDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_2558C8C40);

  if ((v12 & 1) != 0)
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke;
    v19[3] = &unk_24EE5BA80;
    v19[4] = self;
    v20 = v9;
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke_62;
    v17[3] = &unk_24EE5BAD0;
    v17[4] = self;
    v18 = v10;
    objc_msgSend(v13, "requestAllAssetsWithOptions:progressHandler:completionHandler:", v8, v19, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
    v15 = 0;
  }

  return v15;
}

uint64_t __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke(uint64_t a1, double a2)
{
  NSObject *v4;
  uint64_t result;

  JFXLog_DebugEffectAssetDownloading();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_cold_1(a1);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(double))(result + 16))(a2);
  return result;
}

void __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke_62(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;

  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (a3)
  {
    JFXLog_DebugEffectAssetDownloading();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke_62_cold_1();
  }
  else if (v8)
  {
    JFXLog_DebugEffectAssetDownloading();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke_62_cold_3();
  }
  else
  {
    if (v7)
      goto LABEL_8;
    JFXLog_DebugEffectAssetDownloading();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke_62_cold_2();
  }

LABEL_8:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)cancelAssetRequest:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[JFXEffect contentDataSource](self, "contentDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_2558C8C40);

  if (v5)
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelAssetRequest:", v7);

  }
}

- (void)updatePriorityForAssetRequest:(id)a3 newPriority:(int64_t)a4
{
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[JFXEffect contentDataSource](self, "contentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_2558C8C40);

  if (v7)
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updatePriorityForAssetRequest:newPriority:", v9, a4);

  }
}

- (id)availableAssetsWithFilteringOptionsArray:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[JFXEffect contentDataSource](self, "contentDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_2558C8C40);

  if (v6)
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "availableAssetsWithFilteringOptionsArray:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v8;
}

- (id)availableAssetsWithFilteringOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[JFXEffect contentDataSource](self, "contentDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_2558C8C40);

  if (v6)
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "availableAssetsWithFilteringOptions:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v8;
}

- (id)localAssetsWithFilteringOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[JFXEffect contentDataSource](self, "contentDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_2558C8C40);

  if (v6)
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localAssetsWithFilteringOptions:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v8;
}

- (id)describeRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  __CFString *v8;

  v4 = a3;
  -[JFXEffect contentDataSource](self, "contentDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_2558C8C40);

  if (v6)
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "describeRequest:", v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_24EE5C428;
  }

  return v8;
}

- (void)registerMotionDocumentWithinAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setContentType:", 5);
  +[JFXEffectAsset firstAssetInAssets:matchingFilterAttributes:](JFXEffectAsset, "firstAssetInAssets:matchingFilterAttributes:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "localURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = objc_claimAutoreleasedReturnValue();

    -[JFXEffect setMotionDocumentFolderPath:](self, "setMotionDocumentFolderPath:", v8);
    JFXLog_DebugEffectAssetDownloading();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[JFXEffect(AssetDownloading) registerMotionDocumentWithinAssets:].cold.2();

  }
  else
  {
    JFXLog_DebugEffectAssetDownloading();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[JFXEffect(AssetDownloading) registerMotionDocumentWithinAssets:].cold.1();
  }

}

- (BOOL)arePreviewingAssetsLocal
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (-[JFXEffect isNone](self, "isNone"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4
      || (v5 = (void *)v4,
          -[JFXEffect contentDataSource](self, "contentDataSource"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v3) = objc_msgSend(v6, "isContentAvailable"),
          v6,
          v5,
          (_DWORD)v3))
    {
      v7 = (void *)objc_opt_new();
      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "setContentType:", 5);
      LOBYTE(v3) = 1;
      objc_msgSend(v8, "setUsageMode:", 1);
      -[JFXEffect availableAssetsWithFilteringOptions:](self, "availableAssetsWithFilteringOptions:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v9);

      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "setContentType:", 1);
      objc_msgSend(v10, "setUsageMode:", 1);
      objc_msgSend(v10, "setAspectRatio:", 3);
      -[JFXEffect availableAssetsWithFilteringOptions:](self, "availableAssetsWithFilteringOptions:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v11);

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = v7;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
LABEL_7:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16);
          objc_msgSend(v17, "localURL", (_QWORD)v20);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
            break;
          v18 = objc_msgSend(v17, "contentUpdateAvailable");

          if ((v18 & 1) != 0)
          {
            LOBYTE(v3) = 0;
            break;
          }
          if (v14 == ++v16)
          {
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            LOBYTE(v3) = 1;
            if (v14)
              goto LABEL_7;
            break;
          }
        }
      }

    }
  }
  return (char)v3;
}

- (id)requestPreviewingAssetsWithPriority:(int64_t)a3 onlyThumbnailAssetWhenAvailable:(BOOL)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[2];

  v7 = a4;
  v28[1] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setContentType:", 1);
  objc_msgSend(v12, "setUsageMode:", 1);
  objc_msgSend(v12, "setFilteringMode:", 1);
  if (v7
    && (-[JFXEffect availableAssetsWithFilteringOptions:](self, "availableAssetsWithFilteringOptions:", v12),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "count"),
        v13,
        v14))
  {
    JFXLog_DebugEffectAssetDownloading();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[JFXEffect(AssetDownloading) requestPreviewingAssetsWithPriority:onlyThumbnailAssetWhenAvailable:progressHandler:completionHandler:].cold.1(self, v15);

    v16 = (void *)objc_opt_new();
    v28[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFilterOptionsArray:", v17);

    objc_msgSend(v16, "setPriority:", a3);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __133__JFXEffect_AssetDownloading__requestPreviewingAssetsWithPriority_onlyThumbnailAssetWhenAvailable_progressHandler_completionHandler___block_invoke;
    v25[3] = &unk_24EE5BAF8;
    v26 = v11;
    v18 = v11;
    -[JFXEffect requestAssetWithOptions:progressAndCancellationHandler:completionHandler:](self, "requestAssetWithOptions:progressAndCancellationHandler:completionHandler:", v16, v10, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v26;
  }
  else
  {
    v16 = (void *)objc_opt_new();
    v18 = (id)objc_opt_new();
    objc_msgSend(v18, "setContentType:", 5);
    objc_msgSend(v18, "setUsageMode:", 1);
    v27 = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFilterOptionsArray:", v21);

    objc_msgSend(v16, "setPriority:", a3);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __133__JFXEffect_AssetDownloading__requestPreviewingAssetsWithPriority_onlyThumbnailAssetWhenAvailable_progressHandler_completionHandler___block_invoke_2;
    v23[3] = &unk_24EE5BAD0;
    v23[4] = self;
    v24 = v11;
    v20 = v11;
    -[JFXEffect requestAllAssetsWithOptions:progressAndCancellationHandler:completionHandler:](self, "requestAllAssetsWithOptions:progressAndCancellationHandler:completionHandler:", v16, v10, v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

void __133__JFXEffect_AssetDownloading__requestPreviewingAssetsWithPriority_onlyThumbnailAssetWhenAvailable_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void (*v11)(uint64_t, _QWORD, uint64_t, id);
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v12[0] = a2;
    v7 = (void *)MEMORY[0x24BDBCE30];
    v8 = a4;
    v9 = a2;
    objc_msgSend(v7, "arrayWithObjects:count:", v12, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, uint64_t, id))(v6 + 16))(v6, v10, a3, v8);

  }
  else
  {
    v11 = *(void (**)(uint64_t, _QWORD, uint64_t, id))(v6 + 16);
    v9 = a4;
    v10 = 0;
    v11(v6, 0, a3, v9);
  }

}

void __133__JFXEffect_AssetDownloading__requestPreviewingAssetsWithPriority_onlyThumbnailAssetWhenAvailable_progressHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a4;
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "registerMotionDocumentWithinAssets:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)effectWillRenderPreviewWithOptions:(id)a3
{
  return a3;
}

- (BOOL)areRenderingAssetsLocal
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[JFXEffect isNone](self, "isNone"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4
      || (v5 = (void *)v4,
          -[JFXEffect contentDataSource](self, "contentDataSource"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v3) = objc_msgSend(v6, "isContentAvailable"),
          v6,
          v5,
          (_DWORD)v3))
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(v7, "setUsageMode:", 2);
      -[JFXEffect availableAssetsWithFilteringOptions:](self, "availableAssetsWithFilteringOptions:", v7);
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
LABEL_7:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
          objc_msgSend(v13, "localURL", (_QWORD)v16);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
            break;
          v14 = objc_msgSend(v13, "contentUpdateAvailable");

          if ((v14 & 1) != 0)
          {
            LOBYTE(v3) = 0;
            break;
          }
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
            LOBYTE(v3) = 1;
            if (v10)
              goto LABEL_7;
            break;
          }
        }
      }
      else
      {
        LOBYTE(v3) = 1;
      }

    }
  }
  return (char)v3;
}

- (id)requestRenderingAssetsWithPriority:(int64_t)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setUsageMode:", 2);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setContentType:", 5);
  objc_msgSend(v12, "setUsageMode:", 0);
  v19[0] = v11;
  v19[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFilterOptionsArray:", v13);

  objc_msgSend(v10, "setPriority:", a3);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __100__JFXEffect_AssetDownloading__requestRenderingAssetsWithPriority_progressHandler_completionHandler___block_invoke;
  v17[3] = &unk_24EE5BAD0;
  v17[4] = self;
  v18 = v8;
  v14 = v8;
  -[JFXEffect requestAllAssetsWithOptions:progressAndCancellationHandler:completionHandler:](self, "requestAllAssetsWithOptions:progressAndCancellationHandler:completionHandler:", v10, v9, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __100__JFXEffect_AssetDownloading__requestRenderingAssetsWithPriority_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a4;
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "registerMotionDocumentWithinAssets:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "error decoding JFXEffect parameters: %@", (uint8_t *)&v2, 0xCu);
}

void __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = OUTLINED_FUNCTION_5_1(a1);
  NSStringFromJFXEffectType(v2);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9(), "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_7(&dword_2269A9000, v4, v5, "downloading asset for %@ %@ progress %f", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_8_0();
}

void __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_60_cold_1()
{
  void *v0;
  uint64_t v1;
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11();
  v2 = OUTLINED_FUNCTION_5_1(v1);
  NSStringFromJFXEffectType(v2);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9(), "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_2269A9000, v4, v5, "downloading asset for %@ %@ was cancelled", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_2();
}

void __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_60_cold_2()
{
  void *v0;
  uint64_t v1;
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11();
  v2 = OUTLINED_FUNCTION_5_1(v1);
  NSStringFromJFXEffectType(v2);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9(), "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_2269A9000, v4, v5, "downloading asset for %@ %@ no asset found", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_2();
}

void __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_60_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_10_1();
  v2 = OUTLINED_FUNCTION_5_1(v1);
  NSStringFromJFXEffectType(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 32), "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_7(&dword_2269A9000, v5, v6, "downloading asset for %@ %@ had error %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_6_2();
}

void __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke_62_cold_1()
{
  void *v0;
  uint64_t v1;
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11();
  v2 = OUTLINED_FUNCTION_5_1(v1);
  NSStringFromJFXEffectType(v2);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9(), "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_2269A9000, v4, v5, "downloading assets for %@ %@ was cancelled", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_2();
}

void __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke_62_cold_2()
{
  void *v0;
  uint64_t v1;
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11();
  v2 = OUTLINED_FUNCTION_5_1(v1);
  NSStringFromJFXEffectType(v2);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9(), "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_2269A9000, v4, v5, "downloading assets for %@ %@ no assets found", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_2();
}

void __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke_62_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_10_1();
  v2 = OUTLINED_FUNCTION_5_1(v1);
  NSStringFromJFXEffectType(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 32), "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_7(&dword_2269A9000, v5, v6, "downloading assets for %@ %@ had error %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_6_2();
}

@end
