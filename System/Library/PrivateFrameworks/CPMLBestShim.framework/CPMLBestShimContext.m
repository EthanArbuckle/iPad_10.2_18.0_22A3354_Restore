@implementation CPMLBestShimContext

- (NSArray)orderedSuggestions
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOrderedSuggestions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->orderedSuggestions, 0);
}

@end
