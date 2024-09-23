@implementation CPSBarBackButtonItem

- (CPSBarBackButtonItem)initWithCPBarButton:(id)a3
{
  CPSBarBackButtonItem *v3;
  CPSBarBackButtonItem *v5;
  id location[2];
  CPSBarBackButtonItem *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v7;
  v7 = 0;
  v7 = -[CPSBarButtonItem initWithCPBarButton:type:](v3, "initWithCPBarButton:type:", location[0], 1);
  v5 = v7;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v7, 0);
  return v5;
}

@end
