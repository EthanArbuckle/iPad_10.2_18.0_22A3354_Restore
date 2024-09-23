@implementation NTKCFaceDetailActionSectionController

- (void)_commonInit
{
  NTKCFaceDetailActionCell *v3;
  NTKCFaceDetailActionCell *v4;

  v3 = -[NTKCFaceDetailActionCell initWithAction:]([NTKCFaceDetailActionCell alloc], "initWithAction:", 0);
  -[NTKCFaceDetailActionSectionController setSelectCell:](self, "setSelectCell:", v3);

  v4 = -[NTKCFaceDetailActionCell initWithAction:]([NTKCFaceDetailActionCell alloc], "initWithAction:", 1);
  -[NTKCFaceDetailActionSectionController setDeleteCell:](self, "setDeleteCell:", v4);

}

- (int64_t)numberOfRows
{
  return 4;
}

- (double)heightForRow:(int64_t)a3
{
  __objc2_class *v3;
  double result;

  switch(a3)
  {
    case 0:
      +[NTKCFaceDetailSpacerCell actionExtraRowHeight](NTKCFaceDetailSpacerCell, "actionExtraRowHeight");
      break;
    case 1:
    case 3:
      v3 = NTKCFaceDetailActionCell;
      goto LABEL_3;
    case 2:
      v3 = NTKCFaceDetailSpacerCell;
LABEL_3:
      -[__objc2_class rowHeight](v3, "rowHeight");
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (id)cellForRow:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 3)
  {
    v3 = 88;
    return *(id *)((char *)&self->super.super.isa + v3);
  }
  if (a3 == 1)
  {
    v3 = 80;
    return *(id *)((char *)&self->super.super.isa + v3);
  }
  -[NTKCFaceDetailActionSectionController _spacerCell](self, "_spacerCell");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_canSelectRow:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (void)didSelectRow:(int64_t)a3
{
  int64_t v4;
  id v5;

  v4 = -[NTKCFaceDetailActionSectionController _actionForRow:](self, "_actionForRow:", a3);
  if (v4 == 1)
  {
    -[NTKCFaceDetailActionSectionController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionSectionDidDelete:", self);
  }
  else
  {
    if (v4)
      return;
    -[NTKCFaceDetailActionSectionController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionSectionDidSelect:", self);
  }

}

- (id)_spacerCell
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

- (int64_t)_actionForRow:(int64_t)a3
{
  int64_t v3;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 3)
    v3 = 1;
  if (a3 == 1)
    return 0;
  else
    return v3;
}

- (NTKCFaceDetailActionSectionDelegate)delegate
{
  return (NTKCFaceDetailActionSectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NTKCFaceDetailActionCell)selectCell
{
  return self->_selectCell;
}

- (void)setSelectCell:(id)a3
{
  objc_storeStrong((id *)&self->_selectCell, a3);
}

- (NTKCFaceDetailActionCell)deleteCell
{
  return self->_deleteCell;
}

- (void)setDeleteCell:(id)a3
{
  objc_storeStrong((id *)&self->_deleteCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteCell, 0);
  objc_storeStrong((id *)&self->_selectCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
