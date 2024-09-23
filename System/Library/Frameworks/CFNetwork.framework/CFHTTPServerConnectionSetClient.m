@implementation CFHTTPServerConnectionSetClient

void ___CFHTTPServerConnectionSetClient_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __CFReadStream *v8;
  __CFWriteStream *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *(uint64_t **)(a1 + 40);
  HTTPServerClientOwning::setServerClient(a2 + 8, *(uint64_t **)(a1 + 32), *(_DWORD **)(a2 + 96));
  if (v3)
  {
    v4 = *(_DWORD *)(a2 + 72);
    if (v4 <= 2)
    {
      v5 = *v3;
      if (*v3 == 1)
      {
        v6 = *(_OWORD *)v3;
        v7 = *((_OWORD *)v3 + 2);
        *(_OWORD *)(a2 + 128) = *((_OWORD *)v3 + 1);
        *(_OWORD *)(a2 + 144) = v7;
        *(_OWORD *)(a2 + 112) = v6;
        if (v4 < 2 || v4 == 2 && *(_QWORD *)(a2 + 88) && *(_DWORD *)(*(_QWORD *)(a2 + 96) + 40))
        {
          v8 = *(__CFReadStream **)(a2 + 176);
          if (v8 && CFReadStreamOpen(v8))
          {
            v9 = *(__CFWriteStream **)(a2 + 184);
            if (v9)
              CFWriteStreamOpen(v9);
          }
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v10 = 134217984;
        v11 = v5;
        _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unknown delegate version %ld", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  else
  {
    *(_OWORD *)(a2 + 128) = 0u;
    *(_OWORD *)(a2 + 144) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
  }
}

@end
