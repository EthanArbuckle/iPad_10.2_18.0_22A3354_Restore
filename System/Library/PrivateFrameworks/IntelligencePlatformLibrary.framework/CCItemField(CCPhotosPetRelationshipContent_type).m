@implementation CCItemField(CCPhotosPetRelationshipContent_type)

- (uint64_t)photosPetRelationshipContentType
{
  uint64_t result;

  LODWORD(result) = objc_msgSend(a1, "uint32Value");
  if (result >= 3)
    return 0;
  else
    return result;
}

@end
