@implementation CAAnimation(LAUICAUtilities)

- (id)laui_didStartHandler
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "didStartHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = (void *)MEMORY[0x20BD1B708](v2);

  return v3;
}

- (void)laui_setDidStartHandler:()LAUICAUtilities
{
  LAUIAnimationDelegate *v4;
  void (**v5)(void);

  v5 = a3;
  objc_msgSend(a1, "delegate");
  v4 = (LAUIAnimationDelegate *)objc_claimAutoreleasedReturnValue();
  if (v5 && !v4)
  {
    v4 = objc_alloc_init(LAUIAnimationDelegate);
    objc_msgSend(a1, "setDelegate:", v4);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[LAUIAnimationDelegate setDidStartHandler:](v4, "setDidStartHandler:", v5);
  }
  else if (v5)
  {
    v5[2]();
  }

}

- (id)laui_didStopHandler
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "didStopHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = (void *)MEMORY[0x20BD1B708](v2);

  return v3;
}

- (void)laui_setDidStopHandler:()LAUICAUtilities
{
  LAUIAnimationDelegate *v4;
  void (**v5)(id, _QWORD);

  v5 = a3;
  objc_msgSend(a1, "delegate");
  v4 = (LAUIAnimationDelegate *)objc_claimAutoreleasedReturnValue();
  if (v5 && !v4)
  {
    v4 = objc_alloc_init(LAUIAnimationDelegate);
    objc_msgSend(a1, "setDelegate:", v4);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[LAUIAnimationDelegate setDidStopHandler:](v4, "setDidStopHandler:", v5);
  }
  else if (v5)
  {
    v5[2](v5, 0);
  }

}

@end
