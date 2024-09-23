@implementation CKMediaObjectAssetCollection

- (BOOL)isEnriched
{
  return 0;
}

- (BOOL)isEnrichmentComplete
{
  return 0;
}

- (unsigned)px_highlightEnrichmentState
{
  return 0;
}

- (int64_t)px_highlightKind
{
  return -1;
}

- (double)promotionScore
{
  return 0.0;
}

- (NSString)localizedTitle
{
  return 0;
}

- (NSString)localizedSubtitle
{
  return 0;
}

- (NSString)localizedDebugDescription
{
  return 0;
}

- (NSArray)localizedLocationNames
{
  return 0;
}

- (NSString)localizedDateDescription
{
  return 0;
}

- (id)localizedDateDescriptionWithOptions:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKMediaObjectAssetDataSource.m"), 61, CFSTR("not implemented yet"));

  abort();
}

- (NSString)localizedSmartDescription
{
  return 0;
}

- (NSDate)startDate
{
  return 0;
}

- (NSDate)endDate
{
  return 0;
}

- (BOOL)isAggregation
{
  return 0;
}

- (BOOL)isRecent
{
  return 0;
}

- (unint64_t)estimatedAssetCount
{
  return 0;
}

- (NSString)uuid
{
  return 0;
}

@end
