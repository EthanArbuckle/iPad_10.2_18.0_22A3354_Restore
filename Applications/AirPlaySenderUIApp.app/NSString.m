@implementation NSString

- (BOOL)isValidSubnetMask
{
  int v3;

  v3 = 0;
  return inet_pton(2, -[NSString cStringUsingEncoding:](objc_retainAutorelease(self), "cStringUsingEncoding:", 4), &v3) == 1;
}

- (BOOL)isValidIPv4Address
{
  int v4;

  v4 = 0;
  return inet_pton(2, -[NSString cStringUsingEncoding:](objc_retainAutorelease(self), "cStringUsingEncoding:", 4), &v4) == 1&& (v4 - 1) < 0xFFFFFFFE;
}

- (BOOL)isValidIPv4AddressWithSubnetMask:(id)a3
{
  id v4;
  unsigned int v5;

  v4 = a3;
  if (-[NSString isValidIPv4Address](self, "isValidIPv4Address") && objc_msgSend(v4, "isValidSubnetMask"))
  {
    if (-[NSString hasPrefix:](self, "hasPrefix:", CFSTR("169.254.")))
      v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("255.255.0.0")) ^ 1;
    else
      LOBYTE(v5) = 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isValidIPv6Address
{
  BOOL result;
  _QWORD v3[2];
  int v4;

  v3[0] = 0;
  v4 = 0;
  v3[1] = 0;
  if (inet_pton(30, -[NSString cStringUsingEncoding:](objc_retainAutorelease(self), "cStringUsingEncoding:", 1, 0), v3) != 1|| LOBYTE(v3[0]) == 254 && (BYTE1(v3[0]) & 0xC0) == 0x80)
  {
    return 0;
  }
  result = 1;
  if (LOBYTE(v3[0]) == 255 && (BYTE1(v3[0]) & 0xF0) != 0x30)
    return (BYTE1(v3[0]) & 0xF) != 2;
  return result;
}

@end
