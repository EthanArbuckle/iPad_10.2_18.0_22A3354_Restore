@implementation ICBackgroundTranscriber

+ (ICBackgroundTranscriber)sharedInstance
{
  if (qword_1EF50B1B0 != -1)
    swift_once();
  swift_beginAccess();
  return (ICBackgroundTranscriber *)(id)qword_1EF50D328;
}

+ (void)setSharedInstance:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1EF50B1B0;
  v4 = a3;
  if (v3 != -1)
    swift_once();
  swift_beginAccess();
  v5 = (void *)qword_1EF50D328;
  qword_1EF50D328 = (uint64_t)v4;

}

- (void)addFirstTimeTranscriptionTaskToQueueWithMediaURL:(id)a3 attachmentIdentifier:(id)a4 subattachmentIdentifier:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  id v13;
  id v14;
  ICBackgroundTranscriber *v15;
  uint64_t v16;

  v8 = sub_1BDBFC948();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDBFC90C();
  v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v13 = a4;
  v14 = a5;
  v15 = self;
  swift_retain();
  sub_1BDB24F78((uint64_t)v11, v13, v14, sub_1BDB24F58, v12);
  swift_release_n();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)addRetranscriptionTaskToQueueWithSubattachmentAndMediaInfo:(id)a3 attachmentIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  ICBackgroundTranscriber *v8;
  id v9;

  sub_1BDAF52F4();
  sub_1BDBFC948();
  sub_1BDAC31B0(&qword_1EF50D390, (uint64_t (*)(uint64_t))sub_1BDAF52F4, MEMORY[0x1E0DEFCF8]);
  v6 = sub_1BDBFD5C0();
  v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9 = a4;
  v8 = self;
  swift_retain();
  BackgroundTranscriber.retranscriptionTask(subattachmentAndMediaInfo:attachmentIdentifier:completion:)(v6, v9, (uint64_t)sub_1BDB254C8, v7);
  swift_release_n();
  swift_bridgeObjectRelease();

}

- (ICBackgroundTranscriber)init
{
  return (ICBackgroundTranscriber *)BackgroundTranscriber.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();

}

@end
