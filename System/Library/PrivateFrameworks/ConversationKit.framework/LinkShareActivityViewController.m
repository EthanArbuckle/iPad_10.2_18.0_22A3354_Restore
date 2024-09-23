@implementation LinkShareActivityViewController

- (_TtC15ConversationKit31LinkShareActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    _sSo8NSObjectCMaTm_0(0, &lazy cache variable for type metadata for UIActivity);
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    v6 = 0;
  }
  return (_TtC15ConversationKit31LinkShareActivityViewController *)LinkShareActivityViewController.init(activityItems:applicationActivities:)(v5, v6);
}

- (void)_prepareActivity:(id)a3
{
  id v4;
  _TtC15ConversationKit31LinkShareActivityViewController *v5;

  v4 = a3;
  v5 = self;
  LinkShareActivityViewController._prepare(_:)((UIActivity)v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
