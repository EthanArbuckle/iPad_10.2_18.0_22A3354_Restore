@implementation SearchController

- (UISearchBar)searchBar
{
  _TtC20ProductPageExtension16SearchController *v2;
  id v3;

  v2 = self;
  v3 = sub_10016FCCC();

  return (UISearchBar *)v3;
}

- (void)viewWillLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for SearchController();
  -[SearchController viewWillLayoutSubviews](&v2, "viewWillLayoutSubviews");
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  _TtC20ProductPageExtension16SearchController *v5;
  UISearchBar *v6;

  v4 = a3;
  v5 = self;
  v6 = -[SearchController searchBar](v5, "searchBar");
  -[UISearchBar _setDisableDictationButton:](v6, "_setDisableDictationButton:", 0);

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  _TtC20ProductPageExtension16SearchController *v5;

  v4 = a3;
  v5 = self;
  sub_100170108(v4);

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t ObjectType;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _TtC20ProductPageExtension16SearchController *v15;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension16SearchController_filterButton);
  v5 = a3;
  v15 = self;
  objc_msgSend(v4, "setEnabled:", 0);
  v6 = -[SearchController delegate](v15, "delegate");
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType(v6, v7);
    v10 = swift_conformsToProtocol2(ObjectType, &protocol descriptor for SearchControllerDelegate);
    if (v10)
      v12 = v10;
    else
      v12 = 0;
    if (v10)
      v13 = v8;
    else
      v13 = 0;
    if (v13)
    {
      v14 = swift_getObjectType(v13, v11);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v14, v12);
    }
    swift_unknownObjectRelease(v8);
  }
  -[SearchController setActive:](v15, "setActive:", 0);

}

- (BOOL)searchBarShouldClear:(id)a3
{
  _TtC20ProductPageExtension16SearchController *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t ObjectType;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v4 = self;
  v5 = a3;
  v6 = -[SearchController delegate](v4, "delegate");
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType(v6, v7);
    v10 = swift_conformsToProtocol2(ObjectType, &protocol descriptor for SearchControllerDelegate);
    if (v10)
      v12 = v10;
    else
      v12 = 0;
    if (v10)
      v13 = v8;
    else
      v13 = 0;
    if (v13)
    {
      v14 = swift_getObjectType(v13, v11);
      (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v14, v12);
    }

    swift_unknownObjectRelease(v8);
  }
  else
  {

  }
  return 1;
}

- (void)_searchBarWillLayoutSubviews:(id)a3 inSearchFieldContainer:(id)a4 searchTextFieldFrame:(CGRect)a5 cancelButtonFrame:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v16;
  id v17;
  _TtC20ProductPageExtension16SearchController *v18;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5.size.height;
  v11 = a5.size.width;
  v12 = a5.origin.y;
  v13 = a5.origin.x;
  v16 = a3;
  v17 = a4;
  v18 = self;
  sub_100170E30(a4, v13, v12, v11, v10, x, y, width, height);

}

- (NSArray)keyCommands
{
  _TtC20ProductPageExtension16SearchController *v2;
  unint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_100170890();

  if (v3)
  {
    sub_100018B6C(0, (unint64_t *)&qword_100808190, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)handleCancelKeyCommandWithCommand:(id)a3
{
  id v4;
  _TtC20ProductPageExtension16SearchController *v5;

  v4 = a3;
  v5 = self;
  sub_1001712BC();

}

- (_TtC20ProductPageExtension16SearchController)initWithSearchResultsController:(id)a3
{
  id v4;
  _TtC20ProductPageExtension16SearchController *v5;

  v4 = a3;
  v5 = (_TtC20ProductPageExtension16SearchController *)sub_100171394((uint64_t)a3);

  return v5;
}

- (_TtC20ProductPageExtension16SearchController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC20ProductPageExtension16SearchController *)sub_100170A80(v5, v7, a4);
}

- (_TtC20ProductPageExtension16SearchController)initWithCoder:(id)a3
{
  return (_TtC20ProductPageExtension16SearchController *)sub_100170C00(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16SearchController_searchTextInput));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16SearchController____lazy_storage____searchBar));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension16SearchController_filterButtonHandler), *(_QWORD *)&self->messagesSearchBarVerticalSpace[OBJC_IVAR____TtC20ProductPageExtension16SearchController_filterButtonHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16SearchController_filterButton));
}

@end
