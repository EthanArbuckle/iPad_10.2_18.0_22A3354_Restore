@implementation CLSMeaningClue

- (CLSMeaningClue)init
{
  CLSMeaningClue *v2;
  CLSMeaningClue *v3;
  id relatedData;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSMeaningClue;
  v2 = -[CLSClue init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    relatedData = v2->_relatedData;
    v2->_relatedData = 0;

  }
  return v3;
}

- (id)relatedData
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setRelatedData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_relatedData, 0);
}

@end
