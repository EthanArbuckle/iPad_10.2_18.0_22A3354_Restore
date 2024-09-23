@implementation SFCollaborationUnifiedBarItem

- (SFCollaborationUnifiedBarItem)init
{
  SFCollaborationUnifiedBarItem *v2;
  SFCollaborationUnifiedBarItemView *v3;
  SFCollaborationUnifiedBarItemView *view;
  SFCollaborationUnifiedBarItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFCollaborationUnifiedBarItem;
  v2 = -[SFCollaborationUnifiedBarItem init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SFCollaborationUnifiedBarItemView);
    view = v2->_view;
    v2->_view = v3;

    v5 = v2;
  }

  return v2;
}

- (_SWCollaborationButtonView)collaborationButton
{
  return -[SFCollaborationUnifiedBarItemView collaborationButton](self->_view, "collaborationButton");
}

- (void)setCollaborationButton:(id)a3
{
  -[SFCollaborationUnifiedBarItemView setCollaborationButton:](self->_view, "setCollaborationButton:", a3);
}

- (id)view
{
  return self->_view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
