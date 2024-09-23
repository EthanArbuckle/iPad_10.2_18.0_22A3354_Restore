@implementation NSString(ECMessageBodyParser_HorizontalSeparator)

- (BOOL)ec_isHorizontalSeparator
{
  uint64_t v2;
  uint64_t v4;
  id v5;
  char *v6;
  __int128 v7;
  _OWORD v8[25];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  if ((unint64_t)(v2 - 201) < 0xFFFFFFFFFFFFFF3ALL)
    return 0;
  v4 = v2;
  v5 = objc_retainAutorelease(a1);
  v6 = (char *)objc_msgSend(v5, "_fastCharacterContents");
  if (v6)
    return bufferIsHorizontalSeparator(v6, (unint64_t)&v6[2 * v4]);
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v8[23] = v7;
  v8[24] = v7;
  v8[21] = v7;
  v8[22] = v7;
  v8[19] = v7;
  v8[20] = v7;
  v8[17] = v7;
  v8[18] = v7;
  v8[15] = v7;
  v8[16] = v7;
  v8[13] = v7;
  v8[14] = v7;
  v8[11] = v7;
  v8[12] = v7;
  v8[9] = v7;
  v8[10] = v7;
  v8[7] = v7;
  v8[8] = v7;
  v8[5] = v7;
  v8[6] = v7;
  v8[3] = v7;
  v8[4] = v7;
  v8[1] = v7;
  v8[2] = v7;
  v8[0] = v7;
  objc_msgSend(v5, "getCharacters:range:", v8, 0, v4);
  return bufferIsHorizontalSeparator((char *)v8, (unint64_t)v8 + 2 * v4);
}

@end
