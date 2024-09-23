@implementation AudiogramGraphDetectorResult

- (CGRect)box
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setBox:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (CGFloat *)((char *)self + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box);
  swift_beginAccess();
  *v7 = x;
  v7[1] = y;
  v7[2] = width;
  v7[3] = height;
}

- (NSString)description
{
  return (NSString *)sub_22FB820CC(self, (uint64_t)a2, (void (*)(void))sub_22FB82124);
}

- (CGRect)scaledBoxWithSize:(CGSize)a3
{
  double width;
  _TtC18AudiogramIngestion28AudiogramGraphDetectorResult *v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  width = a3.width;
  v4 = self;
  v5 = sub_22FB82234(width);
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (_TtC18AudiogramIngestion28AudiogramGraphDetectorResult)defaultResult
{
  if (qword_255E3EAB8 != -1)
    swift_once();
  return (_TtC18AudiogramIngestion28AudiogramGraphDetectorResult *)(id)qword_255E3ED30;
}

- (_TtC18AudiogramIngestion28AudiogramGraphDetectorResult)init
{
  _TtC18AudiogramIngestion28AudiogramGraphDetectorResult *result;

  result = (_TtC18AudiogramIngestion28AudiogramGraphDetectorResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
