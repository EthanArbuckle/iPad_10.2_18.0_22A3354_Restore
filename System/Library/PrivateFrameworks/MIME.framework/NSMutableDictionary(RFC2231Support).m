@implementation NSMutableDictionary(RFC2231Support)

- (void)mf_fixupRFC2231Values
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFIndex v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  __CFString *v39;
  __CFString *v40;
  __int128 v41;
  UInt8 *v42;
  void *v43;
  CFIndex v45;
  unint64_t v46;
  UInt8 *v47;
  int v48;
  unsigned int v49;
  __darwin_ct_rune_t v50;
  char v51;
  char v52;
  char v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  const __CFAllocator *bytesDeallocator;
  __darwin_ct_rune_t v59;
  __CFString *v60;
  CFIndex v61;
  __CFString *v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  unsigned int v66;
  int v67;
  void *v68;
  id v70;
  void *v71;
  id obj;
  id obja;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _OWORD v84[4];
  uint64_t v85;
  CFRange v86;

  v85 = *MEMORY[0x1E0C80C00];
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  objc_msgSend(a1, "allKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
  if (v2)
  {
    obj = 0;
    v3 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v79 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        if (objc_msgSend(v5, "rangeOfString:", CFSTR("*")) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v6 = obj;
          if (!obj)
            v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
          obj = v6;
          objc_msgSend(v6, "addObject:", v5);
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
    }
    while (v2);

    if (obj)
    {
      objc_msgSend(obj, "sortUsingSelector:", sel_caseInsensitiveCompare_);
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      obja = obj;
      v7 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
      v8 = 0;
      if (!v7)
      {
        v68 = 0;
        goto LABEL_103;
      }
      v68 = 0;
      v63 = *(_QWORD *)v75;
      bytesDeallocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
      v66 = -1;
      while (1)
      {
        v64 = v7;
        v9 = 0;
        v10 = v8;
        do
        {
          if (*(_QWORD *)v75 != v63)
            objc_enumerationMutation(obja);
          v11 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v9);
          objc_msgSend(a1, "objectForKey:", v11);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "length");
          v13 = (void *)mf_fixupRFC2231Values_keyRegex;
          if (!mf_fixupRFC2231Values_keyRegex)
          {
            v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("\\*([0-9]+)?(\\*)?$"), 0, 0);
            v15 = (void *)mf_fixupRFC2231Values_keyRegex;
            mf_fixupRFC2231Values_keyRegex = v14;

            v13 = (void *)mf_fixupRFC2231Values_keyRegex;
          }
          objc_msgSend(v13, "firstMatchInString:options:range:", v11, 0, 0, v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16 && objc_msgSend(v16, "range") != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (objc_msgSend(v17, "numberOfRanges") != 3)
              __assert_rtn("-[NSMutableDictionary(RFC2231Support) mf_fixupRFC2231Values]", "MimeHeaderEncoding.m", 609, "[match numberOfRanges] == 3");
            objc_msgSend(v11, "substringWithRange:", 0, objc_msgSend(v17, "range"));
            v70 = (id)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v17, "rangeAtIndex:", 1);
            v26 = v25;
            v27 = objc_msgSend(v17, "rangeAtIndex:", 2);
            v28 = v27;
            v30 = v29;
            if (v24 == 0x7FFFFFFFFFFFFFFFLL && v27 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v65 = -1;
              v18 = 1;
            }
            else
            {
              v65 = -1;
              if (v24 != 0x7FFFFFFFFFFFFFFFLL && v26)
              {
                objc_msgSend(v11, "substringWithRange:", v24, v26);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = objc_msgSend(v43, "intValue");

              }
              v18 = v28 != 0x7FFFFFFFFFFFFFFFLL && v30 != 0;
            }
          }
          else
          {
            v70 = v11;
            v18 = 0;
            v65 = -1;
          }
          if (v68 && (objc_msgSend(v68, "isEqualToString:") & 1) != 0)
          {
            v67 = 0;
            if (!v18)
              goto LABEL_26;
          }
          else
          {
            v66 = -1;
            v67 = 1;
            if (!v18)
            {
LABEL_26:
              v8 = v71;
              v19 = 0;
              goto LABEL_90;
            }
          }
          v21 = objc_msgSend(v71, "rangeOfString:", CFSTR("'"));
          if (v21 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v22 = objc_msgSend(v71, "length");
            v19 = 0;
            v23 = 0;
          }
          else
          {
            v31 = v20;
            v32 = objc_msgSend(v71, "rangeOfString:options:range:", CFSTR("'"), 0, v21 + v31, objc_msgSend(v71, "length") - (v21 + v31));
            v34 = v33;
            objc_msgSend(v71, "substringWithRange:", 0, v21);
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v71, "length");
            if (v34)
              v36 = v32;
            else
              v36 = v21;
            if (v34)
              v37 = v34;
            else
              v37 = v31;
            v23 = v37 + v36;
            v22 = v35 - (v37 + v36);
          }
          if (v67)
            v66 = MFEncodingForCharset(v19);
          v38 = v66;
          if (v66 == -1)
            v38 = 1536;
          v66 = v38;
          v39 = v71;
          v40 = v39;
          if ((unint64_t)v22 < 3
            || -[__CFString rangeOfString:options:range:](v39, "rangeOfString:options:range:", CFSTR("%"), 0, v23, v22 - 2) == 0x7FFFFFFFFFFFFFFFLL)
          {
            goto LABEL_88;
          }
          *(_QWORD *)&v41 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v84[2] = v41;
          v84[3] = v41;
          v84[0] = v41;
          v84[1] = v41;
          if ((unint64_t)v22 < 0x41)
            v42 = (UInt8 *)v84;
          else
            v42 = (UInt8 *)malloc_type_malloc(v22, 0xC1F0F15BuLL);
          v86.location = v23;
          v86.length = v22;
          if (v22 != MFStringGetBytes(v40, v86, 0x600u, 0, 0, v42, v22, 0) || v22 < 1)
          {
            v8 = 0;
            goto LABEL_85;
          }
          v61 = v23;
          v62 = v40;
          v45 = 0;
          v46 = (unint64_t)&v42[v22];
          v47 = v42;
          do
          {
            v48 = *v47;
            if (v48 != 37)
              goto LABEL_69;
            if ((unint64_t)(v47 + 2) >= v46
              || (v49 = (char)v47[1], (v49 & 0x80000000) != 0)
              || (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v49 + 60) & 0x10000) == 0
              || (char)v47[2] < 0
              || (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v47[2] + 60) & 0x10000) == 0)
            {
              LOBYTE(v48) = 37;
LABEL_69:
              ++v47;
              goto LABEL_70;
            }
            v59 = __toupper(v49);
            v50 = __toupper((char)v47[2]);
            if (v59 << 24 <= 956301312)
              v51 = -48;
            else
              v51 = -55;
            v52 = v51 + v59;
            if (v50 << 24 <= 956301312)
              v53 = -48;
            else
              v53 = -55;
            LOBYTE(v48) = v53 + v50 + 16 * v52;
            v47 += 3;
LABEL_70:
            if (&v42[v45] != v47)
              v42[v45] = v48;
            ++v45;
          }
          while ((unint64_t)v47 < v46);
          if (&v42[v45] == v47)
          {
            v8 = 0;
            v23 = v61;
            v40 = v62;
          }
          else
          {
            v40 = v62;
            v23 = v61;
            v60 = (__CFString *)CFDataCreateWithBytesNoCopy(0, v42, v45, bytesDeallocator);
            v8 = MFCreateStringWithData(v60, v66, 0);

          }
LABEL_85:
          if (v42 != (UInt8 *)v84)
            free(v42);
          if (!v8)
          {
LABEL_88:
            -[__CFString substringWithRange:](v40, "substringWithRange:", v23, v22);
            v8 = (id)objc_claimAutoreleasedReturnValue();
          }

LABEL_90:
          if (v8)
          {
            objc_msgSend(a1, "removeObjectForKey:", v11);
            if (v67)
            {
              v54 = v70;

              v68 = v54;
              objc_msgSend(a1, "setObject:forKey:", v8, v54);
            }
            else if (v65)
            {
              if (v65 >= 1)
              {
                objc_msgSend(a1, "objectForKey:", v68);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37A0]), "initWithCapacity:", objc_msgSend(v8, "length") + objc_msgSend(v55, "length"));
                v57 = v56;
                if (v55)
                  objc_msgSend(v56, "appendString:", v55);
                objc_msgSend(v57, "appendString:", v8);
                objc_msgSend(a1, "setObject:forKey:", v57, v68);

              }
            }
            else
            {
              objc_msgSend(a1, "setObject:forKey:", v8, v68);
            }
          }

          ++v9;
          v10 = v8;
        }
        while (v9 != v64);
        v7 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
        if (!v7)
        {
LABEL_103:

          v1 = obja;
          goto LABEL_104;
        }
      }
    }
  }
  else
  {
LABEL_104:

  }
}

@end
