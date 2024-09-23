@implementation _MDQueryTokenVariation

- (_MDQueryTokenVariation)initWithVariation:(id)a3 type:(int64_t)a4 confidence:(float)a5
{
  _MDQueryTokenVariation *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)_MDQueryTokenVariation;
  v8 = -[_MDQueryTokenVariation init](&v10, sel_init);
  if (v8)
  {
    v8->_variation = (NSString *)objc_msgSend(a3, "copy");
    v8->_type = a4;
    v8->_confidence = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_MDQueryTokenVariation;
  -[_MDQueryTokenVariation dealloc](&v3, sel_dealloc);
}

- (NSString)variation
{
  return self->_variation;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end
