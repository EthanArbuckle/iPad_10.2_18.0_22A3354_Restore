@implementation NSData(SCNExtensions)

- (id)_operateOnDataUsingCompressionAlgorithm:()SCNExtensions operation:
{
  id v7;
  int v8;
  uint8_t *v9;
  compression_status v10;
  compression_stream v12;

  if (!objc_msgSend(a1, "length"))
    return 0;
  memset(&v12, 0, sizeof(v12));
  if (a4)
  {
    v7 = 0;
    if (a4 != COMPRESSION_STREAM_DECODE)
      return v7;
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  if (compression_stream_init(&v12, a4, a3) == COMPRESSION_STATUS_ERROR)
    return 0;
  v12.src_ptr = (const uint8_t *)objc_msgSend(a1, "bytes", *(_OWORD *)&v12.dst_ptr, *(_OWORD *)&v12.src_ptr, v12.state);
  v12.src_size = objc_msgSend(a1, "length");
  v9 = (uint8_t *)malloc_type_malloc(0x1000uLL, 0x7548D3B7uLL);
  v12.dst_ptr = v9;
  v12.dst_size = 4096;
  v7 = (id)objc_opt_new();
  while (1)
  {
    v10 = compression_stream_process(&v12, v8);
    if (v10)
      break;
    if (!v12.dst_size)
    {
      objc_msgSend(v7, "appendBytes:length:", v9, 4096);
      v12.dst_ptr = v9;
      v12.dst_size = 4096;
    }
  }
  if (v10 == COMPRESSION_STATUS_ERROR)
  {
    free(v9);
    return 0;
  }
  if (v10 == COMPRESSION_STATUS_END && v12.dst_ptr > v9)
    objc_msgSend(v7, "appendBytes:length:", v9, v12.dst_ptr - v9);
  compression_stream_destroy(&v12);
  free(v9);
  objc_msgSend(v7, "setLength:", objc_msgSend(v7, "length"));
  return v7;
}

- (uint64_t)scn_compressedDataUsingCompressionAlgorithm:()SCNExtensions
{
  return objc_msgSend(a1, "_operateOnDataUsingCompressionAlgorithm:operation:", a3, 0);
}

- (uint64_t)scn_uncompressedDataUsingCompressionAlgorithm:()SCNExtensions
{
  return objc_msgSend(a1, "_operateOnDataUsingCompressionAlgorithm:operation:", a3, 1);
}

- (id)scn_indexedDataEncodingHighWatermarkWithBytesPerIndex:()SCNExtensions
{
  void *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  unint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  unsigned __int8 v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int *v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  _DWORD *v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned __int16 *v24;
  unsigned __int16 *v25;
  unsigned __int16 v26;
  unint64_t v27;
  uint64_t v28;
  _WORD *v29;
  _WORD *v30;
  unsigned __int16 v31;
  unsigned int v32;

  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  switch(a3)
  {
    case 4:
      v15 = (unsigned int *)objc_msgSend(a1, "bytes");
      v16 = (unsigned int *)objc_msgSend(v5, "bytes");
      *v16 = *v15;
      v17 = *v15;
      v18 = objc_msgSend(a1, "length");
      if (v18 >= 8)
      {
        v19 = (v18 >> 2) - 1;
        v20 = v16 + 1;
        v21 = v15 + 1;
        do
        {
          *v20++ = v17 - *v21;
          v23 = *v21++;
          v22 = v23;
          if (v23 > v17)
            v17 = v22;
          --v19;
        }
        while (v19);
      }
      break;
    case 2:
      v24 = (unsigned __int16 *)objc_msgSend(a1, "bytes");
      v25 = (unsigned __int16 *)objc_msgSend(v5, "bytes");
      *v25 = *v24;
      v26 = *v24;
      v27 = objc_msgSend(a1, "length");
      if (v27 >= 4)
      {
        v28 = (v27 >> 1) - 1;
        v29 = v25 + 1;
        v30 = v24 + 1;
        do
        {
          *v29++ = v26 - *v30;
          v32 = (unsigned __int16)*v30++;
          v31 = v32;
          if (v32 > v26)
            v26 = v31;
          --v28;
        }
        while (v28);
      }
      break;
    case 1:
      v6 = (unsigned __int8 *)objc_msgSend(a1, "bytes");
      v7 = (unsigned __int8 *)objc_msgSend(v5, "bytes");
      *v7 = *v6;
      v8 = *v6;
      v9 = objc_msgSend(a1, "length");
      if (v9 >= 2)
      {
        v10 = v9 - 1;
        v11 = v7 + 1;
        v12 = v6 + 1;
        do
        {
          *v11++ = v8 - *v12;
          v14 = *v12++;
          v13 = v14;
          if (v14 > v8)
            v8 = v13;
          --v10;
        }
        while (v10);
      }
      break;
    default:
      -[NSData(SCNExtensions) scn_indexedDataEncodingHighWatermarkWithBytesPerIndex:].cold.1();
  }
  return v5;
}

- (id)scn_indexedDataDecodingHighWatermarkWithBytesPerIndex:()SCNExtensions
{
  void *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  unint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  char *v12;
  char v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int *v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  _DWORD *v20;
  int *v21;
  int v22;
  unsigned int v23;
  unsigned __int16 *v24;
  unsigned __int16 *v25;
  unsigned __int16 v26;
  unint64_t v27;
  uint64_t v28;
  _WORD *v29;
  __int16 *v30;
  __int16 v31;
  unsigned int v32;

  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  switch(a3)
  {
    case 4:
      v15 = (unsigned int *)objc_msgSend(a1, "bytes");
      v16 = (unsigned int *)objc_msgSend(v5, "bytes");
      *v16 = *v15;
      v17 = *v15;
      v18 = objc_msgSend(a1, "length");
      if (v18 >= 8)
      {
        v19 = (v18 >> 2) - 1;
        v20 = v16 + 1;
        v21 = (int *)(v15 + 1);
        do
        {
          v22 = *v21++;
          v23 = v17 - v22;
          *v20++ = v17 - v22;
          if (v17 - v22 > v17)
            v17 = v23;
          --v19;
        }
        while (v19);
      }
      break;
    case 2:
      v24 = (unsigned __int16 *)objc_msgSend(a1, "bytes");
      v25 = (unsigned __int16 *)objc_msgSend(v5, "bytes");
      *v25 = *v24;
      v26 = *v24;
      v27 = objc_msgSend(a1, "length");
      if (v27 >= 4)
      {
        v28 = (v27 >> 1) - 1;
        v29 = v25 + 1;
        v30 = (__int16 *)(v24 + 1);
        do
        {
          v31 = *v30++;
          v32 = (unsigned __int16)(v26 - v31);
          *v29++ = v26 - v31;
          if (v32 > v26)
            v26 = v32;
          --v28;
        }
        while (v28);
      }
      break;
    case 1:
      v6 = (unsigned __int8 *)objc_msgSend(a1, "bytes");
      v7 = (unsigned __int8 *)objc_msgSend(v5, "bytes");
      *v7 = *v6;
      v8 = *v6;
      v9 = objc_msgSend(a1, "length");
      if (v9 >= 2)
      {
        v10 = v9 - 1;
        v11 = v7 + 1;
        v12 = (char *)(v6 + 1);
        do
        {
          v13 = *v12++;
          v14 = (v8 - v13);
          *v11++ = v8 - v13;
          if (v14 > v8)
            v8 = v14;
          --v10;
        }
        while (v10);
      }
      break;
    default:
      -[NSData(SCNExtensions) scn_indexedDataDecodingHighWatermarkWithBytesPerIndex:].cold.1();
  }
  return v5;
}

- (id)scn_indexedDataEncodingDeltaWithBytesPerIndex:()SCNExtensions
{
  void *v5;
  _BYTE *v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  _DWORD *v12;
  _DWORD *v13;
  unint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  _DWORD *v17;
  _WORD *v18;
  _WORD *v19;
  unint64_t v20;
  uint64_t v21;
  _WORD *v22;
  _WORD *v23;

  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  switch(a3)
  {
    case 4:
      v12 = (_DWORD *)objc_msgSend(a1, "bytes");
      v13 = (_DWORD *)objc_msgSend(v5, "bytes");
      *v13 = *v12;
      v14 = objc_msgSend(a1, "length");
      if (v14 >= 8)
      {
        v15 = (v14 >> 2) - 1;
        v16 = v13 + 1;
        v17 = v12 + 1;
        do
        {
          *v16++ = *v17 - *(v17 - 1);
          ++v17;
          --v15;
        }
        while (v15);
      }
      break;
    case 2:
      v18 = (_WORD *)objc_msgSend(a1, "bytes");
      v19 = (_WORD *)objc_msgSend(v5, "bytes");
      *v19 = *v18;
      v20 = objc_msgSend(a1, "length");
      if (v20 >= 4)
      {
        v21 = (v20 >> 1) - 1;
        v22 = v19 + 1;
        v23 = v18 + 1;
        do
        {
          *v22++ = *v23 - *(v23 - 1);
          ++v23;
          --v21;
        }
        while (v21);
      }
      break;
    case 1:
      v6 = (_BYTE *)objc_msgSend(a1, "bytes");
      v7 = (_BYTE *)objc_msgSend(v5, "bytes");
      *v7 = *v6;
      v8 = objc_msgSend(a1, "length");
      if (v8 >= 2)
      {
        v9 = v8 - 1;
        v10 = v7 + 1;
        v11 = v6 + 1;
        do
        {
          *v10++ = *v11 - *(v11 - 1);
          ++v11;
          --v9;
        }
        while (v9);
      }
      break;
    default:
      -[NSData(SCNExtensions) scn_indexedDataEncodingDeltaWithBytesPerIndex:].cold.1();
  }
  return v5;
}

- (id)scn_indexedDataDecodingDeltaWithBytesPerIndex:()SCNExtensions
{
  void *v5;
  _BYTE *v6;
  _BYTE *v7;
  unint64_t v8;
  int v9;
  _BYTE *v10;
  int v11;
  unint64_t v12;
  unsigned __int8 *v13;
  int v14;
  int *v15;
  int *v16;
  unint64_t v17;
  int v18;
  _DWORD *v19;
  int v20;
  uint64_t v21;
  int *v22;
  int v23;
  _WORD *v24;
  _WORD *v25;
  unint64_t v26;
  int v27;
  _WORD *v28;
  int v29;
  uint64_t v30;
  unsigned __int16 *v31;
  int v32;

  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  switch(a3)
  {
    case 4:
      v15 = (int *)objc_msgSend(a1, "bytes");
      v16 = (int *)objc_msgSend(v5, "bytes");
      *v16 = *v15;
      v17 = objc_msgSend(a1, "length");
      if (v17 >= 8)
      {
        v20 = *v16;
        v19 = v16 + 1;
        v18 = v20;
        v21 = (v17 >> 2) - 1;
        v22 = v15 + 1;
        do
        {
          v23 = *v22++;
          v18 += v23;
          *v19++ = v18;
          --v21;
        }
        while (v21);
      }
      break;
    case 2:
      v24 = (_WORD *)objc_msgSend(a1, "bytes");
      v25 = (_WORD *)objc_msgSend(v5, "bytes");
      *v25 = *v24;
      v26 = objc_msgSend(a1, "length");
      if (v26 >= 4)
      {
        v29 = (unsigned __int16)*v25;
        v28 = v25 + 1;
        v27 = v29;
        v30 = (v26 >> 1) - 1;
        v31 = v24 + 1;
        do
        {
          v32 = *v31++;
          v27 += v32;
          *v28++ = v27;
          --v30;
        }
        while (v30);
      }
      break;
    case 1:
      v6 = (_BYTE *)objc_msgSend(a1, "bytes");
      v7 = (_BYTE *)objc_msgSend(v5, "bytes");
      *v7 = *v6;
      v8 = objc_msgSend(a1, "length");
      if (v8 >= 2)
      {
        v11 = *v7;
        v10 = v7 + 1;
        v9 = v11;
        v12 = v8 - 1;
        v13 = v6 + 1;
        do
        {
          v14 = *v13++;
          v9 += v14;
          *v10++ = v9;
          --v12;
        }
        while (v12);
      }
      break;
    default:
      -[NSData(SCNExtensions) scn_indexedDataDecodingDeltaWithBytesPerIndex:].cold.1();
  }
  return v5;
}

- (uint64_t)scn_indexedDataEncodingTrianglePairsWithBytesPerIndex:()SCNExtensions
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned __int16 *v14;
  int v15;
  int v16;
  int v17;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned __int16 *v23;
  int v24;
  int v25;
  int v26;
  unint64_t v27;
  BOOL v28;
  unint64_t v29;
  unint64_t v30;
  unsigned int v31;
  unint64_t v32;
  unsigned int v33;
  int v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  unsigned int v38;
  unsigned int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "bytes");
  v6 = objc_msgSend(a1, "length");
  v7 = v6 / a3;
  v8 = malloc_type_malloc(v6 / a3 * a3, 0xAEF6C906uLL);
  v9 = v8;
  v10 = v8;
  if (v6 >= a3)
  {
    v11 = 0;
    v10 = v8;
    do
    {
      v12 = v11 + 3;
      if (v11 + 3 >= v7)
      {
        v13 = v11 * a3;
      }
      else
      {
        v13 = v11 * a3;
        v14 = (unsigned __int16 *)(v5 + v11 * a3);
        switch(a3)
        {
          case 4uLL:
            v15 = *(_DWORD *)v14;
            v16 = *((_DWORD *)v14 + 1);
            HIDWORD(v45) = *(_DWORD *)v14;
            LODWORD(v46) = v16;
            v17 = *((_DWORD *)v14 + 2);
            break;
          case 2uLL:
            v15 = *v14;
            v16 = v14[1];
            HIDWORD(v45) = v15;
            LODWORD(v46) = v16;
            v17 = v14[2];
            break;
          case 1uLL:
            v15 = *(unsigned __int8 *)v14;
            v16 = *((unsigned __int8 *)v14 + 1);
            HIDWORD(v45) = v15;
            LODWORD(v46) = v16;
            v17 = *((unsigned __int8 *)v14 + 2);
            break;
          default:
            goto LABEL_19;
        }
        HIDWORD(v46) = v17;
        if (v15 != v16 && v16 != v17 && v17 != v15)
        {
          v23 = (unsigned __int16 *)(v5 + v12 * a3);
          if (a3 == 4)
          {
            v44 = *(_QWORD *)v23;
            v25 = *((_DWORD *)v23 + 2);
          }
          else if (a3 == 2)
          {
            v26 = v23[1];
            LODWORD(v44) = *v23;
            HIDWORD(v44) = v26;
            v25 = v23[2];
          }
          else
          {
            v24 = *((unsigned __int8 *)v23 + 1);
            LODWORD(v44) = *(unsigned __int8 *)v23;
            HIDWORD(v44) = v24;
            v25 = *((unsigned __int8 *)v23 + 2);
          }
          v27 = 0;
          LODWORD(v45) = v25;
          v28 = 1;
LABEL_30:
          v29 = 0;
          v30 = v27;
          v31 = *((_DWORD *)&v45 + ++v27);
          if (v27 == 3)
            v32 = 0;
          else
            v32 = v30 + 1;
          v33 = *((_DWORD *)&v45 + v32 + 1);
          while (1)
          {
            if (*((_DWORD *)&v44 + v29) == v33)
            {
              v34 = v29 > 1 ? -2 : 1;
              if (*((_DWORD *)&v44 + (v34 + v29)) == v31)
                break;
            }
            if (++v29 == 3)
            {
              v28 = v30 < 2;
              if (v27 != 3)
                goto LABEL_30;
              goto LABEL_19;
            }
          }
          v35 = v30 + 2;
          v36 = v30 - 1;
          if (v35 >= 3)
            v35 = v36;
          v37 = *((_DWORD *)&v45 + (int)v35 + 1);
          v38 = v29 + 2;
          v39 = v29 - 1;
          if (v38 < 3)
            v39 = v38;
          v40 = *((_DWORD *)&v44 + v39);
          if (v31 >= v33)
          {
            if (a3 == 4)
            {
              *(_DWORD *)v10 = v33;
              *((_DWORD *)v10 + 1) = v31;
              *((_DWORD *)v10 + 2) = v40;
              *((_DWORD *)v10 + 3) = v37;
              if (!v28)
                goto LABEL_60;
            }
            else if (a3 == 2)
            {
              *(_WORD *)v10 = v33;
              *((_WORD *)v10 + 1) = v31;
              *((_WORD *)v10 + 2) = v40;
              *((_WORD *)v10 + 3) = v37;
              if (!v28)
                goto LABEL_63;
            }
            else
            {
              *v10 = v33;
              v10[1] = v31;
              v10[2] = v40;
              v10[3] = v37;
              if (!v28)
                goto LABEL_22;
            }
          }
          else if (a3 == 4)
          {
            *(_DWORD *)v10 = v31;
            *((_DWORD *)v10 + 1) = v33;
            *((_DWORD *)v10 + 2) = v37;
            *((_DWORD *)v10 + 3) = v40;
            if (!v28)
              goto LABEL_60;
          }
          else if (a3 == 2)
          {
            *(_WORD *)v10 = v31;
            *((_WORD *)v10 + 1) = v33;
            *((_WORD *)v10 + 2) = v37;
            *((_WORD *)v10 + 3) = v40;
            if (!v28)
              goto LABEL_63;
          }
          else
          {
            *v10 = v31;
            v10[1] = v33;
            v10[2] = v37;
            v10[3] = v40;
            if (!v28)
              goto LABEL_22;
          }
          v12 = v11 + 6;
          v41 = 4 * a3;
          goto LABEL_83;
        }
      }
LABEL_19:
      v14 = (unsigned __int16 *)(v5 + v13);
      switch(a3)
      {
        case 4uLL:
LABEL_60:
          v20 = *(_DWORD *)v14;
          v21 = *((_DWORD *)v14 + 1);
          v22 = *((_DWORD *)v14 + 2);
          break;
        case 2uLL:
LABEL_63:
          v20 = *v14;
          v21 = v14[1];
          v22 = v14[2];
          break;
        case 1uLL:
LABEL_22:
          v20 = *(unsigned __int8 *)v14;
          v21 = *((unsigned __int8 *)v14 + 1);
          v22 = *((unsigned __int8 *)v14 + 2);
          break;
        default:
          v22 = 0;
          v20 = 0;
          v21 = 0;
LABEL_69:
          switch(a3)
          {
            case 4uLL:
              *(_DWORD *)v10 = v20;
              *((_DWORD *)v10 + 1) = v21;
              v41 = 12;
              *((_DWORD *)v10 + 2) = v22;
              break;
            case 2uLL:
              *(_WORD *)v10 = v20;
              *((_WORD *)v10 + 1) = v21;
              v41 = 6;
              *((_WORD *)v10 + 2) = v22;
              break;
            case 1uLL:
              *v10 = v20;
              v10[1] = v21;
              v41 = 3;
              v10[2] = v22;
              break;
            default:
              v41 = 3 * a3;
              break;
          }
          goto LABEL_83;
      }
      if (v20 >= v21)
        goto LABEL_69;
      if (v21 >= v22)
      {
        if (a3 == 4)
        {
          *(_DWORD *)v10 = v21;
          *((_DWORD *)v10 + 1) = v22;
          v41 = 12;
          *((_DWORD *)v10 + 2) = v20;
        }
        else if (a3 == 2)
        {
          *(_WORD *)v10 = v21;
          *((_WORD *)v10 + 1) = v22;
          v41 = 6;
          *((_WORD *)v10 + 2) = v20;
        }
        else
        {
          *v10 = v21;
          v10[1] = v22;
          v41 = 3;
          v10[2] = v20;
        }
      }
      else if (a3 == 4)
      {
        *(_DWORD *)v10 = v22;
        *((_DWORD *)v10 + 1) = v20;
        v41 = 12;
        *((_DWORD *)v10 + 2) = v21;
      }
      else if (a3 == 2)
      {
        *(_WORD *)v10 = v22;
        *((_WORD *)v10 + 1) = v20;
        v41 = 6;
        *((_WORD *)v10 + 2) = v21;
      }
      else
      {
        *v10 = v22;
        v10[1] = v20;
        v41 = 3;
        v10[2] = v21;
      }
LABEL_83:
      v10 += v41;
      v11 = v12;
    }
    while (v12 < v7);
  }
  v42 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v9, v10 - v9, v44, v45, v46);
  free(v9);
  return v42;
}

- (uint64_t)scn_indexedDataDecodingTrianglePairsWithBytesPerIndex:()SCNExtensions
{
  uint64_t v5;
  unint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  __int16 v16;
  unsigned __int8 v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  int v21;
  __int16 v22;
  uint64_t v23;

  v5 = objc_msgSend(a1, "bytes");
  v6 = objc_msgSend(a1, "length");
  v7 = (char *)malloc_type_malloc((((3 * (v6 / a3)) >> 1) & 0x3FFFFFFFFFFFFFFFLL) * a3, 0x32A3C3E3uLL);
  v8 = v7;
  v9 = v7;
  if (v6 >= a3)
  {
    v10 = 0;
    v11 = 3 * a3;
    v9 = v7;
    do
    {
      v12 = (unsigned __int8 *)(v5 + v10 * a3);
      switch(a3)
      {
        case 1uLL:
          v13 = *v12;
          v15 = v12[1];
          v17 = v12[2];
          *v9 = v13;
          v9[1] = v15;
          v9[2] = v17;
          break;
        case 2uLL:
          v13 = *(unsigned __int16 *)v12;
          v15 = *((unsigned __int16 *)v12 + 1);
          v16 = *((_WORD *)v12 + 2);
          *(_WORD *)v9 = v13;
          *((_WORD *)v9 + 1) = v15;
          *((_WORD *)v9 + 2) = v16;
          break;
        case 4uLL:
          v13 = *(_DWORD *)v12;
          v14 = *(_QWORD *)(v12 + 4);
          *(_DWORD *)v9 = *(_DWORD *)v12;
          *(_QWORD *)(v9 + 4) = v14;
          v15 = v14;
          break;
        default:
          v18 = v10 + 3;
LABEL_17:
          v9 += v11;
          goto LABEL_18;
      }
      v18 = v10 + 3;
      v9 += v11;
      if (v13 < v15)
      {
        v19 = v18 * a3;
        if (a3 == 4)
        {
          v21 = *(_DWORD *)(v5 + v19);
          *(_DWORD *)v9 = v13;
          *((_DWORD *)v9 + 1) = v21;
          *((_DWORD *)v9 + 2) = v15;
        }
        else if (a3 == 2)
        {
          v22 = *(_WORD *)(v5 + v19);
          *(_WORD *)v9 = v13;
          *((_WORD *)v9 + 1) = v22;
          *((_WORD *)v9 + 2) = v15;
        }
        else
        {
          v20 = *(_BYTE *)(v5 + v19);
          *v9 = v13;
          v9[1] = v20;
          v9[2] = v15;
        }
        v18 = v10 + 4;
        goto LABEL_17;
      }
LABEL_18:
      v10 = v18;
    }
    while (v18 < v6 / a3);
  }
  v23 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, v9 - v7);
  free(v8);
  return v23;
}

- (void)scn_indexedDataEncodingHighWatermarkWithBytesPerIndex:()SCNExtensions .cold.1()
{
  __assert_rtn("-[NSData(SCNExtensions) scn_indexedDataEncodingHighWatermarkWithBytesPerIndex:]", "NSData+SCNExtensions.m", 163, "0");
}

- (void)scn_indexedDataDecodingHighWatermarkWithBytesPerIndex:()SCNExtensions .cold.1()
{
  __assert_rtn("-[NSData(SCNExtensions) scn_indexedDataDecodingHighWatermarkWithBytesPerIndex:]", "NSData+SCNExtensions.m", 221, "0");
}

- (void)scn_indexedDataEncodingDeltaWithBytesPerIndex:()SCNExtensions .cold.1()
{
  __assert_rtn("-[NSData(SCNExtensions) scn_indexedDataEncodingDeltaWithBytesPerIndex:]", "NSData+SCNExtensions.m", 273, "0");
}

- (void)scn_indexedDataDecodingDeltaWithBytesPerIndex:()SCNExtensions .cold.1()
{
  __assert_rtn("-[NSData(SCNExtensions) scn_indexedDataDecodingDeltaWithBytesPerIndex:]", "NSData+SCNExtensions.m", 325, "0");
}

@end
