@implementation SKKeyedUnarchiver

- (NSArray)searchPaths
{
  return self->searchPaths;
}

- (void)setSearchPaths:(id)a3
{
  objc_storeStrong((id *)&self->searchPaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->searchPaths, 0);
}

@end
