@implementation SCNActionRepeat

- (SCNActionRepeat)init
{
  SCNActionRepeat *v2;
  SCNCActionRepeat *v3;
  SCNCAction *v4;
  SCNCActionRepeat *mycaction;
  objc_super v7;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCNActionRepeat;
  v2 = -[SCNAction init](&v9, sel_init);
  if (v2)
  {
    v3 = (SCNCActionRepeat *)operator new();
    v8.receiver = v2;
    v8.super_class = (Class)SCNActionRepeat;
    v4 = -[SCNAction caction](&v8, sel_caction);
    SCNCActionRepeat::SCNCActionRepeat(v3, v4);
    v2->_mycaction = v3;
    v7.receiver = v2;
    v7.super_class = (Class)SCNActionRepeat;
    -[SCNAction setCppAction:](&v7, sel_setCppAction_, v3);
    v2->_repeatedAction = 0;
    v2->_mycaction->var19 = 0;
    mycaction = v2->_mycaction;
    mycaction->var23 = 0;
    mycaction->var20 = 0;
    mycaction->var21 = 0;
  }
  return v2;
}

- (SCNActionRepeat)initWithCoder:(id)a3
{
  SCNActionRepeat *v4;
  SCNCActionRepeat *v5;
  SCNCAction *v6;
  SCNAction *v7;
  objc_super v9;
  objc_super v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SCNActionRepeat;
  v4 = -[SCNAction initWithCoder:](&v11, sel_initWithCoder_);
  if (v4)
  {
    v5 = (SCNCActionRepeat *)operator new();
    v10.receiver = v4;
    v10.super_class = (Class)SCNActionRepeat;
    v6 = -[SCNAction caction](&v10, sel_caction);
    SCNCActionRepeat::SCNCActionRepeat(v5, v6);
    v4->_mycaction = v5;
    v9.receiver = v4;
    v9.super_class = (Class)SCNActionRepeat;
    -[SCNAction setCppAction:](&v9, sel_setCppAction_, v5);
    v4->_mycaction->var21 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timesToRepeat")), "unsignedIntValue");
    v4->_mycaction->var20 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timesRepeated")), "unsignedIntValue");
    v7 = (SCNAction *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_repeatedAction"));
    v4->_repeatedAction = v7;
    if (v7)
    {
      v4->_mycaction->var19 = -[SCNAction caction](v7, "caction");
      v4->_mycaction->var23 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_forever")), "BOOLValue");
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNActionRepeat;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_mycaction->var21), CFSTR("_timesToRepeat"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_mycaction->var20), CFSTR("_timesRepeated"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_repeatedAction, CFSTR("_repeatedAction"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var23), CFSTR("_forever"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isCustom
{
  return -[SCNAction isCustom](self->_repeatedAction, "isCustom");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNActionRepeat;
  -[SCNAction dealloc](&v3, sel_dealloc);
}

+ (id)repeatAction:(id)a3 count:(unint64_t)a4
{
  SCNActionRepeat *v6;
  SCNAction *v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a3)
  {
    v6 = objc_alloc_init(SCNActionRepeat);
    v7 = (SCNAction *)objc_msgSend(a3, "copy");
    v6->_repeatedAction = v7;
    v6->_mycaction->var19 = -[SCNAction caction](v7, "caction");
    v6->_mycaction->var21 = a4;
    objc_msgSend(a3, "duration");
    -[SCNAction setDuration:](v6, "setDuration:", v8 * (double)a4);
  }
  else
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[SCNActionRepeat repeatAction:count:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    return +[SCNActionRepeat repeatAction:count:](SCNActionRepeat, "repeatAction:count:", +[SCNAction waitForDuration:](SCNAction, "waitForDuration:", 1.0), a4);
  }
  return v6;
}

+ (id)repeatActionForever:(id)a3
{
  SCNActionRepeat *v4;
  SCNAction *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a3)
  {
    v4 = objc_alloc_init(SCNActionRepeat);
    v5 = (SCNAction *)objc_msgSend(a3, "copy");
    v4->_repeatedAction = v5;
    v4->_mycaction->var19 = -[SCNAction caction](v5, "caction");
    v4->_mycaction->var23 = 1;
  }
  else
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[SCNActionRepeat repeatActionForever:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    return +[SCNActionRepeat repeatActionForever:](SCNActionRepeat, "repeatActionForever:", +[SCNAction waitForDuration:](SCNAction, "waitForDuration:", 1.0));
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SCNCActionRepeat *mycaction;
  SCNAction *repeatedAction;
  id v6;
  id v8;

  mycaction = self->_mycaction;
  repeatedAction = self->_repeatedAction;
  if (mycaction->var23)
    v6 = +[SCNActionRepeat repeatActionForever:](SCNActionRepeat, "repeatActionForever:", repeatedAction);
  else
    v6 = +[SCNActionRepeat repeatAction:count:](SCNActionRepeat, "repeatAction:count:", repeatedAction, mycaction->var21);
  v8 = v6;
  objc_msgSend(v6, "setTimingMode:", -[SCNAction timingMode](self, "timingMode"));
  return v8;
}

- (id)reversedAction
{
  id result;

  result = +[SCNActionRepeat repeatAction:count:](SCNActionRepeat, "repeatAction:count:", objc_msgSend(self->_mycaction->var19->var3, "reversedAction"), self->_mycaction->var21);
  *(_BYTE *)(*((_QWORD *)result + 2) + 176) = self->_mycaction->var23;
  return result;
}

+ (void)repeatAction:(uint64_t)a3 count:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: repeatAction: invoked with a nil action", a5, a6, a7, a8, 0);
}

+ (void)repeatActionForever:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: repeatActionForever: invoked with a nil action", a5, a6, a7, a8, 0);
}

@end
