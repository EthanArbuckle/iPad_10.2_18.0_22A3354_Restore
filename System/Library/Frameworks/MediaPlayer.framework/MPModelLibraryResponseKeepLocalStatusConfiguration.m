@implementation MPModelLibraryResponseKeepLocalStatusConfiguration

- (id)downloadablePlaylistItemEntityQueryBlock
{
  return self->_downloadablePlaylistItemEntityQueryBlock;
}

- (void)setDownloadablePlaylistItemEntityQueryBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (shared_ptr<mlcore::EntityQuery>)downloadableItemsQuery
{
  EntityQuery **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<mlcore::EntityQuery> result;

  cntrl = self->_downloadableItemsQuery.__cntrl_;
  *v2 = self->_downloadableItemsQuery.__ptr_;
  v2[1] = (EntityQuery *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (EntityQuery *)self;
  return result;
}

- (void)setDownloadableItemsQuery:(shared_ptr<mlcore::EntityQuery>)a3
{
  std::shared_ptr<mlcore::QueryResult>::operator=[abi:ne180100](&self->_downloadableItemsQuery.__ptr_, *(_QWORD *)a3.__ptr_, *((_QWORD *)a3.__ptr_ + 1));
}

- (void).cxx_destruct
{
  std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&self->_downloadableItemsQuery);
  objc_storeStrong(&self->_downloadablePlaylistItemEntityQueryBlock, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
