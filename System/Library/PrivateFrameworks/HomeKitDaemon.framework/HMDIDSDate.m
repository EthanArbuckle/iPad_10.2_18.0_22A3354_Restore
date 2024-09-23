@implementation HMDIDSDate

- (double)timeIntervalSince1970
{
  double v2;
  _QWORD block[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HMDIDSDate_timeIntervalSince1970__block_invoke;
  block[3] = &unk_24E797578;
  block[4] = &v5;
  dispatch_block_perform(DISPATCH_BLOCK_DETACHED, block);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSDate)now
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "now");
}

void __35__HMDIDSDate_timeIntervalSince1970__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE4FBF8], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentServerTimeInterval");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;

}

@end
