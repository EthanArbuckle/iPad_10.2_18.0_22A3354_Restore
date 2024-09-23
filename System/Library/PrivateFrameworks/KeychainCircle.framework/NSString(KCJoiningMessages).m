@implementation NSString(KCJoiningMessages)

+ (id)decodeFromDER:()KCJoiningMessages error:
{
  id v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v19;
  id v20;

  v20 = 0;
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_retainAutorelease(v5);
  v8 = kcder_decode_string((uint64_t *)&v20, a4, v6, objc_msgSend(v7, "bytes") + objc_msgSend(v7, "length"));
  v9 = v20;
  if (v8)
  {
    v10 = objc_retainAutorelease(v7);
    v11 = objc_msgSend(v10, "bytes");
    if (v8 == v11 + objc_msgSend(v10, "length"))
    {
      v17 = v9;
      goto LABEL_6;
    }
    KCJoiningErrorCreate(1, a4, CFSTR("extra data in string"), v12, v13, v14, v15, v16, v19);
  }
  v17 = 0;
LABEL_6:

  return v17;
}

@end
