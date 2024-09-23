@implementation SUUIGalleryPaneViewController

- (SUUIGalleryPaneViewController)initWithMediaComponent:(id)a3 galleryIndex:(int64_t)a4
{
  id v7;
  SUUIGalleryPaneViewController *v8;
  SUUIGalleryPaneViewController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIGalleryPaneViewController;
  v8 = -[SUUIGalleryPaneViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_component, a3);
    v9->_galleryIndex = a4;
  }

  return v9;
}

- (SUUIMediaComponent)component
{
  return self->_component;
}

- (int64_t)galleryIndex
{
  return self->_galleryIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
}

@end
