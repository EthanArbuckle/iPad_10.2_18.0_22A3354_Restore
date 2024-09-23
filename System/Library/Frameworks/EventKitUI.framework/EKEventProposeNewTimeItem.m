@implementation EKEventProposeNewTimeItem

- (EKEventProposeNewTimeItem)initWithModel:(id)a3
{
  id v5;
  EKEventProposeNewTimeItem *v6;
  EKEventProposeNewTimeItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKEventProposeNewTimeItem;
  v6 = -[EKEventProposeNewTimeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_model, a3);

  return v7;
}

- (void)reset
{
  UITableViewCell *cell;

  cell = self->_cell;
  self->_cell = 0;

}

+ (BOOL)eventShowsProposeTime:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "allowsProposedTimeModifications"))
  {
    if ((objc_msgSend(v3, "serverSupportedProposeNewTime") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v3, "organizer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v3, "organizer");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = +[EKUIEmailCompositionManager canShowViewControllerForEvent:withParticipantRecipients:](EKUIEmailCompositionManager, "canShowViewControllerForEvent:withParticipantRecipients:", v3, v7);

      }
      else
      {
        v4 = 0;
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  return +[EKEventProposeNewTimeItem eventShowsProposeTime:](EKEventProposeNewTimeItem, "eventShowsProposeTime:", self->super._event, a4);
}

- (void)setCellPosition:(int)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventProposeNewTimeItem;
  -[EKEventDetailItem setCellPosition:](&v4, sel_setCellPosition_, *(_QWORD *)&a3);
  self->_cellNeedsUpdate = 1;
}

- (void)_updateCellIfNeededForWidth:(double)a3
{
  if (self->_cellNeedsUpdate)
  {
    -[UITableViewCell update](self->_cell, "update");
    -[UITableViewCell layoutForWidth:position:](self->_cell, "layoutForWidth:position:", -[EKEventDetailItem cellPosition](self, "cellPosition"), a3);
    self->_cellNeedsUpdate = 0;
  }
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  UITableViewCell *cell;
  EKEventDetailProposeNewTimeCell *v5;
  UITableViewCell *v6;
  double v7;

  cell = self->_cell;
  if (!cell)
  {
    v5 = -[EKEventDetailProposeNewTimeCell initWithEvent:editable:]([EKEventDetailProposeNewTimeCell alloc], "initWithEvent:editable:", self->super._event, 0);
    v6 = self->_cell;
    self->_cell = &v5->super.super.super;

    self->_cellNeedsUpdate = 1;
    -[UITableViewCell frame](self->_cell, "frame");
    -[EKEventProposeNewTimeItem _updateCellIfNeededForWidth:](self, "_updateCellIfNeededForWidth:", v7);
    cell = self->_cell;
  }
  return cell;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  return -[EKEventProposeNewTimeViewController initWithEvent:model:]([EKEventProposeNewTimeViewController alloc], "initWithEvent:model:", self->super._event, self->_model);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
