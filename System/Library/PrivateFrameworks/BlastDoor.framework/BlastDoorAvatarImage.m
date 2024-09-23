@implementation BlastDoorAvatarImage

- (NSString)description
{
  return (NSString *)sub_1AD4D397C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAvatarImage_avatarImage, (void (*)(uint64_t, _BYTE *))sub_1AD4D9CAC);
}

- (NSString)imageName
{
  return (NSString *)sub_1AD4D39F8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAvatarImage_avatarImage, (void (*)(uint64_t, _BYTE *))sub_1AD4D9CAC, (void (*)(_BYTE *))sub_1AD28AA98);
}

- (BlastDoorImage)image
{
  BlastDoorAvatarImage *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AD4BC608();

  return (BlastDoorImage *)v3;
}

- (BlastDoorAvatarImage)init
{
  BlastDoorAvatarImage *result;

  result = (BlastDoorAvatarImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD28AA98((Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorAvatarImage_avatarImage));
}

@end
