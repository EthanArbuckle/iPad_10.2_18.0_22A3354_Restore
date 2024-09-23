@implementation SCNActionReference

- (void)dealloc
{
  objc_super v3;

  -[SCNActionReference setReferenceName:](self, "setReferenceName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SCNActionReference;
  -[SCNActionGroup dealloc](&v3, sel_dealloc);
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
  v6.super_class = (Class)SCNActionReference;
  v4 = -[SCNActionGroup copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setReferenceName:", -[SCNActionReference referenceName](self, "referenceName"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  objc_msgSend(a3, "encodeObject:forKey:", -[SCNActionReference referenceName](self, "referenceName"), CFSTR("referenceName"));
  v5.receiver = self;
  v5.super_class = (Class)SCNActionReference;
  -[SCNActionGroup encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (SCNActionReference)initWithCoder:(id)a3
{
  SCNActionReference *v4;
  uint64_t v5;
  NSObject *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SCNActionReference;
  v4 = -[SCNActionGroup init](&v8, sel_init);
  if (!v4)
    goto LABEL_7;
  -[SCNActionReference setReferenceName:](v4, "setReferenceName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceName")));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNActionReference initWithCoder:].cold.1();
    goto LABEL_7;
  }
  v5 = objc_msgSend((id)objc_msgSend(a3, "assetCatalog"), "actionNamed:", -[SCNActionReference referenceName](v4, "referenceName"));
  if (!v5)
  {
LABEL_7:

    return 0;
  }
  v9[0] = v5;
  -[SCNActionGroup setupWithActions:](v4, "setupWithActions:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1));
  return v4;
}

- (NSString)referenceName
{
  return self->referenceName;
}

- (void)setReferenceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: referenced actions can't be resolved without a SCNAssetCatalog", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
