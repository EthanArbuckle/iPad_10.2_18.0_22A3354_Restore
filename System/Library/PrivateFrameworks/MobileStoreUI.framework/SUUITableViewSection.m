@implementation SUUITableViewSection

- (id)footerViewForTableView:(id)a3
{
  return 0;
}

- (id)headerViewForTableView:(id)a3
{
  return 0;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  return 0.0;
}

- (int64_t)numberOfRowsInSection
{
  return 0;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  return 0;
}

- (SUUITableViewSectionDelegate)delegate
{
  return (SUUITableViewSectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hidesHeaderView
{
  return self->_hidesHeaderView;
}

- (void)setHidesHeaderView:(BOOL)a3
{
  self->_hidesHeaderView = a3;
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
