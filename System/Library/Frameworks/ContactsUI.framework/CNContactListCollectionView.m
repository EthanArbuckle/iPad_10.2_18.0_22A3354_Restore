@implementation CNContactListCollectionView

- (void)setContactCount:(int64_t)a3
{
  CNContactListCountFooterView *contactCountView;

  if (self->_contactCount != a3)
  {
    self->_contactCount = a3;
    contactCountView = self->_contactCountView;
    if (contactCountView)
      -[CNContactListCountFooterView setContactCount:](contactCountView, "setContactCount:");
  }
}

- (int64_t)contactCount
{
  return self->_contactCount;
}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactListCollectionView;
  -[CNContactListCollectionView selectItemAtIndexPath:animated:scrollPosition:](&v6, sel_selectItemAtIndexPath_animated_scrollPosition_, a3, a4, a5);
  -[CNContactListCollectionView updateSelectedContactCount](self, "updateSelectedContactCount");
}

- (void)updateSelectedContactCount
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;

  if (!-[CNContactListCollectionView isEditing](self, "isEditing"))
    goto LABEL_5;
  if (!-[CNContactListCollectionView allowsMultipleSelectionDuringEditing](self, "allowsMultipleSelectionDuringEditing"))goto LABEL_5;
  -[CNContactListCollectionView contactListCollectionViewDelegate](self, "contactListCollectionViewDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_5;
  v4 = (void *)v3;
  -[CNContactListCollectionView contactListCollectionViewDelegate](self, "contactListCollectionViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasNoContacts");

  if ((v6 & 1) == 0)
  {
    -[CNContactListCollectionView indexPathsForSelectedItems](self, "indexPathsForSelectedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "count");

  }
  else
  {
LABEL_5:
    v7 = -1;
  }
  -[CNContactListCollectionView setSelectedCount:](self, "setSelectedCount:", v7);
}

- (void)setSelectedCount:(int64_t)a3
{
  CNContactListCountFooterView *contactCountView;

  if (self->_selectedCount != a3)
  {
    self->_selectedCount = a3;
    contactCountView = self->_contactCountView;
    if (contactCountView)
      -[CNContactListCountFooterView setSelectedCount:](contactCountView, "setSelectedCount:");
  }
}

- (void)setCountViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_countViewDelegate, a3);
}

- (void)setContactListCollectionViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contactListCollectionViewDelegate, a3);
}

- (int64_t)duplicateCount
{
  return self->_duplicateCount;
}

- (CNContactListCollectionView)init
{
  CNContactListCollectionView *v2;
  CNContactListCollectionView *v3;
  CNContactListCollectionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactListCollectionView;
  v2 = -[CNContactListCollectionView init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeWeak((id *)&v2->_countViewDelegate, 0);
    v4 = v3;
  }

  return v3;
}

- (unint64_t)globalIndexForItemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  v6 = objc_msgSend(v4, "section");
  if (v6 >= -[CNContactListCollectionView numberOfSections](self, "numberOfSections")
    || v5 >= -[CNContactListCollectionView numberOfItemsInSection:](self, "numberOfItemsInSection:", v6))
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if (v6 < 1)
    {
      v8 = 0;
    }
    else
    {
      v7 = 0;
      v8 = 0;
      do
        v8 += -[CNContactListCollectionView numberOfItemsInSection:](self, "numberOfItemsInSection:", v7++);
      while (v6 != v7);
    }
    v9 = v8 + v5;
  }

  return v9;
}

- (void)setContactCountView:(id)a3
{
  CNContactListCountFooterView **p_contactCountView;
  id v6;

  p_contactCountView = &self->_contactCountView;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", *p_contactCountView) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contactCountView, a3);
    -[CNContactListCountFooterView setContactCount:](*p_contactCountView, "setContactCount:", -[CNContactListCollectionView contactCount](self, "contactCount"));
    -[CNContactListCollectionView updateSelectedContactCount](self, "updateSelectedContactCount");
    -[CNContactListCountFooterView setSelectedCount:](*p_contactCountView, "setSelectedCount:", -[CNContactListCollectionView selectedCount](self, "selectedCount"));
    -[CNContactListCountFooterView setDuplicateCount:](*p_contactCountView, "setDuplicateCount:", -[CNContactListCollectionView duplicateCount](self, "duplicateCount"));
  }

}

- (void)setDuplicateCount:(int64_t)a3
{
  CNContactListCountFooterView *contactCountView;

  if (self->_duplicateCount != a3)
  {
    self->_duplicateCount = a3;
    contactCountView = self->_contactCountView;
    if (contactCountView)
      -[CNContactListCountFooterView setDuplicateCount:](contactCountView, "setDuplicateCount:");
  }
}

- (void)deselectItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactListCollectionView;
  -[CNContactListCollectionView deselectItemAtIndexPath:animated:](&v5, sel_deselectItemAtIndexPath_animated_, a3, a4);
  -[CNContactListCollectionView updateSelectedContactCount](self, "updateSelectedContactCount");
}

- (int64_t)selectedCount
{
  return self->_selectedCount;
}

- (CNContactListCountViewDelegate)countViewDelegate
{
  return (CNContactListCountViewDelegate *)objc_loadWeakRetained((id *)&self->_countViewDelegate);
}

- (CNContactListCollectionViewDelegate)contactListCollectionViewDelegate
{
  return (CNContactListCollectionViewDelegate *)objc_loadWeakRetained((id *)&self->_contactListCollectionViewDelegate);
}

- (CNContactListCountFooterView)contactCountView
{
  return self->_contactCountView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactCountView, 0);
  objc_destroyWeak((id *)&self->_contactListCollectionViewDelegate);
  objc_destroyWeak((id *)&self->_countViewDelegate);
}

@end
