@implementation _DPPrioSeedablePRNG

+ (id)randomDataFromSeed:(id)a3 length:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  const void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  id v27;
  _CCCryptor *v28;
  id v29;
  const void *v30;
  size_t v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unsigned int v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v45;
  id v46;
  NSObject *v47;
  id v48;
  CCCryptorRef cryptorRef;

  v6 = a3;
  v7 = objc_msgSend(v6, "length");
  if (v7 == objc_msgSend(a1, "seedLength"))
  {
    objc_msgSend(v6, "subdataWithRange:", 0, 16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subdataWithRange:", 16, 16);
    cryptorRef = 0;
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const void *)objc_msgSend(v9, "bytes");
    v11 = objc_retainAutorelease(v8);
    v12 = CCCryptorCreateWithMode(0, 4u, 0, 0, v10, (const void *)-[NSObject bytes](v11, "bytes"), 0x10uLL, 0, 0, 0, 2u, &cryptorRef);
    if ((_DWORD)v12)
    {
      v13 = v12;
      +[_DPLog framework](_DPLog, "framework");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[_DPPrioSeedablePRNG randomDataFromSeed:length:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
      v21 = 0;
    }
    else
    {
      v46 = v9;
      v47 = v11;
      v48 = v6;
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * a4);
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v22 = -[NSObject mutableBytes](v45, "mutableBytes");
      v23 = (a4 >> 2) & 0xFFFFFFFFFFFFFFFLL;
      if (v23 >= 0xFFF)
        v23 = 4095;
      v24 = 16 * v23 + 16;
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
      {
        v26 = 0;
        while (1)
        {
          v27 = objc_retainAutorelease(v25);
          bzero((void *)objc_msgSend(v27, "mutableBytes"), objc_msgSend(v27, "length"));
          v28 = cryptorRef;
          v29 = objc_retainAutorelease(v27);
          v30 = (const void *)objc_msgSend(v29, "bytes");
          v31 = objc_msgSend(v29, "length");
          v32 = objc_retainAutorelease(v29);
          v33 = CCCryptorUpdate(v28, v30, v31, (void *)objc_msgSend(v32, "mutableBytes"), objc_msgSend(v32, "length"), 0);
          if ((_DWORD)v33)
            break;
          if (v26 < a4)
          {
            v34 = 0;
            do
            {
              v35 = *(_DWORD *)(objc_msgSend(objc_retainAutorelease(v32), "bytes") + v34);
              if (v35 <= 0xFFF00000)
                *(_DWORD *)(v22 + 4 * v26++) = v35;
              v34 += 4;
            }
            while (v34 < v24 && v26 < a4);
          }
          if (v26 >= a4)
            goto LABEL_21;
        }
        v36 = v33;
        +[_DPLog framework](_DPLog, "framework");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          +[_DPPrioSeedablePRNG randomDataFromSeed:length:].cold.1(v36, v37, v38, v39, v40, v41, v42, v43);

        CCCryptorRelease(cryptorRef);
        v21 = 0;
        v11 = v47;
        v6 = v48;
        v14 = v45;
        v9 = v46;
      }
      else
      {
LABEL_21:
        CCCryptorRelease(cryptorRef);
        v14 = v45;
        v21 = v45;
        v11 = v47;
        v6 = v48;
        v9 = v46;
      }

    }
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[_DPPrioSeedablePRNG randomDataFromSeed:length:].cold.3(v11);
    v21 = 0;
  }

  return v21;
}

+ (id)generateSeed
{
  size_t v2;
  id v3;

  v2 = +[_DPPrioSeedablePRNG seedLength](_DPPrioSeedablePRNG, "seedLength");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v2);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  arc4random_buf((void *)objc_msgSend(v3, "mutableBytes"), v2);
  return v3;
}

+ (unint64_t)seedLength
{
  return 32;
}

+ (void)randomDataFromSeed:(uint64_t)a3 length:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1D3FAA000, a2, a3, "Failed call to CCCryptorUpdate %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

+ (void)randomDataFromSeed:(uint64_t)a3 length:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1D3FAA000, a2, a3, "Failed to create cryptor %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

+ (void)randomDataFromSeed:(os_log_t)log length:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_ERROR, "_DPPrioSeedablePRNG's seed is with wrong length!", v1, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
