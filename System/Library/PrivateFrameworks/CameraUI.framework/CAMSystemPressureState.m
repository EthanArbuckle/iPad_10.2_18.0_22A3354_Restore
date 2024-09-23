@implementation CAMSystemPressureState

- (CAMSystemPressureState)initWithCaptureSystemPressureState:(id)a3
{
  id v5;
  CAMSystemPressureState *v6;
  CAMSystemPressureState *v7;
  CAMSystemPressureState *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMSystemPressureState;
  v6 = -[CAMSystemPressureState init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__underlyingSystemPressureState, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[CAMSystemPressureState isEqualToSystemPressureState:](self, "isEqualToSystemPressureState:", v4);

  return v5;
}

- (BOOL)isEqualToSystemPressureState:(id)a3
{
  CAMSystemPressureState *v4;
  CAMSystemPressureState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (CAMSystemPressureState *)a3;
  v5 = v4;
  if (v4 == self)
    goto LABEL_6;
  -[CAMSystemPressureState _underlyingSystemPressureState](v4, "_underlyingSystemPressureState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[CAMSystemPressureState _underlyingSystemPressureState](self, "_underlyingSystemPressureState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_5;
LABEL_6:
    v10 = 1;
    goto LABEL_7;
  }

LABEL_5:
  -[CAMSystemPressureState _underlyingSystemPressureState](v5, "_underlyingSystemPressureState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemPressureState _underlyingSystemPressureState](self, "_underlyingSystemPressureState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

LABEL_7:
  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CAMSystemPressureState;
  -[CAMSystemPressureState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemPressureState _underlyingSystemPressureState](self, "_underlyingSystemPressureState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isCameraTooHot
{
  void *v2;
  char v3;
  void *v4;

  -[CAMSystemPressureState _underlyingSystemPressureState](self, "_underlyingSystemPressureState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "factors") & 8) != 0)
  {
    objc_msgSend(v2, "level");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8A1D0]);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (AVCaptureSystemPressureState)_underlyingSystemPressureState
{
  return self->__underlyingSystemPressureState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__underlyingSystemPressureState, 0);
}

@end
