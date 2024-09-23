@implementation NSData(NanoPassKit)

- (id)npkDescription
{
  unint64_t v2;
  unsigned __int8 *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  char v9;
  unsigned int v10;
  char v11;
  CFStringRef v12;
  UInt8 bytes[2];

  v2 = objc_msgSend(a1, "length");
  v3 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  v4 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16A8]), "initWithCapacity:", 512);
  objc_msgSend(v4, "appendFormat:", CFSTR("{length = %lu, bytes = 0x"), v2);
  if (v2 < 0x19)
  {
    for (; v2; --v2)
    {
      v8 = *v3++;
      v7 = v8;
      if (v8 >= 0xA0)
        v9 = 87;
      else
        v9 = 48;
      bytes[0] = v9 + (v7 >> 4);
      v10 = v7 & 0xF;
      if (v10 >= 0xA)
        v11 = 87;
      else
        v11 = 48;
      bytes[1] = v11 + v10;
      v12 = CFStringCreateWithBytes(0, bytes, 2, 0x600u, 0);
      objc_msgSend(v4, "appendString:", v12);
      CFRelease(v12);
    }
  }
  else
  {
    v5 = -4;
    do
    {
      v5 += 4;
      append4Bytes(v4, &v3[v5]);
    }
    while (v5 < 0xC);
    objc_msgSend(v4, "appendString:", CFSTR("... "));
    v6 = v2 - 8;
    do
    {
      append4Bytes(v4, &v3[v6]);
      v6 += 4;
    }
    while (v6 < v2);
  }
  objc_msgSend(v4, "appendString:", CFSTR("}"));
  return v4;
}

- (id)asHexString
{
  void *v2;
  unint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 2 * objc_msgSend(a1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "length"))
  {
    v3 = 0;
    do
    {
      v4 = objc_retainAutorelease(a1);
      objc_msgSend(v2, "appendFormat:", CFSTR("%02X"), *(unsigned __int8 *)(objc_msgSend(v4, "bytes") + v3++));
    }
    while (v3 < objc_msgSend(v4, "length"));
  }
  return v2;
}

@end
