@implementation ArtworkLoader

- (void)imageRequest:(id)a3 didLoadImage:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  swift_retain();
  sub_1AB690060(v5, a4);

  swift_release();
}

- (void)imageRequest:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  swift_retain();
  sub_1AB6900C0();

  swift_release();
}

@end
