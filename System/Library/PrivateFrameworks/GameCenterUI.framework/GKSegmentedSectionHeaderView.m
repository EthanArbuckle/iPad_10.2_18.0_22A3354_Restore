@implementation GKSegmentedSectionHeaderView

- (void)setTitles:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v10 = a3;
  -[GKSegmentedSelectorView segmentedControl](self, "segmentedControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSegments");
  if (v5 == objc_msgSend(v10, "count"))
  {
    v11 = MEMORY[0x1E0C809B0];
    v6 = &unk_1E59C79C0;
    v7 = __42__GKSegmentedSectionHeaderView_setTitles___block_invoke_2;
    v8 = &v11;
  }
  else
  {
    objc_msgSend(v4, "removeAllSegments");
    v12 = MEMORY[0x1E0C809B0];
    v6 = &unk_1E59C5930;
    v7 = __42__GKSegmentedSectionHeaderView_setTitles___block_invoke;
    v8 = &v12;
  }
  v8[1] = 3221225472;
  v8[2] = (uint64_t)v7;
  v8[3] = (uint64_t)v6;
  v8[4] = (uint64_t)v4;
  v9 = v4;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __42__GKSegmentedSectionHeaderView_setTitles___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertSegmentWithTitle:atIndex:animated:", a2, a3, 0);
}

uint64_t __42__GKSegmentedSectionHeaderView_setTitles___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTitle:forSegmentAtIndex:", a2, a3);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKSegmentedSectionHeaderView;
  v4 = a3;
  -[GKSegmentedSelectorView applyLayoutAttributes:](&v6, sel_applyLayoutAttributes_, v4);
  objc_msgSend(v4, "indexPath", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKSegmentedSectionHeaderView setSectionIndex:](self, "setSectionIndex:", objc_msgSend(v5, "section"));
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKSegmentedSectionHeaderView;
  -[GKSegmentedSelectorView prepareForReuse](&v4, sel_prepareForReuse);
  self->_sectionIndex = -1;
  -[GKSegmentedSelectorView segmentedControl](self, "segmentedControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllSegments");

  -[GKSegmentedSelectorView setTarget:](self, "setTarget:", 0);
}

- (unint64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(unint64_t)a3
{
  self->_sectionIndex = a3;
}

@end
