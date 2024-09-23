@implementation CAFUICabinAssetCoordinator

- (_TtC5CAFUI26CAFUICabinAssetCoordinator)init
{
  return (_TtC5CAFUI26CAFUICabinAssetCoordinator *)CAFUICabinAssetCoordinator.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC5CAFUI26CAFUICabinAssetCoordinator__cabinImage;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UIImage?>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end
