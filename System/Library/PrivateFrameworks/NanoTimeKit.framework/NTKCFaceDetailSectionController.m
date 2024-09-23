@implementation NTKCFaceDetailSectionController

+ (void)registerForTableView:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a3;
  v4 = objc_opt_class();
  +[NTKCFaceDetailSpacerCell reuseIdentifier](NTKCFaceDetailSpacerCell, "reuseIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

}

- (NTKCFaceDetailSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NTKCFaceDetailSectionController *v10;
  NTKCFaceDetailSectionController *v11;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKCFaceDetailSectionController;
  v10 = -[NTKCFaceDetailSectionController init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[NTKCFaceDetailSectionController setTableViewController:](v10, "setTableViewController:", v8);
    -[NTKCFaceDetailSectionController setFace:](v11, "setFace:", v9);
    -[NTKCFaceDetailSectionController setInGallery:](v11, "setInGallery:", v5);
    -[NTKCFaceDetailSectionController _commonInit](v11, "_commonInit");
  }

  return v11;
}

- (int64_t)numberOfRows
{
  NSMutableArray *rows;
  uint64_t v4;

  rows = self->_rows;
  if (rows)
    v4 = -[NSMutableArray count](rows, "count");
  else
    v4 = self->_cell != 0;
  return v4 + self->_hasSpacerRow;
}

- (double)heightForRow:(int64_t)a3
{
  NSMutableArray *rows;
  void *v6;
  double v7;
  double v8;
  double result;
  NTKCDetailTableViewCell *cell;

  rows = self->_rows;
  if (rows && -[NSMutableArray count](rows, "count") > (unint64_t)a3)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rowHeight");
    v8 = v7;

    return v8;
  }
  else if (a3 || (cell = self->_cell) == 0)
  {
    if (self->_hasSpacerRow && -[NTKCFaceDetailSectionController numberOfRows](self, "numberOfRows") - 1 == a3)
      -[NTKCFaceDetailSectionController _heightForSpacerRow](self, "_heightForSpacerRow");
    else
      return 0.0;
  }
  else
  {
    -[NTKCDetailTableViewCell rowHeight](cell, "rowHeight");
  }
  return result;
}

- (id)cellForRow:(int64_t)a3
{
  NSMutableArray *rows;
  NTKCDetailTableViewCell *v6;
  NTKCDetailTableViewCell *cell;

  rows = self->_rows;
  if (rows && -[NSMutableArray count](rows, "count") > (unint64_t)a3)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", a3);
    v6 = (NTKCDetailTableViewCell *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 || (cell = self->_cell) == 0)
  {
    if (self->_hasSpacerRow && -[NTKCFaceDetailSectionController numberOfRows](self, "numberOfRows") - 1 == a3)
    {
      -[NTKCFaceDetailSectionController _spacerRow](self, "_spacerRow");
      v6 = (NTKCDetailTableViewCell *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = cell;
  }
  return v6;
}

- (double)_heightForSpacerRow
{
  double result;

  +[NTKCFaceDetailSpacerCell rowHeight](NTKCFaceDetailSpacerCell, "rowHeight");
  return result;
}

- (id)_spacerRow
{
  void *v2;
  void *v3;
  void *v4;

  -[NTKCFaceDetailSectionController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKCFaceDetailSpacerCell reuseIdentifier](NTKCFaceDetailSpacerCell, "reuseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dequeueReusableCellWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)heightForHeaderView
{
  void *v3;
  uint64_t v4;
  double result;
  CGRect v6;

  if (self->_headerView
    || (-[NTKCFaceDetailSectionController titleForHeader](self, "titleForHeader"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "length"),
        v3,
        v4))
  {
    +[NTKCFaceDetailSectionHeaderView headerHeight](NTKCFaceDetailSectionHeaderView, "headerHeight");
  }
  else
  {
    -[NTKCFaceDetailSectionHeaderView bounds](self->_headerView, "bounds");
    return CGRectGetHeight(v6);
  }
  return result;
}

- (NTKCFaceDetailSectionHeaderView)headerView
{
  NTKCFaceDetailSectionHeaderView *headerView;
  NTKCFaceDetailSectionHeaderView *v3;
  void *v5;

  headerView = self->_headerView;
  if (!headerView)
  {
    -[NTKCFaceDetailSectionController titleForHeader](self, "titleForHeader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v3 = -[NTKCFaceDetailSectionController _newSectionHeader](self, "_newSectionHeader");
      -[NTKCFaceDetailSectionHeaderView setTitle:](v3, "setTitle:", v5);

      return v3;
    }

    headerView = self->_headerView;
  }
  v3 = headerView;
  return v3;
}

- (BOOL)canSelectRow:(int64_t)a3
{
  NSMutableArray *rows;

  rows = self->_rows;
  if (!rows)
    goto LABEL_10;
  if (-[NSMutableArray count](rows, "count") <= (unint64_t)a3)
    return 0;
  if (!self->_rows)
  {
LABEL_10:
    if (a3 && self->_cell)
      return 0;
  }
  return -[NTKCFaceDetailSectionController _canSelectRow:](self, "_canSelectRow:", a3);
}

- (BOOL)_canSelectRow:(int64_t)a3
{
  return 0;
}

- (id)_newSectionHeader
{
  NTKCFaceDetailSectionHeaderView *v3;
  void *v4;

  v3 = -[NTKCFaceDetailSectionHeaderView initWithReuseIdentifier:]([NTKCFaceDetailSectionHeaderView alloc], "initWithReuseIdentifier:", 0);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[NTKCFaceDetailSectionController _groupName](self, "_groupName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailSectionHeaderView setGroupName:](v3, "setGroupName:", v4);

  }
  return v3;
}

- (UITableView)tableView
{
  void *v2;
  void *v3;

  -[NTKCFaceDetailSectionController tableViewController](self, "tableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ntk_tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITableView *)v3;
}

- (id)_groupName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[NTKCFaceDetailSectionController tableViewController](self, "tableViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_backdropViewLayerGroupName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (int64_t)section
{
  return self->_section;
}

- (void)setSection:(int64_t)a3
{
  self->_section = a3;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (NSString)titleForHeader
{
  return self->_titleForHeader;
}

- (NTKFace)face
{
  return (NTKFace *)objc_loadWeakRetained((id *)&self->_face);
}

- (void)setFace:(id)a3
{
  objc_storeWeak((id *)&self->_face, a3);
}

- (BOOL)inGallery
{
  return self->_inGallery;
}

- (void)setInGallery:(BOOL)a3
{
  self->_inGallery = a3;
}

- (BOOL)hasSpacerRow
{
  return self->_hasSpacerRow;
}

- (void)setHasSpacerRow:(BOOL)a3
{
  self->_hasSpacerRow = a3;
}

- (NTKCTableViewProviding)tableViewController
{
  return (NTKCTableViewProviding *)objc_loadWeakRetained((id *)&self->_tableViewController);
}

- (void)setTableViewController:(id)a3
{
  objc_storeWeak((id *)&self->_tableViewController, a3);
}

- (NTKCDetailTableViewCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
  objc_storeStrong((id *)&self->_cell, a3);
}

- (NSMutableArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
  objc_storeStrong((id *)&self->_rows, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_destroyWeak((id *)&self->_tableViewController);
  objc_destroyWeak((id *)&self->_face);
  objc_storeStrong((id *)&self->_titleForHeader, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
