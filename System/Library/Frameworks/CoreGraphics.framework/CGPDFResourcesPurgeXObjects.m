@implementation CGPDFResourcesPurgeXObjects

void __CGPDFResourcesPurgeXObjects_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Value;
  const void *v4;
  uint64_t v5;
  uint64_t v6;
  const void **v7;

  if (!*(_DWORD *)(a3 + 16))
  {
    Value = CGPDFXObjectGetValue(a3);
    if (Value)
    {
      v4 = (const void *)Value;
      v5 = *(_QWORD *)(Value + 24);
      if (v5)
      {
        v6 = *(_QWORD *)(v5 + 48);
        if (v6)
        {
          pthread_mutex_lock((pthread_mutex_t *)(v6 + 72));
          v7 = *(const void ***)(v6 + 48);
          if (v7)
          {
            if (*v7 == v4)
            {
              *(_QWORD *)(v6 + 48) = 0;
              CGPDFAssociationRelease(v7);
            }
          }
          pthread_mutex_unlock((pthread_mutex_t *)(v6 + 72));
        }
      }
    }
  }
}

@end
