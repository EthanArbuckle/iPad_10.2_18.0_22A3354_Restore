@implementation NSData(KCJoiningMessages)

- (BOOL)decodeSequenceData:()KCJoiningMessages data:error:
{
  id v8;
  uint64_t v9;
  id v10;

  v8 = objc_retainAutorelease(a1);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_retainAutorelease(v8);
  return decode_seq_data_data(a3, a4, a5, v9, objc_msgSend(v10, "bytes") + objc_msgSend(v10, "length")) != 0;
}

- (BOOL)decodeSequenceString:()KCJoiningMessages data:error:
{
  id v8;
  uint64_t v9;
  id v10;

  v8 = objc_retainAutorelease(a1);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_retainAutorelease(v8);
  return decode_seq_string_data(a3, a4, a5, v9, objc_msgSend(v10, "bytes") + objc_msgSend(v10, "length")) != 0;
}

+ (id)dataWithEncodedString:()KCJoiningMessages error:
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v16;

  v5 = a3;
  objc_msgSend(v5, "lengthOfBytesUsingEncoding:", 4);
  v6 = ccder_sizeof();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "mutableBytes");
    if (kcder_encode_string(v5, a4, v8, v8 + objc_msgSend(v7, "length")) == v8)
    {
      v14 = v7;
    }
    else
    {
      KCJoiningErrorCreate(3, a4, CFSTR("extra data"), v9, v10, v11, v12, v13, v16);
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)dataWithEncodedSequenceData:()KCJoiningMessages data:error:
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v19;

  v7 = a3;
  v8 = a4;
  v9 = sizeof_seq_data_data(v7, v8);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v9);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "mutableBytes");
    objc_msgSend(v10, "length");
    if (encode_seq_data_data(v7, v8) == v11)
    {
      v17 = v10;
    }
    else
    {
      KCJoiningErrorCreate(3, a5, CFSTR("extra data"), v12, v13, v14, v15, v16, v19);
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)dataWithEncodedSequenceString:()KCJoiningMessages data:error:
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v19;

  v7 = a3;
  v8 = a4;
  v9 = sizeof_seq_string_data(v7, v8);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v9);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "mutableBytes");
    objc_msgSend(v10, "length");
    if (encode_seq_string_data(v7, v8, a5, v11) == v11)
    {
      v17 = v10;
    }
    else
    {
      KCJoiningErrorCreate(3, a5, CFSTR("extra data"), v12, v13, v14, v15, v16, v19);
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
