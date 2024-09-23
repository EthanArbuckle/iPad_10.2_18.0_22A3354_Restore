@implementation BPSBadgedTableCell

+ (id)reuseIdentifierForClassAndType:(int64_t)a3
{
  return CFSTR("BPSBadgedTableCell");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeImageView, 0);
}

@end
