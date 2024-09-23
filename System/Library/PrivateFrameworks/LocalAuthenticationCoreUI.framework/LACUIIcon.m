@implementation LACUIIcon

+ (UIImage)genericIcon
{
  id v2;
  UIImage *result;
  UIImage *v4;

  v2 = objc_msgSend((id)objc_opt_self(), sel_genericApplicationIcon);
  result = (UIImage *)LACUIImageWithIcon(v2);
  if (result)
  {
    v4 = result;

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (id)imageForBundleIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (a3)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  swift_getObjCClassMetadata();
  v6 = static LACUIIcon.image(forBundleIdentifier:)(v3, v5);
  swift_bridgeObjectRelease();
  return v6;
}

+ (id)imageForPath:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  id result;
  id v10;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = specialized static LACUIIcon.icon(forPath:)(v4, v6);
  if (!v7)
  {
    v10 = objc_msgSend(a1, sel_genericIcon);
    goto LABEL_8;
  }
  v8 = v7;
  result = LACUIImageWithIcon(v7);
  if (result)
  {
    v10 = result;

LABEL_8:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

- (LACUIIcon)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LACUIIcon;
  return -[LACUIIcon init](&v3, sel_init);
}

@end
