@implementation NSSymbolWiggleEffect

- (id)_withStyle:(int64_t)a3 angle:(double)a4
{
  *((_QWORD *)self + 3) = a3;
  *((double *)self + 4) = a4;
  return self;
}

+ (id)effect
{
  _QWORD *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolWiggleEffect;
  objc_msgSendSuper2(&v4, sel__effectWithType_, 9);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v2[2] = 0;
  v2[3] = 0;
  v2[4] = 0;
  return v2;
}

+ (id)wiggleClockwiseEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:angle:", 1, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)wiggleCounterClockwiseEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:angle:", 2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)wiggleLeftEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:angle:", 3, 180.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)wiggleRightEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:angle:", 3, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)wiggleUpEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:angle:", 3, -90.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)wiggleDownEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:angle:", 3, 90.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)wiggleForwardEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:angle:", 4, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)wiggleBackwardEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:angle:", 5, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)wiggleCustomAngleEffect:(double)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "effect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_withStyle:angle:", 3, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSSymbolWiggleEffect)effectWithByLayer
{
  _QWORD *v2;

  v2 = -[NSSymbolWiggleEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 1;
  return (NSSymbolWiggleEffect *)v2;
}

- (NSSymbolWiggleEffect)effectWithWholeSymbol
{
  _QWORD *v2;

  v2 = -[NSSymbolWiggleEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 2;
  return (NSSymbolWiggleEffect *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSymbolWiggleEffect;
  result = -[NSSymbolEffect copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 2) = self->_layerBehavior;
  *((_QWORD *)result + 3) = self->_style;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_angle;
  return result;
}

+ (double)_normalizeAngle:(double)result
{
  long double v3;

  if (result <= -180.0 || result > 180.0)
  {
    v3 = fmod(result, 360.0);
    result = fmod(v3 + 360.0, 360.0);
    if (result > 180.0)
      return result + -360.0;
  }
  return result;
}

- (id)_rbOptionsMutable
{
  void *v3;
  int64_t style;
  double v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_addLayerBehavior:ToOptions:", self->_layerBehavior, v3);
  style = self->_style;
  if (style == 1)
  {
    v6 = 19;
    goto LABEL_16;
  }
  if (style == 2)
  {
    v6 = 35;
    goto LABEL_16;
  }
  if (style != 3)
  {
LABEL_15:
    v6 = 0;
    goto LABEL_16;
  }
  objc_msgSend((id)objc_opt_class(), "_normalizeAngle:", self->_angle);
  if (v5 != 0.0)
  {
    if (v5 == 90.0)
    {
      v6 = 18;
      goto LABEL_16;
    }
    if (v5 == -90.0)
    {
      v6 = 34;
      goto LABEL_16;
    }
    if (v5 == 180.0)
    {
      v6 = 33;
      goto LABEL_16;
    }
    v7 = v5 * 0.0174532925;
    *(float *)&v7 = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("wiggleAngle"));

    goto LABEL_15;
  }
  v6 = 17;
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE7F388]);

  return v3;
}

- (int64_t)_layerBehavior
{
  return self->_layerBehavior;
}

- (void)set_layerBehavior:(int64_t)a3
{
  self->_layerBehavior = a3;
}

- (int64_t)_style
{
  return self->_style;
}

- (void)set_style:(int64_t)a3
{
  self->_style = a3;
}

- (double)_angle
{
  return self->_angle;
}

- (void)set_angle:(double)a3
{
  self->_angle = a3;
}

@end
