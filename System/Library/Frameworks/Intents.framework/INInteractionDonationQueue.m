@implementation INInteractionDonationQueue

void ___INInteractionDonationQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.intents.interaction.donation", 0);
  v1 = (void *)_INInteractionDonationQueue_queue;
  _INInteractionDonationQueue_queue = (uint64_t)v0;

}

@end
