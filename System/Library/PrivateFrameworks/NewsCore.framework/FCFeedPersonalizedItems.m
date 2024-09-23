@implementation FCFeedPersonalizedItems

- (FCMapTable)scoreProfiles
{
  return self->_scoreProfiles;
}

- (void)setSortedItems:(id)a3
{
  objc_storeStrong((id *)&self->_sortedItems, a3);
}

- (void)setScoreProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_scoreProfiles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreProfiles, 0);
  objc_storeStrong((id *)&self->_sortedItems, 0);
}

- (NSArray)sortedItems
{
  return self->_sortedItems;
}

@end
