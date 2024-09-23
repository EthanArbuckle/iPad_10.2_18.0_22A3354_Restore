@implementation IMDCoreSpotlightMessageSubjectIndexer

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  void *v8;
  id v9;

  v9 = a6;
  objc_msgSend(a3, "objectForKey:", CFSTR("subject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v9, "setTitle:", v8);

}

@end
