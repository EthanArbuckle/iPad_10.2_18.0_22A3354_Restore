@implementation NSValue(CATransform3DAdditions)

+ (uint64_t)valueWithCATransform3D:()CATransform3DAdditions
{
  return objc_msgSend(a1, "valueWithBytes:objCType:", a3, "{CATransform3D=dddddddddddddddd}");
}

- (const)CATransform3DValue
{
  const char *result;
  NSUInteger v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  result = NSGetSizeAndAlignment((const char *)objc_msgSend(a1, "objCType"), v5, 0);
  if (v5[0] > 0x7F)
  {
    *(_OWORD *)&a2->m41 = 0u;
    *(_OWORD *)&a2->m43 = 0u;
    *(_OWORD *)&a2->m31 = 0u;
    *(_OWORD *)&a2->m33 = 0u;
    *(_OWORD *)&a2->m21 = 0u;
    *(_OWORD *)&a2->m23 = 0u;
    *(_OWORD *)&a2->m11 = 0u;
    *(_OWORD *)&a2->m13 = 0u;
    return (const char *)objc_msgSend(a1, "getValue:size:", a2, 128);
  }
  else
  {
    *a2 = CATransform3DIdentity;
  }
  return result;
}

@end
