@implementation MRAVEndpointAddOutputDevicesWithInitiator

void __MRAVEndpointAddOutputDevicesWithInitiator_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = v3;
    if (MRMediaRemoteErrorIsInformational(v3))
    {

      v4 = 0;
    }
    else
    {
      v4 = v5;
    }
    v6 = v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = v6;
  }

}

@end
