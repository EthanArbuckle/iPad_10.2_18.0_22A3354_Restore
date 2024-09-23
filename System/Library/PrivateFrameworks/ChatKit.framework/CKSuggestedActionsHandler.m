@implementation CKSuggestedActionsHandler

- (_TtP7ChatKit33CKSuggestedActionsHandlerDelegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC7ChatKit25CKSuggestedActionsHandler_delegate;
  swift_beginAccess();
  return (_TtP7ChatKit33CKSuggestedActionsHandlerDelegate_ *)(id)MEMORY[0x193FF501C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (void)openWithFallbackString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC7ChatKit25CKSuggestedActionsHandler *v7;

  if (a3)
  {
    v4 = sub_18E768984();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_18E66F4D4(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)performChipAction:(id)a3
{
  id v4;
  _TtC7ChatKit25CKSuggestedActionsHandler *v5;

  v4 = a3;
  v5 = self;
  sub_18E66EC44(v4);

}

+ (id)pluginPayloadForShelfCardWithTitle:(id)a3 summary:(id)a4 userInfo:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v5 = sub_18E768984();
  v7 = v6;
  v8 = sub_18E768984();
  v10 = v9;
  v11 = sub_18E76887C();
  v12 = sub_18E66F67C(v5, v7, v8, v10, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

- (_TtC7ChatKit25CKSuggestedActionsHandler)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CKSuggestedActionsHandler();
  return -[CKSuggestedActionsHandler init](&v4, sel_init);
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit25CKSuggestedActionsHandler_delegate);
}

@end
