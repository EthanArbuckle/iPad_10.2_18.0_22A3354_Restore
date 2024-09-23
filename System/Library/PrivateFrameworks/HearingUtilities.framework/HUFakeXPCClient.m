@implementation HUFakeXPCClient

- (BOOL)wantsUpdatesForIdentifier:(unint64_t)a3
{
  return 1;
}

- (void)registerMessageBlock:(id)a3
{
  void *v4;
  id updateBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  updateBlock = self->_updateBlock;
  self->_updateBlock = v4;

}

- (BOOL)sendMessage:(id)a3 errorBlock:(id)a4
{
  void (**updateBlock)(id, void *);
  void *v5;

  updateBlock = (void (**)(id, void *))self->_updateBlock;
  if (updateBlock)
  {
    objc_msgSend(a3, "payload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    updateBlock[2](updateBlock, v5);

  }
  return updateBlock != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
}

@end
