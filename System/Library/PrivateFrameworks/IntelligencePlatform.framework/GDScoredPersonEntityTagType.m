@implementation GDScoredPersonEntityTagType

- (GDScoredPersonEntityTagType)initWithTag:(int64_t)a3 score:(double)a4
{
  GDScoredPersonEntityTagType *v6;
  GDScoredPersonEntityTagInner *v7;
  const char *v8;
  uint64_t v9;
  GDScoredPersonEntityTagInner *inner;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GDScoredPersonEntityTagType;
  v6 = -[GDScoredPersonEntityTagType init](&v12, sel_init);
  if (v6)
  {
    v7 = [GDScoredPersonEntityTagInner alloc];
    v9 = objc_msgSend_initWithGdTag_score_inferenceEventIdValue_(v7, v8, a3, 0, a4);
    inner = v6->inner;
    v6->inner = (GDScoredPersonEntityTagInner *)v9;

  }
  return v6;
}

- (int64_t)tag
{
  uint64_t v2;

  return objc_msgSend_gdTag(self->inner, a2, v2);
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
