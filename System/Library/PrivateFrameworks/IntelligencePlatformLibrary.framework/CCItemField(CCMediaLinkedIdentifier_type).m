@implementation CCItemField(CCMediaLinkedIdentifier_type)

- (uint64_t)mediaLinkedIdentifierType
{
  uint64_t result;

  LODWORD(result) = objc_msgSend(a1, "uint32Value");
  if (result >= 0xD)
    return 0;
  else
    return result;
}

@end
