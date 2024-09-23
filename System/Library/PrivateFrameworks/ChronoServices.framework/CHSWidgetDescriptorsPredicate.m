@implementation CHSWidgetDescriptorsPredicate

+ (CHSWidgetDescriptorsPredicate)visible
{
  return (CHSWidgetDescriptorsPredicate *)objc_msgSend(objc_allocWithZone((Class)CHSWidgetDescriptorsPredicate), sel_init);
}

- (int64_t)hash
{
  sub_18FBCD898();
  return sub_18FBCD880();
}

- (BOOL)isEqual:(id)a3
{
  CHSWidgetDescriptorsPredicate *v4;
  CHSWidgetDescriptorsPredicate *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_18FBCD478();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = CHSWidgetDescriptorsPredicate.isEqual(_:)((uint64_t)v8);

  sub_18FB1F7C4((uint64_t)v8);
  return v6 & 1;
}

- (CHSWidgetDescriptorsPredicate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHSWidgetDescriptorsPredicate;
  return -[CHSWidgetDescriptorsPredicate init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EE18B7B0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EE18B7B0 = a3;
}

- (CHSWidgetDescriptorsPredicate)initWithCoder:(id)a3
{
  return -[CHSWidgetDescriptorsPredicate init](self, sel_init, a3);
}

@end
