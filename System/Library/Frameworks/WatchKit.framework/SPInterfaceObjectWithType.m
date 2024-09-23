@implementation SPInterfaceObjectWithType

void __SPInterfaceObjectWithType_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];
  _QWORD v3[10];

  v3[9] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("button");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("switch");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("image");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("label");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("list");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("table");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("group");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("map");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("slider");
  v3[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SPInterfaceObjectWithType___interfaceClasses;
  SPInterfaceObjectWithType___interfaceClasses = v0;

}

@end
