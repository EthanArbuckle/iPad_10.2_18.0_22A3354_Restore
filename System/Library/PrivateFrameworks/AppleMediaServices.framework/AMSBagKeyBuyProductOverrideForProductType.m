@implementation AMSBagKeyBuyProductOverrideForProductType

void __AMSBagKeyBuyProductOverrideForProductType_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];
  _QWORD v3[13];

  v3[12] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("A");
  v2[1] = CFSTR("ASB");
  v3[0] = 0x1E254CD80;
  v3[1] = 0x1E254CDA0;
  v2[2] = CFSTR("C");
  v2[3] = CFSTR("B");
  v3[2] = 0x1E254CDC0;
  v3[3] = 0x1E254CDE0;
  v2[4] = CFSTR("W");
  v2[5] = CFSTR("P");
  v3[4] = 0x1E254CE00;
  v3[5] = 0x1E254CE20;
  v2[6] = CFSTR("PUB");
  v2[7] = CFSTR("PC");
  v3[6] = 0x1E254CE40;
  v3[7] = 0x1E254CE60;
  v2[8] = CFSTR("Q");
  v2[9] = CFSTR("G");
  v3[8] = 0x1E254CE80;
  v3[9] = 0x1E254CEA0;
  v2[10] = CFSTR("S");
  v2[11] = CFSTR("V");
  v3[10] = 0x1E254CEC0;
  v3[11] = 0x1E254CEE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD008;
  qword_1ECEAD008 = v0;

}

@end
