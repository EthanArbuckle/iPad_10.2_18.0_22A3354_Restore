@implementation SecCertificateCopyComponentAttributes

uint64_t __SecCertificateCopyComponentAttributes_block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  CFNumberRef v4;
  uint64_t v5;
  CFStringEncoding v6;
  CFTypeRef v7;
  const UInt8 *v8;
  void *v9;
  double v10;
  CFTypeRef v11;
  const void **v12;
  uint64_t v13;
  const void *v14;
  NSObject *v15;
  unint64_t v17[3];
  uint64_t valuePtr;
  CFTypeRef cf[4];

  cf[3] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v3 = (uint64_t)(a2 + 1);
  valuePtr = *a2 & 0x1FFFFFFFFFFFFFFFLL;
  v4 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  memset(v17, 170, sizeof(v17));
  v5 = DERDecodeItem(v3, v17);
  if ((_DWORD)v5)
  {
LABEL_14:
    v13 = v5;
LABEL_15:
    v14 = 0;
  }
  else
  {
    switch(v17[0])
    {
      case 1uLL:
        LOBYTE(cf[0]) = 0;
        v5 = DERParseBoolean((unsigned __int8 **)&v17[1], (BOOL *)cf);
        if (LOBYTE(cf[0]))
          v12 = (const void **)MEMORY[0x1E0C9AE50];
        else
          v12 = (const void **)MEMORY[0x1E0C9AE40];
        if ((_DWORD)v5)
          goto LABEL_14;
        goto LABEL_23;
      case 2uLL:
        cf[0] = 0;
        v5 = DERParseInteger64((char **)&v17[1], (unint64_t *)cf);
        if ((_DWORD)v5)
          goto LABEL_14;
        v9 = CFNumberCreate(0, kCFNumberSInt64Type, cf);
        goto LABEL_28;
      case 3uLL:
        *(_OWORD *)cf = 0uLL;
        v5 = DERParseBitString((uint64_t)&v17[1], (unint64_t *)cf, 0);
        if ((_DWORD)v5)
          goto LABEL_14;
        v7 = cf[1];
        if (((unint64_t)cf[1] & 0x8000000000000000) == 0)
        {
          v8 = (const UInt8 *)cf[0];
          goto LABEL_21;
        }
        v13 = 7;
        goto LABEL_15;
      case 4uLL:
      case 6uLL:
        v7 = (CFTypeRef)v17[2];
        if ((v17[2] & 0x8000000000000000) != 0)
        {
          v14 = 0;
          v13 = 7;
          break;
        }
        v8 = (const UInt8 *)v17[1];
LABEL_21:
        v9 = CFDataCreate(0, v8, (CFIndex)v7);
        goto LABEL_28;
      case 5uLL:
        v12 = (const void **)MEMORY[0x1E0C9B0D0];
LABEL_23:
        v14 = *v12;
        goto LABEL_29;
      case 0xCuLL:
      case 0x1BuLL:
      case 0x1CuLL:
        v6 = 134217984;
        goto LABEL_7;
      case 0x13uLL:
      case 0x16uLL:
        v6 = 1536;
LABEL_7:
        v9 = copyContentString(0, (uint64_t)&v17[1], v6);
        goto LABEL_28;
      case 0x17uLL:
      case 0x18uLL:
        cf[0] = 0;
        v10 = SecAbsoluteTimeFromDateContentWithError(v17[0], (unsigned __int8 *)v17[1], v17[2], (CFErrorRef *)cf);
        v11 = cf[0];
        if (cf[0])
        {
          cf[0] = 0;
          CFRelease(v11);
LABEL_26:
          v14 = 0;
          v13 = 0;
        }
        else
        {
          v9 = CFDateCreate(0, v10);
LABEL_28:
          v14 = v9;
LABEL_29:
          v13 = 0;
          if (v4 && v14)
          {
            CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v4, v14);
            v13 = 0;
            goto LABEL_34;
          }
        }
        break;
      default:
        v15 = secLogObjForScope("SecWarning");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(cf[0]) = 134217984;
          *(unint64_t *)((char *)cf + 4) = v17[0];
          _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "unsupported value tag (%lld) found in Component Attribute dictionary, skipping", (uint8_t *)cf, 0xCu);
        }
        goto LABEL_26;
    }
  }
  if (v4)
LABEL_34:
    CFRelease(v4);
  if (v14)
    CFRelease(v14);
  return v13;
}

@end
