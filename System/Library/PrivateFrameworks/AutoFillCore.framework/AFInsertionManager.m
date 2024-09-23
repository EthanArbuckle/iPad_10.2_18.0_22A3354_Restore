@implementation AFInsertionManager

+ (id)preferredInsertionOrder
{
  if (preferredInsertionOrder_onceToken != -1)
    dispatch_once(&preferredInsertionOrder_onceToken, &__block_literal_global_2);
  return (id)preferredInsertionOrder_preferredInsertionOrder;
}

void __45__AFInsertionManager_preferredInsertionOrder__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[53];

  v2[52] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("username");
  v2[1] = CFSTR("password");
  v2[2] = CFSTR("new-password");
  v2[3] = CFSTR("email");
  v2[4] = CFSTR("name");
  v2[5] = CFSTR("given-name");
  v2[6] = CFSTR("additional-name");
  v2[7] = CFSTR("family-name");
  v2[8] = CFSTR("street-address");
  v2[9] = CFSTR("address-line1");
  v2[10] = CFSTR("address-line2");
  v2[11] = CFSTR("address-level2");
  v2[12] = CFSTR("address-level1");
  v2[13] = CFSTR("address-level1+2");
  v2[14] = CFSTR("address-level3");
  v2[15] = CFSTR("country-name");
  v2[16] = CFSTR("postal-code");
  v2[17] = CFSTR("tel");
  v2[18] = CFSTR("bday");
  v2[19] = CFSTR("bday-day");
  v2[20] = CFSTR("bday-month");
  v2[21] = CFSTR("bday-year");
  v2[22] = CFSTR("cc-name");
  v2[23] = CFSTR("cc-given-name");
  v2[24] = CFSTR("cc-additional-name");
  v2[25] = CFSTR("cc-family-name");
  v2[26] = CFSTR("cc-number");
  v2[27] = CFSTR("cc-csc");
  v2[28] = CFSTR("cc-exp");
  v2[29] = CFSTR("cc-exp-month");
  v2[30] = CFSTR("cc-exp-year");
  v2[31] = CFSTR("cc-type");
  v2[32] = CFSTR("signup-username");
  v2[33] = CFSTR("login-username");
  v2[34] = CFSTR("one-time-code");
  v2[35] = CFSTR("honorifix-prefix");
  v2[36] = CFSTR("honorifix-suffix");
  v2[37] = CFSTR("nickname");
  v2[38] = CFSTR("organization-title");
  v2[39] = CFSTR("organization");
  v2[40] = CFSTR("location");
  v2[41] = CFSTR("tel-national");
  v2[42] = CFSTR("tel-country-code");
  v2[43] = CFSTR("tel-area-code");
  v2[44] = CFSTR("tel-local");
  v2[45] = CFSTR("tel-extension");
  v2[46] = CFSTR("cc-number");
  v2[47] = CFSTR("url");
  v2[48] = CFSTR("equation");
  v2[49] = CFSTR("shipment-tracking-number");
  v2[50] = CFSTR("flight-number");
  v2[51] = CFSTR("date-time");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 52);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)preferredInsertionOrder_preferredInsertionOrder;
  preferredInsertionOrder_preferredInsertionOrder = v0;

}

@end
