@implementation TapViewModel

- (void)updateWithTransactionEvent:(int64_t)a3
{
  swift_retain();
  sub_22F96BAF0(a3);
  swift_release();
}

- (void)vasReadSuccessWithMerchantNames:(id)a3
{
  uint64_t v3;

  v3 = sub_22F98EF44();
  swift_retain();
  sub_22F96BE80(v3);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)requiresCardPIN:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_22F96C298(v3);

  swift_release();
}

- (void)closeUI
{
  swift_retain();
  sub_22F96CCEC();
  swift_release();
}

- (void)closeUIImmediate
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255E206E0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255E1DB70 != -1)
    swift_once();
  swift_beginAccess();
  v3 = (char *)off_255E211B8;
  v4 = qword_255E1DAF8;
  swift_retain();
  if (v4 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_255E29598);
  sub_22F87ABDC(v5, (uint64_t)v2, (uint64_t *)&unk_255E206E0);
  v6 = sub_22F98DAA4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v2, 1, v6) == 1)
  {
    sub_22F87AC20((uint64_t)v2, (uint64_t *)&unk_255E206E0);
  }
  else
  {
    sub_22F863858((uint64_t)v3, 0x736F4865736F6C63, 0xEB00000000292874, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v2, v6);
  }
  v8 = (void *)MEMORY[0x2348A68F8](v3 + 56);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, sel_dismissViewControllerAnimated_completion_, 1, 0);
    swift_release();

  }
  else
  {
    swift_release();
  }
}

@end
