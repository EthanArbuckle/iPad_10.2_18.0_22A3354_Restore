@implementation GKAvatarImageBrush

- (id)renderedImageIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[GKAvatarImageBrush dimension](self, "dimension"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)dimension
{
  return self->_dimension;
}

- (void)setDimension:(int64_t)a3
{
  self->_dimension = a3;
}

@end
