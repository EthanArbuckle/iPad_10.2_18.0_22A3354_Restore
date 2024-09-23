@implementation OSInfoAffectingPropertyKeys

void ___OSInfoAffectingPropertyKeys_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = *MEMORY[0x24BE6B3F0];
  v5[0] = *MEMORY[0x24BE6B2F8];
  v5[1] = v1;
  v5[2] = *MEMORY[0x24BE6B3E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_OSInfoAffectingPropertyKeys___set;
  _OSInfoAffectingPropertyKeys___set = v3;

}

@end
