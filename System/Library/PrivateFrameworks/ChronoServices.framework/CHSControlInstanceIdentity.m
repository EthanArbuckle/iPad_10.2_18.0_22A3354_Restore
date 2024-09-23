@implementation CHSControlInstanceIdentity

- (CHSControlIdentity)control
{
  return (CHSControlIdentity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___CHSControlInstanceIdentity_control));
}

- (NSString)hostIdentifier
{
  return (NSString *)sub_18FBB2860((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CHSControlInstanceIdentity_hostIdentifier);
}

- (NSString)configurationIdentifier
{
  return (NSString *)sub_18FBB2860((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CHSControlInstanceIdentity_configurationIdentifier);
}

- (unint64_t)contentType
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___CHSControlInstanceIdentity_contentType);
}

- (CHSControlInstanceIdentity)initWithControl:(id)a3 contentType:(unint64_t)a4 hostIdentifier:(id)a5 configurationIdentifier:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  id v17;
  objc_super v19;

  if (!a5)
  {
    v10 = 0;
    v12 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    v14 = 0;
    goto LABEL_6;
  }
  v10 = sub_18FBCD0DC();
  v12 = v11;
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v13 = sub_18FBCD0DC();
LABEL_6:
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSControlInstanceIdentity_control) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSControlInstanceIdentity_contentType) = (Class)a4;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___CHSControlInstanceIdentity_hostIdentifier);
  *v15 = v10;
  v15[1] = v12;
  v16 = (uint64_t *)((char *)self + OBJC_IVAR___CHSControlInstanceIdentity_configurationIdentifier);
  *v16 = v13;
  v16[1] = v14;
  v19.receiver = self;
  v19.super_class = (Class)CHSControlInstanceIdentity;
  v17 = a3;
  return -[CHSControlInstanceIdentity init](&v19, sel_init);
}

- (CHSControlInstanceIdentity)init
{
  CHSControlInstanceIdentity *result;

  result = (CHSControlInstanceIdentity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)hash
{
  CHSControlInstanceIdentity *v2;
  int64_t v3;

  v2 = self;
  v3 = CHSControlInstanceIdentity.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CHSControlInstanceIdentity *v4;
  CHSControlInstanceIdentity *v5;
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
  v6 = CHSControlInstanceIdentity.isEqual(_:)((uint64_t)v8);

  sub_18FB1F7C4((uint64_t)v8);
  return v6 & 1;
}

@end
