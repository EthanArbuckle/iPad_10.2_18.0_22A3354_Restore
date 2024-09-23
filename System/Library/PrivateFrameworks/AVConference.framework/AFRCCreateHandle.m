@implementation AFRCCreateHandle

uint64_t __AFRCCreateHandle_block_invoke(uint64_t a1, __CFDictionary *a2)
{
  uint64_t result;
  uint64_t v5;
  const __CFAllocator *v6;
  uint64_t v7;
  CFStringRef v8;
  uint64_t v9;
  CFStringRef v10;
  CFStringRef v11;
  CFStringRef v12;
  CFStringRef v13;
  uint64_t v14;
  float64x2_t v15;
  double v16;
  double v17;
  unsigned int v18;
  unsigned int v19;
  CFStringRef v20;
  unsigned int v21;
  unsigned int v22;
  CFStringRef v23;
  uint64_t v24;
  CFStringRef v25;
  CFStringRef v26;
  CFStringRef v27;
  CFStringRef v28;
  unint64_t v29;
  CFStringRef v30;
  unint64_t v31;
  CFStringRef v32;
  CFStringRef v33;
  CFStringRef v34;
  CFStringRef v35;
  CFStringRef v36;
  uint64_t v37;
  CFStringRef v38;
  uint64_t v39;
  CFStringRef v40;
  uint64_t v41;
  CFStringRef v42;
  uint64_t v43;
  CFStringRef v44;
  uint64_t v45;
  CFStringRef v46;
  uint64_t v47;
  CFStringRef v48;
  unsigned int v49;
  CFStringRef v50;
  uint64_t v51;
  CFStringRef v52;
  CFStringRef v53;
  CFStringRef v54;
  uint64_t v55;
  CFStringRef v56;
  CFStringRef v57;
  unsigned int v58;

  result = CheckInHandleDebug();
  if (result)
  {
    v5 = result;
    if (a2)
    {
      v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v7 = *(unsigned int *)(result + 240);
      if ((_DWORD)v7)
        v7 = (*(double *)(result + 192) / (double)v7);
      v8 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), v7);
      CFDictionaryAddValue(a2, CFSTR("PLR"), v8);
      CFRelease(v8);
      v9 = *(unsigned int *)(v5 + 240);
      if ((_DWORD)v9)
        v9 = (*(double *)(v5 + 200) / (double)v9);
      v10 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), v9);
      CFDictionaryAddValue(a2, CFSTR("VPLR"), v10);
      CFRelease(v10);
      v11 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), *(unsigned int *)(v5 + 52));
      CFDictionaryAddValue(a2, CFSTR("RTT"), v11);
      CFRelease(v11);
      v12 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), *(unsigned int *)(v5 + 44) / 0x3E8uLL);
      CFDictionaryAddValue(a2, CFSTR("TTxR"), v12);
      CFRelease(v12);
      v13 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), (*(double *)(v5 + 680) / 1000.0));
      CFDictionaryAddValue(a2, CFSTR("DBE"), v13);
      CFRelease(v13);
      if (*(_BYTE *)(v5 + 1037))
        v14 = (*(double *)(v5 + 1000) / 1000.0);
      else
        v14 = *(unsigned int *)(v5 + 252);
      v20 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), v14);
      CFDictionaryAddValue(a2, CFSTR("UBE"), v20);
      CFRelease(v20);
      v21 = (*(double *)(v5 + 672) / 1000.0);
      v22 = *(_DWORD *)(v5 + 9824);
      if (v22 && v21 && (double)v22 / (double)v21 > 2.0 && v22 - v21 >= 0x2EF)
        ++*(_DWORD *)(v5 + 9828);
      *(_DWORD *)(v5 + 9824) = v21;
      v23 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), *(unsigned int *)(v5 + 9828));
      CFDictionaryAddValue(a2, CFSTR("SBWD"), v23);
      CFRelease(v23);
      v24 = *(unsigned int *)(v5 + 9832);
      if (*(_BYTE *)(v5 + 9820))
      {
        v24 = (v24 + 1);
        *(_DWORD *)(v5 + 9832) = v24;
      }
      *(_BYTE *)(v5 + 9820) = 0;
      v25 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), v24);
      CFDictionaryAddValue(a2, CFSTR("RDMBL"), v25);
      CFRelease(v25);
      v26 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), *(unsigned int *)(v5 + 2980));
      CFDictionaryAddValue(a2, CFSTR("BbD"), v26);
      CFRelease(v26);
      v27 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), (*(_DWORD *)(v5 + 3036) + *(_DWORD *)(v5 + 3032)));
      CFDictionaryAddValue(a2, CFSTR("BbQ"), v27);
      CFRelease(v27);
      v28 = CFStringCreateWithFormat(v6, 0, CFSTR("%d"), *(char *)(v5 + 3031));
      CFDictionaryAddValue(a2, CFSTR("BTPw"), v28);
      CFRelease(v28);
      LODWORD(v29) = *(_DWORD *)(v5 + 2968);
      v30 = CFStringCreateWithFormat(v6, 0, CFSTR("%5.1f"), (double)v29 / 1000.0);
      CFDictionaryAddValue(a2, CFSTR("BbTx"), v30);
      CFRelease(v30);
      LODWORD(v31) = *(_DWORD *)(v5 + 2964);
      v32 = CFStringCreateWithFormat(v6, 0, CFSTR("%5.1f"), (double)v31 / 1000.0);
      CFDictionaryAddValue(a2, CFSTR("InTxR"), v32);
      CFRelease(v32);
      v33 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), *(unsigned int *)(v5 + 9616));
      CFDictionaryAddValue(a2, CFSTR("VPF"), v33);
      CFRelease(v33);
      v34 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), *(unsigned int *)(v5 + 9620));
      CFDictionaryAddValue(a2, CFSTR("APF"), v34);
      CFRelease(v34);
      v35 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), *(unsigned int *)(v5 + 268));
      CFDictionaryAddValue(a2, CFSTR("APRR"), v35);
      CFRelease(v35);
      v36 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), *(unsigned int *)(v5 + 272));
      CFDictionaryAddValue(a2, CFSTR("VPRR"), v36);
      CFRelease(v36);
      v37 = *(unsigned int *)(v5 + 240);
      if ((_DWORD)v37)
        v37 = *(_DWORD *)(v5 + 224) / v37;
      v38 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), v37);
      CFDictionaryAddValue(a2, CFSTR("OVSBR"), v38);
      CFRelease(v38);
      v39 = *(unsigned int *)(v5 + 240);
      if ((_DWORD)v39)
        v39 = *(_DWORD *)(v5 + 228) / v39;
      v40 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), v39);
      CFDictionaryAddValue(a2, CFSTR("UNSBR"), v40);
      CFRelease(v40);
      v41 = *(unsigned int *)(v5 + 240);
      if ((_DWORD)v41)
        v41 = *(_DWORD *)(v5 + 232) / v41;
      v42 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), v41);
      CFDictionaryAddValue(a2, CFSTR("OVBWE"), v42);
      CFRelease(v42);
      v43 = *(unsigned int *)(v5 + 240);
      if ((_DWORD)v43)
        v43 = *(_DWORD *)(v5 + 236) / v43;
      v44 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), v43);
      CFDictionaryAddValue(a2, CFSTR("UNBWE"), v44);
      CFRelease(v44);
      v45 = *(unsigned int *)(v5 + 240);
      if ((_DWORD)v45)
        v45 = (*(double *)(v5 + 208) / (double)v45);
      v46 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), v45);
      CFDictionaryAddValue(a2, CFSTR("WRRTT"), v46);
      CFRelease(v46);
      v47 = *(unsigned int *)(v5 + 240);
      if ((_DWORD)v47)
        v47 = (*(double *)(v5 + 216) / (double)v47);
      v48 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), v47);
      CFDictionaryAddValue(a2, CFSTR("WRBPL"), v48);
      CFRelease(v48);
      pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 40) + 2560));
      v49 = *(_DWORD *)(v5 + 2652);
      if (v49)
      {
        v50 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), *(_DWORD *)(v5 + 2636) / v49);
        CFDictionaryAddValue(a2, CFSTR("RxPC"), v50);
        CFRelease(v50);
        v51 = (*(_DWORD *)(v5 + 2640) / *(_DWORD *)(v5 + 2652));
      }
      else
      {
        v52 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), 0);
        CFDictionaryAddValue(a2, CFSTR("RxPC"), v52);
        CFRelease(v52);
        v51 = 0;
      }
      v53 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), v51);
      CFDictionaryAddValue(a2, CFSTR("RxSC"), v53);
      CFRelease(v53);
      if (v49)
      {
        v54 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), (*(_DWORD *)(v5 + 2644) / *(_DWORD *)(v5 + 2652)));
        CFDictionaryAddValue(a2, CFSTR("TxPC"), v54);
        CFRelease(v54);
        v55 = (*(_DWORD *)(v5 + 2644) / *(_DWORD *)(v5 + 2652));
      }
      else
      {
        v56 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), 0);
        CFDictionaryAddValue(a2, CFSTR("TxPC"), v56);
        CFRelease(v56);
        v55 = 0;
      }
      v57 = CFStringCreateWithFormat(v6, 0, CFSTR("%u"), v55);
      CFDictionaryAddValue(a2, CFSTR("TxSC"), v57);
      CFRelease(v57);
      *(_DWORD *)(v5 + 2636) = 0;
      *(_QWORD *)(v5 + 2640) = 0;
      *(_DWORD *)(v5 + 2652) = 0;
      pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 40) + 2560));
      *(_OWORD *)(v5 + 192) = 0u;
      *(_OWORD *)(v5 + 208) = 0u;
      *(_OWORD *)(v5 + 224) = 0u;
      *(_DWORD *)(v5 + 240) = 0;
      *(_OWORD *)(v5 + 9608) = 0u;
    }
    else
    {
      v15 = vmlaq_f64(*(float64x2_t *)(result + 192), (float64x2_t)vdupq_n_s64(0x40C3880000000000uLL), *(float64x2_t *)(result + 176));
      v16 = *(double *)(result + 216);
      v17 = *(double *)(result + 208) + *(double *)(result + 56) * 1000.0;
      *(float64x2_t *)(result + 192) = v15;
      *(_QWORD *)(result + 56) = 0;
      LODWORD(v15.f64[0]) = *(_DWORD *)(result + 64);
      *(double *)(result + 208) = v17;
      *(double *)(result + 216) = v16 + (double)*(unint64_t *)&v15.f64[0];
      *(_DWORD *)(result + 64) = 0;
      if (!*(_DWORD *)(result + 2404))
      {
        v18 = 1000 * *(_DWORD *)(result + 252);
        v19 = *(_DWORD *)(result + 44);
        if (v19 >= v18)
          *(_DWORD *)(result + 232) += (v19 - v18) / 0x3E8;
        else
          *(_DWORD *)(result + 236) += (v18 - v19) / 0x3E8;
        v58 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1392) + *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1388);
        if (v58 >= v19)
          *(_DWORD *)(result + 224) += (v58 - v19) / 0x3E8;
        else
          *(_DWORD *)(result + 228) += (v19 - v58) / 0x3E8;
      }
      ++*(_DWORD *)(result + 240);
    }
    return CheckOutHandleDebug();
  }
  return result;
}

@end
