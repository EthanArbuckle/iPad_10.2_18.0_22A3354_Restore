@implementation EKRecurrenceGridChooserController

- (id)tableViewCell
{
  EKUIDividedGridViewTableViewCell *tableViewCell;
  EKUIDividedGridViewTableViewCell *v4;
  int64_t v5;
  void *v6;
  void *v7;
  EKUIDividedGridViewTableViewCell *v8;
  void *v9;
  EKUIDividedGridViewTableViewCell *v10;

  tableViewCell = self->_tableViewCell;
  if (!tableViewCell)
  {
    v4 = [EKUIDividedGridViewTableViewCell alloc];
    v5 = -[EKRecurrenceGridChooserController gridViewType](self, "gridViewType");
    -[EKRecurrenceGridChooserController cellLabels](self, "cellLabels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKRecurrenceChooserController backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EKUIDividedGridViewTableViewCell initWithStyle:reuseIdentifier:gridViewType:buttonTitles:cellBackgroundColor:](v4, "initWithStyle:reuseIdentifier:gridViewType:buttonTitles:cellBackgroundColor:", 0, 0, v5, v6, v7);

    -[EKUIDividedGridViewTableViewCell setDrawingEnabled:](v8, "setDrawingEnabled:", 1);
    -[EKUIDividedGridViewTableViewCell setSelectionStyle:](v8, "setSelectionStyle:", 0);
    -[EKUIDividedGridViewTableViewCell gridViewController](v8, "gridViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);

    -[EKUIDividedGridViewTableViewCell setDrawsTopDivider:](v8, "setDrawsTopDivider:", 0);
    v10 = self->_tableViewCell;
    self->_tableViewCell = v8;

    tableViewCell = self->_tableViewCell;
  }
  return tableViewCell;
}

- (id)allCells
{
  void *v2;
  void *v3;
  void *v4;

  -[EKRecurrenceGridChooserController tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gridViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)heightForRow:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  -[EKRecurrenceGridChooserController tableViewCell](self, "tableViewCell", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v5 = v4;

  return v5;
}

- (void)dividedGridViewControllerDidLayout:(id)a3
{
  -[EKRecurrenceGridChooserController prepareForDisplay](self, "prepareForDisplay", a3);
  -[EKRecurrenceGridChooserController refreshCells](self, "refreshCells");
}

- (void)dividedGridViewController:(id)a3 didSelectCell:(id)a4 atIndex:(int64_t)a5
{
  -[EKRecurrenceGridChooserController selectCell:atIndex:](self, "selectCell:atIndex:", a4, a5);
}

- (BOOL)drawBackgroundForRow:(int64_t)a3
{
  return -[EKUIDividedGridViewTableViewCell wantsDrawBackground](self->_tableViewCell, "wantsDrawBackground", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewCell, 0);
}

- (id)cellLabels
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return 0;
}

- (int64_t)gridViewType
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return -1;
}

- (void)prepareForDisplay
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1();
}

- (void)refreshCells
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1();
}

- (void)selectCell:(id)a3 atIndex:(int64_t)a4
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1();
}

@end
