@implementation SCNActionCustom

- (SCNActionCustom)init
{
  SCNActionCustom *v2;
  SCNCActionCustom *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNActionCustom;
  v2 = -[SCNAction init](&v5, sel_init);
  if (v2)
  {
    v3 = (SCNCActionCustom *)operator new();
    SCNCActionCustom::SCNCActionCustom(v3, -[SCNAction caction](v2, "caction"));
    -[SCNAction setCppAction:](v2, "setCppAction:", v3);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SCNActionCustom;
  -[SCNAction dealloc](&v2, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SCNActionCustom;
  -[SCNAction encodeWithCoder:](&v11, sel_encodeWithCoder_, a3);
  v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[SCNActionCustom encodeWithCoder:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isCustom
{
  return 1;
}

- (SCNActionCustom)initWithCoder:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = scn_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[SCNActionCustom initWithCoder:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  return -[SCNActionCustom init](self, "init");
}

+ (id)customActionWithDuration:(double)a3 actionBlock:(id)a4
{
  SCNActionCustom *v6;
  uint64_t v7;
  double v8;

  v6 = objc_alloc_init(SCNActionCustom);
  v7 = -[SCNAction caction](v6, "caction");
  *(_QWORD *)(v7 + 144) = _Block_copy(a4);
  v8 = 1.79769313e308;
  if (fabs(a3) != INFINITY)
    v8 = a3;
  -[SCNAction setDuration:](v6, "setDuration:", v8);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  SCNCAction *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNActionCustom;
  v4 = -[SCNAction copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[SCNAction caction](self, "caction");
  v6 = objc_msgSend(v4, "caction");
  *(_QWORD *)(v6 + 144) = _Block_copy(v5[1].var0);
  return v4;
}

- (id)reversedAction
{
  return -[SCNAction copy](self, "copy");
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: SCNAction: Custom actions can not be properly encoded, Objective-C blocks do not support NSSecureCoding.", a5, a6, a7, a8, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: SCNAction: Custom actions can not be properly decoded, Objective-C blocks do not support NSCoding.", a5, a6, a7, a8, 0);
}

@end
