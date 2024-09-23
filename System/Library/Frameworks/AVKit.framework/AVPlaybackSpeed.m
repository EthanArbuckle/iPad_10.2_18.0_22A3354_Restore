@implementation AVPlaybackSpeed

void __38__AVPlaybackSpeed_systemDefaultSpeeds__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  double v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(*(Class *)(a1 + 32));
  AVLocalizedString(CFSTR("Half Speed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0.5;
  v5 = (void *)objc_msgSend(v2, "initWithRate:localizedName:", v3, v4);
  v24[0] = v5;
  v6 = objc_alloc(*(Class *)(a1 + 32));
  AVLocalizedString(CFSTR("Normal Speed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1.0;
  v9 = (void *)objc_msgSend(v6, "initWithRate:localizedName:", v7, v8, v5);
  v24[1] = v9;
  v10 = objc_alloc(*(Class *)(a1 + 32));
  AVLocalizedString(CFSTR("Fast Speed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1.25;
  v13 = (void *)objc_msgSend(v10, "initWithRate:localizedName:", v11, v12);
  v24[2] = v13;
  v14 = objc_alloc(*(Class *)(a1 + 32));
  AVLocalizedString(CFSTR("Faster Speed"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 1.5;
  v17 = (void *)objc_msgSend(v14, "initWithRate:localizedName:", v15, v16);
  v24[3] = v17;
  v18 = objc_alloc(*(Class *)(a1 + 32));
  AVLocalizedString(CFSTR("Double Speed"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = 2.0;
  v21 = (void *)objc_msgSend(v18, "initWithRate:localizedName:", v19, v20);
  v24[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)AVPlaybackSpeedSystemDefaultSpeeds;
  AVPlaybackSpeedSystemDefaultSpeeds = v22;

}

- (AVPlaybackSpeed)initWithRate:(float)a3 localizedName:(id)a4 synthesized:(BOOL)a5
{
  id v8;
  AVPlaybackSpeed *v9;
  AVPlaybackSpeed *v10;
  uint64_t v11;
  NSString *localizedName;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  uint64_t v19;
  NSString *localizedNumericName;
  objc_super v22;

  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)AVPlaybackSpeed;
  v9 = -[AVPlaybackSpeed init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_rate = a3;
    v11 = objc_msgSend(v8, "copy");
    localizedName = v10->_localizedName;
    v10->_localizedName = (NSString *)v11;

    v13 = (void *)objc_opt_self();
    v14 = (void *)MEMORY[0x1E0CB3940];
    AVLocalizedString(CFSTR("%@\\U00D7"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v17 = a3;
    objc_msgSend(v13, "_rateFormattedAsString:locale:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v15, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    localizedNumericName = v10->_localizedNumericName;
    v10->_localizedNumericName = (NSString *)v19;

    v10->_synthesized = a5;
  }

  return v10;
}

- (AVPlaybackSpeed)initWithRate:(float)rate localizedName:(NSString *)localizedName
{
  return -[AVPlaybackSpeed initWithRate:localizedName:synthesized:](self, "initWithRate:localizedName:synthesized:", localizedName, 0);
}

+ (id)_rateFormattedAsString:(float)a3 locale:(id)a4
{
  id v5;
  void *v6;
  double v7;
  float v8;
  id v9;
  __CFString *v10;
  void *v11;
  double v12;
  id v13;
  const __CFString *v15;

  v5 = a4;
  v6 = v5;
  v7 = a3;
  if (a3 <= 0.01)
  {
    v10 = CFSTR("0.01");
  }
  else
  {
    v8 = (float)(a3 * 10.0) - floorf(a3 * 10.0);
    if (v5)
    {
      v9 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v9;
    v12 = v8;
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v12 > 0.951 || v12 <= 0.051)
      v15 = CFSTR("%0.1f");
    else
      v15 = CFSTR("%0.2f");
    v10 = (__CFString *)objc_msgSend(v13, "initWithFormat:locale:", v15, v11, *(_QWORD *)&v7);

  }
  return v10;
}

- (float)rate
{
  return self->_rate;
}

+ (NSArray)systemDefaultSpeeds
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AVPlaybackSpeed_systemDefaultSpeeds__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (systemDefaultSpeeds_createSystemDefaultSpeedsOnce != -1)
    dispatch_once(&systemDefaultSpeeds_createSystemDefaultSpeedsOnce, block);
  return (NSArray *)(id)AVPlaybackSpeedSystemDefaultSpeeds;
}

- (NSString)localizedNumericName
{
  return self->_localizedNumericName;
}

- (BOOL)isSynthesized
{
  return self->_synthesized;
}

- (id)internalDescription
{
  _BOOL4 v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = -[AVPlaybackSpeed isSynthesized](self, "isSynthesized");
  v4 = CFSTR("selectable");
  if (v3)
    v4 = CFSTR("not selectable");
  v9.receiver = self;
  v9.super_class = (Class)AVPlaybackSpeed;
  v5 = v4;
  -[AVPlaybackSpeed description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" [%f, %@, %@, %@]"), self->_rate, v5, self->_localizedNumericName, self->_localizedName, v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVPlaybackSpeed;
  -[AVPlaybackSpeed description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" [%f, %@, %@]"), self->_rate, self->_localizedNumericName, self->_localizedName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNumericName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
