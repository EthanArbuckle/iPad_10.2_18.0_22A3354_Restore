@implementation _UIDataSourceSnapshot

- (_UIDataSourceSnapshot)initWithDataSourceSnapshotter:(id)a3
{
  id v4;
  _UIDataSourceSnapshot *v5;
  uint64_t v6;
  _UIDataSourceSnapshotter *snapshotter;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDataSourceSnapshot;
  v5 = -[_UIDataSourceSnapshot init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    snapshotter = v5->_snapshotter;
    v5->_snapshotter = (_UIDataSourceSnapshotter *)v6;

  }
  return v5;
}

- (int64_t)numberOfSections
{
  return -[_UIDataSourceSnapshotter numberOfSections](self->_snapshotter, "numberOfSections");
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return -[_UIDataSourceSnapshotter numberOfItemsInSection:](self->_snapshotter, "numberOfItemsInSection:", a3);
}

- (int64_t)globalIndexForIndexPath:(id)a3
{
  return -[_UIDataSourceSnapshotter globalIndexForIndexPath:](self->_snapshotter, "globalIndexForIndexPath:", a3);
}

- (id)indexPathForGlobalIndex:(int64_t)a3
{
  return -[_UIDataSourceSnapshotter indexPathForGlobalIndex:](self->_snapshotter, "indexPathForGlobalIndex:", a3);
}

- (int64_t)numberOfItems
{
  return -[_UIDataSourceSnapshotter numberOfItems](self->_snapshotter, "numberOfItems");
}

- (_NSRange)rangeForSection:(int64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[_UIDataSourceSnapshotter rangeForSection:](self->_snapshotter, "rangeForSection:", a3);
  result.length = v4;
  result.location = v3;
  return result;
}

- (int64_t)sectionForGlobalIndex:(int64_t)a3
{
  return -[_UIDataSourceSnapshotter sectionForGlobalIndex:](self->_snapshotter, "sectionForGlobalIndex:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotter, 0);
}

@end
