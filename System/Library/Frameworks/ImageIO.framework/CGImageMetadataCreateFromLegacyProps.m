@implementation CGImageMetadataCreateFromLegacyProps

void __CGImageMetadataCreateFromLegacyProps_block_invoke(uint64_t a1, uint64_t a2)
{
  const void *v4;
  const __CFDictionary *ObjectForKey;
  const __CFDictionary *v6;
  CFTypeID v7;
  CFTypeID v8;
  CFTypeID v9;
  CGImageMetadataType v10;
  const __CFString *ArrayFromCFValue;
  __CFString *Value;
  int v13;
  const __CFString *v14;
  uint64_t v15;
  __CFDictionary *StructureFromCFValue;
  __CFString *v17;
  int v18;
  const __CFString *ObjectForKeyGroup;
  CFTypeID v20;
  CGImageMetadataTagRef v21;
  const void *ValueAtIndex;
  CGImageMetadataTagRef v23;
  int v24;
  const char *CStringPtr;
  const char *v26;
  const __CFString *SimpleStringFromCFValue;
  const __CFAllocator *v28;
  __CFString *v29;
  const __CFArray *v30;
  const __CFAllocator *v31;
  __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  CGImageMetadataTagRef v35;
  CGImageMetadataTagRef v36;
  const __CFString *v37;
  __CFString *v38;
  __CFString *XMPDateFromIPTCDateAndTime;
  __CFString *v40;
  const __CFString *v41;
  CFTypeID v42;
  CFTypeID v43;
  CFArrayRef v44;
  const __CFString **v45;
  const __CFString *XMPDateTimeFromEXIFDateTime;
  CGImageMetadataTagRef v47;
  BOOL v48;
  char v49;
  __CFString *v50;
  CGImageMetadataTagRef v51;
  int v52;
  __CFString *v53;
  const __CFString *v54;
  void *TagWithPath;
  int v56;
  const char *v57;
  const char *v58;
  __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  _DWORD *exception;
  CFIndex v64;
  void *values[4];

  values[3] = *(void **)MEMORY[0x1E0C80C00];
  v64 = 0;
  v4 = **(const void ***)(a2 + 8);
  ObjectForKey = IIODictionary::getObjectForKey(*(IIODictionary **)(a1 + 40), **(const __CFString ***)a2);
  if (!ObjectForKey)
    return;
  v6 = ObjectForKey;
  v7 = CFGetTypeID(ObjectForKey);
  if (v7 != CFDictionaryGetTypeID())
  {
    v8 = CFGetTypeID(v6);
    if (v8 != CFNullGetTypeID())
      return;
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CGImageMetadataCreateMutable();
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      exception = __cxa_allocate_exception(4uLL);
      *exception = -1;
      __cxa_throw(exception, MEMORY[0x1E0DE4EF0], 0);
    }
  }
  v9 = CFGetTypeID(v6);
  if (v9 == CFNullGetTypeID())
  {
    v10 = kCGImageMetadataTypeDefault;
    ArrayFromCFValue = (const __CFString *)*MEMORY[0x1E0C9B0D0];
LABEL_66:
    if (ArrayFromCFValue)
    {
      v50 = CGImageMetadataDefaultPrefixForNamespace(**(const __CFString ***)(a2 + 24));
      v51 = CGImageMetadataTagCreate(**(CFStringRef **)(a2 + 24), v50, **(CFStringRef **)(a2 + 32), v10, ArrayFromCFValue);
      if (v51)
      {
        if (CFStringCompare(**(CFStringRef **)a2, CFSTR("{IPTC}"), 0))
          v52 = 2;
        else
          v52 = 4;
        CGImageMetadataTagSetSource((uint64_t)v51, v52);
        CGImageMetadataAddTag(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v51);
        CFRelease(v51);
      }
      CFRelease(ArrayFromCFValue);
      return;
    }
  }
  else
  {
    Value = (__CFString *)CFDictionaryGetValue(v6, v4);
    if (Value)
    {
      v13 = *(unsigned __int16 *)(a2 + 18);
      v14 = Value;
      switch(*(_WORD *)(a2 + 18))
      {
        case 0:
          v15 = 4;
          goto LABEL_24;
        case 1:
          v15 = 3;
LABEL_24:
          SimpleStringFromCFValue = CGImageMetadataCreateSimpleStringFromCFValue(Value, v15);
          goto LABEL_64;
        case 2:
          ArrayFromCFValue = (const __CFString *)CreateArrayFromCFValue(Value, *(unsigned __int16 *)(a2 + 16));
          v10 = kCGImageMetadataTypeArrayUnordered;
          goto LABEL_66;
        case 3:
          ArrayFromCFValue = (const __CFString *)CreateArrayFromCFValue(Value, *(unsigned __int16 *)(a2 + 16));
          v10 = kCGImageMetadataTypeArrayOrdered;
          goto LABEL_66;
        case 4:
          StructureFromCFValue = CreateStructureFromCFValue(Value);
          goto LABEL_13;
        case 5:
          v28 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          v29 = CGImageMetadataDefaultPrefixForNamespace(**(const __CFString ***)(a2 + 24));
          ArrayFromCFValue = CFStringCreateWithFormat(v28, 0, CFSTR("%@:%@[x-default]"), v29, **(_QWORD **)(a2 + 32));
          if (!ArrayFromCFValue)
            break;
          CGImageMetadataSetValueWithPath(*(CGMutableImageMetadataRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0, ArrayFromCFValue, v14);
          CFRelease(ArrayFromCFValue);
          goto LABEL_35;
        case 6:
          SimpleStringFromCFValue = CreateShortXMPDateFromIPTCDate(Value);
          goto LABEL_64;
        case 7:
          SimpleStringFromCFValue = CreateMetadataVersionStringFromArray(Value);
          goto LABEL_64;
        case 8:
          v30 = CreateMetadataLensInfoFromCFValue((const __CFArray *)Value, &v64);
          ArrayFromCFValue = (const __CFString *)v30;
          v10 = kCGImageMetadataTypeString;
          if (v64 == 4 || !v30)
            goto LABEL_66;
          CFRelease(v30);
          goto LABEL_41;
        case 9:
          memset(values, 0, 24);
          IIODictionary::IIODictionary((IIODictionary *)values, (const __CFDictionary *)Value);
          AddMWGRegionsFromExifAuxRegions(*(CGImageMetadata **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), (IIODictionary *)values);
          IIODictionary::~IIODictionary((IIODictionary *)values);
LABEL_35:
          LOBYTE(ArrayFromCFValue) = 1;
          break;
        case 0xA:
          v31 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          v32 = CGImageMetadataDefaultPrefixForNamespace(**(const __CFString ***)(a2 + 24));
          v33 = CFStringCreateWithFormat(v31, 0, CFSTR("%@:%@"), v32, **(_QWORD **)(a2 + 32));
          if (!v33)
            goto LABEL_41;
          v34 = v33;
          v35 = CGImageMetadataCopyTagWithPath(*(CGImageMetadataRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0, v33);
          if (v35)
          {
            v36 = v35;
            v37 = (const __CFString *)CGImageMetadataTagGetValue((uint64_t)v35);
            ArrayFromCFValue = 0;
            v38 = (__CFString *)v37;
            switch(*(_WORD *)(a2 + 16))
            {
              case 8:
                XMPDateFromIPTCDateAndTime = CreateXMPDateFromIPTCDateAndTime(v14, 0);
                if (!XMPDateFromIPTCDateAndTime)
                  goto LABEL_91;
                v40 = XMPDateFromIPTCDateAndTime;
                v41 = v38;
                goto LABEL_85;
              case 9:
                v59 = CreateXMPDateFromIPTCDateAndTime(0, v14);
                if (v59)
                {
                  v40 = v59;
                  XMPDateFromIPTCDateAndTime = v38;
                  v41 = v40;
LABEL_85:
                  ArrayFromCFValue = CreateMergedXMPDateWithXMPTime(XMPDateFromIPTCDateAndTime, v41);
                  CFRelease(v40);
                }
                else
                {
LABEL_91:
                  ArrayFromCFValue = 0;
                }
                break;
              case 0xF:
                v37 = v14;
                v60 = v38;
                goto LABEL_88;
              case 0x10:
                v60 = v14;
LABEL_88:
                ArrayFromCFValue = CreateMergedXMPDateWithXMPTime(v37, v60);
                break;
              default:
                break;
            }
            CFRelease(v36);
          }
          else
          {
            ArrayFromCFValue = 0;
            switch(*(_WORD *)(a2 + 16))
            {
              case 8:
                v61 = v14;
                v62 = 0;
                goto LABEL_95;
              case 9:
                v61 = 0;
                v62 = v14;
LABEL_95:
                XMPDateTimeFromEXIFDateTime = CreateXMPDateFromIPTCDateAndTime(v61, v62);
                goto LABEL_96;
              case 0xA:
              case 0xB:
              case 0xC:
              case 0xD:
              case 0xE:
                break;
              case 0xF:
              case 0x10:
                XMPDateTimeFromEXIFDateTime = (const __CFString *)CFRetain(v14);
                goto LABEL_96;
              default:
                if (*(_WORD *)(a2 + 16) != 3)
                  break;
                XMPDateTimeFromEXIFDateTime = CreateXMPDateTimeFromEXIFDateTime(v14);
LABEL_96:
                ArrayFromCFValue = XMPDateTimeFromEXIFDateTime;
                break;
            }
          }
          CFRelease(v34);
          goto LABEL_65;
        case 0xB:
          StructureFromCFValue = CreateXMPFlashStructFromCFValue((__CFDictionary *)Value);
LABEL_13:
          ArrayFromCFValue = (const __CFString *)StructureFromCFValue;
          v10 = kCGImageMetadataTypeStructure;
          goto LABEL_66;
        case 0xC:
          v17 = **(__CFString ***)(a2 + 8);
          if (v17 == CFSTR("Longitude"))
          {
            v18 = 0;
            v45 = (const __CFString **)&kCGImagePropertyGPSLongitudeRef;
          }
          else if (v17 == CFSTR("DestLongitude"))
          {
            v18 = 0;
            v45 = (const __CFString **)&kCGImagePropertyGPSDestLongitudeRef;
          }
          else if (v17 == CFSTR("Latitude"))
          {
            v18 = 1;
            v45 = (const __CFString **)&kCGImagePropertyGPSLatitudeRef;
          }
          else
          {
            v18 = 1;
            if (v17 != CFSTR("DestLatitude"))
            {
              ObjectForKeyGroup = 0;
              goto LABEL_63;
            }
            v45 = (const __CFString **)&kCGImagePropertyGPSDestLatitudeRef;
          }
          ObjectForKeyGroup = (const __CFString *)IIODictionary::getObjectForKeyGroup(*(IIODictionary **)(a1 + 40), *v45, CFSTR("{GPS}"));
LABEL_63:
          SimpleStringFromCFValue = CreateXMPGPSCoordinateFromCFValue(v14, ObjectForKeyGroup, v18);
LABEL_64:
          ArrayFromCFValue = SimpleStringFromCFValue;
LABEL_65:
          v10 = kCGImageMetadataTypeString;
          goto LABEL_66;
        case 0xD:
          SimpleStringFromCFValue = (const __CFString *)CreateGPSVersionStringFromArray((const __CFArray *)Value);
          goto LABEL_64;
        case 0xE:
          v20 = CFGetTypeID(Value);
          if (v20 == CFArrayGetTypeID() && CFArrayGetCount((CFArrayRef)v14) >= 1)
          {
            v21 = CGImageMetadataTagCreate(CFSTR("http://ns.adobe.com/exif/1.0/"), CFSTR("exif"), CFSTR("ISOSpeedRatings"), kCGImageMetadataTypeArrayOrdered, v14);
            ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v14, 0);
            v23 = CGImageMetadataTagCreate(CFSTR("http://cipa.jp/exif/1.0/"), CFSTR("exifEX"), CFSTR("PhotographicSensitivity"), kCGImageMetadataTypeString, ValueAtIndex);
          }
          else
          {
            v42 = CFGetTypeID(v14);
            if (v42 != CFStringGetTypeID())
            {
              v43 = CFGetTypeID(v14);
              if (v43 != CFNumberGetTypeID())
              {
                v49 = 0;
                v48 = 0;
                goto LABEL_59;
              }
            }
            values[0] = (void *)v14;
            v44 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)values, 1, MEMORY[0x1E0C9B378]);
            if (v44)
            {
              v21 = CGImageMetadataTagCreate(CFSTR("http://ns.adobe.com/exif/1.0/"), CFSTR("exif"), CFSTR("ISOSpeedRatings"), kCGImageMetadataTypeArrayOrdered, v44);
              CFRelease(v44);
            }
            else
            {
              v21 = 0;
            }
            v23 = CGImageMetadataTagCreate(CFSTR("http://cipa.jp/exif/1.0/"), CFSTR("exifEX"), CFSTR("PhotographicSensitivity"), kCGImageMetadataTypeString, v14);
          }
          v47 = v23;
          v48 = v21 != 0;
          if (v21)
          {
            CGImageMetadataTagSetSource((uint64_t)v21, 2);
            CGImageMetadataAddTag(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v21);
            CFRelease(v21);
          }
          if (v47)
          {
            CGImageMetadataTagSetSource((uint64_t)v47, 2);
            CGImageMetadataAddTag(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v47);
            CFRelease(v47);
            v49 = 1;
          }
          else
          {
            v49 = 0;
          }
LABEL_59:
          LOBYTE(ArrayFromCFValue) = v49 & v48;
          break;
        default:
          v24 = *(unsigned __int16 *)(a2 + 16);
          CStringPtr = CFStringGetCStringPtr(**(CFStringRef **)a2, 0);
          v26 = CFStringGetCStringPtr(**(CFStringRef **)(a2 + 8), 0);
          LogMetadata("CGImageMetadataCreateFromLegacyProps_block_invoke", 1182, "Unhandled conversion from property type (%d) to tag type (%d) for {%s}:%s\n", v24, v13, CStringPtr, v26);
          goto LABEL_41;
      }
    }
    else
    {
LABEL_41:
      LOBYTE(ArrayFromCFValue) = 0;
    }
  }
  v53 = CGImageMetadataDefaultPrefixForNamespace(**(const __CFString ***)(a2 + 24));
  v54 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@:%@"), v53, **(_QWORD **)(a2 + 32));
  if (v54)
  {
    TagWithPath = CGImageMetadataGetTagWithPath(*(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0, v54);
    if (TagWithPath)
    {
      if (CFStringCompare(**(CFStringRef **)a2, CFSTR("{IPTC}"), 0))
        v56 = 2;
      else
        v56 = 4;
      CGImageMetadataTagSetSource((uint64_t)TagWithPath, v56);
    }
    CFRelease(v54);
  }
  if ((ArrayFromCFValue & 1) == 0)
  {
    v57 = CFStringGetCStringPtr(**(CFStringRef **)(a2 + 24), 0);
    v58 = CFStringGetCStringPtr(**(CFStringRef **)(a2 + 32), 0);
    LogMetadata("CGImageMetadataCreateFromLegacyProps_block_invoke", 1246, "Unable to create a tag for schema = %s, property = %s\n", v57, v58);
  }
}

@end
