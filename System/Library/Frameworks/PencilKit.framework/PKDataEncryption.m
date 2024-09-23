@implementation PKDataEncryption

+ (id)encryptData:(void *)a3 key:
{
  id v4;
  id v5;
  id v6;
  const void *v7;
  size_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  const void *v13;
  size_t v14;
  id v15;
  const void *v16;
  size_t v17;
  size_t dataOutMoved;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  dataOutMoved = 0;
  v6 = objc_retainAutorelease(v5);
  v7 = (const void *)objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  v9 = objc_retainAutorelease(v4);
  v10 = 0;
  if (CCCrypt(0, 0, 1u, v7, v8, 0, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), 0, 0, &dataOutMoved) == -4301)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", dataOutMoved);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_retainAutorelease(v6);
    v13 = (const void *)objc_msgSend(v12, "bytes");
    v14 = objc_msgSend(v12, "length");
    v15 = objc_retainAutorelease(v9);
    v16 = (const void *)objc_msgSend(v15, "bytes");
    v17 = objc_msgSend(v15, "length");
    v10 = objc_retainAutorelease(v11);
    if (CCCrypt(0, 0, 1u, v13, v14, 0, v16, v17, (void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), &dataOutMoved))
    {

      v10 = 0;
    }
    else
    {
      objc_msgSend(v10, "setLength:", dataOutMoved);
    }
  }

  return v10;
}

+ (id)decryptFile:(void *)a3 key:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  const void *v12;
  size_t v13;
  id v14;
  CCCryptorStatus v15;
  id v16;
  void *v17;
  id v18;
  const void *v19;
  size_t v20;
  id v21;
  const void *v22;
  size_t v23;
  size_t dataOutMoved;

  v6 = a3;
  v7 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v7, 1, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v8, "length"))
  {
    v9 = v8;
    v10 = v6;
    objc_opt_self();
    dataOutMoved = 0;
    v11 = objc_retainAutorelease(v10);
    v12 = (const void *)objc_msgSend(v11, "bytes");
    v13 = objc_msgSend(v11, "length");
    v14 = objc_retainAutorelease(v9);
    v15 = CCCrypt(1u, 0, 1u, v12, v13, 0, (const void *)objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), 0, 0, &dataOutMoved);
    v16 = 0;
    if (v15 == -4301)
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", dataOutMoved);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_retainAutorelease(v11);
      v19 = (const void *)objc_msgSend(v18, "bytes");
      v20 = objc_msgSend(v18, "length");
      v21 = objc_retainAutorelease(v14);
      v22 = (const void *)objc_msgSend(v21, "bytes");
      v23 = objc_msgSend(v21, "length");
      v16 = objc_retainAutorelease(v17);
      if (CCCrypt(1u, 0, 1u, v19, v20, 0, v22, v23, (void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"), &dataOutMoved))
      {

        v16 = 0;
      }
      else
      {
        objc_msgSend(v16, "setLength:", dataOutMoved);
      }
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (uint64_t)encryptData:(void *)a3 to:(void *)a4 key:(uint64_t)a5 error:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v8 = a3;
  v9 = a4;
  v10 = a2;
  v11 = objc_opt_self();
  +[PKDataEncryption encryptData:key:](v11, v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = objc_msgSend(v12, "writeToURL:options:error:", v8, 1, a5);
  else
    v13 = 0;

  return v13;
}

@end
