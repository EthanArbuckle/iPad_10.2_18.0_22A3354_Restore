@implementation NSString(MimeHeaderEncoding)

- (id)mf_encodedHeaderDataWithEncodingHint:()MimeHeaderEncoding
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  char *v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  int v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  CFStringEncoding v23;
  uint64_t v24;
  MFBufferedDataConsumer *v25;
  unint64_t v26;
  __CFData *Mutable;
  uint64_t v28;
  CFIndex v29;
  UInt8 *MutableBytePtr;
  CFIndex Bytes;
  CFIndex v32;
  CFIndex v33;
  CFIndex location;
  CFIndex v35;
  UInt8 *v36;
  void *v37;
  BOOL v38;
  CFIndex v39;
  uint64_t v40;
  id v41;
  CFIndex v42;
  __CFData *v43;
  char v44;
  unint64_t v45;
  CFIndex v46;
  CFIndex v47;
  CFRange RangeOfComposedCharactersAtIndex;
  UInt8 *v49;
  unint64_t v50;
  MFQuotedPrintableEncoder *v51;
  MFData *v52;
  UInt8 *v53;
  CFIndex v54;
  MFQuotedPrintableEncoder *v55;
  MFData *v56;
  void *v57;
  MFBufferedDataConsumer *v58;
  void *v59;
  MFQuotedPrintableEncoder *v60;
  id v61;
  CFDataRef ExternalRepresentation;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  id v67;
  MFData *v68;
  void *v69;
  void *v70;
  id v71;
  MFData *v72;
  unint64_t v73;
  void *v74;
  void *v75;
  id v76;
  CFStringEncoding v77;
  id v78;
  MFBufferedDataConsumer *v79;
  const __CFString *theString;
  CFIndex length;
  _BYTE extraLength[12];
  __int16 v83;
  unint64_t v84;
  __int16 v85;
  CFStringEncoding v86;
  __int16 v87;
  void *v88;
  uint64_t v89;
  CFRange v90;
  CFRange v91;

  v3 = a3;
  v89 = *MEMORY[0x1E0C80C00];
  if ((_DWORD)a3 == -1)
  {
    -[__CFString mf_bestMimeCharset](a1, "mf_bestMimeCharset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "cfStringEncoding");

  }
  if ((_DWORD)v3 != 1536)
  {
    if (MFStringCanBeConvertedLosslessly(a1, 0x600u))
    {
      v3 = 1536;
      goto LABEL_7;
    }
    if (MFStringCanBeConvertedLosslessly(a1, v3))
    {
LABEL_7:
      +[MFMimeCharset charsetForEncoding:](MFMimeCharset, "charsetForEncoding:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        goto LABEL_9;
    }
  }
  -[__CFString mf_bestMimeCharset](a1, "mf_bestMimeCharset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v74 = v6;
  if (objc_msgSend(v6, "cfStringEncoding") == 1536
    && ((unint64_t)-[__CFString length](a1, "length") < 2
     || (-[__CFString hasPrefix:](a1, "hasPrefix:", CFSTR("=?")) & 1) == 0))
  {
    -[__CFString rangeOfString:](a1, "rangeOfString:", CFSTR(" =?"));
    if (!v7)
    {
      -[__CFString rangeOfString:](a1, "rangeOfString:", CFSTR("\t=?"));
      if (!v8)
      {
        v61 = (id)MFCreateDataWithString(a1, objc_msgSend(v74, "cfStringEncoding"), 0);
        goto LABEL_71;
      }
    }
  }
  if ((objc_msgSend(v74, "useBase64InHeaders") & 1) != 0)
  {
    v75 = 0;
    v9 = 1;
  }
  else
  {
    v10 = (void *)MFCreateDataWithString(a1, objc_msgSend(v74, "cfStringEncoding"), 0);
    v11 = objc_msgSend(v10, "length");
    v12 = objc_retainAutorelease(v10);
    v13 = objc_msgSend(v12, "bytes");
    v75 = v12;
    if (v11 < 1)
    {
      v15 = 0;
    }
    else
    {
      v14 = (char *)v13;
      v15 = 0;
      v16 = v13 + v11;
      v17 = MEMORY[0x1E0C80978];
      do
      {
        v18 = *v14;
        if ((v18 & 0x80000000) != 0)
          v19 = __maskrune(v18, 0x40000uLL);
        else
          v19 = *(_DWORD *)(v17 + 4 * v18 + 60) & 0x40000;
        if (!v19)
          ++v15;
        ++v14;
      }
      while ((unint64_t)v14 < v16);
    }
    v9 = 3 * v11 < (unint64_t)(4 * v15);
  }
  v20 = (void *)objc_msgSend(CFSTR("=?"), "mutableCopyWithZone:", 0);
  objc_msgSend(v74, "charsetName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendString:", v21);

  objc_msgSend(v20, "appendString:", CFSTR("?"));
  if (v9)
    v22 = CFSTR("B");
  else
    v22 = CFSTR("Q");
  objc_msgSend(v20, "appendString:", v22);
  objc_msgSend(v20, "appendString:", CFSTR("?"));
  v69 = v20;
  v70 = (void *)MFCreateDataWithString(v20, 0x600u, 0);
  theString = a1;
  if (v9)
  {
    v23 = objc_msgSend(v74, "cfStringEncoding");
    v24 = objc_msgSend(v70, "length");
    v76 = v75;
    v78 = v70;
    v25 = (MFBufferedDataConsumer *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DF0]), "init");
    v26 = 3 * ((unint64_t)(64 - v24) >> 2);
    if (v76 && objc_msgSend(v76, "length") <= v26)
    {
      -[MFBufferedDataConsumer appendData:](v25, "appendData:", v78);
      objc_msgSend(v76, "mf_encodeBase64HeaderData");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFBufferedDataConsumer appendData:](v25, "appendData:", v57);

      -[MFBufferedDataConsumer mf_appendCString:](v25, "mf_appendCString:", "?=");
    }
    else
    {
      Mutable = CFDataCreateMutable(0, 3 * ((unint64_t)(64 - v24) >> 2));
      v28 = CFStringGetLength(theString);
      length = 0xAAAAAAAAAAAAAAAALL;
      if (v28 >= 1)
      {
        v29 = 0;
        while (1)
        {
          CFDataSetLength(Mutable, v26);
          MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
          v90.location = v29;
          v90.length = v28;
          Bytes = MFStringGetBytes(theString, v90, v23, 0, 0, MutableBytePtr, v26, &length);
          v32 = Bytes;
          if (Bytes < v28)
          {
            v33 = Bytes + v29;
            location = CFStringGetRangeOfComposedCharactersAtIndex(theString, Bytes + v29).location;
            if (location < v33)
            {
              v35 = location - v29;
              if (location > v29)
              {
                v36 = CFDataGetMutableBytePtr(Mutable);
                v91.location = v29;
                v91.length = v35;
                MFStringGetBytes(theString, v91, v23, 0, 0, v36, v26, &length);
                v32 = v35;
              }
            }
          }
          if (length > v26)
            break;
          CFDataSetLength(Mutable, length);
          if (-[MFBufferedDataConsumer length](v25, "length"))
            -[MFBufferedDataConsumer mf_appendCString:](v25, "mf_appendCString:", "\n ");
          -[MFBufferedDataConsumer appendData:](v25, "appendData:", v78);
          -[__CFData mf_encodeBase64HeaderData](Mutable, "mf_encodeBase64HeaderData");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFBufferedDataConsumer appendData:](v25, "appendData:", v37);

          -[MFBufferedDataConsumer mf_appendCString:](v25, "mf_appendCString:", "?=");
          v38 = v28 <= v32;
          v28 -= v32;
          if (v38)
            v39 = 0;
          else
            v39 = v32;
          if (!v38)
          {
            v29 += v39;
            if (v28 > 0)
              continue;
          }
          goto LABEL_47;
        }
        ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theString, v23, 0x3Fu);
        -[__CFData ef_hexString](ExternalRepresentation, "ef_hexString");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        MFLogGeneral();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)extraLength = 134218754;
          *(_QWORD *)&extraLength[4] = length;
          v83 = 2048;
          v84 = v26;
          v85 = 1024;
          v86 = v23;
          v87 = 2112;
          v88 = v64;
          _os_log_error_impl(&dword_1ABB13000, v65, OS_LOG_TYPE_ERROR, "Error during base64 encoding: chunkLength=%ld maxInputBytesPerChunk=%lu encoding=%d str=%@", extraLength, 0x26u);
        }

        CFRelease(ExternalRepresentation);
        CFRelease(Mutable);
        MFLogGeneral();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
          -[NSString(MimeHeaderEncoding) mf_encodedHeaderDataWithEncodingHint:].cold.1(v66);

        v59 = 0;
        v58 = v25;
        goto LABEL_70;
      }
LABEL_47:
      if (Mutable)
        CFRelease(Mutable);
    }
    v58 = v25;
    v59 = v58;
  }
  else
  {
    v77 = objc_msgSend(v74, "cfStringEncoding");
    v40 = objc_msgSend(v70, "length");
    v67 = v75;
    v71 = v70;
    v79 = objc_alloc_init(MFBufferedDataConsumer);
    v72 = -[MFData initWithBytesNoCopy:length:freeWhenDone:]([MFData alloc], "initWithBytesNoCopy:length:freeWhenDone:", "?=", 2, 0);
    v73 = 64 - v40;
    if (v67
      && (v41 = objc_retainAutorelease(v67),
          +[MFQuotedPrintableEncoder requiredSizeToEncodeHeaderBytes:length:](MFQuotedPrintableEncoder, "requiredSizeToEncodeHeaderBytes:length:", objc_msgSend(v41, "bytes"), objc_msgSend(v41, "length")) <= v73))
    {
      -[MFBufferedDataConsumer appendData:](v79, "appendData:", v71);
      v60 = -[MFBaseFilterDataConsumer initWithConsumer:]([MFQuotedPrintableEncoder alloc], "initWithConsumer:", v79);
      -[MFQuotedPrintableEncoder setForHeader:](v60, "setForHeader:", 1);
      -[MFQuotedPrintableEncoder appendData:](v60, "appendData:", v41);
      -[MFQuotedPrintableEncoder done](v60, "done");
      -[MFBufferedDataConsumer appendData:](v79, "appendData:", v72);

    }
    else
    {
      v42 = CFStringGetLength(a1);
      v43 = CFDataCreateMutable(0, 0);
      v68 = -[MFData initWithBytesNoCopy:length:freeWhenDone:]([MFData alloc], "initWithBytesNoCopy:length:freeWhenDone:", "\n ", 2, 0);
      if (v42 >= 1)
      {
        v44 = 0;
        v45 = 0;
        v46 = 0;
        v47 = 0;
        do
        {
          RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(theString, v47);
          *(_QWORD *)extraLength = 0xAAAAAAAAAAAAAAAALL;
          MFStringGetBytes(theString, RangeOfComposedCharactersAtIndex, v77, 0, 0, 0, 0, (CFIndex *)extraLength);
          CFDataIncreaseLength(v43, *(CFIndex *)extraLength);
          v49 = &CFDataGetMutableBytePtr(v43)[v46];
          MFStringGetBytes(theString, RangeOfComposedCharactersAtIndex, v77, 0, 0, v49, *(CFIndex *)extraLength, 0);
          v50 = +[MFQuotedPrintableEncoder requiredSizeToEncodeHeaderBytes:length:](MFQuotedPrintableEncoder, "requiredSizeToEncodeHeaderBytes:length:", v49, *(_QWORD *)extraLength);
          v45 += v50;
          if (v45 <= v73)
          {
            v46 = CFDataGetLength(v43);
          }
          else
          {
            if ((v44 & 1) != 0)
              -[MFBufferedDataConsumer appendData:](v79, "appendData:", v68);
            -[MFBufferedDataConsumer appendData:](v79, "appendData:", v71);
            v51 = -[MFBaseFilterDataConsumer initWithConsumer:]([MFQuotedPrintableEncoder alloc], "initWithConsumer:", v79);
            -[MFQuotedPrintableEncoder setForHeader:](v51, "setForHeader:", 1);
            v52 = -[MFData initWithBytesNoCopy:length:freeWhenDone:]([MFData alloc], "initWithBytesNoCopy:length:freeWhenDone:", CFDataGetBytePtr(v43), v46, 0);
            -[MFQuotedPrintableEncoder appendData:](v51, "appendData:", v52);
            -[MFQuotedPrintableEncoder done](v51, "done");
            -[MFBufferedDataConsumer appendData:](v79, "appendData:", v72);
            v53 = CFDataGetMutableBytePtr(v43);
            memmove(v53, v49, *(size_t *)extraLength);
            CFDataSetLength(v43, *(CFIndex *)extraLength);
            v46 = *(_QWORD *)extraLength;

            v44 = 1;
            v45 = v50;
          }
          v54 = v42 + v47;
          v47 = RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length;
          v42 = v54 - (RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length);
        }
        while (v42 > 0);
        if (v46)
        {
          if ((v44 & 1) != 0)
            -[MFBufferedDataConsumer appendData:](v79, "appendData:", v68);
          -[MFBufferedDataConsumer appendData:](v79, "appendData:", v71);
          v55 = -[MFBaseFilterDataConsumer initWithConsumer:]([MFQuotedPrintableEncoder alloc], "initWithConsumer:", v79);
          -[MFQuotedPrintableEncoder setForHeader:](v55, "setForHeader:", 1);
          v56 = -[MFData initWithBytesNoCopy:length:freeWhenDone:]([MFData alloc], "initWithBytesNoCopy:length:freeWhenDone:", CFDataGetBytePtr(v43), v46, 0);
          -[MFQuotedPrintableEncoder appendData:](v55, "appendData:", v56);
          -[MFQuotedPrintableEncoder done](v55, "done");
          -[MFBufferedDataConsumer appendData:](v79, "appendData:", v72);

        }
      }
      if (v43)
        CFRelease(v43);

    }
    -[MFBufferedDataConsumer done](v79, "done");
    -[MFBufferedDataConsumer data](v79, "data");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = v79;
  }
LABEL_70:

  v61 = v59;
LABEL_71:

  return v61;
}

- (__CFString)mf_decodeMimeHeaderValueWithEncodingHint:()MimeHeaderEncoding
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  __CFString *v7;
  char v8;
  const __CFString *v9;
  int v10;
  __CFString *v11;
  void *v12;
  void *v13;
  BOOL v14;
  int v15;
  __CFString *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  NSObject *v29;
  id v30;
  __CFString *v32;
  __CFString *v33;
  id v35;
  CFStringEncoding SystemEncoding;
  id v37;
  id v38;
  __CFString *v39;
  uint8_t buf[4];
  __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  SystemEncoding = CFStringGetSystemEncoding();
  -[__CFString rangeOfString:](a1, "rangeOfString:", CFSTR("=?"));
  v5 = v4 == 0;
  if (!v4
    && (!-[__CFString hasPrefix:](a1, "hasPrefix:", CFSTR("?"))
     || (-[__CFString hasSuffix:](a1, "hasSuffix:", CFSTR("?=")) & 1) == 0))
  {
    return a1;
  }
  v35 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (!mf_decodeMimeHeaderValueWithEncodingHint__quSet)
    mf_decodeMimeHeaderValueWithEncodingHint__quSet = (uint64_t)CFCharacterSetCreateWithCharactersInString(0, CFSTR("?_"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", a1);
  objc_msgSend(v6, "setCharactersToBeSkipped:", 0);
  v32 = a1;
  v7 = 0;
  v8 = 0;
  while ((objc_msgSend(v6, "isAtEnd") & 1) == 0)
  {
    if (v5)
      v9 = CFSTR("?");
    else
      v9 = CFSTR("=?");
    v39 = v7;
    v10 = objc_msgSend(v6, "scanUpToString:intoString:", v9, &v39);
    v11 = v39;

    v7 = v11;
    if (v10)
    {
      if ((v8 & 1) == 0
        || (objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            -[__CFString stringByTrimmingCharactersInSet:](v11, "stringByTrimmingCharactersInSet:", v12),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "length") == 0,
            v13,
            v12,
            !v14))
      {
        objc_msgSend(v35, "appendString:", v7);
      }
    }
    if (objc_msgSend(v6, "mf_scanUpAndOverString:", v9))
    {
      v38 = 0;
      v15 = objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("?"), &v38);
      v16 = (__CFString *)v38;
      if (v15 && objc_msgSend(v6, "mf_scanUpAndOverString:", CFSTR("?")))
      {
        v17 = MFEncodingForCharsetWithFallback(v16, a3);
        if (v17 == -1)
          v18 = a3;
        else
          v18 = v17;
        v37 = 0;
        v8 = objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("?"), &v37);
        v33 = (__CFString *)v37;
        if ((v8 & 1) != 0)
        {
          objc_msgSend(v6, "mf_scanUpAndOverString:", CFSTR("?"));
          v19 = -[__CFString compare:options:](v33, "compare:options:", CFSTR("Q"), 1);
          if (!v19)
            goto LABEL_25;
          if (-[__CFString compare:options:](v33, "compare:options:", CFSTR("B"), 1))
          {
            MFLogGeneral();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v33;
              _os_log_impl(&dword_1ABB13000, v20, OS_LOG_TYPE_DEFAULT, "#Warning Never heard of a \"%@\" type encoding--treating as unencoded", buf, 0xCu);
            }

LABEL_25:
            v21 = 0;
            goto LABEL_34;
          }
          v21 = 1;
LABEL_34:
          while (1)
          {
            objc_msgSend(v6, "mf_nextTokenWithPunctuation:", mf_decodeMimeHeaderValueWithEncodingHint__quSet);
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

            if (!v23)
              break;
            if (-[__CFString isEqual:](v23, "isEqual:", CFSTR("_")))
            {

              v23 = CFSTR(" ");
            }
            else if (-[__CFString isEqual:](v23, "isEqual:", CFSTR("?"))
                   && (objc_msgSend(v6, "mf_scanUpAndOverString:", CFSTR("=")) & 1) != 0)
            {
              break;
            }
            v24 = (void *)MFCreateDataWithString(v23, SystemEncoding, 0);
            v25 = v24;
            if (v19)
            {
              if (v21)
              {
                objc_msgSend(v24, "mf_decodeBase64");
                v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v26 = v24;
              }
            }
            else
            {
              objc_msgSend(v24, "mf_decodeQuotedPrintableForText:", 1);
              v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            v27 = v26;
            if (v26)
            {
              v28 = MFCreateStringWithData(v26, v18, 0);
              if (v28 || (_DWORD)v18 != a3 && (v28 = MFCreateStringWithData(v27, a3, 0)) != 0)
              {
                objc_msgSend(v35, "appendString:", v28);
              }
              else
              {
                MFLogGeneral();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v41 = v27;
                  _os_log_impl(&dword_1ABB13000, v29, OS_LOG_TYPE_DEFAULT, "#Warning was unable to convert decoded data to a string: %@", buf, 0xCu);
                }

                v28 = 0;
              }

            }
            v7 = v23;
          }
        }
        else
        {
          MFLogGeneral();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v32;
            _os_log_impl(&dword_1ABB13000, v22, OS_LOG_TYPE_DEFAULT, "#Warning Missing encoding char (Q or B) in MIME header: \"%@\", buf, 0xCu);
          }

          v23 = v7;
        }

        v5 = 0;
        v7 = v23;
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
      v16 = 0;
    }

  }
  v30 = v35;

  return (__CFString *)v30;
}

- (id)mf_decodeMimeHeaderValueWithCharsetHint:()MimeHeaderEncoding
{
  __CFString *v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "mf_decodeMimeHeaderValueWithEncodingHint:", MFEncodingForCharset(v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)mf_encodedHeaderDataWithEncodingHint:()MimeHeaderEncoding .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1ABB13000, log, OS_LOG_TYPE_FAULT, "Error during base64 encoding, check logs for more information (<rdar://problem/27502664>)", v1, 2u);
}

@end
