@implementation ReflectionPromptView

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for ReflectionPromptView();
  -[ReflectionPromptView layoutSubviews](&v2, "layoutSubviews");
}

- (_TtC16MomentsUIService20ReflectionPromptView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized ReflectionPromptView.init(coder:)();
}

- (void)updatePromptIndex:(id)a3
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  id v6;
  uint64_t v7;
  uint64_t v8;
  _TtC16MomentsUIService20ReflectionPromptView *v9;

  v5 = *(uint64_t (**)(uint64_t))((char *)&self->super.super.super.isa
                                         + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_updateReflectionIndex);
  v4 = *(_QWORD *)&self->type[OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_updateReflectionIndex];
  v6 = a3;
  v9 = self;
  v7 = swift_retain(v4);
  v8 = v5(v7);
  swift_release(v4);
  *(Class *)((char *)&v9->super.super.super.isa + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_promptIndex) = (Class)v8;
  (*(void (**)(void))((swift_isaMask & (uint64_t)v9->super.super.super.isa) + 0x1A0))();

}

- (_TtC16MomentsUIService20ReflectionPromptView)initWithFrame:(CGRect)a3
{
  _TtC16MomentsUIService20ReflectionPromptView *result;

  result = (_TtC16MomentsUIService20ReflectionPromptView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.ReflectionPromptView", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_prompts));
  swift_release(*(_QWORD *)&self->type[OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_updateReflectionIndex]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_shuffleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_tertiaryVibrancyEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_blurredEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_accentColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_blurBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_reflectionPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_categoryLabel));
}

@end
