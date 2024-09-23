@implementation _MKMapItemDetailView

- (_MKMapItemDetailView)initWithFrame:(CGRect)a3
{
  _MKMapItemDetailView *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MKMapItemDetailView;
  v3 = -[_MKMapItemDetailView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_orientationDidChangeNotification_, *MEMORY[0x1E0CEB450], 0);

    }
  }
  return v3;
}

- (void)orientationDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  MKGetMKRemoteUILog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_DEBUG, "MKMapItemDetailViewController orientationDidChangeNotification", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57___MKMapItemDetailView_orientationDidChangeNotification___block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (CGSize)intrinsicContentSize
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;
  CGSize result;

  v13 = *MEMORY[0x1E0C80C00];
  MKGetMKRemoteUILog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[_MKMapItemDetailView bounds](self, "bounds");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "MKMapItemDetailViewController intrinsicContentSize %{public}@", buf, 0xCu);

  }
  -[_MKMapItemDetailView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  result.height = v10;
  result.width = v8;
  return result;
}

@end
