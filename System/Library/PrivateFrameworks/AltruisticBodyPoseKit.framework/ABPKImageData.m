@implementation ABPKImageData

- (__CVBuffer)pixelBuffer
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___ABPKImageData_pixelBuffer);
  swift_beginAccess();
  return (__CVBuffer *)*v2;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  void **v4;
  void *v5;
  __CVBuffer *v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___ABPKImageData_pixelBuffer);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (double)timestamp
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___ABPKImageData_timestamp);
  swift_beginAccess();
  return *v2;
}

- (void)setTimestamp:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___ABPKImageData_timestamp);
  swift_beginAccess();
  *v4 = a3;
}

- (ABPKImageData)initWithPixelBuffer:(__CVBuffer *)a3 timestamp:(double)a4
{
  void **v7;
  void *v8;
  __CVBuffer *v9;
  ABPKImageData *v10;
  ABPKImageData *v11;
  objc_super v13;

  v7 = (void **)((char *)&self->super.isa + OBJC_IVAR___ABPKImageData_pixelBuffer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ABPKImageData_pixelBuffer) = 0;
  swift_beginAccess();
  v8 = *v7;
  *v7 = a3;
  v9 = a3;
  v10 = self;

  *(double *)((char *)&v10->super.isa + OBJC_IVAR___ABPKImageData_timestamp) = a4;
  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for ABPKImageData();
  v11 = -[ABPKImageData init](&v13, sel_init);

  return v11;
}

- (ABPKImageData)init
{
  ABPKImageData *result;

  result = (ABPKImageData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
