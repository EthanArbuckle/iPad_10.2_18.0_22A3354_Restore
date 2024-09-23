@implementation QuickReplyButtonListHelper

+ (id)makeListView:(id)a3 delegate:(id)a4 configurationObject:(id)a5
{
  uint64_t v7;
  id v8;
  void *v9;

  v7 = sub_18E768AE0();
  swift_unknownObjectRetain();
  v8 = a5;
  v9 = (void *)_s7ChatKit26QuickReplyButtonListHelperC04makeF4View_8delegate19configurationObjectSo6UIViewCSaySSG_AA0cdeF8Delegate_pAA0cdeF13ConfigurationCtFZ_0(v7, (uint64_t)a4, v8);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC7ChatKit26QuickReplyButtonListHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for QuickReplyButtonListHelper();
  return -[QuickReplyButtonListHelper init](&v3, sel_init);
}

@end
