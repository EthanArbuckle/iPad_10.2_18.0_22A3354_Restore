@implementation NPKTrackPeerPaymentAction

id __NPKTrackPeerPaymentAction_block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("actionType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = a1[5];
  v8[0] = v2;
  v8[1] = v3;
  v7[1] = CFSTR("amount");
  v7[2] = CFSTR("currency");
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
