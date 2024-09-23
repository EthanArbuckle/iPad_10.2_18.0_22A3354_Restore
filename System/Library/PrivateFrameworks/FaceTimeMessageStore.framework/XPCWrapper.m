@implementation XPCWrapper

- (void).cxx_destruct
{
  sub_23B31B034(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC20FaceTimeMessageStore10XPCWrapper_data), *(_QWORD *)&self->data[OBJC_IVAR____TtC20FaceTimeMessageStore10XPCWrapper_data]);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC20FaceTimeMessageStore10XPCWrapper *v5;

  v4 = a3;
  v5 = self;
  sub_23B31331C(v4);

}

- (_TtC20FaceTimeMessageStore10XPCWrapper)initWithCoder:(id)a3
{
  return (_TtC20FaceTimeMessageStore10XPCWrapper *)sub_23B3133D8(a3);
}

+ (BOOL)supportsSecureCoding
{
  return sub_23B3134CC() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  sub_23B35670C(a3);
}

- (_TtC20FaceTimeMessageStore10XPCWrapper)init
{
  sub_23B356730();
}

@end
