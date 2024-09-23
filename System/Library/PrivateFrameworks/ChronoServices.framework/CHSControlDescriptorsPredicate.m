@implementation CHSControlDescriptorsPredicate

- (BOOL)includeHidden
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CHSControlDescriptorsPredicate_includeHidden);
}

- (BOOL)includeVisible
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CHSControlDescriptorsPredicate_includeVisible);
}

+ (CHSControlDescriptorsPredicate)visible
{
  return (CHSControlDescriptorsPredicate *)objc_msgSend(objc_allocWithZone((Class)CHSControlDescriptorsPredicate), sel_initIncludingVisible_hidden_, 1, 0);
}

+ (CHSControlDescriptorsPredicate)hidden
{
  return (CHSControlDescriptorsPredicate *)objc_msgSend(objc_allocWithZone((Class)CHSControlDescriptorsPredicate), sel_initIncludingVisible_hidden_, 0, 1);
}

+ (CHSControlDescriptorsPredicate)all
{
  return (CHSControlDescriptorsPredicate *)objc_msgSend(objc_allocWithZone((Class)CHSControlDescriptorsPredicate), sel_initIncludingVisible_hidden_, 1, 1);
}

- (id)initIncludingVisible:(BOOL)a3 hidden:(BOOL)a4
{
  objc_super v5;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___CHSControlDescriptorsPredicate_includeVisible) = a3;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CHSControlDescriptorsPredicate_includeHidden) = a4;
  v5.receiver = self;
  v5.super_class = (Class)CHSControlDescriptorsPredicate;
  return -[CHSControlDescriptorsPredicate init](&v5, sel_init);
}

- (int64_t)hash
{
  CHSControlDescriptorsPredicate *v3;
  int64_t v4;

  sub_18FBCD898();
  v3 = self;
  -[CHSControlDescriptorsPredicate includeHidden](v3, sel_includeHidden);
  sub_18FBCD868();
  -[CHSControlDescriptorsPredicate includeVisible](v3, sel_includeVisible);
  sub_18FBCD868();
  v4 = sub_18FBCD880();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CHSControlDescriptorsPredicate *v4;
  CHSControlDescriptorsPredicate *v5;
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
  v6 = CHSControlDescriptorsPredicate.isEqual(_:)((uint64_t)v8);

  sub_18FB1F7C4((uint64_t)v8);
  return v6 & 1;
}

- (CHSControlDescriptorsPredicate)init
{
  CHSControlDescriptorsPredicate *result;

  result = (CHSControlDescriptorsPredicate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EE18B7B1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EE18B7B1 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CHSControlDescriptorsPredicate *v5;
  _BOOL8 v6;
  void *v7;
  _BOOL8 v8;
  id v9;

  v4 = a3;
  v5 = self;
  v6 = -[CHSControlDescriptorsPredicate includeVisible](v5, sel_includeVisible);
  v7 = (void *)sub_18FBCD0B8();
  objc_msgSend(v4, sel_encodeBool_forKey_, v6, v7);

  v8 = -[CHSControlDescriptorsPredicate includeHidden](v5, sel_includeHidden);
  v9 = (id)sub_18FBCD0B8();
  objc_msgSend(v4, sel_encodeBool_forKey_, v8, v9);

}

- (CHSControlDescriptorsPredicate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  CHSControlDescriptorsPredicate *v9;

  v4 = a3;
  v5 = (void *)sub_18FBCD0B8();
  v6 = objc_msgSend(v4, sel_decodeBoolForKey_, v5);

  v7 = (void *)sub_18FBCD0B8();
  v8 = objc_msgSend(v4, sel_decodeBoolForKey_, v7);

  v9 = -[CHSControlDescriptorsPredicate initIncludingVisible:hidden:](self, sel_initIncludingVisible_hidden_, v6, v8);
  return v9;
}

- (NSString)description
{
  CHSControlDescriptorsPredicate *v2;
  void *v3;

  v2 = self;
  CHSControlDescriptorsPredicate.description.getter();

  v3 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
