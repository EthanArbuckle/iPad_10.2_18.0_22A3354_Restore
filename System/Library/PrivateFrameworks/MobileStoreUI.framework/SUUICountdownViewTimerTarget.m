@implementation SUUICountdownViewTimerTarget

- (void)action
{
  void (**v2)(void);

  -[SUUICountdownViewTimerTarget actionBlock](self, "actionBlock");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
}

@end
