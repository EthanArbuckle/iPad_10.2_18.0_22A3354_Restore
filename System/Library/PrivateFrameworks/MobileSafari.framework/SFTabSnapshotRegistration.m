@implementation SFTabSnapshotRegistration

- (SFTabSnapshotContent)content
{
  SFTabSnapshotRegistration *v2;
  id v3;

  v2 = self;
  v3 = sub_18BAB502C();

  return (SFTabSnapshotContent *)v3;
}

- (id)contentObserver
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSnapshotRegistration_contentObserver, (uint64_t)sub_18B891688, (uint64_t)&block_descriptor_45);
}

- (void)setContentObserver:(id)a3
{
  sub_18BAB511C(self, (int)a2, a3, (uint64_t)&unk_1E21FCDE8, (uint64_t)sub_18B8928C8, (void (*)(uint64_t, uint64_t))sub_18BAB5748);
}

- (NSUUID)identifier
{
  return (NSUUID *)(id)sub_18BAC0058();
}

- (SFTabSnapshotVisibility)visibility
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  objc_super v8;

  v2 = (uint64_t *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSnapshotRegistration_wrapped)
                 + OBJC_IVAR____TtC12MobileSafari23TabSnapshotRegistration_visibility);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  v5 = (char *)objc_allocWithZone((Class)SFTabSnapshotVisibility);
  v6 = &v5[OBJC_IVAR___SFTabSnapshotVisibility_wrapped];
  *(_QWORD *)v6 = v3;
  *((_QWORD *)v6 + 1) = v4;
  v8.receiver = v5;
  v8.super_class = (Class)SFTabSnapshotVisibility;
  return (SFTabSnapshotVisibility *)-[SFTabSnapshotRegistration init](&v8, sel_init);
}

- (void)setVisibility:(id)a3
{
  char *v4;
  SFTabSnapshotRegistration *v5;

  v4 = (char *)a3;
  v5 = self;
  sub_18BAB538C(v4);

}

- (SFTabSnapshotRegistration)init
{
  SFTabSnapshotRegistration *result;

  result = (SFTabSnapshotRegistration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18BAB5548();
}

@end
