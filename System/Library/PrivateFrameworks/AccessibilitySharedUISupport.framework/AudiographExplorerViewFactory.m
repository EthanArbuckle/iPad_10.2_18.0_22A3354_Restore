@implementation AudiographExplorerViewFactory

+ (id)makeAudiographExplorerUIFor:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)sub_21C801938(v3);

  return v4;
}

- (_TtC28AccessibilitySharedUISupport29AudiographExplorerViewFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AudiographExplorerViewFactory();
  return -[AudiographExplorerViewFactory init](&v3, sel_init);
}

@end
