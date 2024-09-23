@implementation SNResultsForwarder

- (void)request:(id)a3 didProduceResult:(id)a4
{
  _TtC13SoundAnalysis18SNResultsForwarder *v5;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v5 = self;
  sub_1D43CBAF4();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  _TtC13SoundAnalysis18SNResultsForwarder *v6;
  id v7;

  swift_unknownObjectRetain();
  v7 = a4;
  v6 = self;
  sub_1D43CBB88();
  swift_unknownObjectRelease();

}

- (void)requestDidComplete:(id)a3
{
  _TtC13SoundAnalysis18SNResultsForwarder *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1D43CBC10((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (_TtC13SoundAnalysis18SNResultsForwarder)init
{
  sub_1D43CBC90();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
