@implementation UniqueAnimationKey

- (UniqueAnimationKey)initWithKey:(unint64_t)a3
{
  UniqueAnimationKey *v4;
  UniqueAnimationKey *v5;
  UniqueAnimationKey *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UniqueAnimationKey;
  v4 = -[UniqueAnimationKey init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_key = a3;
    v6 = v4;
  }

  return v5;
}

- (unint64_t)length
{
  unint64_t key;
  unint64_t result;
  BOOL v4;

  key = self->_key;
  result = 12;
  if (key >= 0x10)
  {
    do
    {
      ++result;
      v4 = key > 0xFF;
      key >>= 4;
    }
    while (v4);
  }
  return result;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  unint64_t key;
  unint64_t v5;

  if (a3 <= 0xA)
    return kUniqueAnimationKeyPrefix[a3];
  key = self->_key;
  v5 = a3 - 11;
  if (a3 != 11)
  {
    do
    {
      key >>= 4;
      --v5;
    }
    while (v5);
  }
  return (key & 0xF) + 97;
}

- (BOOL)getBytes:(void *)a3 maxLength:(unint64_t)a4 usedLength:(unint64_t *)a5 encoding:(unint64_t)a6 options:(unint64_t)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9
{
  BOOL v9;
  unint64_t length;
  unint64_t key;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v19;
  objc_super v20;

  if (a9)
    v9 = 0;
  else
    v9 = a6 == 30;
  if (v9 && a8.location == 0)
  {
    if (a8.length >= a4)
      length = a4;
    else
      length = a8.length;
    if (length < 0xB)
    {
      return 0;
    }
    else
    {
      *(_DWORD *)((char *)a3 + 7) = 762930539;
      *(_QWORD *)a3 = *(_QWORD *)"unique-key-";
      key = self->_key;
      if (length == 11 || key == 0)
      {
        v15 = 11;
      }
      else
      {
        v16 = 0;
        v17 = length - 12;
        do
        {
          *((_BYTE *)a3 + v16 + 11) = (key & 0xF) + 97;
          v18 = v16 + 1;
          if (v17 == v16)
            break;
          ++v16;
          v19 = key > 0xF;
          key >>= 4;
        }
        while (v19);
        v15 = v18 + 11;
      }
      *a5 = v15;
      return 1;
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)UniqueAnimationKey;
    return -[UniqueAnimationKey getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](&v20, sel_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_, a3, a4, a5, a6, a7, a8.location, a8.length, a9);
  }
}

@end
