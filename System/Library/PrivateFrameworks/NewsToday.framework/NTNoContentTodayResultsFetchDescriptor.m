@implementation NTNoContentTodayResultsFetchDescriptor

- (NTNoContentTodayResultsFetchDescriptor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTNoContentTodayResultsFetchDescriptor;
  return -[NTNoContentTodayResultsFetchDescriptor init](&v3, sel_init);
}

- (NSString)sourceIdentifier
{
  return (NSString *)CFSTR("unknown");
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
  NTNewsTodayResultsFetchDescriptor *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(NTNewsTodayResultsFetchDescriptor);
  -[NTNewsTodayResultsFetchDescriptor placeholderSectionDescriptorsWithContentRequest:](v4, "placeholderSectionDescriptorsWithContentRequest:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
