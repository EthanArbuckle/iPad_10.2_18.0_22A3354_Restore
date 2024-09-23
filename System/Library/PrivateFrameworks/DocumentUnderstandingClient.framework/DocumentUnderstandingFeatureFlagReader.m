@implementation DocumentUnderstandingFeatureFlagReader

+ (BOOL)isBackboneModelEnabled
{
  return 0;
}

+ (BOOL)isTopicClassificationModelEnabled
{
  return 0;
}

+ (BOOL)isCategoryClassificationModelEnabled
{
  return 0;
}

+ (BOOL)isFoundInModelsEnabled
{
  if (one-time initialization token for isFoundInModelsEnabled != -1)
    swift_once();
  return static DocumentUnderstandingFeatureFlagReader.isFoundInModelsEnabled;
}

+ (BOOL)isIndexNonfileDocumentsEnabled
{
  return 0;
}

+ (BOOL)isSearchAndOrganizationDocumentIngestEnabled
{
  return 0;
}

+ (BOOL)isAutonamingFromMessagesEnabled
{
  return 0;
}

- (_TtC27DocumentUnderstandingClient38DocumentUnderstandingFeatureFlagReader)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DocumentUnderstandingFeatureFlagReader();
  return -[DocumentUnderstandingFeatureFlagReader init](&v3, sel_init);
}

@end
