@implementation NowPlayingControllerDelegate

- (void)controller:(id)a3 didLoadResponse:(id)a4
{
  id v7;
  id v8;
  _TtC10ChronoCore28NowPlayingControllerDelegate *v9;

  if (swift_weakLoadStrong())
  {
    v7 = a3;
    v8 = a4;
    v9 = self;
    sub_1D28B9E7C();

    swift_release();
  }
}

- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5
{
  id v7;
  _TtC10ChronoCore28NowPlayingControllerDelegate *v8;

  if (swift_weakLoadStrong())
  {
    v7 = a3;
    v8 = self;
    sub_1D28B9E7C();

    swift_release();
  }
}

- (void)controller:(id)a3 clientPropertiesDidChangeFrom:(id)a4 to:(id)a5
{
  id v9;
  id v10;
  id v11;
  _TtC10ChronoCore28NowPlayingControllerDelegate *v12;

  if (swift_weakLoadStrong())
  {
    v9 = a3;
    v10 = a4;
    v11 = a5;
    v12 = self;
    sub_1D28B9E7C();

    swift_release();
  }
}

- (void)controller:(id)a3 didFailWithError:(id)a4
{
  id v7;
  id v8;
  _TtC10ChronoCore28NowPlayingControllerDelegate *v9;

  if (swift_weakLoadStrong())
  {
    v7 = a3;
    v8 = a4;
    v9 = self;
    sub_1D28B9E7C();

    swift_release();
  }
}

- (void)controllerWillReloadForInvalidation:(id)a3
{
  id v5;
  _TtC10ChronoCore28NowPlayingControllerDelegate *v6;

  if (swift_weakLoadStrong())
  {
    v5 = a3;
    v6 = self;
    sub_1D28B9E7C();

    swift_release();
  }
}

- (_TtC10ChronoCore28NowPlayingControllerDelegate)init
{
  _TtC10ChronoCore28NowPlayingControllerDelegate *result;

  result = (_TtC10ChronoCore28NowPlayingControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
