@implementation EFScheduler(MailUI_iOS)

+ (void)mf_afterUIDelay:()MailUI_iOS performBlock:
{
  float v5;
  double v6;
  void *v7;
  id v8;
  id v9;

  v9 = a4;
  UIAnimationDragCoefficient();
  v6 = v5 * a1;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "afterDelay:performBlock:", v9, v6);

}

@end
