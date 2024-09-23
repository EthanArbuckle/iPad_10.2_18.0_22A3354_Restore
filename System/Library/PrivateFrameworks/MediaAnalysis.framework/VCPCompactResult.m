@implementation VCPCompactResult

- (VCPCompactResult)initWithTimerange:(id *)a3 andScore:(float)a4
{
  char *v6;
  VCPCompactResult *v7;
  __int128 v8;
  __int128 v9;
  char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VCPCompactResult;
  v6 = -[VCPCompactResult init](&v12, sel_init);
  v7 = (VCPCompactResult *)v6;
  if (v6)
  {
    v8 = *(_OWORD *)&a3->var0.var0;
    v9 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)(v6 + 44) = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v6 + 28) = v9;
    *(_OWORD *)(v6 + 12) = v8;
    *((float *)v6 + 2) = a4;
    v10 = v6;
  }

  return v7;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)timerange
{
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *result;

  objc_copyStruct(retstr, &self->_score + 1, 48, 1, 0);
  return result;
}

- (void)setTimerange:(id *)a3
{
  objc_copyStruct(&self->_score + 1, a3, 48, 1, 0);
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

@end
