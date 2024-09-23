@implementation Coordinator

- (void)dealloc
{
  _TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F711Coordinator *v2;

  v2 = self;
  Coordinator.__deallocating_deinit();
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)&self->configuration[OBJC_IVAR____TtC7SwiftUIP33_8AA246B2E0E916EFA5AD706DCC8A0FE811Coordinator_configuration
                                     + 56];
  v3 = self->configuration[OBJC_IVAR____TtC7SwiftUIP33_8AA246B2E0E916EFA5AD706DCC8A0FE811Coordinator_configuration + 64];
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  outlined consume of Environment<Color?>.Content(v2, v3);
}

- (void)primaryActionTriggered:(id)a3
{
  uint64_t v3;
  id v5;
  id v6;
  _TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F711Coordinator *v7;

  v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F711Coordinator_action);
  if (v3)
  {
    MEMORY[0x1E0C80A78](self, a2);
    v6 = v5;
    v7 = self;
    outlined copy of AppIntentExecutor?(v3);
    static Update.dispatchImmediately<A>(_:)();
    outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(v3);

  }
}

- (void)menuActionTriggered:(id)a3
{
  id v4;
  void *v5;
  _TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F711Coordinator *v6;

  v4 = a3;
  v6 = self;
  v5 = Coordinator.makeMenu()();
  objc_msgSend(v4, sel_setMenu_, v5);

  Coordinator.setupNotifications(_:)();
}

- (_TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F711Coordinator)init
{
  _TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F711Coordinator *result;

  result = (_TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F711Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)valueChanged:(id)a3
{
  id v4;
  _TtC7SwiftUIP33_8AA246B2E0E916EFA5AD706DCC8A0FE811Coordinator *v5;

  v4 = a3;
  v5 = self;
  Coordinator.valueChanged(_:)(v4);

}

- (void)editingBegan:(id)a3
{
  id v4;
  _TtC7SwiftUIP33_F1E9485F33A623EEFA647AA5EC4AE09411Coordinator *v5;

  v4 = a3;
  v5 = self;
  static Update.dispatchImmediately<A>(_:)();

}

- (void)editingEnded:(id)a3
{
  id v4;
  _TtC7SwiftUIP33_8AA246B2E0E916EFA5AD706DCC8A0FE811Coordinator *v5;

  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC7SwiftUIP33_8AA246B2E0E916EFA5AD706DCC8A0FE811Coordinator_isUpdating) = 0;
  v4 = a3;
  v5 = self;
  static Update.dispatchImmediately<A>(_:)();

}

- (_TtC7SwiftUIP33_F1E9485F33A623EEFA647AA5EC4AE09411Coordinator)init
{
  _TtC7SwiftUIP33_F1E9485F33A623EEFA647AA5EC4AE09411Coordinator *result;

  result = (_TtC7SwiftUIP33_F1E9485F33A623EEFA647AA5EC4AE09411Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF011Coordinator_lastIDs))[2];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF011Coordinator *v12;
  void *v13;
  Class isa;
  id v15;
  uint64_t v17;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = a3;
  v12 = self;
  v13 = (void *)MEMORY[0x18D75CC88](0xD00000000000001CLL, 0x8000000187BDB0A0);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v15 = objc_msgSend(v11, sel_dequeueReusableCellWithReuseIdentifier_forIndexPath_, v13, isa);

  Coordinator.configureCell(_:at:)(v15);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v15;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  @objc Coordinator.collectionView(_:willDisplay:forItemAt:)(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, char *))specialized Coordinator.collectionView(_:willDisplay:forItemAt:));
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  @objc Coordinator.collectionView(_:willDisplay:forItemAt:)(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, char *))specialized Coordinator.collectionView(_:didEndDisplaying:forItemAt:));
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v4 = type metadata accessor for IndexPath();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return 0;
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  id v5;
  _TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF011Coordinator *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v5 = a3;
  v6 = self;
  specialized Coordinator.collectionView(_:targetContentOffsetForProposedContentOffset:)(v5);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  CGSize result;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  objc_msgSend(a3, sel_bounds);
  v12 = v11;
  v14 = v13;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF011Coordinator *v5;

  v4 = a3;
  v5 = self;
  Coordinator.scrollViewDidScroll(_:)(v4);

}

- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF011Coordinator)init
{
  _TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF011Coordinator *result;

  result = (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF011Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)pageDidChange:(id)a3
{
  id v4;
  _TtC7SwiftUIP33_59ABB005D29F0E32A3A965407533FE0D11Coordinator *v5;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_interactionState);
  static Update.dispatchImmediately<A>(_:)();

}

- (_TtC7SwiftUIP33_59ABB005D29F0E32A3A965407533FE0D11Coordinator)init
{
  _TtC7SwiftUIP33_59ABB005D29F0E32A3A965407533FE0D11Coordinator *result;

  result = (_TtC7SwiftUIP33_59ABB005D29F0E32A3A965407533FE0D11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)textDidChange:(id)a3
{
  id v4;
  _TtC7SwiftUIP33_87E15EBB5C00F49DEF8C638A73559D9211Coordinator *v5;

  v4 = a3;
  v5 = self;
  Coordinator.textDidChange(_:)(v4);

}

- (void)editingDidBegin:(id)a3
{
  id v4;
  _TtC7SwiftUIP33_87E15EBB5C00F49DEF8C638A73559D9211Coordinator *v5;

  v4 = a3;
  v5 = self;
  static Update.dispatchImmediately<A>(_:)();

}

- (void)editingDidEnd:(id)a3
{
  id v4;
  _TtC7SwiftUIP33_87E15EBB5C00F49DEF8C638A73559D9211Coordinator *v5;

  v4 = a3;
  v5 = self;
  static Update.dispatchImmediately<A>(_:)();

}

- (_TtC7SwiftUIP33_87E15EBB5C00F49DEF8C638A73559D9211Coordinator)init
{
  _TtC7SwiftUIP33_87E15EBB5C00F49DEF8C638A73559D9211Coordinator *result;

  result = (_TtC7SwiftUIP33_87E15EBB5C00F49DEF8C638A73559D9211Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUIP33_8AA246B2E0E916EFA5AD706DCC8A0FE811Coordinator)init
{
  _TtC7SwiftUIP33_8AA246B2E0E916EFA5AD706DCC8A0FE811Coordinator *result;

  result = (_TtC7SwiftUIP33_8AA246B2E0E916EFA5AD706DCC8A0FE811Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
