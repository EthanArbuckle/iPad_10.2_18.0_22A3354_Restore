@implementation TipsNextEventReporter

+ (TipsNextEventReporter)shared
{
  if (qword_1ECFC65F8 != -1)
    swift_once();
  return (TipsNextEventReporter *)(id)qword_1ECFC65E8;
}

- (void)donateSentMessageEvent
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  TipsNextEventReporter *v8;
  uint64_t v9;

  v3 = sub_19E247E74(&qword_1ECFC6648);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_19E36F9E4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = 0;
  *(_QWORD *)(v7 + 24) = 0;
  *(_BYTE *)(v7 + 32) = 0;
  *(_QWORD *)(v7 + 40) = self;
  v8 = self;
  sub_19E344BE8((uint64_t)v5, (uint64_t)&unk_1EE502FA8, v7);

  swift_release();
}

- (void)donateReceivedPhotoEventWatch
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  TipsNextEventReporter *v8;
  uint64_t v9;

  v3 = sub_19E247E74(&qword_1ECFC6648);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_19E36F9E4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = 0;
  *(_QWORD *)(v7 + 24) = 0;
  *(_BYTE *)(v7 + 32) = 1;
  *(_QWORD *)(v7 + 40) = self;
  v8 = self;
  sub_19E344BE8((uint64_t)v5, (uint64_t)&unk_1EE502FA0, v7);

  swift_release();
}

- (void)donateSentINSendMessageIntentEvent
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  TipsNextEventReporter *v8;
  uint64_t v9;

  v3 = sub_19E247E74(&qword_1ECFC6648);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_19E36F9E4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = 0;
  *(_QWORD *)(v7 + 24) = 0;
  *(_BYTE *)(v7 + 32) = 0;
  *(_QWORD *)(v7 + 40) = self;
  v8 = self;
  sub_19E344BE8((uint64_t)v5, (uint64_t)&unk_1EE502F98, v7);

  swift_release();
}

- (void)donateSavedPhotoEventWatch
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  TipsNextEventReporter *v8;
  uint64_t v9;

  v3 = sub_19E247E74(&qword_1ECFC6648);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_19E36F9E4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = 0;
  *(_QWORD *)(v7 + 24) = 0;
  *(_BYTE *)(v7 + 32) = 4;
  *(_QWORD *)(v7 + 40) = self;
  v8 = self;
  sub_19E344BE8((uint64_t)v5, (uint64_t)&unk_1EE502F90, v7);

  swift_release();
}

- (void)donateSentTapbackEventWatch
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  TipsNextEventReporter *v8;
  uint64_t v9;

  v3 = sub_19E247E74(&qword_1ECFC6648);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_19E36F9E4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = 0;
  *(_QWORD *)(v7 + 24) = 0;
  *(_BYTE *)(v7 + 32) = 5;
  *(_QWORD *)(v7 + 40) = self;
  v8 = self;
  sub_19E344BE8((uint64_t)v5, (uint64_t)&unk_1EE502F88, v7);

  swift_release();
}

- (void)donateSentSetNameAndPhotoProfileEvent
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  TipsNextEventReporter *v8;
  uint64_t v9;

  v3 = sub_19E247E74(&qword_1ECFC6648);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_19E36F9E4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = 0;
  *(_QWORD *)(v7 + 24) = 0;
  *(_BYTE *)(v7 + 32) = 6;
  *(_QWORD *)(v7 + 40) = self;
  v8 = self;
  sub_19E344BE8((uint64_t)v5, (uint64_t)&unk_1EE502F80, v7);

  swift_release();
}

- (TipsNextEventReporter)init
{
  _QWORD *v3;
  objc_super v5;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___TipsNextEventReporter_appBundleId);
  *v3 = 0xD000000000000013;
  v3[1] = 0x800000019E39BF40;
  sub_19E36F78C();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TipsNextEventReporter();
  return -[TipsNextEventReporter init](&v5, sel_init);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___TipsNextEventReporter_logger;
  v4 = sub_19E36F798();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
