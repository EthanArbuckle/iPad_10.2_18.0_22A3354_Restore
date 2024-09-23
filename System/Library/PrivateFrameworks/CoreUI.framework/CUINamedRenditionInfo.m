@implementation CUINamedRenditionInfo

- (BOOL)diverseContentPresentForAttribute:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int *v16;

  keyFormat = self->_keyFormat;
  if (a3 == 16 && self->_platform == -1)
  {
    var2 = keyFormat->var2;
    if (!(_DWORD)var2)
      return 0;
    var3 = keyFormat->var3;
    while (1)
    {
      v12 = *var3++;
      if (v12 == 16)
        break;
      if (!--var2)
        return 0;
    }
  }
  if ((a3 - 1) < 0x1C && ((0x8030073u >> (a3 - 1)) & 1) != 0)
    return 0;
  v13 = keyFormat->var2;
  if (!v13)
    return 0;
  v14 = 0;
  v15 = 0;
  v16 = keyFormat->var3;
  while (v16[v15] != a3)
  {
    ++v15;
    v14 += 32;
    if (v13 == (_DWORD)v15)
      return 0;
  }
  if ((int)v15 >= 33)
  {
    _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", *(uint64_t *)&a3, v3, v4, v5, v6, v7, *(uint64_t *)&a3);
    return 0;
  }
  return (v15 & 0x80000000) == 0
      && (CUIBitVectorNumberOfBitsSetInBucket((uint64_t)self->_bitmap, v14) != 1
       || CUIBitVectorIsBitSet((os_unfair_lock_s *)self->_bitmap, v14) != 1);
}

- (int)attributePresent:(int)a3 withValue:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t platform;
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v12;
  unsigned int v14;
  uint64_t v15;
  unsigned int *v16;
  unsigned int v17;

  keyFormat = self->_keyFormat;
  platform = self->_platform;
  if (a3 == 16 && platform == -1)
  {
    var2 = keyFormat->var2;
    if (!(_DWORD)var2)
      return -1;
    var3 = keyFormat->var3;
    while (1)
    {
      v12 = *var3++;
      if (v12 == 16)
        break;
      if (!--var2)
        return -1;
    }
  }
  if (a3 <= 0x1C)
  {
    if (((1 << a3) & 0x100600E6) != 0)
      return -1;
    if (a3 == 13)
    {
      *(_QWORD *)&a4 = a4 != 0;
      goto LABEL_21;
    }
    if (a3 != 16)
      goto LABEL_21;
    if (platform != -1)
    {
      if (!a4)
        goto LABEL_21;
      switch(platform)
      {
        case 0uLL:
          if ((int)a4 <= 1963)
          {
            if (a4 == 1665)
              goto LABEL_84;
            if (a4 != 1864)
              goto LABEL_92;
            goto LABEL_72;
          }
          if (a4 == 1964)
            goto LABEL_124;
          if (a4 != 2234)
            goto LABEL_92;
          goto LABEL_109;
        case 3uLL:
          if (a4 == 3840)
            goto LABEL_167;
          if (a4 == 1088)
            goto LABEL_89;
          if (a4 != 720)
            goto LABEL_92;
          goto LABEL_174;
        case 4uLL:
          if ((int)a4 > 429)
          {
            if ((int)a4 > 483)
            {
              if (a4 != 484)
              {
                if (a4 != 496)
                {
                  if (a4 != 502)
                    goto LABEL_92;
                  goto LABEL_70;
                }
                goto LABEL_137;
              }
LABEL_118:
              *(_QWORD *)&a4 = 24;
              goto LABEL_21;
            }
            if (a4 != 430)
            {
              if (a4 != 446)
                goto LABEL_92;
              goto LABEL_141;
            }
            goto LABEL_142;
          }
          if ((int)a4 <= 383)
          {
            if (a4 != 320)
            {
              if (a4 != 340)
                goto LABEL_92;
              goto LABEL_162;
            }
LABEL_138:
            *(_QWORD *)&a4 = 8;
            goto LABEL_21;
          }
          if (a4 == 384)
            goto LABEL_146;
          if (a4 != 390)
LABEL_92:
            -[CUINamedRenditionInfo attributePresent:withValue:].cold.2(a4, platform);
          goto LABEL_175;
        case 5uLL:
          if (a4 == 3648)
            goto LABEL_72;
          goto LABEL_92;
        default:
          if (platform > 2)
            goto LABEL_92;
          if ((int)a4 <= 2435)
          {
            if ((int)a4 <= 2223)
            {
              if ((int)a4 <= 569)
              {
                if (a4 != 163)
                {
                  if (a4 != 568)
                  {
                    if (a4 != 569)
                      goto LABEL_92;
                    goto LABEL_148;
                  }
LABEL_72:
                  *(_QWORD *)&a4 = 1;
                  goto LABEL_21;
                }
LABEL_89:
                *(_QWORD *)&a4 = 5;
                goto LABEL_21;
              }
              if (a4 != 570)
              {
                if (a4 != 1792)
                {
                  if (a4 != 2160)
                    goto LABEL_92;
                  goto LABEL_155;
                }
LABEL_157:
                *(_QWORD *)&a4 = 16;
                goto LABEL_21;
              }
LABEL_156:
              *(_QWORD *)&a4 = 3;
              goto LABEL_21;
            }
            if ((int)a4 <= 2359)
            {
              if (a4 != 2224)
              {
                if (a4 != 2266)
                {
                  if (a4 != 2340)
                    goto LABEL_92;
                  goto LABEL_132;
                }
LABEL_150:
                *(_QWORD *)&a4 = 25;
                goto LABEL_21;
              }
LABEL_149:
              *(_QWORD *)&a4 = 10;
              goto LABEL_21;
            }
            if (a4 != 2360)
            {
              if (a4 != 2388)
              {
                if (a4 != 2420)
                  goto LABEL_92;
                goto LABEL_167;
              }
              goto LABEL_169;
            }
LABEL_168:
            *(_QWORD *)&a4 = 20;
            goto LABEL_21;
          }
          if ((int)a4 <= 2751)
          {
            if ((int)a4 <= 2621)
            {
              if (a4 != 2436)
              {
                if (a4 != 2532)
                {
                  if (a4 != 2556)
                    goto LABEL_92;
LABEL_141:
                  *(_QWORD *)&a4 = 29;
                  goto LABEL_21;
                }
LABEL_147:
                *(_QWORD *)&a4 = 22;
                goto LABEL_21;
              }
LABEL_121:
              *(_QWORD *)&a4 = 11;
              goto LABEL_21;
            }
            if (a4 != 2622)
            {
              if (a4 != 2688)
              {
                if (a4 != 2732)
                  goto LABEL_92;
                goto LABEL_161;
              }
LABEL_163:
              *(_QWORD *)&a4 = 12;
              goto LABEL_21;
            }
LABEL_162:
            *(_QWORD *)&a4 = 13;
            goto LABEL_21;
          }
          if ((int)a4 <= 2867)
          {
            if (a4 == 2752)
              goto LABEL_138;
            if (a4 != 2778)
            {
              if (a4 != 2796)
                goto LABEL_92;
              goto LABEL_137;
            }
LABEL_151:
            *(_QWORD *)&a4 = 19;
            goto LABEL_21;
          }
          if (a4 == 2868)
            goto LABEL_175;
          if (a4 == 3024)
            goto LABEL_174;
          if (a4 != 32401)
            goto LABEL_92;
          break;
      }
      goto LABEL_173;
    }
    if ((int)a4 > 2159)
    {
      if ((int)a4 > 2531)
      {
        if ((int)a4 > 2777)
        {
          if ((int)a4 > 3839)
          {
            if (a4 == 3840)
            {
LABEL_167:
              *(_QWORD *)&a4 = 7;
              goto LABEL_21;
            }
            if (a4 == 32401)
            {
LABEL_173:
              *(_QWORD *)&a4 = 17;
              goto LABEL_21;
            }
          }
          else
          {
            if (a4 == 2778)
              goto LABEL_151;
            if (a4 == 2796)
            {
LABEL_137:
              *(_QWORD *)&a4 = 30;
              goto LABEL_21;
            }
          }
        }
        else if ((int)a4 > 2687)
        {
          if (a4 == 2688)
            goto LABEL_163;
          if (a4 == 2732)
          {
LABEL_161:
            *(_QWORD *)&a4 = 4;
            goto LABEL_21;
          }
        }
        else
        {
          if (a4 == 2532)
            goto LABEL_147;
          if (a4 == 2556)
            goto LABEL_141;
        }
      }
      else if ((int)a4 > 2339)
      {
        if ((int)a4 > 2387)
        {
          if (a4 == 2388)
          {
LABEL_169:
            *(_QWORD *)&a4 = 15;
            goto LABEL_21;
          }
          if (a4 == 2436)
            goto LABEL_121;
        }
        else
        {
          if (a4 == 2340)
          {
LABEL_132:
            *(_QWORD *)&a4 = 18;
            goto LABEL_21;
          }
          if (a4 == 2360)
            goto LABEL_168;
        }
      }
      else if ((int)a4 > 2233)
      {
        if (a4 == 2234)
        {
LABEL_109:
          *(_QWORD *)&a4 = 27;
          goto LABEL_21;
        }
        if (a4 == 2266)
          goto LABEL_150;
      }
      else
      {
        if (a4 == 2160)
        {
LABEL_155:
          *(_QWORD *)&a4 = 21;
          goto LABEL_21;
        }
        if (a4 == 2224)
          goto LABEL_149;
      }
      goto LABEL_127;
    }
    if ((int)a4 > 501)
    {
      if ((int)a4 <= 719)
      {
        if ((int)a4 > 568)
        {
          if (a4 == 569)
          {
LABEL_148:
            *(_QWORD *)&a4 = 2;
            goto LABEL_21;
          }
          if (a4 == 570)
            goto LABEL_156;
        }
        else
        {
          if (a4 == 502)
          {
LABEL_70:
            *(_QWORD *)&a4 = 28;
            goto LABEL_21;
          }
          if (a4 == 568)
            goto LABEL_72;
        }
        goto LABEL_127;
      }
      if ((int)a4 > 1791)
      {
        if (a4 == 1792)
          goto LABEL_157;
        if (a4 == 1964)
        {
LABEL_124:
          *(_QWORD *)&a4 = 26;
          goto LABEL_21;
        }
        goto LABEL_127;
      }
      if (a4 != 720)
      {
        if (a4 == 1665)
        {
LABEL_84:
          *(_QWORD *)&a4 = 31;
          goto LABEL_21;
        }
        goto LABEL_127;
      }
LABEL_174:
      *(_QWORD *)&a4 = 6;
    }
    else
    {
      if ((int)a4 <= 383)
      {
        if ((int)a4 > 319)
        {
          if (a4 == 320)
            goto LABEL_138;
          if (a4 == 340)
            goto LABEL_162;
        }
        else
        {
          if (!a4)
            goto LABEL_21;
          if (a4 == 163)
            goto LABEL_89;
        }
        goto LABEL_127;
      }
      if ((int)a4 > 429)
      {
        if (a4 == 430)
        {
LABEL_142:
          *(_QWORD *)&a4 = 23;
          goto LABEL_21;
        }
        if (a4 == 484)
          goto LABEL_118;
        goto LABEL_127;
      }
      if (a4 == 384)
      {
LABEL_146:
        *(_QWORD *)&a4 = 9;
        goto LABEL_21;
      }
      if (a4 != 390)
LABEL_127:
        -[CUINamedRenditionInfo attributePresent:withValue:].cold.1(a4, -1, *(uint64_t *)&a3, a4, v4, v5, v6, v7);
LABEL_175:
      *(_QWORD *)&a4 = 14;
    }
  }
LABEL_21:
  v14 = keyFormat->var2;
  if (!v14)
    return -1;
  v15 = 0;
  v16 = keyFormat->var3;
  v17 = a4;
  while (v16[v15] != a3)
  {
    ++v15;
    v17 += 32;
    if (v14 == (_DWORD)v15)
      return -1;
  }
  if ((int)v15 >= 33)
  {
    _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", *(uint64_t *)&a3, a4, v4, v5, v6, v7, *(uint64_t *)&a3);
    return -1;
  }
  if ((v17 & 0x80000000) != 0)
    return -1;
  return CUIBitVectorIsBitSet((os_unfair_lock_s *)self->_bitmap, v17);
}

- (CUINamedRenditionInfo)initWithData:(id)a3 keyFormat:(const _renditionkeyfmt *)a4 andPlatform:(int64_t)a5
{
  CUINamedRenditionInfo *v8;
  _DWORD *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CUINamedRenditionInfo;
  v8 = -[CUINamedRenditionInfo init](&v11, sel_init);
  v8->_keyFormat = a4;
  v8->_platform = a5;
  v9 = objc_msgSend(a3, "bytes");
  if (*v9 == 1)
  {
    v8->_bitmap = CUIBitVectorFromData(v9 + 3, v9[2]);
  }
  else
  {

    return 0;
  }
  return v8;
}

- (void)decrementValue:(int64_t *)a3 forAttribute:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v11;
  unint64_t platform;
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v16;
  unsigned int v17;
  int64_t v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int *v22;
  int64_t v23;
  unint64_t v24;
  const _renditionkeyfmt *v25;
  uint64_t v26;
  unsigned int *v27;
  int v28;
  unsigned __int16 v29;
  unsigned int v30;
  uint64_t v31;
  unsigned int *v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  unsigned int v36;

  v8 = *(_QWORD *)&a4;
  v11 = *a3;
  keyFormat = self->_keyFormat;
  platform = self->_platform;
  if (a4 == 16 && platform == -1)
  {
    var2 = keyFormat->var2;
    if (!(_DWORD)var2)
      return;
    var3 = keyFormat->var3;
    while (1)
    {
      v16 = *var3++;
      if (v16 == 16)
        break;
      if (!--var2)
        return;
    }
  }
  if (a4 > 0x1C)
    goto LABEL_20;
  if (((1 << a4) & 0x100600E6) != 0)
    return;
  if (a4 == 13)
  {
    LOWORD(v18) = (unsigned __int16)*a3 != 0;
    goto LABEL_22;
  }
  if (a4 == 16)
  {
    if (platform == -1)
    {
      v33 = (unsigned __int16)*a3;
      if (v33 > 0x86F)
      {
        if ((unsigned __int16)*a3 > 0x9E3u)
        {
          if ((unsigned __int16)*a3 > 0xAD9u)
          {
            if ((unsigned __int16)*a3 > 0xEFFu)
            {
              if (v33 == 3840)
              {
LABEL_347:
                LOWORD(v18) = 7;
                goto LABEL_22;
              }
              if (v33 == 32401)
                goto LABEL_353;
            }
            else
            {
              if (v33 == 2778)
                goto LABEL_331;
              if (v33 == 2796)
                goto LABEL_317;
            }
          }
          else if ((unsigned __int16)*a3 > 0xA7Fu)
          {
            if (v33 == 2688)
              goto LABEL_343;
            if (v33 == 2732)
            {
LABEL_341:
              LOWORD(v18) = 4;
              goto LABEL_22;
            }
          }
          else
          {
            if (v33 == 2532)
              goto LABEL_327;
            if (v33 == 2556)
              goto LABEL_321;
          }
        }
        else if ((unsigned __int16)*a3 > 0x923u)
        {
          if ((unsigned __int16)*a3 > 0x953u)
          {
            if (v33 == 2388)
              goto LABEL_349;
            if (v33 == 2436)
              goto LABEL_301;
          }
          else
          {
            if (v33 == 2340)
            {
LABEL_312:
              LOWORD(v18) = 18;
              goto LABEL_22;
            }
            if (v33 == 2360)
              goto LABEL_348;
          }
        }
        else if ((unsigned __int16)*a3 > 0x8B9u)
        {
          if (v33 == 2234)
          {
LABEL_289:
            LOWORD(v18) = 27;
            goto LABEL_22;
          }
          if (v33 == 2266)
            goto LABEL_330;
        }
        else
        {
          if (v33 == 2160)
          {
LABEL_335:
            LOWORD(v18) = 21;
            goto LABEL_22;
          }
          if (v33 == 2224)
            goto LABEL_329;
        }
      }
      else if ((unsigned __int16)*a3 > 0x1F5u)
      {
        if ((unsigned __int16)*a3 > 0x2CFu)
        {
          if ((unsigned __int16)*a3 > 0x6FFu)
          {
            if (v33 == 1792)
              goto LABEL_337;
            if (v33 == 1964)
            {
LABEL_304:
              LOWORD(v18) = 26;
              goto LABEL_22;
            }
          }
          else
          {
            if (v33 == 720)
            {
LABEL_354:
              LOWORD(v18) = 6;
              goto LABEL_22;
            }
            if (v33 == 1665)
            {
LABEL_264:
              LOWORD(v18) = 31;
              goto LABEL_22;
            }
          }
        }
        else if ((unsigned __int16)*a3 > 0x238u)
        {
          if (v33 == 569)
            goto LABEL_328;
          if (v33 == 570)
            goto LABEL_336;
        }
        else
        {
          if (v33 == 502)
          {
LABEL_238:
            LOWORD(v18) = 28;
            goto LABEL_22;
          }
          if (v33 == 568)
            goto LABEL_244;
        }
      }
      else if ((unsigned __int16)*a3 > 0x17Fu)
      {
        if ((unsigned __int16)*a3 > 0x1ADu)
        {
          if (v33 == 430)
            goto LABEL_322;
          if (v33 == 484)
            goto LABEL_298;
        }
        else
        {
          if (v33 == 384)
          {
LABEL_326:
            LOWORD(v18) = 9;
            goto LABEL_22;
          }
          if (v33 == 390)
          {
LABEL_355:
            LOWORD(v18) = 14;
            goto LABEL_22;
          }
        }
      }
      else if ((unsigned __int16)*a3 > 0x13Fu)
      {
        if (v33 == 320)
          goto LABEL_318;
        if (v33 == 340)
          goto LABEL_342;
      }
      else
      {
        v18 = *a3;
        if (!(unsigned __int16)*a3)
          goto LABEL_22;
        if (v33 == 163)
          goto LABEL_269;
      }
      -[CUINamedRenditionInfo decrementValue:forAttribute:].cold.1(v11, -1, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
    }
    if ((unsigned __int16)*a3)
    {
      switch(platform)
      {
        case 0uLL:
          v17 = (unsigned __int16)*a3;
          if (v17 <= 0x7AB)
          {
            if (v17 == 1665)
              goto LABEL_264;
            if (v17 != 1864)
              goto LABEL_272;
            goto LABEL_244;
          }
          if (v17 == 1964)
            goto LABEL_304;
          if (v17 != 2234)
            goto LABEL_272;
          goto LABEL_289;
        case 3uLL:
          v35 = (unsigned __int16)*a3;
          if (v35 == 3840)
            goto LABEL_347;
          if (v35 == 1088)
            goto LABEL_269;
          if (v35 != 720)
            goto LABEL_272;
          goto LABEL_354;
        case 4uLL:
          v34 = (unsigned __int16)*a3;
          if (v34 > 0x1AD)
          {
            if ((unsigned __int16)*a3 > 0x1E3u)
            {
              if (v34 != 484)
              {
                if (v34 != 496)
                {
                  if (v34 != 502)
                    goto LABEL_272;
                  goto LABEL_238;
                }
LABEL_317:
                LOWORD(v18) = 30;
                goto LABEL_22;
              }
LABEL_298:
              LOWORD(v18) = 24;
              goto LABEL_22;
            }
            if (v34 != 430)
            {
              if (v34 != 446)
                goto LABEL_272;
              goto LABEL_321;
            }
LABEL_322:
            LOWORD(v18) = 23;
            goto LABEL_22;
          }
          if ((unsigned __int16)*a3 <= 0x17Fu)
          {
            if (v34 != 320)
            {
              if (v34 != 340)
                goto LABEL_272;
LABEL_342:
              LOWORD(v18) = 13;
              goto LABEL_22;
            }
LABEL_318:
            LOWORD(v18) = 8;
            goto LABEL_22;
          }
          if (v34 == 384)
            goto LABEL_326;
          if (v34 != 390)
LABEL_272:
            -[CUINamedRenditionInfo decrementValue:forAttribute:].cold.2(v11, platform);
          goto LABEL_355;
        case 5uLL:
          if ((unsigned __int16)*a3 == 3648)
            goto LABEL_244;
          goto LABEL_272;
        default:
          if (platform > 2)
            goto LABEL_272;
          v36 = (unsigned __int16)*a3;
          if (v36 <= 0x983)
          {
            if ((unsigned __int16)*a3 <= 0x8AFu)
            {
              if ((unsigned __int16)*a3 <= 0x239u)
              {
                if (v36 != 163)
                {
                  if (v36 != 568)
                  {
                    if (v36 != 569)
                      goto LABEL_272;
LABEL_328:
                    LOWORD(v18) = 2;
                    goto LABEL_22;
                  }
LABEL_244:
                  LOWORD(v18) = 1;
                  goto LABEL_22;
                }
LABEL_269:
                LOWORD(v18) = 5;
                goto LABEL_22;
              }
              if (v36 != 570)
              {
                if (v36 != 1792)
                {
                  if (v36 != 2160)
                    goto LABEL_272;
                  goto LABEL_335;
                }
LABEL_337:
                LOWORD(v18) = 16;
                goto LABEL_22;
              }
LABEL_336:
              LOWORD(v18) = 3;
              goto LABEL_22;
            }
            if ((unsigned __int16)*a3 <= 0x937u)
            {
              if (v36 != 2224)
              {
                if (v36 != 2266)
                {
                  if (v36 != 2340)
                    goto LABEL_272;
                  goto LABEL_312;
                }
LABEL_330:
                LOWORD(v18) = 25;
                goto LABEL_22;
              }
LABEL_329:
              LOWORD(v18) = 10;
              goto LABEL_22;
            }
            if (v36 != 2360)
            {
              if (v36 != 2388)
              {
                if (v36 != 2420)
                  goto LABEL_272;
                goto LABEL_347;
              }
LABEL_349:
              LOWORD(v18) = 15;
              goto LABEL_22;
            }
LABEL_348:
            LOWORD(v18) = 20;
            goto LABEL_22;
          }
          if ((unsigned __int16)*a3 <= 0xABFu)
          {
            if ((unsigned __int16)*a3 <= 0xA3Du)
            {
              if (v36 != 2436)
              {
                if (v36 != 2532)
                {
                  if (v36 != 2556)
                    goto LABEL_272;
LABEL_321:
                  LOWORD(v18) = 29;
                  goto LABEL_22;
                }
LABEL_327:
                LOWORD(v18) = 22;
                goto LABEL_22;
              }
LABEL_301:
              LOWORD(v18) = 11;
              goto LABEL_22;
            }
            if (v36 == 2622)
              goto LABEL_342;
            if (v36 != 2688)
            {
              if (v36 != 2732)
                goto LABEL_272;
              goto LABEL_341;
            }
LABEL_343:
            LOWORD(v18) = 12;
            goto LABEL_22;
          }
          if ((unsigned __int16)*a3 <= 0xB33u)
          {
            if (v36 == 2752)
              goto LABEL_318;
            if (v36 != 2778)
            {
              if (v36 != 2796)
                goto LABEL_272;
              goto LABEL_317;
            }
LABEL_331:
            LOWORD(v18) = 19;
            goto LABEL_22;
          }
          if (v36 == 2868)
            goto LABEL_355;
          if (v36 == 3024)
            goto LABEL_354;
          if (v36 != 32401)
            goto LABEL_272;
          break;
      }
LABEL_353:
      LOWORD(v18) = 17;
      goto LABEL_22;
    }
    LOWORD(v18) = 0;
  }
  else
  {
LABEL_20:
    v18 = *a3;
  }
LABEL_22:
  v19 = keyFormat->var2;
  if (v19)
  {
    v20 = 0;
    v21 = (unsigned __int16)v18;
    v22 = keyFormat->var3;
    while (v22[v20] != a4)
    {
      ++v20;
      v21 += 32;
      if (v19 == (_DWORD)v20)
        return;
    }
    if ((int)v20 > 32)
    {
LABEL_28:
      _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7, v8);
      return;
    }
    if ((v21 & 0x80000000) == 0 && v11)
    {
      do
      {
        if (CUIBitVectorIsBitSet((os_unfair_lock_s *)self->_bitmap, v21))
          return;
        v23 = *a3 - 1;
        *a3 = v23;
        v25 = self->_keyFormat;
        v24 = self->_platform;
        if ((_DWORD)v8 == 16 && v24 == -1)
        {
          v26 = v25->var2;
          if (!(_DWORD)v26)
            return;
          v27 = v25->var3;
          while (1)
          {
            v28 = *v27++;
            if (v28 == 16)
              break;
            if (!--v26)
              return;
          }
        }
        if (v8 > 0x1C)
        {
          v29 = v23;
          goto LABEL_200;
        }
        if ((_DWORD)v8 == 13)
        {
          v29 = (unsigned __int16)v23 != 0;
          goto LABEL_200;
        }
        if ((_DWORD)v8 == 16)
        {
          if (v24 != -1)
          {
            if (!(_WORD)v23)
            {
              v29 = 0;
              goto LABEL_200;
            }
            switch(v24)
            {
              case 0uLL:
                if ((unsigned __int16)v23 <= 0x7ABu)
                {
                  if ((unsigned __int16)v23 == 1665)
                    goto LABEL_108;
                  if ((unsigned __int16)v23 != 1864)
                    goto LABEL_356;
                  goto LABEL_96;
                }
                if ((unsigned __int16)v23 == 1964)
                  goto LABEL_148;
                if ((unsigned __int16)v23 != 2234)
                  goto LABEL_356;
                goto LABEL_133;
              case 3uLL:
                if ((unsigned __int16)v23 == 3840)
                  goto LABEL_191;
                if ((unsigned __int16)v23 == 1088)
                  goto LABEL_113;
                if ((unsigned __int16)v23 != 720)
                  goto LABEL_356;
                break;
              case 4uLL:
                if ((unsigned __int16)v23 <= 0x1ADu)
                {
                  if ((unsigned __int16)v23 <= 0x17Fu)
                  {
                    if ((unsigned __int16)v23 == 320)
                      goto LABEL_162;
                    if ((unsigned __int16)v23 != 340)
                      goto LABEL_356;
                    goto LABEL_186;
                  }
                  if ((unsigned __int16)v23 == 384)
                    goto LABEL_170;
                  if ((unsigned __int16)v23 != 390)
                    goto LABEL_356;
                  goto LABEL_199;
                }
                if ((unsigned __int16)v23 <= 0x1E3u)
                {
                  if ((unsigned __int16)v23 == 430)
                    goto LABEL_166;
                  if ((unsigned __int16)v23 != 446)
                    goto LABEL_356;
                  goto LABEL_165;
                }
                if ((unsigned __int16)v23 == 484)
                  goto LABEL_142;
                if ((unsigned __int16)v23 != 496)
                {
                  if ((unsigned __int16)v23 != 502)
                    goto LABEL_356;
                  goto LABEL_94;
                }
                goto LABEL_161;
              case 5uLL:
                if ((unsigned __int16)v23 == 3648)
                  goto LABEL_96;
                goto LABEL_356;
              default:
                if (v24 > 2)
                  goto LABEL_356;
                if ((unsigned __int16)v23 <= 0x983u)
                {
                  if ((unsigned __int16)v23 <= 0x8AFu)
                  {
                    if ((unsigned __int16)v23 <= 0x239u)
                    {
                      if ((unsigned __int16)v23 == 163)
                        goto LABEL_113;
                      if ((unsigned __int16)v23 != 568)
                      {
                        if ((unsigned __int16)v23 != 569)
                          goto LABEL_356;
                        goto LABEL_172;
                      }
                      goto LABEL_96;
                    }
                    if ((unsigned __int16)v23 == 570)
                      goto LABEL_180;
                    if ((unsigned __int16)v23 != 1792)
                    {
                      if ((unsigned __int16)v23 != 2160)
                        goto LABEL_356;
                      goto LABEL_179;
                    }
                    goto LABEL_181;
                  }
                  if ((unsigned __int16)v23 <= 0x937u)
                  {
                    if ((unsigned __int16)v23 == 2224)
                      goto LABEL_173;
                    if ((unsigned __int16)v23 != 2266)
                    {
                      if ((unsigned __int16)v23 != 2340)
                        goto LABEL_356;
                      goto LABEL_156;
                    }
                    goto LABEL_174;
                  }
                  if ((unsigned __int16)v23 == 2360)
                    goto LABEL_192;
                  if ((unsigned __int16)v23 != 2388)
                  {
                    if ((unsigned __int16)v23 != 2420)
                      goto LABEL_356;
                    goto LABEL_191;
                  }
                  goto LABEL_193;
                }
                if ((unsigned __int16)v23 <= 0xABFu)
                {
                  if ((unsigned __int16)v23 <= 0xA3Du)
                  {
                    if ((unsigned __int16)v23 == 2436)
                      goto LABEL_145;
                    if ((unsigned __int16)v23 != 2532)
                    {
                      if ((unsigned __int16)v23 != 2556)
                        goto LABEL_356;
                      goto LABEL_165;
                    }
                    goto LABEL_171;
                  }
                  if ((unsigned __int16)v23 == 2622)
                    goto LABEL_186;
                  if ((unsigned __int16)v23 != 2688)
                  {
                    if ((unsigned __int16)v23 != 2732)
                      goto LABEL_356;
                    goto LABEL_185;
                  }
                  goto LABEL_187;
                }
                if ((unsigned __int16)v23 <= 0xB33u)
                {
                  if ((unsigned __int16)v23 == 2752)
                    goto LABEL_162;
                  if ((unsigned __int16)v23 != 2778)
                  {
                    if ((unsigned __int16)v23 != 2796)
                      goto LABEL_356;
                    goto LABEL_161;
                  }
                  goto LABEL_175;
                }
                if ((unsigned __int16)v23 == 2868)
                  goto LABEL_199;
                if ((unsigned __int16)v23 != 3024)
                {
                  if ((unsigned __int16)v23 != 32401)
LABEL_356:
                    -[CUINamedRenditionInfo decrementValue:forAttribute:].cold.2(v23, v24);
                  goto LABEL_197;
                }
                return;
            }
LABEL_198:
            v29 = 6;
            goto LABEL_200;
          }
          if ((unsigned __int16)v23 > 0x86Fu)
          {
            if ((unsigned __int16)v23 > 0x9E3u)
            {
              if ((unsigned __int16)v23 > 0xAD9u)
              {
                if ((unsigned __int16)v23 > 0xEFFu)
                {
                  if ((unsigned __int16)v23 == 3840)
                  {
LABEL_191:
                    v29 = 7;
                  }
                  else
                  {
                    if ((unsigned __int16)v23 != 32401)
LABEL_357:
                      -[CUINamedRenditionInfo decrementValue:forAttribute:].cold.1(v23, -1, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
LABEL_197:
                    v29 = 17;
                  }
                }
                else if ((unsigned __int16)v23 == 2778)
                {
LABEL_175:
                  v29 = 19;
                }
                else
                {
                  if ((unsigned __int16)v23 != 2796)
                    goto LABEL_357;
LABEL_161:
                  v29 = 30;
                }
              }
              else if ((unsigned __int16)v23 > 0xA7Fu)
              {
                if ((unsigned __int16)v23 == 2688)
                {
LABEL_187:
                  v29 = 12;
                }
                else
                {
                  if ((unsigned __int16)v23 != 2732)
                    goto LABEL_357;
LABEL_185:
                  v29 = 4;
                }
              }
              else if ((unsigned __int16)v23 == 2532)
              {
LABEL_171:
                v29 = 22;
              }
              else
              {
                if ((unsigned __int16)v23 != 2556)
                  goto LABEL_357;
LABEL_165:
                v29 = 29;
              }
            }
            else if ((unsigned __int16)v23 > 0x923u)
            {
              if ((unsigned __int16)v23 > 0x953u)
              {
                if ((unsigned __int16)v23 == 2388)
                {
LABEL_193:
                  v29 = 15;
                }
                else
                {
                  if ((unsigned __int16)v23 != 2436)
                    goto LABEL_357;
LABEL_145:
                  v29 = 11;
                }
              }
              else if ((unsigned __int16)v23 == 2340)
              {
LABEL_156:
                v29 = 18;
              }
              else
              {
                if ((unsigned __int16)v23 != 2360)
                  goto LABEL_357;
LABEL_192:
                v29 = 20;
              }
            }
            else if ((unsigned __int16)v23 > 0x8B9u)
            {
              if ((unsigned __int16)v23 == 2234)
              {
LABEL_133:
                v29 = 27;
              }
              else
              {
                if ((unsigned __int16)v23 != 2266)
                  goto LABEL_357;
LABEL_174:
                v29 = 25;
              }
            }
            else if ((unsigned __int16)v23 == 2160)
            {
LABEL_179:
              v29 = 21;
            }
            else
            {
              if ((unsigned __int16)v23 != 2224)
                goto LABEL_357;
LABEL_173:
              v29 = 10;
            }
          }
          else if ((unsigned __int16)v23 > 0x1F5u)
          {
            if ((unsigned __int16)v23 > 0x2CFu)
            {
              if ((unsigned __int16)v23 > 0x6FFu)
              {
                if ((unsigned __int16)v23 == 1792)
                {
LABEL_181:
                  v29 = 16;
                }
                else
                {
                  if ((unsigned __int16)v23 != 1964)
                    goto LABEL_357;
LABEL_148:
                  v29 = 26;
                }
              }
              else
              {
                if ((unsigned __int16)v23 == 720)
                  goto LABEL_198;
                if ((unsigned __int16)v23 != 1665)
                  goto LABEL_357;
LABEL_108:
                v29 = 31;
              }
            }
            else if ((unsigned __int16)v23 > 0x238u)
            {
              if ((unsigned __int16)v23 == 569)
              {
LABEL_172:
                v29 = 2;
              }
              else
              {
                if ((unsigned __int16)v23 != 570)
                  goto LABEL_357;
LABEL_180:
                v29 = 3;
              }
            }
            else if ((unsigned __int16)v23 == 502)
            {
LABEL_94:
              v29 = 28;
            }
            else
            {
              if ((unsigned __int16)v23 != 568)
                goto LABEL_357;
LABEL_96:
              v29 = 1;
            }
          }
          else if ((unsigned __int16)v23 > 0x17Fu)
          {
            if ((unsigned __int16)v23 > 0x1ADu)
            {
              if ((unsigned __int16)v23 == 430)
              {
LABEL_166:
                v29 = 23;
              }
              else
              {
                if ((unsigned __int16)v23 != 484)
                  goto LABEL_357;
LABEL_142:
                v29 = 24;
              }
            }
            else if ((unsigned __int16)v23 == 384)
            {
LABEL_170:
              v29 = 9;
            }
            else
            {
              if ((unsigned __int16)v23 != 390)
                goto LABEL_357;
LABEL_199:
              v29 = 14;
            }
          }
          else if ((unsigned __int16)v23 > 0x13Fu)
          {
            if ((unsigned __int16)v23 == 320)
            {
LABEL_162:
              v29 = 8;
            }
            else
            {
              if ((unsigned __int16)v23 != 340)
                goto LABEL_357;
LABEL_186:
              v29 = 13;
            }
          }
          else
          {
            v29 = v23;
            if ((_WORD)v23)
            {
              if ((unsigned __int16)v23 != 163)
                goto LABEL_357;
LABEL_113:
              v29 = 5;
            }
          }
        }
        else
        {
          v29 = v23;
          if (((1 << v8) & 0x100600E6) != 0)
            return;
        }
LABEL_200:
        v30 = v25->var2;
        if (!v30)
          return;
        v31 = 0;
        v21 = v29;
        v32 = v25->var3;
        while (v32[v31] != (_DWORD)v8)
        {
          v21 += 32;
          if (v30 == (_DWORD)++v31)
            return;
        }
        if ((int)v31 > 32)
          goto LABEL_28;
      }
      while (v23 && (v21 & 0x80000000) == 0);
    }
  }
}

- (void)setAttributePresent:(int)a3 withValue:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t platform;
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned int v16;

  keyFormat = self->_keyFormat;
  platform = self->_platform;
  if (a3 == 16 && platform == -1)
  {
    var2 = keyFormat->var2;
    if (!(_DWORD)var2)
      return;
    var3 = keyFormat->var3;
    while (1)
    {
      v12 = *var3++;
      if (v12 == 16)
        break;
      if (!--var2)
        return;
    }
  }
  if (a3 > 0x1C)
    goto LABEL_21;
  if (((1 << a3) & 0x100600E6) != 0)
    return;
  if (a3 == 13)
  {
    *(_QWORD *)&a4 = a4 != 0;
    goto LABEL_21;
  }
  if (a3 != 16)
    goto LABEL_21;
  if (platform != -1)
  {
    if (!a4)
      goto LABEL_21;
    switch(platform)
    {
      case 0uLL:
        if ((int)a4 <= 1963)
        {
          if (a4 == 1665)
            goto LABEL_84;
          if (a4 != 1864)
            goto LABEL_92;
          goto LABEL_72;
        }
        if (a4 == 1964)
          goto LABEL_124;
        if (a4 != 2234)
          goto LABEL_92;
        goto LABEL_109;
      case 3uLL:
        if (a4 == 3840)
          goto LABEL_167;
        if (a4 == 1088)
          goto LABEL_89;
        if (a4 != 720)
          goto LABEL_92;
        goto LABEL_174;
      case 4uLL:
        if ((int)a4 > 429)
        {
          if ((int)a4 > 483)
          {
            if (a4 != 484)
            {
              if (a4 != 496)
              {
                if (a4 != 502)
                  goto LABEL_92;
                goto LABEL_70;
              }
              goto LABEL_137;
            }
LABEL_118:
            *(_QWORD *)&a4 = 24;
            goto LABEL_21;
          }
          if (a4 != 430)
          {
            if (a4 != 446)
              goto LABEL_92;
            goto LABEL_141;
          }
          goto LABEL_142;
        }
        if ((int)a4 <= 383)
        {
          if (a4 != 320)
          {
            if (a4 != 340)
              goto LABEL_92;
            goto LABEL_162;
          }
LABEL_138:
          *(_QWORD *)&a4 = 8;
          goto LABEL_21;
        }
        if (a4 == 384)
          goto LABEL_146;
        if (a4 != 390)
LABEL_92:
          -[CUINamedRenditionInfo attributePresent:withValue:].cold.2(a4, platform);
        goto LABEL_175;
      case 5uLL:
        if (a4 == 3648)
          goto LABEL_72;
        goto LABEL_92;
      default:
        if (platform > 2)
          goto LABEL_92;
        if ((int)a4 <= 2435)
        {
          if ((int)a4 <= 2223)
          {
            if ((int)a4 <= 569)
            {
              if (a4 != 163)
              {
                if (a4 != 568)
                {
                  if (a4 != 569)
                    goto LABEL_92;
                  goto LABEL_148;
                }
LABEL_72:
                *(_QWORD *)&a4 = 1;
                goto LABEL_21;
              }
LABEL_89:
              *(_QWORD *)&a4 = 5;
              goto LABEL_21;
            }
            if (a4 != 570)
            {
              if (a4 != 1792)
              {
                if (a4 != 2160)
                  goto LABEL_92;
                goto LABEL_155;
              }
LABEL_157:
              *(_QWORD *)&a4 = 16;
              goto LABEL_21;
            }
LABEL_156:
            *(_QWORD *)&a4 = 3;
            goto LABEL_21;
          }
          if ((int)a4 <= 2359)
          {
            if (a4 != 2224)
            {
              if (a4 != 2266)
              {
                if (a4 != 2340)
                  goto LABEL_92;
                goto LABEL_132;
              }
LABEL_150:
              *(_QWORD *)&a4 = 25;
              goto LABEL_21;
            }
LABEL_149:
            *(_QWORD *)&a4 = 10;
            goto LABEL_21;
          }
          if (a4 != 2360)
          {
            if (a4 != 2388)
            {
              if (a4 != 2420)
                goto LABEL_92;
              goto LABEL_167;
            }
            goto LABEL_169;
          }
LABEL_168:
          *(_QWORD *)&a4 = 20;
          goto LABEL_21;
        }
        if ((int)a4 <= 2751)
        {
          if ((int)a4 <= 2621)
          {
            if (a4 != 2436)
            {
              if (a4 != 2532)
              {
                if (a4 != 2556)
                  goto LABEL_92;
LABEL_141:
                *(_QWORD *)&a4 = 29;
                goto LABEL_21;
              }
LABEL_147:
              *(_QWORD *)&a4 = 22;
              goto LABEL_21;
            }
LABEL_121:
            *(_QWORD *)&a4 = 11;
            goto LABEL_21;
          }
          if (a4 != 2622)
          {
            if (a4 != 2688)
            {
              if (a4 != 2732)
                goto LABEL_92;
              goto LABEL_161;
            }
LABEL_163:
            *(_QWORD *)&a4 = 12;
            goto LABEL_21;
          }
LABEL_162:
          *(_QWORD *)&a4 = 13;
          goto LABEL_21;
        }
        if ((int)a4 <= 2867)
        {
          if (a4 == 2752)
            goto LABEL_138;
          if (a4 != 2778)
          {
            if (a4 != 2796)
              goto LABEL_92;
            goto LABEL_137;
          }
LABEL_151:
          *(_QWORD *)&a4 = 19;
          goto LABEL_21;
        }
        if (a4 == 2868)
          goto LABEL_175;
        if (a4 == 3024)
          goto LABEL_174;
        if (a4 != 32401)
          goto LABEL_92;
        break;
    }
    goto LABEL_173;
  }
  if ((int)a4 > 2159)
  {
    if ((int)a4 > 2531)
    {
      if ((int)a4 > 2777)
      {
        if ((int)a4 > 3839)
        {
          if (a4 == 3840)
          {
LABEL_167:
            *(_QWORD *)&a4 = 7;
            goto LABEL_21;
          }
          if (a4 == 32401)
          {
LABEL_173:
            *(_QWORD *)&a4 = 17;
            goto LABEL_21;
          }
        }
        else
        {
          if (a4 == 2778)
            goto LABEL_151;
          if (a4 == 2796)
          {
LABEL_137:
            *(_QWORD *)&a4 = 30;
            goto LABEL_21;
          }
        }
      }
      else if ((int)a4 > 2687)
      {
        if (a4 == 2688)
          goto LABEL_163;
        if (a4 == 2732)
        {
LABEL_161:
          *(_QWORD *)&a4 = 4;
          goto LABEL_21;
        }
      }
      else
      {
        if (a4 == 2532)
          goto LABEL_147;
        if (a4 == 2556)
          goto LABEL_141;
      }
    }
    else if ((int)a4 > 2339)
    {
      if ((int)a4 > 2387)
      {
        if (a4 == 2388)
        {
LABEL_169:
          *(_QWORD *)&a4 = 15;
          goto LABEL_21;
        }
        if (a4 == 2436)
          goto LABEL_121;
      }
      else
      {
        if (a4 == 2340)
        {
LABEL_132:
          *(_QWORD *)&a4 = 18;
          goto LABEL_21;
        }
        if (a4 == 2360)
          goto LABEL_168;
      }
    }
    else if ((int)a4 > 2233)
    {
      if (a4 == 2234)
      {
LABEL_109:
        *(_QWORD *)&a4 = 27;
        goto LABEL_21;
      }
      if (a4 == 2266)
        goto LABEL_150;
    }
    else
    {
      if (a4 == 2160)
      {
LABEL_155:
        *(_QWORD *)&a4 = 21;
        goto LABEL_21;
      }
      if (a4 == 2224)
        goto LABEL_149;
    }
    goto LABEL_127;
  }
  if ((int)a4 > 501)
  {
    if ((int)a4 <= 719)
    {
      if ((int)a4 > 568)
      {
        if (a4 == 569)
        {
LABEL_148:
          *(_QWORD *)&a4 = 2;
          goto LABEL_21;
        }
        if (a4 == 570)
          goto LABEL_156;
      }
      else
      {
        if (a4 == 502)
        {
LABEL_70:
          *(_QWORD *)&a4 = 28;
          goto LABEL_21;
        }
        if (a4 == 568)
          goto LABEL_72;
      }
      goto LABEL_127;
    }
    if ((int)a4 > 1791)
    {
      if (a4 == 1792)
        goto LABEL_157;
      if (a4 == 1964)
      {
LABEL_124:
        *(_QWORD *)&a4 = 26;
        goto LABEL_21;
      }
      goto LABEL_127;
    }
    if (a4 != 720)
    {
      if (a4 == 1665)
      {
LABEL_84:
        *(_QWORD *)&a4 = 31;
        goto LABEL_21;
      }
      goto LABEL_127;
    }
LABEL_174:
    *(_QWORD *)&a4 = 6;
  }
  else
  {
    if ((int)a4 <= 383)
    {
      if ((int)a4 > 319)
      {
        if (a4 == 320)
          goto LABEL_138;
        if (a4 == 340)
          goto LABEL_162;
      }
      else
      {
        if (!a4)
          goto LABEL_21;
        if (a4 == 163)
          goto LABEL_89;
      }
      goto LABEL_127;
    }
    if ((int)a4 > 429)
    {
      if (a4 == 430)
      {
LABEL_142:
        *(_QWORD *)&a4 = 23;
        goto LABEL_21;
      }
      if (a4 == 484)
        goto LABEL_118;
      goto LABEL_127;
    }
    if (a4 == 384)
    {
LABEL_146:
      *(_QWORD *)&a4 = 9;
      goto LABEL_21;
    }
    if (a4 != 390)
LABEL_127:
      -[CUINamedRenditionInfo attributePresent:withValue:].cold.1(a4, -1, *(uint64_t *)&a3, a4, v4, v5, v6, v7);
LABEL_175:
    *(_QWORD *)&a4 = 14;
  }
LABEL_21:
  v13 = keyFormat->var2;
  if (v13)
  {
    v14 = 0;
    v15 = keyFormat->var3;
    v16 = a4;
    while (v15[v14] != a3)
    {
      ++v14;
      v16 += 32;
      if (v13 == (_DWORD)v14)
        return;
    }
    if ((int)v14 < 33)
    {
      if ((v16 & 0x80000000) == 0)
        CUIBitVectorSetBit((os_unfair_lock_s *)self->_bitmap, v16);
    }
    else
    {
      _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", *(uint64_t *)&a3, a4, v4, v5, v6, v7, *(uint64_t *)&a3);
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  CUIBitVectorDestroy((os_unfair_lock_s *)self->_bitmap);
  v3.receiver = self;
  v3.super_class = (Class)CUINamedRenditionInfo;
  -[CUINamedRenditionInfo dealloc](&v3, sel_dealloc);
}

- (CUINamedRenditionInfo)initWithKeyFormat:(const _renditionkeyfmt *)a3 andPlatform:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int var2;
  unint64_t i;
  unsigned int v15;
  uint64_t v18;
  int v19;
  uint64_t v20;
  unsigned int *var3;
  int v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CUINamedRenditionInfo;
  v6 = -[CUINamedRenditionInfo init](&v26, sel_init);
  *((_QWORD *)v6 + 1) = CUIBitVectorCreate(32 * a3->var2);
  *((_QWORD *)v6 + 2) = a3;
  *((_QWORD *)v6 + 3) = a4;
  var2 = a3->var2;
  if (var2)
  {
    for (i = 0; i < var2; ++i)
    {
      v15 = a3->var3[i];
      if (*((_QWORD *)v6 + 3) == -1 && v15 == 16)
      {
        if (var2 <= 1)
          v20 = 1;
        else
          v20 = var2;
        var3 = a3->var3;
        while (1)
        {
          v22 = *var3++;
          if (v22 == 16)
            break;
          if (!--v20)
            goto LABEL_23;
        }
      }
      if (v15 > 0x1C || ((1 << v15) & 0x100600E6) == 0)
      {
        v18 = 0;
        v19 = var2;
        if (var2 <= 1uLL)
          v19 = 1;
        while (a3->var3[v18] != v15)
        {
          if (v19 == (_DWORD)++v18)
            goto LABEL_23;
        }
        if ((int)v18 < 33)
          continue;
        _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", v7, v8, v9, v10, v11, v12, a3->var3[i]);
      }
LABEL_23:
      v23 = CUIBitVectorSetBitRange(*((os_unfair_lock_s **)v6 + 1), 32 * (int)i, 32 * (int)i + 32);
      if ((v23 & 0x80000000) != 0)
        -[CUINamedRenditionInfo initWithKeyFormat:andPlatform:].cold.1(v23, v24, v7, v8, v9, v10, v11, v12);
      var2 = a3->var2;
    }
  }
  return (CUINamedRenditionInfo *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id result;
  int64_t platform;
  const _renditionkeyfmt *keyFormat;
  objc_super v9;

  v5 = CUIBitVectorCopy((unsigned int *)self->_bitmap);
  result = +[CUINamedRenditionInfo allocWithZone:](CUINamedRenditionInfo, "allocWithZone:", a3);
  if (result)
  {
    keyFormat = self->_keyFormat;
    platform = self->_platform;
    v9.receiver = result;
    v9.super_class = (Class)CUINamedRenditionInfo;
    result = -[CUINamedRenditionInfo init](&v9, sel_init);
    *((_QWORD *)result + 1) = v5;
    *((_QWORD *)result + 2) = keyFormat;
    *((_QWORD *)result + 3) = platform;
  }
  return result;
}

- (id)archivedData
{
  _DWORD *v2;
  id v3;
  size_t v5;
  uint64_t v6;
  int v7;

  v5 = 0;
  v2 = CUIBitVectorToData((os_unfair_lock_s *)self->_bitmap, &v5);
  v6 = 1;
  v7 = v5;
  v3 = +[NSMutableData data](NSMutableData, "data");
  objc_msgSend(v3, "appendBytes:length:", &v6, 12);
  objc_msgSend(v3, "appendBytes:length:", v2, v5);
  free(v2);
  return v3;
}

- (BOOL)isEqualToNamedRenditionInfo:(id)a3
{
  const _renditionkeyfmt *keyFormat;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  id v10;
  id v11;
  unint64_t platform;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  BOOL result;

  if (*((_QWORD *)a3 + 3) != self->_platform || *(_DWORD *)(*((_QWORD *)a3 + 2) + 8) != self->_keyFormat->var2)
    return 0;
  if (!CUIBitVectorEqual((os_unfair_lock_s *)self->_bitmap, *((os_unfair_lock_s **)a3 + 1)))
  {
    keyFormat = self->_keyFormat;
    if (keyFormat->var2)
    {
      v6 = 0;
      while (keyFormat->var3[v6] == *(_DWORD *)(*((_QWORD *)a3 + 2) + 4 * v6 + 12))
      {
        v7 = v6;
        v8 = -[CUINamedRenditionInfo contentPresentForAttribute:](self, "contentPresentForAttribute:");
        if (v8 != objc_msgSend(a3, "contentPresentForAttribute:", *(unsigned int *)(*((_QWORD *)a3 + 2) + 4 * v7 + 12)))break;
        v9 = -[CUINamedRenditionInfo diverseContentPresentForAttribute:](self, "diverseContentPresentForAttribute:", self->_keyFormat->var3[v7]);
        if (v9 != objc_msgSend(a3, "diverseContentPresentForAttribute:", *(unsigned int *)(*((_QWORD *)a3 + 2) + 4 * v7 + 12)))break;
        if (-[CUINamedRenditionInfo contentPresentForAttribute:](self, "contentPresentForAttribute:", self->_keyFormat->var3[v7]))
        {
          v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 4);
          v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 4);
          platform = self->_platform;
          v13 = self->_keyFormat->var3[v7];
          v14 = CUIBitVectorBucketValue((os_unfair_lock_s *)self->_bitmap, 32 * (int)v7);
          if (v14 == -1)
          {
            objc_msgSend(v10, "addObject:", CFSTR("<all>"));
          }
          else
          {
            v15 = v14;
            v16 = 0;
            do
            {
              if (((v15 >> v16) & 1) != 0)
              {
                v17 = v16;
                if (v13 == 16)
                {
                  v18 = __CUISubtypeFromIndex(platform, v16);
                  if (v18 >= 0)
                    v17 = v18;
                  else
                    v17 = v16;
                }
                objc_msgSend(v10, "addObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v17));
              }
              v16 = (v16 + 1);
            }
            while ((_DWORD)v16 != 32);
          }
          v19 = *((_QWORD *)a3 + 3);
          v20 = *(_DWORD *)(*((_QWORD *)a3 + 2) + 4 * v7 + 12);
          v21 = CUIBitVectorBucketValue(*((os_unfair_lock_s **)a3 + 1), 32 * (int)v7);
          if (v21 == -1)
          {
            objc_msgSend(v11, "addObject:", CFSTR("<all>"));
          }
          else
          {
            v22 = v21;
            v23 = 0;
            do
            {
              if (((v22 >> v23) & 1) != 0)
              {
                v24 = v23;
                if (v20 == 16)
                {
                  v25 = __CUISubtypeFromIndex(v19, v23);
                  if (v25 >= 0)
                    v24 = v25;
                  else
                    v24 = v23;
                }
                objc_msgSend(v11, "addObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v24));
              }
              v23 = (v23 + 1);
            }
            while ((_DWORD)v23 != 32);
          }
          v26 = objc_msgSend(v10, "isEqualToArray:", v11);

          if (!v26)
            break;
        }
        v6 = v7 + 1;
        keyFormat = self->_keyFormat;
        result = 1;
        if ((v7 + 1) >= keyFormat->var2)
          return result;
      }
      return 0;
    }
  }
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (a3 == self)
    return 1;
  v5 = objc_opt_class(self, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
    return -[CUINamedRenditionInfo isEqualToNamedRenditionInfo:](self, "isEqualToNamedRenditionInfo:", a3);
  else
    return 0;
}

- (id)description
{
  _BYTE *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;

  v3 = CUIBitVectorToString((os_unfair_lock_s *)self->_bitmap);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p %s>"), NSStringFromClass(v5), self, v3);
  free(v3);
  return v6;
}

- (id)debugDescription
{
  const _renditionkeyfmt *keyFormat;
  id v4;
  unint64_t v5;
  unsigned int *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  id v10;
  unint64_t platform;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;
  const _renditionkeyfmt *v20;
  void *v21;
  const char *v22;
  char __str[2048];

  bzero(__str, 0x800uLL);
  keyFormat = self->_keyFormat;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 32);
  objc_msgSend(v4, "addObject:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "| Index |            Attribute             | Is Content Present | Is Diverse Content Present |            Values          |"));
  v21 = v4;
  objc_msgSend(v4, "addObject:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "|-------|----------------------------------|--------------------|----------------------------|----------------------------|"));
  if (keyFormat->var2)
  {
    v5 = 0;
    v20 = keyFormat;
    do
    {
      v6 = &keyFormat->var0 + v5;
      v7 = v6[3];
      v22 = CUIThemeAttributeNameToString(v6[3]);
      bzero(__str, 0x800uLL);
      v8 = -[CUINamedRenditionInfo contentPresentForAttribute:](self, "contentPresentForAttribute:", v7);
      v9 = -[CUINamedRenditionInfo diverseContentPresentForAttribute:](self, "diverseContentPresentForAttribute:", v7);
      v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 4);
      platform = self->_platform;
      v12 = v6[3];
      v13 = CUIBitVectorBucketValue((os_unfair_lock_s *)self->_bitmap, 32 * (int)v5);
      if (v13 == -1)
      {
        objc_msgSend(v10, "addObject:", CFSTR("<all>"));
      }
      else
      {
        v14 = v13;
        v15 = 0;
        do
        {
          if (((v14 >> v15) & 1) != 0)
          {
            v16 = v15;
            if (v12 == 16)
            {
              v17 = __CUISubtypeFromIndex(platform, v15);
              if (v17 >= 0)
                v16 = v17;
              else
                v16 = v15;
            }
            objc_msgSend(v10, "addObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v16));
          }
          v15 = (v15 + 1);
        }
        while ((_DWORD)v15 != 32);
      }
      snprintf(__str, 0x800uLL, "| %-5d | %-32s | %-18d | %-26d | %-26s |", v5, v22, v8, v9, (const char *)objc_msgSend(objc_msgSend(v10, "componentsJoinedByString:", CFSTR(",")), "UTF8String"));
      objc_msgSend(v21, "addObject:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __str));

      ++v5;
      keyFormat = v20;
    }
    while (v5 < v20->var2);
  }
  v18 = objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));

  return v18;
}

- (id)bitwiseAndWith:(id)a3
{
  _DWORD *v4;
  CUINamedRenditionInfo *v5;
  int64_t platform;
  const _renditionkeyfmt *keyFormat;
  objc_super v9;

  v4 = CUIBitVectorBitAnd((os_unfair_lock_s *)self->_bitmap, *((os_unfair_lock_s **)a3 + 1));
  v5 = [CUINamedRenditionInfo alloc];
  if (v5)
  {
    keyFormat = self->_keyFormat;
    platform = self->_platform;
    v9.receiver = v5;
    v9.super_class = (Class)CUINamedRenditionInfo;
    v5 = -[CUINamedRenditionInfo init](&v9, sel_init);
    v5->_bitmap = v4;
    v5->_keyFormat = keyFormat;
    v5->_platform = platform;
  }
  return v5;
}

- (id)bitwiseOrWith:(id)a3 forAttribute:(int)a4
{
  const _renditionkeyfmt *keyFormat;
  unsigned int var2;
  uint64_t v7;
  unsigned int *var3;
  void *v9;
  void *v10;
  CUINamedRenditionInfo *v11;
  int64_t platform;
  const _renditionkeyfmt *v13;
  objc_super v15;

  keyFormat = self->_keyFormat;
  var2 = keyFormat->var2;
  if (!var2)
    goto LABEL_8;
  v7 = 0;
  var3 = keyFormat->var3;
  while (var3[v7] != a4)
  {
    if (var2 == (_DWORD)++v7)
      goto LABEL_8;
  }
  if ((v7 & 0x80000000) != 0)
LABEL_8:
    v9 = CUIBitVectorCopy((unsigned int *)self->_bitmap);
  else
    v9 = CUIBitVectorBitOrForBucket((os_unfair_lock_s *)self->_bitmap, *((os_unfair_lock_s **)a3 + 1), v7);
  v10 = v9;
  v11 = [CUINamedRenditionInfo alloc];
  if (v11)
  {
    v13 = self->_keyFormat;
    platform = self->_platform;
    v15.receiver = v11;
    v15.super_class = (Class)CUINamedRenditionInfo;
    v11 = -[CUINamedRenditionInfo init](&v15, sel_init);
    v11->_bitmap = v10;
    v11->_keyFormat = v13;
    v11->_platform = platform;
  }
  return v11;
}

- (unsigned)getValueOfAttribute:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v13;
  unsigned __int16 result;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int *v18;
  unsigned int v19;
  int v20;

  keyFormat = self->_keyFormat;
  if (a3 == 16 && self->_platform == -1)
  {
    var2 = keyFormat->var2;
    if (!(_DWORD)var2)
    {
      result = 0;
      return __CUISubtypeFromIndex(self->_platform, result);
    }
    var3 = keyFormat->var3;
    while (1)
    {
      v13 = *var3++;
      if (v13 == 16)
        break;
      if (!--var2)
        goto LABEL_10;
    }
  }
  if (a3 <= 0x1C && ((1 << a3) & 0x100600E6) != 0)
    goto LABEL_10;
  v15 = keyFormat->var2;
  if (!v15)
    goto LABEL_10;
  v16 = 0;
  v17 = 0;
  v18 = keyFormat->var3;
  while (v18[v17] != a3)
  {
    result = 0;
    ++v17;
    v16 += 32;
    if (v15 == (_DWORD)v17)
      goto LABEL_11;
  }
  if ((int)v17 >= 33)
  {
    _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", *(uint64_t *)&a3, v3, v4, v5, v6, v7, *(uint64_t *)&a3);
LABEL_10:
    result = 0;
    goto LABEL_11;
  }
  if ((v17 & 0x80000000) != 0)
    goto LABEL_10;
  v19 = CUIBitVectorBucketValue((os_unfair_lock_s *)self->_bitmap, v16);
  v20 = 0;
  while (((v19 >> v20) & 1) == 0)
  {
    result = 0;
    if (++v20 == 32)
      goto LABEL_11;
  }
  result = v20;
LABEL_11:
  if (a3 == 16)
    return __CUISubtypeFromIndex(self->_platform, result);
  return result;
}

- (unsigned)getClosestValueOfAttribute:(int)a3 withValue:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v12;
  unsigned __int16 v13;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int *v18;
  unsigned int v19;
  BOOL v20;

  v8 = a4;
  keyFormat = self->_keyFormat;
  if (a3 == 16 && self->_platform == -1)
  {
    var2 = keyFormat->var2;
    if (!(_DWORD)var2)
      return 0;
    var3 = keyFormat->var3;
    while (1)
    {
      v12 = *var3++;
      if (v12 == 16)
        break;
      if (!--var2)
        return 0;
    }
  }
  if (a3 <= 0x1C && ((1 << a3) & 0x100600E6) != 0)
    return 0;
  v15 = keyFormat->var2;
  if (!v15)
    return 0;
  v16 = 0;
  v17 = 0;
  v18 = keyFormat->var3;
  while (v18[v17] != a3)
  {
    v13 = 0;
    ++v17;
    v16 += 32;
    if (v15 == (_DWORD)v17)
      return v13;
  }
  if ((int)v17 >= 33)
  {
    _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", *(uint64_t *)&a3, a4, v4, v5, v6, v7, *(uint64_t *)&a3);
    return 0;
  }
  if ((v17 & 0x80000000) != 0)
    return 0;
  v19 = CUIBitVectorBucketValue((os_unfair_lock_s *)self->_bitmap, v16);
  while (((v19 >> v8) & 1) == 0)
  {
    v13 = 0;
    v20 = __OFSUB__(v8--, 1);
    if (v8 < 0 != v20)
      return v13;
  }
  return v8;
}

- (BOOL)contentPresentForAttribute:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int *v15;

  keyFormat = self->_keyFormat;
  if (a3 == 16 && self->_platform == -1)
  {
    var2 = keyFormat->var2;
    if (!(_DWORD)var2)
      return 0;
    var3 = keyFormat->var3;
    while (1)
    {
      v11 = *var3++;
      if (v11 == 16)
        break;
      if (!--var2)
        return 0;
    }
  }
  if ((a3 - 1) >= 0x1C || ((0x8030073u >> (a3 - 1)) & 1) == 0)
  {
    v12 = keyFormat->var2;
    if (v12)
    {
      v13 = 0;
      v14 = 0;
      v15 = keyFormat->var3;
      while (v15[v14] != a3)
      {
        ++v14;
        v13 += 32;
        if (v12 == (_DWORD)v14)
          return 0;
      }
      if ((int)v14 < 33)
      {
        if ((v14 & 0x80000000) == 0 && (int)CUIBitVectorNumberOfBitsSetInBucket((uint64_t)self->_bitmap, v13) > 0)
          return 1;
      }
      else
      {
        _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", *(uint64_t *)&a3, v3, v4, v5, v6, v7, *(uint64_t *)&a3);
      }
    }
  }
  return 0;
}

- (BOOL)contentEqualForAttribute:(int)a3 withRenditionInfo:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int *v16;
  int v17;

  keyFormat = self->_keyFormat;
  if (a3 == 16 && self->_platform == -1)
  {
    var2 = keyFormat->var2;
    if (!(_DWORD)var2)
      return 0;
    var3 = keyFormat->var3;
    while (1)
    {
      v12 = *var3++;
      if (v12 == 16)
        break;
      if (!--var2)
        return 0;
    }
  }
  if ((a3 - 1) >= 0x1C || ((0x8030073u >> (a3 - 1)) & 1) == 0)
  {
    v13 = keyFormat->var2;
    if (v13)
    {
      v14 = 0;
      v15 = 0;
      v16 = keyFormat->var3;
      while (v16[v15] != a3)
      {
        ++v15;
        v14 += 32;
        if (v13 == (_DWORD)v15)
          return 0;
      }
      if ((int)v15 < 33)
      {
        if ((v15 & 0x80000000) == 0)
        {
          v17 = CUIBitVectorBucketValue((os_unfair_lock_s *)self->_bitmap, v14);
          return v17 == CUIBitVectorBucketValue(*((os_unfair_lock_s **)a4 + 1), v14);
        }
      }
      else
      {
        _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7, *(uint64_t *)&a3);
      }
    }
  }
  return 0;
}

- (void)clearAttributePresent:(int)a3 withValue:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t platform;
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned int v16;

  keyFormat = self->_keyFormat;
  platform = self->_platform;
  if (a3 == 16 && platform == -1)
  {
    var2 = keyFormat->var2;
    if (!(_DWORD)var2)
      return;
    var3 = keyFormat->var3;
    while (1)
    {
      v12 = *var3++;
      if (v12 == 16)
        break;
      if (!--var2)
        return;
    }
  }
  if (a3 > 0x1C)
    goto LABEL_21;
  if (((1 << a3) & 0x100600E6) != 0)
    return;
  if (a3 == 13)
  {
    *(_QWORD *)&a4 = a4 != 0;
    goto LABEL_21;
  }
  if (a3 != 16)
    goto LABEL_21;
  if (platform != -1)
  {
    if (!a4)
      goto LABEL_21;
    switch(platform)
    {
      case 0uLL:
        if ((int)a4 <= 1963)
        {
          if (a4 == 1665)
            goto LABEL_84;
          if (a4 != 1864)
            goto LABEL_92;
          goto LABEL_72;
        }
        if (a4 == 1964)
          goto LABEL_124;
        if (a4 != 2234)
          goto LABEL_92;
        goto LABEL_109;
      case 3uLL:
        if (a4 == 3840)
          goto LABEL_167;
        if (a4 == 1088)
          goto LABEL_89;
        if (a4 != 720)
          goto LABEL_92;
        goto LABEL_174;
      case 4uLL:
        if ((int)a4 > 429)
        {
          if ((int)a4 > 483)
          {
            if (a4 != 484)
            {
              if (a4 != 496)
              {
                if (a4 != 502)
                  goto LABEL_92;
                goto LABEL_70;
              }
              goto LABEL_137;
            }
LABEL_118:
            *(_QWORD *)&a4 = 24;
            goto LABEL_21;
          }
          if (a4 != 430)
          {
            if (a4 != 446)
              goto LABEL_92;
            goto LABEL_141;
          }
          goto LABEL_142;
        }
        if ((int)a4 <= 383)
        {
          if (a4 != 320)
          {
            if (a4 != 340)
              goto LABEL_92;
            goto LABEL_162;
          }
LABEL_138:
          *(_QWORD *)&a4 = 8;
          goto LABEL_21;
        }
        if (a4 == 384)
          goto LABEL_146;
        if (a4 != 390)
LABEL_92:
          -[CUINamedRenditionInfo attributePresent:withValue:].cold.2(a4, platform);
        goto LABEL_175;
      case 5uLL:
        if (a4 == 3648)
          goto LABEL_72;
        goto LABEL_92;
      default:
        if (platform > 2)
          goto LABEL_92;
        if ((int)a4 <= 2435)
        {
          if ((int)a4 <= 2223)
          {
            if ((int)a4 <= 569)
            {
              if (a4 != 163)
              {
                if (a4 != 568)
                {
                  if (a4 != 569)
                    goto LABEL_92;
                  goto LABEL_148;
                }
LABEL_72:
                *(_QWORD *)&a4 = 1;
                goto LABEL_21;
              }
LABEL_89:
              *(_QWORD *)&a4 = 5;
              goto LABEL_21;
            }
            if (a4 != 570)
            {
              if (a4 != 1792)
              {
                if (a4 != 2160)
                  goto LABEL_92;
                goto LABEL_155;
              }
LABEL_157:
              *(_QWORD *)&a4 = 16;
              goto LABEL_21;
            }
LABEL_156:
            *(_QWORD *)&a4 = 3;
            goto LABEL_21;
          }
          if ((int)a4 <= 2359)
          {
            if (a4 != 2224)
            {
              if (a4 != 2266)
              {
                if (a4 != 2340)
                  goto LABEL_92;
                goto LABEL_132;
              }
LABEL_150:
              *(_QWORD *)&a4 = 25;
              goto LABEL_21;
            }
LABEL_149:
            *(_QWORD *)&a4 = 10;
            goto LABEL_21;
          }
          if (a4 != 2360)
          {
            if (a4 != 2388)
            {
              if (a4 != 2420)
                goto LABEL_92;
              goto LABEL_167;
            }
            goto LABEL_169;
          }
LABEL_168:
          *(_QWORD *)&a4 = 20;
          goto LABEL_21;
        }
        if ((int)a4 <= 2751)
        {
          if ((int)a4 <= 2621)
          {
            if (a4 != 2436)
            {
              if (a4 != 2532)
              {
                if (a4 != 2556)
                  goto LABEL_92;
LABEL_141:
                *(_QWORD *)&a4 = 29;
                goto LABEL_21;
              }
LABEL_147:
              *(_QWORD *)&a4 = 22;
              goto LABEL_21;
            }
LABEL_121:
            *(_QWORD *)&a4 = 11;
            goto LABEL_21;
          }
          if (a4 != 2622)
          {
            if (a4 != 2688)
            {
              if (a4 != 2732)
                goto LABEL_92;
              goto LABEL_161;
            }
LABEL_163:
            *(_QWORD *)&a4 = 12;
            goto LABEL_21;
          }
LABEL_162:
          *(_QWORD *)&a4 = 13;
          goto LABEL_21;
        }
        if ((int)a4 <= 2867)
        {
          if (a4 == 2752)
            goto LABEL_138;
          if (a4 != 2778)
          {
            if (a4 != 2796)
              goto LABEL_92;
            goto LABEL_137;
          }
LABEL_151:
          *(_QWORD *)&a4 = 19;
          goto LABEL_21;
        }
        if (a4 == 2868)
          goto LABEL_175;
        if (a4 == 3024)
          goto LABEL_174;
        if (a4 != 32401)
          goto LABEL_92;
        break;
    }
    goto LABEL_173;
  }
  if ((int)a4 > 2159)
  {
    if ((int)a4 > 2531)
    {
      if ((int)a4 > 2777)
      {
        if ((int)a4 > 3839)
        {
          if (a4 == 3840)
          {
LABEL_167:
            *(_QWORD *)&a4 = 7;
            goto LABEL_21;
          }
          if (a4 == 32401)
          {
LABEL_173:
            *(_QWORD *)&a4 = 17;
            goto LABEL_21;
          }
        }
        else
        {
          if (a4 == 2778)
            goto LABEL_151;
          if (a4 == 2796)
          {
LABEL_137:
            *(_QWORD *)&a4 = 30;
            goto LABEL_21;
          }
        }
      }
      else if ((int)a4 > 2687)
      {
        if (a4 == 2688)
          goto LABEL_163;
        if (a4 == 2732)
        {
LABEL_161:
          *(_QWORD *)&a4 = 4;
          goto LABEL_21;
        }
      }
      else
      {
        if (a4 == 2532)
          goto LABEL_147;
        if (a4 == 2556)
          goto LABEL_141;
      }
    }
    else if ((int)a4 > 2339)
    {
      if ((int)a4 > 2387)
      {
        if (a4 == 2388)
        {
LABEL_169:
          *(_QWORD *)&a4 = 15;
          goto LABEL_21;
        }
        if (a4 == 2436)
          goto LABEL_121;
      }
      else
      {
        if (a4 == 2340)
        {
LABEL_132:
          *(_QWORD *)&a4 = 18;
          goto LABEL_21;
        }
        if (a4 == 2360)
          goto LABEL_168;
      }
    }
    else if ((int)a4 > 2233)
    {
      if (a4 == 2234)
      {
LABEL_109:
        *(_QWORD *)&a4 = 27;
        goto LABEL_21;
      }
      if (a4 == 2266)
        goto LABEL_150;
    }
    else
    {
      if (a4 == 2160)
      {
LABEL_155:
        *(_QWORD *)&a4 = 21;
        goto LABEL_21;
      }
      if (a4 == 2224)
        goto LABEL_149;
    }
    goto LABEL_127;
  }
  if ((int)a4 > 501)
  {
    if ((int)a4 <= 719)
    {
      if ((int)a4 > 568)
      {
        if (a4 == 569)
        {
LABEL_148:
          *(_QWORD *)&a4 = 2;
          goto LABEL_21;
        }
        if (a4 == 570)
          goto LABEL_156;
      }
      else
      {
        if (a4 == 502)
        {
LABEL_70:
          *(_QWORD *)&a4 = 28;
          goto LABEL_21;
        }
        if (a4 == 568)
          goto LABEL_72;
      }
      goto LABEL_127;
    }
    if ((int)a4 > 1791)
    {
      if (a4 == 1792)
        goto LABEL_157;
      if (a4 == 1964)
      {
LABEL_124:
        *(_QWORD *)&a4 = 26;
        goto LABEL_21;
      }
      goto LABEL_127;
    }
    if (a4 != 720)
    {
      if (a4 == 1665)
      {
LABEL_84:
        *(_QWORD *)&a4 = 31;
        goto LABEL_21;
      }
      goto LABEL_127;
    }
LABEL_174:
    *(_QWORD *)&a4 = 6;
  }
  else
  {
    if ((int)a4 <= 383)
    {
      if ((int)a4 > 319)
      {
        if (a4 == 320)
          goto LABEL_138;
        if (a4 == 340)
          goto LABEL_162;
      }
      else
      {
        if (!a4)
          goto LABEL_21;
        if (a4 == 163)
          goto LABEL_89;
      }
      goto LABEL_127;
    }
    if ((int)a4 > 429)
    {
      if (a4 == 430)
      {
LABEL_142:
        *(_QWORD *)&a4 = 23;
        goto LABEL_21;
      }
      if (a4 == 484)
        goto LABEL_118;
      goto LABEL_127;
    }
    if (a4 == 384)
    {
LABEL_146:
      *(_QWORD *)&a4 = 9;
      goto LABEL_21;
    }
    if (a4 != 390)
LABEL_127:
      -[CUINamedRenditionInfo attributePresent:withValue:].cold.1(a4, -1, *(uint64_t *)&a3, a4, v4, v5, v6, v7);
LABEL_175:
    *(_QWORD *)&a4 = 14;
  }
LABEL_21:
  v13 = keyFormat->var2;
  if (v13)
  {
    v14 = 0;
    v15 = keyFormat->var3;
    v16 = a4;
    while (v15[v14] != a3)
    {
      ++v14;
      v16 += 32;
      if (v13 == (_DWORD)v14)
        return;
    }
    if ((int)v14 < 33)
    {
      if ((v16 & 0x80000000) == 0)
        CUIBitVectorUnSetBit((os_unfair_lock_s *)self->_bitmap, v16);
    }
    else
    {
      _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", *(uint64_t *)&a3, a4, v4, v5, v6, v7, *(uint64_t *)&a3);
    }
  }
}

- (unint64_t)numberOfBitsSet
{
  return (int)CUIBitVectorNumberOfBitsSet((os_unfair_lock_s *)self->_bitmap);
}

- (void)incrementIndex:(unint64_t *)a3 inValues:(id)a4 forAttribute:(int)a5
{
  uint64_t v5;
  char *v9;
  unint64_t platform;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int *v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  const _renditionkeyfmt *v31;
  uint64_t v32;
  unsigned int *v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  unsigned int *v37;

  v5 = *(_QWORD *)&a5;
  v9 = (char *)objc_msgSend(a4, "count");
  platform = self->_platform;
  v11 = objc_msgSend(objc_msgSend(a4, "objectAtIndex:", *a3), "integerValue");
  keyFormat = self->_keyFormat;
  if ((_DWORD)v5 == 16 && platform == -1)
  {
    var2 = keyFormat->var2;
    if (!(_DWORD)var2)
      return;
    var3 = keyFormat->var3;
    while (1)
    {
      v22 = *var3++;
      if (v22 == 16)
        break;
      if (!--var2)
        return;
    }
  }
  if (v5 <= 0x1C)
  {
    if (((1 << v5) & 0x100600E6) != 0)
      return;
    if ((_DWORD)v5 == 13)
    {
      LOWORD(v11) = (unsigned __int16)v11 != 0;
    }
    else if ((_DWORD)v5 == 16)
    {
      if (platform == -1)
      {
        if ((unsigned __int16)v11 > 0x86Fu)
        {
          if ((unsigned __int16)v11 > 0x9E3u)
          {
            if ((unsigned __int16)v11 > 0xAD9u)
            {
              if ((unsigned __int16)v11 > 0xEFFu)
              {
                if ((unsigned __int16)v11 == 3840)
                {
LABEL_345:
                  LOWORD(v11) = 7;
                  goto LABEL_21;
                }
                if ((unsigned __int16)v11 == 32401)
                  goto LABEL_351;
              }
              else
              {
                if ((unsigned __int16)v11 == 2778)
                  goto LABEL_329;
                if ((unsigned __int16)v11 == 2796)
                  goto LABEL_315;
              }
            }
            else if ((unsigned __int16)v11 > 0xA7Fu)
            {
              if ((unsigned __int16)v11 == 2688)
                goto LABEL_341;
              if ((unsigned __int16)v11 == 2732)
              {
LABEL_339:
                LOWORD(v11) = 4;
                goto LABEL_21;
              }
            }
            else
            {
              if ((unsigned __int16)v11 == 2532)
                goto LABEL_325;
              if ((unsigned __int16)v11 == 2556)
                goto LABEL_319;
            }
          }
          else if ((unsigned __int16)v11 > 0x923u)
          {
            if ((unsigned __int16)v11 > 0x953u)
            {
              if ((unsigned __int16)v11 == 2388)
                goto LABEL_347;
              if ((unsigned __int16)v11 == 2436)
                goto LABEL_299;
            }
            else
            {
              if ((unsigned __int16)v11 == 2340)
              {
LABEL_310:
                LOWORD(v11) = 18;
                goto LABEL_21;
              }
              if ((unsigned __int16)v11 == 2360)
                goto LABEL_346;
            }
          }
          else if ((unsigned __int16)v11 > 0x8B9u)
          {
            if ((unsigned __int16)v11 == 2234)
            {
LABEL_287:
              LOWORD(v11) = 27;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 == 2266)
              goto LABEL_328;
          }
          else
          {
            if ((unsigned __int16)v11 == 2160)
            {
LABEL_333:
              LOWORD(v11) = 21;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 == 2224)
              goto LABEL_327;
          }
        }
        else if ((unsigned __int16)v11 > 0x1F5u)
        {
          if ((unsigned __int16)v11 > 0x2CFu)
          {
            if ((unsigned __int16)v11 > 0x6FFu)
            {
              if ((unsigned __int16)v11 == 1792)
                goto LABEL_335;
              if ((unsigned __int16)v11 == 1964)
              {
LABEL_302:
                LOWORD(v11) = 26;
                goto LABEL_21;
              }
            }
            else
            {
              if ((unsigned __int16)v11 == 720)
              {
LABEL_352:
                LOWORD(v11) = 6;
                goto LABEL_21;
              }
              if ((unsigned __int16)v11 == 1665)
              {
LABEL_262:
                LOWORD(v11) = 31;
                goto LABEL_21;
              }
            }
          }
          else if ((unsigned __int16)v11 > 0x238u)
          {
            if ((unsigned __int16)v11 == 569)
              goto LABEL_326;
            if ((unsigned __int16)v11 == 570)
              goto LABEL_334;
          }
          else
          {
            if ((unsigned __int16)v11 == 502)
            {
LABEL_236:
              LOWORD(v11) = 28;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 == 568)
              goto LABEL_242;
          }
        }
        else if ((unsigned __int16)v11 > 0x17Fu)
        {
          if ((unsigned __int16)v11 > 0x1ADu)
          {
            if ((unsigned __int16)v11 == 430)
              goto LABEL_320;
            if ((unsigned __int16)v11 == 484)
              goto LABEL_296;
          }
          else
          {
            if ((unsigned __int16)v11 == 384)
            {
LABEL_324:
              LOWORD(v11) = 9;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 == 390)
            {
LABEL_353:
              LOWORD(v11) = 14;
              goto LABEL_21;
            }
          }
        }
        else if ((unsigned __int16)v11 > 0x13Fu)
        {
          if ((unsigned __int16)v11 == 320)
            goto LABEL_316;
          if ((unsigned __int16)v11 == 340)
            goto LABEL_340;
        }
        else
        {
          if (!(_WORD)v11)
            goto LABEL_21;
          if ((unsigned __int16)v11 == 163)
            goto LABEL_267;
        }
        -[CUINamedRenditionInfo decrementValue:forAttribute:].cold.1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
      }
      if ((_WORD)v11)
      {
        switch(platform)
        {
          case 0uLL:
            if ((unsigned __int16)v11 <= 0x7ABu)
            {
              if ((unsigned __int16)v11 == 1665)
                goto LABEL_262;
              if ((unsigned __int16)v11 != 1864)
                goto LABEL_270;
              goto LABEL_242;
            }
            if ((unsigned __int16)v11 == 1964)
              goto LABEL_302;
            if ((unsigned __int16)v11 != 2234)
              goto LABEL_270;
            goto LABEL_287;
          case 3uLL:
            if ((unsigned __int16)v11 == 3840)
              goto LABEL_345;
            if ((unsigned __int16)v11 == 1088)
              goto LABEL_267;
            if ((unsigned __int16)v11 != 720)
              goto LABEL_270;
            goto LABEL_352;
          case 4uLL:
            if ((unsigned __int16)v11 > 0x1ADu)
            {
              if ((unsigned __int16)v11 > 0x1E3u)
              {
                if ((unsigned __int16)v11 != 484)
                {
                  if ((unsigned __int16)v11 != 496)
                  {
                    if ((unsigned __int16)v11 != 502)
                      goto LABEL_270;
                    goto LABEL_236;
                  }
LABEL_315:
                  LOWORD(v11) = 30;
                  goto LABEL_21;
                }
LABEL_296:
                LOWORD(v11) = 24;
                goto LABEL_21;
              }
              if ((unsigned __int16)v11 != 430)
              {
                if ((unsigned __int16)v11 != 446)
                  goto LABEL_270;
                goto LABEL_319;
              }
LABEL_320:
              LOWORD(v11) = 23;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 <= 0x17Fu)
            {
              if ((unsigned __int16)v11 != 320)
              {
                if ((unsigned __int16)v11 != 340)
                  goto LABEL_270;
LABEL_340:
                LOWORD(v11) = 13;
                goto LABEL_21;
              }
LABEL_316:
              LOWORD(v11) = 8;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 == 384)
              goto LABEL_324;
            if ((unsigned __int16)v11 != 390)
LABEL_270:
              -[CUINamedRenditionInfo decrementValue:forAttribute:].cold.2((uint64_t)v11, platform);
            goto LABEL_353;
          case 5uLL:
            if ((unsigned __int16)v11 == 3648)
              goto LABEL_242;
            goto LABEL_270;
          default:
            if (platform > 2)
              goto LABEL_270;
            if ((unsigned __int16)v11 <= 0x983u)
            {
              if ((unsigned __int16)v11 <= 0x8AFu)
              {
                if ((unsigned __int16)v11 <= 0x239u)
                {
                  if ((unsigned __int16)v11 != 163)
                  {
                    if ((unsigned __int16)v11 != 568)
                    {
                      if ((unsigned __int16)v11 != 569)
                        goto LABEL_270;
LABEL_326:
                      LOWORD(v11) = 2;
                      goto LABEL_21;
                    }
LABEL_242:
                    LOWORD(v11) = 1;
                    goto LABEL_21;
                  }
LABEL_267:
                  LOWORD(v11) = 5;
                  goto LABEL_21;
                }
                if ((unsigned __int16)v11 != 570)
                {
                  if ((unsigned __int16)v11 != 1792)
                  {
                    if ((unsigned __int16)v11 != 2160)
                      goto LABEL_270;
                    goto LABEL_333;
                  }
LABEL_335:
                  LOWORD(v11) = 16;
                  goto LABEL_21;
                }
LABEL_334:
                LOWORD(v11) = 3;
                goto LABEL_21;
              }
              if ((unsigned __int16)v11 <= 0x937u)
              {
                if ((unsigned __int16)v11 != 2224)
                {
                  if ((unsigned __int16)v11 != 2266)
                  {
                    if ((unsigned __int16)v11 != 2340)
                      goto LABEL_270;
                    goto LABEL_310;
                  }
LABEL_328:
                  LOWORD(v11) = 25;
                  goto LABEL_21;
                }
LABEL_327:
                LOWORD(v11) = 10;
                goto LABEL_21;
              }
              if ((unsigned __int16)v11 != 2360)
              {
                if ((unsigned __int16)v11 != 2388)
                {
                  if ((unsigned __int16)v11 != 2420)
                    goto LABEL_270;
                  goto LABEL_345;
                }
LABEL_347:
                LOWORD(v11) = 15;
                goto LABEL_21;
              }
LABEL_346:
              LOWORD(v11) = 20;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 <= 0xABFu)
            {
              if ((unsigned __int16)v11 <= 0xA3Du)
              {
                if ((unsigned __int16)v11 != 2436)
                {
                  if ((unsigned __int16)v11 != 2532)
                  {
                    if ((unsigned __int16)v11 != 2556)
                      goto LABEL_270;
LABEL_319:
                    LOWORD(v11) = 29;
                    goto LABEL_21;
                  }
LABEL_325:
                  LOWORD(v11) = 22;
                  goto LABEL_21;
                }
LABEL_299:
                LOWORD(v11) = 11;
                goto LABEL_21;
              }
              if ((unsigned __int16)v11 == 2622)
                goto LABEL_340;
              if ((unsigned __int16)v11 != 2688)
              {
                if ((unsigned __int16)v11 != 2732)
                  goto LABEL_270;
                goto LABEL_339;
              }
LABEL_341:
              LOWORD(v11) = 12;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 <= 0xB33u)
            {
              if ((unsigned __int16)v11 == 2752)
                goto LABEL_316;
              if ((unsigned __int16)v11 != 2778)
              {
                if ((unsigned __int16)v11 != 2796)
                  goto LABEL_270;
                goto LABEL_315;
              }
LABEL_329:
              LOWORD(v11) = 19;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 == 2868)
              goto LABEL_353;
            if ((unsigned __int16)v11 == 3024)
              goto LABEL_352;
            if ((unsigned __int16)v11 != 32401)
              goto LABEL_270;
            break;
        }
LABEL_351:
        LOWORD(v11) = 17;
        goto LABEL_21;
      }
      LOWORD(v11) = 0;
    }
  }
LABEL_21:
  v23 = keyFormat->var2;
  if (v23)
  {
    v24 = 0;
    v25 = (unsigned __int16)v11;
    v26 = keyFormat->var3;
    while (v26[v24] != (_DWORD)v5)
    {
      ++v24;
      v25 += 32;
      if (v23 == (_DWORD)v24)
        return;
    }
    if ((int)v24 > 32)
    {
LABEL_27:
      _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", v13, v14, v15, v16, v17, v18, v5);
      return;
    }
    if ((v25 & 0x80000000) == 0)
    {
      v27 = (unint64_t)(v9 - 1);
      if (*a3 < (unint64_t)(v9 - 1))
      {
        do
        {
          if (CUIBitVectorIsBitSet((os_unfair_lock_s *)self->_bitmap, v25))
            return;
          ++*a3;
          v28 = self->_platform;
          v29 = objc_msgSend(objc_msgSend(a4, "objectAtIndex:"), "integerValue");
          v31 = self->_keyFormat;
          if ((_DWORD)v5 == 16 && v28 == -1)
          {
            v32 = v31->var2;
            if (!(_DWORD)v32)
              return;
            v33 = v31->var3;
            while (1)
            {
              v34 = *v33++;
              if (v34 == 16)
                break;
              if (!--v32)
                return;
            }
          }
          if (v5 <= 0x1C)
          {
            if ((_DWORD)v5 == 13)
            {
              LOWORD(v29) = (unsigned __int16)v29 != 0;
              goto LABEL_198;
            }
            if ((_DWORD)v5 == 16)
            {
              if (v28 != -1)
              {
                if (!(_WORD)v29)
                {
                  LOWORD(v29) = 0;
                  goto LABEL_198;
                }
                switch(v28)
                {
                  case 0uLL:
                    if ((unsigned __int16)v29 <= 0x7ABu)
                    {
                      if ((unsigned __int16)v29 == 1665)
                        goto LABEL_106;
                      if ((unsigned __int16)v29 != 1864)
                        goto LABEL_354;
                      goto LABEL_94;
                    }
                    if ((unsigned __int16)v29 == 1964)
                      goto LABEL_146;
                    if ((unsigned __int16)v29 != 2234)
                      goto LABEL_354;
                    goto LABEL_131;
                  case 3uLL:
                    if ((unsigned __int16)v29 == 3840)
                      goto LABEL_189;
                    if ((unsigned __int16)v29 == 1088)
                      goto LABEL_111;
                    if ((unsigned __int16)v29 != 720)
                      goto LABEL_354;
                    break;
                  case 4uLL:
                    if ((unsigned __int16)v29 <= 0x1ADu)
                    {
                      if ((unsigned __int16)v29 <= 0x17Fu)
                      {
                        if ((unsigned __int16)v29 == 320)
                          goto LABEL_160;
                        if ((unsigned __int16)v29 != 340)
                          goto LABEL_354;
                        goto LABEL_184;
                      }
                      if ((unsigned __int16)v29 == 384)
                        goto LABEL_168;
                      if ((unsigned __int16)v29 != 390)
                        goto LABEL_354;
                      goto LABEL_197;
                    }
                    if ((unsigned __int16)v29 <= 0x1E3u)
                    {
                      if ((unsigned __int16)v29 == 430)
                        goto LABEL_164;
                      if ((unsigned __int16)v29 != 446)
                        goto LABEL_354;
                      goto LABEL_163;
                    }
                    if ((unsigned __int16)v29 == 484)
                      goto LABEL_140;
                    if ((unsigned __int16)v29 != 496)
                    {
                      if ((unsigned __int16)v29 != 502)
                        goto LABEL_354;
                      goto LABEL_92;
                    }
                    goto LABEL_159;
                  case 5uLL:
                    if ((unsigned __int16)v29 == 3648)
                      goto LABEL_94;
                    goto LABEL_354;
                  default:
                    if (v28 > 2)
                      goto LABEL_354;
                    if ((unsigned __int16)v29 <= 0x983u)
                    {
                      if ((unsigned __int16)v29 <= 0x8AFu)
                      {
                        if ((unsigned __int16)v29 <= 0x239u)
                        {
                          if ((unsigned __int16)v29 == 163)
                            goto LABEL_111;
                          if ((unsigned __int16)v29 != 568)
                          {
                            if ((unsigned __int16)v29 != 569)
                              goto LABEL_354;
                            goto LABEL_170;
                          }
                          goto LABEL_94;
                        }
                        if ((unsigned __int16)v29 == 570)
                          goto LABEL_178;
                        if ((unsigned __int16)v29 != 1792)
                        {
                          if ((unsigned __int16)v29 != 2160)
                            goto LABEL_354;
                          goto LABEL_177;
                        }
                        goto LABEL_179;
                      }
                      if ((unsigned __int16)v29 <= 0x937u)
                      {
                        if ((unsigned __int16)v29 == 2224)
                          goto LABEL_171;
                        if ((unsigned __int16)v29 != 2266)
                        {
                          if ((unsigned __int16)v29 != 2340)
                            goto LABEL_354;
                          goto LABEL_154;
                        }
                        goto LABEL_172;
                      }
                      if ((unsigned __int16)v29 == 2360)
                        goto LABEL_190;
                      if ((unsigned __int16)v29 != 2388)
                      {
                        if ((unsigned __int16)v29 != 2420)
                          goto LABEL_354;
                        goto LABEL_189;
                      }
                      goto LABEL_191;
                    }
                    if ((unsigned __int16)v29 <= 0xABFu)
                    {
                      if ((unsigned __int16)v29 <= 0xA3Du)
                      {
                        if ((unsigned __int16)v29 == 2436)
                          goto LABEL_143;
                        if ((unsigned __int16)v29 != 2532)
                        {
                          if ((unsigned __int16)v29 != 2556)
                            goto LABEL_354;
                          goto LABEL_163;
                        }
                        goto LABEL_169;
                      }
                      if ((unsigned __int16)v29 == 2622)
                        goto LABEL_184;
                      if ((unsigned __int16)v29 != 2688)
                      {
                        if ((unsigned __int16)v29 != 2732)
                          goto LABEL_354;
                        goto LABEL_183;
                      }
                      goto LABEL_185;
                    }
                    if ((unsigned __int16)v29 <= 0xB33u)
                    {
                      if ((unsigned __int16)v29 == 2752)
                        goto LABEL_160;
                      if ((unsigned __int16)v29 != 2778)
                      {
                        if ((unsigned __int16)v29 != 2796)
                          goto LABEL_354;
                        goto LABEL_159;
                      }
                      goto LABEL_173;
                    }
                    if ((unsigned __int16)v29 == 2868)
                      goto LABEL_197;
                    if ((unsigned __int16)v29 != 3024)
                    {
                      if ((unsigned __int16)v29 != 32401)
LABEL_354:
                        -[CUINamedRenditionInfo decrementValue:forAttribute:].cold.2((uint64_t)v29, v28);
                      goto LABEL_195;
                    }
                    return;
                }
LABEL_196:
                LOWORD(v29) = 6;
                goto LABEL_198;
              }
              if ((unsigned __int16)v29 > 0x86Fu)
              {
                if ((unsigned __int16)v29 > 0x9E3u)
                {
                  if ((unsigned __int16)v29 > 0xAD9u)
                  {
                    if ((unsigned __int16)v29 > 0xEFFu)
                    {
                      if ((unsigned __int16)v29 == 3840)
                      {
LABEL_189:
                        LOWORD(v29) = 7;
                      }
                      else
                      {
                        if ((unsigned __int16)v29 != 32401)
LABEL_355:
                          -[CUINamedRenditionInfo decrementValue:forAttribute:].cold.1((uint64_t)v29, v30, v13, v14, v15, v16, v17, v18);
LABEL_195:
                        LOWORD(v29) = 17;
                      }
                    }
                    else if ((unsigned __int16)v29 == 2778)
                    {
LABEL_173:
                      LOWORD(v29) = 19;
                    }
                    else
                    {
                      if ((unsigned __int16)v29 != 2796)
                        goto LABEL_355;
LABEL_159:
                      LOWORD(v29) = 30;
                    }
                  }
                  else if ((unsigned __int16)v29 > 0xA7Fu)
                  {
                    if ((unsigned __int16)v29 == 2688)
                    {
LABEL_185:
                      LOWORD(v29) = 12;
                    }
                    else
                    {
                      if ((unsigned __int16)v29 != 2732)
                        goto LABEL_355;
LABEL_183:
                      LOWORD(v29) = 4;
                    }
                  }
                  else if ((unsigned __int16)v29 == 2532)
                  {
LABEL_169:
                    LOWORD(v29) = 22;
                  }
                  else
                  {
                    if ((unsigned __int16)v29 != 2556)
                      goto LABEL_355;
LABEL_163:
                    LOWORD(v29) = 29;
                  }
                }
                else if ((unsigned __int16)v29 > 0x923u)
                {
                  if ((unsigned __int16)v29 > 0x953u)
                  {
                    if ((unsigned __int16)v29 == 2388)
                    {
LABEL_191:
                      LOWORD(v29) = 15;
                    }
                    else
                    {
                      if ((unsigned __int16)v29 != 2436)
                        goto LABEL_355;
LABEL_143:
                      LOWORD(v29) = 11;
                    }
                  }
                  else if ((unsigned __int16)v29 == 2340)
                  {
LABEL_154:
                    LOWORD(v29) = 18;
                  }
                  else
                  {
                    if ((unsigned __int16)v29 != 2360)
                      goto LABEL_355;
LABEL_190:
                    LOWORD(v29) = 20;
                  }
                }
                else if ((unsigned __int16)v29 > 0x8B9u)
                {
                  if ((unsigned __int16)v29 == 2234)
                  {
LABEL_131:
                    LOWORD(v29) = 27;
                  }
                  else
                  {
                    if ((unsigned __int16)v29 != 2266)
                      goto LABEL_355;
LABEL_172:
                    LOWORD(v29) = 25;
                  }
                }
                else if ((unsigned __int16)v29 == 2160)
                {
LABEL_177:
                  LOWORD(v29) = 21;
                }
                else
                {
                  if ((unsigned __int16)v29 != 2224)
                    goto LABEL_355;
LABEL_171:
                  LOWORD(v29) = 10;
                }
              }
              else if ((unsigned __int16)v29 > 0x1F5u)
              {
                if ((unsigned __int16)v29 > 0x2CFu)
                {
                  if ((unsigned __int16)v29 > 0x6FFu)
                  {
                    if ((unsigned __int16)v29 == 1792)
                    {
LABEL_179:
                      LOWORD(v29) = 16;
                    }
                    else
                    {
                      if ((unsigned __int16)v29 != 1964)
                        goto LABEL_355;
LABEL_146:
                      LOWORD(v29) = 26;
                    }
                  }
                  else
                  {
                    if ((unsigned __int16)v29 == 720)
                      goto LABEL_196;
                    if ((unsigned __int16)v29 != 1665)
                      goto LABEL_355;
LABEL_106:
                    LOWORD(v29) = 31;
                  }
                }
                else if ((unsigned __int16)v29 > 0x238u)
                {
                  if ((unsigned __int16)v29 == 569)
                  {
LABEL_170:
                    LOWORD(v29) = 2;
                  }
                  else
                  {
                    if ((unsigned __int16)v29 != 570)
                      goto LABEL_355;
LABEL_178:
                    LOWORD(v29) = 3;
                  }
                }
                else if ((unsigned __int16)v29 == 502)
                {
LABEL_92:
                  LOWORD(v29) = 28;
                }
                else
                {
                  if ((unsigned __int16)v29 != 568)
                    goto LABEL_355;
LABEL_94:
                  LOWORD(v29) = 1;
                }
              }
              else if ((unsigned __int16)v29 > 0x17Fu)
              {
                if ((unsigned __int16)v29 > 0x1ADu)
                {
                  if ((unsigned __int16)v29 == 430)
                  {
LABEL_164:
                    LOWORD(v29) = 23;
                  }
                  else
                  {
                    if ((unsigned __int16)v29 != 484)
                      goto LABEL_355;
LABEL_140:
                    LOWORD(v29) = 24;
                  }
                }
                else if ((unsigned __int16)v29 == 384)
                {
LABEL_168:
                  LOWORD(v29) = 9;
                }
                else
                {
                  if ((unsigned __int16)v29 != 390)
                    goto LABEL_355;
LABEL_197:
                  LOWORD(v29) = 14;
                }
              }
              else if ((unsigned __int16)v29 > 0x13Fu)
              {
                if ((unsigned __int16)v29 == 320)
                {
LABEL_160:
                  LOWORD(v29) = 8;
                }
                else
                {
                  if ((unsigned __int16)v29 != 340)
                    goto LABEL_355;
LABEL_184:
                  LOWORD(v29) = 13;
                }
              }
              else if ((_WORD)v29)
              {
                if ((unsigned __int16)v29 != 163)
                  goto LABEL_355;
LABEL_111:
                LOWORD(v29) = 5;
              }
            }
            else if (((1 << v5) & 0x100600E6) != 0)
            {
              return;
            }
          }
LABEL_198:
          v35 = v31->var2;
          if (!v35)
            return;
          v36 = 0;
          v25 = (unsigned __int16)v29;
          v37 = v31->var3;
          while (v37[v36] != (_DWORD)v5)
          {
            v25 += 32;
            if (v35 == (_DWORD)++v36)
              return;
          }
          if ((int)v36 > 32)
            goto LABEL_27;
        }
        while (*a3 < v27 && (v25 & 0x80000000) == 0);
      }
    }
  }
}

+ (int)subtypeToIndexWithPlatform:(int64_t)a3 andInput:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int result;

  result = a4;
  if (a3 != -1)
  {
    if (!a4)
      return result;
    switch(a3)
    {
      case 0:
        if ((int)a4 <= 1963)
        {
          if (a4 == 1665)
            return 31;
          if (a4 != 1864)
            goto LABEL_70;
          return 1;
        }
        if (a4 == 1964)
          return 26;
        if (a4 != 2234)
          goto LABEL_70;
        return 27;
      case 3:
        if (a4 == 3840)
          return 7;
        if (a4 == 1088)
          return 5;
        if (a4 != 720)
          goto LABEL_70;
        return 6;
      case 4:
        if ((int)a4 > 429)
        {
          if ((int)a4 > 483)
          {
            if (a4 != 484)
            {
              if (a4 != 496)
              {
                if (a4 != 502)
                  goto LABEL_70;
                return 28;
              }
              return 30;
            }
            return 24;
          }
          if (a4 != 430)
          {
            if (a4 != 446)
              goto LABEL_70;
            return 29;
          }
          return 23;
        }
        if ((int)a4 <= 383)
        {
          if (a4 != 320)
          {
            if (a4 != 340)
              goto LABEL_70;
            return 13;
          }
          return 8;
        }
        if (a4 == 384)
          return 9;
        if (a4 != 390)
LABEL_70:
          -[CUINamedRenditionInfo attributePresent:withValue:].cold.2(a4, a3);
        return 14;
      case 5:
        if (a4 == 3648)
          return 1;
        goto LABEL_70;
      default:
        if ((unint64_t)a3 > 2)
          goto LABEL_70;
        if ((int)a4 <= 2435)
        {
          if ((int)a4 <= 2223)
          {
            if ((int)a4 <= 569)
            {
              if (a4 != 163)
              {
                if (a4 != 568)
                {
                  if (a4 != 569)
                    goto LABEL_70;
                  return 2;
                }
                return 1;
              }
              return 5;
            }
            if (a4 != 570)
            {
              if (a4 != 1792)
              {
                if (a4 != 2160)
                  goto LABEL_70;
                return 21;
              }
              return 16;
            }
            return 3;
          }
          if ((int)a4 <= 2359)
          {
            if (a4 != 2224)
            {
              if (a4 != 2266)
              {
                if (a4 != 2340)
                  goto LABEL_70;
                return 18;
              }
              return 25;
            }
            return 10;
          }
          if (a4 != 2360)
          {
            if (a4 != 2388)
            {
              if (a4 != 2420)
                goto LABEL_70;
              return 7;
            }
            return 15;
          }
          return 20;
        }
        if ((int)a4 <= 2751)
        {
          if ((int)a4 <= 2621)
          {
            if (a4 != 2436)
            {
              if (a4 != 2532)
              {
                if (a4 != 2556)
                  goto LABEL_70;
                return 29;
              }
              return 22;
            }
            return 11;
          }
          if (a4 != 2622)
          {
            if (a4 != 2688)
            {
              if (a4 != 2732)
                goto LABEL_70;
              return 4;
            }
            return 12;
          }
          return 13;
        }
        if ((int)a4 <= 2867)
        {
          if (a4 == 2752)
            return 8;
          if (a4 != 2778)
          {
            if (a4 != 2796)
              goto LABEL_70;
            return 30;
          }
          return 19;
        }
        if (a4 == 2868)
          return 14;
        if (a4 == 3024)
          return 6;
        if (a4 != 32401)
          goto LABEL_70;
        break;
    }
    return 17;
  }
  if ((int)a4 > 2159)
  {
    if ((int)a4 > 2531)
    {
      if ((int)a4 > 2777)
      {
        if ((int)a4 > 3839)
        {
          if (a4 == 3840)
            return 7;
          if (a4 == 32401)
            return 17;
        }
        else
        {
          if (a4 == 2778)
            return 19;
          if (a4 == 2796)
            return 30;
        }
      }
      else if ((int)a4 > 2687)
      {
        if (a4 == 2688)
          return 12;
        if (a4 == 2732)
          return 4;
      }
      else
      {
        if (a4 == 2532)
          return 22;
        if (a4 == 2556)
          return 29;
      }
    }
    else if ((int)a4 > 2339)
    {
      if ((int)a4 > 2387)
      {
        if (a4 == 2388)
          return 15;
        if (a4 == 2436)
          return 11;
      }
      else
      {
        if (a4 == 2340)
          return 18;
        if (a4 == 2360)
          return 20;
      }
    }
    else if ((int)a4 > 2233)
    {
      if (a4 == 2234)
        return 27;
      if (a4 == 2266)
        return 25;
    }
    else
    {
      if (a4 == 2160)
        return 21;
      if (a4 == 2224)
        return 10;
    }
    goto LABEL_105;
  }
  if ((int)a4 > 501)
  {
    if ((int)a4 <= 719)
    {
      if ((int)a4 > 568)
      {
        if (a4 == 569)
          return 2;
        if (a4 == 570)
          return 3;
      }
      else
      {
        if (a4 == 502)
          return 28;
        if (a4 == 568)
          return 1;
      }
      goto LABEL_105;
    }
    if ((int)a4 > 1791)
    {
      if (a4 == 1792)
        return 16;
      if (a4 == 1964)
        return 26;
      goto LABEL_105;
    }
    if (a4 != 720)
    {
      if (a4 == 1665)
        return 31;
      goto LABEL_105;
    }
    return 6;
  }
  else
  {
    if ((int)a4 <= 383)
    {
      if ((int)a4 > 319)
      {
        if (a4 == 320)
          return 8;
        if (a4 == 340)
          return 13;
      }
      else
      {
        if (!a4)
          return result;
        if (a4 == 163)
          return 5;
      }
      goto LABEL_105;
    }
    if ((int)a4 > 429)
    {
      if (a4 == 430)
        return 23;
      if (a4 == 484)
        return 24;
      goto LABEL_105;
    }
    if (a4 == 384)
      return 9;
    if (a4 != 390)
LABEL_105:
      -[CUINamedRenditionInfo attributePresent:withValue:].cold.1(a4, (uint64_t)a2, -1, a4, v4, v5, v6, v7);
    return 14;
  }
}

+ (int)subtypeFromIndexWithPlatform:(int64_t)a3 andIndex:(unsigned __int16)a4
{
  return __CUISubtypeFromIndex(a3, a4);
}

- (BOOL)containsVectorGlyphInterpolationSources
{
  if (-[CUINamedRenditionInfo containsVectorGlyphWithWeight:size:](self, "containsVectorGlyphWithWeight:size:", 1, 1)&& -[CUINamedRenditionInfo containsVectorGlyphWithWeight:size:](self, "containsVectorGlyphWithWeight:size:", 4, 1))
  {
    return -[CUINamedRenditionInfo containsVectorGlyphWithWeight:size:](self, "containsVectorGlyphWithWeight:size:", 9, 1);
  }
  else
  {
    return 0;
  }
}

- (BOOL)containsVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4
{
  unsigned __int16 v4;

  v4 = a4;
  return -[CUINamedRenditionInfo attributePresent:withValue:](self, "attributePresent:withValue:", 26, (unsigned __int16)a3) >= 1&& -[CUINamedRenditionInfo attributePresent:withValue:](self, "attributePresent:withValue:", 27, v4) > 0;
}

- (void)initWithKeyFormat:(uint64_t)a3 andPlatform:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(a1, (uint64_t)"CoreUI: %s CUIBitVectorSetBitRange() call went out of bounds", a3, a4, a5, a6, a7, a8, (uint64_t)"-[CUINamedRenditionInfo initWithKeyFormat:andPlatform:]");
  abort();
}

- (void)attributePresent:(uint64_t)a3 withValue:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(a1, (uint64_t)"CoreUI: %s got a device subtype that it doesn't know about %d in unknown platform", a3, a4, a5, a6, a7, a8, (uint64_t)"int __CUISubtypeToIndex(CUIThemeSchemaPlatform, CUIRenditionKeyUInteger)");
  abort();
}

- (void)attributePresent:(uint64_t)a1 withValue:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;

  v8 = OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_0((uint64_t)v8, (uint64_t)"CoreUI: %s got a device subtype %d is unknown for the platform %d:'%@'", v2, v3, v4, v5, v6, v7, (uint64_t)"int __CUISubtypeToIndex(CUIThemeSchemaPlatform, CUIRenditionKeyUInteger)");
  abort();
}

- (void)decrementValue:(uint64_t)a3 forAttribute:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(a1, (uint64_t)"CoreUI: %s got a device subtype that it doesn't know about %d in unknown platform", a3, a4, a5, a6, a7, a8, (uint64_t)"int __CUISubtypeToIndex(CUIThemeSchemaPlatform, CUIRenditionKeyUInteger)");
  abort();
}

- (void)decrementValue:(uint64_t)a1 forAttribute:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;

  v8 = OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_0((uint64_t)v8, (uint64_t)"CoreUI: %s got a device subtype %d is unknown for the platform %d:'%@'", v2, v3, v4, v5, v6, v7, (uint64_t)"int __CUISubtypeToIndex(CUIThemeSchemaPlatform, CUIRenditionKeyUInteger)");
  abort();
}

@end
