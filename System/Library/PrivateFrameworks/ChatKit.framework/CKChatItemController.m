@implementation CKChatItemController

- (NSArray)chatItems
{
  return (NSArray *)sub_18E608720((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___CKChatItemController_chatItems, (unint64_t *)&qword_1EE0FA970);
}

- (void)setChatItems:(id)a3
{
  unint64_t v4;
  CKChatItemController *v5;

  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FA970);
  v4 = sub_18E768AE0();
  v5 = self;
  sub_18E608650(v4);

}

- (NSArray)associatedChatItems
{
  return (NSArray *)sub_18E608720((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___CKChatItemController_associatedChatItems, &qword_1EE0FB0A8);
}

- (void)setAssociatedChatItems:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  sub_18E00F31C(0, &qword_1EE0FB0A8);
  v4 = sub_18E768AE0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___CKChatItemController_associatedChatItems);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (id)initForCollectionView:(id)a3 chatItems:(id)a4 delegate:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;

  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FA970);
  v6 = sub_18E768AE0();
  v7 = a3;
  swift_unknownObjectRetain();
  v8 = sub_18E609BAC(v7, v6);

  swift_unknownObjectRelease();
  return v8;
}

- (id)setChatItems:(id)a3 completion:(id)a4
{
  void (*v5)(uint64_t);
  unint64_t v6;
  uint64_t v7;
  CKChatItemController *v8;
  void *v9;

  v5 = (void (*)(uint64_t))_Block_copy(a4);
  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FA970);
  v6 = sub_18E768AE0();
  if (v5)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    v5 = (void (*)(uint64_t))sub_18E5228F4;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  v9 = (void *)sub_18E608AC0(v6, v5, v7);
  sub_18E011A40((uint64_t)v5);

  swift_bridgeObjectRelease();
  return v9;
}

- (void)setChatItemsUsingReloadDataWithoutAnimation:(id)a3
{
  unint64_t v4;
  CKChatItemController *v5;

  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FA970);
  v4 = sub_18E768AE0();
  v5 = self;
  sub_18E609398(v4);

  swift_bridgeObjectRelease();
}

- (void)addChatItem:(id)a3 at:(int64_t)a4
{
  id v6;
  CKChatItemController *v7;

  v6 = a3;
  v7 = self;
  sub_18E6094A4(v6, a4);

}

- (void)removeChatItemAt:(int64_t)a3
{
  CKChatItemController *v4;

  v4 = self;
  sub_18E609660(a3);

}

- (CKChatItemController)init
{
  CKChatItemController *result;

  result = (CKChatItemController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKChatItemController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
