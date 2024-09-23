@implementation VariableBlurUIView

- (_TtC15ConversationKit18VariableBlurUIView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  VariableBlurUIView.init(coder:)();
}

+ (Class)layerClass
{
  static VariableBlurUIView.layerClass.getter();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit18VariableBlurUIView *v2;

  v2 = self;
  VariableBlurUIView.layoutSubviews()();

}

- (_TtC15ConversationKit18VariableBlurUIView)initWithFrame:(CGRect)a3
{
  VariableBlurUIView.init(frame:)();
}

- (void).cxx_destruct
{
  outlined consume of VariableBlurMask(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ConversationKit18VariableBlurUIView_blurMask), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit18VariableBlurUIView_blurMask), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15ConversationKit18VariableBlurUIView_blurMask), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15ConversationKit18VariableBlurUIView_blurMask), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC15ConversationKit18VariableBlurUIView_blurMask), *((_BYTE *)&self->super._animationInfo + OBJC_IVAR____TtC15ConversationKit18VariableBlurUIView_blurMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit18VariableBlurUIView_blurMaskImage));
}

@end
