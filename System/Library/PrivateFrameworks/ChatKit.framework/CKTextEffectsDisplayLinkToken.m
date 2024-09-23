@implementation CKTextEffectsDisplayLinkToken

- (void)dealloc
{
  _TtC7ChatKit29CKTextEffectsDisplayLinkToken *v2;
  objc_super v3;

  v2 = self;
  -[CKTextEffectsDisplayLinkToken invalidate](v2, sel_invalidate);
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for CKTextEffectsDisplayLinkToken();
  -[CKTextEffectsDisplayLinkToken dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
}

- (_TtC7ChatKit29CKTextEffectsDisplayLinkToken)init
{
  _TtC7ChatKit29CKTextEffectsDisplayLinkToken *result;

  result = (_TtC7ChatKit29CKTextEffectsDisplayLinkToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)invalidate
{
  uint64_t v3;
  _TtC7ChatKit29CKTextEffectsDisplayLinkToken *v4;
  id v5;

  v3 = MEMORY[0x193FF501C]((char *)self + OBJC_IVAR____TtC7ChatKit29CKTextEffectsDisplayLinkToken_displayLink, a2);
  if (v3)
  {
    v5 = (id)v3;
    v4 = self;
    sub_18E666D18((uint64_t)v4, (uint64_t)v5);

  }
}

@end
