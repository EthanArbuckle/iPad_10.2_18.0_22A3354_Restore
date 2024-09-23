@implementation DYZlibError

- (id)localizedDescription
{
  void *v3;
  id result;
  unint64_t v5;

  v3 = (void *)-[DYZlibError userInfo](self, "userInfo");
  result = (id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDD0FC8]);
  if (!result)
  {
    v5 = -[DYZlibError code](self, "code");
    if (v5 < 0xFFFFFFFFFFFFFFFALL)
      return CFSTR("unknown zlib error");
    else
      return off_250D58FC8[v5 + 6];
  }
  return result;
}

@end
