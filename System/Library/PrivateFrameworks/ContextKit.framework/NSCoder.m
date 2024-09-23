@implementation NSCoder

- (void)encodeUInteger:(uint64_t)a3 forKey:
{
  if (a1)
    return (void *)objc_msgSend(a1, "encodeInteger:forKey:", a2, a3);
  return a1;
}

- (void)encodeUInt32:(uint64_t)a3 forKey:
{
  if (a1)
    return (void *)objc_msgSend(a1, "encodeInt32:forKey:", a2, a3);
  return a1;
}

- (void)decodeUIntegerForKey:(void *)a1
{
  if (a1)
    return (void *)objc_msgSend(a1, "decodeIntegerForKey:", a2);
  return a1;
}

- (void)decodeUInt32ForKey:(void *)a1
{
  if (a1)
    return (void *)objc_msgSend(a1, "decodeInt32ForKey:", a2);
  return a1;
}

- (void)decodeUInt64ForKey:(void *)a1
{
  if (a1)
    return (void *)objc_msgSend(a1, "decodeInt64ForKey:", a2);
  return a1;
}

- (void)encodeUInt64:(uint64_t)a3 forKey:
{
  if (a1)
    return (void *)objc_msgSend(a1, "encodeInt64:forKey:", a2, a3);
  return a1;
}

@end
