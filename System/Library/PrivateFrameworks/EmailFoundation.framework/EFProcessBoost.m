@implementation EFProcessBoost

- (EFProcessBoost)initWithBoost:(id)a3
{
  id v4;
  EFProcessBoost *v5;
  void *v6;
  id boost;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFProcessBoost;
  v5 = -[EFProcessBoost init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    boost = v5->_boost;
    v5->_boost = v6;

  }
  return v5;
}

- (void)drop
{
  void (**boost)(id, SEL);

  boost = (void (**)(id, SEL))self->_boost;
  if (boost)
  {
    boost[2](boost, a2);
    boost = (void (**)(id, SEL))self->_boost;
  }
  self->_boost = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_boost, 0);
}

@end
