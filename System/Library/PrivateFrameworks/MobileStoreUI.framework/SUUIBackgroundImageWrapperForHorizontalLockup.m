@implementation SUUIBackgroundImageWrapperForHorizontalLockup

- (SUUIBackgroundImageWrapperForHorizontalLockup)initWithImage:(id)a3
{
  id v4;
  SUUIBackgroundImageWrapperForHorizontalLockup *v5;
  SUUIBackgroundImageWrapperForHorizontalLockup *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUIBackgroundImageWrapperForHorizontalLockup;
  v5 = -[SUUIBackgroundImageWrapperForHorizontalLockup init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_imageView, v4);

  return v6;
}

- (void)setImage:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[SUUIBackgroundImageWrapperForHorizontalLockup imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
    objc_msgSend(WeakRetained, "setImage:", v8);

  }
  -[SUUIBackgroundImageWrapperForHorizontalLockup lockup](self, "lockup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)&self->_lockup);
    objc_msgSend(v7, "setContainerBackgroundImageForPlayButton:", v8);

  }
}

- (void)setLockup:(id)a3
{
  SUUIHorizontalLockupView **p_lockup;
  id WeakRetained;
  void *v6;
  SUUIImageView **p_imageView;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id obj;

  obj = a3;
  p_lockup = &self->_lockup;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lockup);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_lockup, obj);
    p_imageView = &self->_imageView;
    v8 = objc_loadWeakRetained((id *)p_imageView);
    v6 = obj;
    if (v8)
    {
      v9 = v8;
      v10 = objc_loadWeakRetained((id *)p_imageView);
      objc_msgSend(v10, "image");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = obj;
      if (v11)
      {
        v12 = objc_loadWeakRetained((id *)p_lockup);
        v13 = objc_loadWeakRetained((id *)p_imageView);
        objc_msgSend(v13, "image");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setContainerBackgroundImageForPlayButton:", v14);

        v6 = obj;
      }
    }
  }

}

- (SUUIHorizontalLockupView)lockup
{
  return (SUUIHorizontalLockupView *)objc_loadWeakRetained((id *)&self->_lockup);
}

- (SUUIImageView)imageView
{
  return (SUUIImageView *)objc_loadWeakRetained((id *)&self->_imageView);
}

- (void)setImageView:(id)a3
{
  objc_storeWeak((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_lockup);
}

@end
