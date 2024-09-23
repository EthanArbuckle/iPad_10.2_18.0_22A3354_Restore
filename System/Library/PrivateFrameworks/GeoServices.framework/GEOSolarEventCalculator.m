@implementation GEOSolarEventCalculator

- (GEOSolarEventCalculator)initWithLocation:(id)a3 time:(double)a4 altitudeInDegrees:(double)a5 accuracy:(double)a6
{
  return -[GEOSolarEventCalculator initWithLocation:time:altitudeInDegrees:accuracy:after:](self, "initWithLocation:time:altitudeInDegrees:accuracy:after:", 1, a3.var0, a3.var1, a4, a5, a6);
}

- (void)dealloc
{
  _QWORD *rts;
  _QWORD *v4;
  uint64_t v5;
  objc_super v6;

  rts = self->_rts;
  if (rts)
  {
    v4 = (_QWORD *)rts[42];
    if (v4 == rts + 39)
    {
      v5 = 4;
      v4 = rts + 39;
    }
    else
    {
      if (!v4)
      {
LABEL_7:
        MEMORY[0x18D76437C](rts, 0x1020C40CBE26B1DLL);
        goto LABEL_8;
      }
      v5 = 5;
    }
    (*(void (**)(void))(*v4 + 8 * v5))();
    goto LABEL_7;
  }
LABEL_8:
  v6.receiver = self;
  v6.super_class = (Class)GEOSolarEventCalculator;
  -[GEOSolarEventCalculator dealloc](&v6, sel_dealloc);
}

- (GEOSolarEventCalculator)initWithLocation:(id)a3 time:(double)a4 altitudeInDegrees:(double)a5 accuracy:(double)a6 after:(BOOL)a7
{
  GEOSolarEventCalculator *v8;
  uint64_t v9;
  double v11;
  objc_super v12;
  BOOL v13;
  double v14;
  double v15;
  $F24F406B2B787EFB06265DBA3D28CBD5 v16;

  v16 = a3;
  v14 = a6;
  v15 = a5;
  v13 = a7;
  v12.receiver = self;
  v12.super_class = (Class)GEOSolarEventCalculator;
  v8 = -[GEOSolarEventCalculator init](&v12, sel_init);
  if (v8)
  {
    v9 = operator new();
    v11 = (*MEMORY[0x1E0C9ADF8] + a4) / 86400.0 + 2440587.5;
    GEORiseTransitSet::GEORiseTransitSet(v9, &v16.var0, &v11, &v15, &v14, &v13);
    v8->_rts = (void *)v9;
  }
  return v8;
}

- (double)nextEventOfType:(unsigned int)a3
{
  double v3;
  double v4;
  BOOL v5;
  double result;

  GEORiseTransitSet::eventOfType((GEORiseTransitSet *)self->_rts, a3);
  v4 = -(*MEMORY[0x1E0C9ADF8] - (v3 + -2440587.5) * 86400.0);
  v5 = v3 <= 0.0;
  result = 0.0;
  if (!v5)
    return v4;
  return result;
}

+ (double)nextEventOfType:(unsigned int)a3 after:(double)a4 forLocation:(id)a5
{
  double result;

  +[GEOSolarEventCalculator nextEventOfType:after:forLocation:altitudeInDegrees:accuracy:](GEOSolarEventCalculator, "nextEventOfType:after:forLocation:altitudeInDegrees:accuracy:", *(_QWORD *)&a3, a4, a5.var0, a5.var1, -3.0, 60.0);
  return result;
}

+ (double)nextEventOfType:(unsigned int)a3 after:(double)a4 forLocation:(id)a5 altitudeInDegrees:(double)a6 accuracy:(double)a7
{
  uint64_t v7;
  GEOSolarEventCalculator *v8;
  double v9;
  double v10;

  v7 = *(_QWORD *)&a3;
  v8 = -[GEOSolarEventCalculator initWithLocation:time:altitudeInDegrees:accuracy:]([GEOSolarEventCalculator alloc], "initWithLocation:time:altitudeInDegrees:accuracy:", a5.var0, a5.var1, a4, a6, a7);
  -[GEOSolarEventCalculator nextEventOfType:](v8, "nextEventOfType:", v7);
  v10 = v9;

  return v10;
}

+ (double)prevEventOfType:(unsigned int)a3 before:(double)a4 forLocation:(id)a5 altitudeInDegrees:(double)a6 accuracy:(double)a7
{
  uint64_t v7;
  GEOSolarEventCalculator *v8;
  double v9;
  double v10;

  v7 = *(_QWORD *)&a3;
  v8 = -[GEOSolarEventCalculator initWithLocation:time:altitudeInDegrees:accuracy:after:]([GEOSolarEventCalculator alloc], "initWithLocation:time:altitudeInDegrees:accuracy:after:", 0, a5.var0, a5.var1, a4, a6, a7);
  -[GEOSolarEventCalculator nextEventOfType:](v8, "nextEventOfType:", v7);
  v10 = v9;

  return v10;
}

- (GEOSolarEventCalculator)initWithLocation:(id)a3 time:(double)a4
{
  return -[GEOSolarEventCalculator initWithLocation:time:altitudeInDegrees:accuracy:](self, "initWithLocation:time:altitudeInDegrees:accuracy:", a3.var0, a3.var1, a4, -3.0, 60.0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t i;
  int v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p> all events: {\n"), v5, self);

  for (i = 0; i != 10; ++i)
  {
    v7 = allEvents[i];
    StringFromGEOSolarEventType(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GEORiseTransitSet::eventOfType((GEORiseTransitSet *)self->_rts, v7);
    objc_msgSend(v3, "appendFormat:", CFSTR("  %@: %f\n"), v8, v9);

  }
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

@end
