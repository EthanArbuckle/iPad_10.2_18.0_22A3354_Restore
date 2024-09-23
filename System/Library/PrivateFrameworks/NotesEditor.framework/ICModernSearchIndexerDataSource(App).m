@implementation ICModernSearchIndexerDataSource(App)

- (id)mainThreadContext
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "managedObjectContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
