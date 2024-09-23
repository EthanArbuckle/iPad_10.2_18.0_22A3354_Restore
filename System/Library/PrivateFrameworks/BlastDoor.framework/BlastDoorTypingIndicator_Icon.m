@implementation BlastDoorTypingIndicator_Icon

- (NSString)description
{
  return (NSString *)sub_1AD4D397C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTypingIndicator_Icon_typingIndicator_Icon, (void (*)(uint64_t, _BYTE *))sub_1AD4DA648);
}

- (NSString)balloonPluginBundleID
{
  return (NSString *)sub_1AD4D39F8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTypingIndicator_Icon_typingIndicator_Icon, (void (*)(uint64_t, _BYTE *))sub_1AD4DA648, (void (*)(_BYTE *))sub_1AD29560C);
}

- (BlastDoorImage)image
{
  BlastDoorTypingIndicator_Icon *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1AD4D3B94();

  return (BlastDoorImage *)v3;
}

- (BlastDoorTypingIndicator_Icon)init
{
  BlastDoorTypingIndicator_Icon *result;

  result = (BlastDoorTypingIndicator_Icon *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD29560C((Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorTypingIndicator_Icon_typingIndicator_Icon));
}

@end
