@implementation StickerPackOrganizerDelegate

- (void)openURL:(id)a3 pluginID:(id)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _TtC10StickerKit28StickerPackOrganizerDelegate *v15;
  uint64_t v16;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561716A8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  if (a3)
  {
    sub_234715990();
    v13 = sub_2347159D8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    v14 = sub_2347159D8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  }
  if (a4)
    sub_234717754();
  if (v12)
  {
    v15 = self;
    _Block_release(v12);

  }
  swift_bridgeObjectRelease();
  sub_2345F16A8((uint64_t)v11);
}

- (void)openURL:(id)a3 applicationIdentifier:(id)a4 pluginID:(id)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _TtC10StickerKit28StickerPackOrganizerDelegate *v17;
  uint64_t v18;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561716A8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  if (a3)
  {
    sub_234715990();
    v15 = sub_2347159D8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v13, 0, 1, v15);
  }
  else
  {
    v16 = sub_2347159D8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  }
  if (a4)
    sub_234717754();
  if (a5)
    sub_234717754();
  v17 = self;
  if (v14)
    _Block_release(v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_2345F16A8((uint64_t)v13);
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6
{
  void *v10;
  _TtC10StickerKit28StickerPackOrganizerDelegate *v11;

  v10 = _Block_copy(a6);
  if (a3)
    sub_234717754();
  if (a4)
    sub_234717754();
  if (a5)
    sub_234717754();
  v11 = self;
  if (v10)
    _Block_release(v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)dragControllerTranscriptDelegate
{
  return 0;
}

- (void)dismiss
{
  void (*v2)(void);
  _TtC10StickerKit28StickerPackOrganizerDelegate *v3;

  v2 = *(void (**)(void))((char *)&self->super.isa
                        + OBJC_IVAR____TtC10StickerKit28StickerPackOrganizerDelegate_requestDismiss);
  v3 = self;
  v2();

}

- (void)browserAppManagerDidSelectPlugin:(id)a3
{
  id v5;
  _TtC10StickerKit28StickerPackOrganizerDelegate *v6;

  v5 = a3;
  v6 = self;
  sub_2345F146C(a3);

}

- (_TtC10StickerKit28StickerPackOrganizerDelegate)init
{
  _TtC10StickerKit28StickerPackOrganizerDelegate *result;

  result = (_TtC10StickerKit28StickerPackOrganizerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
