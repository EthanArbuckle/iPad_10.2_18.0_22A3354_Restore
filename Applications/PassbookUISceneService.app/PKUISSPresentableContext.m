@implementation PKUISSPresentableContext

- (PKUISSPresentableContext)init
{

  return 0;
}

- (void)bannerHandle:(id)a3 didChangeFromState:(id)a4
{
  void *v5;
  id WeakRetained;

  if (self->_effectiveHandle == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v5 = (void *)sub_100006300((uint64_t)self);
    objc_msgSend(WeakRetained, "setBannerState:", v5);

  }
}

- (void)bannerHandleDidInvalidate:(id)a3
{
  PKUISSBannerHandle *currentHandle;
  PKUISSBannerHandle *v5;
  PKUISSBannerHandle *v6;
  id WeakRetained;
  void *v8;
  PKUISSBannerHandle *v9;
  void *v10;
  PKUISSBannerHandle *v11;

  v11 = (PKUISSBannerHandle *)a3;
  -[NSMutableArray removeObjectIdenticalTo:](self->_handles, "removeObjectIdenticalTo:", v11);
  currentHandle = self->_currentHandle;
  if (currentHandle == v11)
  {
    self->_currentHandle = 0;

    if (self->_currentHandle)
      goto LABEL_9;
  }
  else if (currentHandle)
  {
    goto LABEL_9;
  }
  v5 = (PKUISSBannerHandle *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_handles, "firstObject"));
  v6 = self->_currentHandle;
  self->_currentHandle = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v8 = WeakRetained;
  v9 = self->_currentHandle;
  if (v9)
  {
    objc_storeStrong((id *)&self->_effectiveHandle, v9);
    v10 = (void *)sub_100006300((uint64_t)self);
    objc_msgSend(v8, "setBannerState:", v10);

  }
  else
  {
    objc_msgSend(WeakRetained, "setBannerDetached:", 1);
  }

LABEL_9:
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_currentHandle, 0);
  objc_storeStrong((id *)&self->_effectiveHandle, 0);
}

@end
