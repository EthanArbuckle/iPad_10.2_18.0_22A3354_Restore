@implementation SHManagedSessionWrapperDelegate

- (void)finishedManagedSession:(id)a3
{
  id v4;
  _TtC9ShazamKit31SHManagedSessionWrapperDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_218C162B0();

}

- (void)didCalculateSpectralData:(id)a3
{
  unint64_t v4;
  _TtC9ShazamKit31SHManagedSessionWrapperDelegate *v5;

  sub_218C158E0();
  v4 = sub_218C587A8();
  v5 = self;
  sub_218C14AEC(v4);

  swift_bridgeObjectRelease();
}

- (_TtC9ShazamKit31SHManagedSessionWrapperDelegate)init
{
  _TtC9ShazamKit31SHManagedSessionWrapperDelegate *result;

  result = (_TtC9ShazamKit31SHManagedSessionWrapperDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_218C16554((uint64_t)self + OBJC_IVAR____TtC9ShazamKit31SHManagedSessionWrapperDelegate_multipleResultsContinuation, &qword_2550091B0);
  sub_218C16554((uint64_t)self + OBJC_IVAR____TtC9ShazamKit31SHManagedSessionWrapperDelegate_spectralDataContinuation, &qword_2550091B8);
  swift_release();
  swift_release();
}

@end
