@implementation GDScoredPersonEntity

- (GDScoredPersonEntity)initWithIDValue:(int64_t)a3 score:(double)a4
{
  GDScoredPersonEntity *v6;
  GDScoredPersonInner *v7;
  const char *v8;
  uint64_t v9;
  GDScoredPersonInner *inner;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GDScoredPersonEntity;
  v6 = -[GDScoredPersonEntity init](&v12, sel_init);
  if (v6)
  {
    v7 = [GDScoredPersonInner alloc];
    v9 = objc_msgSend_initWithIdValue_score_inferenceEventIdValue_(v7, v8, a3, 0, a4);
    inner = v6->inner;
    v6->inner = (GDScoredPersonInner *)v9;

  }
  return v6;
}

- (int64_t)idValue
{
  uint64_t v2;

  return objc_msgSend_idValue(self->inner, a2, v2);
}

- (double)score
{
  uint64_t v2;
  double result;

  objc_msgSend_score(self->inner, a2, v2);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inner, 0);
}

@end
