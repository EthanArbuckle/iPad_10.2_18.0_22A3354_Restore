@implementation CNUIUserActionDisambiguationViewDataSource

- (id)contactActionsView:(id)a3 imageForActionCategory:(id)a4
{
  return +[_CNUIUserActionImageProvider imageForActionType:imageStyle:](_CNUIUserActionImageProvider, "imageForActionType:imageStyle:", a4, 0);
}

@end
