@implementation SGMEventResultSelectedInSpotlight

- (SGMEventResultSelectedInSpotlight)init
{
  SGMEventResultSelectedInSpotlight *v2;
  id v3;
  uint64_t v4;
  PETScalarEventTracker *tracker;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SGMEventResultSelectedInSpotlight;
  v2 = -[SGMEventResultSelectedInSpotlight init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D80F38]);
    v4 = objc_msgSend(v3, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("EventResultSelectedInSpotlight"), MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v4;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3
{
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](self->_tracker, "trackEventWithPropertyValues:value:", MEMORY[0x1E0C9AA60], a3);
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
}

@end
