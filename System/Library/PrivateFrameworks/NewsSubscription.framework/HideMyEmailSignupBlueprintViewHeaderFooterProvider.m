@implementation HideMyEmailSignupBlueprintViewHeaderFooterProvider

- (_TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider)init
{
  _TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider *result;

  result = (_TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_headerRenderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_footerRenderer);
  sub_1BA3110FC((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_delegate);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider *v17;
  BOOL result;
  uint64_t v19;
  uint64_t v20;
  id v21[2];
  __int128 v22;
  uint64_t v23;
  _QWORD v24[3];
  uint64_t v25;
  uint64_t v26;

  v9 = sub_1BA435EFC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA435ECC();
  if (a6)
    goto LABEL_5;
  v14 = MEMORY[0x1BCCDC4E4]((char *)self + OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_delegate);
  if (!v14)
    goto LABEL_5;
  v15 = *__swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v14 + OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_eventHandler)+ 48), *(_QWORD *)(*(_QWORD *)(v14 + OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_eventHandler)+ 72));
  v16 = *(_QWORD *)(v15 + 48);
  v21[1] = *(id *)(v15 + 56);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v15 + 24), v16);
  sub_1BA417600();
  v21[0] = a3;
  v17 = self;
  result = sub_1BA436448();
  if (v23)
  {
    sub_1BA2F3654(&v22, (uint64_t)v24);
    v19 = v25;
    v20 = v26;
    __swift_project_boxed_opaque_existential_1(v24, v25);
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 24))(v13, v19, v20);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);

    swift_unknownObjectRelease();
LABEL_5:
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    return a6 != 0;
  }
  __break(1u);
  return result;
}

@end
