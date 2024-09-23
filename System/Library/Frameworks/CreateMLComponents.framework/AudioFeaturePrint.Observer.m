@implementation AudioFeaturePrint.Observer

- (void)request:(id)a3 didProduceResult:(id)a4
{
  _TtCV18CreateMLComponents17AudioFeaturePrint8Observer *v6;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  sub_22A9A9AD0((uint64_t)a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  _TtCV18CreateMLComponents17AudioFeaturePrint8Observer *v7;
  id v8;

  swift_unknownObjectRetain();
  v8 = a4;
  v7 = self;
  sub_22A9A9EE4((uint64_t)a3, v8);
  swift_unknownObjectRelease();

}

- (void)requestDidComplete:(id)a3
{
  _TtCV18CreateMLComponents17AudioFeaturePrint8Observer *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_22A9AA058((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (_TtCV18CreateMLComponents17AudioFeaturePrint8Observer)init
{
  return (_TtCV18CreateMLComponents17AudioFeaturePrint8Observer *)sub_22A9AA1C8();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
