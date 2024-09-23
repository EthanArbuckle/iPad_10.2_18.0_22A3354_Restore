@implementation CPUITableCellAccessory

+ (id)accessoryWithCloudIcon
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__CPUITableCellAccessory_accessoryWithCloudIcon__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accessoryWithCloudIcon_onceToken != -1)
    dispatch_once(&accessoryWithCloudIcon_onceToken, block);
  return (id)accessoryWithCloudIcon__accessory;
}

void __48__CPUITableCellAccessory_accessoryWithCloudIcon__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)accessoryWithCloudIcon__accessory;
  accessoryWithCloudIcon__accessory = v0;

}

+ (id)accessoryWithiCloudIcon
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__CPUITableCellAccessory_accessoryWithiCloudIcon__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accessoryWithiCloudIcon_onceToken != -1)
    dispatch_once(&accessoryWithiCloudIcon_onceToken, block);
  return (id)accessoryWithiCloudIcon__accessory;
}

void __49__CPUITableCellAccessory_accessoryWithiCloudIcon__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)accessoryWithiCloudIcon__accessory;
  accessoryWithiCloudIcon__accessory = v0;

}

+ (id)accessoryWithDisclosureIndicator
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CPUITableCellAccessory_accessoryWithDisclosureIndicator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accessoryWithDisclosureIndicator_onceToken != -1)
    dispatch_once(&accessoryWithDisclosureIndicator_onceToken, block);
  return (id)accessoryWithDisclosureIndicator__accessory;
}

void __58__CPUITableCellAccessory_accessoryWithDisclosureIndicator__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)accessoryWithDisclosureIndicator__accessory;
  accessoryWithDisclosureIndicator__accessory = v0;

}

+ (id)accessoryWithActivityIndicator
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CPUITableCellAccessory_accessoryWithActivityIndicator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accessoryWithActivityIndicator_onceToken != -1)
    dispatch_once(&accessoryWithActivityIndicator_onceToken, block);
  return (id)accessoryWithActivityIndicator__accessory;
}

void __56__CPUITableCellAccessory_accessoryWithActivityIndicator__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)accessoryWithActivityIndicator__accessory;
  accessoryWithActivityIndicator__accessory = v0;

}

+ (id)accessoryWithImage:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setImage:", v3);

  return v4;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
