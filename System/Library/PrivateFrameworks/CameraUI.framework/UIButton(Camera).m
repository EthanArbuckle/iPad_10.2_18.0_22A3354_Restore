@implementation UIButton(Camera)

- (id)hudItemForAccessibilityHUDManager:()Camera
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "titleForState:", objc_msgSend(a1, "state"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1F0336900))
    objc_msgSend(a1, "imageForAccessibilityHUD");
  else
    objc_msgSend(a1, "imageForState:", objc_msgSend(a1, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC3418]);
  v5 = (void *)objc_msgSend(v4, "initWithTitle:image:imageInsets:scaleImage:", v2, v3, 1, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

  return v5;
}

- (void)selectedByAccessibilityHUDManager:()Camera
{
  dispatch_time_t v2;
  _QWORD block[5];

  objc_msgSend(a1, "cancelTouchTracking");
  objc_msgSend(a1, "sendActionsForControlEvents:", 64);
  objc_msgSend(a1, "setHighlighted:", 1);
  v2 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__UIButton_Camera__selectedByAccessibilityHUDManager___block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = a1;
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

@end
