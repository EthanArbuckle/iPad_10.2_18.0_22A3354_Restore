@implementation HMDDataStreamTargetControlProtocol

+ (void)sendTargetControlWhoAmIWithIdentifier:(unsigned int)a3 dataStreamProtocolDelegate:(id)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v4 = *(_QWORD *)&a3;
  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("identifier");
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a4;
  objc_msgSend(v5, "numberWithUnsignedInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sendEventForProtocol:topic:payload:completion:", CFSTR("targetControl"), CFSTR("whoami"), v8, &__block_literal_global_247010);
}

@end
