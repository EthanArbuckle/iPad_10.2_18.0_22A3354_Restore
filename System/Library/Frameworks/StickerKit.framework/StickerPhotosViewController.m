@implementation StickerPhotosViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for StickerPhotosViewController();
  -[StickerPhotosViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewWillAppear:(BOOL)a3
{
  StickerPhotosViewController *v4;

  v4 = self;
  sub_2346E4774(a3);

}

- (StickerPhotosViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_234717754();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (StickerPhotosViewController *)StickerPhotosViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (StickerPhotosViewController)initWithCoder:(id)a3
{
  return (StickerPhotosViewController *)StickerPhotosViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{

  sub_2345B0C20((uint64_t)self + OBJC_IVAR___StickerPhotosViewController_delegate);
}

@end
