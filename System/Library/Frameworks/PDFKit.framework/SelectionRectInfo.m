@implementation SelectionRectInfo

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->selection);
}

@end
