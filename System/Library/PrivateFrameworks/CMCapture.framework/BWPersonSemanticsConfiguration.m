@implementation BWPersonSemanticsConfiguration

- (unsigned)enabledSemantics
{
  return self->_enabledSemantics;
}

- (void)setAppliesFinalCropRect:(BOOL)a3
{
  self->_appliesFinalCropRect = a3;
}

- (void)setEnabledSemantics:(unsigned int)a3
{
  self->_enabledSemantics = a3;
}

+ (unsigned)personSemanticForAttachedMediaKey:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E49511B8) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E49511D8) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E4951218) & 1) != 0)
    return 8;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E4951238) & 1) != 0)
    return 16;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E4951258) & 1) != 0)
    return 32;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E4951278) & 1) != 0)
    return 64;
  if (objc_msgSend(a3, "hasPrefix:", 0x1E4951318))
    return 128;
  return 0;
}

- (BOOL)appliesFinalCropRect
{
  return self->_appliesFinalCropRect;
}

@end
