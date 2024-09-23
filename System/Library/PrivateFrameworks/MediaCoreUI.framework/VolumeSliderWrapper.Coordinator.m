@implementation VolumeSliderWrapper.Coordinator

- (void)onTouchDown:(id)a3
{
  sub_24136A4FC((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_24136A000);
}

- (void)onTouchUpInside:(id)a3
{
  sub_24136A4FC((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_24136A280);
}

@end
