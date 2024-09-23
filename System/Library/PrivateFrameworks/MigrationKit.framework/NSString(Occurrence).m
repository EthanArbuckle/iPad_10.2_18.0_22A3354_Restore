@implementation NSString(Occurrence)

- (uint64_t)mk_occurrenceCountOfString:()Occurrence
{
  __CFString *v4;
  CFIndex Length;
  CFIndex v6;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  const UniChar *v9;
  const char *v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CFIndex v22;
  CFIndex v23;
  UniChar v24;
  uint64_t v25;
  UniChar v26;
  uint64_t v27;
  uint64_t v28;
  CFIndex v29;
  int64_t v30;
  uint64_t v31;
  CFIndex v32;
  uint64_t v33;
  CFIndex v34;
  uint64_t v35;
  uint64_t v36;
  __CFString *v38;
  uint64_t v39;
  CFIndex v40;
  uint64_t v41;
  UniChar buffer[8];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CFStringRef theString;
  const UniChar *v51;
  const char *v52;
  uint64_t v53;
  CFIndex v54;
  uint64_t v55;
  uint64_t v56;
  UniChar v57[8];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  CFStringRef v65;
  const UniChar *v66;
  const char *v67;
  uint64_t v68;
  CFIndex v69;
  CFIndex v70;
  CFIndex v71;
  CFRange v72;
  CFRange v73;

  v4 = a3;
  if (v4)
  {
    Length = CFStringGetLength(a1);
    v6 = CFStringGetLength(v4);
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    *(_OWORD *)v57 = 0u;
    v58 = 0u;
    v65 = a1;
    v68 = 0;
    v69 = Length;
    CharactersPtr = CFStringGetCharactersPtr(a1);
    CStringPtr = 0;
    v66 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
    v70 = 0;
    v71 = 0;
    v67 = CStringPtr;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    *(_OWORD *)buffer = 0u;
    v43 = 0u;
    theString = v4;
    v53 = 0;
    v54 = v6;
    v9 = CFStringGetCharactersPtr(v4);
    v10 = 0;
    v51 = v9;
    if (!v9)
      v10 = CFStringGetCStringPtr(v4, 0x600u);
    v38 = v4;
    v55 = 0;
    v56 = 0;
    v52 = v10;
    v40 = Length - v6;
    if (Length - v6 < 1)
    {
      v13 = 0;
    }
    else
    {
      v11 = v6;
      v12 = 0;
      v13 = 0;
      v39 = v11;
      do
      {
        if (v11 < 1)
        {
          v35 = 0;
          v36 = 1;
        }
        else
        {
          v14 = 0;
          v15 = 0;
          v16 = -v12;
          v17 = v12 + 64;
          v18 = 64;
          v19 = v12;
          v41 = v13;
          while (1)
          {
            v20 = v19 >= 4 ? 4 : v19;
            v21 = (unint64_t)v15 >= 4 ? 4 : v15;
            v22 = v12 + v15;
            if (v12 + v15 < 0 || (v23 = v69, v69 <= v22))
            {
              v24 = 0;
            }
            else if (v66)
            {
              v24 = v66[v12 + v15 + v68];
            }
            else if (v67)
            {
              v24 = v67[v68 + v12 + v15];
            }
            else
            {
              if (v71 <= v22 || (v29 = v70, v70 > v22))
              {
                v30 = v12 - v20;
                v31 = v20 + v16;
                v32 = v17 - v20;
                v33 = v15 + v30;
                v34 = v33 + 64;
                if (v33 + 64 >= v69)
                  v34 = v69;
                v70 = v33;
                v71 = v34;
                if (v69 >= v32)
                  v23 = v32;
                v73.length = v23 + v31;
                v73.location = v33 + v68;
                CFStringGetCharacters(v65, v73, v57);
                v11 = v39;
                v29 = v70;
              }
              v24 = v57[v12 - v29 + v15];
            }
            v25 = v54;
            if (v54 <= v15)
            {
              v26 = 0;
            }
            else if (v51)
            {
              v26 = v51[v15 + v53];
            }
            else if (v52)
            {
              v26 = v52[v53 + v15];
            }
            else
            {
              if (v56 <= v15 || (v27 = v55, v55 > v15))
              {
                v28 = v15 - v21 + 64;
                if (v28 >= v54)
                  v28 = v54;
                v55 = v15 - v21;
                v56 = v28;
                if (v54 >= v18 - v21)
                  v25 = v18 - v21;
                v72.length = v25 + v21 + v14;
                v72.location = v15 - v21 + v53;
                CFStringGetCharacters(theString, v72, buffer);
                v11 = v39;
                v27 = v55;
              }
              v26 = buffer[v15 - v27];
            }
            if (v24 != v26)
              break;
            ++v15;
            ++v19;
            --v16;
            ++v17;
            --v14;
            ++v18;
            if (v11 == v15)
            {
              v35 = 1;
              v36 = v11;
              goto LABEL_50;
            }
          }
          v35 = 0;
          v36 = 1;
LABEL_50:
          v13 = v41;
        }
        v13 += v35;
        v12 += v36;
      }
      while (v12 < v40);
    }
    v4 = v38;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
