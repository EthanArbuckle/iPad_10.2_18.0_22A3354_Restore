@implementation MCSSyncResumer

- (MCSSyncResumer)initWithDelegate:(id)a3
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MCSSyncResumer_delegate) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SyncResumer();
  swift_unknownObjectRetain();
  return -[MCSSyncResumer init](&v4, sel_init);
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  MCSSyncResumer *v2;

  v2 = self;
  sub_217819F94();

}

- (void)systemDidUnlock
{
  uint64_t v2;
  MCSSyncResumer *v3;

  v2 = qword_253F25DC0;
  v3 = self;
  if (v2 != -1)
    swift_once();
  if ((sub_21784167C(1u, 0) & 1) != 0)
    sub_21781BC3C(MEMORY[0x24BE50C30], "Identity status update, and we stopped syncing due to bad identity status.");

}

- (void)attemptToResumeSyncOnAccountUpdateIfAppropriate
{
  sub_21781BC3C(MEMORY[0x24BE50C20], "Account status update, and we stopped syncing due to bad account status.");
}

- (void)attemptToResumeSyncOnIdentityUpdateIfAppropriate
{
  sub_21781BC3C(MEMORY[0x24BE50C30], "Identity status update, and we stopped syncing due to bad identity status.");
}

- (void)resumeSyncUsingKey:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  MCSSyncResumer *v7;

  v4 = sub_217847F98();
  v6 = v5;
  v7 = self;
  sub_21781B5C4(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)attemptToResumeSyncIfAppropriate
{
  MCSSyncResumer *v2;

  v2 = self;
  sub_217819F94();

}

- (MCSSyncResumer)init
{
  MCSSyncResumer *result;

  result = (MCSSyncResumer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
