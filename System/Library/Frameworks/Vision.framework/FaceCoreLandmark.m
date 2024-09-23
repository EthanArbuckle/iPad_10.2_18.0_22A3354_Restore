@implementation FaceCoreLandmark

+ (id)landmarkWithType:(id)a3 pointCount:(unint64_t)a4 points:(CGPoint *)a5
{
  id v7;
  FaceCoreLandmark *v8;

  v7 = a3;
  v8 = -[FaceCoreLandmark initWithType:pointCount:points:]([FaceCoreLandmark alloc], "initWithType:pointCount:points:", v7, a4, a5);

  return v8;
}

- (FaceCoreLandmark)initWithType:(id)a3 pointCount:(unint64_t)a4 points:(CGPoint *)a5
{
  id v8;
  FaceCoreLandmark *v9;
  uint64_t v10;
  NSString *type;
  CGPoint *v12;
  FaceCoreLandmark *v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FaceCoreLandmark;
  v9 = -[FaceCoreLandmark init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    type = v9->type;
    v9->type = (NSString *)v10;

    v9->pointCount = a4;
    if (a4)
    {
      v12 = (CGPoint *)malloc_type_malloc(16 * a4, 0x1000040451B5BE8uLL);
      v9->points = v12;
      memcpy(v12, a5, 16 * v9->pointCount);
    }
    v13 = v9;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (self->pointCount)
    free(self->points);
  v3.receiver = self;
  v3.super_class = (Class)FaceCoreLandmark;
  -[FaceCoreLandmark dealloc](&v3, sel_dealloc);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)pointCount
{
  return self->pointCount;
}

- (CGPoint)points
{
  return self->points;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->type, 0);
}

@end
