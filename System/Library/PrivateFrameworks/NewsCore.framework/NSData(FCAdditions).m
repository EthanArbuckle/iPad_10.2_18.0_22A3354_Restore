@implementation NSData(FCAdditions)

- (id)fc_URLSafeBase64EncodedStringWithOptions:()FCAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "base64EncodedStringWithOptions:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("+"), CFSTR("-"), 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("_"), 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("="), &stru_1E464BC40, 0, 0, objc_msgSend(v2, "length"));
  return v2;
}

- (id)fc_gzipDeflate
{
  id v2;
  id v3;
  void *v4;
  uLong total_out;
  id v6;
  uint64_t v7;
  int v8;
  void *v9;
  z_stream v11;

  if (!objc_msgSend(a1, "length"))
  {
    v3 = a1;
    return v3;
  }
  memset(&v11.total_out, 0, 72);
  v2 = objc_retainAutorelease(a1);
  v11.avail_in = objc_msgSend(v2, "length", objc_msgSend(v2, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
  v3 = 0;
  if (deflateInit2_(&v11, -1, 8, 31, 8, 0, "1.2.12", 112))
    return v3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0x4000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    total_out = v11.total_out;
    if (total_out >= objc_msgSend(v4, "length"))
      objc_msgSend(v4, "increaseLengthBy:", 0x4000);
    v6 = objc_retainAutorelease(v4);
    v7 = objc_msgSend(v6, "mutableBytes");
    v11.next_out = (Bytef *)(v7 + v11.total_out);
    v8 = objc_msgSend(v6, "length");
    v11.avail_out = v8 - LODWORD(v11.total_out);
    deflate(&v11, 4);
  }
  while (!v11.avail_out);
  deflateEnd(&v11);
  objc_msgSend(v6, "setLength:", v11.total_out);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fc_sha256
{
  id v1;
  void *v2;
  _OWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, sizeof(v4));
  v1 = objc_retainAutorelease(a1);
  v2 = CC_SHA256((const void *)objc_msgSend(v1, "bytes", 0, 0, 0, 0), objc_msgSend(v1, "length"), (unsigned __int8 *)v4);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, 32);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)fc_zlibInflate
{
  uint64_t v2;
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  uLong total_out;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  z_stream v14;

  if (!objc_msgSend(a1, "length"))
    return a1;
  v2 = objc_msgSend(a1, "length");
  v3 = objc_msgSend(a1, "length");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v2 + (v3 >> 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(a1);
  v14.avail_in = objc_msgSend(v5, "length", objc_msgSend(v5, "bytes"), (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
  v14.zalloc = 0;
  v14.zfree = 0;
  v14.total_out = 0;
  v6 = 0;
  if (!inflateInit2_(&v14, -15, "1.2.12", 112))
  {
    v7 = v3 >> 1;
    do
    {
      total_out = v14.total_out;
      if (total_out >= objc_msgSend(v4, "length"))
        objc_msgSend(v4, "increaseLengthBy:", v7);
      v9 = objc_retainAutorelease(v4);
      v10 = objc_msgSend(v9, "mutableBytes");
      v14.next_out = (Bytef *)(v10 + v14.total_out);
      v11 = objc_msgSend(v9, "length");
      v14.avail_out = v11 - LODWORD(v14.total_out);
      v12 = inflate(&v14, 2);
    }
    while (!v12);
    if (v12 == 1)
    {
      if (!inflateEnd(&v14))
      {
        objc_msgSend(v9, "setLength:", v14.total_out);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {
      inflateEnd(&v14);
    }
    v6 = 0;
  }
LABEL_13:

  return v6;
}

- (id)fc_zlibDeflate
{
  id v2;
  id v3;
  void *v4;
  uLong total_out;
  id v6;
  uint64_t v7;
  int v8;
  void *v9;
  z_stream v11;

  if (!objc_msgSend(a1, "length"))
  {
    v3 = a1;
    return v3;
  }
  memset(&v11.total_out, 0, 72);
  v2 = objc_retainAutorelease(a1);
  v11.avail_in = objc_msgSend(v2, "length", objc_msgSend(v2, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
  v3 = 0;
  if (deflateInit2_(&v11, 9, 8, -15, 9, 0, "1.2.12", 112))
    return v3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0x4000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    total_out = v11.total_out;
    if (total_out >= objc_msgSend(v4, "length"))
      objc_msgSend(v4, "increaseLengthBy:", 0x4000);
    v6 = objc_retainAutorelease(v4);
    v7 = objc_msgSend(v6, "mutableBytes");
    v11.next_out = (Bytef *)(v7 + v11.total_out);
    v8 = objc_msgSend(v6, "length");
    v11.avail_out = v8 - LODWORD(v11.total_out);
    deflate(&v11, 4);
  }
  while (!v11.avail_out);
  deflateEnd(&v11);
  objc_msgSend(v6, "setLength:", v11.total_out);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fc_gzipInflate
{
  uint64_t v2;
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  uLong total_out;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  z_stream v14;

  if (!objc_msgSend(a1, "length"))
    return a1;
  v2 = objc_msgSend(a1, "length");
  v3 = objc_msgSend(a1, "length");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v2 + (v3 >> 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(a1);
  v14.avail_in = objc_msgSend(v5, "length", objc_msgSend(v5, "bytes"), (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
  v14.zalloc = 0;
  v14.zfree = 0;
  v14.total_out = 0;
  v6 = 0;
  if (!inflateInit2_(&v14, 47, "1.2.12", 112))
  {
    v7 = v3 >> 1;
    do
    {
      total_out = v14.total_out;
      if (total_out >= objc_msgSend(v4, "length"))
        objc_msgSend(v4, "increaseLengthBy:", v7);
      v9 = objc_retainAutorelease(v4);
      v10 = objc_msgSend(v9, "mutableBytes");
      v14.next_out = (Bytef *)(v10 + v14.total_out);
      v11 = objc_msgSend(v9, "length");
      v14.avail_out = v11 - LODWORD(v14.total_out);
      v12 = inflate(&v14, 2);
    }
    while (!v12);
    if (v12 == 1)
    {
      if (!inflateEnd(&v14))
      {
        objc_msgSend(v9, "setLength:", v14.total_out);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {
      inflateEnd(&v14);
    }
    v6 = 0;
  }
LABEL_13:

  return v6;
}

- (BOOL)fc_isGzipped
{
  unsigned __int8 *v2;
  int v3;
  int v4;

  if ((unint64_t)objc_msgSend(a1, "length") < 2)
    return 0;
  v2 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  v3 = *v2;
  if (v3 != 31)
  {
    if (v3 == 120)
    {
      v4 = v2[1];
      if (v4 == 1 || v4 == 218 || v4 == 156)
        return 1;
    }
    return 0;
  }
  return v2[1] == 139;
}

+ (id)fc_randomDataWithLength:()FCAdditions
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (CCRandomGenerateBytes((void *)objc_msgSend(v4, "mutableBytes"), a3))
  {

    v4 = 0;
  }
  return v4;
}

- (id)fc_encryptAESSIVWithKey:()FCAdditions additionalData:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "key != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "-[NSData(FCAdditions) fc_encryptAESSIVWithKey:additionalData:]";
    v13 = 2080;
    v14 = "NSData+FCAdditions.m";
    v15 = 1024;
    v16 = 250;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_3:

LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  ccaes_siv_encrypt_mode();
  objc_msgSend(a1, "length");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", ccsiv_ciphertext_size());
  ccaes_siv_encrypt_mode();
  objc_msgSend(v6, "length");
  objc_msgSend(objc_retainAutorelease(v6), "bytes");
  objc_msgSend(v7, "length");
  objc_msgSend(objc_retainAutorelease(v7), "bytes");
  objc_msgSend(a1, "length");
  objc_msgSend(objc_retainAutorelease(a1), "bytes");
  v9 = objc_retainAutorelease(v8);
  objc_msgSend(v9, "mutableBytes");
  if (ccsiv_one_shot())
    goto LABEL_3;
LABEL_6:

  return v9;
}

- (id)fc_decryptAESSIVWithKey:()FCAdditions additionalData:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "key != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "-[NSData(FCAdditions) fc_decryptAESSIVWithKey:additionalData:]";
    v13 = 2080;
    v14 = "NSData+FCAdditions.m";
    v15 = 1024;
    v16 = 275;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_3:

LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  ccaes_siv_encrypt_mode();
  objc_msgSend(a1, "length");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", ccsiv_plaintext_size());
  ccaes_siv_decrypt_mode();
  objc_msgSend(v6, "length");
  objc_msgSend(objc_retainAutorelease(v6), "bytes");
  objc_msgSend(v7, "length");
  objc_msgSend(objc_retainAutorelease(v7), "bytes");
  objc_msgSend(a1, "length");
  objc_msgSend(objc_retainAutorelease(a1), "bytes");
  v9 = objc_retainAutorelease(v8);
  objc_msgSend(v9, "mutableBytes");
  if (ccsiv_one_shot())
    goto LABEL_3;
LABEL_6:

  return v9;
}

- (uint64_t)fc_bigEndianCompareAsUnsignedInteger:()FCAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;

  v4 = a3;
  v5 = objc_retainAutorelease(a1);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_retainAutorelease(v4);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v5, "length");
  if (objc_msgSend(v7, "length") | v9)
  {
    v10 = 0;
    v11 = 0;
    do
    {
      v12 = objc_msgSend(v5, "length");
      if (v12 <= objc_msgSend(v7, "length"))
      {
        v17 = objc_msgSend(v7, "length");
        if (v17 <= objc_msgSend(v5, "length"))
        {
          v15 = *(unsigned __int8 *)(v6 + v11);
          v16 = *(unsigned __int8 *)(v8 + v11);
        }
        else
        {
          v18 = objc_msgSend(v7, "length");
          v19 = objc_msgSend(v5, "length");
          v16 = *(unsigned __int8 *)(v8 + v11);
          if (v11 >= v18 - v19)
            v15 = *(unsigned __int8 *)(v6 + v19 - v18 + v11);
          else
            v15 = 0;
        }
      }
      else
      {
        v13 = objc_msgSend(v5, "length");
        v14 = objc_msgSend(v7, "length");
        v15 = *(unsigned __int8 *)(v6 + v11);
        if (v11 >= v13 - v14)
          v16 = *(unsigned __int8 *)(v8 + v14 - v13 + v11);
        else
          v16 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "compare:", v21);

      if (v22 == 1 || v22 == -1)
      {
        v23 = 1;
        v10 = v22;
      }
      else
      {
        v23 = 0;
      }
      v24 = objc_msgSend(v5, "length");
      v25 = objc_msgSend(v7, "length");
      if (v24 <= v25)
        v26 = v25;
      else
        v26 = v24;
      if ((v23 & 1) != 0)
        break;
      ++v11;
    }
    while (v11 < v26);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
