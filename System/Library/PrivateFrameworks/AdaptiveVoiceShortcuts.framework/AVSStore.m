@implementation AVSStore

+ (NSDictionary)shortcutsNamesDictionary
{
  void *v2;

  _sSo8AVSStoreC22AdaptiveVoiceShortcutsE24shortcutsNamesDictionarySDyS2SGvgZ_0();
  v2 = (void *)sub_235F4CA50();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

+ (NSArray)shortcuts
{
  uint64_t v2;
  void *v3;

  v2 = _sSo8AVSStoreC22AdaptiveVoiceShortcutsE9shortcutsSaySo0bC17ShortcutObjcClassCGvgZ_0();
  type metadata accessor for AdaptiveVoiceShortcutObjcClass(v2);
  v3 = (void *)sub_235F4CAE0();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)deleteShortcutWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  AVSStore *v7;

  v4 = sub_235F4CA80();
  v6 = v5;
  v7 = self;
  _sSo8AVSStoreC22AdaptiveVoiceShortcutsE14deleteShortcut14withIdentifierySS_tF_0(v4, v6);

  swift_bridgeObjectRelease();
}

- (AVSStore)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVSStore;
  return -[AVSStore init](&v3, sel_init);
}

@end
