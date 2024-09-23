@implementation PHASEPullStreamNode

- (void)setRenderBlock:(id)a3
{
  void *v4;
  id renderBlock;

  if (self->_renderBlock)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("Attempting to change the renderBlock for a PullStreamNode."));
  }
  else
  {
    v4 = _Block_copy(a3);
    renderBlock = self->_renderBlock;
    self->_renderBlock = v4;

  }
}

- (id)renderBlock
{
  return self->_renderBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_renderBlock, 0);
}

@end
