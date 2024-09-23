@implementation MCNearbyPeerTableViewCell

- (MCNearbyPeerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MCNearbyPeerTableViewCell *result;
  objc_super v7;

  result = (MCNearbyPeerTableViewCell *)(id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "loadNibNamed:owner:options:", CFSTR("MCNearbyPeerTableViewCell"), self, 0), "objectAtIndex:", 0);
  if (!result)
  {
    v7.receiver = 0;
    v7.super_class = (Class)MCNearbyPeerTableViewCell;
    return -[MCNearbyPeerTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  }
  return result;
}

@end
