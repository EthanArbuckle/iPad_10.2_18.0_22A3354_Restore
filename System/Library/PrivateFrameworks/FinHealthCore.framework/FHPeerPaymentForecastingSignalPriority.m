@implementation FHPeerPaymentForecastingSignalPriority

void __FHPeerPaymentForecastingSignalPriority_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", &unk_250C73E10, &unk_250C73E28, &unk_250C73E40, &unk_250C73E58, &unk_250C73E70, &unk_250C73E88, &unk_250C73EA0, &unk_250C73EB8, &unk_250C73EA0, &unk_250C73ED0, &unk_250C73EA0, &unk_250C73EE8, &unk_250C73EA0, &unk_250C73F00, &unk_250C73EA0, &unk_250C73F18, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FHPeerPaymentForecastingSignalPriority_peerPaymentForecastingSignalPriority;
  FHPeerPaymentForecastingSignalPriority_peerPaymentForecastingSignalPriority = v0;

}

@end
