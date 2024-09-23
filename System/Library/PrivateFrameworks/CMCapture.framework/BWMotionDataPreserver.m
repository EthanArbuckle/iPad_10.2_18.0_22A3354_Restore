@implementation BWMotionDataPreserver

- (uint64_t)_preserveMotionDataForSampleBuffer:(int)a3 willBeDropped:
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _DWORD *v26;
  int v27;
  uint64_t v28;
  int v29;
  unint64_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  _DWORD *v38;
  void *v39;
  const void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  if (result)
  {
    v5 = result;
    v6 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v7 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B68]);
    v8 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    if (v7)
    {
      v9 = objc_msgSend(v7, "bytes");
      v10 = objc_msgSend(v7, "length");
      v11 = *(_DWORD *)(v9 + 4);
      if (v10 != 40 * v11 + 8 || v11 >= 111)
        goto LABEL_42;
      v12 = *(void **)(v5 + 16);
      if (v12)
      {
        if (a3)
        {
          v13 = *(_QWORD *)(v5 + 24);
          v14 = objc_msgSend(v12, "length");
          v12 = *(void **)(v5 + 16);
          if (v13 < v14)
          {
            objc_msgSend(*(id *)(v5 + 16), "replaceBytesInRange:withBytes:length:", *(_QWORD *)(v5 + 24), objc_msgSend(v12, "length") - *(_QWORD *)(v5 + 24), 0, 0);
            v15 = *(_DWORD *)(v5 + 32);
            *(_DWORD *)(objc_msgSend(*(id *)(v5 + 16), "mutableBytes") + 4) = v15;
            v12 = *(void **)(v5 + 16);
          }
        }
        v16 = *(_DWORD *)(objc_msgSend(v12, "bytes") + 4);
        v17 = *(_DWORD *)(v9 + 4);
        v18 = v17 + v16;
        v19 = 110 - v16;
        if (v18 <= 110)
          v20 = *(_DWORD *)(v9 + 4);
        else
          v20 = v19;
        if (v20)
        {
          v21 = v17 - v19;
          if (v18 <= 110)
            v21 = 0;
          objc_msgSend(*(id *)(v5 + 16), "appendBytes:length:", v9 + 40 * v21 + 8, 40 * v20);
          v22 = objc_msgSend(*(id *)(v5 + 16), "mutableBytes");
          *(_DWORD *)(v22 + 4) += v20;
        }
      }
      else
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithData:", v7);
        *(_QWORD *)(v5 + 16) = v23;
        *(_QWORD *)(v5 + 24) = objc_msgSend(v23, "length");
        *(_DWORD *)(v5 + 32) = *(_DWORD *)(objc_msgSend(*(id *)(v5 + 16), "mutableBytes") + 4);
      }
    }
    v24 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B50]);
    if (!v24)
      return 1;
    v25 = v24;
    v26 = (_DWORD *)objc_msgSend(v24, "bytes");
    if (*v26)
      v27 = 24;
    else
      v27 = 16;
    v28 = objc_msgSend(v25, "length");
    v29 = v26[1];
    if (v28 == v27 * (uint64_t)v29 + 8 && v29 < 511)
    {
      if (!*(_QWORD *)(v5 + 40))
      {
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithData:", v25);
        *(_QWORD *)(v5 + 40) = v39;
        *(_QWORD *)(v5 + 48) = objc_msgSend(v39, "length");
        *(_DWORD *)(v5 + 56) = *(_DWORD *)(objc_msgSend(*(id *)(v5 + 40), "mutableBytes") + 4);
        v40 = *(const void **)(v5 + 64);
        *(_QWORD *)(v5 + 64) = v8;
        if (v8)
          CFRetain(v8);
        if (v40)
          CFRelease(v40);
        return 1;
      }
      if (objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(v5 + 64)))
      {
        if (a3)
        {
          v30 = *(_QWORD *)(v5 + 48);
          if (v30 < objc_msgSend(*(id *)(v5 + 40), "length"))
          {
            objc_msgSend(*(id *)(v5 + 40), "replaceBytesInRange:withBytes:length:", *(_QWORD *)(v5 + 48), objc_msgSend(*(id *)(v5 + 40), "length") - *(_QWORD *)(v5 + 48), 0, 0);
            v31 = *(_DWORD *)(v5 + 56);
            *(_DWORD *)(objc_msgSend(*(id *)(v5 + 40), "mutableBytes") + 4) = v31;
          }
        }
        v32 = *(_DWORD *)(objc_msgSend(*(id *)(v5 + 40), "bytes") + 4);
        v33 = v26[1];
        v34 = v33 + v32;
        v35 = 510 - v32;
        v36 = v33 - (510 - v32);
        if (v34 > 510)
        {
          v37 = v35;
        }
        else
        {
          v36 = 0;
          v37 = v26[1];
        }
        if (v37)
        {
          if (*v26)
            v38 = &v26[6 * v36];
          else
            v38 = &v26[4 * v36];
          objc_msgSend(*(id *)(v5 + 40), "appendBytes:length:", v38 + 2, v27 * (uint64_t)v37);
          v41 = objc_msgSend(*(id *)(v5 + 40), "mutableBytes");
          *(_DWORD *)(v41 + 4) += v37;
        }
        return 1;
      }
LABEL_43:
      objc_msgSend((id)v5, "reset", v42, v43);
      return 0;
    }
LABEL_42:
    fig_log_get_emitter();
    v43 = v3;
    LODWORD(v42) = 0;
    FigDebugAssert3();
    goto LABEL_43;
  }
  return result;
}

- (BWMotionDataPreserver)initWithName:(id)a3
{
  BWMotionDataPreserver *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWMotionDataPreserver;
  v4 = -[BWMotionDataPreserver init](&v6, sel_init);
  if (v4)
    v4->_name = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", a3);
  return v4;
}

- (BOOL)prependPreservedMotionDataToSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  int v5;
  BOOL result;
  void *v7;
  NSMutableData *preservedISPHallData;

  if (self->_preservedISPMotionData)
  {
    v5 = -[BWMotionDataPreserver _preserveMotionDataForSampleBuffer:willBeDropped:]((uint64_t)self, a3, 0);
    result = 0;
    if (!v5)
      return result;
    v7 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_preservedISPMotionData, *MEMORY[0x1E0D06B68]);

    self->_preservedISPMotionData = 0;
    preservedISPHallData = self->_preservedISPHallData;
    if (preservedISPHallData)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", preservedISPHallData, *MEMORY[0x1E0D06B50]);

      self->_preservedISPHallData = 0;
      self->_currentISPHallPortType = 0;
    }
  }
  return 1;
}

- (BOOL)preserveMotionDataForSoonToBeDroppedSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return -[BWMotionDataPreserver _preserveMotionDataForSampleBuffer:willBeDropped:]((uint64_t)self, a3, 1);
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMotionDataPreserver;
  -[BWMotionDataPreserver dealloc](&v3, sel_dealloc);
}

- (void)reset
{

  self->_preservedISPMotionData = 0;
  self->_preservedISPHallData = 0;

  self->_currentISPHallPortType = 0;
}

@end
