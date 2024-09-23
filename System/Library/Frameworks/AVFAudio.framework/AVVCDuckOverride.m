@implementation AVVCDuckOverride

- (AVVCDuckOverride)initWithDuckOthers:(id)a3 duckToLevel:(id)a4 mixWithOthers:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVVCDuckOverride *v12;
  AVVCDuckOverride *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVVCDuckOverride;
  v12 = -[AVVCDuckOverride init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_duckOthers, a3);
    objc_storeStrong((id *)&v13->_duckToLevel, a4);
    v13->_isBlur = 0;
    objc_storeStrong((id *)&v13->_mixWithOthers, a5);
  }

  return v13;
}

- (AVVCDuckOverride)init
{
  AVVCDuckOverride *v2;
  AVVCDuckOverride *v3;
  NSNumber *duckOthers;
  NSNumber *mixWithOthers;
  NSNumber *duckToLevel;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVVCDuckOverride;
  v2 = -[AVVCDuckOverride init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    duckOthers = v2->_duckOthers;
    v2->_duckOthers = 0;

    mixWithOthers = v3->_mixWithOthers;
    v3->_mixWithOthers = 0;

    duckToLevel = v3->_duckToLevel;
    v3->_duckToLevel = 0;

    v3->_isBlur = 0;
  }
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<duckOthers(%@), duckToLevel(%@), isBlur(%d) mixWithOthers(%@)>"), self->_duckOthers, self->_duckToLevel, self->_isBlur, self->_mixWithOthers);
}

- (NSNumber)duckOthers
{
  return self->_duckOthers;
}

- (void)setDuckOthers:(id)a3
{
  objc_storeStrong((id *)&self->_duckOthers, a3);
}

- (NSNumber)duckToLevel
{
  return self->_duckToLevel;
}

- (void)setDuckToLevel:(id)a3
{
  objc_storeStrong((id *)&self->_duckToLevel, a3);
}

- (BOOL)isBlur
{
  return self->_isBlur;
}

- (void)setIsBlur:(BOOL)a3
{
  self->_isBlur = a3;
}

- (NSNumber)mixWithOthers
{
  return self->_mixWithOthers;
}

- (void)setMixWithOthers:(id)a3
{
  objc_storeStrong((id *)&self->_mixWithOthers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixWithOthers, 0);
  objc_storeStrong((id *)&self->_duckToLevel, 0);
  objc_storeStrong((id *)&self->_duckOthers, 0);
}

@end
