@implementation CKCompositionBuilderContext

- (BOOL)isInLockdownMode
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_isInLockdownMode;
  swift_beginAccess();
  return *v2;
}

- (void)setIsInLockdownMode:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_isInLockdownMode;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isPastingAfterBracketCharacter
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_isPastingAfterBracketCharacter;
  swift_beginAccess();
  return *v2;
}

- (void)setIsPastingAfterBracketCharacter:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_isPastingAfterBracketCharacter;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)supportsExpressiveText
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_supportsExpressiveText;
  swift_beginAccess();
  return *v2;
}

- (void)setSupportsExpressiveText:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_supportsExpressiveText;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)conversationSupportsInlineAdaptiveImageGlyphs
{
  BOOL *v2;

  v2 = (BOOL *)self
     + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_conversationSupportsInlineAdaptiveImageGlyphs;
  swift_beginAccess();
  return *v2;
}

- (void)setConversationSupportsInlineAdaptiveImageGlyphs:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self
     + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_conversationSupportsInlineAdaptiveImageGlyphs;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)wantsInlinedRichLinks
{
  _BYTE *v3;
  _BYTE *v4;
  unsigned __int8 v5;
  void *v6;
  _TtC7ChatKit27CKCompositionBuilderContext *v7;
  id v8;

  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_isPastingAfterBracketCharacter;
  swift_beginAccess();
  if ((*v3 & 1) != 0)
    return 0;
  v4 = (char *)self + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_isInLockdownMode;
  swift_beginAccess();
  if (*v4 == 1)
    return 0;
  v6 = (void *)objc_opt_self();
  v7 = self;
  v8 = objc_msgSend(v6, sel_sharedFeatureFlags);
  v5 = objc_msgSend(v8, sel_isRichLinkImprovementsEnabled);

  return v5;
}

- (_TtC7ChatKit27CKCompositionBuilderContext)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_isInLockdownMode) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_isPastingAfterBracketCharacter) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_supportsExpressiveText) = 0;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_conversationSupportsInlineAdaptiveImageGlyphs) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKCompositionBuilderContext();
  return -[CKCompositionBuilderContext init](&v3, sel_init);
}

@end
