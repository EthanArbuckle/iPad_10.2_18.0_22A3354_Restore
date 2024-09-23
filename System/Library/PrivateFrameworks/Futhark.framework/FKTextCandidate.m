@implementation FKTextCandidate

- (FKTextCandidate)initWithText:(id)a3 confidence:(float)a4
{
  FKTextCandidate *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FKTextCandidate;
  v6 = -[FKTextCandidate init](&v8, sel_init);
  if (v6)
  {
    v6->_text = (NSString *)a3;
    v6->_confidence = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_text = 0;
  v3.receiver = self;
  v3.super_class = (Class)FKTextCandidate;
  -[FKTextCandidate dealloc](&v3, sel_dealloc);
}

- (NSString)text
{
  return self->_text;
}

- (float)confidence
{
  return self->_confidence;
}

@end
