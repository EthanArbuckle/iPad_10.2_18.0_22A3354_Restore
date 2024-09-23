@implementation HKCVGaussianBlurKey

- (HKCVGaussianBlurKey)initWithIdentifier:(unint64_t)a3 textureSize:(id *)a4
{
  HKCVGaussianBlurKey *result;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKCVGaussianBlurKey;
  result = -[HKCVGaussianBlurKey init](&v8, sel_init);
  if (result)
  {
    result->_identifier = a3;
    v7 = *(_OWORD *)&a4->var0;
    result->_textureSize.depth = a4->var2;
    *(_OWORD *)&result->_textureSize.width = v7;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    if (!a3)
      goto LABEL_8;
    v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
    if (!v5)
      return v5;
    if (self->_identifier != *((_QWORD *)a3 + 1)
      || self->_textureSize.width != *((_QWORD *)a3 + 2)
      || self->_textureSize.height != *((_QWORD *)a3 + 3))
    {
LABEL_8:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = self->_textureSize.depth == *((_QWORD *)a3 + 4);
  }
  return v5;
}

- (unint64_t)hash
{
  return self->_textureSize.width ^ (self->_textureSize.height << 8) ^ (self->_textureSize.depth << 16) ^ (self->_identifier << 24);
}

@end
