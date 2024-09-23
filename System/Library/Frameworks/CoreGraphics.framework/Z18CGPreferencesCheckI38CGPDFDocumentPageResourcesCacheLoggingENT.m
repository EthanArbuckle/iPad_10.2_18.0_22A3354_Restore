@implementation Z18CGPreferencesCheckI38CGPDFDocumentPageResourcesCacheLoggingENT

const void *___Z18CGPreferencesCheckI38CGPDFDocumentPageResourcesCacheLoggingENT_10ResultTypeEv_block_invoke()
{
  const void *result;

  result = get_BOOLean_property("CGPDFDocumentPageResourcesCacheLogging", copy_preference_value, (BOOL *)&CGPreferencesCheck<CGPDFDocumentPageResourcesCacheLogging>(void)::result);
  if ((result & 1) == 0)
    CGPreferencesCheck<CGPDFDocumentPageResourcesCacheLogging>(void)::result = 0;
  return result;
}

@end
