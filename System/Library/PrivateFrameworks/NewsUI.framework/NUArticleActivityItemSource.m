@implementation NUArticleActivityItemSource

- (NUArticleActivityItemSource)initWithHeadline:(id)a3
{
  id v5;
  NUArticleActivityItemSource *v6;
  NUArticleActivityItemSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUArticleActivityItemSource;
  v6 = -[NUArticleActivityItemSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_headline, a3);

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return 0;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headline, 0);
}

@end
