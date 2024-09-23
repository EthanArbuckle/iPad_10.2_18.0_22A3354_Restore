@implementation MPUMutableContentItemIdentifierCollection

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MPUContentItemIdentifierCollection _copyWithZone:class:](self, "_copyWithZone:class:", a3, objc_opt_class());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MPUContentItemIdentifierCollection _copyWithZone:class:](self, "_copyWithZone:class:", a3, objc_opt_class());
}

- (void)setItemType:(unint64_t)a3
{
  self->super._itemType = a3;
}

@end
