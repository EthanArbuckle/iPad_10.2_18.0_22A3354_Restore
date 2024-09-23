@implementation MRMediaRemoteApplicationIsAirPlayReceiver

void __MRMediaRemoteApplicationIsAirPlayReceiver_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("TVAirPlay"), CFSTR("airtunesd"), CFSTR("tvairplayd"), 0);
  v1 = (void *)MRMediaRemoteApplicationIsAirPlayReceiver___receivers;
  MRMediaRemoteApplicationIsAirPlayReceiver___receivers = v0;

}

@end
