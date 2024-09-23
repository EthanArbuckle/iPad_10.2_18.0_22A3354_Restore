@implementation FCFeedTransformationSortBlock

+ (id)transformationWithSortBlock:(id)a3
{
  id v3;
  FCFeedTransformationSortBlock *v4;

  v3 = a3;
  v4 = objc_alloc_init(FCFeedTransformationSortBlock);
  -[FCFeedTransformationSortBlock setSortBlock:](v4, "setSortBlock:", v3);

  return v4;
}

- (id)transformFeedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCFeedTransformationSortBlock sortBlock](self, "sortBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sortBlock
{
  return self->_sortBlock;
}

- (void)setSortBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sortBlock, 0);
}

@end
