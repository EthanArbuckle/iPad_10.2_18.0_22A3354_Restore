@implementation NSString(SGNSString)

- (uint64_t)sg_streamBytesUsingEncoding:()SGNSString toBlock:
{
  return objc_msgSend(a1, "sg_streamBytesUsingEncoding:nullTerminated:toBlock:", a3, nullTerminationSupportedForEncoding(a3), a4);
}

- (void)sg_streamBytesUsingEncoding:()SGNSString nullTerminated:toBlock:
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t (**v14)(id, uint64_t, uint64_t);

  v14 = a5;
  objc_msgSend(a1, "sg_dataEnumeratorUsingEncoding:nullTerminated:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  while (1)
  {
    v10 = (void *)MEMORY[0x1A8583A40]();
    objc_msgSend(v8, "nextObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v10);

    if (!v11)
      break;
    v12 = (void *)MEMORY[0x1A8583A40]();
    v9 = objc_retainAutorelease(v11);
    v13 = v14[2](v14, objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
    objc_autoreleasePoolPop(v12);
    if ((v13 & 1) == 0)
      goto LABEL_6;
  }
  v9 = 0;
LABEL_6:

}

- (uint64_t)sg_dataEnumeratorUsingEncoding:()SGNSString
{
  return objc_msgSend(a1, "sg_dataEnumeratorUsingEncoding:nullTerminated:", a3, nullTerminationSupportedForEncoding(a3));
}

- (_SGNSStringEncodingEnumerator)sg_dataEnumeratorUsingEncoding:()SGNSString nullTerminated:
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v12;
  const UniChar *CharactersPtr;
  const UniChar *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _SGNSStringEncodingEnumerator *v23;
  const char *CStringPtr;
  const char *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  void *v37;
  id v38;
  void *v39;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[5];
  _QWORD v50[5];
  void *v51;
  void *v52;
  uint64_t v53;
  _QWORD v54[2];
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  if ((_DWORD)a4 && (nullTerminationSupportedForEncoding(a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSString+SGNSString.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nullTerminationSupportedForEncoding(encoding)"));

  }
  v8 = -[__CFString length](a1, "length");
  if (v8)
  {
    v9 = v8;
    if (a3 == 10 || a3 == 2483028224 || a3 == 2415919360)
    {
      v10 = -[__CFString fastestEncoding](a1, "fastestEncoding");
      v12 = a3 != 2483028224 || v10 != 10;
      if (v10 == a3 || !v12)
      {
        CharactersPtr = CFStringGetCharactersPtr(a1);
        if (CharactersPtr)
        {
          v14 = CharactersPtr;
          v15 = (void *)MEMORY[0x1A8583A40]();
          v16 = objc_alloc(MEMORY[0x1E0C99D50]);
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __70__NSString_SGNSString__sg_dataEnumeratorUsingEncoding_nullTerminated___block_invoke;
          v50[3] = &unk_1E4762030;
          v50[4] = a1;
          v17 = objc_msgSend(v16, "initWithBytesNoCopy:length:deallocator:", v14, 2 * v9, v50);
          v18 = (void *)v17;
          if (a3 == 10)
          {
            bomData();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v54[0] = v19;
            v54[1] = v18;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v53 = v17;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v20, "objectEnumerator");
          v23 = (_SGNSStringEncodingEnumerator *)objc_claimAutoreleasedReturnValue();

          goto LABEL_30;
        }
      }
LABEL_44:
      v23 = -[_SGNSStringEncodingEnumerator initWithString:encoding:nullTerminated:]([_SGNSStringEncodingEnumerator alloc], "initWithString:encoding:nullTerminated:", a1, a3, a4);
      return v23;
    }
    if (a3 != 4 && a3 != 1)
      goto LABEL_44;
    v15 = (void *)MEMORY[0x1A8583A40]();
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
    if (CStringPtr)
    {
      v25 = CStringPtr;
      v26 = (void *)MEMORY[0x1A8583A40]();
      v27 = objc_alloc(MEMORY[0x1E0C99D50]);
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __70__NSString_SGNSString__sg_dataEnumeratorUsingEncoding_nullTerminated___block_invoke_2;
      v49[3] = &unk_1E4762030;
      v49[4] = a1;
      v28 = (void *)objc_msgSend(v27, "initWithBytesNoCopy:length:deallocator:", v25, v9 + a4, v49);
      v52 = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectEnumerator");
      v23 = (_SGNSStringEncodingEnumerator *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v26);
      goto LABEL_30;
    }
    if (a3 != 4 || -[__CFString fastestEncoding](a1, "fastestEncoding") != 4)
    {
      objc_autoreleasePoolPop(v15);
      goto LABEL_44;
    }
    v30 = (void *)MEMORY[0x1A8583A40]();
    -[__CFString dataUsingEncoding:](a1, "dataUsingEncoding:", 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v30);
    v31 = objc_msgSend(v21, "length");
    if (v31)
    {
      v32 = v31;
      nullByteData();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v32 - 1;
      v35 = objc_msgSend(v21, "rangeOfData:options:range:", v33, 0, v32 - 1, 1);

      if (v35 == 0x7FFFFFFFFFFFFFFFLL)
        v36 = 1;
      else
        v36 = a4;
      if (v36)
        v34 = v32;
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __70__NSString_SGNSString__sg_dataEnumeratorUsingEncoding_nullTerminated___block_invoke_3;
      v43[3] = &unk_1E4762058;
      v46 = 0;
      v47 = v34;
      v48 = v32;
      v38 = v37;
      v44 = v38;
      v45 = v21;
      objc_msgSend(v45, "enumerateByteRangesUsingBlock:", v43);
      if ((_DWORD)a4 && v35 == 0x7FFFFFFFFFFFFFFFLL)
      {
        nullByteData();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObject:", v39);

      }
      objc_msgSend(v38, "objectEnumerator");
      v23 = (_SGNSStringEncodingEnumerator *)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
    if ((a4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C9AA60], "objectEnumerator");
      v23 = (_SGNSStringEncodingEnumerator *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    nullByteData();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectEnumerator");
    v23 = (_SGNSStringEncodingEnumerator *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x1A8583A40]();
    if ((a4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C9AA60], "objectEnumerator");
      v23 = (_SGNSStringEncodingEnumerator *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    nullByteData();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectEnumerator");
    v23 = (_SGNSStringEncodingEnumerator *)objc_claimAutoreleasedReturnValue();
  }

LABEL_22:
LABEL_30:
  objc_autoreleasePoolPop(v15);
  return v23;
}

- (id)sg_md5Hash
{
  const char *v1;
  CC_LONG v2;
  id v3;
  unsigned __int8 md[8];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  *(_QWORD *)md = 0;
  v6 = 0;
  v2 = strlen(v1);
  CC_MD5(v1, v2, md);
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X"), md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], v6, BYTE1(v6), BYTE2(v6), BYTE3(v6), BYTE4(v6), BYTE5(v6), BYTE6(v6), HIBYTE(v6));
}

@end
