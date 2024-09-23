@implementation ACAccountTypeForSyncAccountType

id ___ACAccountTypeForSyncAccountType_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id result;
  _QWORD v5[7];
  _QWORD v6[8];

  v6[7] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDB4118];
  v5[0] = CFSTR("SMTPAccount");
  v5[1] = CFSTR("iToolsAccount");
  v1 = *MEMORY[0x24BDB3FD8];
  v6[0] = v0;
  v6[1] = v1;
  v5[2] = CFSTR("YahooAccount");
  v5[3] = CFSTR("GmailAccount");
  v2 = *MEMORY[0x24BDB4068];
  v6[2] = *MEMORY[0x24BDB4160];
  v6[3] = v2;
  v5[4] = CFSTR(".Mac");
  v5[5] = CFSTR("IMAPAccount");
  v3 = *MEMORY[0x24BDB4088];
  v6[4] = v1;
  v6[5] = v3;
  v5[6] = CFSTR("POPAccount");
  v6[6] = *MEMORY[0x24BDB40F8];
  result = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  _ACAccountTypeForSyncAccountType_accountTypeForAccountClass = (uint64_t)result;
  return result;
}

@end
