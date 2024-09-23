@implementation CSUSmileySpotterModelInput

- (CSUSmileySpotterModelInput)initWithTextEncoding:(id)a3 TextEncoderRevision:(int64_t)a4
{
  id v7;
  CSUSmileySpotterModelInput *v8;
  CSUSmileySpotterModelInput *v9;
  CSUSmileySpotterModelInput *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSUSmileySpotterModelInput;
  v8 = -[CSUSmileySpotterModelInput init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_textEncoding, a3);
    v9->_textEncoderrevision = a4;
    v10 = v9;
  }

  return v9;
}

- (MLMultiArray)textEncoding
{
  return (MLMultiArray *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)textEncoderrevision
{
  return self->_textEncoderrevision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEncoding, 0);
}

@end
