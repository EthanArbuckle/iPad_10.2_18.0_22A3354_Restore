@implementation NSMutableData(RFC2231Support)

- (void)mf_appendRFC2231CompliantValue:()RFC2231Support forKey:
{
  __CFString *v6;
  id v7;
  CFIndex v8;
  void *v9;
  void *v10;
  CFIndex v11;
  int v12;
  __int128 v13;
  CFIndex Bytes;
  uint64_t v15;
  unsigned __int8 *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unsigned __int8 *v26;
  _OWORD *v27;
  unsigned __int8 *v28;
  unsigned __int8 *v29;
  id v30;
  CFStringEncoding v31;
  void *v32;
  __CFString *v33;
  uint64_t v34;
  CFIndex v35;
  char v36[24];
  _OWORD v37[4];
  uint64_t v38;
  CFRange v39;
  CFRange v40;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v33 = v6;
  if (v6 && v7)
  {
    v30 = v7;
    objc_msgSend(v7, "dataUsingEncoding:allowLossyConversion:", 1, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (mf_appendRFC2231CompliantValue_forKey__onceToken != -1)
      dispatch_once(&mf_appendRFC2231CompliantValue_forKey__onceToken, &__block_literal_global_7);
    v8 = -[__CFString length](v6, "length");
    v40.location = 0;
    v40.length = v8;
    if (CFStringFindCharacterFromSet(v33, (CFCharacterSetRef)mf_appendRFC2231CompliantValue_forKey__specialCSet, v40, 0, 0))
    {
      -[__CFString mf_bestMimeCharset](v33, "mf_bestMimeCharset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v9, "cfStringEncoding");
      objc_msgSend(v9, "charsetName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
      v31 = 1536;
    }
    if (v8 >= 1)
    {
      v11 = 0;
      v12 = -1;
      while (1)
      {
        *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v37[2] = v13;
        v37[3] = v13;
        v37[0] = v13;
        v37[1] = v13;
        v35 = 0xAAAAAAAAAAAAAAAALL;
        v39.location = v11;
        v39.length = v8;
        Bytes = MFStringGetBytes(v33, v39, v31, 0, 0, (UInt8 *)v37, 64, &v35);
        objc_msgSend(a1, "mf_appendCString:", ";\n\t");
        objc_msgSend(a1, "appendData:", v32);
        if (v8 > Bytes || (v12 & 0x80000000) == 0)
        {
          memset(v36, 170, 20);
          objc_msgSend(a1, "appendBytes:length:", "*", 1);
          objc_msgSend(a1, "appendBytes:length:", v36, __snprintf_chk(v36, 0x14uLL, 0, 0x14uLL, "%d", ++v12));
        }
        v34 = v8 - Bytes;
        v15 = v35;
        v16 = (unsigned __int8 *)v37 + v35;
        if (v10)
          break;
        if (!mf_appendRFC2231CompliantValue_forKey__mimeNeedsQuoteByteSet)
        {
          v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EE88]), "initWithCString:", " ()<>@,;:\\\"/[]?=");
          v23 = (void *)mf_appendRFC2231CompliantValue_forKey__mimeNeedsQuoteByteSet;
          mf_appendRFC2231CompliantValue_forKey__mimeNeedsQuoteByteSet = v22;

          v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EE88]), "initWithCString:", "\"\\");
          v25 = (void *)mf_appendRFC2231CompliantValue_forKey__mimeNeedsEscapeByteSet;
          mf_appendRFC2231CompliantValue_forKey__mimeNeedsEscapeByteSet = v24;

        }
        objc_msgSend(a1, "appendBytes:length:", "=", 1);
        if (v15 >= 1)
        {
          v26 = (unsigned __int8 *)v37;
          while (!objc_msgSend((id)mf_appendRFC2231CompliantValue_forKey__mimeNeedsQuoteByteSet, "byteIsMember:", *v26))
          {
            if (++v26 >= v16)
            {
              v20 = 0;
              goto LABEL_27;
            }
          }
          v20 = (id)mf_appendRFC2231CompliantValue_forKey__mimeNeedsEscapeByteSet;
          objc_msgSend(a1, "appendBytes:length:", "\", 1);
          goto LABEL_27;
        }
        v20 = 0;
LABEL_41:
        v8 = v34;

        v11 += Bytes;
        if (v34 <= 0)
          goto LABEL_42;
      }
      v17 = (void *)mf_appendRFC2231CompliantValue_forKey__percentEscapeSet;
      if (!mf_appendRFC2231CompliantValue_forKey__percentEscapeSet)
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EF00]), "initWithRange:", 97, 26);
        objc_msgSend(v18, "addBytesInRange:", 48, 10);
        objc_msgSend(v18, "addBytesInRange:", 65, 26);
        objc_msgSend(v18, "addBytesInRange:", 47, 1);
        objc_msgSend(v18, "addBytesInRange:", 46, 1);
        objc_msgSend(v18, "invert");
        v19 = (void *)mf_appendRFC2231CompliantValue_forKey__percentEscapeSet;
        mf_appendRFC2231CompliantValue_forKey__percentEscapeSet = (uint64_t)v18;

        v17 = (void *)mf_appendRFC2231CompliantValue_forKey__percentEscapeSet;
      }
      v20 = v17;
      objc_msgSend(a1, "appendBytes:length:", "*=", 2);
      if (v12 <= 0)
      {
        objc_msgSend(v10, "dataUsingEncoding:allowLossyConversion:", 1, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "appendData:", v21);

        objc_msgSend(a1, "mf_appendCString:", "''");
      }
LABEL_27:
      if (v15 >= 1)
      {
        v27 = v37;
        v28 = (unsigned __int8 *)v37;
        v29 = (unsigned __int8 *)v37;
        do
        {
          if (objc_msgSend(v20, "byteIsMember:", *v28))
          {
            if (v28 > v29)
            {
              objc_msgSend(a1, "appendBytes:length:", v29, (char *)v27 - (char *)v29);
              v29 = v28;
            }
            if (v10)
            {
              *(_DWORD *)v36 = -1431655766;
              objc_msgSend(a1, "appendBytes:length:", v36, __snprintf_chk(v36, 4uLL, 0, 4uLL, "%%%02X", *v28));
              ++v29;
            }
            else
            {
              objc_msgSend(a1, "appendBytes:length:", "\\", 1);
            }
          }
          ++v28;
          v27 = (_OWORD *)((char *)v27 + 1);
        }
        while (v28 < v16);
        if (v28 > v29)
          objc_msgSend(a1, "appendBytes:length:", v29, (char *)v27 - (char *)v29);
      }
      if (!v10 && v20)
        objc_msgSend(a1, "appendBytes:length:", "\", 1);
      goto LABEL_41;
    }
LABEL_42:

    v7 = v30;
  }

}

@end
