@implementation HAP2AccessoryServerDefaultAccessoryFactory

- (id)accessoryWithAccessoryServer:(id)a3 instanceID:(unint64_t)a4 discoveredServices:(id)a5
{
  return +[HAP2Accessory accessoryWithAccessoryServer:instanceID:discoveredServices:](HAP2Accessory, "accessoryWithAccessoryServer:instanceID:discoveredServices:", a3, a4, a5);
}

@end
