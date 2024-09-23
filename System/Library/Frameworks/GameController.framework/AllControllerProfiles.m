@implementation AllControllerProfiles

void __AllControllerProfiles_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];

  v2[8] = *MEMORY[0x24BDAC8D0];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AllControllerProfiles_ControllerProfiles;
  AllControllerProfiles_ControllerProfiles = v0;

}

@end
