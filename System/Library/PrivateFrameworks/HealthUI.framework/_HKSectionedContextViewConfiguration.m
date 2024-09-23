@implementation _HKSectionedContextViewConfiguration

- (BOOL)isEqual:(id)a3
{
  _HKSectionedContextViewConfiguration *v4;
  _HKSectionedContextViewConfiguration *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int v9;
  _BOOL4 v11;

  v4 = (_HKSectionedContextViewConfiguration *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      LOBYTE(v9) = 1;
      goto LABEL_8;
    }
    v6 = -[_HKSectionedContextViewConfiguration isHorizontalInTwoOverlaysMode](v4, "isHorizontalInTwoOverlaysMode");
    if (v6 == -[_HKSectionedContextViewConfiguration isHorizontalInTwoOverlaysMode](self, "isHorizontalInTwoOverlaysMode"))
    {
      v7 = -[_HKSectionedContextViewConfiguration bottomInsetsEnabled](v5, "bottomInsetsEnabled");
      if (v7 == -[_HKSectionedContextViewConfiguration bottomInsetsEnabled](self, "bottomInsetsEnabled"))
      {
        v8 = -[_HKSectionedContextViewConfiguration horizontalInsetsEnabled](v5, "horizontalInsetsEnabled");
        if (v8 == -[_HKSectionedContextViewConfiguration horizontalInsetsEnabled](self, "horizontalInsetsEnabled"))
        {
          v11 = -[_HKSectionedContextViewConfiguration topInsetsWithNoHeaderEnabled](v5, "topInsetsWithNoHeaderEnabled");
          v9 = v11 ^ -[_HKSectionedContextViewConfiguration topInsetsWithNoHeaderEnabled](self, "topInsetsWithNoHeaderEnabled") ^ 1;
          goto LABEL_8;
        }
      }
    }
  }
  LOBYTE(v9) = 0;
LABEL_8:

  return v9;
}

- (unint64_t)hash
{
  return self->_bottomInsetsEnabled ^ self->_isHorizontalInTwoOverlaysMode ^ self->_horizontalInsetsEnabled ^ self->_topInsetsWithNoHeaderEnabled;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _HKSectionedContextViewConfiguration *v4;

  v4 = objc_alloc_init(_HKSectionedContextViewConfiguration);
  -[_HKSectionedContextViewConfiguration setIsHorizontalInTwoOverlaysMode:](v4, "setIsHorizontalInTwoOverlaysMode:", -[_HKSectionedContextViewConfiguration isHorizontalInTwoOverlaysMode](self, "isHorizontalInTwoOverlaysMode"));
  -[_HKSectionedContextViewConfiguration setBottomInsetsEnabled:](v4, "setBottomInsetsEnabled:", -[_HKSectionedContextViewConfiguration bottomInsetsEnabled](self, "bottomInsetsEnabled"));
  -[_HKSectionedContextViewConfiguration setHorizontalInsetsEnabled:](v4, "setHorizontalInsetsEnabled:", -[_HKSectionedContextViewConfiguration horizontalInsetsEnabled](self, "horizontalInsetsEnabled"));
  -[_HKSectionedContextViewConfiguration setTopInsetsWithNoHeaderEnabled:](v4, "setTopInsetsWithNoHeaderEnabled:", -[_HKSectionedContextViewConfiguration topInsetsWithNoHeaderEnabled](self, "topInsetsWithNoHeaderEnabled"));
  return v4;
}

- (BOOL)isHorizontalInTwoOverlaysMode
{
  return self->_isHorizontalInTwoOverlaysMode;
}

- (void)setIsHorizontalInTwoOverlaysMode:(BOOL)a3
{
  self->_isHorizontalInTwoOverlaysMode = a3;
}

- (BOOL)bottomInsetsEnabled
{
  return self->_bottomInsetsEnabled;
}

- (void)setBottomInsetsEnabled:(BOOL)a3
{
  self->_bottomInsetsEnabled = a3;
}

- (BOOL)horizontalInsetsEnabled
{
  return self->_horizontalInsetsEnabled;
}

- (void)setHorizontalInsetsEnabled:(BOOL)a3
{
  self->_horizontalInsetsEnabled = a3;
}

- (BOOL)topInsetsWithNoHeaderEnabled
{
  return self->_topInsetsWithNoHeaderEnabled;
}

- (void)setTopInsetsWithNoHeaderEnabled:(BOOL)a3
{
  self->_topInsetsWithNoHeaderEnabled = a3;
}

@end
