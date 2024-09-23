@implementation NSDictionary(NSDictionaryCopy_AVConference)

- (id)copyGKSDeep
{
  uint64_t v1;

  v1 = objc_msgSend(MEMORY[0x1E0CB38B0], "dataFromPropertyList:format:errorDescription:", a1, 200, 0);
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListFromData:mutabilityOption:format:errorDescription:", v1, 0, 0, 0);
}

@end
