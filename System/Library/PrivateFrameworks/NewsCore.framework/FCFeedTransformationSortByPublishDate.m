@implementation FCFeedTransformationSortByPublishDate

- (id)transformFeedItems:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_67);
}

uint64_t __60__FCFeedTransformationSortByPublishDate_transformFeedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a2;
  v5 = objc_msgSend(a3, "publishDateMilliseconds");
  v6 = objc_msgSend(v4, "publishDateMilliseconds");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

@end
