@implementation MusicUIServiceApplication

- (id)_keyWindowForScreen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "_userInterfaceIdiom") == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MusicUIServiceApplication delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_keyWindowForScreen:", v4));

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MusicUIServiceApplication;
    v7 = -[MusicUIServiceApplication _keyWindowForScreen:](&v9, "_keyWindowForScreen:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

@end
