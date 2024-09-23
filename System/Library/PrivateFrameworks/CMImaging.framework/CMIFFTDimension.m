@implementation CMIFFTDimension

- (CMIFFTDimension)initWithSize:(unint64_t)a3 iStride:(unint64_t)a4 oStride:(unint64_t)a5 primeFactors:(id)a6
{
  id v11;
  CMIFFTDimension *v12;
  CMIFFTDimension *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CMIFFTDimension;
  v12 = -[CMIFFTDimension init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_size = a3;
    v12->_iStride = a4;
    v12->_oStride = a5;
    objc_storeStrong((id *)&v12->_primeFactors, a6);
  }

  return v13;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)iStride
{
  return self->_iStride;
}

- (unint64_t)oStride
{
  return self->_oStride;
}

- (NSDictionary)primeFactors
{
  return self->_primeFactors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primeFactors, 0);
}

@end
