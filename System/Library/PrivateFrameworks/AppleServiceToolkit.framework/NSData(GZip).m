@implementation NSData(GZip)

- (id)dataGZipDeflated
{
  void *v2;
  void *v3;
  id v5;
  uint64_t *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  if (!objc_msgSend(a1, "length"))
    return a1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x9010000000;
  v14 = &unk_22D94F7AA;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 0x4000);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (deflateInit2_((z_streamp)(v12 + 4), 9, 8, 31, 9, 0, "1.2.12", 112))
  {
    v3 = 0;
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __32__NSData_GZip__dataGZipDeflated__block_invoke;
    v8[3] = &unk_24F96A1E8;
    v10 = &v11;
    v8[4] = a1;
    v5 = v2;
    v9 = v5;
    objc_msgSend(a1, "enumerateByteRangesUsingBlock:", v8);
    if (deflate((z_streamp)(v12 + 4), 4))
    {
      v6 = v12;
    }
    else
    {
      while (1)
      {
        v6 = v12;
        if (*((_DWORD *)v12 + 16))
          break;
        objc_msgSend(a1, "_resizeOutputBuffer:forStream:", v5, v12 + 4);
        deflate((z_streamp)(v12 + 4), 4);
      }
    }
    deflateEnd((z_streamp)(v6 + 4));
    objc_msgSend(v5, "setLength:", v12[9]);
    if (*((_DWORD *)v12 + 10))
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  v7 = v3;

  _Block_object_dispose(&v11, 8);
  return v7;
}

- (void)_resizeOutputBuffer:()GZip forStream:
{
  id v5;
  unint64_t v6;
  id v7;

  v5 = a3;
  v6 = *(_QWORD *)(a4 + 40);
  if (v6 >= objc_msgSend(v5, "length"))
    objc_msgSend(v5, "increaseLengthBy:", 0x4000);
  *(_DWORD *)(a4 + 32) = objc_msgSend(v5, "length") - *(_DWORD *)(a4 + 40);
  v7 = objc_retainAutorelease(v5);
  *(_QWORD *)(a4 + 24) = objc_msgSend(v7, "mutableBytes") + *(_QWORD *)(a4 + 40);

}

@end
