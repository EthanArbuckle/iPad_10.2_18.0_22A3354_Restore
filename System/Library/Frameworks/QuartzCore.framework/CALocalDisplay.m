@implementation CALocalDisplay

+ (id)displayWithDisplayId:(unsigned int)a3 name:(id)a4 deviceName:(id)a5 update:(id)a6 timings:(id)a7
{
  malloc_zone_t *malloc_zone;
  CA::Display::Display *v14;
  CA::Display::Display *v15;
  CA::Display::Display *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v21[6];
  _QWORD aBlock[7];

  aBlock[6] = *MEMORY[0x1E0C80C00];
  if (local_display_enabled(void)::once != -1)
  {
    dispatch_once(&local_display_enabled(void)::once, &__block_literal_global_802);
    if (a6)
      goto LABEL_3;
    return 0;
  }
  if (!a6)
    return 0;
LABEL_3:
  if (!local_display_enabled(void)::enabled)
    return 0;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v14 = (CA::Display::Display *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x300uLL, 0x743898A5uLL);
  if (!v14)
    return 0;
  v15 = v14;
  v16 = CA::Display::Display::Display(v14, a4, (const __CFString *)a5, a3);
  *(_QWORD *)v16 = off_1E15998C8;
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___ZN2CA7Display12LocalDisplayC2EPK10__CFStringS4_jU13block_pointerFbP14CALocalDisplayP18CALocalDisplayInfoEU13block_pointerFbS6_P21CALocalDisplayTimingsE_block_invoke;
  aBlock[3] = &unk_1E159C298;
  aBlock[4] = a6;
  aBlock[5] = v16;
  v18 = (_QWORD *)*((_QWORD *)v16 + 14);
  if (v18 != aBlock)
  {
    _Block_release(v18);
    *((_QWORD *)v15 + 14) = _Block_copy(aBlock);
  }
  if (a7)
  {
    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = ___ZN2CA7Display12LocalDisplayC2EPK10__CFStringS4_jU13block_pointerFbP14CALocalDisplayP18CALocalDisplayInfoEU13block_pointerFbS6_P21CALocalDisplayTimingsE_block_invoke_2;
    v21[3] = &unk_1E159C2C0;
    v21[4] = a7;
    v21[5] = v15;
    v19 = (_QWORD *)*((_QWORD *)v15 + 81);
    if (v19 != v21)
    {
      _Block_release(v19);
      *((_QWORD *)v15 + 81) = _Block_copy(v21);
    }
  }
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithDisplay:", v15);
}

+ (void)setDisplayLookupBlock:(id)a3
{
  if (local_display_enabled(void)::once != -1)
    dispatch_once(&local_display_enabled(void)::once, &__block_literal_global_802);
  if (local_display_enabled(void)::enabled)
  {
    if ((id)_local_display_lookup_block != a3)
    {
      _Block_release((const void *)_local_display_lookup_block);
      _local_display_lookup_block = (uint64_t)_Block_copy(a3);
    }
  }
}

+ (void)notifyDisplayAdded:(unsigned int)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  uint64_t v8;
  pthread_mutex_t *v9;
  uint64_t v10;
  __CFRunLoop *v11;

  os_unfair_lock_lock(&CA::Display::MetalLinkItem::_list_lock);
  v4 = CA::Display::MetalLinkItem::_list;
  v5 = qword_1EDD0FCD8;
  if (CA::Display::MetalLinkItem::_list != (_UNKNOWN *)qword_1EDD0FCD8)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = *v4;
      v9 = (pthread_mutex_t *)(*v4 + 136);
      pthread_mutex_lock(v9);
      if (*(_DWORD *)(*(_QWORD *)(v8 + 16) + 104) != a3)
        goto LABEL_9;
      if (!v6)
      {
        v6 = CADisplayLookupFromDisplayId(a3);
        v7 = (id *)*((_QWORD *)v6 + 1);
      }
      os_unfair_lock_lock((os_unfair_lock_t)(v8 + 8));
      CA::Display::DisplayLinkItem::hot_swap_display((id)v8, v7);
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 8));
      CA::Display::DisplayLinkItem::set_preferred_fps_range_locked((CA::Display::DisplayLinkItem *)v8, *(CAFrameRateRange *)(v8 + 76), 0);
      v10 = *(_QWORD *)(v8 + 264);
      if (v10)
      {
        v11 = *(__CFRunLoop **)(v10 + 16);
        pthread_mutex_unlock(v9);
        if (v11)
          CA::Display::DisplayLinkItem::update_link((CA::Display::DisplayLinkItem *)v8, v11);
      }
      else
      {
LABEL_9:
        pthread_mutex_unlock(v9);
      }
      ++v4;
    }
    while (v4 != (_QWORD *)v5);
  }
  os_unfair_lock_unlock(&CA::Display::MetalLinkItem::_list_lock);
}

@end
