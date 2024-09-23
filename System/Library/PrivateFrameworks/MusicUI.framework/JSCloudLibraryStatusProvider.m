@implementation JSCloudLibraryStatusProvider

- (JSValue)isCloudLibraryEnabled
{
  _TtC7MusicUI28JSCloudLibraryStatusProvider *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21D718324();

  return (JSValue *)v3;
}

- (JSValue)isCloudLibraryLoaded
{
  _TtC7MusicUI28JSCloudLibraryStatusProvider *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21D718368();

  return (JSValue *)v3;
}

- (void)setIsCloudLibraryLoaded:(id)a3
{
  id v4;
  _TtC7MusicUI28JSCloudLibraryStatusProvider *v5;

  v4 = a3;
  v5 = self;

}

- (_TtC7MusicUI28JSCloudLibraryStatusProvider)init
{
  sub_21D71844C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
}

@end
