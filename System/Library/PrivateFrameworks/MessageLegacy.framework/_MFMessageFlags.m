@implementation _MFMessageFlags

- (_MFMessageFlags)initWithCoder:(id)a3
{
  int v6;
  uint64_t v7;
  id v8;

  v7 = 0;
  v8 = 0;
  v6 = 0;
  objc_msgSend(a3, "decodeValueOfObjCType:at:", "@", &v8);
  objc_msgSend(a3, "decodeValueOfObjCType:at:", "Q", &v7);
  objc_msgSend(a3, "decodeValueOfObjCType:at:", "I", &v6);

  self->realFlags = (v7 & 0x1BFDDF7FFFFLL | ((unint64_t)(v6 & 7) << 16)) ^ 1;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t realFlags;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  realFlags = self->realFlags;
  v5 = WORD1(realFlags) & 7;
  v6 = realFlags & 0x1BFDDF7FFFFLL ^ 1;
  v7 = 0;
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "@", &v7);
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "Q", &v6);
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "I", &v5);
}

@end
