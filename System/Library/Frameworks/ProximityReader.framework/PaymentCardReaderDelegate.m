@implementation PaymentCardReaderDelegate

- (void)closed:(BOOL)a3
{
  sub_21C34A7CC(a3);
}

- (void)loading:(int64_t)a3
{
  sub_21C34A990(a3, (uint64_t)&unk_24E034840, (uint64_t)&unk_24E034868, (uint64_t)&unk_25525E310);
}

- (void)readFeedback:(int64_t)a3
{
  sub_21C34A990(a3, (uint64_t)&unk_24E0347F0, (uint64_t)&unk_24E034818, (uint64_t)&unk_25525E300);
}

@end
