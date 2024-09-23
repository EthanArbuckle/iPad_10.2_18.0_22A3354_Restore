@implementation SKHide

- (SKHide)init
{
  SKHide *v2;
  SKCHide *v3;
  SKCAction *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKHide;
  v2 = -[SKAction init](&v8, sel_init);
  if (v2)
  {
    v3 = (SKCHide *)operator new();
    v7.receiver = v2;
    v7.super_class = (Class)SKHide;
    v4 = -[SKAction caction](&v7, sel_caction);
    SKCHide::SKCHide(v3, v4);
    v2->_mycaction = v3;
    v6.receiver = v2;
    v6.super_class = (Class)SKHide;
    -[SKAction setCppAction:](&v6, sel_setCppAction_, v3);
  }
  return v2;
}

- (SKHide)initWithCoder:(id)a3
{
  id v4;
  SKHide *v5;
  SKCHide *v6;
  SKCAction *v7;
  objc_super v9;
  objc_super v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKHide;
  v5 = -[SKAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (SKCHide *)operator new();
    v10.receiver = v5;
    v10.super_class = (Class)SKHide;
    v7 = -[SKAction caction](&v10, sel_caction);
    SKCHide::SKCHide(v6, v7);
    v5->_mycaction = v6;
    v9.receiver = v5;
    v9.super_class = (Class)SKHide;
    -[SKAction setCppAction:](&v9, sel_setCppAction_, v6);
    v5->_mycaction->var19 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hiddenValue"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKHide;
  -[SKAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_mycaction->var19, CFSTR("_hiddenValue"));

}

+ (id)hide
{
  SKHide *v2;

  v2 = objc_alloc_init(SKHide);
  v2->_mycaction->var19 = 1;
  -[SKAction setDuration:](v2, "setDuration:", 0.0);
  return v2;
}

+ (id)unhide
{
  SKHide *v2;

  v2 = objc_alloc_init(SKHide);
  v2->_mycaction->var19 = 0;
  -[SKAction setDuration:](v2, "setDuration:", 0.0);
  return v2;
}

- (id)reversedAction
{
  if (self->_mycaction->var19)
    +[SKHide unhide](SKHide, "unhide");
  else
    +[SKHide hide](SKHide, "hide");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_mycaction->var19)
    +[SKHide hide](SKHide, "hide", a3);
  else
    +[SKHide unhide](SKHide, "unhide", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
