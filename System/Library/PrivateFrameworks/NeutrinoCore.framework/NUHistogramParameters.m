@implementation NUHistogramParameters

- (NUHistogramParameters)init
{
  NUHistogramParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUHistogramParameters;
  result = -[NUHistogramParameters init](&v3, sel_init);
  result->_colorMatrix.r = ($43F634250C0E94E2A09AB0840E4770D1)NUStandardLuminanceColorMatrix;
  result->_colorMatrix.g = ($43F634250C0E94E2A09AB0840E4770D1)unk_1A671A158;
  result->_colorMatrix.b = ($43F634250C0E94E2A09AB0840E4770D1)xmmword_1A671A168;
  result->_colorMatrix.a = ($43F634250C0E94E2A09AB0840E4770D1)unk_1A671A178;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $43F634250C0E94E2A09AB0840E4770D1 g;
  $43F634250C0E94E2A09AB0840E4770D1 b;
  $43F634250C0E94E2A09AB0840E4770D1 a;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  g = self->_colorMatrix.g;
  b = self->_colorMatrix.b;
  a = self->_colorMatrix.a;
  *($43F634250C0E94E2A09AB0840E4770D1 *)((char *)result + 8) = self->_colorMatrix.r;
  *($43F634250C0E94E2A09AB0840E4770D1 *)((char *)result + 56) = a;
  *($43F634250C0E94E2A09AB0840E4770D1 *)((char *)result + 40) = b;
  *($43F634250C0E94E2A09AB0840E4770D1 *)((char *)result + 24) = g;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" [0] = {%.3f, %f, %.3f , %.3f} [1] = {%.3f, %f, %.3f , %.3f} [2] = {%.3f, %f, %.3f , %.3f} [3] = {%.3f, %f, %.3f , %.3f}"), self->_colorMatrix.r.r, self->_colorMatrix.r.g, self->_colorMatrix.r.b, self->_colorMatrix.r.a, self->_colorMatrix.g.r, self->_colorMatrix.g.g, self->_colorMatrix.g.b, self->_colorMatrix.g.a, self->_colorMatrix.b.r, self->_colorMatrix.b.g, self->_colorMatrix.b.b, self->_colorMatrix.b.a, self->_colorMatrix.a.r, self->_colorMatrix.a.g, self->_colorMatrix.a.b, self->_colorMatrix.a.a);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p colorMatrix:%@ >"), objc_opt_class(), self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- ($6DEFAE59D8B0B490C28D581BBA01C329)colorMatrix
{
  $6DEFAE59D8B0B490C28D581BBA01C329 *result;

  objc_copyStruct(retstr, &self->_colorMatrix, 64, 1, 0);
  return result;
}

- (void)setColorMatrix:(id *)a3
{
  objc_copyStruct(&self->_colorMatrix, a3, 64, 1, 0);
}

@end
