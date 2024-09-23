@implementation EKEventEditableDetailGroup

- (id)itemAtIndex:(unint64_t)a3
{
  return -[EKEventDetailGroup itemAtIndex:subitemIndex:](self, "itemAtIndex:subitemIndex:", a3, 0);
}

@end
