@implementation GKImageRestrictions

+ (void)setForCurrentProcess
{
  swift_getObjCClassMetadata();
  sub_1BCED0B48();
}

+ (void)setForCurrentProcessAllowingPDF:(BOOL)a3
{
  sub_1BCED0B90(a3);
}

+ (BOOL)isAuthorizedForGamesWithImageData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v3 = a3;
  v4 = sub_1BCF1501C();
  v6 = v5;

  swift_getObjCClassMetadata();
  v7 = sub_1BCED1124(v4);
  sub_1BCEAC4B8(v4, v6);
  return v7 & 1;
}

+ (CGImage)cgImageForGamesWithData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  CGImage *v7;

  v3 = a3;
  v4 = sub_1BCF1501C();
  v6 = v5;

  swift_getObjCClassMetadata();
  v7 = (CGImage *)sub_1BCED12DC(v4, v6);
  sub_1BCEAC4B8(v4, v6);
  return v7;
}

- (GKImageRestrictions)init
{
  return (GKImageRestrictions *)GKImageRestrictions.init()();
}

@end
