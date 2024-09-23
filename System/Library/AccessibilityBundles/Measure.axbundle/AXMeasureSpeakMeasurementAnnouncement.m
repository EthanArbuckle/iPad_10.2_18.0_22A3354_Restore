@implementation AXMeasureSpeakMeasurementAnnouncement

void __AXMeasureSpeakMeasurementAnnouncement_block_invoke(uint64_t a1)
{
  if (AXMeasureIsMeasuring())
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *(id *)(a1 + 32));
}

@end
