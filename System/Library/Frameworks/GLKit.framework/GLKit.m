uint64_t _modelviewMatrixMask(uint64_t result)
{
  _QWORD *v1;
  void *v2;
  int8x16_t *v3;
  int8x16_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  float v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = (_QWORD *)result;
    v2 = *(void **)(*(_QWORD *)(result + 144) + 152);
    if (!v2 || (result = objc_msgSend(v2, "enabled"), (_DWORD)result != 1))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v5 = (void *)v1[7];
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v21;
LABEL_9:
        v9 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          result = _reflectionMappingEnabled(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9));
          if ((result & 1) != 0)
            break;
          if (v7 == ++v9)
          {
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
            if (v7)
              goto LABEL_9;
            goto LABEL_15;
          }
        }
      }
      else
      {
LABEL_15:
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v10 = (void *)v1[19];
        result = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (!result)
        {
LABEL_25:
          v3 = (int8x16_t *)v1[26];
          v4 = vbicq_s8(*v3, (int8x16_t)xmmword_2549DE570);
          goto LABEL_5;
        }
        v11 = result;
        v12 = *(_QWORD *)v17;
LABEL_17:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
          if (objc_msgSend(v14, "enabled"))
          {
            result = objc_msgSend(v14, "position");
            if (v15 != 0.0)
              break;
            result = objc_msgSend(v14, "isAttenuated");
            if ((_DWORD)result)
              break;
          }
          if (v11 == ++v13)
          {
            result = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            v11 = result;
            if (result)
              goto LABEL_17;
            goto LABEL_25;
          }
        }
      }
    }
    v3 = (int8x16_t *)v1[26];
    v4 = vorrq_s8(*v3, (int8x16_t)xmmword_2549DE570);
LABEL_5:
    *v3 = v4;
  }
  return result;
}

uint64_t _useTexCoordAttribMask(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int8x16_t *v6;
  int8x16_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = result;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(void **)(result + 56);
    result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (result)
    {
      v3 = result;
      v4 = *(_QWORD *)v9;
      while (2)
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v9 != v4)
            objc_enumerationMutation(v2);
          result = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "useTexCoordAttribMask");
          if ((_DWORD)result)
          {
            v6 = *(int8x16_t **)(v1 + 200);
            *(int8x16_t *)*(_QWORD *)(v1 + 208) = vorrq_s8(*(int8x16_t *)*(_QWORD *)(v1 + 208), (int8x16_t)xmmword_2549DE520);
            v7 = vorrq_s8(*v6, (int8x16_t)xmmword_2549DE5F0);
            goto LABEL_12;
          }
          ++v5;
        }
        while (v3 != v5);
        result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v3 = result;
        if (result)
          continue;
        break;
      }
    }
    v6 = *(int8x16_t **)(v1 + 200);
    *(int8x16_t *)*(_QWORD *)(v1 + 208) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(v1 + 208), (int8x16_t)xmmword_2549DE520);
    v7 = vbicq_s8(*v6, (int8x16_t)xmmword_2549DE5F0);
LABEL_12:
    *v6 = v7;
  }
  return result;
}

uint64_t _texturingEnabledMask(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int8x16_t *v6;
  int8x16_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = result;
    *(_BYTE *)(result + 48) = 0;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = *(void **)(result + 56);
    result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (result)
    {
      v3 = result;
      v4 = *(_QWORD *)v9;
      while (2)
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v9 != v4)
            objc_enumerationMutation(v2);
          result = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "enabled");
          if ((_DWORD)result)
          {
            *(_BYTE *)(v1 + 48) = 1;
            goto LABEL_13;
          }
          ++v5;
        }
        while (v3 != v5);
        result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v3 = result;
        if (result)
          continue;
        break;
      }
    }
    if (*(_BYTE *)(v1 + 48))
    {
LABEL_13:
      v6 = *(int8x16_t **)(v1 + 200);
      *(int8x16_t *)*(_QWORD *)(v1 + 208) = vorrq_s8(*(int8x16_t *)*(_QWORD *)(v1 + 208), (int8x16_t)xmmword_2549DE530);
      v7 = vorrq_s8(*v6, (int8x16_t)xmmword_2549DE600);
    }
    else
    {
      v6 = *(int8x16_t **)(v1 + 200);
      *(int8x16_t *)*(_QWORD *)(v1 + 208) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(v1 + 208), (int8x16_t)xmmword_2549DE530);
      v7 = vbicq_s8(*v6, (int8x16_t)xmmword_2549DE600);
    }
    *v6 = v7;
  }
  return result;
}

uint64_t _normalizedNormalsMask(uint64_t result)
{
  uint64_t v1;
  int8x16_t *v2;
  int8x16_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = result;
    if (!*(_BYTE *)(result + 72) && !*(_BYTE *)(result + 73))
    {
      v10 = 0u;
      v11 = 0u;
      v8 = 0u;
      v9 = 0u;
      v4 = *(void **)(result + 56);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (!result)
      {
LABEL_15:
        v2 = *(int8x16_t **)(v1 + 208);
        v3 = vbicq_s8(*v2, (int8x16_t)xmmword_2549DE540);
        goto LABEL_5;
      }
      v5 = result;
      v6 = *(_QWORD *)v9;
LABEL_9:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        result = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "normalizedNormalsMask");
        if ((_DWORD)result)
          break;
        if (v5 == ++v7)
        {
          result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
          v5 = result;
          if (result)
            goto LABEL_9;
          goto LABEL_15;
        }
      }
    }
    v2 = *(int8x16_t **)(v1 + 208);
    v3 = vorrq_s8(*v2, (int8x16_t)xmmword_2549DE540);
LABEL_5:
    *v2 = v3;
  }
  return result;
}

uint64_t _vNormalEyeMask(uint64_t result)
{
  uint64_t v1;
  int8x16_t *v2;
  int8x16_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = result;
    if (!*(_BYTE *)(result + 73))
    {
      v10 = 0u;
      v11 = 0u;
      v8 = 0u;
      v9 = 0u;
      v4 = *(void **)(result + 56);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (!result)
      {
LABEL_14:
        v2 = *(int8x16_t **)(v1 + 200);
        *(int8x16_t *)*(_QWORD *)(v1 + 208) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(v1 + 208), (int8x16_t)xmmword_2549DE560);
        v3 = vbicq_s8(*v2, (int8x16_t)xmmword_2549DE620);
        goto LABEL_4;
      }
      v5 = result;
      v6 = *(_QWORD *)v9;
LABEL_8:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        result = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "vNormalEyeMask");
        if ((_DWORD)result)
          break;
        if (v5 == ++v7)
        {
          result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
          v5 = result;
          if (result)
            goto LABEL_8;
          goto LABEL_14;
        }
      }
    }
    v2 = *(int8x16_t **)(v1 + 200);
    *(int8x16_t *)*(_QWORD *)(v1 + 208) = vorrq_s8(*(int8x16_t *)*(_QWORD *)(v1 + 208), (int8x16_t)xmmword_2549DE560);
    v3 = vorrq_s8(*v2, (int8x16_t)xmmword_2549DE620);
LABEL_4:
    *v2 = v3;
  }
  return result;
}

uint64_t _vPositionEyeMask(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  float v13;
  int8x16_t *v14;
  int8x16_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = result;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v2 = *(void **)(result + 56);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v21;
LABEL_4:
      v6 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v6), "vPositionEyeMask"))
          break;
        if (v4 == ++v6)
        {
          v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v4)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      if (!*(_BYTE *)(v1 + 73)
        || (v18 = 0u,
            v19 = 0u,
            v16 = 0u,
            v17 = 0u,
            v7 = *(void **)(v1 + 152),
            (v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16)) == 0))
      {
LABEL_20:
        v14 = *(int8x16_t **)(v1 + 200);
        *(int8x16_t *)*(_QWORD *)(v1 + 208) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(v1 + 208), (int8x16_t)xmmword_2549DE550);
        v15 = vbicq_s8(*v14, (int8x16_t)xmmword_2549DE610);
LABEL_22:
        *v14 = v15;
        return _modelviewMatrixMask(v1);
      }
      v9 = v8;
      v10 = *(_QWORD *)v17;
LABEL_13:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        if (objc_msgSend(v12, "enabled"))
        {
          objc_msgSend(v12, "position");
          if (v13 != 0.0)
            break;
        }
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v9)
            goto LABEL_13;
          goto LABEL_20;
        }
      }
    }
    v14 = *(int8x16_t **)(v1 + 200);
    *(int8x16_t *)*(_QWORD *)(v1 + 208) = vorrq_s8(*(int8x16_t *)*(_QWORD *)(v1 + 208), (int8x16_t)xmmword_2549DE550);
    v15 = vorrq_s8(*v14, (int8x16_t)xmmword_2549DE610);
    goto LABEL_22;
  }
  return result;
}

uint64_t _lightStateChanged(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  __int128 *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  int8x16_t *v10;
  __int128 *v11;
  int8x16_t *v12;
  int8x16_t v13;
  int8x16_t *v14;
  uint64_t *v15;
  int8x16_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!result)
    return result;
  v1 = result;
  *(_WORD *)(result + 72) = 0;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(void **)(result + 152);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v4 = &xmmword_2549DE5E0;
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v18;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v6)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
      if (objc_msgSend(v8, "enabled"))
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v5)
          goto LABEL_4;
        goto LABEL_13;
      }
    }
    if (objc_msgSend(v8, "lightingType"))
    {
      *(_BYTE *)(v1 + 73) = 1;
      goto LABEL_13;
    }
    *(_BYTE *)(v1 + 72) = 1;
    goto LABEL_16;
  }
LABEL_13:
  if (*(_BYTE *)(v1 + 72))
  {
LABEL_16:
    v10 = *(int8x16_t **)(v1 + 200);
    v12 = *(int8x16_t **)(v1 + 208);
    *v12 = vorrq_s8(*v12, (int8x16_t)xmmword_2549DE510);
    v9 = (uint64_t *)&xmmword_2549DE5E0 + 1;
    v11 = &xmmword_2549DE5E0;
    goto LABEL_17;
  }
  v9 = (uint64_t *)&xmmword_2549DE510 + 1;
  v10 = *(int8x16_t **)(v1 + 208);
  v11 = &xmmword_2549DE510;
  v12 = v10;
LABEL_17:
  v13.i64[0] = *(_QWORD *)v11;
  v13.i64[1] = *v9;
  *v10 = vbicq_s8(*v10, v13);
  v14 = *(int8x16_t **)(v1 + 200);
  if (*(_BYTE *)(v1 + 73))
  {
    *v14 = vorrq_s8(*v14, (int8x16_t)xmmword_2549DE5E0);
    v15 = (uint64_t *)&xmmword_2549DE510 + 1;
    v4 = &xmmword_2549DE510;
    v14 = v12;
  }
  else
  {
    v15 = (uint64_t *)&xmmword_2549DE5E0 + 1;
  }
  v16.i64[0] = *(_QWORD *)v4;
  v16.i64[1] = *v15;
  *v14 = vbicq_s8(*v14, v16);
  _lightModelTwoSidedMask(v1);
  _normalizedNormalsMask(v1);
  return _vNormalEyeMask(v1);
}

uint64_t _lightModelTwoSidedMask(uint64_t result)
{
  int8x16_t *v1;
  int8x16_t v2;
  int8x16_t v3;
  int8x16_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;

  if (*(_BYTE *)(result + 17) && *(_BYTE *)(result + 72))
  {
    v1 = *(int8x16_t **)(result + 200);
    *(int8x16_t *)*(_QWORD *)(result + 208) = vorrq_s8(*(int8x16_t *)*(_QWORD *)(result + 208), (int8x16_t)xmmword_2549DE500);
    v2 = vorrq_s8(*v1, (int8x16_t)xmmword_2549DE5A0);
    *v1 = v2;
    v3 = vbicq_s8(v2, (int8x16_t)xmmword_2549DE5B0);
  }
  else
  {
    v1 = *(int8x16_t **)(result + 200);
    v4 = *(int8x16_t **)(result + 208);
    *v1 = vorrq_s8(*v1, (int8x16_t)xmmword_2549DE5B0);
    *v4 = vbicq_s8(*v4, (int8x16_t)xmmword_2549DE500);
    v3 = vbicq_s8(*v1, (int8x16_t)xmmword_2549DE5A0);
  }
  *v1 = v3;
  if (*(_BYTE *)(result + 17) && *(_BYTE *)(result + 73))
  {
    v5 = v3.i64[0] | xmmword_2549DE5C0;
    v6 = v3.i64[1] | *((_QWORD *)&xmmword_2549DE5C0 + 1);
    v1->i64[0] = v3.i64[0] | xmmword_2549DE5C0;
    v1->i64[1] = v6;
    v7 = &qword_2549DE5D8;
    v8 = &qword_2549DE5D0;
  }
  else
  {
    v8 = (uint64_t *)&xmmword_2549DE5C0;
    v5 = v3.i64[0] | qword_2549DE5D0;
    v6 = v3.i64[1] | qword_2549DE5D8;
    v1->i64[0] = v3.i64[0] | qword_2549DE5D0;
    v1->i64[1] = v6;
    v7 = (uint64_t *)&xmmword_2549DE5C0 + 1;
  }
  v9 = v6 & ~*v7;
  v1->i64[0] = v5 & ~*v8;
  v1->i64[1] = v9;
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

GLKVertexAttributeParameters GLKVertexAttributeParametersFromModelIO(MDLVertexFormat vertexFormat)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  GLKVertexAttributeParameters result;

  v1 = 0;
  if ((uint64_t)vertexFormat <= (uint64_t)MDLVertexFormatUShortNormalizedBits)
  {
    if ((uint64_t)vertexFormat > (uint64_t)MDLVertexFormatCharNormalizedBits)
    {
      switch(vertexFormat)
      {
        case MDLVertexFormatCharNormalized:
          v2 = 0x100000000;
          goto LABEL_84;
        case MDLVertexFormatChar2Normalized:
          v2 = 0x200000000;
          goto LABEL_84;
        case MDLVertexFormatChar3Normalized:
          v2 = 0x300000000;
          goto LABEL_84;
        case MDLVertexFormatChar4Normalized:
          v2 = 0x400000000;
LABEL_84:
          v3 = 5120;
          goto LABEL_85;
        default:
          switch(vertexFormat)
          {
            case MDLVertexFormatUShort:
              v1 = 0;
              v2 = 0x100000000;
              goto LABEL_89;
            case MDLVertexFormatUShort2:
              v1 = 0;
              v2 = 0x200000000;
              goto LABEL_89;
            case MDLVertexFormatUShort3:
              v1 = 0;
              v2 = 0x300000000;
              goto LABEL_89;
            case MDLVertexFormatUShort4:
              v1 = 0;
              v2 = 0x400000000;
LABEL_89:
              v3 = 5123;
              break;
            default:
              v2 = 0;
              v3 = 0;
              switch(vertexFormat)
              {
                case MDLVertexFormatShort:
                  v1 = 0;
                  v2 = 0x100000000;
                  goto LABEL_49;
                case MDLVertexFormatShort2:
                  v1 = 0;
                  v2 = 0x200000000;
                  goto LABEL_49;
                case MDLVertexFormatShort3:
                  v1 = 0;
                  v2 = 0x300000000;
                  goto LABEL_49;
                case MDLVertexFormatShort4:
                  v1 = 0;
                  v2 = 0x400000000;
LABEL_49:
                  v3 = 5122;
                  break;
                default:
                  goto LABEL_90;
              }
              break;
          }
          goto LABEL_90;
      }
    }
    switch(vertexFormat)
    {
      case MDLVertexFormatUChar:
        v1 = 0;
        v2 = 0x100000000;
        goto LABEL_72;
      case MDLVertexFormatUChar2:
        v1 = 0;
        v2 = 0x200000000;
        goto LABEL_72;
      case MDLVertexFormatUChar3:
        v1 = 0;
        v2 = 0x300000000;
        goto LABEL_72;
      case MDLVertexFormatUChar4:
        v1 = 0;
        v2 = 0x400000000;
LABEL_72:
        v3 = 5121;
        break;
      default:
        switch(vertexFormat)
        {
          case MDLVertexFormatChar:
            v1 = 0;
            v2 = 0x100000000;
            break;
          case MDLVertexFormatChar2:
            v1 = 0;
            v2 = 0x200000000;
            break;
          case MDLVertexFormatChar3:
            v1 = 0;
            v2 = 0x300000000;
            break;
          case MDLVertexFormatChar4:
            v1 = 0;
            v2 = 0x400000000;
            break;
          default:
            v2 = 0;
            v3 = 0;
            switch(vertexFormat)
            {
              case MDLVertexFormatUCharNormalized:
                v2 = 0x100000000;
                goto LABEL_41;
              case MDLVertexFormatUChar2Normalized:
                v2 = 0x200000000;
                goto LABEL_41;
              case MDLVertexFormatUChar3Normalized:
                v2 = 0x300000000;
                goto LABEL_41;
              case MDLVertexFormatUChar4Normalized:
                v2 = 0x400000000;
LABEL_41:
                v3 = 5121;
                goto LABEL_85;
              default:
                goto LABEL_90;
            }
        }
        v3 = 5120;
        break;
    }
  }
  else if ((uint64_t)vertexFormat > (uint64_t)MDLVertexFormatIntBits)
  {
    if ((uint64_t)vertexFormat <= (uint64_t)MDLVertexFormatHalfBits)
    {
      switch(vertexFormat)
      {
        case MDLVertexFormatInt:
          v1 = 0;
          v2 = 0x100000000;
          goto LABEL_64;
        case MDLVertexFormatInt2:
          v1 = 0;
          v2 = 0x200000000;
          goto LABEL_64;
        case MDLVertexFormatInt3:
          v1 = 0;
          v2 = 0x300000000;
          goto LABEL_64;
        case MDLVertexFormatInt4:
          v1 = 0;
          v2 = 0x400000000;
LABEL_64:
          v3 = 5124;
          break;
        default:
          v4 = vertexFormat == MDLVertexFormatInt1010102Normalized;
          v2 = 0x400000000;
          v3 = 36255;
LABEL_56:
          v1 = v4;
          if (!v4)
          {
            v2 = 0;
            v3 = 0;
          }
          break;
      }
    }
    else
    {
      switch(vertexFormat)
      {
        case MDLVertexFormatHalf:
          v1 = 0;
          v2 = 0x100000000;
          goto LABEL_80;
        case MDLVertexFormatHalf2:
          v1 = 0;
          v2 = 0x200000000;
          goto LABEL_80;
        case MDLVertexFormatHalf3:
          v1 = 0;
          v2 = 0x300000000;
          goto LABEL_80;
        case MDLVertexFormatHalf4:
          v1 = 0;
          v2 = 0x400000000;
LABEL_80:
          v3 = 5131;
          break;
        default:
          v2 = 0;
          v3 = 0;
          switch(vertexFormat)
          {
            case MDLVertexFormatFloat:
              v1 = 0;
              v2 = 0x100000000;
              goto LABEL_45;
            case MDLVertexFormatFloat2:
              v1 = 0;
              v2 = 0x200000000;
              goto LABEL_45;
            case MDLVertexFormatFloat3:
              v1 = 0;
              v2 = 0x300000000;
              goto LABEL_45;
            case MDLVertexFormatFloat4:
              v1 = 0;
              v2 = 0x400000000;
LABEL_45:
              v3 = 5126;
              break;
            default:
              goto LABEL_90;
          }
          break;
      }
    }
  }
  else if ((uint64_t)vertexFormat > (uint64_t)MDLVertexFormatUIntBits)
  {
    switch(vertexFormat)
    {
      case MDLVertexFormatUInt:
        v1 = 0;
        v2 = 0x100000000;
        break;
      case MDLVertexFormatUInt2:
        v1 = 0;
        v2 = 0x200000000;
        break;
      case MDLVertexFormatUInt3:
        v1 = 0;
        v2 = 0x300000000;
        break;
      case MDLVertexFormatUInt4:
        v1 = 0;
        v2 = 0x400000000;
        break;
      default:
        v4 = vertexFormat == MDLVertexFormatUInt1010102Normalized;
        v2 = 0x400000000;
        v3 = 33640;
        goto LABEL_56;
    }
    v3 = 5125;
  }
  else
  {
    switch(vertexFormat)
    {
      case MDLVertexFormatUShortNormalized:
        v2 = 0x100000000;
        break;
      case MDLVertexFormatUShort2Normalized:
        v2 = 0x200000000;
        break;
      case MDLVertexFormatUShort3Normalized:
        v2 = 0x300000000;
        break;
      case MDLVertexFormatUShort4Normalized:
        v2 = 0x400000000;
        break;
      default:
        v2 = 0;
        v3 = 0;
        switch(vertexFormat)
        {
          case MDLVertexFormatShortNormalized:
            v2 = 0x100000000;
            goto LABEL_37;
          case MDLVertexFormatShort2Normalized:
            v2 = 0x200000000;
            goto LABEL_37;
          case MDLVertexFormatShort3Normalized:
            v2 = 0x300000000;
            goto LABEL_37;
          case MDLVertexFormatShort4Normalized:
            v2 = 0x400000000;
LABEL_37:
            v3 = 5122;
            goto LABEL_85;
          default:
            goto LABEL_90;
        }
    }
    v3 = 5123;
LABEL_85:
    v1 = 1;
  }
LABEL_90:
  v5 = v3 | v2;
  result.type = v5;
  result.size = HIDWORD(v5);
  result.normalized = v1;
  return result;
}

Class initMDLMeshBufferMap()
{
  Class result;

  if (ModelIOLibrary_sOnce != -1)
    dispatch_once(&ModelIOLibrary_sOnce, &__block_literal_global);
  result = objc_getClass("MDLMeshBufferMap");
  classMDLMeshBufferMap = (uint64_t)result;
  getMDLMeshBufferMapClass = (uint64_t (*)())MDLMeshBufferMapFunction;
  return result;
}

id MDLMeshBufferMapFunction()
{
  return (id)classMDLMeshBufferMap;
}

Class initMDLSubmesh()
{
  Class result;

  if (ModelIOLibrary_sOnce != -1)
    dispatch_once(&ModelIOLibrary_sOnce, &__block_literal_global);
  result = objc_getClass("MDLSubmesh");
  classMDLSubmesh = (uint64_t)result;
  getMDLSubmeshClass = (uint64_t (*)())MDLSubmeshFunction;
  return result;
}

id MDLSubmeshFunction()
{
  return (id)classMDLSubmesh;
}

Class initMDLMesh()
{
  Class result;

  if (ModelIOLibrary_sOnce != -1)
    dispatch_once(&ModelIOLibrary_sOnce, &__block_literal_global);
  result = objc_getClass("MDLMesh");
  classMDLMesh = (uint64_t)result;
  getMDLMeshClass = (uint64_t (*)())MDLMeshFunction;
  return result;
}

id MDLMeshFunction()
{
  return (id)classMDLMesh;
}

uint64_t _setMasks(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int8x16_t **v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  int8x16_t *v10;
  uint64_t v11;
  int8x16_t v12;

  v2 = objc_msgSend((id)a1, "isSpot");
  v3 = *(int *)(a1 + 256);
  v4 = 6;
  if (v2)
    v5 = 6;
  else
    v5 = 12;
  *(int8x16_t *)**(_QWORD **)(a1 + 24) = vorrq_s8(*(int8x16_t *)**(_QWORD **)(a1 + 24), *(int8x16_t *)&_staticVshMasks_0[2 * v3 + v5]);
  *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vorrq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), *(int8x16_t *)&_staticFshMasks[2 * v3 + v5]);
  if (v2)
    v4 = 12;
  *(int8x16_t *)**(_QWORD **)(a1 + 24) = vbicq_s8(*(int8x16_t *)**(_QWORD **)(a1 + 24), *(int8x16_t *)&_staticVshMasks_0[2 * v3 + v4]);
  *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), *(int8x16_t *)&_staticFshMasks[2 * v3 + v4]);
  _attenuateMask(a1);
  if (!*(_BYTE *)(a1 + 80))
  {
    v10 = **(int8x16_t ***)(a1 + 24);
    v11 = *(int *)(a1 + 256);
    v12 = vbicq_s8(*v10, *(int8x16_t *)&_staticVshMasks_0[2 * v11]);
LABEL_11:
    *v10 = v12;
    v8 = *(_QWORD **)(*(_QWORD *)(a1 + 24) + 16);
    v9 = &_staticFshMasks[2 * v11];
    goto LABEL_12;
  }
  v6 = *(int8x16_t ***)(a1 + 24);
  if (!*(_DWORD *)(a1 + 260))
  {
    v10 = *v6;
    v11 = *(int *)(a1 + 256);
    v12 = vorrq_s8(*v10, *(int8x16_t *)&_staticVshMasks_0[2 * v11]);
    goto LABEL_11;
  }
  v7 = *(int *)(a1 + 256);
  *v6[2] = vorrq_s8(*v6[2], *(int8x16_t *)&_staticFshMasks[2 * v7]);
  v8 = **(_QWORD ***)(a1 + 24);
  v9 = &_staticVshMasks_0[2 * v7];
LABEL_12:
  *v8 &= ~*v9;
  v8[1] &= ~v9[1];
  _positionalLightMask(a1);
  return _directionalLightMask(a1);
}

uint64_t _attenuateMask(uint64_t a1)
{
  uint64_t result;
  int8x16_t **v3;
  uint64_t v4;
  int8x16_t *v5;
  int8x16_t *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t *v9;
  int8x16_t *v10;
  int8x16_t v11;
  uint64_t *v12;

  result = objc_msgSend((id)a1, "isAttenuated");
  if (!(_DWORD)result)
  {
    v8 = *(int *)(a1 + 256);
    v9 = &_staticVshMasks_0[2 * v8];
    *(int8x16_t *)**(_QWORD **)(a1 + 24) = vorrq_s8(*(int8x16_t *)**(_QWORD **)(a1 + 24), *((int8x16_t *)v9 + 12));
    v10 = **(int8x16_t ***)(a1 + 24);
    v11 = *((int8x16_t *)v9 + 9);
LABEL_6:
    *v10 = vbicq_s8(*v10, v11);
    v6 = (int8x16_t *)&_staticFshMasks[2 * v8];
    *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vorrq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), v6[12]);
    v7 = *(_QWORD **)(*(_QWORD *)(a1 + 24) + 16);
    goto LABEL_7;
  }
  v3 = *(int8x16_t ***)(a1 + 24);
  if (!*(_DWORD *)(a1 + 260))
  {
    v8 = *(int *)(a1 + 256);
    v12 = &_staticVshMasks_0[2 * v8];
    **v3 = vorrq_s8(**v3, *((int8x16_t *)v12 + 9));
    v10 = **(int8x16_t ***)(a1 + 24);
    v11 = *((int8x16_t *)v12 + 12);
    goto LABEL_6;
  }
  v4 = *(int *)(a1 + 256);
  v5 = (int8x16_t *)&_staticFshMasks[2 * v4];
  *v3[2] = vorrq_s8(*v3[2], v5[9]);
  *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), v5[12]);
  v6 = (int8x16_t *)&_staticVshMasks_0[2 * v4];
  *(int8x16_t *)**(_QWORD **)(a1 + 24) = vorrq_s8(*(int8x16_t *)**(_QWORD **)(a1 + 24), v6[12]);
  v7 = **(_QWORD ***)(a1 + 24);
LABEL_7:
  *v7 &= ~v6[9].i64[0];
  v7[1] &= ~v6[9].i64[1];
  return result;
}

uint64_t _positionalLightMask(uint64_t result)
{
  int8x16_t **v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t *v4;
  int8x16_t *v5;
  int8x16_t v6;
  uint64_t *v7;

  if (*(float *)(result + 108) == 0.0)
  {
    v2 = *(int *)(result + 256);
    v5 = **(int8x16_t ***)(result + 24);
    v6 = vbicq_s8(*v5, *(int8x16_t *)&_staticVshMasks_0[2 * v2 + 30]);
LABEL_6:
    *v5 = v6;
    v3 = *(_QWORD **)(*(_QWORD *)(result + 24) + 16);
    v4 = _staticFshMasks;
    goto LABEL_7;
  }
  v1 = *(int8x16_t ***)(result + 24);
  if (!*(_DWORD *)(result + 260))
  {
    v2 = *(int *)(result + 256);
    v5 = *v1;
    v6 = vorrq_s8(*v5, *(int8x16_t *)&_staticVshMasks_0[2 * v2 + 30]);
    goto LABEL_6;
  }
  v2 = *(int *)(result + 256);
  *v1[2] = vorrq_s8(*v1[2], *(int8x16_t *)&_staticFshMasks[2 * v2 + 30]);
  v3 = **(_QWORD ***)(result + 24);
  v4 = _staticVshMasks_0;
LABEL_7:
  v7 = &v4[2 * v2];
  *v3 &= ~v7[30];
  v3[1] &= ~v7[31];
  return result;
}

uint64_t _directionalLightMask(uint64_t result)
{
  int8x16_t **v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t *v4;
  int8x16_t *v5;
  int8x16_t v6;
  uint64_t *v7;

  if (*(float *)(result + 108) != 0.0)
  {
    v2 = *(int *)(result + 256);
    v5 = **(int8x16_t ***)(result + 24);
    v6 = vbicq_s8(*v5, *(int8x16_t *)&_staticVshMasks_0[2 * v2 + 36]);
LABEL_6:
    *v5 = v6;
    v3 = *(_QWORD **)(*(_QWORD *)(result + 24) + 16);
    v4 = _staticFshMasks;
    goto LABEL_7;
  }
  v1 = *(int8x16_t ***)(result + 24);
  if (!*(_DWORD *)(result + 260))
  {
    v2 = *(int *)(result + 256);
    v5 = *v1;
    v6 = vorrq_s8(*v5, *(int8x16_t *)&_staticVshMasks_0[2 * v2 + 36]);
    goto LABEL_6;
  }
  v2 = *(int *)(result + 256);
  *v1[2] = vorrq_s8(*v1[2], *(int8x16_t *)&_staticFshMasks[2 * v2 + 36]);
  v3 = **(_QWORD ***)(result + 24);
  v4 = _staticVshMasks_0;
LABEL_7:
  v7 = &v4[2 * v2];
  *v3 &= ~v7[36];
  v3[1] &= ~v7[37];
  return result;
}

int8x16_t _texGenSMask(uint64_t a1)
{
  int8x16_t *v2;
  uint64_t v3;
  int8x16_t v4;
  int v5;
  int8x16_t *v6;
  int8x16_t *v7;
  uint64_t v8;
  int8x16_t *v9;
  int8x16_t *v10;
  int8x16_t result;
  uint64_t v12;
  int v13;
  int8x16_t *v14;
  int8x16_t *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int8x16_t *v19;
  int8x16_t *v20;
  uint64_t v21;
  uint64_t v22;

  v2 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
  v3 = *(int *)(a1 + 92);
  v4 = *v2;
  if (*(_QWORD *)(a1 + 136))
  {
    *v2 = vorrq_s8(v4, *(int8x16_t *)&_staticFshMasks_1[2 * v3 + 18]);
    v5 = objc_msgSend(*(id *)(a1 + 136), "mode");
    v6 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
    v7 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    v8 = v7[45].i64[0];
    if (v5)
    {
      *v6 = vbicq_s8(*v6, v7[45]);
    }
    else
    {
      v12 = v6->i64[1] | v7[45].i64[1];
      v6->i64[0] |= v8;
      v6->i64[1] = v12;
    }
    v13 = objc_msgSend(*(id *)(a1 + 136), "mode");
    v14 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
    v15 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    v16 = v15[54].i64[0];
    if (v13 == 1)
    {
      v17 = v14->i64[1] | v15[54].i64[1];
      v14->i64[0] |= v16;
      v14->i64[1] = v17;
    }
    else
    {
      *v14 = vbicq_s8(*v14, v15[54]);
    }
    v18 = objc_msgSend(*(id *)(a1 + 136), "mode");
    v19 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
    v20 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    v21 = v20[63].i64[0];
    if (v18 == 2)
    {
      v22 = v19->i64[1] | v20[63].i64[1];
      v19->i64[0] |= v21;
      v19->i64[1] = v22;
    }
    else
    {
      result = vbicq_s8(*v19, v20[63]);
      *v19 = result;
    }
  }
  else
  {
    v9 = (int8x16_t *)&_staticFshMasks_1[2 * v3];
    *v2 = vorrq_s8(v4, v9[18]);
    *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), v9[9]);
    *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), v9[45]);
    *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), v9[54]);
    v10 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
    result = vbicq_s8(*v10, v9[63]);
    *v10 = result;
  }
  return result;
}

uint64_t _reflectionMapMask(uint64_t a1)
{
  void *v2;
  int8x16_t *v3;
  _QWORD *v4;
  uint64_t *v5;
  int8x16_t *v6;

  if (*(_BYTE *)(a1 + 72)
    && (v2 = *(void **)(a1 + 152)) != 0
    && *(_QWORD *)(a1 + 136)
    && *(_QWORD *)(a1 + 144)
    && objc_msgSend(v2, "mode") == 3
    && *(_DWORD *)(a1 + 80) == 34067)
  {
    v3 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vorrq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), v3[3]);
    v4 = *(_QWORD **)(*(_QWORD *)(a1 + 24) + 16);
    *v4 &= ~v3[6].i64[0];
    v5 = &v3[6].i64[1];
  }
  else
  {
    v6 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vorrq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), v6[6]);
    v4 = *(_QWORD **)(*(_QWORD *)(a1 + 24) + 16);
    *v4 &= ~v6[3].i64[0];
    v5 = &v6[3].i64[1];
  }
  v4[1] &= ~*v5;
  return _modelviewMatrixMask(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 32));
}

int8x16_t _texGenTMask(uint64_t a1)
{
  int8x16_t *v2;
  uint64_t v3;
  int8x16_t v4;
  int v5;
  int8x16_t *v6;
  int8x16_t *v7;
  uint64_t v8;
  int8x16_t *v9;
  int8x16_t *v10;
  int8x16_t result;
  uint64_t v12;
  int v13;
  int8x16_t *v14;
  int8x16_t *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int8x16_t *v19;
  int8x16_t *v20;
  uint64_t v21;
  uint64_t v22;

  v2 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
  v3 = *(int *)(a1 + 92);
  v4 = *v2;
  if (*(_QWORD *)(a1 + 144))
  {
    *v2 = vorrq_s8(v4, *(int8x16_t *)&_staticFshMasks_1[2 * v3 + 24]);
    v5 = objc_msgSend(*(id *)(a1 + 144), "mode");
    v6 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
    v7 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    v8 = v7[48].i64[0];
    if (v5)
    {
      *v6 = vbicq_s8(*v6, v7[48]);
    }
    else
    {
      v12 = v6->i64[1] | v7[48].i64[1];
      v6->i64[0] |= v8;
      v6->i64[1] = v12;
    }
    v13 = objc_msgSend(*(id *)(a1 + 144), "mode");
    v14 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
    v15 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    v16 = v15[57].i64[0];
    if (v13 == 1)
    {
      v17 = v14->i64[1] | v15[57].i64[1];
      v14->i64[0] |= v16;
      v14->i64[1] = v17;
    }
    else
    {
      *v14 = vbicq_s8(*v14, v15[57]);
    }
    v18 = objc_msgSend(*(id *)(a1 + 144), "mode");
    v19 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
    v20 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    v21 = v20[66].i64[0];
    if (v18 == 2)
    {
      v22 = v19->i64[1] | v20[66].i64[1];
      v19->i64[0] |= v21;
      v19->i64[1] = v22;
    }
    else
    {
      result = vbicq_s8(*v19, v20[66]);
      *v19 = result;
    }
  }
  else
  {
    v9 = (int8x16_t *)&_staticFshMasks_1[2 * v3];
    *v2 = vorrq_s8(v4, v9[21]);
    *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), v9[12]);
    *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), v9[48]);
    *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), v9[57]);
    v10 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
    result = vbicq_s8(*v10, v9[66]);
    *v10 = result;
  }
  return result;
}

int8x16_t _texGenRMask(uint64_t a1)
{
  int8x16_t *v2;
  uint64_t v3;
  int8x16_t v4;
  int v5;
  int8x16_t *v6;
  int8x16_t *v7;
  uint64_t v8;
  int8x16_t *v9;
  int8x16_t *v10;
  int8x16_t result;
  uint64_t v12;
  int v13;
  int8x16_t *v14;
  int8x16_t *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int8x16_t *v19;
  int8x16_t *v20;
  uint64_t v21;
  uint64_t v22;

  v2 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
  v3 = *(int *)(a1 + 92);
  v4 = *v2;
  if (*(_QWORD *)(a1 + 152))
  {
    *v2 = vorrq_s8(v4, *(int8x16_t *)&_staticFshMasks_1[2 * v3 + 30]);
    v5 = objc_msgSend(*(id *)(a1 + 152), "mode");
    v6 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
    v7 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    v8 = v7[51].i64[0];
    if (v5)
    {
      *v6 = vbicq_s8(*v6, v7[51]);
    }
    else
    {
      v12 = v6->i64[1] | v7[51].i64[1];
      v6->i64[0] |= v8;
      v6->i64[1] = v12;
    }
    v13 = objc_msgSend(*(id *)(a1 + 152), "mode");
    v14 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
    v15 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    v16 = v15[60].i64[0];
    if (v13 == 1)
    {
      v17 = v14->i64[1] | v15[60].i64[1];
      v14->i64[0] |= v16;
      v14->i64[1] = v17;
    }
    else
    {
      *v14 = vbicq_s8(*v14, v15[60]);
    }
    v18 = objc_msgSend(*(id *)(a1 + 152), "mode");
    v19 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
    v20 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    v21 = v20[69].i64[0];
    if (v18 == 2)
    {
      v22 = v19->i64[1] | v20[69].i64[1];
      v19->i64[0] |= v21;
      v19->i64[1] = v22;
    }
    else
    {
      result = vbicq_s8(*v19, v20[69]);
      *v19 = result;
    }
  }
  else
  {
    v9 = (int8x16_t *)&_staticFshMasks_1[2 * v3];
    *v2 = vorrq_s8(v4, v9[24]);
    *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), v9[15]);
    *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), v9[51]);
    *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), v9[60]);
    v10 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
    result = vbicq_s8(*v10, v9[69]);
    *v10 = result;
  }
  return result;
}

uint64_t _setMasks_0(uint64_t a1)
{
  uint64_t v2;
  int8x16_t *v3;
  uint64_t v4;
  int8x16_t *v5;
  int8x16_t *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  v2 = *(int *)(a1 + 92);
  v3 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
  if (*(_BYTE *)(a1 + 72))
  {
    v4 = v3->i64[1] | _staticFshMasks_1[2 * v2 + 1];
    v3->i64[0] |= _staticFshMasks_1[2 * v2];
    v3->i64[1] = v4;
  }
  else
  {
    *v3 = vbicq_s8(*v3, *(int8x16_t *)&_staticFshMasks_1[2 * v2]);
  }
  v5 = *(int8x16_t **)(*(_QWORD *)(a1 + 24) + 16);
  v6 = (int8x16_t *)&_staticFshMasks_1[2 * v2];
  v7 = v6[42].i64[0];
  if (*(_BYTE *)(a1 + 88))
  {
    v8 = v5->i64[1] | v6[42].i64[1];
    v5->i64[0] |= v7;
    v5->i64[1] = v8;
  }
  else
  {
    *v5 = vbicq_s8(*v5, v6[42]);
  }
  v9 = *(_DWORD *)(a1 + 80);
  if (v9 == 3553)
  {
    v10 = 10;
    v11 = 9;
  }
  else
  {
    if (v9 != 34067)
      goto LABEL_12;
    v10 = 9;
    v11 = 10;
  }
  *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vorrq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), *(int8x16_t *)&_staticFshMasks_1[6 * v11 + 2 * v2]);
  *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), *(int8x16_t *)&_staticFshMasks_1[6 * v10 + 2 * v2]);
LABEL_12:
  _envModeMask(a1);
  v12 = *(void **)(a1 + 136);
  if (v12 && !objc_msgSend(v12, "mode")
    || (v13 = *(void **)(a1 + 144)) != 0 && !objc_msgSend(v13, "mode")
    || (v14 = *(void **)(a1 + 152)) != 0 && !objc_msgSend(v14, "mode"))
  {
    v15 = **(_QWORD ***)(a1 + 24);
    v16 = v15[1] | _staticVshVPositionMask_1;
    *v15 |= _staticVshVPositionMask_0;
    v17 = *(_QWORD *)(a1 + 24);
    v15[1] = v16;
    v18 = *(_QWORD **)(v17 + 16);
    v19 = v18[1] | _staticFshVPositionMask_1;
    *v18 |= _staticFshVPositionMask_0;
    v18[1] = v19;
  }
  else
  {
    *(int8x16_t *)**(_QWORD **)(a1 + 24) = vbicq_s8(*(int8x16_t *)**(_QWORD **)(a1 + 24), (int8x16_t)__PAIR128__(_staticVshVPositionMask_1, _staticVshVPositionMask_0));
    *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), (int8x16_t)__PAIR128__(_staticFshVPositionMask_1, _staticFshVPositionMask_0));
  }
  _texGenSMask(a1);
  _texGenTMask(a1);
  _texGenRMask(a1);
  return _reflectionMapMask(a1);
}

uint64_t _envModeMask(uint64_t result)
{
  int v1;
  int8x16_t *v2;
  int8x16_t *v3;
  int8x16_t v4;
  int8x16_t *v5;
  _QWORD *v6;
  uint64_t *v7;

  v1 = *(_DWORD *)(result + 84);
  if (v1 == 2)
  {
    v5 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(result + 92)];
    *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(result + 24) + 16) = vorrq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(result + 24)+ 16), v5[39]);
    *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(result + 24) + 16) = vbicq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(result + 24)+ 16), v5[33]);
    v6 = *(_QWORD **)(*(_QWORD *)(result + 24) + 16);
    *v6 &= ~v5[36].i64[0];
    v7 = &v5[36].i64[1];
  }
  else
  {
    if (v1 == 1)
    {
      v2 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(result + 92)];
      *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(result + 24) + 16) = vorrq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(result + 24)+ 16), v2[36]);
      v3 = *(int8x16_t **)(*(_QWORD *)(result + 24) + 16);
      v4 = v2[33];
    }
    else
    {
      if (v1)
        return result;
      v2 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(result + 92)];
      *(int8x16_t *)*(_QWORD *)(*(_QWORD *)(result + 24) + 16) = vorrq_s8(*(int8x16_t *)*(_QWORD *)(*(_QWORD *)(result + 24)+ 16), v2[33]);
      v3 = *(int8x16_t **)(*(_QWORD *)(result + 24) + 16);
      v4 = v2[36];
    }
    *v3 = vbicq_s8(*v3, v4);
    v6 = *(_QWORD **)(*(_QWORD *)(result + 24) + 16);
    *v6 &= ~v2[39].i64[0];
    v7 = &v2[39].i64[1];
  }
  v6[1] &= ~*v7;
  return result;
}

BOOL _reflectionMappingEnabled(uint64_t a1)
{
  _QWORD *v1;
  uint64_t *v2;

  v1 = *(_QWORD **)(*(_QWORD *)(a1 + 24) + 16);
  v2 = &_staticFshMasks_1[2 * *(int *)(a1 + 92)];
  return (v2[6] & *v1) != 0 || (v2[7] & v1[1]) != 0;
}

uint64_t glkLinkedOSVersion()
{
  if (glkLinkedOSVersion_once != -1)
    dispatch_once(&glkLinkedOSVersion_once, &__block_literal_global_0);
  return glkLinkedOSVersion_version;
}

uint64_t __glkLinkedOSVersion_block_invoke()
{
  uint64_t result;

  result = dyld_get_program_sdk_version();
  glkLinkedOSVersion_version = result;
  return result;
}

GLKMatrix4 *__cdecl GLKMatrix4Invert(GLKMatrix4 *__return_ptr retstr, GLKMatrix4 *matrix, BOOL *isInvertible)
{
  uint64_t v3;
  int8x16_t v4;
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  uint32x2_t v16;
  int8x16_t v17;
  unsigned int v18;
  int8x16_t v24;
  int8x16_t v25;
  uint32x2_t v26;
  int8x8_t v27;
  int32x2_t v28;
  int32x4_t v29;
  int8x16_t v30;
  float32x4_t v31;
  float32x4_t v32;
  int8x16_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  int8x16_t v39;
  int8x16_t v40;
  float32x4_t v41;
  int8x8_t v42;
  int32x4_t v43;
  int32x4_t v44;
  int32x4_t v45;
  int32x4_t v46;
  int32x4_t v47;
  int32x4_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int8x16_t v51;
  int8x16_t v52;
  int8x16_t v53;
  int8x16_t v54;
  int8x8_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  int v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  int v65;
  uint64_t v66;

  v3 = 0;
  v66 = *MEMORY[0x24BDAC8D0];
  v4 = 0uLL;
  v62 = 0u;
  v63 = 0u;
  v64 = 0;
  v61 = 0u;
  v60 = -1;
  LODWORD(v62) = -1;
  DWORD1(v63) = -1;
  v65 = -1;
  v5 = *(int32x4_t *)&matrix->m[4];
  v6 = *(int32x4_t *)&matrix->m[8];
  v7 = *(int32x4_t *)&matrix->m[12];
  v8 = vzip1q_s32(*(int32x4_t *)&matrix->m00, v6);
  v9 = vzip2q_s32(*(int32x4_t *)&matrix->m00, v6);
  v10 = vzip1q_s32(v5, v7);
  v11 = vzip2q_s32(v5, v7);
  v12 = (float32x4_t)vzip1q_s32(v8, v10);
  v13 = (float32x4_t)vzip2q_s32(v8, v10);
  v14 = (float32x4_t)vzip1q_s32(v9, v11);
  v15 = (float32x4_t)vzip2q_s32(v9, v11);
  v16 = (uint32x2_t)-1;
  v17.i64[0] = 0x8000000080000000;
  v17.i64[1] = 0x8000000080000000;
  v18 = 50462976;
  __asm { FMOV            V19.4S, #1.0 }
  v24 = 0uLL;
  do
  {
    v25 = vbicq_s8((int8x16_t)v12, v17);
    v26 = (uint32x2_t)vextq_s8(v25, v25, 8uLL).u64[0];
    v27 = (int8x8_t)vcgt_u32(v26, *(uint32x2_t *)v25.i8);
    *(uint32x2_t *)v25.i8 = vmax_u32(*(uint32x2_t *)v25.i8, v26);
    v28 = (int32x2_t)vbsl_s8(v27, (int8x8_t)0xF0E0D0C0B0A0908, (int8x8_t)0x706050403020100);
    v29 = vdupq_lane_s32((int32x2_t)vbsl_s8((int8x8_t)vcgt_u32((uint32x2_t)vrev64_s32(*(int32x2_t *)v25.i8), *(uint32x2_t *)v25.i8), (int8x8_t)vdup_lane_s32(v28, 1), (int8x8_t)v28), 0);
    v16 = vmin_u32(v16, vpmax_u32(*(uint32x2_t *)v25.i8, *(uint32x2_t *)v25.i8));
    v4 = vbslq_s8(*(int8x16_t *)((char *)&v60 + v3), (int8x16_t)v29, v4);
    v30 = (int8x16_t)vceqq_s32(v29, (int32x4_t)xmmword_20DC81420);
    v24 = vbslq_s8(v30, (int8x16_t)vdupq_n_s32(v18), v24);
    v18 += 67372036;
    v31 = vrecpeq_f32(v12);
    v32 = vmulq_f32(v31, vrecpsq_f32(v12, v31));
    v33 = (int8x16_t)vmulq_f32(vrecpsq_f32(v12, v32), v32);
    v34 = (float32x4_t)vbslq_s8(v30, v33, _Q19);
    v35 = vmulq_f32(v13, v34);
    v36 = vmulq_f32(v14, v34);
    v37 = vmulq_f32(v15, v34);
    v38 = (float32x4_t)vandq_s8(v33, v30);
    *(int8x8_t *)v33.i8 = vqtbl1_s8((int8x16_t)v35, *(int8x8_t *)v29.i8);
    *(int8x8_t *)v39.i8 = vqtbl1_s8((int8x16_t)v36, *(int8x8_t *)v29.i8);
    *(int8x8_t *)v40.i8 = vqtbl1_s8((int8x16_t)v37, *(int8x8_t *)v29.i8);
    *(int8x8_t *)v29.i8 = vqtbl1_s8((int8x16_t)v38, *(int8x8_t *)v29.i8);
    v33.i64[1] = v33.i64[0];
    v39.i64[1] = v39.i64[0];
    v40.i64[1] = v40.i64[0];
    v29.i64[1] = v29.i64[0];
    v41 = vmulq_f32(vnegq_f32(v12), v34);
    v12 = vmlaq_f32(v35, (float32x4_t)vbicq_s8(v33, v30), v41);
    v13 = vmlaq_f32(v36, (float32x4_t)vbicq_s8(v39, v30), v41);
    v14 = vmlaq_f32(v37, (float32x4_t)vbicq_s8(v40, v30), v41);
    v15 = vmlaq_f32(v38, (float32x4_t)vbicq_s8((int8x16_t)v29, v30), v41);
    v17 = vorrq_s8(v17, v30);
    v3 += 16;
  }
  while (v3 != 64);
  if (v16.i32[0])
  {
    v42 = (int8x8_t)vextq_s8(v4, v4, 8uLL).u64[0];
    *(int8x8_t *)v43.i8 = vqtbl1_s8((int8x16_t)v12, *(int8x8_t *)v4.i8);
    v43.u64[1] = (unint64_t)vqtbl1_s8((int8x16_t)v12, v42);
    *(int8x8_t *)v44.i8 = vqtbl1_s8((int8x16_t)v13, *(int8x8_t *)v4.i8);
    v44.u64[1] = (unint64_t)vqtbl1_s8((int8x16_t)v13, v42);
    *(int8x8_t *)v45.i8 = vqtbl1_s8((int8x16_t)v14, *(int8x8_t *)v4.i8);
    v45.u64[1] = (unint64_t)vqtbl1_s8((int8x16_t)v14, v42);
    *(int8x8_t *)v46.i8 = vqtbl1_s8((int8x16_t)v15, *(int8x8_t *)v4.i8);
    v46.u64[1] = (unint64_t)vqtbl1_s8((int8x16_t)v15, v42);
    v47 = vzip1q_s32(v43, v45);
    v48 = vzip2q_s32(v43, v45);
    v49 = vzip1q_s32(v44, v46);
    v50 = vzip2q_s32(v44, v46);
    v51 = (int8x16_t)vzip1q_s32(v47, v49);
    v52 = (int8x16_t)vzip2q_s32(v47, v49);
    v53 = (int8x16_t)vzip1q_s32(v48, v50);
    v54 = (int8x16_t)vzip2q_s32(v48, v50);
    v55 = (int8x8_t)vextq_s8(v24, v24, 8uLL).u64[0];
    *(int8x8_t *)&v56 = vqtbl1_s8(v51, *(int8x8_t *)v24.i8);
    *((int8x8_t *)&v56 + 1) = vqtbl1_s8(v51, v55);
    *(int8x8_t *)&v57 = vqtbl1_s8(v52, *(int8x8_t *)v24.i8);
    *((int8x8_t *)&v57 + 1) = vqtbl1_s8(v52, v55);
    *(int8x8_t *)&v58 = vqtbl1_s8(v53, *(int8x8_t *)v24.i8);
    *((int8x8_t *)&v58 + 1) = vqtbl1_s8(v53, v55);
    *(int8x8_t *)&v59 = vqtbl1_s8(v54, *(int8x8_t *)v24.i8);
    *((int8x8_t *)&v59 + 1) = vqtbl1_s8(v54, v55);
    if (isInvertible)
      *isInvertible = 1;
    *(_OWORD *)&retstr->m00 = v56;
    *(_OWORD *)&retstr->m[4] = v57;
    *(_OWORD *)&retstr->m[8] = v58;
  }
  else
  {
    if (isInvertible)
      *isInvertible = 0;
    *(_OWORD *)&retstr->m00 = *(_OWORD *)&GLKMatrix4Identity.m00;
    *(_OWORD *)&retstr->m[4] = *(_OWORD *)&GLKMatrix4Identity.m[4];
    v59 = *(_OWORD *)&GLKMatrix4Identity.m[12];
    *(_OWORD *)&retstr->m[8] = *(_OWORD *)&GLKMatrix4Identity.m[8];
  }
  *(_OWORD *)&retstr->m[12] = v59;
  return matrix;
}

GLKMatrix4 *__cdecl GLKMatrix4InvertAndTranspose(GLKMatrix4 *__return_ptr retstr, GLKMatrix4 *matrix, BOOL *isInvertible)
{
  float32x4_t v3;
  float32x4_t v4;
  float32x4x4_t *v5;
  float32x4x4_t v7;
  float32x4x4_t v8;

  v3 = *(float32x4_t *)&matrix->m[4];
  v7.val[0] = *(float32x4_t *)&matrix->m00;
  v7.val[1] = v3;
  v4 = *(float32x4_t *)&matrix->m[12];
  v7.val[2] = *(float32x4_t *)&matrix->m[8];
  v7.val[3] = v4;
  v5 = &v7;
  v8 = vld4q_f32((const float *)v5);
  v7 = v8;
  return GLKMatrix4Invert(retstr, (GLKMatrix4 *)&v7, isInvertible);
}

GLKQuaternion GLKQuaternionMakeWithMatrix3(GLKMatrix3 *matrix)
{
  GLKQuaternion result;

  *(_QWORD *)&result.x = matrix;
  return result;
}

GLKQuaternion GLKQuaternionMakeWithMatrix4(GLKMatrix4 *matrix)
{
  GLKQuaternion result;

  *(_QWORD *)&result.x = matrix;
  return result;
}

float GLKQuaternionAngle(GLKQuaternion quaternion)
{
  float32x4_t v1;
  __int32 v2;
  unsigned int v3;
  float v4;
  float32x4_t v6;
  float v7;

  if (v4 > 1.0 || v4 < -1.0)
  {
    v1.i32[1] = v2;
    v1.i64[1] = __PAIR64__(LODWORD(v4), v3);
    v6 = vmulq_f32(v1, v1);
    v6.i64[0] = vpaddq_f32(v6, v6).u64[0];
    v4 = v4 * (float)(1.0 / sqrtf(vpadd_f32(*(float32x2_t *)v6.f32, *(float32x2_t *)v6.f32).f32[0]));
  }
  v7 = acosf(v4);
  return v7 + v7;
}

GLKVector3 GLKQuaternionAxis(GLKQuaternion quaternion)
{
  float32x4_t v1;
  __int32 v2;
  unsigned int v3;
  unsigned int v4;
  float32x4_t v5;
  GLKVector3 result;

  v1.i32[1] = v2;
  v1.i64[1] = __PAIR64__(v4, v3);
  v5 = vmulq_f32(v1, v1);
  v5.i64[0] = vpaddq_f32(v5, v5).u64[0];
  _S0 = vmulq_n_f32(v1, 1.0 / sqrtf(COERCE_FLOAT(vpadd_f32(*(float32x2_t *)&v5, *(float32x2_t *)&v5)))).i32[3];
  __asm { FMLS            S3, S0, V1.S[3] }
  *(_QWORD *)&result.x = *(_QWORD *)&quaternion.x;
  result.z = quaternion.z;
  return result;
}

GLKQuaternion GLKQuaternionSlerp(GLKQuaternion quaternionStart, GLKQuaternion quaternionEnd, float t)
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  double v11;
  long double v12;
  float v13;

  v10 = (float)((float)((float)(v3 * v7) + (float)(t * v6)) + (float)(v4 * v8)) + (float)(v5 * v9);
  v11 = v10;
  if (v10 < 0.0)
    v11 = -v11;
  if (1.0 - v11 > 0.00100000005)
  {
    v12 = acos(v11);
    sin(v12);
    sin((1.0 - v13) * v12);
    sin(v12 * v13);
  }
  return quaternionStart;
}

void GLKQuaternionRotateVector3Array(GLKQuaternion quaternion, GLKVector3 *vectors, size_t vectorCount)
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float32x4_t v9;
  float v10;
  float32x4_t v11;
  int8x16_t v12;
  float *v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;

  if (*(_QWORD *)&quaternion.q[2])
  {
    v7 = -v5;
    v8 = -v3;
    v9.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
    v10 = -v4;
    v9.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
    v11 = vmulq_f32(v9, v9);
    v11.i64[0] = vpaddq_f32(v11, v11).u64[0];
    v12 = veorq_s8((int8x16_t)vmulq_n_f32(v9, 1.0 / vpadd_f32(*(float32x2_t *)v11.f32, *(float32x2_t *)v11.f32).f32[0]), (int8x16_t)xmmword_20DC81480);
    v13 = (float *)(*(_QWORD *)&quaternion.x + 8);
    do
    {
      v14 = *(v13 - 2);
      v15 = *(v13 - 1);
      v16 = (float)((float)((float)(v3 * 0.0) + (float)(v6 * v14)) + (float)(v4 * *v13)) + (float)(v7 * v15);
      v17 = (float)((float)((float)(v4 * 0.0) + (float)(v6 * v15)) + (float)(v5 * v14)) + (float)(v8 * *v13);
      v18 = (float)((float)((float)(v5 * 0.0) + (float)(v6 * *v13)) + (float)(v3 * v15)) + (float)(v10 * v14);
      v19 = (float)((float)((float)(v14 * v8) + (float)(v6 * 0.0)) + (float)(v10 * v15)) + (float)(v7 * *v13);
      *(v13 - 2) = (float)((float)((float)(v16 * *(float *)&v12.i32[3]) + (float)(v19 * *(float *)v12.i32))
                         + (float)(v17 * *(float *)&v12.i32[2]))
                 - (float)(v18 * *(float *)&v12.i32[1]);
      *(v13 - 1) = (float)((float)((float)(v17 * *(float *)&v12.i32[3]) + (float)(v19 * *(float *)&v12.i32[1]))
                         + (float)(v18 * *(float *)v12.i32))
                 - (float)(v16 * *(float *)&v12.i32[2]);
      *v13 = (float)((float)((float)(v18 * *(float *)&v12.i32[3]) + (float)(v19 * *(float *)&v12.i32[2]))
                   + (float)(v16 * *(float *)&v12.i32[1]))
           - (float)(v17 * *(float *)v12.i32);
      v13 += 3;
      --*(_QWORD *)&quaternion.q[2];
    }
    while (*(_QWORD *)&quaternion.q[2]);
  }
}

void GLKQuaternionRotateVector4Array(GLKQuaternion quaternion, GLKVector4 *vectors, size_t vectorCount)
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float32x4_t v9;
  float v10;
  float32x4_t v11;
  int8x16_t v12;
  float *v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;

  if (*(_QWORD *)&quaternion.q[2])
  {
    v7 = -v5;
    v8 = -v3;
    v9.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
    v10 = -v4;
    v9.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
    v11 = vmulq_f32(v9, v9);
    v11.i64[0] = vpaddq_f32(v11, v11).u64[0];
    v12 = veorq_s8((int8x16_t)vmulq_n_f32(v9, 1.0 / vpadd_f32(*(float32x2_t *)v11.f32, *(float32x2_t *)v11.f32).f32[0]), (int8x16_t)xmmword_20DC81480);
    v13 = (float *)(*(_QWORD *)&quaternion.x + 8);
    do
    {
      v14 = *(v13 - 2);
      v15 = *(v13 - 1);
      v16 = (float)((float)((float)(v3 * 0.0) + (float)(v6 * v14)) + (float)(v4 * *v13)) + (float)(v7 * v15);
      v17 = (float)((float)((float)(v4 * 0.0) + (float)(v6 * v15)) + (float)(v5 * v14)) + (float)(v8 * *v13);
      v18 = (float)((float)((float)(v5 * 0.0) + (float)(v6 * *v13)) + (float)(v3 * v15)) + (float)(v10 * v14);
      v19 = (float)((float)((float)(v14 * v8) + (float)(v6 * 0.0)) + (float)(v10 * v15)) + (float)(v7 * *v13);
      *(v13 - 2) = (float)((float)((float)(v16 * *(float *)&v12.i32[3]) + (float)(v19 * *(float *)v12.i32))
                         + (float)(v17 * *(float *)&v12.i32[2]))
                 - (float)(v18 * *(float *)&v12.i32[1]);
      *(v13 - 1) = (float)((float)((float)(v17 * *(float *)&v12.i32[3]) + (float)(v19 * *(float *)&v12.i32[1]))
                         + (float)(v18 * *(float *)v12.i32))
                 - (float)(v16 * *(float *)&v12.i32[2]);
      *v13 = (float)((float)((float)(v18 * *(float *)&v12.i32[3]) + (float)(v19 * *(float *)&v12.i32[2]))
                   + (float)(v16 * *(float *)&v12.i32[1]))
           - (float)(v17 * *(float *)v12.i32);
      v13 += 4;
      --*(_QWORD *)&quaternion.q[2];
    }
    while (*(_QWORD *)&quaternion.q[2]);
  }
}

GLKMatrixStackRef GLKMatrixStackCreate(CFAllocatorRef alloc)
{
  uint64_t Instance;
  _GLKMatrixStack *v2;
  _QWORD *v3;
  char *v4;
  int v5;
  _QWORD *v6;
  char *v7;

  if (GLKMatrixStackGetTypeID_pred != -1)
    dispatch_once_f(&GLKMatrixStackGetTypeID_pred, 0, (dispatch_function_t)_GLKMatrixStackRegisterClass);
  Instance = _CFRuntimeCreateInstance();
  v2 = (_GLKMatrixStack *)Instance;
  if (Instance)
  {
    *(_QWORD *)(Instance + 16) = 0;
    v3 = malloc_type_calloc(0x28uLL, 1uLL, 0x11EDA976uLL);
    *(_DWORD *)v3 = 1;
    v3[1] = 80;
    *((_DWORD *)v3 + 4) = 16;
    v4 = (char *)malloc_type_calloc(0x50uLL, 0x10uLL, 0x41427E63uLL);
    v3[3] = v4;
    *((_QWORD *)v2 + 2) = v3;
    if (*(int *)v3 >= 2)
    {
      v5 = *(_DWORD *)v3 - 1;
      v6 = v3;
      do
      {
        v6 = (_QWORD *)v6[4];
        --v5;
      }
      while (v5);
      v4 = (char *)v6[3];
    }
    v7 = &v4[v3[1] * *((int *)v3 + 1)];
    *(GLKMatrix4 *)v7 = GLKMatrix4Identity;
    *((_QWORD *)v7 + 8) = 0x3F80000000000005;
  }
  return v2;
}

CFTypeID GLKMatrixStackGetTypeID(void)
{
  if (GLKMatrixStackGetTypeID_pred != -1)
    dispatch_once_f(&GLKMatrixStackGetTypeID_pred, 0, (dispatch_function_t)_GLKMatrixStackRegisterClass);
  return _GLKMatrixStackTypeID;
}

uint64_t _GLKMatrixStackRegisterClass()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  _GLKMatrixStackTypeID = result;
  return result;
}

uint64_t GLKMatrixStackGetModifyCount(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = v1;
  if (*(int *)v1 >= 2)
  {
    v3 = *(_DWORD *)v1 - 1;
    v2 = *(_QWORD *)(a1 + 16);
    do
    {
      v2 = *(_QWORD *)(v2 + 32);
      --v3;
    }
    while (v3);
  }
  return *(unsigned int *)(*(_QWORD *)(v2 + 24) + *(_QWORD *)(v1 + 8) * *(int *)(v1 + 4) + 72);
}

void GLKMatrixStackPush(GLKMatrixStackRef stack)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  size_t v9;
  size_t *v10;
  _QWORD *v11;
  const void *v12;
  int v13;
  int v14;
  _QWORD *v15;

  v1 = *((_QWORD *)stack + 2);
  v2 = *(_DWORD *)v1;
  if (*(int *)v1 < 2)
  {
    v8 = (int *)(v1 + 4);
    v7 = *(int *)(v1 + 4);
    v10 = (size_t *)(v1 + 8);
    v9 = *(_QWORD *)(v1 + 8);
    v12 = (const void *)(*(_QWORD *)(v1 + 24) + v9 * v7);
    v11 = (_QWORD *)*((_QWORD *)stack + 2);
  }
  else
  {
    v3 = v2 - 1;
    v4 = v2 - 1;
    v5 = *((_QWORD *)stack + 2);
    do
    {
      v5 = *(_QWORD *)(v5 + 32);
      --v4;
    }
    while (v4);
    v6 = *(_QWORD *)(v5 + 24);
    v8 = (int *)(v1 + 4);
    v7 = *(int *)(v1 + 4);
    v10 = (size_t *)(v1 + 8);
    v9 = *(_QWORD *)(v1 + 8);
    v11 = (_QWORD *)*((_QWORD *)stack + 2);
    do
    {
      v11 = (_QWORD *)v11[4];
      --v3;
    }
    while (v3);
    v12 = (const void *)(v6 + v9 * v7);
  }
  v13 = v7 + 1;
  *(_DWORD *)(v1 + 4) = v7 + 1;
  v14 = *(_DWORD *)(v1 + 16);
  if ((int)v7 >= v14 - 1)
  {
    *(_QWORD *)v1 = (v2 + 1);
    if (v11[4])
    {
      v13 = 0;
      v11 = (_QWORD *)v11[4];
    }
    else
    {
      v15 = malloc_type_calloc(0x28uLL, 1uLL, 0x11EDA976uLL);
      *(_DWORD *)v15 = 1;
      v15[1] = v9;
      *((_DWORD *)v15 + 4) = v14;
      v15[3] = malloc_type_calloc(v9, v14, 0x41427E63uLL);
      v11[4] = v15;
      v13 = *v8;
      v9 = *v10;
      v11 = v15;
    }
  }
  memcpy((void *)(v11[3] + v9 * v13), v12, v9);
}

void GLKMatrixStackPop(GLKMatrixStackRef stack)
{
  int *v1;
  int v2;
  int v3;
  int v4;

  v1 = (int *)*((_QWORD *)stack + 2);
  v2 = *v1;
  v3 = v1[1];
  if (*v1 < 2)
  {
    if (v3 <= 0)
      v4 = 0;
    else
      v4 = v3 - 1;
    goto LABEL_8;
  }
  v1[1] = v3 - 1;
  if (v3 < 1)
  {
    *v1 = v2 - 1;
    v4 = v1[4] - 1;
LABEL_8:
    v1[1] = v4;
  }
}

int GLKMatrixStackSize(GLKMatrixStackRef stack)
{
  return *(_DWORD *)(*((_QWORD *)stack + 2) + 4)
       + (**((_DWORD **)stack + 2) - 1) * *(_DWORD *)(*((_QWORD *)stack + 2) + 16)
       + 1;
}

void GLKMatrixStackLoadMatrix4(GLKMatrixStackRef stack, GLKMatrix4 *matrix)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  int v9;

  v2 = *((_QWORD *)stack + 2);
  v3 = v2;
  if (*(int *)v2 >= 2)
  {
    v4 = *(_DWORD *)v2 - 1;
    v3 = *((_QWORD *)stack + 2);
    do
    {
      v3 = *(_QWORD *)(v3 + 32);
      --v4;
    }
    while (v4);
  }
  v5 = *(_QWORD *)(v3 + 24) + *(_QWORD *)(v2 + 8) * *(int *)(v2 + 4);
  v7 = *(_OWORD *)&matrix->m[8];
  v6 = *(_OWORD *)&matrix->m[12];
  v8 = *(_OWORD *)&matrix->m[4];
  *(_OWORD *)v5 = *(_OWORD *)&matrix->m00;
  *(_OWORD *)(v5 + 16) = v8;
  *(_OWORD *)(v5 + 32) = v7;
  *(_OWORD *)(v5 + 48) = v6;
  if (((*(_DWORD *)(v5 + 28) | *(_DWORD *)(v5 + 12) | *(_DWORD *)(v5 + 44)) & 0x7FFFFFFF) != 0
    || *(_DWORD *)(v5 + 60) != 1065353216)
  {
    v9 = 0;
  }
  else
  {
    v9 = 2;
  }
  *(_DWORD *)(v5 + 64) = v9;
  ++*(_DWORD *)(v5 + 72);
}

GLKMatrix4 *__cdecl GLKMatrixStackGetMatrix4(GLKMatrix4 *__return_ptr retstr, GLKMatrix4 *stack)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;

  v2 = *(_QWORD *)&stack->m[4];
  v3 = v2;
  if (*(int *)v2 >= 2)
  {
    v4 = *(_DWORD *)v2 - 1;
    v3 = *(_QWORD *)&stack->m[4];
    do
    {
      v3 = *(_QWORD *)(v3 + 32);
      --v4;
    }
    while (v4);
  }
  v5 = (_OWORD *)(*(_QWORD *)(v3 + 24) + *(_QWORD *)(v2 + 8) * *(int *)(v2 + 4));
  v6 = v5[1];
  *(_OWORD *)&retstr->m00 = *v5;
  *(_OWORD *)&retstr->m[4] = v6;
  v7 = v5[3];
  *(_OWORD *)&retstr->m[8] = v5[2];
  *(_OWORD *)&retstr->m[12] = v7;
  return stack;
}

GLKMatrix3 *__cdecl GLKMatrixStackGetMatrix3(GLKMatrix3 *__return_ptr retstr, GLKMatrix3 *stack)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  float v7;
  float v8;

  v2 = *(_QWORD *)&stack->m[4];
  v3 = v2;
  if (*(int *)v2 >= 2)
  {
    v4 = *(_DWORD *)v2 - 1;
    v3 = *(_QWORD *)&stack->m[4];
    do
    {
      v3 = *(_QWORD *)(v3 + 32);
      --v4;
    }
    while (v4);
  }
  v5 = *(_QWORD *)(v3 + 24) + *(_QWORD *)(v2 + 8) * *(int *)(v2 + 4);
  *(_QWORD *)&v6 = *(_QWORD *)(v5 + 4);
  v7 = *(float *)(v5 + 24);
  v8 = *(float *)(v5 + 40);
  *((_QWORD *)&v6 + 1) = *(_QWORD *)(v5 + 16);
  retstr->m00 = *(float *)v5;
  *(_OWORD *)&retstr->m[1] = v6;
  retstr->m12 = v7;
  *(_QWORD *)&retstr->m[6] = *(_QWORD *)(v5 + 32);
  retstr->m22 = v8;
  return stack;
}

GLKMatrix2 GLKMatrixStackGetMatrix2(GLKMatrixStackRef stack)
{
  int v1;
  int v2;
  uint64_t v3;
  GLKMatrix2 result;

  v1 = **((_DWORD **)stack + 2);
  if (v1 >= 2)
  {
    v2 = v1 - 1;
    v3 = *((_QWORD *)stack + 2);
    do
    {
      v3 = *(_QWORD *)(v3 + 32);
      --v2;
    }
    while (v2);
  }
  *(_QWORD *)&result.m00 = stack;
  return result;
}

GLKMatrix4 *__cdecl GLKMatrixStackGetMatrix4Inverse(GLKMatrix4 *__return_ptr retstr, GLKMatrixStackRef stack)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  float *v8;
  GLKMatrix4 *result;
  float v10;
  float m00;
  float m10;
  float m20;
  float m01;
  float m11;
  float m21;
  float v17;
  unsigned int v18;
  unsigned int v19;
  float v20;
  float v21;
  float v22;
  float m30;
  float m31;
  float v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  unsigned int v56;
  float v57;
  float v58;
  float v59;
  float v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  GLKMatrix4 v64;
  GLKMatrix4 v65;

  v3 = *((_QWORD *)stack + 2);
  v4 = v3;
  if (*(int *)v3 >= 2)
  {
    v5 = *(_DWORD *)v3 - 1;
    v4 = *((_QWORD *)stack + 2);
    do
    {
      v4 = *(_QWORD *)(v4 + 32);
      --v5;
    }
    while (v5);
  }
  v6 = *(int *)(v3 + 4);
  v7 = *(_QWORD *)(v3 + 8);
  v8 = (float *)(*(_QWORD *)(v4 + 24) + v7 * v6);
  result = (GLKMatrix4 *)*((unsigned int *)v8 + 16);
  if ((_DWORD)result == 2)
  {
    result = (GLKMatrix4 *)_GLKMatrix4Classify(*(_QWORD *)(v4 + 24) + v7 * v6, v8 + 17);
    *((_DWORD *)v8 + 16) = (_DWORD)result;
  }
  if (result >= 3)
  {
    v10 = v8[17];
    m00 = v10 * *v8;
    m10 = v10 * v8[1];
    m20 = v10 * v8[2];
    m01 = v10 * v8[4];
    m11 = v10 * v8[5];
    m21 = v10 * v8[6];
    v17 = v10 * v8[8];
    *(float *)&v18 = v10 * v8[9];
    *(float *)&v19 = v10 * v8[10];
    v20 = v8[12];
    v21 = v8[13];
    v22 = v8[14];
    m30 = -(float)((float)((float)(m10 * v21) + (float)(m00 * v20)) + (float)(m20 * v22));
    m31 = -(float)((float)((float)(m11 * v21) + (float)(m01 * v20)) + (float)(m21 * v22));
    v25 = -(float)((float)((float)(*(float *)&v18 * v21) + (float)(v17 * v20)) + (float)(*(float *)&v19 * v22));
    v26 = LODWORD(v20);
    *(float *)&v26 = v17;
    v27 = v18;
    v28 = v19;
    __asm { FMOV            V19.2S, #1.0 }
    *(float *)&_D19 = v25;
LABEL_12:
    retstr->m00 = m00;
    retstr->m01 = m01;
    *(_QWORD *)&retstr->m[2] = v26;
    retstr->m10 = m10;
    retstr->m11 = m11;
    *(_QWORD *)&retstr->m[6] = v27;
    retstr->m20 = m20;
    retstr->m21 = m21;
    *(_QWORD *)&retstr->m[10] = v28;
    retstr->m30 = m30;
    retstr->m31 = m31;
    *(_QWORD *)&retstr->m[14] = _D19;
    return result;
  }
  if (!(_DWORD)result)
  {
    v61 = *(_OWORD *)v8;
    v62 = *((_OWORD *)v8 + 1);
    v63 = *((_OWORD *)v8 + 3);
    *(_OWORD *)&v64.m[8] = *((_OWORD *)v8 + 2);
    *(_OWORD *)&v64.m[12] = v63;
    *(_OWORD *)&v64.m00 = v61;
    *(_OWORD *)&v64.m[4] = v62;
    result = GLKMatrix4Invert(&v65, &v64, 0);
    m01 = v65.m01;
    m00 = v65.m00;
    v26 = *(_QWORD *)&v65.m[2];
    m11 = v65.m11;
    m10 = v65.m10;
    v27 = *(_QWORD *)&v65.m[6];
    m21 = v65.m21;
    m20 = v65.m20;
    v28 = *(_QWORD *)&v65.m[10];
    m31 = v65.m31;
    m30 = v65.m30;
    _D19 = *(_QWORD *)&v65.m[14];
    goto LABEL_12;
  }
  v34 = *v8;
  v35 = v8[1];
  v36 = v8[2];
  v37 = v8[4];
  v38 = v8[5];
  v39 = v8[6];
  v40 = v8[8];
  v41 = v8[9];
  v42 = v8[10];
  v43 = (float)(v35 * v39) - (float)(v38 * v36);
  v44 = (float)(v41 * v36) - (float)(v35 * v42);
  v45 = (float)(v38 * v42) - (float)(v39 * v41);
  v46 = (float)((float)(v37 * v44) + (float)(v40 * v43)) + (float)(*v8 * v45);
  if (v46 != 0.0)
  {
    v47 = 1.0 / v46;
    v48 = (float)(v40 * v39) - (float)(v37 * v42);
    v49 = (float)(v37 * v41) - (float)(v40 * v38);
    v50 = (float)(v34 * v42) - (float)(v40 * v36);
    v51 = (float)(v40 * v35) - (float)(v34 * v41);
    v52 = (float)(v37 * v36) - (float)(v34 * v39);
    v53 = (float)(v34 * v38) - (float)(v37 * v35);
    m00 = v45 * v47;
    m10 = v48 * v47;
    m20 = v49 * v47;
    m01 = v44 * v47;
    m11 = v50 * v47;
    m21 = v51 * v47;
    v54 = v43 * v47;
    v55 = v52 * v47;
    *(float *)&v56 = v53 * v47;
    v57 = v8[12];
    v58 = v8[13];
    v59 = v8[14];
    m30 = (float)((float)-(float)(v58 * m10) - (float)(m00 * v57)) - (float)(m20 * v59);
    m31 = (float)((float)-(float)(v58 * m11) - (float)(m01 * v57)) - (float)(m21 * v59);
    v60 = (float)((float)-(float)(v58 * v55) - (float)(v54 * v57)) - (float)(*(float *)&v56 * v59);
    v26 = LODWORD(v57);
    *(float *)&v26 = v54;
    v27 = LODWORD(v58);
    *(float *)&v27 = v55;
    v28 = v56;
    __asm { FMOV            V19.2S, #1.0 }
    *(float *)&_D19 = v60;
    goto LABEL_12;
  }
  *retstr = GLKMatrix4Identity;
  return result;
}

GLKMatrix4 *__cdecl GLKMatrixStackGetMatrix4InverseTranspose(GLKMatrix4 *__return_ptr retstr, GLKMatrixStackRef stack)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  float *v8;
  GLKMatrix4 *result;
  float v10;
  float m00;
  float m10;
  float m20;
  float m01;
  float m11;
  float m21;
  float v17;
  unsigned int v18;
  unsigned int v19;
  float v20;
  float v21;
  float v22;
  float m30;
  float m31;
  float v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  unsigned int v56;
  float v57;
  float v58;
  float v59;
  float v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  GLKMatrix4 *v66;
  GLKMatrix4 v67;
  GLKMatrix4 v68;
  float32x4x4_t v69;

  v3 = *((_QWORD *)stack + 2);
  v4 = v3;
  if (*(int *)v3 >= 2)
  {
    v5 = *(_DWORD *)v3 - 1;
    v4 = *((_QWORD *)stack + 2);
    do
    {
      v4 = *(_QWORD *)(v4 + 32);
      --v5;
    }
    while (v5);
  }
  v6 = *(int *)(v3 + 4);
  v7 = *(_QWORD *)(v3 + 8);
  v8 = (float *)(*(_QWORD *)(v4 + 24) + v7 * v6);
  result = (GLKMatrix4 *)*((unsigned int *)v8 + 16);
  if ((_DWORD)result == 2)
  {
    result = (GLKMatrix4 *)_GLKMatrix4Classify(*(_QWORD *)(v4 + 24) + v7 * v6, v8 + 17);
    *((_DWORD *)v8 + 16) = (_DWORD)result;
  }
  if (result < 3)
  {
    if ((_DWORD)result)
    {
      v34 = *v8;
      v35 = v8[1];
      v36 = v8[2];
      v37 = v8[4];
      v38 = v8[5];
      v39 = v8[6];
      v40 = v8[8];
      v41 = v8[9];
      v42 = v8[10];
      v43 = (float)(v35 * v39) - (float)(v38 * v36);
      v44 = (float)(v41 * v36) - (float)(v35 * v42);
      v45 = (float)(v38 * v42) - (float)(v39 * v41);
      v46 = (float)((float)(v37 * v44) + (float)(v40 * v43)) + (float)(*v8 * v45);
      if (v46 == 0.0)
      {
        *retstr = GLKMatrix4Identity;
        goto LABEL_13;
      }
      v47 = 1.0 / v46;
      v48 = (float)(v40 * v39) - (float)(v37 * v42);
      v49 = (float)(v37 * v41) - (float)(v40 * v38);
      v50 = (float)(v34 * v42) - (float)(v40 * v36);
      v51 = (float)(v40 * v35) - (float)(v34 * v41);
      v52 = (float)(v37 * v36) - (float)(v34 * v39);
      v53 = (float)(v34 * v38) - (float)(v37 * v35);
      m00 = v45 * v47;
      m10 = v48 * v47;
      m20 = v49 * v47;
      m01 = v44 * v47;
      m11 = v50 * v47;
      m21 = v51 * v47;
      v54 = v43 * v47;
      v55 = v52 * v47;
      *(float *)&v56 = v53 * v47;
      v57 = v8[12];
      v58 = v8[13];
      v59 = v8[14];
      m30 = (float)((float)-(float)(v58 * m10) - (float)(m00 * v57)) - (float)(m20 * v59);
      m31 = (float)((float)-(float)(v58 * m11) - (float)(m01 * v57)) - (float)(m21 * v59);
      v60 = (float)((float)-(float)(v58 * v55) - (float)(v54 * v57)) - (float)(*(float *)&v56 * v59);
      v26 = LODWORD(v57);
      *(float *)&v26 = v54;
      v27 = LODWORD(v58);
      *(float *)&v27 = v55;
      v28 = v56;
      __asm { FMOV            V19.2S, #1.0 }
      *(float *)&_D19 = v60;
    }
    else
    {
      v61 = *(_OWORD *)v8;
      v62 = *((_OWORD *)v8 + 1);
      v63 = *((_OWORD *)v8 + 3);
      *(_OWORD *)&v67.m[8] = *((_OWORD *)v8 + 2);
      *(_OWORD *)&v67.m[12] = v63;
      *(_OWORD *)&v67.m00 = v61;
      *(_OWORD *)&v67.m[4] = v62;
      result = GLKMatrix4Invert(&v68, &v67, 0);
      m01 = v68.m01;
      m00 = v68.m00;
      v26 = *(_QWORD *)&v68.m[2];
      m11 = v68.m11;
      m10 = v68.m10;
      v27 = *(_QWORD *)&v68.m[6];
      m21 = v68.m21;
      m20 = v68.m20;
      v28 = *(_QWORD *)&v68.m[10];
      m31 = v68.m31;
      m30 = v68.m30;
      _D19 = *(_QWORD *)&v68.m[14];
    }
  }
  else
  {
    v10 = v8[17];
    m00 = v10 * *v8;
    m10 = v10 * v8[1];
    m20 = v10 * v8[2];
    m01 = v10 * v8[4];
    m11 = v10 * v8[5];
    m21 = v10 * v8[6];
    v17 = v10 * v8[8];
    *(float *)&v18 = v10 * v8[9];
    *(float *)&v19 = v10 * v8[10];
    v20 = v8[12];
    v21 = v8[13];
    v22 = v8[14];
    m30 = -(float)((float)((float)(m10 * v21) + (float)(m00 * v20)) + (float)(m20 * v22));
    m31 = -(float)((float)((float)(m11 * v21) + (float)(m01 * v20)) + (float)(m21 * v22));
    v25 = -(float)((float)((float)(*(float *)&v18 * v21) + (float)(v17 * v20)) + (float)(*(float *)&v19 * v22));
    v26 = LODWORD(v20);
    *(float *)&v26 = v17;
    v27 = v18;
    v28 = v19;
    __asm { FMOV            V19.2S, #1.0 }
    *(float *)&_D19 = v25;
  }
  retstr->m00 = m00;
  retstr->m01 = m01;
  *(_QWORD *)&retstr->m[2] = v26;
  retstr->m10 = m10;
  retstr->m11 = m11;
  *(_QWORD *)&retstr->m[6] = v27;
  retstr->m20 = m20;
  retstr->m21 = m21;
  *(_QWORD *)&retstr->m[10] = v28;
  retstr->m30 = m30;
  retstr->m31 = m31;
  *(_QWORD *)&retstr->m[14] = _D19;
LABEL_13:
  v64 = *(_OWORD *)&retstr->m[4];
  *(_OWORD *)&v68.m00 = *(_OWORD *)&retstr->m00;
  *(_OWORD *)&v68.m[4] = v64;
  v65 = *(_OWORD *)&retstr->m[12];
  *(_OWORD *)&v68.m[8] = *(_OWORD *)&retstr->m[8];
  *(_OWORD *)&v68.m[12] = v65;
  v66 = &v68;
  v69 = vld4q_f32(&v66->m00);
  *(float32x4x4_t *)retstr = v69;
  return result;
}

GLKMatrix3 *__cdecl GLKMatrixStackGetMatrix3Inverse(GLKMatrix3 *__return_ptr retstr, GLKMatrixStackRef stack)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  float *v8;
  GLKMatrix3 *result;
  float v10;
  float m00;
  float m10;
  float m20;
  float m01;
  float m11;
  float m21;
  float m02;
  float m12;
  float m22;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  GLKMatrix4 v43;
  GLKMatrix4 v44;

  v3 = *((_QWORD *)stack + 2);
  v4 = v3;
  if (*(int *)v3 >= 2)
  {
    v5 = *(_DWORD *)v3 - 1;
    v4 = *((_QWORD *)stack + 2);
    do
    {
      v4 = *(_QWORD *)(v4 + 32);
      --v5;
    }
    while (v5);
  }
  v6 = *(int *)(v3 + 4);
  v7 = *(_QWORD *)(v3 + 8);
  v8 = (float *)(*(_QWORD *)(v4 + 24) + v7 * v6);
  result = (GLKMatrix3 *)*((unsigned int *)v8 + 16);
  if ((_DWORD)result == 2)
  {
    result = (GLKMatrix3 *)_GLKMatrix4Classify(*(_QWORD *)(v4 + 24) + v7 * v6, v8 + 17);
    *((_DWORD *)v8 + 16) = (_DWORD)result;
  }
  if (result < 3)
  {
    if ((_DWORD)result)
    {
      v20 = *v8;
      v21 = v8[1];
      v22 = v8[2];
      v23 = v8[4];
      v24 = v8[5];
      v25 = v8[6];
      v26 = v8[8];
      v27 = v8[9];
      v28 = v8[10];
      v29 = (float)(v21 * v25) - (float)(v24 * v22);
      v30 = (float)(v27 * v22) - (float)(v21 * v28);
      v31 = (float)(v24 * v28) - (float)(v25 * v27);
      v32 = (float)((float)(v23 * v30) + (float)(v26 * v29)) + (float)(*v8 * v31);
      if (v32 == 0.0)
      {
        m00 = 1.0;
        m01 = 0.0;
        m02 = 0.0;
        m10 = 0.0;
        m11 = 1.0;
        m12 = 0.0;
        m20 = 0.0;
        m21 = 0.0;
        m22 = 1.0;
      }
      else
      {
        v33 = (float)(v26 * v25) - (float)(v23 * v28);
        v34 = (float)(v20 * v28) - (float)(v26 * v22);
        v35 = (float)(v23 * v27) - (float)(v26 * v24);
        v36 = (float)(v26 * v21) - (float)(v20 * v27);
        v37 = (float)(v23 * v22) - (float)(v20 * v25);
        v38 = (float)(v20 * v24) - (float)(v23 * v21);
        v39 = 1.0 / v32;
        m00 = v31 * v39;
        m10 = v33 * v39;
        m20 = v35 * v39;
        m01 = v30 * v39;
        m11 = v34 * v39;
        m21 = v36 * v39;
        m02 = v29 * v39;
        m12 = v37 * v39;
        m22 = v38 * v39;
      }
    }
    else
    {
      v40 = *(_OWORD *)v8;
      v41 = *((_OWORD *)v8 + 1);
      v42 = *((_OWORD *)v8 + 3);
      *(_OWORD *)&v43.m[8] = *((_OWORD *)v8 + 2);
      *(_OWORD *)&v43.m[12] = v42;
      *(_OWORD *)&v43.m00 = v40;
      *(_OWORD *)&v43.m[4] = v41;
      result = (GLKMatrix3 *)GLKMatrix4Invert(&v44, &v43, 0);
      m01 = v44.m01;
      m00 = v44.m00;
      m02 = v44.m02;
      m11 = v44.m11;
      m10 = v44.m10;
      m12 = v44.m12;
      m21 = v44.m21;
      m20 = v44.m20;
      m22 = v44.m22;
    }
  }
  else
  {
    v10 = v8[17];
    m00 = v10 * *v8;
    m10 = v10 * v8[1];
    m20 = v10 * v8[2];
    m01 = v10 * v8[4];
    m11 = v10 * v8[5];
    m21 = v10 * v8[6];
    m02 = v10 * v8[8];
    m12 = v10 * v8[9];
    m22 = v10 * v8[10];
  }
  retstr->m00 = m00;
  retstr->m01 = m01;
  retstr->m02 = m02;
  retstr->m10 = m10;
  retstr->m11 = m11;
  retstr->m12 = m12;
  retstr->m20 = m20;
  retstr->m21 = m21;
  retstr->m22 = m22;
  return result;
}

GLKMatrix3 *__cdecl GLKMatrixStackGetMatrix3InverseTranspose(GLKMatrix3 *__return_ptr retstr, GLKMatrixStackRef stack)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  float *v8;
  GLKMatrix3 *result;
  float v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  float m01;
  float m11;
  float m21;
  float v17;
  unsigned int v18;
  unsigned int v19;
  float v20;
  float v21;
  float v22;
  __int128 v23;
  float m31;
  float v25;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  unsigned int v55;
  float v56;
  float v57;
  float v58;
  float v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  GLKMatrix4 *v63;
  GLKMatrix4 v64;
  GLKMatrix4 v65;
  float32x4x4_t v66;

  v3 = *((_QWORD *)stack + 2);
  v4 = v3;
  if (*(int *)v3 >= 2)
  {
    v5 = *(_DWORD *)v3 - 1;
    v4 = *((_QWORD *)stack + 2);
    do
    {
      v4 = *(_QWORD *)(v4 + 32);
      --v5;
    }
    while (v5);
  }
  v6 = *(int *)(v3 + 4);
  v7 = *(_QWORD *)(v3 + 8);
  v8 = (float *)(*(_QWORD *)(v4 + 24) + v7 * v6);
  result = (GLKMatrix3 *)*((unsigned int *)v8 + 16);
  if ((_DWORD)result == 2)
  {
    result = (GLKMatrix3 *)_GLKMatrix4Classify(*(_QWORD *)(v4 + 24) + v7 * v6, v8 + 17);
    *((_DWORD *)v8 + 16) = (_DWORD)result;
  }
  if (result < 3)
  {
    if ((_DWORD)result)
    {
      v34 = *v8;
      v35 = v8[1];
      v36 = v8[2];
      v37 = v8[4];
      v38 = v8[5];
      v39 = v8[6];
      v40 = v8[8];
      v41 = v8[9];
      v42 = v8[10];
      v43 = (float)(v35 * v39) - (float)(v38 * v36);
      v44 = (float)(v41 * v36) - (float)(v35 * v42);
      v45 = (float)(v38 * v42) - (float)(v39 * v41);
      v46 = (float)((float)(v37 * v44) + (float)(v40 * v43)) + (float)(*v8 * v45);
      if (v46 == 0.0)
      {
        v11 = *(_OWORD *)&GLKMatrix4Identity.m00;
        v12 = *(_OWORD *)&GLKMatrix4Identity.m[4];
        v13 = *(_OWORD *)&GLKMatrix4Identity.m[8];
        v23 = *(_OWORD *)&GLKMatrix4Identity.m[12];
        goto LABEL_13;
      }
      v47 = 1.0 / v46;
      v48 = (float)(v40 * v39) - (float)(v37 * v42);
      v49 = (float)(v37 * v41) - (float)(v40 * v38);
      v50 = (float)(v34 * v42) - (float)(v40 * v36);
      v51 = (float)(v40 * v35) - (float)(v34 * v41);
      v52 = (float)(v37 * v36) - (float)(v34 * v39);
      v53 = (float)(v34 * v38) - (float)(v37 * v35);
      *(float *)&v11 = v45 * v47;
      *(float *)&v12 = v48 * v47;
      *(float *)&v13 = v49 * v47;
      m01 = v44 * v47;
      m11 = v50 * v47;
      m21 = v51 * v47;
      v54 = v43 * v47;
      *(float *)&v55 = v52 * v47;
      v56 = v8[12];
      v57 = v8[13];
      v58 = v8[14];
      *(float *)&v23 = (float)((float)-(float)(v57 * *(float *)&v12) - (float)((float)(v45 * v47) * v56))
                     - (float)(*(float *)&v13 * v58);
      m31 = (float)((float)-(float)(v57 * m11) - (float)((float)(v44 * v47) * v56)) - (float)(m21 * v58);
      v59 = (float)((float)-(float)(v57 * *(float *)&v55) - (float)(v54 * v56)) - (float)((float)(v53 * v47) * v58);
      __asm { FMOV            V16.2S, #1.0 }
      *(float *)&_D16 = v59;
      HIDWORD(v31) = 0;
      *(float *)&v31 = v53 * v47;
      v33 = LODWORD(v58);
      v32 = v55;
      *(float *)&v33 = v54;
    }
    else
    {
      v60 = *(_OWORD *)v8;
      v61 = *((_OWORD *)v8 + 1);
      v62 = *((_OWORD *)v8 + 3);
      *(_OWORD *)&v64.m[8] = *((_OWORD *)v8 + 2);
      *(_OWORD *)&v64.m[12] = v62;
      *(_OWORD *)&v64.m00 = v60;
      *(_OWORD *)&v64.m[4] = v61;
      result = (GLKMatrix3 *)GLKMatrix4Invert(&v65, &v64, 0);
      m01 = v65.m01;
      *(float *)&v11 = v65.m00;
      v33 = *(_QWORD *)&v65.m[2];
      m11 = v65.m11;
      *(float *)&v12 = v65.m10;
      v32 = *(_QWORD *)&v65.m[6];
      m21 = v65.m21;
      *(float *)&v13 = v65.m20;
      v31 = *(_QWORD *)&v65.m[10];
      m31 = v65.m31;
      *(float *)&v23 = v65.m30;
      _D16 = *(_QWORD *)&v65.m[14];
    }
  }
  else
  {
    v10 = v8[17];
    *(float *)&v11 = v10 * *v8;
    *(float *)&v12 = v10 * v8[1];
    *(float *)&v13 = v10 * v8[2];
    m01 = v10 * v8[4];
    m11 = v10 * v8[5];
    m21 = v10 * v8[6];
    v17 = v10 * v8[8];
    *(float *)&v18 = v10 * v8[9];
    *(float *)&v19 = v10 * v8[10];
    v20 = v8[12];
    v21 = v8[13];
    v22 = v8[14];
    *(float *)&v23 = -(float)((float)((float)(*(float *)&v12 * v21) + (float)(*(float *)&v11 * v20))
                            + (float)(*(float *)&v13 * v22));
    m31 = -(float)((float)((float)(m11 * v21) + (float)(m01 * v20)) + (float)(m21 * v22));
    v25 = -(float)((float)((float)(*(float *)&v18 * v21) + (float)(v17 * v20)) + (float)(*(float *)&v19 * v22));
    __asm { FMOV            V16.2S, #1.0 }
    *(float *)&_D16 = v25;
    v31 = v19;
    v33 = LODWORD(v22);
    v32 = v18;
    *(float *)&v33 = v17;
  }
  *((float *)&v11 + 1) = m01;
  *((_QWORD *)&v11 + 1) = v33;
  *((float *)&v12 + 1) = m11;
  *((_QWORD *)&v12 + 1) = v32;
  *((float *)&v13 + 1) = m21;
  *((_QWORD *)&v13 + 1) = v31;
  *((float *)&v23 + 1) = m31;
  *((_QWORD *)&v23 + 1) = _D16;
LABEL_13:
  *(_OWORD *)&v65.m00 = v11;
  *(_OWORD *)&v65.m[4] = v12;
  *(_OWORD *)&v65.m[8] = v13;
  *(_OWORD *)&v65.m[12] = v23;
  v63 = &v65;
  v66 = vld4q_f32(&v63->m00);
  v66.val[0].i32[3] = v66.val[1].i32[0];
  *(float32x4_t *)&retstr->m00 = v66.val[0];
  *(int8x16_t *)&retstr->m[4] = vextq_s8(vextq_s8((int8x16_t)v66.val[1], (int8x16_t)v66.val[1], 0xCuLL), (int8x16_t)v66.val[2], 8uLL);
  LODWORD(retstr->m22) = v66.val[2].i32[2];
  return result;
}

void GLKMatrixStackMultiplyMatrix4(GLKMatrixStackRef stack, GLKMatrix4 *matrix)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  float32x4_t *v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  unsigned int v12;

  v2 = *((_QWORD *)stack + 2);
  v3 = v2;
  if (*(int *)v2 >= 2)
  {
    v4 = *(_DWORD *)v2 - 1;
    v3 = *((_QWORD *)stack + 2);
    do
    {
      v3 = *(_QWORD *)(v3 + 32);
      --v4;
    }
    while (v4);
  }
  v5 = (float32x4_t *)(*(_QWORD *)(v3 + 24) + *(_QWORD *)(v2 + 8) * *(int *)(v2 + 4));
  v6 = v5[1];
  v7 = v5[2];
  v8 = v5[3];
  v9 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*v5, COERCE_FLOAT(*(_OWORD *)&matrix->m[4])), v6, *(float32x2_t *)&matrix->m[4], 1), v7, *(float32x4_t *)&matrix->m[4], 2), v8, *(float32x4_t *)&matrix->m[4], 3);
  v10 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*v5, COERCE_FLOAT(*(_OWORD *)&matrix->m[8])), v6, *(float32x2_t *)&matrix->m[8], 1), v7, *(float32x4_t *)&matrix->m[8], 2), v8, *(float32x4_t *)&matrix->m[8], 3);
  v11 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*v5, COERCE_FLOAT(*(_OWORD *)&matrix->m[12])), v6, *(float32x2_t *)&matrix->m[12], 1), v7, *(float32x4_t *)&matrix->m[12], 2), v8, *(float32x4_t *)&matrix->m[12], 3);
  *v5 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*v5, COERCE_FLOAT(*(_OWORD *)&matrix->m00)), v6, *(float32x2_t *)&matrix->m00, 1), v7, *(float32x4_t *)&matrix->m00, 2), v8, *(float32x4_t *)&matrix->m00, 3);
  v5[1] = v9;
  v5[2] = v10;
  v5[3] = v11;
  if (((LODWORD(matrix->m13) | LODWORD(matrix->m03) | LODWORD(matrix->m23)) & 0x7FFFFFFF) != 0
    || LODWORD(matrix->m33) != 1065353216)
  {
    v12 = 0;
  }
  else
  {
    v12 = 2;
  }
  if (v5[4].i32[0] < v12)
    v12 = v5[4].u32[0];
  v5[4].i32[0] = v12;
  ++v5[4].i32[2];
}

void GLKMatrixStackMultiplyMatrixStack(GLKMatrixStackRef stackLeft, GLKMatrixStackRef stackRight)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  float32x4_t *v11;
  float32x2_t *v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  unsigned __int32 v19;

  v2 = *((_QWORD *)stackLeft + 2);
  v3 = v2;
  if (*(int *)v2 >= 2)
  {
    v4 = *(_DWORD *)v2 - 1;
    v3 = *((_QWORD *)stackLeft + 2);
    do
    {
      v3 = *(_QWORD *)(v3 + 32);
      --v4;
    }
    while (v4);
  }
  v5 = *(_QWORD *)(v3 + 24);
  v6 = *(int *)(v2 + 4);
  v7 = *(_QWORD *)(v2 + 8);
  v8 = *((_QWORD *)stackRight + 2);
  v9 = v8;
  if (*(int *)v8 >= 2)
  {
    v10 = *(_DWORD *)v8 - 1;
    v9 = *((_QWORD *)stackRight + 2);
    do
    {
      v9 = *(_QWORD *)(v9 + 32);
      --v10;
    }
    while (v10);
  }
  v11 = (float32x4_t *)(v5 + v7 * v6);
  v12 = (float32x2_t *)(*(_QWORD *)(v9 + 24) + *(_QWORD *)(v8 + 8) * *(int *)(v8 + 4));
  v13 = v11[1];
  v14 = v11[2];
  v15 = v11[3];
  v16 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*v11, COERCE_FLOAT(*(_OWORD *)v12[2].f32)), v13, v12[2], 1), v14, *(float32x4_t *)v12[2].f32, 2), v15, *(float32x4_t *)v12[2].f32, 3);
  v17 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*v11, COERCE_FLOAT(*(_OWORD *)v12[4].f32)), v13, v12[4], 1), v14, *(float32x4_t *)v12[4].f32, 2), v15, *(float32x4_t *)v12[4].f32, 3);
  v18 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*v11, COERCE_FLOAT(*(_OWORD *)v12[6].f32)), v13, v12[6], 1), v14, *(float32x4_t *)v12[6].f32, 2), v15, *(float32x4_t *)v12[6].f32, 3);
  *v11 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*v11, COERCE_FLOAT(*(_OWORD *)v12->f32)), v13, *v12, 1), v14, *(float32x4_t *)v12->f32, 2), v15, *(float32x4_t *)v12->f32, 3);
  v11[1] = v16;
  v11[2] = v17;
  v11[3] = v18;
  v19 = v12[8].u32[0];
  if (v11[4].i32[0] < v19)
    v19 = v11[4].u32[0];
  v11[4].i32[0] = v19;
  ++v11[4].i32[2];
}

void GLKMatrixStackTranslate(GLKMatrixStackRef stack, float tx, float ty, float tz)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  float32x4_t *v7;
  unsigned int v8;

  v4 = *((_QWORD *)stack + 2);
  v5 = v4;
  if (*(int *)v4 >= 2)
  {
    v6 = *(_DWORD *)v4 - 1;
    v5 = *((_QWORD *)stack + 2);
    do
    {
      v5 = *(_QWORD *)(v5 + 32);
      --v6;
    }
    while (v6);
  }
  v7 = (float32x4_t *)(*(_QWORD *)(v5 + 24) + *(_QWORD *)(v4 + 8) * *(int *)(v4 + 4));
  v7[3] = vaddq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v7[1], ty), *v7, tx), v7[2], tz), v7[3]);
  v8 = v7[4].u32[0];
  if (v8 >= 4)
    v8 = 4;
  v7[4].i32[0] = v8;
  ++v7[4].i32[2];
}

void GLKMatrixStackTranslateWithVector3(GLKMatrixStackRef stack, GLKVector3 translationVector)
{
  float v2;
  float v3;
  float v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  float32x4_t *v8;
  unsigned int v9;

  v5 = *((_QWORD *)stack + 2);
  v6 = v5;
  if (*(int *)v5 >= 2)
  {
    v7 = *(_DWORD *)v5 - 1;
    v6 = *((_QWORD *)stack + 2);
    do
    {
      v6 = *(_QWORD *)(v6 + 32);
      --v7;
    }
    while (v7);
  }
  v8 = (float32x4_t *)(*(_QWORD *)(v6 + 24) + *(_QWORD *)(v5 + 8) * *(int *)(v5 + 4));
  v8[3] = vaddq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v8[1], v3), *v8, v2), v8[2], v4), v8[3]);
  v9 = v8[4].u32[0];
  if (v9 >= 4)
    v9 = 4;
  v8[4].i32[0] = v9;
  ++v8[4].i32[2];
}

void GLKMatrixStackTranslateWithVector4(GLKMatrixStackRef stack, GLKVector4 translationVector)
{
  float v2;
  float v3;
  float v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  float32x4_t *v8;
  unsigned int v9;

  v5 = *((_QWORD *)stack + 2);
  v6 = v5;
  if (*(int *)v5 >= 2)
  {
    v7 = *(_DWORD *)v5 - 1;
    v6 = *((_QWORD *)stack + 2);
    do
    {
      v6 = *(_QWORD *)(v6 + 32);
      --v7;
    }
    while (v7);
  }
  v8 = (float32x4_t *)(*(_QWORD *)(v6 + 24) + *(_QWORD *)(v5 + 8) * *(int *)(v5 + 4));
  v8[3] = vaddq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v8[1], v3), *v8, v2), v8[2], v4), v8[3]);
  v9 = v8[4].u32[0];
  if (v9 >= 4)
    v9 = 4;
  v8[4].i32[0] = v9;
  ++v8[4].i32[2];
}

void GLKMatrixStackScale(GLKMatrixStackRef stack, float sx, float sy, float sz)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  float32x4_t *v7;
  float32x4_t v8;
  float32x4_t v9;
  _BOOL4 v10;
  _BOOL4 v11;
  float v12;
  BOOL v13;
  unsigned int v14;

  v4 = *((_QWORD *)stack + 2);
  v5 = v4;
  if (*(int *)v4 >= 2)
  {
    v6 = *(_DWORD *)v4 - 1;
    v5 = *((_QWORD *)stack + 2);
    do
    {
      v5 = *(_QWORD *)(v5 + 32);
      --v6;
    }
    while (v6);
  }
  v7 = (float32x4_t *)(*(_QWORD *)(v5 + 24) + *(_QWORD *)(v4 + 8) * *(int *)(v4 + 4));
  v8 = vmulq_n_f32(v7[1], sy);
  v9 = vmulq_n_f32(v7[2], sz);
  *v7 = vmulq_n_f32(*v7, sx);
  v7[1] = v8;
  v7[2] = v9;
  v10 = SLODWORD(sx) == SLODWORD(sy);
  v11 = SLODWORD(sy) == SLODWORD(sz);
  v12 = 1.0 / sx;
  v13 = !v10 || !v11;
  if (v10 && v11)
    v14 = 3;
  else
    v14 = 1;
  if (v13)
    v12 = 0.0;
  if (v7[4].i32[0] < v14)
    v14 = v7[4].u32[0];
  v7[4].i32[0] = v14;
  v7[4].f32[1] = (float)(v12 * v12) * v7[4].f32[1];
  ++v7[4].i32[2];
}

void GLKMatrixStackRotate(GLKMatrixStackRef stack, float radians, float x, float y, float z)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  float32x4_t *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  __float2 v13;
  float v14;
  float v15;
  unsigned int v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;

  v5 = *((_QWORD *)stack + 2);
  v6 = v5;
  if (*(int *)v5 >= 2)
  {
    v7 = *(_DWORD *)v5 - 1;
    v6 = *((_QWORD *)stack + 2);
    do
    {
      v6 = *(_QWORD *)(v6 + 32);
      --v7;
    }
    while (v7);
  }
  v8 = (float32x4_t *)(*(_QWORD *)(v6 + 24) + *(_QWORD *)(v5 + 8) * *(int *)(v5 + 4));
  v17 = *v8;
  v18 = v8[1];
  v19 = v8[2];
  v20 = v8[3];
  v9 = 1.0 / sqrtf((float)((float)(y * y) + (float)(x * x)) + (float)(z * z));
  v10 = v9 * x;
  v11 = v9 * y;
  v12 = v9 * z;
  v13 = __sincosf_stret(radians);
  v14 = (float)(1.0 - v13.__cosval) * v10;
  v15 = (float)(1.0 - v13.__cosval) * v11;
  *v8 = vmlaq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v17, v13.__cosval + (float)(v14 * v10)), v18, (float)(v13.__sinval * v12) + (float)(v14 * v11)), v19, -(float)((float)(v13.__sinval * v11) - (float)(v14 * v12))), (float32x4_t)0, v20);
  v8[1] = vmlaq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v17, -(float)((float)(v13.__sinval * v12) - (float)(v14 * v11))), v18, v13.__cosval + (float)(v15 * v11)), v19, (float)(v13.__sinval * v10) + (float)(v15 * v12)), (float32x4_t)0, v20);
  v8[2] = vmlaq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v17, (float)(v13.__sinval * v11) + (float)(v14 * v12)), v18, -(float)((float)(v13.__sinval * v10) - (float)(v15 * v12))), v19, v13.__cosval + (float)((float)((float)(1.0 - v13.__cosval) * v12) * v12)), (float32x4_t)0, v20);
  v8[3] = vaddq_f32(v20, vmlaq_f32(vmlaq_f32(vmulq_f32(v17, (float32x4_t)0), (float32x4_t)0, v18), (float32x4_t)0, v19));
  v16 = v8[4].u32[0];
  if (v16 >= 4)
    v16 = 4;
  v8[4].i32[0] = v16;
  ++v8[4].i32[2];
}

void GLKMatrixStackRotateX(GLKMatrixStackRef stack, float radians)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  float32x4_t *v5;
  float32x2_t v6;
  __float2 v7;
  float32x4_t v8;
  unsigned int v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;

  v2 = *((_QWORD *)stack + 2);
  v3 = v2;
  if (*(int *)v2 >= 2)
  {
    v4 = *(_DWORD *)v2 - 1;
    v3 = *((_QWORD *)stack + 2);
    do
    {
      v3 = *(_QWORD *)(v3 + 32);
      --v4;
    }
    while (v4);
  }
  v5 = (float32x4_t *)(*(_QWORD *)(v3 + 24) + *(_QWORD *)(v2 + 8) * *(int *)(v2 + 4));
  v10 = *v5;
  v11 = v5[1];
  v12 = v5[2];
  v13 = v5[3];
  v7 = __sincosf_stret(radians);
  v6.f32[0] = v7.__sinval;
  v8 = vmulq_f32(v10, (float32x4_t)0);
  *v5 = vmlaq_f32(vmlaq_f32(vmlaq_f32(v10, (float32x4_t)0, v11), (float32x4_t)0, v12), (float32x4_t)0, v13);
  v5[1] = vmlaq_f32(vmlaq_n_f32(vmlaq_n_f32(v8, v11, v7.__cosval), v12, v7.__sinval), (float32x4_t)0, v13);
  v5[2] = vmlaq_f32(vmlaq_n_f32(vmlsq_lane_f32(v8, v11, v6, 0), v12, v7.__cosval), (float32x4_t)0, v13);
  v5[3] = vaddq_f32(v13, vmlaq_f32(vmlaq_f32(v8, (float32x4_t)0, v11), (float32x4_t)0, v12));
  v9 = v5[4].u32[0];
  if (v9 >= 4)
    v9 = 4;
  v5[4].i32[0] = v9;
  ++v5[4].i32[2];
}

void GLKMatrixStackRotateY(GLKMatrixStackRef stack, float radians)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  float32x4_t *v5;
  float32x2_t v6;
  __float2 v7;
  float32x4_t v8;
  unsigned int v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;

  v2 = *((_QWORD *)stack + 2);
  v3 = v2;
  if (*(int *)v2 >= 2)
  {
    v4 = *(_DWORD *)v2 - 1;
    v3 = *((_QWORD *)stack + 2);
    do
    {
      v3 = *(_QWORD *)(v3 + 32);
      --v4;
    }
    while (v4);
  }
  v5 = (float32x4_t *)(*(_QWORD *)(v3 + 24) + *(_QWORD *)(v2 + 8) * *(int *)(v2 + 4));
  v10 = *v5;
  v11 = v5[1];
  v12 = v5[2];
  v13 = v5[3];
  v7 = __sincosf_stret(radians);
  v6.f32[0] = v7.__sinval;
  v8 = vmulq_f32(v10, (float32x4_t)0);
  *v5 = vmlaq_f32(vmlsq_lane_f32(vmlaq_f32(vmulq_n_f32(v10, v7.__cosval), (float32x4_t)0, v11), v12, v6, 0), (float32x4_t)0, v13);
  v5[1] = vmlaq_f32(vmlaq_f32(vaddq_f32(v11, v8), (float32x4_t)0, v12), (float32x4_t)0, v13);
  v5[2] = vmlaq_f32(vmlaq_n_f32(vmlaq_f32(vmulq_n_f32(v10, v7.__sinval), (float32x4_t)0, v11), v12, v7.__cosval), (float32x4_t)0, v13);
  v5[3] = vaddq_f32(v13, vmlaq_f32(vmlaq_f32(v8, (float32x4_t)0, v11), (float32x4_t)0, v12));
  v9 = v5[4].u32[0];
  if (v9 >= 4)
    v9 = 4;
  v5[4].i32[0] = v9;
  ++v5[4].i32[2];
}

void GLKMatrixStackRotateZ(GLKMatrixStackRef stack, float radians)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  float32x4_t *v5;
  __float2 v6;
  float32x4_t v7;
  unsigned int v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;

  v2 = *((_QWORD *)stack + 2);
  v3 = v2;
  if (*(int *)v2 >= 2)
  {
    v4 = *(_DWORD *)v2 - 1;
    v3 = *((_QWORD *)stack + 2);
    do
    {
      v3 = *(_QWORD *)(v3 + 32);
      --v4;
    }
    while (v4);
  }
  v5 = (float32x4_t *)(*(_QWORD *)(v3 + 24) + *(_QWORD *)(v2 + 8) * *(int *)(v2 + 4));
  v9 = *v5;
  v10 = v5[1];
  v11 = v5[2];
  v12 = v5[3];
  v6 = __sincosf_stret(radians);
  v7 = vmlaq_f32(vmulq_f32(v9, (float32x4_t)0), (float32x4_t)0, v10);
  *v5 = vmlaq_f32(vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v9, v6.__cosval), v10, v6.__sinval), (float32x4_t)0, v11), (float32x4_t)0, v12);
  v5[1] = vmlaq_f32(vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v9, -v6.__sinval), v10, v6.__cosval), (float32x4_t)0, v11), (float32x4_t)0, v12);
  v5[2] = vmlaq_f32(vaddq_f32(v11, v7), (float32x4_t)0, v12);
  v5[3] = vaddq_f32(v12, vmlaq_f32(v7, (float32x4_t)0, v11));
  v8 = v5[4].u32[0];
  if (v8 >= 4)
    v8 = 4;
  v5[4].i32[0] = v8;
  ++v5[4].i32[2];
}

void _GLKMatrixDestroy(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    do
    {
      v2 = *(_QWORD *)(v1 + 32);
      free(*(void **)(v1 + 24));
      free((void *)v1);
      v1 = v2;
    }
    while (v2);
  }
}

CFStringRef _GLKMatrixFormatDescription(_QWORD *cf, const __CFDictionary *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  float *v8;
  const __CFAllocator *v9;

  if (!cf)
    return 0;
  v4 = cf[2];
  v5 = v4;
  if (*(int *)v4 >= 2)
  {
    v6 = *(_DWORD *)v4 - 1;
    v5 = cf[2];
    do
    {
      v5 = *(_QWORD *)(v5 + 32);
      --v6;
    }
    while (v6);
  }
  v7 = *(_QWORD *)(v5 + 24);
  if (!v7)
    return 0;
  v8 = (float *)(v7 + *(_QWORD *)(v4 + 8) * *(int *)(v4 + 4));
  v9 = CFGetAllocator(cf);
  return CFStringCreateWithFormat(v9, a2, CFSTR("<GLKMatrixStack %p [%p]>\nstack size: %d\ncurrent matrix:\n%f %f %f %f\n%f %f %f %f\n%f %f %f %f\n%f %f %f %f"), cf, v9, (*(_DWORD *)(cf[2] + 4) + (*(_DWORD *)cf[2] - 1) * *(_DWORD *)(cf[2] + 16) + 1), *v8, v8[1], v8[2], v8[3], v8[4], v8[5], v8[6], v8[7], v8[8], v8[9], v8[10], v8[11], v8[12],
           v8[13],
           v8[14],
           v8[15]);
}

CFStringRef _GLKMatrixDebugDescription(_QWORD *a1)
{
  return _GLKMatrixFormatDescription(a1, 0);
}

uint64_t _GLKMatrix4Classify(uint64_t a1, float *a2)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  BOOL v14;

  if (((*(_DWORD *)(a1 + 28) | *(_DWORD *)(a1 + 12) | *(_DWORD *)(a1 + 44)) & 0x7FFFFFFF) != 0
    || *(_DWORD *)(a1 + 60) != 1065353216)
  {
    return 0;
  }
  v2 = *(float *)a1;
  v3 = *(float *)(a1 + 4);
  v4 = *(float *)(a1 + 8);
  v5 = *(float *)(a1 + 16);
  v6 = *(float *)(a1 + 20);
  v7 = *(float *)(a1 + 24);
  v8 = (float)((float)(v3 * v3) + (float)(v2 * v2)) + (float)(v4 * v4);
  v9 = v8 * 0.0078125;
  if (fabsf((float)((float)(v3 * v6) + (float)(*(float *)a1 * v5)) + (float)(v4 * v7)) > (float)(v8 * 0.0078125))
    return 1;
  v10 = *(float *)(a1 + 32);
  v11 = *(float *)(a1 + 36);
  v12 = *(float *)(a1 + 40);
  v13 = fabsf((float)((float)(v6 * v11) + (float)(v5 * v10)) + (float)(v7 * v12));
  v14 = fabsf((float)((float)(v3 * v11) + (float)(v2 * v10)) + (float)(v4 * v12)) <= v9 && v13 <= v9;
  if (!v14
    || vabds_f32(v8, (float)((float)(v6 * v6) + (float)(v5 * v5)) + (float)(v7 * v7)) > v9
    || vabds_f32(v8, (float)((float)(v11 * v11) + (float)(v10 * v10)) + (float)(v12 * v12)) > v9)
  {
    return 1;
  }
  *a2 = 1.0 / v8;
  if (fabsf(v8 + -1.0) <= v9)
    return 4;
  else
    return 3;
}

uint64_t _GLKTextureErrorWithCodeAndErrorString(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a2, CFSTR("GLKTextureLoaderErrorKey"));
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GLKTextureLoaderErrorDomain"), a1, v3);
}

uint64_t _GLKTextureErrorWithCodeAndUserInfo(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GLKTextureLoaderErrorDomain"), a1, a2);
}

uint64_t _GLKTextureErrorWithCode(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GLKTextureLoaderErrorDomain"), a1, 0);
}

GLKMatrix3 *__cdecl GLKMatrix3Invert(GLKMatrix3 *__return_ptr retstr, GLKMatrix3 *matrix, BOOL *isInvertible)
{
  uint64_t v3;
  int8x16_t v4;
  int32x2_t v5;
  int32x2_t v6;
  float32x4_t v7;
  const float *p_m21;
  float32x2_t v9;
  float32x4_t v10;
  const float *p_m22;
  float32x2_t v12;
  float32x4_t v13;
  uint32x2_t v14;
  int8x16_t v15;
  unsigned int v16;
  int8x16_t v22;
  int8x16_t v23;
  uint32x2_t v24;
  int8x8_t v25;
  int32x2_t v26;
  int32x4_t v27;
  int8x16_t v28;
  float32x4_t v29;
  float32x4_t v30;
  int8x16_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  int8x16_t v36;
  float32x4_t v37;
  int8x8_t v38;
  int32x4_t v39;
  int32x4_t v40;
  int32x4_t v41;
  int32x4_t v42;
  int32x4_t v43;
  int8x16_t v44;
  int8x16_t v45;
  int8x16_t v46;
  float v47;
  int8x8_t v48;
  int8x8_t v49;
  float v50;
  int8x8_t v51;
  float v52;
  int v53;
  __int128 v54;
  _BYTE v55[28];
  uint64_t v56;

  v3 = 0;
  v56 = *MEMORY[0x24BDAC8D0];
  v4 = 0uLL;
  memset(v55, 0, sizeof(v55));
  v54 = 0u;
  v53 = -1;
  *(_DWORD *)v55 = -1;
  *(_DWORD *)&v55[20] = -1;
  v5 = *(int32x2_t *)&matrix->m[3];
  v6 = *(int32x2_t *)&matrix->m[5];
  *(int32x2_t *)v7.f32 = vzip1_s32(*(int32x2_t *)&matrix->m00, v5);
  *(int32x2_t *)v10.f32 = vzip2_s32(*(int32x2_t *)&matrix->m00, v5);
  *(int32x2_t *)v13.f32 = vzip1_s32(*(int32x2_t *)&matrix->m[2], v6);
  *(int32x2_t *)&v7.u32[2] = vdup_lane_s32(v6, 1);
  p_m21 = &matrix->m21;
  v9 = vld1_dup_f32(p_m21);
  *(float32x2_t *)&v10.u32[2] = v9;
  p_m22 = &matrix->m22;
  v12 = vld1_dup_f32(p_m22);
  *(float32x2_t *)&v13.u32[2] = v12;
  v14 = (uint32x2_t)-1;
  v15 = (int8x16_t)xmmword_20DC81610;
  v16 = 50462976;
  __asm { FMOV            V18.4S, #1.0 }
  v22 = 0uLL;
  do
  {
    v23 = vbicq_s8((int8x16_t)v7, v15);
    v24 = (uint32x2_t)vextq_s8(v23, v23, 8uLL).u64[0];
    v25 = (int8x8_t)vcgt_u32(v24, *(uint32x2_t *)v23.i8);
    *(uint32x2_t *)v23.i8 = vmax_u32(*(uint32x2_t *)v23.i8, v24);
    v26 = (int32x2_t)vbsl_s8(v25, (int8x8_t)0xF0E0D0C0B0A0908, (int8x8_t)0x706050403020100);
    v27 = vdupq_lane_s32((int32x2_t)vbsl_s8((int8x8_t)vcgt_u32((uint32x2_t)vrev64_s32(*(int32x2_t *)v23.i8), *(uint32x2_t *)v23.i8), (int8x8_t)vdup_lane_s32(v26, 1), (int8x8_t)v26), 0);
    v14 = vmin_u32(v14, vpmax_u32(*(uint32x2_t *)v23.i8, *(uint32x2_t *)v23.i8));
    v4 = vbslq_s8(*(int8x16_t *)((char *)&v53 + v3), (int8x16_t)v27, v4);
    v28 = (int8x16_t)vceqq_s32(v27, (int32x4_t)xmmword_20DC81420);
    v22 = vbslq_s8(v28, (int8x16_t)vdupq_n_s32(v16), v22);
    v16 += 67372036;
    v29 = vrecpeq_f32(v7);
    v30 = vmulq_f32(v29, vrecpsq_f32(v7, v29));
    v31 = (int8x16_t)vmulq_f32(vrecpsq_f32(v7, v30), v30);
    v32 = (float32x4_t)vbslq_s8(v28, v31, _Q18);
    v33 = vmulq_f32(v10, v32);
    v34 = vmulq_f32(v13, v32);
    v35 = (float32x4_t)vandq_s8(v31, v28);
    *(int8x8_t *)v31.i8 = vqtbl1_s8((int8x16_t)v33, *(int8x8_t *)v27.i8);
    *(int8x8_t *)v36.i8 = vqtbl1_s8((int8x16_t)v34, *(int8x8_t *)v27.i8);
    *(int8x8_t *)v27.i8 = vqtbl1_s8((int8x16_t)v35, *(int8x8_t *)v27.i8);
    v31.i64[1] = v31.i64[0];
    v36.i64[1] = v36.i64[0];
    v27.i64[1] = v27.i64[0];
    v37 = vmulq_f32(vnegq_f32(v7), v32);
    v7 = vmlaq_f32(v33, (float32x4_t)vbicq_s8(v31, v28), v37);
    v10 = vmlaq_f32(v34, (float32x4_t)vbicq_s8(v36, v28), v37);
    v13 = vmlaq_f32(v35, (float32x4_t)vbicq_s8((int8x16_t)v27, v28), v37);
    v15 = vorrq_s8(v15, v28);
    v3 += 16;
  }
  while (v3 != 48);
  if (v14.i32[0])
  {
    v38 = (int8x8_t)vextq_s8(v4, v4, 8uLL).u64[0];
    *(int8x8_t *)v39.i8 = vqtbl1_s8((int8x16_t)v7, *(int8x8_t *)v4.i8);
    v39.u64[1] = (unint64_t)vqtbl1_s8((int8x16_t)v7, v38);
    *(int8x8_t *)v40.i8 = vqtbl1_s8((int8x16_t)v10, *(int8x8_t *)v4.i8);
    v40.u64[1] = (unint64_t)vqtbl1_s8((int8x16_t)v10, v38);
    *(int8x8_t *)v41.i8 = vqtbl1_s8((int8x16_t)v13, *(int8x8_t *)v4.i8);
    v41.u64[1] = (unint64_t)vqtbl1_s8((int8x16_t)v13, v38);
    v42 = vzip1q_s32(v39, v41);
    v43 = vzip1q_s32(v40, v40);
    v44 = (int8x16_t)vzip1q_s32(v42, v43);
    v45 = (int8x16_t)vzip2q_s32(v42, v43);
    v46 = (int8x16_t)vzip1q_s32(vzip2q_s32(v39, v41), vdupq_laneq_s32(v40, 2));
    v39.i64[0] = vextq_s8(v22, v22, 8uLL).u64[0];
    LODWORD(v47) = vqtbl1_s8(v44, *(int8x8_t *)v39.i8).u32[0];
    v48 = vqtbl1_s8(v44, *(int8x8_t *)v22.i8);
    v49 = vqtbl1_s8(v45, *(int8x8_t *)v22.i8);
    LODWORD(v50) = vqtbl1_s8(v45, *(int8x8_t *)v39.i8).u32[0];
    v51 = vqtbl1_s8(v46, *(int8x8_t *)v22.i8);
    LODWORD(v52) = vqtbl1_s8(v46, *(int8x8_t *)v39.i8).u32[0];
    if (isInvertible)
      *isInvertible = 1;
    *(int8x8_t *)&retstr->m00 = v48;
    retstr->m02 = v47;
    *(int8x8_t *)&retstr->m[3] = v49;
    retstr->m12 = v50;
    *(int8x8_t *)&retstr->m[6] = v51;
    retstr->m22 = v52;
  }
  else
  {
    if (isInvertible)
      *isInvertible = 0;
    retstr->m22 = 1.0;
    *(_OWORD *)&retstr->m00 = *(_OWORD *)&GLKMatrix3Identity.m00;
    *(_OWORD *)&retstr->m[4] = *(_OWORD *)&GLKMatrix3Identity.m[4];
  }
  return matrix;
}

GLKMatrix3 *__cdecl GLKMatrix3InvertAndTranspose(GLKMatrix3 *__return_ptr retstr, GLKMatrix3 *matrix, BOOL *isInvertible)
{
  float m01;
  float m02;
  float m10;
  float m11;
  float m12;
  float m20;
  float m21;
  float m22;
  GLKMatrix3 matrixa;

  m01 = matrix->m01;
  m02 = matrix->m02;
  m10 = matrix->m10;
  m11 = matrix->m11;
  m12 = matrix->m12;
  m20 = matrix->m20;
  m21 = matrix->m21;
  m22 = matrix->m22;
  matrixa.m00 = matrix->m00;
  *(_QWORD *)&matrixa.m[1] = __PAIR64__(LODWORD(m20), LODWORD(m10));
  *(_QWORD *)&matrixa.m[3] = __PAIR64__(LODWORD(m11), LODWORD(m01));
  *(_QWORD *)&matrixa.m[5] = __PAIR64__(LODWORD(m02), LODWORD(m21));
  *(_QWORD *)&matrixa.m[7] = __PAIR64__(LODWORD(m22), LODWORD(m12));
  return GLKMatrix3Invert(retstr, &matrixa, isInvertible);
}

void sub_20DC7B930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_20DC7BABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NSString *__cdecl NSStringFromGLKMatrix2(GLKMatrix2 matrix)
{
  float v1;
  float v2;
  float v3;
  float v4;

  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{{%g, %g}, {%g, %g}}"), v1, v2, v3, v4);
}

NSString *__cdecl NSStringFromGLKMatrix3(GLKMatrix3 *matrix)
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{{%g, %g, %g}, {%g, %g, %g}, {%g, %g, %g}}"), matrix->m00, matrix->m01, matrix->m02, matrix->m10, matrix->m11, matrix->m12, matrix->m20, matrix->m21, matrix->m22);
}

NSString *__cdecl NSStringFromGLKMatrix4(GLKMatrix4 *matrix)
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{{%g, %g, %g, %g}, {%g, %g, %g, %g}, {%g, %g, %g, %g}, {%g, %g, %g, %g}}"), matrix->m00, matrix->m01, matrix->m02, matrix->m03, matrix->m10, matrix->m11, matrix->m12, matrix->m13, matrix->m20, matrix->m21, matrix->m22, matrix->m23, matrix->m30, matrix->m31, matrix->m32, matrix->m33);
}

NSString *__cdecl NSStringFromGLKVector2(GLKVector2 vector)
{
  float v1;
  float v2;

  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%g, %g}"), v1, v2);
}

NSString *__cdecl NSStringFromGLKVector3(GLKVector3 vector)
{
  float v1;
  float v2;
  float v3;

  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%g, %g, %g}"), v1, v2, v3);
}

NSString *__cdecl NSStringFromGLKVector4(GLKVector4 vector)
{
  float v1;
  float v2;
  float v3;
  float v4;

  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%g, %g, %g, %g}"), v1, v2, v3, v4);
}

NSString *__cdecl NSStringFromGLKQuaternion(GLKQuaternion quaternion)
{
  float v1;
  float v2;
  float v3;
  float v4;

  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{{%g, %g, %g}, %g}"), v1, v2, v3, v4);
}

GLKVector3 GLKMathProject(GLKVector3 object, GLKMatrix4 *model, GLKMatrix4 *projection, int *viewport)
{
  return object;
}

GLKVector3 GLKMathUnproject(GLKVector3 window, GLKMatrix4 *model, GLKMatrix4 *projection, int *viewport, BOOL *success)
{
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  GLKMatrix4 *v12;
  float v13;
  GLKMatrix4 v14;
  GLKMatrix4 v15;
  BOOL isInvertible;
  GLKVector3 result;

  isInvertible = 0;
  v6 = *(float32x4_t *)(*(_QWORD *)&window.v[2] + 16);
  v7 = *(float32x4_t *)(*(_QWORD *)&window.v[2] + 32);
  v8 = *(float32x4_t *)(*(_QWORD *)&window.v[2] + 48);
  v9 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(**(float32x4_t **)&window.v[2], COERCE_FLOAT(*(_OWORD *)(*(_QWORD *)&window.x + 16))), v6, *(float32x2_t *)(*(_QWORD *)&window.x + 16), 1), v7, *(float32x4_t *)(*(_QWORD *)&window.x + 16), 2), v8, *(float32x4_t *)(*(_QWORD *)&window.x + 16), 3);
  v10 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(**(float32x4_t **)&window.v[2], COERCE_FLOAT(*(_OWORD *)(*(_QWORD *)&window.x + 32))), v6, *(float32x2_t *)(*(_QWORD *)&window.x + 32), 1), v7, *(float32x4_t *)(*(_QWORD *)&window.x + 32), 2), v8, *(float32x4_t *)(*(_QWORD *)&window.x + 32), 3);
  v11 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(**(float32x4_t **)&window.v[2], COERCE_FLOAT(*(_OWORD *)(*(_QWORD *)&window.x + 48))), v6, *(float32x2_t *)(*(_QWORD *)&window.x + 48), 1), v7, *(float32x4_t *)(*(_QWORD *)&window.x + 48), 2), v8, *(float32x4_t *)(*(_QWORD *)&window.x + 48), 3);
  *(float32x4_t *)&v14.m00 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(**(float32x4_t **)&window.v[2], COERCE_FLOAT(**(_OWORD **)&window.x)), v6, **(float32x2_t **)&window.x, 1), v7, **(float32x4_t **)&window.x, 2), v8, **(float32x4_t **)&window.x, 3);
  *(float32x4_t *)&v14.m[4] = v9;
  *(float32x4_t *)&v14.m[8] = v10;
  *(float32x4_t *)&v14.m[12] = v11;
  v12 = GLKMatrix4Invert(&v15, &v14, &isInvertible);
  if (projection)
    LOBYTE(projection->m00) = isInvertible;
  *(_QWORD *)&result.x = v12;
  result.z = v13;
  return result;
}

uint64_t _GLKModelErrorWithCodeAndErrorString(uint64_t a1, uint64_t a2)
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("GLKModelErrorKey");
  v4[0] = a2;
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GLKModelErrorDomain"), a1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
}

uint64_t _GLKModelErrorWithCodeAndUserInfo(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GLKModelErrorDomain"), a1, a2);
}

uint64_t _GLKModelErrorWithCode(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GLKModelErrorDomain"), a1, 0);
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC10](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x24BDBDFB0](c, *(_QWORD *)&mode);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x24BDBE168](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

uint64_t CGImageBlockGetBytesPerRow()
{
  return MEMORY[0x24BDBE578]();
}

uint64_t CGImageBlockGetData()
{
  return MEMORY[0x24BDBE580]();
}

uint64_t CGImageBlockGetRect()
{
  return MEMORY[0x24BDBE588]();
}

uint64_t CGImageBlockSetGetComponentType()
{
  return MEMORY[0x24BDBE5B0]();
}

uint64_t CGImageBlockSetGetCount()
{
  return MEMORY[0x24BDBE5B8]();
}

uint64_t CGImageBlockSetGetImageBlock()
{
  return MEMORY[0x24BDBE5C0]();
}

uint64_t CGImageBlockSetGetPixelSize()
{
  return MEMORY[0x24BDBE5C8]();
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x24BDBE5D8]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE620](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x24BDBE638](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE668](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x24BDBE690]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

uint64_t CGImageProviderCopyImageBlockSetWithOptions()
{
  return MEMORY[0x24BDBE710]();
}

uint64_t CGImageProviderGetColorSpace()
{
  return MEMORY[0x24BDBE738]();
}

uint64_t CGImageProviderGetSize()
{
  return MEMORY[0x24BDBE758]();
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9148](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
  return result;
}

float acosf(float a1)
{
  float result;

  MEMORY[0x24BDAD110](a1);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x24BDAE0E0]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

void glActiveTexture(GLenum texture)
{
  MEMORY[0x24BDE2820](*(_QWORD *)&texture);
}

void glAttachShader(GLuint program, GLuint shader)
{
  MEMORY[0x24BDE2828](*(_QWORD *)&program, *(_QWORD *)&shader);
}

void glBindAttribLocation(GLuint program, GLuint index, const GLchar *name)
{
  MEMORY[0x24BDE2830](*(_QWORD *)&program, *(_QWORD *)&index, name);
}

void glBindBuffer(GLenum target, GLuint buffer)
{
  MEMORY[0x24BDE2838](*(_QWORD *)&target, *(_QWORD *)&buffer);
}

void glBindFramebuffer(GLenum target, GLuint framebuffer)
{
  MEMORY[0x24BDE2840](*(_QWORD *)&target, *(_QWORD *)&framebuffer);
}

void glBindRenderbuffer(GLenum target, GLuint renderbuffer)
{
  MEMORY[0x24BDE2848](*(_QWORD *)&target, *(_QWORD *)&renderbuffer);
}

void glBindTexture(GLenum target, GLuint texture)
{
  MEMORY[0x24BDE2850](*(_QWORD *)&target, *(_QWORD *)&texture);
}

uint64_t glBindVertexArrayOES()
{
  return MEMORY[0x24BDE2858]();
}

void glBlitFramebuffer(GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter)
{
  MEMORY[0x24BDE2878](*(_QWORD *)&srcX0, *(_QWORD *)&srcY0, *(_QWORD *)&srcX1, *(_QWORD *)&srcY1, *(_QWORD *)&dstX0, *(_QWORD *)&dstY0, *(_QWORD *)&dstX1, *(_QWORD *)&dstY1);
}

void glBufferData(GLenum target, GLsizeiptr size, const GLvoid *data, GLenum usage)
{
  MEMORY[0x24BDE2880](*(_QWORD *)&target, size, data, *(_QWORD *)&usage);
}

void glBufferSubData(GLenum target, GLintptr offset, GLsizeiptr size, const GLvoid *data)
{
  MEMORY[0x24BDE2888](*(_QWORD *)&target, offset, size, data);
}

GLenum glCheckFramebufferStatus(GLenum target)
{
  return MEMORY[0x24BDE2890](*(_QWORD *)&target);
}

void glCompileShader(GLuint shader)
{
  MEMORY[0x24BDE28C0](*(_QWORD *)&shader);
}

void glCompressedTexImage2D(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const GLvoid *data)
{
  MEMORY[0x24BDE28C8](*(_QWORD *)&target, *(_QWORD *)&level, *(_QWORD *)&internalformat, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&border, *(_QWORD *)&imageSize, data);
}

GLuint glCreateProgram(void)
{
  return MEMORY[0x24BDE28D0]();
}

GLuint glCreateShader(GLenum type)
{
  return MEMORY[0x24BDE28D8](*(_QWORD *)&type);
}

void glDeleteBuffers(GLsizei n, const GLuint *buffers)
{
  MEMORY[0x24BDE28E0](*(_QWORD *)&n, buffers);
}

void glDeleteFramebuffers(GLsizei n, const GLuint *framebuffers)
{
  MEMORY[0x24BDE28E8](*(_QWORD *)&n, framebuffers);
}

void glDeleteProgram(GLuint program)
{
  MEMORY[0x24BDE28F0](*(_QWORD *)&program);
}

void glDeleteRenderbuffers(GLsizei n, const GLuint *renderbuffers)
{
  MEMORY[0x24BDE28F8](*(_QWORD *)&n, renderbuffers);
}

void glDeleteShader(GLuint shader)
{
  MEMORY[0x24BDE2900](*(_QWORD *)&shader);
}

void glDeleteTextures(GLsizei n, const GLuint *textures)
{
  MEMORY[0x24BDE2910](*(_QWORD *)&n, textures);
}

uint64_t glDeleteVertexArraysOES()
{
  return MEMORY[0x24BDE2918]();
}

uint64_t glDiscardFramebufferEXT()
{
  return MEMORY[0x24BDE2948]();
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
  MEMORY[0x24BDE2950](*(_QWORD *)&mode, *(_QWORD *)&first, *(_QWORD *)&count);
}

void glEnableVertexAttribArray(GLuint index)
{
  MEMORY[0x24BDE2968](*(_QWORD *)&index);
}

void glFinish(void)
{
  MEMORY[0x24BDE2978]();
}

void glFlush(void)
{
  MEMORY[0x24BDE2980]();
}

void glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)
{
  MEMORY[0x24BDE2988](*(_QWORD *)&target, *(_QWORD *)&attachment, *(_QWORD *)&renderbuffertarget, *(_QWORD *)&renderbuffer);
}

void glGenBuffers(GLsizei n, GLuint *buffers)
{
  MEMORY[0x24BDE2998](*(_QWORD *)&n, buffers);
}

void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
{
  MEMORY[0x24BDE29A0](*(_QWORD *)&n, framebuffers);
}

void glGenRenderbuffers(GLsizei n, GLuint *renderbuffers)
{
  MEMORY[0x24BDE29A8](*(_QWORD *)&n, renderbuffers);
}

void glGenTextures(GLsizei n, GLuint *textures)
{
  MEMORY[0x24BDE29B0](*(_QWORD *)&n, textures);
}

uint64_t glGenVertexArraysOES()
{
  return MEMORY[0x24BDE29B8]();
}

void glGenerateMipmap(GLenum target)
{
  MEMORY[0x24BDE29C0](*(_QWORD *)&target);
}

int glGetAttribLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x24BDE29C8](*(_QWORD *)&program, name);
}

GLenum glGetError(void)
{
  return MEMORY[0x24BDE29D8]();
}

void glGetIntegerv(GLenum pname, GLint *params)
{
  MEMORY[0x24BDE29F0](*(_QWORD *)&pname, params);
}

void glGetProgramInfoLog(GLuint program, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
  MEMORY[0x24BDE29F8](*(_QWORD *)&program, *(_QWORD *)&bufsize, length, infolog);
}

void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
{
  MEMORY[0x24BDE2A00](*(_QWORD *)&program, *(_QWORD *)&pname, params);
}

void glGetRenderbufferParameteriv(GLenum target, GLenum pname, GLint *params)
{
  MEMORY[0x24BDE2A08](*(_QWORD *)&target, *(_QWORD *)&pname, params);
}

void glGetShaderInfoLog(GLuint shader, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
  MEMORY[0x24BDE2A10](*(_QWORD *)&shader, *(_QWORD *)&bufsize, length, infolog);
}

void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
{
  MEMORY[0x24BDE2A18](*(_QWORD *)&shader, *(_QWORD *)&pname, params);
}

const GLubyte *__cdecl glGetString(GLenum name)
{
  return (const GLubyte *)MEMORY[0x24BDE2A20](*(_QWORD *)&name);
}

int glGetUniformLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x24BDE2A30](*(_QWORD *)&program, name);
}

void glLabelObjectEXT(GLenum type, GLuint object, GLsizei length, const GLchar *label)
{
  MEMORY[0x24BDE2A40](*(_QWORD *)&type, *(_QWORD *)&object, *(_QWORD *)&length, label);
}

void glLinkProgram(GLuint program)
{
  MEMORY[0x24BDE2A48](*(_QWORD *)&program);
}

GLvoid *__cdecl glMapBufferRange(GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access)
{
  return (GLvoid *)MEMORY[0x24BDE2A50](*(_QWORD *)&target, offset, length, *(_QWORD *)&access);
}

void glPixelStorei(GLenum pname, GLint param)
{
  MEMORY[0x24BDE2A60](*(_QWORD *)&pname, *(_QWORD *)&param);
}

void glPopGroupMarkerEXT(void)
{
  MEMORY[0x24BDE2A68]();
}

void glPushGroupMarkerEXT(GLsizei length, const char *marker)
{
  MEMORY[0x24BDE2A70](*(_QWORD *)&length, marker);
}

void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels)
{
  MEMORY[0x24BDE2A78](*(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&format, *(_QWORD *)&type, pixels);
}

void glRenderbufferStorage(GLenum target, GLenum internalformat, GLsizei width, GLsizei height)
{
  MEMORY[0x24BDE2A80](*(_QWORD *)&target, *(_QWORD *)&internalformat, *(_QWORD *)&width, *(_QWORD *)&height);
}

uint64_t glRenderbufferStorageMultisampleAPPLE()
{
  return MEMORY[0x24BDE2A88]();
}

uint64_t glResolveMultisampleFramebufferAPPLE()
{
  return MEMORY[0x24BDE2A90]();
}

void glShaderSource(GLuint shader, GLsizei count, const GLchar *const *string, const GLint *length)
{
  MEMORY[0x24BDE2AA0](*(_QWORD *)&shader, *(_QWORD *)&count, string, length);
}

void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
{
  MEMORY[0x24BDE2AC0](*(_QWORD *)&target, *(_QWORD *)&level, *(_QWORD *)&internalformat, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&border, *(_QWORD *)&format, *(_QWORD *)&type);
}

void glTexParameteri(GLenum target, GLenum pname, GLint param)
{
  MEMORY[0x24BDE2AD8](*(_QWORD *)&target, *(_QWORD *)&pname, *(_QWORD *)&param);
}

void glUniform1f(GLint location, GLfloat x)
{
  MEMORY[0x24BDE2AF0](*(_QWORD *)&location, x);
}

void glUniform1i(GLint location, GLint x)
{
  MEMORY[0x24BDE2B00](*(_QWORD *)&location, *(_QWORD *)&x);
}

void glUniform3fv(GLint location, GLsizei count, const GLfloat *v)
{
  MEMORY[0x24BDE2B38](*(_QWORD *)&location, *(_QWORD *)&count, v);
}

void glUniform4fv(GLint location, GLsizei count, const GLfloat *v)
{
  MEMORY[0x24BDE2B58](*(_QWORD *)&location, *(_QWORD *)&count, v);
}

void glUniformMatrix3fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
  MEMORY[0x24BDE2B78](*(_QWORD *)&location, *(_QWORD *)&count, transpose, value);
}

void glUniformMatrix4fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
  MEMORY[0x24BDE2B80](*(_QWORD *)&location, *(_QWORD *)&count, transpose, value);
}

GLBOOLean glUnmapBuffer(GLenum target)
{
  return MEMORY[0x24BDE2B88](*(_QWORD *)&target);
}

void glUseProgram(GLuint program)
{
  MEMORY[0x24BDE2B98](*(_QWORD *)&program);
}

void glValidateProgram(GLuint program)
{
  MEMORY[0x24BDE2BA0](*(_QWORD *)&program);
}

void glVertexAttrib4fv(GLuint indx, const GLfloat *values)
{
  MEMORY[0x24BDE2BB0](*(_QWORD *)&indx, values);
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
  MEMORY[0x24BDE2BB8](*(_QWORD *)&indx, *(_QWORD *)&size, *(_QWORD *)&type, normalized, *(_QWORD *)&stride, ptr);
}

void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
  MEMORY[0x24BDE2BC0](*(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

vImage_Error vImagePremultiplyData_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3968](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImagePremultiplyData_RGBAFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3970](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3AB8](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3AC0](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3AD0](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3AD8](src, dest, *(_QWORD *)&flags);
}

