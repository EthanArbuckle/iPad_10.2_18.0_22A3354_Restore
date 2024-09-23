@implementation AVOutputDevice

void __86__AVOutputDevice_AirPLayKit__openCommunicationChannelToDestination_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  APKCommunicationChannel *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[APKCommunicationChannel initWithCommunicationChannel:]([APKCommunicationChannel alloc], "initWithCommunicationChannel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
