@implementation NSExtensionContext(INUIHostedViewControlling)

- (double)hostedViewMinimumAllowedSize
{
  return *MEMORY[0x1E0C9D820];
}

- (double)hostedViewMaximumAllowedSize
{
  return *MEMORY[0x1E0C9D820];
}

- (uint64_t)interfaceParametersDescription
{
  return 0;
}

@end
