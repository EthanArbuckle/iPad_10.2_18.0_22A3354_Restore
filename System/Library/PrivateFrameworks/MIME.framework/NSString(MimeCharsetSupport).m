@implementation NSString(MimeCharsetSupport)

- (uint64_t)mf_bestMimeCharset
{
  return objc_msgSend(a1, "mf_bestMimeCharsetUsingHint:", 0xFFFFFFFFLL);
}

- (id)_mf_bestMimeCharset:()MimeCharsetSupport
{
  id v4;
  uint64_t v5;
  BOOL CanBeConvertedLosslessly;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    CanBeConvertedLosslessly = 0;
    v7 = 0;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
      if (!objc_msgSend(v10, "coversLargeUnicodeSubset", (_QWORD)v14))
        goto LABEL_12;
      if ((v7 & 1) == 0)
        CanBeConvertedLosslessly = MFStringCanBeConvertedLosslessly(a1, 0);
      v7 = 1;
      if (!CanBeConvertedLosslessly)
        break;
      CanBeConvertedLosslessly = 1;
LABEL_15:
      if (v5 == ++v9)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_17;
      }
    }
    CanBeConvertedLosslessly = 0;
LABEL_12:
    if (objc_msgSend(v10, "cfStringEncoding") != 1586
      && MFStringCanBeConvertedLosslessly(a1, objc_msgSend(v10, "cfStringEncoding")))
    {
      v11 = v10;
      if (v11)
      {
        v12 = v11;
        goto LABEL_19;
      }
    }
    goto LABEL_15;
  }
LABEL_17:
  v12 = 0;
LABEL_19:

  return v12;
}

- (id)mf_bestMimeCharsetUsingHint:()MimeCharsetSupport
{
  void *v5;
  void *v6;
  BOOL v7;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  +[MFMimeCharset allMimeCharsets](MFMimeCharset, "allMimeCharsets");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mf_bestMimeCharset:", v28);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "encoding") != 134217984 || (_DWORD)a3 == -1;
    if (!v7 && (_DWORD)a3 != 134217984)
    {
      v10 = _indexOfEncodingInCharsets(0x8000100u, v28);
      v11 = _indexOfEncodingInCharsets(a3, v28);
      if (v10 != 0x7FFFFFFFFFFFFFFFLL && v11 != 0x7FFFFFFFFFFFFFFFLL && v11 > v10)
      {
        +[MFMimeCharset charsetForEncoding:](MFMimeCharset, "charsetForEncoding:", a3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "primaryLanguage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v12;
        if (v12)
        {
          v25 = v28;
          v13 = v12;
          if (objc_msgSend(v13, "length"))
          {
            v31 = 0u;
            v32 = 0u;
            v29 = 0u;
            v30 = 0u;
            v14 = v25;
            v15 = 0;
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            if (v16)
            {
              v17 = *(_QWORD *)v30;
              do
              {
                for (i = 0; i != v16; ++i)
                {
                  if (*(_QWORD *)v30 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
                  objc_msgSend(v19, "primaryLanguage", v25, v26);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = v20;
                  if (v20 && objc_msgSend(v20, "isEqualToString:", v13))
                  {
                    if (!v15)
                    {
                      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                      v15 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    objc_msgSend(v15, "addObject:", v19);
                  }
                  else
                  {
                    objc_msgSend(0, "addObject:", v19);
                  }

                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
              }
              while (v16);
            }

          }
          else
          {
            v15 = v25;
          }

          objc_msgSend(a1, "_mf_bestMimeCharset:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            v24 = v22;

            v6 = v24;
          }

        }
      }
    }
  }

  return v6;
}

- (id)mf_bestMimeCharsetForMessageDeliveryUsingSubtype:()MimeCharsetSupport
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("html")))
    +[MFMimeCharset charsetForEncoding:](MFMimeCharset, "charsetForEncoding:", 134217984);
  else
    objc_msgSend(a1, "mf_bestMimeCharset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
