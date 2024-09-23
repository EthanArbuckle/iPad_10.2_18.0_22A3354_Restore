@implementation NUISizeCache

- (id)initForAsynchronousAccess:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUISizeCache;
  result = -[NUISizeCache init](&v5, sel_init);
  if (result)
    *((_BYTE *)result + 32) = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_threadSafe)
  {
    objc_sync_enter(self);
    self->_sizeCache.__end_ = self->_sizeCache.__begin_;
    objc_sync_exit(self);
  }
  else
  {
    self->_sizeCache.__end_ = self->_sizeCache.__begin_;
  }
  v3.receiver = self;
  v3.super_class = (Class)NUISizeCache;
  -[NUISizeCache dealloc](&v3, sel_dealloc);
}

- (BOOL)getSize:(CGSize *)a3 forTargetSize:(CGSize)a4 isSizeDependentOnPerpendicularAxis:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  char size;
  CGSize v12;

  height = a4.height;
  width = a4.width;
  if (!self->_threadSafe)
    return nui_size_cache::find_size(&self->_sizeCache, a4, a5, a3);
  objc_sync_enter(self);
  v12.width = width;
  v12.height = height;
  size = nui_size_cache::find_size(&self->_sizeCache, v12, a5, a3);
  objc_sync_exit(self);
  return size;
}

- (void)insertSize:(CGSize)a3 forTargetSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat v6;
  CGFloat v7;
  CGSize v9;
  CGSize v11;
  CGSize v12;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  if (self->_threadSafe)
  {
    objc_sync_enter(self);
    v9.width = width;
    v9.height = height;
    v11.width = v7;
    v11.height = v6;
    nui_size_cache::insert_size(&self->_sizeCache, v9, v11);
    objc_sync_exit(self);
  }
  else
  {
    v12.width = v7;
    v12.height = v6;
    nui_size_cache::insert_size(&self->_sizeCache, a4, v12);
  }
}

- (void)invalidateCache
{
  if (self->_threadSafe)
  {
    objc_sync_enter(self);
    self->_sizeCache.__end_ = self->_sizeCache.__begin_;
    objc_sync_exit(self);
  }
  else
  {
    self->_sizeCache.__end_ = self->_sizeCache.__begin_;
  }
}

- (void).cxx_destruct
{
  void *begin;

  begin = self->_sizeCache.__begin_;
  if (begin)
  {
    self->_sizeCache.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
