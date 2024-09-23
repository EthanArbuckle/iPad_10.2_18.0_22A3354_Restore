@implementation ReplayerViewController

- (void)loadView
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)MTKView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[ReplayerViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ReplayerViewController;
  -[ReplayerViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReplayerViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  self->_orientationMask = 30;
}

- (void)setDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  Renderer *v7;
  Renderer *renderer;
  Renderer *v9;
  id v10;
  _QWORD block[5];
  id v12;

  v10 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[ReplayerViewController loadView](self, "loadView");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReplayerViewController view](self, "view"));
    objc_msgSend(v4, "setDevice:", v10);
    objc_msgSend(v4, "setColorPixelFormat:", 81);
    objc_msgSend(v4, "setPaused:", 1);
    objc_msgSend(v4, "setAutoResizeDrawable:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v5, "bounds");
    objc_msgSend(v4, "setBounds:");

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
    objc_msgSend(v6, "setColorspace:", CGColorSpaceCreateWithName(kCGColorSpaceSRGB));
    v7 = -[Renderer initWithMetalKitView:]([Renderer alloc], "initWithMetalKitView:", v4);
    renderer = self->_renderer;
    self->_renderer = v7;

    v9 = self->_renderer;
    objc_msgSend(v4, "drawableSize");
    -[Renderer mtkView:drawableSizeWillChange:](v9, "mtkView:drawableSizeWillChange:", v4);
    objc_msgSend(v4, "setDelegate:", self->_renderer);

  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000684C;
    block[3] = &unk_10000C7E0;
    block[4] = self;
    v12 = v10;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (void)setDisplayTextureEncoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ReplayerViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "device"));
  objc_msgSend(v6, "setDevice:", v5);

  -[Renderer setDisplayTextureEncoder:](self->_renderer, "setDisplayTextureEncoder:", v4);
  objc_msgSend(v6, "draw");

}

- (void)setOrientation:(int64_t)a3
{
  unint64_t v5;
  _QWORD v6[5];
  _QWORD block[6];

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if ((unint64_t)(a3 - 1) > 3)
      v5 = 30;
    else
      v5 = qword_1000080D8[a3 - 1];
    self->_orientationMask = v5;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100006844;
    v6[3] = &unk_10000C830;
    v6[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006838;
    block[3] = &unk_10000C808;
    block[4] = self;
    block[5] = a3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_orientationMask;
}

- (void)setColorPixelFormat:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ReplayerViewController view](self, "view"));
  objc_msgSend(v4, "setColorPixelFormat:", a3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
}

@end
