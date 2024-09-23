@implementation NSData(FCANEF)

- (id)fc_anefEncryptWithKey:()FCANEF
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  int v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  int v26;
  _QWORD v27[5];
  id v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(a1, "fc_anefKeyIsValid:", v4) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", objc_msgSend(a1, "length") + 28);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "fc_randomDataWithLength:", 12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_retainAutorelease(v5);
    v8 = objc_msgSend(v7, "mutableBytes");
    v9 = objc_retainAutorelease(v6);
    v10 = objc_msgSend(v9, "bytes");
    v11 = *(_DWORD *)(v10 + 8);
    *(_QWORD *)v8 = *(_QWORD *)v10;
    *(_DWORD *)(v8 + 8) = v11;
    v12 = objc_retainAutorelease(v4);
    objc_msgSend(v12, "bytes");
    objc_msgSend(v12, "length");
    v13 = objc_retainAutorelease(v9);
    objc_msgSend(v13, "bytes");
    v14 = objc_retainAutorelease(a1);
    objc_msgSend(v14, "bytes");
    v15 = objc_msgSend(v14, "length");
    v16 = objc_retainAutorelease(v7);
    v23 = objc_msgSend(v16, "mutableBytes") + 12;
    v17 = CCCryptorGCMOneshotEncrypt();
    v18 = objc_retainAutorelease(v16);
    v19 = objc_msgSend(v18, "mutableBytes", v15, v23, &v29, 16);
    v20 = objc_msgSend(v14, "length");
    *(_OWORD *)(v19 + v20 + 12) = v29;
    if (v17)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __40__NSData_FCANEF__fc_anefEncryptWithKey___block_invoke_2;
      v24[3] = &unk_1E46452A8;
      v26 = v17;
      v24[4] = v14;
      v25 = v12;
      __40__NSData_FCANEF__fc_anefEncryptWithKey___block_invoke_2((uint64_t)v24);
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = v18;
    }

  }
  else
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __40__NSData_FCANEF__fc_anefEncryptWithKey___block_invoke;
    v27[3] = &unk_1E463D4B8;
    v27[4] = a1;
    v28 = v4;
    __40__NSData_FCANEF__fc_anefEncryptWithKey___block_invoke((uint64_t)v27);
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

- (id)fc_anefDecryptWithKey:()FCANEF
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  int v11;
  id v12;
  _QWORD v14[5];
  id v15;
  int v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  if ((objc_msgSend(a1, "fc_anefKeyIsValid:", v4) & 1) != 0)
  {
    if ((unint64_t)objc_msgSend(a1, "length") < 0x1D)
    {
      v12 = 0;
    }
    else
    {
      v5 = objc_retainAutorelease(a1);
      objc_msgSend(v5, "bytes");
      v6 = objc_retainAutorelease(v5);
      objc_msgSend(v6, "bytes");
      objc_msgSend(v6, "length");
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", objc_msgSend(v6, "length") - 28);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_retainAutorelease(v4);
      objc_msgSend(v8, "bytes");
      objc_msgSend(v8, "length");
      v9 = objc_retainAutorelease(v6);
      objc_msgSend(v9, "bytes");
      objc_msgSend(v9, "length");
      v10 = objc_retainAutorelease(v7);
      objc_msgSend(v10, "mutableBytes");
      v11 = CCCryptorGCMOneshotDecrypt();
      if (v11)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __40__NSData_FCANEF__fc_anefDecryptWithKey___block_invoke_2;
        v14[3] = &unk_1E46452A8;
        v16 = v11;
        v14[4] = v9;
        v15 = v8;
        __40__NSData_FCANEF__fc_anefDecryptWithKey___block_invoke_2((uint64_t)v14);
        v12 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = v10;
      }

    }
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40__NSData_FCANEF__fc_anefDecryptWithKey___block_invoke;
    v17[3] = &unk_1E463D4B8;
    v17[4] = a1;
    v18 = v4;
    __40__NSData_FCANEF__fc_anefDecryptWithKey___block_invoke((uint64_t)v17);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (uint64_t)fc_anefKeyIsValid:()FCANEF
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "length");
  return (v3 < 0x21) & (0x101010000uLL >> v3);
}

@end
