@implementation SCNAnimationReference

- (void)dealloc
{
  objc_super v3;

  -[SCNAnimationReference setReferenceName:](self, "setReferenceName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SCNAnimationReference;
  -[SCNAnimationReference dealloc](&v3, sel_dealloc);
}

- (BOOL)_isAReference
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNAnimationReference;
  v4 = -[SCNAnimationReference copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setReferenceName:", -[SCNAnimationReference referenceName](self, "referenceName"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  objc_super v6;

  objc_msgSend(a3, "encodeObject:forKey:", -[SCNAnimationReference referenceName](self, "referenceName"), CFSTR("referenceName"));
  -[SCNAnimationReference repeatCount](self, "repeatCount");
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("repeatCount"));
  -[SCNAnimationReference repeatDuration](self, "repeatDuration");
  *(float *)&v5 = v5;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("repeatDuration"), v5);
  objc_msgSend(a3, "encodeBool:forKey:", -[CAAnimation usesSceneTimeBase](self, "usesSceneTimeBase"), CFSTR("usesSceneTimeBase"));
  v6.receiver = self;
  v6.super_class = (Class)SCNAnimationReference;
  -[SCNAnimationReference encodeWithCoder:](&v6, sel_encodeWithCoder_, a3);
}

- (SCNAnimationReference)initWithCoder:(id)a3
{
  SCNAnimationReference *v4;
  float v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)SCNAnimationReference;
  v4 = -[SCNAnimationReference init](&v10, sel_init);
  if (v4)
  {
    -[SCNAnimationReference setReferenceName:](v4, "setReferenceName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceName")));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("repeatCount"));
    -[SCNAnimationReference setRepeatCount:](v4, "setRepeatCount:");
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("repeatDuration"));
    -[SCNAnimationReference setRepeatDuration:](v4, "setRepeatDuration:", v5);
    -[CAAnimation setUsesSceneTimeBase:](v4, "setUsesSceneTimeBase:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("usesSceneTimeBase")));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "assetCatalog"), "animationNamed:", -[SCNAnimationReference referenceName](v4, "referenceName"));
      if (v6)
      {
        v7 = v6;
        objc_msgSend(v6, "duration");
        -[SCNAnimationReference setDuration:](v4, "setDuration:");
        v11[0] = v7;
        -[SCNAnimationReference setAnimations:](v4, "setAnimations:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1));
      }
    }
    else
    {
      v8 = scn_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SCNAnimationReference initWithCoder:].cold.1();
    }
  }
  return v4;
}

- (NSString)referenceName
{
  return self->referenceName;
}

- (void)setReferenceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: referenced animations can't be resolved without a SCNAssetCatalog", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
