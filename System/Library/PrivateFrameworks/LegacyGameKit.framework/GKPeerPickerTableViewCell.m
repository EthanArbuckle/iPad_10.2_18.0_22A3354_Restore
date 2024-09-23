@implementation GKPeerPickerTableViewCell

+ (double)separatorHeight
{
  return 0.0;
}

- (GKPeerPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKPeerPickerTableViewCell;
  return -[GKPeerPickerTableViewCell initWithStyle:reuseIdentifier:](&v5, sel_initWithStyle_reuseIdentifier_, a3, a4);
}

- (BOOL)topSeparator
{
  return self->_topSeparator;
}

@end
