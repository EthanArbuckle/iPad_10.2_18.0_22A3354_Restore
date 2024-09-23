@implementation CFDateFormatterCreateDateFormatFromTemplate

void __CFDateFormatterCreateDateFormatFromTemplate_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CFIndex v5;
  const __CFArray *ValueAtIndex;
  const char *length;
  CFRange v8;
  CFLocaleRef System;
  uint64_t v10;
  const __CFBoolean *AppleICUForce24HourTimePref;
  const __CFBoolean *v12;
  CFTypeID v13;
  int Value;
  __CFString *Mutable;
  const __CFBoolean *AppleICUForce12HourTimePref;
  const __CFBoolean *v17;
  CFTypeID v18;
  _BOOL4 v19;
  _BOOL4 v20;
  CFIndex v21;
  CFIndex v22;
  CFIndex v23;
  BOOL v24;
  CFIndex v25;
  int CharacterAtIndex;
  _BOOL4 v27;
  UniChar v28;
  CFIndex location;
  int v30;
  uint64_t v31;
  CFIndex v32;
  CFIndex v33;
  uint64_t Skeleton;
  CFStringRef v35;
  uint64_t v36;
  int BestPattern;
  int v38;
  CFCharacterSetRef Predefined;
  const __CFCharacterSet *v40;
  uint64_t i;
  unsigned int v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int IsCharacterMember;
  int v50;
  BOOL v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  CFIndex v56;
  __objc2_class **v57;
  int v58;
  CFIndex Count;
  _BOOL4 v60;
  uint64_t v61;
  uint64_t v62;
  _BOOL4 v63;
  CFIndex v64;
  int v65;
  UniChar v66[768];
  UniChar v67[768];
  UniChar chars[768];
  uint64_t v69;
  CFRange v70;

  v2 = MEMORY[0x1E0C80A78](a1, a2);
  v61 = v3;
  v4 = v2;
  v69 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(v2 + 72))
  {
    Count = 1;
LABEL_4:
    v5 = 0;
    v62 = v4;
    while (1)
    {
      ValueAtIndex = *(const __CFArray **)(v4 + 40);
      v64 = v5;
      if (!*(_BYTE *)(v4 + 72))
        ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(ValueAtIndex, v5);
      v8 = CFStringFind((CFStringRef)ValueAtIndex, CFSTR("J"), 0);
      length = (const char *)v8.length;
      System = *(CFLocaleRef *)(v4 + 48);
      if (System)
      {
        if (!ValueAtIndex)
          goto LABEL_15;
      }
      else
      {
        System = CFLocaleGetSystem();
        if (!ValueAtIndex)
        {
LABEL_15:
          Mutable = 0;
          goto LABEL_75;
        }
      }
      v10 = *(_QWORD *)(v62 + 56);
      if ((v10 & 1) != 0)
      {
        Value = 1;
        if ((v10 & 2) == 0)
          goto LABEL_17;
      }
      else
      {
        AppleICUForce24HourTimePref = (const __CFBoolean *)_CFLocaleGetAppleICUForce24HourTimePref(System, length);
        if (AppleICUForce24HourTimePref
          && (v12 = AppleICUForce24HourTimePref,
              v13 = CFGetTypeID(AppleICUForce24HourTimePref),
              v13 == CFBooleanGetTypeID()))
        {
          Value = CFBooleanGetValue(v12);
          if ((v10 & 2) == 0)
            goto LABEL_17;
        }
        else
        {
          Value = 0;
          if ((v10 & 2) == 0)
          {
LABEL_17:
            AppleICUForce12HourTimePref = (const __CFBoolean *)_CFLocaleGetAppleICUForce12HourTimePref(System, length);
            v19 = AppleICUForce12HourTimePref
               && (v17 = AppleICUForce12HourTimePref,
                   v18 = CFGetTypeID(AppleICUForce12HourTimePref),
                   v18 == CFBooleanGetTypeID())
               && CFBooleanGetValue(v17) != 0;
            v63 = Value != 0;
            if (Value)
              v20 = 0;
            else
              v20 = v19;
            v60 = v20;
            if (!Value && !v19)
            {
              Mutable = (__CFString *)CFRetain(ValueAtIndex);
              goto LABEL_75;
            }
            goto LABEL_29;
          }
        }
      }
      v63 = Value != 0;
      v60 = Value == 0;
LABEL_29:
      Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
      v21 = CFStringGetLength((CFStringRef)ValueAtIndex);
      if (v21 >= 1)
      {
        v22 = v21;
        v23 = 0;
        v24 = 0;
        v58 = Value | (v8.location != -1);
        v25 = -1;
        while (1)
        {
          chars[0] = 0;
          CharacterAtIndex = CFStringGetCharacterAtIndex((CFStringRef)ValueAtIndex, v23);
          chars[0] = CharacterAtIndex;
          if (CharacterAtIndex > 74)
            break;
          switch(CharacterAtIndex)
          {
            case '\'':
              v24 = !v24;
              break;
            case 'H':
              if (v24)
                goto LABEL_67;
              if (v25 == -1)
                v25 = CFStringGetLength(Mutable);
              if (v60)
                goto LABEL_54;
              goto LABEL_72;
            case 'J':
LABEL_39:
              if (!v24)
              {
                if (v25 == -1)
                  v25 = CFStringGetLength(Mutable);
                if (v63)
                {
LABEL_59:
                  v24 = 0;
                  v28 = 72;
                }
                else
                {
LABEL_54:
                  v24 = 0;
                  v28 = 104;
                }
LABEL_60:
                chars[0] = v28;
                break;
              }
LABEL_67:
              v24 = 1;
              break;
          }
LABEL_73:
          CFStringAppendCharacters(Mutable, chars, 1);
LABEL_74:
          if (v22 == ++v23)
            goto LABEL_75;
        }
        switch(CharacterAtIndex)
        {
          case 'h':
            if (v24)
              goto LABEL_67;
            if (v25 == -1)
              v25 = CFStringGetLength(Mutable);
            if (v63)
              goto LABEL_59;
            break;
          case 'i':
          case 'l':
          case 'n':
          case 'o':
          case 'p':
          case 'q':
          case 'r':
            goto LABEL_73;
          case 'j':
            goto LABEL_39;
          case 'k':
            if (v24)
              goto LABEL_67;
            if (v25 == -1)
              v25 = CFStringGetLength(Mutable);
            if (!v60)
              break;
            v24 = 0;
            v28 = 75;
            goto LABEL_60;
          case 'm':
          case 's':
            if (v24)
              goto LABEL_67;
            CFStringGetLength(Mutable);
            break;
          default:
            if (CharacterAtIndex != 75)
            {
              if (CharacterAtIndex == 97)
              {
                v27 = v24;
                v24 = v24;
                if (!v27)
                {
                  if (v58)
                  {
                    v24 = 0;
                    goto LABEL_74;
                  }
                }
              }
              goto LABEL_73;
            }
            if (v24)
              goto LABEL_67;
            if (v25 == -1)
              v25 = CFStringGetLength(Mutable);
            if (v63)
            {
              v24 = 0;
              v28 = 107;
              goto LABEL_60;
            }
            break;
        }
LABEL_72:
        v24 = 0;
        goto LABEL_73;
      }
LABEL_75:
      location = CFStringFind(Mutable, CFSTR("j"), 1uLL).location;
      if (location == -1)
      {
        v30 = 0;
        v31 = 0;
      }
      else
      {
        CFStringGetCharacterAtIndex(Mutable, location);
        if (location + 1 < CFStringGetLength(Mutable)
          && (CFStringGetCharacterAtIndex(Mutable, location + 1) == 106
           || CFStringGetCharacterAtIndex(Mutable, location + 1) == 74))
        {
          CFStringGetCharacterAtIndex(Mutable, location + 1);
          v30 = 1;
          v31 = 2;
        }
        else
        {
          v30 = 0;
          v31 = 1;
        }
      }
      bzero(chars, 0x600uLL);
      bzero(v67, 0x600uLL);
      bzero(v66, 0x600uLL);
      v32 = CFStringGetLength(Mutable);
      if (v32 >= 768)
        v33 = 768;
      else
        v33 = v32;
      v70.location = 0;
      v70.length = v33;
      CFStringGetCharacters(Mutable, v70, chars);
      CFRelease(Mutable);
      v65 = 0;
      Skeleton = __cficu_udatpg_getSkeleton(v61, chars, v33, v67, 768, &v65);
      v35 = 0;
      if (v65 <= 0)
      {
        if (location == -1)
        {
          v36 = Skeleton;
        }
        else
        {
          v36 = Skeleton;
          if ((unint64_t)(v31 + (int)Skeleton) <= 0x2FF)
          {
            v36 = (int)Skeleton + 1;
            v67[(int)Skeleton] = 106;
            if (v30)
            {
              v67[v36] = 106;
              v36 = (Skeleton + 2);
            }
          }
        }
        v65 = 0;
        BestPattern = __cficu_udatpg_getBestPattern(v61, v67, v36, v66, 768, &v65);
        if (v65 <= 0)
        {
          v38 = BestPattern;
          if (v8.location != -1)
          {
            Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
            if (v38 >= 1)
            {
              v40 = Predefined;
              for (i = 0; i < v38; ++i)
              {
                v42 = v66[i] - 66;
                v43 = v42 > 0x20;
                v44 = (1 << v42) & 0x180000003;
                if (!v43 && v44 != 0)
                {
                  v46 = i - 1;
                  do
                  {
                    v47 = v46;
                    v48 = i - 1;
                    IsCharacterMember = CFCharacterSetIsCharacterMember(v40, v66[i - 1]);
                    v46 = v47 - 1;
                    --i;
                  }
                  while (IsCharacterMember);
                  i = v48 + 1;
                  while (1)
                  {
                    v50 = v66[v48 + 1];
                    v51 = (v50 - 66) > 0x20 || ((1 << (v50 - 66)) & 0x180000003) == 0;
                    if (v51 && !CFCharacterSetIsCharacterMember(v40, v50))
                      break;
                    if (v38 >= 767)
                      v52 = 767;
                    else
                      v52 = v38;
                    if (i < v52)
                    {
                      v53 = v47;
                      do
                      {
                        v66[v53 + 1] = v66[v53 + 2];
                        v54 = v53 + 2;
                        ++v53;
                      }
                      while (v54 < v52);
                    }
                    --v38;
                  }
                }
              }
            }
          }
          v35 = CFStringCreateWithCharacters(*(CFAllocatorRef *)(v62 + 64), v66, v38);
        }
        else
        {
          v35 = 0;
        }
      }
      v4 = v62;
      v55 = *(_QWORD *)(*(_QWORD *)(v62 + 32) + 8);
      if (*(_BYTE *)(v62 + 72))
      {
        *(_QWORD *)(v55 + 24) = v35;
        v56 = v64;
      }
      else
      {
        if (v35)
          v57 = (__objc2_class **)v35;
        else
          v57 = &__kCFNull;
        CFArrayAppendValue(*(CFMutableArrayRef *)(v55 + 24), v57);
        v56 = v64;
        if (v35)
          CFRelease(v35);
      }
      v5 = v56 + 1;
      if (v5 == Count)
        return;
    }
  }
  Count = CFArrayGetCount(*(CFArrayRef *)(v2 + 40));
  if (Count >= 1)
    goto LABEL_4;
}

@end
