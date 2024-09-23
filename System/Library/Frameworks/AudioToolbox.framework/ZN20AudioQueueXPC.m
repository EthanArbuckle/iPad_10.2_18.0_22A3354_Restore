@implementation ZN20AudioQueueXPC

int *___ZN20AudioQueueXPC_Bridge10TestMethodEii_block_invoke(uint64_t a1)
{
  int *result;
  uint64_t v3;
  int v4;
  char v5;

  result = (int *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 40) + 24) + 424))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v3 + 48))
  {
    v4 = (int)result;
    v5 = BYTE4(result);
    return caulk::expected<std::tuple<int>,int>::swap(&v4, (int *)(v3 + 40));
  }
  else
  {
    *(_QWORD *)(v3 + 40) = result;
    *(_BYTE *)(v3 + 48) = 1;
  }
  return result;
}

int *___ZN20AudioQueueXPC_Bridge12SubmixTapNewEjj_block_invoke(uint64_t a1)
{
  int *result;
  uint64_t v3;
  int v4;
  char v5;

  result = (int *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 40) + 24) + 392))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v3 + 48))
  {
    v4 = (int)result;
    v5 = BYTE4(result);
    return caulk::expected<std::tuple<int>,int>::swap(&v4, (int *)(v3 + 40));
  }
  else
  {
    *(_QWORD *)(v3 + 40) = result;
    *(_BYTE *)(v3 + 48) = 1;
  }
  return result;
}

_QWORD *___ZN20AudioQueueXPC_Bridge16ProcessingTapNewEjji_block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  _OWORD *v4;
  int v5;
  char v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[48];
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  result = (*(_QWORD *(**)(_BYTE *__return_ptr, _QWORD, _QWORD, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 40) + 24)
                                                                                          + 336))(v13, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = (_OWORD *)(v3 + 40);
  if (!*(_BYTE *)(v3 + 96))
  {
    v9 = v14;
    v10 = *(_OWORD *)&v13[32];
    v11 = *(_OWORD *)&v13[16];
    *v4 = *(_OWORD *)v13;
    *(_OWORD *)(v3 + 56) = v11;
    *(_OWORD *)(v3 + 72) = v10;
    *(_QWORD *)(v3 + 88) = v9;
    *(_BYTE *)(v3 + 96) = 1;
    return result;
  }
  v5 = *(_DWORD *)&v13[4];
  v15 = *(_OWORD *)&v13[8];
  v16 = *(_OWORD *)&v13[24];
  v17 = *(_QWORD *)&v13[40];
  v6 = v14;
  if ((_BYTE)v14 && *(_BYTE *)(v3 + 88))
  {
    *(_DWORD *)(v3 + 40) = *(_DWORD *)v13;
    *(_DWORD *)(v3 + 44) = v5;
    v7 = v17;
    v8 = v16;
    *(_OWORD *)(v3 + 48) = v15;
    *(_OWORD *)(v3 + 64) = v8;
    *(_QWORD *)(v3 + 80) = v7;
    return result;
  }
  if ((_BYTE)v14)
  {
    if (!*(_BYTE *)(v3 + 88))
    {
      *(_DWORD *)(v3 + 40) = *(_DWORD *)v13;
      *(_DWORD *)(v3 + 44) = v5;
      v12 = v16;
      *(_OWORD *)(v3 + 48) = v15;
      *(_OWORD *)(v3 + 64) = v12;
      *(_QWORD *)(v3 + 80) = v17;
      *(_BYTE *)(v3 + 88) = v6;
      return result;
    }
  }
  else if (*(_BYTE *)(v3 + 88))
  {
    *(_DWORD *)(v3 + 40) = *(_DWORD *)v13;
    *(_BYTE *)(v3 + 88) = 0;
    return result;
  }
  *(_DWORD *)v4 = *(_DWORD *)v13;
  return result;
}

int *___ZN20AudioQueueXPC_Bridge20MixerGetPropertySizeEjj_block_invoke(uint64_t a1)
{
  int *result;
  uint64_t v3;
  int v4;
  char v5;

  result = (int *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 40) + 24) + 304))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v3 + 48))
  {
    v4 = (int)result;
    v5 = BYTE4(result);
    return caulk::expected<std::tuple<int>,int>::swap(&v4, (int *)(v3 + 40));
  }
  else
  {
    *(_QWORD *)(v3 + 40) = result;
    *(_BYTE *)(v3 + 48) = 1;
  }
  return result;
}

_QWORD *___ZN20AudioQueueXPC_Bridge19QueueGetCurrentTimeEji_block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  _OWORD *v4;
  char v5;
  char v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[32];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  result = (*(_QWORD *(**)(_BYTE *__return_ptr, _QWORD, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 40)
                                                                                                + 24)
                                                                                  + 192))(v9, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = (_OWORD *)(v3 + 40);
  if (!*(_BYTE *)(v3 + 88))
  {
    v7 = v10;
    v8 = *(_OWORD *)&v9[16];
    *v4 = *(_OWORD *)v9;
    *(_OWORD *)(v3 + 56) = v8;
    *(_OWORD *)(v3 + 72) = v7;
    *(_BYTE *)(v3 + 88) = 1;
    return result;
  }
  v5 = v10;
  v6 = BYTE8(v10);
  if (BYTE8(v10) && *(_BYTE *)(v3 + 80))
  {
    *(_DWORD *)(v3 + 40) = *(_DWORD *)v9;
    *(_OWORD *)(v3 + 44) = *(_OWORD *)&v9[4];
    *(_OWORD *)(v3 + 56) = *(_OWORD *)&v9[16];
    *(_BYTE *)(v3 + 72) = v5;
    return result;
  }
  if (BYTE8(v10))
  {
    if (!*(_BYTE *)(v3 + 80))
    {
      *(_DWORD *)(v3 + 40) = *(_DWORD *)v9;
      *(_OWORD *)(v3 + 44) = *(_OWORD *)&v9[4];
      *(_OWORD *)(v3 + 56) = *(_OWORD *)&v9[16];
      *(_BYTE *)(v3 + 72) = v5;
      *(_DWORD *)(v3 + 73) = *(_DWORD *)((char *)&v10 + 1);
      *(_DWORD *)(v3 + 76) = DWORD1(v10);
      *(_BYTE *)(v3 + 80) = v6;
      return result;
    }
  }
  else if (*(_BYTE *)(v3 + 80))
  {
    *(_DWORD *)(v3 + 40) = *(_DWORD *)v9;
    *(_BYTE *)(v3 + 80) = 0;
    return result;
  }
  *(_DWORD *)v4 = *(_DWORD *)v9;
  return result;
}

int *___ZN20AudioQueueXPC_Bridge14CreateTimelineEj_block_invoke(uint64_t a1)
{
  int *result;
  uint64_t v3;
  int v4;
  char v5;

  result = (int *)(*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 40) + 24) + 176))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(unsigned int *)(a1 + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v3 + 48))
  {
    v4 = (int)result;
    v5 = BYTE4(result);
    return caulk::expected<std::tuple<int>,int>::swap(&v4, (int *)(v3 + 40));
  }
  else
  {
    *(_QWORD *)(v3 + 40) = result;
    *(_BYTE *)(v3 + 48) = 1;
  }
  return result;
}

int *___ZN20AudioQueueXPC_Bridge15GetPropertySizeEjj_block_invoke(uint64_t a1)
{
  int *result;
  uint64_t v3;
  int v4;
  char v5;

  result = (int *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 40) + 24) + 120))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v3 + 48))
  {
    v4 = (int)result;
    v5 = BYTE4(result);
    return caulk::expected<std::tuple<int>,int>::swap(&v4, (int *)(v3 + 40));
  }
  else
  {
    *(_QWORD *)(v3 + 40) = result;
    *(_BYTE *)(v3 + 48) = 1;
  }
  return result;
}

int *___ZN20AudioQueueXPC_Bridge5PrimeEjj_block_invoke(uint64_t a1)
{
  int *result;
  uint64_t v3;
  int v4;
  char v5;

  result = (int *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 40) + 24) + 80))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v3 + 48))
  {
    v4 = (int)result;
    v5 = BYTE4(result);
    return caulk::expected<std::tuple<int>,int>::swap(&v4, (int *)(v3 + 40));
  }
  else
  {
    *(_QWORD *)(v3 + 40) = result;
    *(_BYTE *)(v3 + 48) = 1;
  }
  return result;
}

int *___ZN20AudioQueueXPC_Bridge8NewQueueEb27AudioStreamBasicDescriptionjj_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  int *result;
  uint64_t v6;
  _OWORD v7[2];
  uint64_t v8;
  int v9;
  char v10;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
  v3 = *(unsigned __int8 *)(a1 + 96);
  v4 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v4;
  v8 = *(_QWORD *)(a1 + 80);
  result = (int *)(*(uint64_t (**)(uint64_t, uint64_t, _OWORD *, _QWORD, _QWORD))(*(_QWORD *)v2 + 40))(v2, v3, v7, *(unsigned int *)(a1 + 88), *(unsigned int *)(a1 + 92));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v6 + 48))
  {
    v9 = (int)result;
    v10 = BYTE4(result);
    return caulk::expected<std::tuple<int>,int>::swap(&v9, (int *)(v6 + 40));
  }
  else
  {
    *(_QWORD *)(v6 + 40) = result;
    *(_BYTE *)(v6 + 48) = 1;
  }
  return result;
}

int *___ZN20AudioQueueXPC_Bridge11QueryServerEv_block_invoke(uint64_t a1)
{
  int *result;
  uint64_t v3;
  int v4;
  char v5;

  result = (int *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 40) + 24) + 32))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v3 + 48))
  {
    v4 = (int)result;
    v5 = BYTE4(result);
    return caulk::expected<std::tuple<int>,int>::swap(&v4, (int *)(v3 + 40));
  }
  else
  {
    *(_QWORD *)(v3 + 40) = result;
    *(_BYTE *)(v3 + 48) = 1;
  }
  return result;
}

@end
