@implementation GetDefaultsWriteAnnotationLoggingEnabled

uint64_t __GetDefaultsWriteAnnotationLoggingEnabled_block_invoke()
{
  uint64_t result;

  result = GetDefaultsWriteValue(CFSTR("PDFKIT_LOG_ANNOTATIONS"), 0);
  GetDefaultsWriteAnnotationLoggingEnabled_value = result;
  return result;
}

@end
