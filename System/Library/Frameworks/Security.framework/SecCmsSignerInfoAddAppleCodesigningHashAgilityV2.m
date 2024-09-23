@implementation SecCmsSignerInfoAddAppleCodesigningHashAgilityV2

void __SecCmsSignerInfoAddAppleCodesigningHashAgilityV2_block_invoke(uint64_t a1, CFTypeRef cf, const void *a3)
{
  CFTypeID v6;
  CFTypeID TypeID;
  CFTypeID v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  char *v14;
  CFIndex Length;
  uint64_t v16;
  _DWORD *v17;
  _QWORD *v18;
  unint64_t *v19;
  uint64_t v20;
  char **v21;
  unint64_t v22[2];
  _QWORD v23[4];
  unint64_t valuePtr;

  if (cf)
  {
    v6 = CFGetTypeID(cf);
    TypeID = CFNumberGetTypeID();
    if (a3)
    {
      if (v6 == TypeID)
      {
        v8 = CFGetTypeID(a3);
        if (v8 == CFDataGetTypeID())
        {
          v9 = *(_QWORD *)(a1 + 40);
          v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
          v11 = *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24);
          valuePtr = 0xAAAAAAAAAAAAAAAALL;
          v22[0] = 0;
          v22[1] = 0;
          if (CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt64Type, &valuePtr))
          {
            if ((CFDataGetLength((CFDataRef)a3) & 0x8000000000000000) == 0)
            {
              v12 = valuePtr;
              v13 = valuePtr;
              pthread_once(&hash_once, (void (*)(void))InitOIDHashOnce);
              v14 = v12 <= 0xD8 ? &oids[40 * v13] : 0;
              v23[3] = CFDataGetBytePtr((CFDataRef)a3);
              Length = CFDataGetLength((CFDataRef)a3);
              v16 = *(_QWORD *)v14;
              v23[1] = *((_QWORD *)v14 + 1);
              v23[2] = Length;
              v23[0] = v16;
              v17 = PORT_NewArena(1024);
              if (v17)
              {
                v18 = v17;
                if (SEC_ASN1EncodeItem((uint64_t)v17, v22, (uint64_t)v23, (uint64_t)&CMSAppleAgileHashTemplate))
                {
                  v19 = SECITEM_AllocItem(v10, 0, v22[0]);
                  if (v19)
                  {
                    v20 = (uint64_t)v19;
                    if (!SECITEM_CopyItem(v10, v19, (uint64_t)v22))
                    {
                      v21 = (char **)(v11 + 16);
                      if (!SecCmsArrayAdd(v10, v21, v20))
                        SecCmsArraySort(*v21, 0, 0);
                    }
                  }
                }
                PORT_FreeArena(v18, 0);
              }
            }
          }
        }
      }
    }
  }
}

@end
