@implementation CAFUITileDataSource

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  _TtC5CAFUI19CAFUITileDataSource *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t result;

  v4 = a3;
  v5 = self;
  v6 = CAFUITileDataSource.firstSettingsSection.getter();
  v7 = (*(_QWORD **)((char *)&v5->super.isa + OBJC_IVAR____TtC5CAFUI19CAFUITileDataSource_visibleSettingsSections))[2];

  result = v6 + v7;
  if (__OFADD__(v6, v7))
    __break(1u);
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC5CAFUI19CAFUITileDataSource *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = specialized CAFUITileDataSource.collectionView(_:numberOfItemsInSection:)(a4);

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  _TtC5CAFUI19CAFUITileDataSource *v11;
  char *v12;
  uint64_t v14;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = (char *)a3;
  v11 = self;
  v12 = CAFUITileDataSource.collectionView(_:cellForItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _TtC5CAFUI19CAFUITileDataSource *v15;
  void *v16;
  uint64_t v18;

  v7 = type metadata accessor for IndexPath();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = a3;
  v15 = self;
  v16 = (void *)CAFUITileDataSource.collectionView(_:viewForSupplementaryElementOfKind:at:)(v14, v11, v13, (uint64_t)v10);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v16;
}

- (_TtC5CAFUI19CAFUITileDataSource)init
{
  _TtC5CAFUI19CAFUITileDataSource *result;

  result = (_TtC5CAFUI19CAFUITileDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)automakerSettingService:(id)a3 didUpdateProminenceInfo:(id)a4
{
  id v6;
  id v7;
  _TtC5CAFUI19CAFUITileDataSource *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  specialized CAFUITileDataSource.automakerSettingService(_:didUpdateProminenceInfo:)();

}

- (void)automakerSettingService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5;
  _TtC5CAFUI19CAFUITileDataSource *v6;

  v5 = a3;
  v6 = self;
  specialized CAFUITileDataSource.automakerSettingService(_:didUpdateProminenceInfo:)();

}

- (void)automakerSettingService:(id)a3 didUpdateSymbolName:(id)a4
{
  @objc CAFUITileDataSource.automakerSettingService(_:didUpdateSymbolName:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))CAFUITileDataSource.updated(setting:));
}

- (void)BOOLeanSettingService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5;
  _TtC5CAFUI19CAFUITileDataSource *v6;

  v5 = a3;
  v6 = self;
  CAFUITileDataSource.updated(setting:)(v5);

}

- (void)buttonSettingService:(id)a3 didUpdateButtonAction:(unsigned __int8)a4
{
  id v5;
  _TtC5CAFUI19CAFUITileDataSource *v6;

  v5 = a3;
  v6 = self;
  CAFUITileDataSource.updated(setting:)(v5);

}

- (void)deepLinkSettingService:(id)a3 didUpdateUserVisibleValue:(id)a4
{
  @objc CAFUITileDataSource.automakerSettingService(_:didUpdateSymbolName:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))CAFUITileDataSource.updated(setting:));
}

- (void)floatSettingService:(id)a3 didUpdateValue:(float)a4
{
  id v5;
  _TtC5CAFUI19CAFUITileDataSource *v6;

  v5 = a3;
  v6 = self;
  CAFUITileDataSource.updated(setting:)(v5);

}

- (void)floatSettingService:(id)a3 didUpdateName:(id)a4
{
  id v5;
  _TtC5CAFUI19CAFUITileDataSource *v6;

  v5 = a3;
  v6 = self;
  CAFUITileDataSource.updated(setting:)(v5);

}

- (void)floatSettingService:(id)a3 didUpdateMaximumSymbolName:(id)a4
{
  @objc CAFUITileDataSource.automakerSettingService(_:didUpdateSymbolName:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))CAFUITileDataSource.updated(setting:));
}

- (void)floatSettingService:(id)a3 didUpdateMinimumSymbolName:(id)a4
{
  @objc CAFUITileDataSource.automakerSettingService(_:didUpdateSymbolName:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))CAFUITileDataSource.updated(setting:));
}

- (void)integerSettingService:(id)a3 didUpdateValue:(int)a4
{
  id v5;
  _TtC5CAFUI19CAFUITileDataSource *v6;

  v5 = a3;
  v6 = self;
  CAFUITileDataSource.updated(setting:)(v5);

}

- (void)integerSettingService:(id)a3 didUpdateMaximumSymbolName:(id)a4
{
  @objc CAFUITileDataSource.automakerSettingService(_:didUpdateSymbolName:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))CAFUITileDataSource.updated(setting:));
}

- (void)integerSettingService:(id)a3 didUpdateMinimumSymbolName:(id)a4
{
  @objc CAFUITileDataSource.automakerSettingService(_:didUpdateSymbolName:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))CAFUITileDataSource.updated(setting:));
}

- (void)integerSettingService:(id)a3 didUpdateUserVisibleValue:(id)a4
{
  @objc CAFUITileDataSource.automakerSettingService(_:didUpdateSymbolName:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))CAFUITileDataSource.updated(setting:));
}

- (void)volumeService:(id)a3 didUpdateVolume:(unsigned __int8)a4
{
  id v5;
  _TtC5CAFUI19CAFUITileDataSource *v6;

  v5 = a3;
  v6 = self;
  CAFUITileDataSource.updated(setting:)(v5);

}

- (void)volumeService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
  @objc CAFUITileDataSource.automakerSettingService(_:didUpdateSymbolName:)(self, (uint64_t)a2, a3, (uint64_t)a4, CAFUITileDataSource.updated(setting:));
}

@end
