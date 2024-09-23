@implementation MPAVEndpointRoute(PlaceholderIcon)

- (uint64_t)placeholderIcon
{
  return objc_msgSend(MEMORY[0x1E0CC2318], "_iconImageForRoute:", a1);
}

@end
