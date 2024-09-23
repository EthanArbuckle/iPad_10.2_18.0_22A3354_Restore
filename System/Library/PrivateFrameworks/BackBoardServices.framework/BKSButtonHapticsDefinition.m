@implementation BKSButtonHapticsDefinition

- (id)_initWithBSSettings:(id)a3
{
  id v4;
  BKSButtonHapticsDefinition *v5;
  uint64_t v6;
  BSMutableSettings *settings;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKSButtonHapticsDefinition;
  v5 = -[BKSButtonHapticsDefinition init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    settings = v5->_settings;
    v5->_settings = (BSMutableSettings *)v6;

  }
  return v5;
}

- (BKSButtonHapticsDefinition)init
{
  BKSButtonHapticsDefinition *v2;
  BSMutableSettings *v3;
  BSMutableSettings *settings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKSButtonHapticsDefinition;
  v2 = -[BKSButtonHapticsDefinition init](&v6, sel_init);
  if (v2)
  {
    v3 = (BSMutableSettings *)objc_alloc_init(MEMORY[0x1E0D017D0]);
    settings = v2->_settings;
    v2->_settings = v3;

  }
  return v2;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_representsHomeButton, CFSTR("representsHomeButton"));
  v5 = (id)objc_msgSend(v3, "appendInteger:withName:", -[BKSButtonHapticsDefinition maximumTapCount](self, "maximumTapCount"), CFSTR("maximumTapCount"));
  v6 = (id)objc_msgSend(v3, "appendInteger:withName:", -[BKSButtonHapticsDefinition maximumPressCount](self, "maximumPressCount"), CFSTR("maximumPressCount"));
  -[BKSButtonHapticsDefinition minimumMultiplePressTimeInterval](self, "minimumMultiplePressTimeInterval");
  v7 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("minimumMultiplePressTimeInterval"), 2);
  -[BKSButtonHapticsDefinition maximumMultiplePressTimeInterval](self, "maximumMultiplePressTimeInterval");
  v8 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("maximumMultiplePressTimeInterval"), 2);
  -[BKSButtonHapticsDefinition minimumLongPressTimeInterval](self, "minimumLongPressTimeInterval");
  v9 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("minimumLongPressTimeInterval"), 2);
  -[BKSButtonHapticsDefinition maximumLongPressTimeInterval](self, "maximumLongPressTimeInterval");
  v10 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("maximumLongPressTimeInterval"), 2);
  v11 = (id)objc_msgSend(v3, "appendInteger:withName:", -[BKSButtonHapticsDefinition clickHapticAssetType](self, "clickHapticAssetType"), CFSTR("clickHapticAssetType"));
  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)maximumTapCount
{
  void *v2;
  void *v3;
  int64_t v4;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = -1;

  return v4;
}

- (void)setMaximumTapCount:(int64_t)a3
{
  uint64_t v5;
  void *v7;
  id v8;

  if ((unint64_t)(a3 - 4) <= 0xFFFFFFFFFFFFFFFALL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSButtonHapticsDefinition.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maximumTapCount == BKSButtonDefinitionUnspecifiedValue || (maximumTapCount >= 0 && maximumTapCount <= BKSButtonDefinitionMaximumSupportedPressCount)"));

  }
  else if (a3 == -1)
  {
    v5 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v8 = (id)v5;
  -[BSMutableSettings setObject:forSetting:](self->_settings, "setObject:forSetting:", v5, 11);

}

- (int64_t)maximumPressCount
{
  void *v2;
  void *v3;
  int64_t v4;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = -1;

  return v4;
}

- (void)setMaximumPressCount:(int64_t)a3
{
  uint64_t v5;
  void *v7;
  id v8;

  if ((unint64_t)(a3 - 1) < 3)
    goto LABEL_5;
  if (a3 != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSButtonHapticsDefinition.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maximumPressCount == BKSButtonDefinitionUnspecifiedValue || (maximumPressCount >= 1 && maximumPressCount <= BKSButtonDefinitionMaximumSupportedPressCount)"));

LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v5 = 0;
LABEL_6:
  v8 = (id)v5;
  -[BSMutableSettings setObject:forSetting:](self->_settings, "setObject:forSetting:", v5, 10);

}

- (double)minimumMultiplePressTimeInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = -1.0;
  }

  return v5;
}

- (void)setMinimumMultiplePressTimeInterval:(double)a3
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (a3 > 30.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSButtonHapticsDefinition.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("multiplePressTimeInterval <= BK_MAX_TIMEOUT_SECONDS"));

  }
  if (a3 < -1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSButtonHapticsDefinition.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("multiplePressTimeInterval >= BKSButtonDefinitionUnspecifiedValue"));

  }
  if (a3 == -1.0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v6;
  -[BSMutableSettings setObject:forSetting:](self->_settings, "setObject:forSetting:", v6, 12);

}

- (double)maximumMultiplePressTimeInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = -1.0;
  }

  return v5;
}

- (void)setMaximumMultiplePressTimeInterval:(double)a3
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (a3 > 30.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSButtonHapticsDefinition.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("multiplePressTimeInterval <= BK_MAX_TIMEOUT_SECONDS"));

  }
  if (a3 < -1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSButtonHapticsDefinition.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("multiplePressTimeInterval >= BKSButtonDefinitionUnspecifiedValue"));

  }
  if (a3 == -1.0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v6;
  -[BSMutableSettings setObject:forSetting:](self->_settings, "setObject:forSetting:", v6, 13);

}

- (double)minimumLongPressTimeInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = -1.0;
  }

  return v5;
}

- (void)setMinimumLongPressTimeInterval:(double)a3
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (a3 > 30.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSButtonHapticsDefinition.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("longPressTimeInterval <= BK_MAX_TIMEOUT_SECONDS"));

  }
  if (a3 < -1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSButtonHapticsDefinition.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("longPressTimeInterval >= BKSButtonDefinitionUnspecifiedValue"));

  }
  if (a3 == -1.0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v6;
  -[BSMutableSettings setObject:forSetting:](self->_settings, "setObject:forSetting:", v6, 14);

}

- (double)maximumLongPressTimeInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 15);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = -1.0;
  }

  return v5;
}

- (void)setMaximumLongPressTimeInterval:(double)a3
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (a3 > 30.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSButtonHapticsDefinition.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("longPressTimeInterval <= BK_MAX_TIMEOUT_SECONDS"));

  }
  if (a3 < -1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSButtonHapticsDefinition.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("longPressTimeInterval >= BKSButtonDefinitionUnspecifiedValue"));

  }
  if (a3 == -1.0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v6;
  -[BSMutableSettings setObject:forSetting:](self->_settings, "setObject:forSetting:", v6, 15);

}

- (int64_t)isLongPressEnabled
{
  double v3;
  double v4;
  double v5;
  int64_t v6;

  -[BKSButtonHapticsDefinition minimumLongPressTimeInterval](self, "minimumLongPressTimeInterval");
  v4 = v3;
  -[BKSButtonHapticsDefinition maximumLongPressTimeInterval](self, "maximumLongPressTimeInterval");
  v6 = v5 > 0.0 || v4 > 0.0;
  if (v5 < 0.0 && v4 < 0.0)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v6;
}

- (int64_t)clickHapticAssetType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "integerValue"))
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (void)setClickHapticAssetType:(int64_t)a3
{
  uint64_t v5;
  void *v7;
  id v8;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSButtonHapticsDefinition.m"), 230, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetType >= BKSButtonHapticAssetTypeUndefined"));

  }
  else if (!a3)
  {
    v5 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v8 = (id)v5;
  -[BSMutableSettings setObject:forSetting:](self->_settings, "setObject:forSetting:", v5, 16);

}

- (void)updateFromDefinition:(id)a3 withChangeInspectorBlock:(id)a4
{
  id v6;
  BSMutableSettings *v7;
  void *v8;
  void *v9;
  BSMutableSettings *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  BSMutableSettings *v15;
  id v16;

  v6 = a4;
  v7 = self->_settings;
  objc_msgSend(a3, "_BSSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01858], "diffFromSettings:toSettings:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__BKSButtonHapticsDefinition_updateFromDefinition_withChangeInspectorBlock___block_invoke;
  v13[3] = &unk_1E1EA12A0;
  v15 = v7;
  v16 = v6;
  v14 = v8;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  objc_msgSend(v9, "inspectChangesWithBlock:", v13);

}

- (BKSButtonHapticsDefinition)initWithCoder:(id)a3
{
  id v4;
  BKSButtonHapticsDefinition *v5;

  v4 = a3;
  v5 = -[BKSButtonHapticsDefinition init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minimumMultiplePressTimeInterval"));
    -[BKSButtonHapticsDefinition setMinimumMultiplePressTimeInterval:](v5, "setMinimumMultiplePressTimeInterval:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maximumMultiplePressTimeInterval"));
    -[BKSButtonHapticsDefinition setMaximumMultiplePressTimeInterval:](v5, "setMaximumMultiplePressTimeInterval:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minimumLongPressTimeInterval"));
    -[BKSButtonHapticsDefinition setMinimumLongPressTimeInterval:](v5, "setMinimumLongPressTimeInterval:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maximumLongPressTimeInterval"));
    -[BKSButtonHapticsDefinition setMaximumLongPressTimeInterval:](v5, "setMaximumLongPressTimeInterval:");
    -[BKSButtonHapticsDefinition setMaximumTapCount:](v5, "setMaximumTapCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumTapCount")));
    -[BKSButtonHapticsDefinition setMaximumPressCount:](v5, "setMaximumPressCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumPressCount")));
    -[BKSButtonHapticsDefinition setClickHapticAssetType:](v5, "setClickHapticAssetType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clickHapticAssetType")));
    v5->_representsHomeButton = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("representsHomeButton"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[BKSButtonHapticsDefinition minimumMultiplePressTimeInterval](self, "minimumMultiplePressTimeInterval");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("minimumMultiplePressTimeInterval"));
  -[BKSButtonHapticsDefinition maximumMultiplePressTimeInterval](self, "maximumMultiplePressTimeInterval");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maximumMultiplePressTimeInterval"));
  -[BKSButtonHapticsDefinition minimumLongPressTimeInterval](self, "minimumLongPressTimeInterval");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("minimumLongPressTimeInterval"));
  -[BKSButtonHapticsDefinition maximumLongPressTimeInterval](self, "maximumLongPressTimeInterval");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maximumLongPressTimeInterval"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[BKSButtonHapticsDefinition maximumTapCount](self, "maximumTapCount"), CFSTR("maximumTapCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[BKSButtonHapticsDefinition maximumPressCount](self, "maximumPressCount"), CFSTR("maximumPressCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[BKSButtonHapticsDefinition clickHapticAssetType](self, "clickHapticAssetType"), CFSTR("clickHapticAssetType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_representsHomeButton, CFSTR("representsHomeButton"));

}

- (BSSettings)_BSSettings
{
  return self->_settings;
}

- (BOOL)representsHomeButton
{
  return self->_representsHomeButton;
}

- (void)setRepresentsHomeButton:(BOOL)a3
{
  self->_representsHomeButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

void __76__BKSButtonHapticsDefinition_updateFromDefinition_withChangeInspectorBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForSetting:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forSetting:", v5, a2);
    v4 = v5;
  }

}

+ (id)definitionForHomeButton
{
  BKSButtonHapticsDefinition *v2;

  v2 = objc_alloc_init(BKSButtonHapticsDefinition);
  -[BKSButtonHapticsDefinition setRepresentsHomeButton:](v2, "setRepresentsHomeButton:", 1);
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
