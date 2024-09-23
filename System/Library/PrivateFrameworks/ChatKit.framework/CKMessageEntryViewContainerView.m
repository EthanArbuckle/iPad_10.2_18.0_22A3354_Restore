@implementation CKMessageEntryViewContainerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CKMessageEntryViewContainerView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKMessageEntryViewContainerView;
  -[CKMessageEntryViewContainerView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CKMessageEntryViewContainerView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }
  return v5;
}

- (void)layoutSubviews
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryViewContainerView;
  -[CKMessageEntryViewContainerView layoutSubviews](&v4, sel_layoutSubviews);
  WeakRetained = objc_loadWeakRetained((id *)&self->_entryViewContainerViewDelegate);
  objc_msgSend(WeakRetained, "entryViewContainerViewDidLayoutSubviews:", self);

}

- (CKMessageEntryViewContainerViewDelegate)entryViewContainerViewDelegate
{
  return (CKMessageEntryViewContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_entryViewContainerViewDelegate);
}

- (void)setEntryViewContainerViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_entryViewContainerViewDelegate, a3);
}

- (NSLayoutConstraint)entryViewStuckToChatControllerBottomLayoutConstraint
{
  return self->_entryViewStuckToChatControllerBottomLayoutConstraint;
}

- (void)setEntryViewStuckToChatControllerBottomLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_entryViewStuckToChatControllerBottomLayoutConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryViewStuckToChatControllerBottomLayoutConstraint, 0);
  objc_destroyWeak((id *)&self->_entryViewContainerViewDelegate);
}

@end
