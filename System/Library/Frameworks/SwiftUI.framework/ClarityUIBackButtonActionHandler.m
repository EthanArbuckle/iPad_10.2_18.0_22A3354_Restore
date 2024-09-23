@implementation ClarityUIBackButtonActionHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  unint64_t v10;
  id v11;
  id v12;
  id v13;
  _TtC7SwiftUI32ClarityUIBackButtonActionHandler *v14;
  Class isa;

  type metadata accessor for BSAction();
  lazy protocol witness table accessor for type BSAction and conformance NSObject();
  v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  specialized ClarityUIBackButtonActionHandler._respond(to:for:in:from:)(v10);

  swift_bridgeObjectRelease();
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (_TtC7SwiftUI32ClarityUIBackButtonActionHandler)init
{
  return (_TtC7SwiftUI32ClarityUIBackButtonActionHandler *)@objc ClarityUIApplicationSceneClientSettings.init()(self, (uint64_t)a2, type metadata accessor for ClarityUIBackButtonActionHandler);
}

@end
