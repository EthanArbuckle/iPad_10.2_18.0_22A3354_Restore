@implementation ObjCRenameSequence

- (BOOL)isEmpty
{
  char *v3;
  char *v5;

  v3 = (char *)self + OBJC_IVAR___ObjCRenameSequence_renameSequence;
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)v3 + 16))
    return 0;
  v5 = (char *)self + OBJC_IVAR___ObjCRenameSequence_renameAddedBySequence;
  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)v5 + 16) == 0;
}

- (void)addWithReplica:(id)a3 range:(_NSRange)a4
{
  unint64_t *length;
  NSUInteger location;
  id v7;
  ObjCRenameSequence *v8;

  length = (unint64_t *)a4.length;
  location = a4.location;
  v7 = a3;
  v8 = self;
  sub_1BE19CD5C((uint64_t)v7, location, length);

}

- (void)addAddedByReplica:(id)a3 range:(_NSRange)a4
{
  unint64_t *length;
  NSUInteger location;
  id v7;
  ObjCRenameSequence *v8;

  length = (unint64_t *)a4.length;
  location = a4.location;
  v7 = a3;
  v8 = self;
  sub_1BE19CDCC((uint64_t)v7, location, length);

}

- (void)addAddedByVersion:(id)a3
{
  id v4;
  ObjCRenameSequence *v5;

  v4 = a3;
  v5 = self;
  sub_1BE19D0B8((uint64_t)v4);

}

- (NSString)description
{
  ObjCRenameSequence *v2;
  void *v3;

  v2 = self;
  sub_1BE19D9A0();

  v3 = (void *)sub_1BE1B27A4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (ObjCRenameSequence)init
{
  objc_class *v2;
  objc_super v4;

  v2 = (objc_class *)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCRenameSequence_renameSequence) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCRenameSequence_renameAddedBySequence) = v2;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ObjCRenameSequence();
  return -[ObjCRenameSequence init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
