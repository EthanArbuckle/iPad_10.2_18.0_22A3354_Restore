@implementation GPDrawOnImageRecipe

- (__CVBuffer)baseImage
{
  GPDrawOnImageRecipe *v2;
  void *v3;

  v2 = self;
  v3 = (void *)GPDrawOnImageRecipe.baseImage.getter();

  return (__CVBuffer *)v3;
}

- (void)setBaseImage:(__CVBuffer *)a3
{
  sub_23ECDEF2C(self, (uint64_t)a2, a3, &OBJC_IVAR___GPDrawOnImageRecipe__baseImage);
}

- (__CVBuffer)sketchImage
{
  GPDrawOnImageRecipe *v2;
  void *v3;

  v2 = self;
  v3 = (void *)GPDrawOnImageRecipe.sketchImage.getter();

  return (__CVBuffer *)v3;
}

- (void)setSketchImage:(__CVBuffer *)a3
{
  sub_23ECDEF2C(self, (uint64_t)a2, a3, &OBJC_IVAR___GPDrawOnImageRecipe__sketchImage);
}

- (__CVBuffer)sketchMask
{
  GPDrawOnImageRecipe *v2;
  void *v3;

  v2 = self;
  v3 = (void *)GPDrawOnImageRecipe.sketchMask.getter();

  return (__CVBuffer *)v3;
}

- (void)setSketchMask:(__CVBuffer *)a3
{
  sub_23ECDEF2C(self, (uint64_t)a2, a3, &OBJC_IVAR___GPDrawOnImageRecipe__sketchMask);
}

- (double)sketchComplexityMeasure
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___GPDrawOnImageRecipe_sketchComplexityMeasure);
  swift_beginAccess();
  return *v2;
}

- (void)setSketchComplexityMeasure:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___GPDrawOnImageRecipe_sketchComplexityMeasure);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)drawOnImageAssignmentOptions
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___GPDrawOnImageRecipe_drawOnImageAssignmentOptions);
  swift_beginAccess();
  return *v2;
}

- (void)setDrawOnImageAssignmentOptions:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___GPDrawOnImageRecipe_drawOnImageAssignmentOptions);
  swift_beginAccess();
  *v4 = a3;
}

- (GPDrawOnImageRecipe)initWithBaseImage:(__CVBuffer *)a3 sketchImage:(__CVBuffer *)a4 sketchMask:(__CVBuffer *)a5 sketchComplexityMeasure:(double)a6 drawOnImageAssignmentOptions:(int64_t)a7
{
  __CVBuffer *v12;
  __CVBuffer *v13;
  __CVBuffer *v14;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  return (GPDrawOnImageRecipe *)GPDrawOnImageRecipe.init(baseImage:sketchImage:sketchMask:sketchComplexityMeasure:drawOnImageAssignmentOptions:)(a3, a4, a5, a7, a6);
}

- (GPDrawOnImageRecipe)init
{
  GPDrawOnImageRecipe *result;

  result = (GPDrawOnImageRecipe *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23ECDDBBC((uint64_t)self + OBJC_IVAR___GPDrawOnImageRecipe__baseImage);
  sub_23ECDDBBC((uint64_t)self + OBJC_IVAR___GPDrawOnImageRecipe__sketchImage);
  sub_23ECDDBBC((uint64_t)self + OBJC_IVAR___GPDrawOnImageRecipe__sketchMask);
}

@end
