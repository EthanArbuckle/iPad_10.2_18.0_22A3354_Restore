@implementation CNPRUISPosterAppearanceObservingAttachmentProvider

- (CNPRUISPosterAppearanceObservingAttachmentProvider)initWithConfiguration:(id)a3
{
  id v4;
  CNPRUISPosterAppearanceObservingAttachmentProvider *v5;
  id v6;
  void *v7;
  uint64_t v8;
  PRUISPosterAppearanceObservingAttachmentProvider *wrappedProvider;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNPRUISPosterAppearanceObservingAttachmentProvider;
  v5 = -[CNPRUISPosterAppearanceObservingAttachmentProvider init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_alloc((Class)getPRUISPosterAppearanceObservingAttachmentProviderClass[0]());
    objc_msgSend(v4, "wrappedPosterConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithPRSConfiguration:", v7);
    wrappedProvider = v5->_wrappedProvider;
    v5->_wrappedProvider = (PRUISPosterAppearanceObservingAttachmentProvider *)v8;

  }
  return v5;
}

- (UIView)overlayContentView
{
  return (UIView *)-[PRUISPosterAppearanceObservingAttachmentProvider overlayContentView](self->_wrappedProvider, "overlayContentView");
}

- (UIView)obscurableContentView
{
  return (UIView *)-[PRUISPosterAppearanceObservingAttachmentProvider obscurableContentView](self->_wrappedProvider, "obscurableContentView");
}

- (UIView)vibrantObscurableContentView
{
  return (UIView *)-[PRUISPosterAppearanceObservingAttachmentProvider vibrantObscurableContentView](self->_wrappedProvider, "vibrantObscurableContentView");
}

- (CNPRUISPosterAttachment)obscurableContentAttachment
{
  CNPRUISPosterAttachment *v3;
  void *v4;
  CNPRUISPosterAttachment *v5;

  v3 = [CNPRUISPosterAttachment alloc];
  -[PRUISPosterAppearanceObservingAttachmentProvider obscurableContentAttachment](self->_wrappedProvider, "obscurableContentAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNPRUISPosterAttachment initWithAttachment:](v3, "initWithAttachment:", v4);

  return v5;
}

- (CNPRUISPosterAttachment)overlayContentAttachment
{
  CNPRUISPosterAttachment *v3;
  void *v4;
  CNPRUISPosterAttachment *v5;

  v3 = [CNPRUISPosterAttachment alloc];
  -[PRUISPosterAppearanceObservingAttachmentProvider overlayContentAttachment](self->_wrappedProvider, "overlayContentAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNPRUISPosterAttachment initWithAttachment:](v3, "initWithAttachment:", v4);

  return v5;
}

- (void)applyPosterAppearanceToObserver:(id)a3
{
  -[PRUISPosterAppearanceObservingAttachmentProvider applyPosterAppearanceToObserver:](self->_wrappedProvider, "applyPosterAppearanceToObserver:", a3);
}

- (PRUISPosterAppearanceObservingAttachmentProvider)wrappedProvider
{
  return self->_wrappedProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedProvider, 0);
}

@end
