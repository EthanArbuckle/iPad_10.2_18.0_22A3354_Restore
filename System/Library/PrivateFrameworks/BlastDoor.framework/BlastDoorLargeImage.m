@implementation BlastDoorLargeImage

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, type metadata accessor for LargeImage, &OBJC_IVAR___BlastDoorLargeImage_largeImage);
}

- (BlastDoorMachImage)image
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  BlastDoorLargeImage *v7;
  objc_class *v8;
  char *v9;
  BlastDoorLargeImage *v10;
  objc_super v12;

  v3 = type metadata accessor for LargeImage(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (uint64_t *)((char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1AD0D3D2C((uint64_t)self + OBJC_IVAR___BlastDoorLargeImage_largeImage, (uint64_t)v5, type metadata accessor for LargeImage);
  v6 = *v5;
  v7 = self;
  swift_retain();
  sub_1AD066230((uint64_t)v5, type metadata accessor for LargeImage);
  v8 = (objc_class *)type metadata accessor for _ObjCMachImageWrapper();
  v9 = (char *)objc_allocWithZone(v8);
  *(_QWORD *)&v9[OBJC_IVAR___BlastDoorMachImage_image] = v6;
  v12.receiver = v9;
  v12.super_class = v8;
  v10 = -[BlastDoorLargeImage init](&v12, sel_init);

  return (BlastDoorMachImage *)v10;
}

- (BlastDoorMediaMetadata)metadata
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  BlastDoorLargeImage *v10;
  BlastDoorLargeImage *v11;
  objc_super v13;

  v3 = type metadata accessor for MediaMetadata();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorLargeImage_largeImage;
  v7 = type metadata accessor for LargeImage(0);
  sub_1AD0D3D2C((uint64_t)&v6[*(int *)(v7 + 20)], (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);
  v8 = (objc_class *)type metadata accessor for _ObjCMediaMetadataWrapper(0);
  v9 = objc_allocWithZone(v8);
  sub_1AD0D3D2C((uint64_t)v5, (uint64_t)v9 + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);
  v13.receiver = v9;
  v13.super_class = v8;
  v10 = self;
  v11 = -[BlastDoorLargeImage init](&v13, sel_init);
  sub_1AD066230((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for MediaMetadata);

  return (BlastDoorMediaMetadata *)v11;
}

- (BlastDoorLargeImage)init
{
  BlastDoorLargeImage *result;

  result = (BlastDoorLargeImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorLargeImage_largeImage, type metadata accessor for LargeImage);
}

@end
