@implementation NTNewsTodayResultsFetchDescriptor

- (NSString)sourceIdentifier
{
  return (NSString *)CFSTR("news");
}

- (NTNewsTodayResultsFetchDescriptor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTNewsTodayResultsFetchDescriptor;
  return -[NTNewsTodayResultsFetchDescriptor init](&v3, sel_init);
}

- (Class)descriptorsOperationClass
{
  return (Class)objc_opt_class();
}

- (Class)fetchOperationClass
{
  return (Class)objc_opt_class();
}

- (id)placeholderSectionDescriptorsWithContentRequest:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  NTSectionPlaceholderDescriptor *v7;
  NTSectionPlaceholderDescriptor *v8;
  void *v9;
  NTSectionPlaceholderDescriptor *v10;
  NTSectionPlaceholderDescriptor *v11;
  NTSectionPlaceholderDescriptor *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "moduleDescriptorType");
  if (v4 == 1)
  {
    v10 = [NTSectionPlaceholderDescriptor alloc];
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nameColorLight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nameColorDark");
    v7 = (NTSectionPlaceholderDescriptor *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tagID");
    v8 = (NTSectionPlaceholderDescriptor *)objc_claimAutoreleasedReturnValue();
    v11 = -[NTSectionPlaceholderDescriptor initWithName:nameColorLight:nameColorDark:minimumStoriesAllocation:maximumStoriesAllocation:backingTagID:](v10, "initWithName:nameColorLight:nameColorDark:minimumStoriesAllocation:maximumStoriesAllocation:backingTagID:", v5, v6, v7, 0, -1, v8);
    v13 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v4)
    {
      v9 = (void *)MEMORY[0x24BDBD1A8];
      goto LABEL_7;
    }
    __85__NTNewsTodayResultsFetchDescriptor_placeholderSectionDescriptorsWithContentRequest___block_invoke();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __85__NTNewsTodayResultsFetchDescriptor_placeholderSectionDescriptorsWithContentRequest___block_invoke_2();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NTSectionPlaceholderDescriptor initWithName:nameColorLight:nameColorDark:minimumStoriesAllocation:maximumStoriesAllocation:backingTagID:]([NTSectionPlaceholderDescriptor alloc], "initWithName:nameColorLight:nameColorDark:minimumStoriesAllocation:maximumStoriesAllocation:backingTagID:", v5, CFSTR("FF2D54"), CFSTR("FF375F"), 1, 2, 0);
    v14[0] = v7;
    v8 = -[NTSectionPlaceholderDescriptor initWithName:nameColorLight:nameColorDark:minimumStoriesAllocation:maximumStoriesAllocation:backingTagID:]([NTSectionPlaceholderDescriptor alloc], "initWithName:nameColorLight:nameColorDark:minimumStoriesAllocation:maximumStoriesAllocation:backingTagID:", v6, CFSTR("ff8e00"), 0, 1, -1, 0);
    v14[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v9;
}

const __CFString *__85__NTNewsTodayResultsFetchDescriptor_placeholderSectionDescriptorsWithContentRequest___block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BE6CAA0], "sharedAccount");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "dynamicSupportedContentLanguage");

  if (v1)
    return CFSTR("À la une");
  else
    return CFSTR("Top Stories");
}

const __CFString *__85__NTNewsTodayResultsFetchDescriptor_placeholderSectionDescriptorsWithContentRequest___block_invoke_2()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BE6CAA0], "sharedAccount");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "dynamicSupportedContentLanguage");

  if (v1)
    return CFSTR("Populaires");
  else
    return CFSTR("Trending");
}

@end
