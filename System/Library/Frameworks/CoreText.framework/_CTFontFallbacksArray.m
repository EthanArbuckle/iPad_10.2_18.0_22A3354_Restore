@implementation _CTFontFallbacksArray

- (uint64_t)objectAtIndex:(int)a3 shouldLock:(int)a4 addRanges:
{
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  TDescriptor **v11;
  uint64_t v12;
  TDescriptor *v13;
  TBaseFont *v14;
  void *v15;
  TDescriptor **v16;
  unint64_t v17;
  void *v18;
  void *v20;
  TDescriptor **v21;
  TDescriptor **v22;
  TDescriptor *v23;
  double v24;
  double v25;
  const __CFString *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  const __CFArray *v31;
  const __CFArray *v32;
  CFIndex Count;
  const __CFArray *v34;
  CFIndex i;
  const __CFArray *v36;
  __CFString *ValueAtIndex;
  const __CFDictionary *v38;
  float64x2_t v39;
  double v40;
  const __CFString *v42;
  int v43;
  void *v44;
  const __CFString *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  const __CFArray *v49;
  const __CFArray *v50;
  CFIndex v51;
  const __CFArray *v52;
  CFIndex v53;
  TDescriptor **v54;
  TDescriptor **v55;
  TDescriptor *v56;
  TBaseFont *v57;
  double v59;
  double v60;
  void *v61;
  int v62;
  void *v64;
  TDescriptor **v65;
  TDescriptor **v66;
  TDescriptor *v67;
  const TBaseFont *v68;
  TBaseFont *v69;
  unint64_t v70;
  void *v71;
  void *v72;
  void *isa;
  void *v74;
  TDescriptor **v75;
  TDescriptor **v76;
  TDescriptor *v77;
  unint64_t v78;
  TDescriptorSource *v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const __CFCharacterSet *v83;
  CFIndex j;
  void *v85;
  const __CFArray *v86;
  const __CFArray *v87;
  CFIndex v88;
  void *v89;
  const __CFArray *v90;
  const __CFArray *v91;
  const void *v92;
  uint64_t v93;
  unint64_t v94;
  const __CFCharacterSet *v96;
  void *v98;
  void *v99;
  __CFString *v100;
  CFIndex v101;
  CFIndex v102;
  int v103;
  uint64_t v104;
  int v105;
  id v106;
  id v107;
  TBaseFont *v108;
  id v109;
  TPurgeableCache *v110;
  __CFString v111;
  id v112;
  id v113;
  id v114;
  id v115[2];

  if (!a1)
    return 0;
  if (a3)
    os_unfair_lock_lock_with_options();
  v8 = 0x1ECDE6000uLL;
  v9 = objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", a2);
  v10 = 0x1E0C99000uLL;
  if (v9 != objc_msgSend(MEMORY[0x1E0C99E38], "null"))
  {
    if (a3)
      goto LABEL_117;
    return v9;
  }
  v103 = a4;
  if (a3)
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  v106 = (id)0xAAAAAAAAAAAAAAAALL;
  v104 = *(_QWORD *)(a1 + 16);
  v11 = (TDescriptor **)objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a2);
  v12 = *(_QWORD *)(a1 + 24);
  v105 = *(_DWORD *)(a1 + 64);
  v108 = (TBaseFont *)0xAAAAAAAAAAAAAAAALL;
  v109 = v11;
  v13 = v11[5];
  if ((*((_DWORD *)v13 + 4) & 0x80000000) == 0)
    TDescriptor::InitBaseFont(v11[5], 0, 0.0);
  v14 = (TBaseFont *)atomic_load((unint64_t *)v13 + 4);
  v108 = v14;
  if (!v14)
  {
    v15 = (void *)atomic_load((unint64_t *)&v109);
    v16 = v15;
    TDescriptor::CreateMatchingDescriptor(v16[5], 0, 0.0, 0, (TDescriptor *)&v111);
    do
      v17 = __ldaxr((unint64_t *)&v111);
    while (__stlxr(0, (unint64_t *)&v111));
    do
      v18 = (void *)__ldaxr((unint64_t *)&v109);
    while (__stlxr(v17, (unint64_t *)&v109));

    if (atomic_load((unint64_t *)&v109))
    {
      v20 = (void *)atomic_load((unint64_t *)&v109);
      v21 = v20;
      v22 = v21;
      v23 = v21[5];
      if ((*((_DWORD *)v23 + 4) & 0x80000000) == 0)
        TDescriptor::InitBaseFont(v21[5], 0, 0.0);
      v14 = (TBaseFont *)atomic_load((unint64_t *)v23 + 4);
      v108 = v14;

      if (v14)
        goto LABEL_19;
      v111.isa = v11;
      do
        v99 = (void *)__ldaxr((unint64_t *)&v111);
      while (__stlxr(0, (unint64_t *)&v111));
    }
    else
    {
      v111.isa = v11;
      do
        v99 = (void *)__ldaxr((unint64_t *)&v111);
      while (__stlxr(0, (unint64_t *)&v111));
    }
    v106 = v99;
    isa = v111.isa;
    goto LABEL_86;
  }
LABEL_19:
  v107 = (id)0xAAAAAAAAAAAAAAAALL;
  v115[0] = 0;
  if (!v12)
  {
    do
LABEL_70:
      v61 = (void *)__ldaxr((unint64_t *)v115);
    while (__stlxr(0, (unint64_t *)v115));
    v107 = v61;
    goto LABEL_72;
  }
  v24 = TBaseFont::TraitsDistance(v14, (const TTraitsValues *)v12);
  if (v24 <= 0.000001 || (v25 = v24, (*(unsigned int (**)(TBaseFont *))(*(_QWORD *)v14 + 712))(v14)))
  {
    v107 = 0;
LABEL_72:
    v62 = v105;
    goto LABEL_73;
  }
  v114 = (id)0xAAAAAAAAAAAAAAAALL;
  (*(void (**)(id *__return_ptr, TBaseFont *, const __CFString *))(*(_QWORD *)v14 + 72))(&v114, v14, CFSTR("CTFontSyntheticFamilyName"));
  if (!atomic_load((unint64_t *)&v114))
  {
LABEL_69:

    goto LABEL_70;
  }
  v113 = 0;
  v27 = (const __CFString *)atomic_load((unint64_t *)&v114);
  CopyPostScriptNamesForFamily(v27, 0, &v111);
  do
    v28 = __ldaxr((unint64_t *)&v111);
  while (__stlxr(0, (unint64_t *)&v111));
  do
    v29 = (void *)__ldaxr((unint64_t *)&v113);
  while (__stlxr(v28, (unint64_t *)&v113));

  v30 = (void *)atomic_load((unint64_t *)&v113);
  v31 = v30;
  if (v31)
  {
    v32 = v31;
    Count = CFArrayGetCount(v31);

    if (Count >= 2)
    {
      v112 = 0;
      v34 = (const __CFArray *)atomic_load((unint64_t *)&v113);
      if (v34)
      {
        v101 = CFArrayGetCount(v34);
        if (v101)
        {
          for (i = 0; i != v101; ++i)
          {
            v36 = v34;
            ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(v34, i);
            CopyAttributeForSystemFont(ValueAtIndex, CFSTR("NSCTFontTraitsAttribute"), (const __CFString **)&v111);
            do
              v38 = (const __CFDictionary *)__ldaxr((unint64_t *)&v111);
            while (__stlxr(0, (unint64_t *)&v111));

            if (v38)
            {
              v111 = *(__CFString *)ymmword_18494F798;
              TTraitsValues::TTraitsValues((TTraitsValues *)&v111, v38);
              v39 = vsubq_f64(*(float64x2_t *)&v111.info, *(float64x2_t *)(v12 + 8));
              v40 = vaddvq_f64(vmulq_f64(v39, v39))
                  + (*(double *)&v111.length - *(double *)(v12 + 24))
                  * (*(double *)&v111.length - *(double *)(v12 + 24));
              if (v40 <= 0.000001)
              {
                TDescriptorSource::TDescriptorSource((TDescriptorSource *)&v110);
                TDescriptorSource::CopyFontDescriptorPerPostScriptName(&v110, ValueAtIndex, 0x43uLL, 9, 0, 0, 0, -1, (unint64_t *)&v107, (const void *)*MEMORY[0x1E0C9AE40]);

                goto LABEL_120;
              }
              if (v25 - v40 > 0.000001)
              {
                TCFRef<__CTFont const*>::Retain((unint64_t *)&v112, ValueAtIndex);
                v25 = v40;
              }
            }

            v34 = v36;
          }
        }
      }
      if (atomic_load((unint64_t *)&v112))
      {
        TDescriptorSource::TDescriptorSource((TDescriptorSource *)&v111);
        v42 = (const __CFString *)atomic_load((unint64_t *)&v112);
        TDescriptorSource::CopyFontDescriptorPerPostScriptName((TPurgeableCache **)&v111, v42, 0x43uLL, 9, 0, 0, 0, -1, (unint64_t *)&v107, (const void *)*MEMORY[0x1E0C9AE40]);
LABEL_120:
        v8 = 0x1ECDE6000;
        v10 = 0x1E0C99000;

        goto LABEL_121;
      }

      v10 = 0x1E0C99000uLL;
    }
  }
  else
  {

  }
  if (qword_1EDD17220 != -1)
    dispatch_once_f(&qword_1EDD17220, 0, (dispatch_function_t)TFallbacksSource::GetCache(void)::{lambda(void *)#1}::__invoke);
  v43 = dword_1EDD171BC;
  if (v43 != GetLocaleChangedCount())
  {
    v44 = (void *)atomic_load((unint64_t *)qword_1EDD17218);
    objc_msgSend(v44, "removeAllObjects");
    dword_1EDD171BC = GetLocaleChangedCount();
  }
  v112 = (id)qword_1EDD17218;
  v45 = (const __CFString *)atomic_load((unint64_t *)&v114);
  TFallbacksSource::CopyDescriptorsForFamily((TPurgeableCache **)&v112, v45, (unint64_t *)&v111);
  do
    v46 = __ldaxr((unint64_t *)&v111);
  while (__stlxr(0, (unint64_t *)&v111));
  do
    v47 = (void *)__ldaxr((unint64_t *)&v113);
  while (__stlxr(v46, (unint64_t *)&v113));

  v48 = (void *)atomic_load((unint64_t *)&v113);
  v49 = v48;
  if (!v49)
  {

LABEL_68:
    v8 = 0x1ECDE6000uLL;
    goto LABEL_69;
  }
  v50 = v49;
  v51 = CFArrayGetCount(v49);

  if (v51 < 2)
    goto LABEL_68;
  v52 = (const __CFArray *)atomic_load((unint64_t *)&v113);
  if (!v52)
    goto LABEL_68;
  v102 = CFArrayGetCount(v52);
  if (!v102)
    goto LABEL_68;
  v53 = 0;
  v100 = (__CFString *)*MEMORY[0x1E0C9B0D0];
  while (1)
  {
    v54 = (TDescriptor **)CFArrayGetValueAtIndex(v52, v53);
    if (v54 == (TDescriptor **)v100)
      goto LABEL_65;
    v55 = v54;
    v56 = v54[5];
    if ((*((_DWORD *)v56 + 4) & 0x80000000) == 0)
      TDescriptor::InitBaseFont(v54[5], 0, 0.0);
    v57 = (TBaseFont *)atomic_load((unint64_t *)v56 + 4);
    if (!v57 || v14 == v57)
      goto LABEL_65;
    v59 = TBaseFont::TraitsDistance(v57, (const TTraitsValues *)v12);
    if (v59 <= 0.000001)
      break;
    v60 = v59;
    if (v25 - v59 > 0.000001)
    {
      TCFRef<__CTFont const*>::Retain((unint64_t *)v115, v55);
      v25 = v60;
    }
LABEL_65:
    if (v102 == ++v53)
      goto LABEL_68;
  }
  v111.isa = v55;
  do
    v98 = (void *)__ldaxr((unint64_t *)&v111);
  while (__stlxr(0, (unint64_t *)&v111));
  v107 = v98;

  v8 = 0x1ECDE6000;
LABEL_121:
  v62 = v105;

LABEL_73:
  if (atomic_load((unint64_t *)&v107))
  {
    v64 = (void *)atomic_load((unint64_t *)&v107);
    v65 = v64;
    v66 = v65;
    v67 = v65[5];
    if ((*((_DWORD *)v67 + 4) & 0x80000000) == 0)
      TDescriptor::InitBaseFont(v65[5], 0, 0.0);
    v68 = (const TBaseFont *)atomic_load((unint64_t *)v67 + 4);

    if (v68)
    {
      if (((*(uint64_t (**)(const TBaseFont *, uint64_t))(*(_QWORD *)v68 + 32))(v68, v104) & 1) != 0)
      {
        v69 = (TBaseFont *)operator new(0x258uLL, MEMORY[0x1E0DE4E10]);
        if (v69)
          TBaseFont::TBaseFont(v69, v68);
        v108 = v69;
        TCFBase_NEW<CTFontDescriptor,TBaseFont const*&>((uint64_t *)&v108, (unint64_t *)&v111);
        do
          v70 = __ldaxr((unint64_t *)&v111);
        while (__stlxr(0, (unint64_t *)&v111));
        do
          v71 = (void *)__ldaxr((unint64_t *)&v109);
        while (__stlxr(v70, (unint64_t *)&v109));

      }
      else
      {
        v72 = (void *)atomic_load((unint64_t *)&v107);
        TCFRef<__CTFont const*>::Retain((unint64_t *)&v109, v72);
      }
    }
  }
  TDescriptorSource::CopyPossibleSystemUIFontDescriptor((unint64_t *)&v109, v62, (unint64_t *)&v106);
  isa = v107;
LABEL_86:

  if (a3)
    os_unfair_lock_lock_with_options();
  v9 = objc_msgSend(*(id *)(a1 + *(int *)(v8 + 3236)), "objectAtIndex:", a2);
  if (v9 == objc_msgSend(*(id *)(v10 + 3640), "null"))
  {
    v74 = (void *)atomic_load((unint64_t *)&v106);
    v75 = v74;
    v76 = v75;
    v77 = v75[5];
    if ((*((_DWORD *)v77 + 4) & 0x80000000) == 0)
      TDescriptor::InitBaseFont(v75[5], 0, 0.0);
    v78 = atomic_load((unint64_t *)v77 + 4);

    if (v78
      && ((*(uint64_t (**)(unint64_t, _QWORD))(*(_QWORD *)v78 + 32))(v78, *(_QWORD *)(a1 + 16)) & 1) == 0)
    {
      v79 = (TDescriptorSource *)os_unfair_lock_lock_with_options();
      v80 = *(_QWORD *)(a1 + 56);
      TDescriptorSource::EnsureFontFallbacksCache(v79);
      TFontFallbacks::GetCharRangeMapForKey((TFontFallbacks *)TDescriptorSource::sFontFallbacksCache, v80);
      if (v103)
      {
        v82 = v81;
        if ((*(unsigned int (**)(unint64_t))(*(_QWORD *)v78 + 16))(v78) == 1414743620
          && ((*(uint64_t (**)(unint64_t))(*(_QWORD *)v78 + 840))(v78) & 1) == 0)
        {
          v111.isa = (void *)0xAAAAAAAAAAAAAAAALL;
          (*(void (**)(__CFString *__return_ptr, unint64_t))(*(_QWORD *)v78 + 504))(&v111, v78);
          for (j = 0; ; ++j)
          {
            v85 = (void *)atomic_load((unint64_t *)&v111);
            v86 = v85;
            v87 = v86;
            v88 = v86 ? CFArrayGetCount(v86) : 0;

            if (j >= v88)
              break;
            v89 = (void *)atomic_load((unint64_t *)&v111);
            v90 = v89;
            v91 = v90;
            if (v90)
              v92 = CFArrayGetValueAtIndex(v90, j);
            else
              v92 = 0;

            v93 = *((_QWORD *)v92 + 5);
            if ((*(_DWORD *)(v93 + 16) & 0x80000000) == 0)
              TDescriptor::InitBaseFont(*((TDescriptor **)v92 + 5), 0, 0.0);
            v94 = atomic_load((unint64_t *)(v93 + 32));
            if (v94
              && ((*(uint64_t (**)(unint64_t, _QWORD))(*(_QWORD *)v94 + 32))(v94, *(_QWORD *)(a1 + 16)) & 1) == 0)
            {
              v115[0] = (id)0xAAAAAAAAAAAAAAAALL;
              (*(void (**)(id *__return_ptr, unint64_t))(*(_QWORD *)v94 + 176))(v115, v94);
              if (!atomic_load((unint64_t *)v115))
              {
                v114 = (id)0xAAAAAAAAAAAAAAAALL;
                (*(void (**)(id *__return_ptr, unint64_t))(*(_QWORD *)v94 + 184))(&v114, v94);
                v96 = (const __CFCharacterSet *)atomic_load((unint64_t *)&v114);
                CharRangeToDescriptorMap::AddRangesForDescriptorIndex(v82, v96, 100 * a2 + j);

              }
            }
          }

          v8 = 0x1ECDE6000uLL;
        }
        else
        {
          v111.isa = (void *)0xAAAAAAAAAAAAAAAALL;
          (*(void (**)(__CFString *__return_ptr, unint64_t))(*(_QWORD *)v78 + 184))(&v111, v78);
          v83 = (const __CFCharacterSet *)atomic_load((unint64_t *)&v111);
          CharRangeToDescriptorMap::AddRangesForDescriptorIndex(v82, v83, a2);

        }
      }
      os_unfair_lock_unlock(&TDescriptorSource::sFontFallbacksLock);
    }
    v9 = atomic_load((unint64_t *)&v106);
    objc_msgSend(*(id *)(a1 + *(int *)(v8 + 3236)), "replaceObjectAtIndex:withObject:", a2, v9);
  }

  if (a3)
LABEL_117:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  return v9;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[_CTFontFallbacksArray objectAtIndex:shouldLock:addRanges:]((uint64_t)self, a3, 1, 1);
}

- (unint64_t)count
{
  return self->_count;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CTFontFallbacksArray;
  -[_CTFontFallbacksArray dealloc](&v3, sel_dealloc);
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  TUnfairLock *p_lock;

  length = a4.length;
  location = a4.location;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  for (; length; --length)
    *a3++ = (id)-[_CTFontFallbacksArray objectAtIndex:shouldLock:addRanges:]((uint64_t)self, location++, 0, 0);
  os_unfair_lock_unlock(&p_lock->fLock);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CTFontFallbacksArray;
  return -[_CTFontFallbacksArray countByEnumeratingWithState:objects:count:](&v6, sel_countByEnumeratingWithState_objects_count_, a3, a4, 1);
}

@end
