@implementation WFContentItemRegistry(ActionKit)

+ (id)allContentItemClassesInActionKit
{
  _QWORD v1[23];

  v1[22] = *MEMORY[0x24BDAC8D0];
  v1[0] = objc_opt_class();
  v1[1] = objc_opt_class();
  v1[2] = objc_opt_class();
  v1[3] = objc_opt_class();
  v1[4] = objc_opt_class();
  v1[5] = objc_opt_class();
  v1[6] = objc_opt_class();
  v1[7] = objc_opt_class();
  v1[8] = objc_opt_class();
  v1[9] = objc_opt_class();
  v1[10] = objc_opt_class();
  v1[11] = objc_opt_class();
  v1[12] = objc_opt_class();
  v1[13] = objc_opt_class();
  v1[14] = objc_opt_class();
  v1[15] = objc_opt_class();
  v1[16] = objc_opt_class();
  v1[17] = objc_opt_class();
  v1[18] = objc_opt_class();
  v1[19] = objc_opt_class();
  v1[20] = objc_opt_class();
  v1[21] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 22);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
