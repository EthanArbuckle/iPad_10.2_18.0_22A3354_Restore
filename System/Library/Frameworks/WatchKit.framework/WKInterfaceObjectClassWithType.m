@implementation WKInterfaceObjectClassWithType

void ___WKInterfaceObjectClassWithType_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];
  _QWORD v3[13];

  v3[12] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("button");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("switch");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("image");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("label");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("timer");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("date");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("list");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("table");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("group");
  v3[8] = objc_opt_class();
  v2[9] = CFSTR("map");
  v3[9] = objc_opt_class();
  v2[10] = CFSTR("slider");
  v3[10] = objc_opt_class();
  v2[11] = CFSTR("separator");
  v3[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_WKInterfaceObjectClassWithType___interfaceClasses;
  _WKInterfaceObjectClassWithType___interfaceClasses = v0;

}

@end
