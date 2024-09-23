@implementation HKCDADocumentSample(HKDataMetadataViewController)

- (HKCDADocumentShareItemSource)dataForSharingWithHealthStore:()HKDataMetadataViewController
{
  id v4;
  HKCDADocumentShareItemSource *v5;

  v4 = a3;
  v5 = -[HKCDADocumentShareItemSource initWithDocumentSample:healthStore:]([HKCDADocumentShareItemSource alloc], "initWithDocumentSample:healthStore:", a1, v4);

  return v5;
}

@end
