@implementation ATXModeServerRequestHandler

- (void)modeDidChange:(unint64_t)a3
{
  (*((void (**)(void))self->_modeDidChange + 2))();
}

- (id)modeDidChange
{
  return self->_modeDidChange;
}

- (void)setModeDidChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modeDidChange, 0);
}

@end
