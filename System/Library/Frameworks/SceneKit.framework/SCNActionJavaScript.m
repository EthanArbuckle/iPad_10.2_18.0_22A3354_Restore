@implementation SCNActionJavaScript

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCNActionJavaScript)initWithString:(id)a3
{
  SCNActionJavaScript *v4;
  SCNCJavaScriptAction *v5;
  SCNCAction *v6;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNActionJavaScript;
  v4 = -[SCNAction init](&v10, sel_init);
  if (v4)
  {
    v4->_script = (NSString *)objc_msgSend(a3, "copy");
    v5 = (SCNCJavaScriptAction *)operator new();
    v9.receiver = v4;
    v9.super_class = (Class)SCNActionJavaScript;
    v6 = -[SCNAction caction](&v9, sel_caction);
    SCNCJavaScriptAction::SCNCJavaScriptAction(v5, v6, (NSString *)a3);
    v8.receiver = v4;
    v8.super_class = (Class)SCNActionJavaScript;
    -[SCNAction setCppAction:](&v8, sel_setCppAction_, v5);
  }
  return v4;
}

+ (id)javaScriptActionWithDuration:(double)a3 script:(id)a4
{
  SCNActionJavaScript *v5;

  v5 = -[SCNActionJavaScript initWithString:]([SCNActionJavaScript alloc], "initWithString:", a4);
  -[SCNAction setDuration:](v5, "setDuration:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNActionJavaScript;
  -[SCNAction dealloc](&v3, sel_dealloc);
}

- (BOOL)isCustom
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SCNActionJavaScript *v4;
  SCNCAction *v5;
  uint64_t v6;

  v4 = -[SCNActionJavaScript initWithString:]([SCNActionJavaScript alloc], "initWithString:", self->_script);
  v5 = -[SCNAction caction](self, "caction");
  v6 = -[SCNAction caction](v4, "caction");
  *(_OWORD *)(v6 + 56) = *(_OWORD *)&v5->var7;
  *(_QWORD *)(v6 + 104) = v5->var14;
  *(_OWORD *)(v6 + 120) = *(_OWORD *)&v5->var16;
  *(_WORD *)(v6 + 80) = 0;
  return v4;
}

- (id)reversedAction
{
  return -[SCNAction copy](self, "copy");
}

- (SCNActionJavaScript)initWithCoder:(id)a3
{
  SCNActionJavaScript *v4;
  void *v5;
  SCNCJavaScriptAction *v6;
  SCNCAction *v7;
  objc_super v9;
  objc_super v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SCNActionJavaScript;
  v4 = -[SCNAction initWithCoder:](&v11, sel_initWithCoder_);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("script"));
    v4->_script = (NSString *)objc_msgSend(v5, "copy");
    v6 = (SCNCJavaScriptAction *)operator new();
    v10.receiver = v4;
    v10.super_class = (Class)SCNActionJavaScript;
    v7 = -[SCNAction caction](&v10, sel_caction);
    SCNCJavaScriptAction::SCNCJavaScriptAction(v6, v7, (NSString *)v5);
    v9.receiver = v4;
    v9.super_class = (Class)SCNActionJavaScript;
    -[SCNAction setCppAction:](&v9, sel_setCppAction_, v6);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNActionJavaScript;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_script, CFSTR("script"));
}

- (id)parameters
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_script;
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

@end
