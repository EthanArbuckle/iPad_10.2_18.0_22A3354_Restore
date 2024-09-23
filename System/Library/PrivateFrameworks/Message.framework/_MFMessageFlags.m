@implementation _MFMessageFlags

- (_MFMessageFlags)initWithCoder:(id)a3
{
  id v4;
  int v6;
  unint64_t v7;
  id v8;

  v4 = a3;
  v7 = 0xAAAAAAAAAAAAAAAALL;
  v8 = 0;
  v6 = -1431655766;
  objc_msgSend(v4, "decodeValueOfObjCType:at:", "@", &v8);
  objc_msgSend(v4, "decodeValueOfObjCType:at:", "Q", &v7);
  objc_msgSend(v4, "decodeValueOfObjCType:at:", "I", &v6);
  self->realFlags = (v7 ^ 1) & 0x1BDDDB7FFFFLL | ((unint64_t)(v6 & 7) << 16);

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t realFlags;
  unsigned int v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  realFlags = self->realFlags;
  v6 = WORD1(realFlags) & 7;
  v7 = realFlags & 0x1BDDDB7FFFFLL ^ 1;
  v8 = 0;
  objc_msgSend(v4, "encodeValueOfObjCType:at:", "@", &v8);
  objc_msgSend(v4, "encodeValueOfObjCType:at:", "Q", &v7);
  objc_msgSend(v4, "encodeValueOfObjCType:at:", "I", &v6);

}

@end
