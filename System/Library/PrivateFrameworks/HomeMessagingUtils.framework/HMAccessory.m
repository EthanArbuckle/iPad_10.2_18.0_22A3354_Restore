@implementation HMAccessory

uint64_t __85__HMAccessory_HMUAdditions__hmu_accessoriesExcludingCurrentAccessoryFromAccessories___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentAccessory") ^ 1;
}

uint64_t __68__HMAccessory_HMUAdditions__hmu_announceAccessoriesFromAccessories___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsAnnounce");
}

@end
