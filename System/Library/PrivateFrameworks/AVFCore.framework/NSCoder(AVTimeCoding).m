@implementation NSCoder(AVTimeCoding)

- (void)encodeCMTime:()AVTimeCoding forKey:
{
  const __CFAllocator *v6;
  CFDictionaryRef v7;
  CMTime v8;

  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v8 = *a3;
  v7 = CMTimeCopyAsDictionary(&v8, v6);
  objc_msgSend(a1, "encodeObject:forKey:", v7, a4);
  if (v7)
    CFRelease(v7);
}

- (CMTime)decodeCMTimeForKey:()AVTimeCoding
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = (const __CFDictionary *)objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0), a2);
  return CMTimeMakeFromDictionary(a3, v9);
}

- (void)encodeCMTimeRange:()AVTimeCoding forKey:
{
  const __CFAllocator *v6;
  __int128 v7;
  CFDictionaryRef v8;
  CMTimeRange v9;

  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = a3[1];
  *(_OWORD *)&v9.start.value = *a3;
  *(_OWORD *)&v9.start.epoch = v7;
  *(_OWORD *)&v9.duration.timescale = a3[2];
  v8 = CMTimeRangeCopyAsDictionary(&v9, v6);
  objc_msgSend(a1, "encodeObject:forKey:", v8, a4);
  if (v8)
    CFRelease(v8);
}

- (CMTimeRange)decodeCMTimeRangeForKey:()AVTimeCoding
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = (const __CFDictionary *)objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0), a2);
  return CMTimeRangeMakeFromDictionary(a3, v9);
}

- (void)encodeCMTimeMapping:()AVTimeCoding forKey:
{
  const __CFAllocator *v7;
  __int128 v8;
  CFDictionaryRef v9;
  __int128 v10;
  CFDictionaryRef v11;
  void *v12;
  CMTimeRange range;

  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v8 = a3[1];
  *(_OWORD *)&range.start.value = *a3;
  *(_OWORD *)&range.start.epoch = v8;
  *(_OWORD *)&range.duration.timescale = a3[2];
  v9 = CMTimeRangeCopyAsDictionary(&range, v7);
  v10 = a3[4];
  *(_OWORD *)&range.start.value = a3[3];
  *(_OWORD *)&range.start.epoch = v10;
  *(_OWORD *)&range.duration.timescale = a3[5];
  v11 = CMTimeRangeCopyAsDictionary(&range, v7);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v9, v11, 0);
  objc_msgSend(a1, "encodeObject:forKey:", v12, a4);

  if (v9)
    CFRelease(v9);
  if (v11)
    CFRelease(v11);
}

- (double)decodeCMTimeMappingForKey:()AVTimeCoding
{
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double result;
  __int128 v16;
  __int128 v17;
  CMTimeRange v18;

  v6 = MEMORY[0x1E0CA2E40];
  v7 = *MEMORY[0x1E0CA2E40];
  v8 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *a3 = *MEMORY[0x1E0CA2E40];
  a3[1] = v8;
  v9 = *(_OWORD *)(v6 + 32);
  a3[2] = v9;
  a3[3] = v7;
  a3[4] = v8;
  a3[5] = v9;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = (void *)objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0), a2);
  if (objc_msgSend(v14, "count") == 2)
  {
    CMTimeRangeMakeFromDictionary(&v18, (CFDictionaryRef)objc_msgSend(v14, "objectAtIndex:", 0));
    v16 = *(_OWORD *)&v18.start.epoch;
    *a3 = *(_OWORD *)&v18.start.value;
    a3[1] = v16;
    a3[2] = *(_OWORD *)&v18.duration.timescale;
    CMTimeRangeMakeFromDictionary(&v18, (CFDictionaryRef)objc_msgSend(v14, "objectAtIndex:", 1));
    v17 = *(_OWORD *)&v18.start.epoch;
    a3[3] = *(_OWORD *)&v18.start.value;
    a3[4] = v17;
    result = *(double *)&v18.duration.timescale;
    a3[5] = *(_OWORD *)&v18.duration.timescale;
  }
  return result;
}

@end
