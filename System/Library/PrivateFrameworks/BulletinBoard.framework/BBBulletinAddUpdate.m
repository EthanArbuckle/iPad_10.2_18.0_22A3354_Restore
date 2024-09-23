@implementation BBBulletinAddUpdate

+ (id)updateWithBulletin:(id)a3 feeds:(unint64_t)a4 shouldPlayLightsAndSirens:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBulletin:feeds:shouldPlayLightsAndSirens:", v8, a4, v5);

  return v9;
}

- (BBBulletinAddUpdate)initWithBulletin:(id)a3 feeds:(unint64_t)a4 shouldPlayLightsAndSirens:(BOOL)a5
{
  BBBulletinAddUpdate *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BBBulletinAddUpdate;
  result = -[BBBulletinUpdate initWithBulletin:feeds:](&v7, sel_initWithBulletin_feeds_, a3, a4);
  if (result)
    result->_shouldPlayLightsAndSirens = a5;
  return result;
}

- (id)typeDescription
{
  return CFSTR("add");
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BBBulletinAddUpdate;
  v3 = -[BBBulletinUpdate hash](&v5, sel_hash);
  return v3 ^ -[BBBulletinAddUpdate shouldPlayLightsAndSirens](self, "shouldPlayLightsAndSirens");
}

- (BOOL)isEqual:(id)a3
{
  BBBulletinAddUpdate *v4;
  BBBulletinAddUpdate *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  objc_super v9;

  v4 = (BBBulletinAddUpdate *)a3;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v9.receiver = self;
      v9.super_class = (Class)BBBulletinAddUpdate;
      if (-[BBBulletinUpdate isEqual:](&v9, sel_isEqual_, v5))
      {
        v6 = -[BBBulletinAddUpdate shouldPlayLightsAndSirens](self, "shouldPlayLightsAndSirens");
        v7 = v6 ^ -[BBBulletinAddUpdate shouldPlayLightsAndSirens](v5, "shouldPlayLightsAndSirens") ^ 1;
      }
      else
      {
        LOBYTE(v7) = 0;
      }

    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[BBBulletinAddUpdate shouldPlayLightsAndSirens](self, "shouldPlayLightsAndSirens"), CFSTR("Should Play Lights And Sirens"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

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

  v5.receiver = self;
  v5.super_class = (Class)BBBulletinAddUpdate;
  v4 = a3;
  -[BBBulletinUpdate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[BBBulletinAddUpdate shouldPlayLightsAndSirens](self, "shouldPlayLightsAndSirens", v5.receiver, v5.super_class), CFSTR("shouldPlayLightsAndSirens"));

}

- (BBBulletinAddUpdate)initWithCoder:(id)a3
{
  id v4;
  BBBulletinAddUpdate *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BBBulletinAddUpdate;
  v5 = -[BBBulletinUpdate initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_shouldPlayLightsAndSirens = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldPlayLightsAndSirens"));

  return v5;
}

- (BOOL)shouldPlayLightsAndSirens
{
  return self->_shouldPlayLightsAndSirens;
}

@end
