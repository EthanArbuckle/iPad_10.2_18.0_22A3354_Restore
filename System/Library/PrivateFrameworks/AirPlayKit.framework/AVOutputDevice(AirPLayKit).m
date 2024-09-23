@implementation AVOutputDevice(AirPLayKit)

- (uint64_t)supportsCommunicationChannelToDestination:()AirPLayKit
{
  int v4;

  v4 = objc_msgSend(a3, "isEqualToString:", CFSTR("APKOutputDeviceCommunicationChannelDataDestinationFitness"));
  return v4 & objc_msgSend(a1, "supportsFitnessDataDestination");
}

- (void)openCommunicationChannelToDestination:()AirPLayKit completionHandler:
{
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "supportsCommunicationChannelToDestination:", v6) & 1) != 0)
  {
    AVDataDestinationForAPKDataDestination(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __86__AVOutputDevice_AirPLayKit__openCommunicationChannelToDestination_completionHandler___block_invoke;
      v10[3] = &unk_24F46BD30;
      v11 = v7;
      objc_msgSend(a1, "openCommunicationChannelToDestination:options:completionHandler:", v8, 0, v10);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("APKOutputDeviceErrorDomain"), 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("APKOutputDeviceErrorDomain"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v8);
  }

}

@end
