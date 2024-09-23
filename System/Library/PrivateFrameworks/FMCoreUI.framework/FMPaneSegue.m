@implementation FMPaneSegue

- (void)perform
{
  -[FMPaneSegue performFromEdge:](self, "performFromEdge:", 4);
}

- (void)performFromEdge:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[UIStoryboardSegue sourceViewController](self, "sourceViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIStoryboardSegue destinationViewController](self, "destinationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v7, "parentViewController");
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
      if (!v8)
        goto LABEL_5;
    }
    v9 = v7;
  }
  else
  {
LABEL_5:
    v9 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("No instance of FMSlidingPaneViewController in controller hierarchy of %@"), v5);
  objc_msgSend(v9, "presentPaneViewController:fromEdge:animated:completion:", v6, a3, -[FMPaneSegue disableAnimation](self, "disableAnimation") ^ 1, 0);

}

- (BOOL)disableAnimation
{
  return self->_disableAnimation;
}

- (void)setDisableAnimation:(BOOL)a3
{
  self->_disableAnimation = a3;
}

@end
