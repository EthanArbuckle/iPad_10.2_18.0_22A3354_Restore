@implementation CGPDFDocumentCreateWithProvider

void __CGPDFDocumentCreateWithProvider_block_invoke()
{
  _ZZZ31CGPDFDocumentCreateWithProviderEUb_E21memory_pressure_queue = (uint64_t)dispatch_queue_create("com.apple.CoreGraphics.CGPDFDocumentMemoryPressureResponse", 0);
  _ZZZ31CGPDFDocumentCreateWithProviderEUb_E22memory_pressure_source = (uint64_t)dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, (dispatch_queue_t)_ZZZ31CGPDFDocumentCreateWithProviderEUb_E21memory_pressure_queue);
  dispatch_source_set_event_handler((dispatch_source_t)_ZZZ31CGPDFDocumentCreateWithProviderEUb_E22memory_pressure_source, &__block_literal_global_11);
  dispatch_resume((dispatch_object_t)_ZZZ31CGPDFDocumentCreateWithProviderEUb_E22memory_pressure_source);
}

void __CGPDFDocumentCreateWithProvider_block_invoke_2()
{
  __CFNotificationCenter *LocalCenter;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("CGPDFDocumentLowMemoryNotificationName"), 0, 0, 1u);
}

@end
