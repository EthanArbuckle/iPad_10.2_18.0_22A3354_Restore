@implementation FollowingSearchCoordinator

- (void)tabBarSplitViewDidChangeCollapseStateToCollapseState:(BOOL)a3
{
  void *v3;
  id v4;
  id v5;

  if (self->isPresented[0] == 1)
  {
    v3 = *(void **)self->searchController;
    swift_retain();
    v4 = objc_msgSend(v3, sel_searchBar);
    v5 = objc_msgSend(v4, sel_searchTextField);

    LOBYTE(v4) = objc_msgSend(v5, sel_isEditing);
    sub_1D6D48908((char)v4, 1);
    swift_release();
  }
}

@end
