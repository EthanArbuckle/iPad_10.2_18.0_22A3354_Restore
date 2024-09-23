@implementation NASimpleDiffableItemGroup

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NASimpleDiffableItemGroup diffableItems](self, "diffableItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDiffableItems:", v5);

  -[NASimpleDiffableItemGroup groupIdentifier](self, "groupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupIdentifier:", v6);

  return v4;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)diffableItems
{
  return self->_diffableItems;
}

- (void)setDiffableItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableItems, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end
