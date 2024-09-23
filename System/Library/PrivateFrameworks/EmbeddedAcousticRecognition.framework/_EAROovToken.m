@implementation _EAROovToken

- (_EAROovToken)initWithOrthography:(id)a3 prons:(id)a4 frequency:(int64_t)a5
{
  id v9;
  id v10;
  _EAROovToken *v11;
  _EAROovToken *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_EAROovToken;
  v11 = -[_EAROovToken init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_orthography, a3);
    objc_storeStrong((id *)&v12->_prons, a4);
    v12->_frequency = a5;
  }

  return v12;
}

- (NSString)orthography
{
  return self->_orthography;
}

- (NSSet)prons
{
  return self->_prons;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prons, 0);
  objc_storeStrong((id *)&self->_orthography, 0);
}

@end
