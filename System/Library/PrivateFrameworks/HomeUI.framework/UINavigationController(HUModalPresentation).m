@implementation UINavigationController(HUModalPresentation)

- (id)finishPresentation:()HUModalPresentation animated:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];

  v7 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__UINavigationController_HUModalPresentation__finishPresentation_animated___block_invoke;
  v12[3] = &unk_1E6F51BE0;
  v12[4] = v7;
  v12[5] = a1;
  if (!__75__UINavigationController_HUModalPresentation__finishPresentation_animated___block_invoke((uint64_t)v12))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Received call to %@ from presented view controller %@, but it is not a part of the presented VC of %@ (%@)!"), v8, v7, a1, v9);

  }
  objc_msgSend(a1, "hu_dismissViewControllerAnimated:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
