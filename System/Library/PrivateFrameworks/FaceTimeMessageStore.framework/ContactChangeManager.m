@implementation ContactChangeManager

- (void)contactStoreDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC20FaceTimeMessageStore20ContactChangeManager *v8;
  uint64_t v9;

  v4 = sub_23B3D49B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B3D49A0();
  v8 = self;
  sub_23B38C344();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC20FaceTimeMessageStore20ContactChangeManager)init
{
  sub_23B38D09C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FaceTimeMessageStore20ContactChangeManager_contactStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FaceTimeMessageStore20ContactChangeManager_userDefaults));
  sub_23B31269C((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore20ContactChangeManager_delegate);
}

- (void)visitDropEverythingEvent:(id)a3
{
  id v4;
  _TtC20FaceTimeMessageStore20ContactChangeManager *v5;

  v4 = a3;
  v5 = self;
  sub_23B38D15C();

}

- (void)visitAddContactEvent:(id)a3
{
  id v4;
  _TtC20FaceTimeMessageStore20ContactChangeManager *v5;

  v4 = a3;
  v5 = self;
  sub_23B38D284();

}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4;
  _TtC20FaceTimeMessageStore20ContactChangeManager *v5;

  v4 = a3;
  v5 = self;
  sub_23B38D458();

}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4;
  _TtC20FaceTimeMessageStore20ContactChangeManager *v5;

  v4 = a3;
  v5 = self;
  sub_23B38D660();

}

@end
