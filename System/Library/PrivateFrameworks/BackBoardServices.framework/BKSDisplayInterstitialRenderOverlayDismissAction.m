@implementation BKSDisplayInterstitialRenderOverlayDismissAction

- (BKSDisplayInterstitialRenderOverlayDismissAction)initWithDescriptor:(id)a3
{
  id v5;
  BKSDisplayInterstitialRenderOverlayDismissAction *v6;
  BKSDisplayInterstitialRenderOverlayDismissAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKSDisplayInterstitialRenderOverlayDismissAction;
  v6 = -[BKSDisplayInterstitialRenderOverlayDismissAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_overlayDescriptor, a3);

  return v7;
}

- (BKSDisplayRenderOverlayDescriptor)overlayDescriptor
{
  return self->_overlayDescriptor;
}

- (void)dismiss
{
  -[BKSDisplayInterstitialRenderOverlayDismissAction dismissWithAnimation:](self, "dismissWithAnimation:", 0);
}

- (void)dismissWithAnimation:(id)a3
{
  BKSDisplayServicesDismissInterstitialRenderOverlay(a3);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BKSDisplayInterstitialRenderOverlayDismissAction succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self->_overlayDescriptor);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_overlayDescriptor, CFSTR("overlayDescriptor"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BKSDisplayInterstitialRenderOverlayDismissAction descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayDescriptor, 0);
}

@end
