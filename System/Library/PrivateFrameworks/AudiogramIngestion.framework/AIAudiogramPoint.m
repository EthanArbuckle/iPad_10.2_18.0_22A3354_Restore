@implementation AIAudiogramPoint

- (AIAudiogramPoint)initWithSymbolName:(id)a3 frequency:(double)a4 dbValue:(double)a5 confidence:(double)a6
{
  id v10;
  AIAudiogramPoint *v11;
  AIAudiogramPoint *v12;
  objc_super v14;

  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AIAudiogramPoint;
  v11 = -[AIAudiogramPoint init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[AIAudiogramPoint setSymbolName:](v11, "setSymbolName:", v10);
    -[AIAudiogramPoint setFrequency:](v12, "setFrequency:", a4);
    -[AIAudiogramPoint setDbValue:](v12, "setDbValue:", a5);
    -[AIAudiogramPoint setConfidence:](v12, "setConfidence:", a6);
  }

  return v12;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_symbolName, a3);
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)a3
{
  self->_frequency = a3;
}

- (double)dbValue
{
  return self->_dbValue;
}

- (void)setDbValue:(double)a3
{
  self->_dbValue = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
