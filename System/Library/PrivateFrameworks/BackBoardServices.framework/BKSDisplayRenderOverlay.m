@implementation BKSDisplayRenderOverlay

- (BKSDisplayRenderOverlay)initWithDescriptor:(id)a3
{
  id v5;
  BKSDisplayRenderOverlay *v6;
  BKSDisplayRenderOverlay *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKSDisplayRenderOverlay;
  v6 = -[BKSDisplayRenderOverlay init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_descriptor, a3);

  return v7;
}

- (NSString)name
{
  return -[BKSDisplayRenderOverlayDescriptor name](self->_descriptor, "name");
}

- (CADisplay)display
{
  return -[BKSDisplayRenderOverlayDescriptor display](self->_descriptor, "display");
}

- (int64_t)interfaceOrientation
{
  return -[BKSDisplayRenderOverlayDescriptor interfaceOrientation](self->_descriptor, "interfaceOrientation");
}

- (BOOL)lockBacklight
{
  return -[BKSDisplayRenderOverlayDescriptor lockBacklight](self->_descriptor, "lockBacklight");
}

- (BKSDisplayProgressIndicatorProperties)progressIndicatorProperties
{
  return -[BKSDisplayRenderOverlayDescriptor progressIndicatorProperties](self->_descriptor, "progressIndicatorProperties");
}

- (void)present
{
  BKSDisplayServicesApplyRenderOverlay(self, 0);
}

- (BKSDisplayRenderOverlayDescriptor)overlayDescriptor
{
  return self->_descriptor;
}

- (BOOL)isInterstitial
{
  return 0;
}

- (void)dismiss
{
  -[BKSDisplayRenderOverlay dismissWithAnimation:](self, "dismissWithAnimation:", 0);
}

- (void)dismissWithAnimation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__BKSDisplayRenderOverlay_dismissWithAnimation___block_invoke;
  v6[3] = &unk_1E1EA1BF8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BKSDisplayRenderOverlay succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self->_descriptor);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_descriptor, CFSTR("descriptor"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BKSDisplayRenderOverlay descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BKSDisplayRenderOverlayDescriptor)_descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
}

void __48__BKSDisplayRenderOverlay_dismissWithAnimation___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  BSRunLoopPerformAfterCACommit();

}

BOOL __48__BKSDisplayRenderOverlay_dismissWithAnimation___block_invoke_2(uint64_t a1)
{
  return BKSDisplayServicesRemoveRenderOverlay(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

+ (id)existingOverlayForDisplay:(id)a3
{
  return BKSDisplayServicesGetRenderOverlayForDisplay(a3);
}

@end
