@implementation CRXFCryptoFunctions

+ (BOOL)cryptFromText:(id)a3 withPassword:(id)a4 toText:(id *)a5 encrypt:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t *v15;
  unint64_t v16;
  size_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  void *v23;
  char *v24;
  char *v25;
  void *v26;
  const __SecRandom *v27;
  size_t v28;
  void *v29;
  const __SecRandom *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD *v34;
  __int128 v35;
  id v36;
  void *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id *v46;
  size_t passwordLena;
  id passwordLen;
  void *v49;
  char *__s;
  char *__sa;
  id v52;
  size_t v53;
  _QWORD bytes[2];

  v8 = a6;
  bytes[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v52 = a4;
  if (v8)
  {
    objc_msgSend(v11, "dataUsingEncoding:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v11, 0);
  }
  v13 = v12;
  if (!v12)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = MEMORY[0x24BDBD1B8];
    v20 = 34;
    goto LABEL_11;
  }
  v14 = objc_retainAutorelease(v12);
  v15 = (uint64_t *)objc_msgSend(v14, "bytes");
  v16 = objc_msgSend(v14, "length");
  v17 = v16;
  if (!v8)
  {
    if (v16 <= 7)
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = MEMORY[0x24BDBD1B8];
      v20 = 53;
      goto LABEL_11;
    }
    v22 = *v15++;
    bytes[0] = v22;
    v17 = v16 - 8;
LABEL_13:
    __s = (char *)objc_msgSend(objc_retainAutorelease(v52), "UTF8String");
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 16);
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 16);
    v24 = (char *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v8)
    {
      v46 = a5;
      v26 = v23;
      v27 = (const __SecRandom *)*MEMORY[0x24BDE94B8];
      v28 = objc_msgSend(v24, "length");
      v29 = (void *)objc_msgSend(objc_retainAutorelease(v25), "mutableBytes");
      v30 = v27;
      v23 = v26;
      if (SecRandomCopyBytes(v30, v28, v29))
      {
        v31 = (void *)MEMORY[0x24BDD1540];
        v32 = MEMORY[0x24BDBD1B8];
        v33 = 70;
LABEL_18:
        objc_msgSend(v31, "crxf_errorWithCode:file:line:userInfo:", 26, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCryptoFunctions.m", v33, v32);
        v21 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

        goto LABEL_33;
      }
    }
    else
    {
      if (v17 <= 0xF)
      {
        v31 = (void *)MEMORY[0x24BDD1540];
        v32 = MEMORY[0x24BDBD1B8];
        v33 = 76;
        goto LABEL_18;
      }
      v46 = a5;
      v34 = (_OWORD *)objc_msgSend(objc_retainAutorelease(v24), "mutableBytes");
      v35 = *(_OWORD *)v15;
      v15 += 2;
      *v34 = v35;
      v17 -= 16;
    }
    passwordLena = strlen(__s);
    v49 = v23;
    v36 = objc_retainAutorelease(v23);
    if (CCKeyDerivationPBKDF(2u, __s, passwordLena, (const uint8_t *)bytes, 8uLL, 1u, 0x2710u, (uint8_t *)objc_msgSend(v36, "mutableBytes"), objc_msgSend(v36, "length")))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 26, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCryptoFunctions.m", 102, MEMORY[0x24BDBD1B8]);
      v21 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = v36;
      __sa = v25;
      passwordLen = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v17 + 40));
      v38 = objc_msgSend(passwordLen, "mutableBytes");
      v39 = (char *)v38;
      if (v8)
      {
        *(_QWORD *)v38 = bytes[0];
        v40 = __sa;
        *(_OWORD *)(v38 + 8) = *(_OWORD *)objc_msgSend(objc_retainAutorelease(__sa), "bytes");
        v39 += 24;
      }
      else
      {
        v40 = __sa;
      }
      v53 = 0;
      v41 = objc_retainAutorelease(v37);
      if (CCCrypt(!v8, 0, 1u, (const void *)objc_msgSend(v41, "bytes"), objc_msgSend(v41, "length"), (const void *)objc_msgSend(objc_retainAutorelease(v40), "bytes"), v15, v17, v39, v17 + 16, &v53))
      {
        objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 26, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCryptoFunctions.m", 132, MEMORY[0x24BDBD1B8]);
        v21 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        v23 = v49;
        v25 = __sa;
        v42 = passwordLen;
      }
      else
      {
        v23 = v49;
        if (v8)
        {
          v42 = passwordLen;
          objc_msgSend(passwordLen, "setLength:", v53 + 24);
          objc_msgSend(passwordLen, "base64EncodedStringWithOptions:", 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v42 = passwordLen;
          objc_msgSend(passwordLen, "setLength:", v53);
          v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", passwordLen, 4);
        }
        v25 = __sa;
        v44 = v43;
        *v46 = v44;
        v21 = v44 != 0;
      }

    }
    goto LABEL_32;
  }
  if (!SecRandomCopyBytes((SecRandomRef)*MEMORY[0x24BDE94B8], 8uLL, bytes))
    goto LABEL_13;
  v18 = (void *)MEMORY[0x24BDD1540];
  v19 = MEMORY[0x24BDBD1B8];
  v20 = 47;
LABEL_11:
  objc_msgSend(v18, "crxf_errorWithCode:file:line:userInfo:", 26, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCryptoFunctions.m", v20, v19);
  v21 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v21;
}

+ (BOOL)encryptText:(id)a3 withPassword:(id)a4 toString:(id *)a5 error:(id *)a6
{
  return objc_msgSend(a1, "cryptFromText:withPassword:toText:encrypt:error:", a3, a4, a5, 1, a6);
}

+ (BOOL)decryptText:(id)a3 withPassword:(id)a4 toString:(id *)a5 error:(id *)a6
{
  return objc_msgSend(a1, "cryptFromText:withPassword:toText:encrypt:error:", a3, a4, a5, 0, a6);
}

@end
