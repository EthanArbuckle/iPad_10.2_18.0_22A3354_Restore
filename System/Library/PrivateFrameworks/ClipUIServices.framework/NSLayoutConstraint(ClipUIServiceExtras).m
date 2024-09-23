@implementation NSLayoutConstraint(ClipUIServiceExtras)

+ (void)cps_if:()ClipUIServiceExtras thenActivate:elseActivate:
{
  id v7;

  v7 = a5;
  objc_msgSend(a4, "setActive:", a3);
  objc_msgSend(v7, "setActive:", a3 ^ 1);

}

+ (void)cps_if:()ClipUIServiceExtras thenActivateConstraints:elseActivateConstraints:
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v9 = a5;
  v10 = a4;
  v13 = v10;
  if (a3)
    v11 = a5;
  else
    v11 = a4;
  if (a3)
    v12 = v10;
  else
    v12 = v9;
  objc_msgSend(a1, "deactivateConstraints:", v11);
  objc_msgSend(a1, "activateConstraints:", v12);

}

- (void)cps_setPriority:()ClipUIServiceExtras
{
  objc_msgSend(a1, "setPriority:");
  return a1;
}

@end
