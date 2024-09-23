@implementation SGLevenshtein

+ (unint64_t)distanceBetweenStrings:(id)a3 and:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  unsigned int v7;
  unsigned int v8;
  unint64_t CStringPtr;
  const char *v10;
  uint64_t v11;
  size_t v12;
  size_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v21;
  unint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  v6 = (__CFString *)a4;
  v7 = -[__CFString length](v5, "length");
  v8 = -[__CFString length](v6, "length");
  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", v6) & 1) != 0)
  {
    LODWORD(CStringPtr) = 0;
    goto LABEL_20;
  }
  if (!v7)
  {
    CStringPtr = (unint64_t)-[__CFString lengthOfBytesUsingEncoding:](v6, "lengthOfBytesUsingEncoding:", 2348810496) >> 2;
    goto LABEL_20;
  }
  if (!v8)
  {
    CStringPtr = (unint64_t)-[__CFString lengthOfBytesUsingEncoding:](v5, "lengthOfBytesUsingEncoding:", 2348810496) >> 2;
    goto LABEL_20;
  }
  CStringPtr = (unint64_t)CFStringGetCStringPtr(v5, 0x600u);
  v10 = CFStringGetCStringPtr(v6, 0x600u);
  if ((CStringPtr || -[__CFString canBeConvertedToEncoding:](v5, "canBeConvertedToEncoding:", 1))
    && (v10 || -[__CFString canBeConvertedToEncoding:](v6, "canBeConvertedToEncoding:", 1)))
  {
    if (CStringPtr)
    {
      if (!v10)
        goto LABEL_17;
    }
    else
    {
      CStringPtr = -[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
      if (!v10)
LABEL_17:
        v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v6), "UTF8String");
    }
    LODWORD(CStringPtr) = levenshtein<char>(CStringPtr, (uint64_t)v10, v7, v8);
    goto LABEL_20;
  }
  v11 = v8;
  v12 = 4 * v8;
  if (v12 + 4 * v7 > 0x7CF)
  {
    -[__CFString dataUsingEncoding:](v5, "dataUsingEncoding:", 2348810496);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString dataUsingEncoding:](v6, "dataUsingEncoding:", 2348810496);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CStringPtr = objc_msgSend(v14, "length");
    v16 = objc_msgSend(v15, "length");
    v17 = objc_retainAutorelease(v14);
    v18 = objc_msgSend(v17, "bytes");
    v19 = objc_retainAutorelease(v15);
    LODWORD(CStringPtr) = levenshtein<unsigned int>(v18, objc_msgSend(v19, "bytes"), CStringPtr >> 2, v16 >> 2);

  }
  else
  {
    v13 = 4 * v7;
    MEMORY[0x1E0C80A78]();
    bzero((char *)&v21 - ((v13 + 15) & 0x7FFFFFFF0), v13);
    MEMORY[0x1E0C80A78]();
    bzero((char *)&v21 - ((v12 + 15) & 0x7FFFFFFF0), v12);
    v22 = 0;
    v23[0] = 0;
    -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (char *)&v21 - ((v13 + 15) & 0x7FFFFFFF0), v13, v23, 2348810496, 0, 0, v7, 0);
    -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v6, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (char *)&v21 - ((v12 + 15) & 0x7FFFFFFF0), v12, &v22, 2348810496, 0, 0, v11, 0);
    LODWORD(CStringPtr) = levenshtein<unsigned int>((uint64_t)&v21 - ((v13 + 15) & 0x7FFFFFFF0), (uint64_t)&v21 - ((v12 + 15) & 0x7FFFFFFF0), v23[0] >> 2, v22 >> 2);
  }
LABEL_20:

  return CStringPtr;
}

@end
