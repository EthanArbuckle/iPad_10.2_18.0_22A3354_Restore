@implementation CUIPlaceholderCUINamedRenditionInfo

- (CUIPlaceholderCUINamedRenditionInfo)initWithData:(id)a3 keyFormat:(const _renditionkeyfmt *)a4 andPlatform:(int64_t)a5
{
  CUIPlaceholderCUINamedRenditionInfo *v8;
  _DWORD *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CUIPlaceholderCUINamedRenditionInfo;
  v8 = -[CUIPlaceholderCUINamedRenditionInfo init](&v11, sel_init);
  v8->_keyFormat = a4;
  v8->_platform = a5;
  v9 = (_DWORD *)objc_msgSend(a3, "bytes");
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

- (CUIPlaceholderCUINamedRenditionInfo)initWithKeyFormat:(const _renditionkeyfmt *)a3 andPlatform:(int64_t)a4
{
  id v6;
  unsigned int var2;
  unint64_t i;
  unsigned int v9;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int *var3;
  int v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CUIPlaceholderCUINamedRenditionInfo;
  v6 = -[CUIPlaceholderCUINamedRenditionInfo init](&v18, sel_init);
  *((_QWORD *)v6 + 1) = CUIBitVectorCreate(32 * a3->var2);
  *((_QWORD *)v6 + 2) = a3;
  *((_QWORD *)v6 + 3) = a4;
  var2 = a3->var2;
  if (var2)
  {
    for (i = 0; i < var2; ++i)
    {
      v9 = a3->var3[i];
      if (*((_QWORD *)v6 + 3) == -1 && v9 == 16)
      {
        if (var2 <= 1)
          v14 = 1;
        else
          v14 = var2;
        var3 = a3->var3;
        while (1)
        {
          v16 = *var3++;
          if (v16 == 16)
            break;
          if (!--v14)
            goto LABEL_23;
        }
      }
      if (v9 > 0x1C || ((1 << v9) & 0x100600E6) == 0)
      {
        v12 = 0;
        v13 = var2;
        if (var2 <= 1uLL)
          v13 = 1;
        while (a3->var3[v12] != v9)
        {
          if (v13 == (_DWORD)++v12)
            goto LABEL_23;
        }
        if ((int)v12 < 33)
          continue;
        _CUILog();
      }
LABEL_23:
      if ((CUIBitVectorSetBitRange(*((os_unfair_lock_s **)v6 + 1), 32 * (int)i, 32 * (int)i + 32) & 0x80000000) != 0)
        -[CUIPlaceholderCUINamedRenditionInfo initWithKeyFormat:andPlatform:].cold.1();
      var2 = a3->var2;
    }
  }
  return (CUIPlaceholderCUINamedRenditionInfo *)v6;
}

- (_QWORD)_initWithKeyFormat:(uint64_t)a3 bitmap:(uint64_t)a4 andPlatform:
{
  objc_super v7;

  if (result)
  {
    v7.receiver = result;
    v7.super_class = (Class)CUIPlaceholderCUINamedRenditionInfo;
    result = objc_msgSendSuper2(&v7, sel_init);
    result[1] = a3;
    result[2] = a2;
    result[3] = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CUIBitVectorDestroy((os_unfair_lock_s *)self->_bitmap);
  v3.receiver = self;
  v3.super_class = (Class)CUIPlaceholderCUINamedRenditionInfo;
  -[CUIPlaceholderCUINamedRenditionInfo dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id result;
  int64_t platform;
  const _renditionkeyfmt *keyFormat;
  objc_super v9;

  v5 = CUIBitVectorCopy((unsigned int *)self->_bitmap);
  result = +[CUIPlaceholderCUINamedRenditionInfo allocWithZone:](CUIPlaceholderCUINamedRenditionInfo, "allocWithZone:", a3);
  if (result)
  {
    keyFormat = self->_keyFormat;
    platform = self->_platform;
    v9.receiver = result;
    v9.super_class = (Class)CUIPlaceholderCUINamedRenditionInfo;
    result = -[CUIPlaceholderCUINamedRenditionInfo init](&v9, sel_init);
    *((_QWORD *)result + 1) = v5;
    *((_QWORD *)result + 2) = keyFormat;
    *((_QWORD *)result + 3) = platform;
  }
  return result;
}

- (id)archivedData
{
  _DWORD *v2;
  void *v3;
  size_t v5;
  uint64_t v6;
  int v7;

  v5 = 0;
  v2 = CUIBitVectorToData((os_unfair_lock_s *)self->_bitmap, &v5);
  v6 = 1;
  v7 = v5;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
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
  int v8;
  int v9;
  void *v10;
  void *v11;
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
  int v26;
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
        v8 = -[CUIPlaceholderCUINamedRenditionInfo contentPresentForAttribute:](self, "contentPresentForAttribute:");
        if (v8 != objc_msgSend(a3, "contentPresentForAttribute:", *(unsigned int *)(*((_QWORD *)a3 + 2) + 4 * v7 + 12)))break;
        v9 = -[CUIPlaceholderCUINamedRenditionInfo diverseContentPresentForAttribute:](self, "diverseContentPresentForAttribute:", self->_keyFormat->var3[v7]);
        if (v9 != objc_msgSend(a3, "diverseContentPresentForAttribute:", *(unsigned int *)(*((_QWORD *)a3 + 2) + 4 * v7 + 12)))break;
        if (-[CUIPlaceholderCUINamedRenditionInfo contentPresentForAttribute:](self, "contentPresentForAttribute:", self->_keyFormat->var3[v7]))
        {
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
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
                objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17));
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
                objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24));
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
  if (a3 == self)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[CUIPlaceholderCUINamedRenditionInfo isEqualToNamedRenditionInfo:](self, "isEqualToNamedRenditionInfo:", a3);
}

- (id)description
{
  _BYTE *v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = CUIBitVectorToString((os_unfair_lock_s *)self->_bitmap);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = (void *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p %s>"), NSStringFromClass(v5), self, v3);
  free(v3);
  return v6;
}

- (id)debugDescription
{
  const _renditionkeyfmt *keyFormat;
  void *v4;
  unint64_t v5;
  unsigned int *v6;
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  unint64_t platform;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  const _renditionkeyfmt *v20;
  void *v21;
  const char *v22;
  char __str[2048];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  bzero(__str, 0x800uLL);
  keyFormat = self->_keyFormat;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 32);
  objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "| Index |            Attribute             | Is Content Present | Is Diverse Content Present |            Values          |"));
  v21 = v4;
  objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "|-------|----------------------------------|--------------------|----------------------------|----------------------------|"));
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
      v8 = -[CUIPlaceholderCUINamedRenditionInfo contentPresentForAttribute:](self, "contentPresentForAttribute:", v7);
      v9 = -[CUIPlaceholderCUINamedRenditionInfo diverseContentPresentForAttribute:](self, "diverseContentPresentForAttribute:", v7);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
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
            objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16));
          }
          v15 = (v15 + 1);
        }
        while ((_DWORD)v15 != 32);
      }
      snprintf(__str, 0x800uLL, "| %-5d | %-32s | %-18d | %-26d | %-26s |", v5, v22, v8, v9, (const char *)objc_msgSend((id)objc_msgSend(v10, "componentsJoinedByString:", CFSTR(",")), "UTF8String"));
      objc_msgSend(v21, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", __str));

      ++v5;
      keyFormat = v20;
    }
    while (v5 < v20->var2);
  }
  v18 = (void *)objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));

  return v18;
}

- (id)bitwiseAndWith:(id)a3
{
  _DWORD *v4;
  CUIPlaceholderCUINamedRenditionInfo *v5;
  int64_t platform;
  const _renditionkeyfmt *keyFormat;
  objc_super v9;

  v4 = CUIBitVectorBitAnd((os_unfair_lock_s *)self->_bitmap, *((os_unfair_lock_s **)a3 + 1));
  v5 = [CUIPlaceholderCUINamedRenditionInfo alloc];
  if (v5)
  {
    keyFormat = self->_keyFormat;
    platform = self->_platform;
    v9.receiver = v5;
    v9.super_class = (Class)CUIPlaceholderCUINamedRenditionInfo;
    v5 = -[CUIPlaceholderCUINamedRenditionInfo init](&v9, sel_init);
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
  CUIPlaceholderCUINamedRenditionInfo *v11;
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
  v11 = [CUIPlaceholderCUINamedRenditionInfo alloc];
  if (v11)
  {
    v13 = self->_keyFormat;
    platform = self->_platform;
    v15.receiver = v11;
    v15.super_class = (Class)CUIPlaceholderCUINamedRenditionInfo;
    v11 = -[CUIPlaceholderCUINamedRenditionInfo init](&v15, sel_init);
    v11->_bitmap = v10;
    v11->_keyFormat = v13;
    v11->_platform = platform;
  }
  return v11;
}

- (int)attributePresent:(int)a3 withValue:(unsigned __int16)a4
{
  unint64_t platform;
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v8;
  unsigned int v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;

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
      v8 = *var3++;
      if (v8 == 16)
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
      *(_DWORD *)&a4 = a4 != 0;
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
              *(_DWORD *)&a4 = 24;
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
            *(_DWORD *)&a4 = 8;
            goto LABEL_21;
          }
          if (a4 == 384)
            goto LABEL_146;
          if (a4 != 390)
LABEL_92:
            -[CUIPlaceholderCUINamedRenditionInfo attributePresent:withValue:].cold.2(a4, platform);
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
                  *(_DWORD *)&a4 = 1;
                  goto LABEL_21;
                }
LABEL_89:
                *(_DWORD *)&a4 = 5;
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
                *(_DWORD *)&a4 = 16;
                goto LABEL_21;
              }
LABEL_156:
              *(_DWORD *)&a4 = 3;
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
                *(_DWORD *)&a4 = 25;
                goto LABEL_21;
              }
LABEL_149:
              *(_DWORD *)&a4 = 10;
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
            *(_DWORD *)&a4 = 20;
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
                  *(_DWORD *)&a4 = 29;
                  goto LABEL_21;
                }
LABEL_147:
                *(_DWORD *)&a4 = 22;
                goto LABEL_21;
              }
LABEL_121:
              *(_DWORD *)&a4 = 11;
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
              *(_DWORD *)&a4 = 12;
              goto LABEL_21;
            }
LABEL_162:
            *(_DWORD *)&a4 = 13;
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
            *(_DWORD *)&a4 = 19;
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
              *(_DWORD *)&a4 = 7;
              goto LABEL_21;
            }
            if (a4 == 32401)
            {
LABEL_173:
              *(_DWORD *)&a4 = 17;
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
              *(_DWORD *)&a4 = 30;
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
            *(_DWORD *)&a4 = 4;
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
            *(_DWORD *)&a4 = 15;
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
            *(_DWORD *)&a4 = 18;
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
          *(_DWORD *)&a4 = 27;
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
          *(_DWORD *)&a4 = 21;
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
            *(_DWORD *)&a4 = 2;
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
            *(_DWORD *)&a4 = 28;
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
          *(_DWORD *)&a4 = 26;
          goto LABEL_21;
        }
        goto LABEL_127;
      }
      if (a4 != 720)
      {
        if (a4 == 1665)
        {
LABEL_84:
          *(_DWORD *)&a4 = 31;
          goto LABEL_21;
        }
        goto LABEL_127;
      }
LABEL_174:
      *(_DWORD *)&a4 = 6;
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
          *(_DWORD *)&a4 = 23;
          goto LABEL_21;
        }
        if (a4 == 484)
          goto LABEL_118;
        goto LABEL_127;
      }
      if (a4 == 384)
      {
LABEL_146:
        *(_DWORD *)&a4 = 9;
        goto LABEL_21;
      }
      if (a4 != 390)
LABEL_127:
        -[CUIPlaceholderCUINamedRenditionInfo attributePresent:withValue:].cold.1();
LABEL_175:
      *(_DWORD *)&a4 = 14;
    }
  }
LABEL_21:
  v10 = keyFormat->var2;
  if (!v10)
    return -1;
  v11 = 0;
  v12 = keyFormat->var3;
  v13 = a4;
  while (v12[v11] != a3)
  {
    ++v11;
    v13 += 32;
    if (v10 == (_DWORD)v11)
      return -1;
  }
  if ((int)v11 >= 33)
  {
    _CUILog();
    return -1;
  }
  if ((v13 & 0x80000000) != 0)
    return -1;
  return CUIBitVectorIsBitSet((os_unfair_lock_s *)self->_bitmap, v13);
}

- (unsigned)getValueOfAttribute:(int)a3
{
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v8;
  unsigned __int16 result;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  int v15;

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
      v8 = *var3++;
      if (v8 == 16)
        break;
      if (!--var2)
        goto LABEL_10;
    }
  }
  if (a3 <= 0x1C && ((1 << a3) & 0x100600E6) != 0)
    goto LABEL_10;
  v10 = keyFormat->var2;
  if (!v10)
    goto LABEL_10;
  v11 = 0;
  v12 = 0;
  v13 = keyFormat->var3;
  while (v13[v12] != a3)
  {
    result = 0;
    ++v12;
    v11 += 32;
    if (v10 == (_DWORD)v12)
      goto LABEL_11;
  }
  if ((int)v12 >= 33)
  {
    _CUILog();
LABEL_10:
    result = 0;
    goto LABEL_11;
  }
  if ((v12 & 0x80000000) != 0)
    goto LABEL_10;
  v14 = CUIBitVectorBucketValue((os_unfair_lock_s *)self->_bitmap, v11);
  v15 = 0;
  while (((v14 >> v15) & 1) == 0)
  {
    result = 0;
    if (++v15 == 32)
      goto LABEL_11;
  }
  result = v15;
LABEL_11:
  if (a3 == 16)
    return __CUISubtypeFromIndex(self->_platform, result);
  return result;
}

- (unsigned)getClosestValueOfAttribute:(int)a3 withValue:(unsigned __int16)a4
{
  int v4;
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v8;
  unsigned __int16 v9;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  BOOL v16;

  v4 = a4;
  keyFormat = self->_keyFormat;
  if (a3 == 16 && self->_platform == -1)
  {
    var2 = keyFormat->var2;
    if (!(_DWORD)var2)
      return 0;
    var3 = keyFormat->var3;
    while (1)
    {
      v8 = *var3++;
      if (v8 == 16)
        break;
      if (!--var2)
        return 0;
    }
  }
  if (a3 <= 0x1C && ((1 << a3) & 0x100600E6) != 0)
    return 0;
  v11 = keyFormat->var2;
  if (!v11)
    return 0;
  v12 = 0;
  v13 = 0;
  v14 = keyFormat->var3;
  while (v14[v13] != a3)
  {
    v9 = 0;
    ++v13;
    v12 += 32;
    if (v11 == (_DWORD)v13)
      return v9;
  }
  if ((int)v13 >= 33)
  {
    _CUILog();
    return 0;
  }
  if ((v13 & 0x80000000) != 0)
    return 0;
  v15 = CUIBitVectorBucketValue((os_unfair_lock_s *)self->_bitmap, v12);
  while (((v15 >> v4) & 1) == 0)
  {
    v9 = 0;
    v16 = __OFSUB__(v4--, 1);
    if (v4 < 0 != v16)
      return v9;
  }
  return v4;
}

- (BOOL)contentPresentForAttribute:(int)a3
{
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int *v10;

  keyFormat = self->_keyFormat;
  if (a3 == 16 && self->_platform == -1)
  {
    var2 = keyFormat->var2;
    if (!(_DWORD)var2)
      return 0;
    var3 = keyFormat->var3;
    while (1)
    {
      v6 = *var3++;
      if (v6 == 16)
        break;
      if (!--var2)
        return 0;
    }
  }
  if ((a3 - 1) >= 0x1C || ((0x8030073u >> (a3 - 1)) & 1) == 0)
  {
    v7 = keyFormat->var2;
    if (v7)
    {
      v8 = 0;
      v9 = 0;
      v10 = keyFormat->var3;
      while (v10[v9] != a3)
      {
        ++v9;
        v8 += 32;
        if (v7 == (_DWORD)v9)
          return 0;
      }
      if ((int)v9 < 33)
      {
        if ((v9 & 0x80000000) == 0 && (int)CUIBitVectorNumberOfBitsSetInBucket((uint64_t)self->_bitmap, v8) > 0)
          return 1;
      }
      else
      {
        _CUILog();
      }
    }
  }
  return 0;
}

- (BOOL)contentEqualForAttribute:(int)a3 withRenditionInfo:(id)a4
{
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int *v12;
  int v13;

  keyFormat = self->_keyFormat;
  if (a3 == 16 && self->_platform == -1)
  {
    var2 = keyFormat->var2;
    if (!(_DWORD)var2)
      return 0;
    var3 = keyFormat->var3;
    while (1)
    {
      v8 = *var3++;
      if (v8 == 16)
        break;
      if (!--var2)
        return 0;
    }
  }
  if ((a3 - 1) >= 0x1C || ((0x8030073u >> (a3 - 1)) & 1) == 0)
  {
    v9 = keyFormat->var2;
    if (v9)
    {
      v10 = 0;
      v11 = 0;
      v12 = keyFormat->var3;
      while (v12[v11] != a3)
      {
        ++v11;
        v10 += 32;
        if (v9 == (_DWORD)v11)
          return 0;
      }
      if ((int)v11 < 33)
      {
        if ((v11 & 0x80000000) == 0)
        {
          v13 = CUIBitVectorBucketValue((os_unfair_lock_s *)self->_bitmap, v10);
          return v13 == CUIBitVectorBucketValue(*((os_unfair_lock_s **)a4 + 1), v10);
        }
      }
      else
      {
        _CUILog();
      }
    }
  }
  return 0;
}

- (BOOL)diverseContentPresentForAttribute:(int)a3
{
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int *v11;

  keyFormat = self->_keyFormat;
  if (a3 == 16 && self->_platform == -1)
  {
    var2 = keyFormat->var2;
    if (!(_DWORD)var2)
      return 0;
    var3 = keyFormat->var3;
    while (1)
    {
      v7 = *var3++;
      if (v7 == 16)
        break;
      if (!--var2)
        return 0;
    }
  }
  if ((a3 - 1) < 0x1C && ((0x8030073u >> (a3 - 1)) & 1) != 0)
    return 0;
  v8 = keyFormat->var2;
  if (!v8)
    return 0;
  v9 = 0;
  v10 = 0;
  v11 = keyFormat->var3;
  while (v11[v10] != a3)
  {
    ++v10;
    v9 += 32;
    if (v8 == (_DWORD)v10)
      return 0;
  }
  if ((int)v10 >= 33)
  {
    _CUILog();
    return 0;
  }
  return (v10 & 0x80000000) == 0
      && (CUIBitVectorNumberOfBitsSetInBucket((uint64_t)self->_bitmap, v9) != 1
       || CUIBitVectorIsBitSet((os_unfair_lock_s *)self->_bitmap, v9) != 1);
}

- (void)setAttributePresent:(int)a3 withValue:(unsigned __int16)a4
{
  unint64_t platform;
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;

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
      v8 = *var3++;
      if (v8 == 16)
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
    *(_DWORD *)&a4 = a4 != 0;
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
            *(_DWORD *)&a4 = 24;
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
          *(_DWORD *)&a4 = 8;
          goto LABEL_21;
        }
        if (a4 == 384)
          goto LABEL_146;
        if (a4 != 390)
LABEL_92:
          -[CUIPlaceholderCUINamedRenditionInfo attributePresent:withValue:].cold.2(a4, platform);
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
                *(_DWORD *)&a4 = 1;
                goto LABEL_21;
              }
LABEL_89:
              *(_DWORD *)&a4 = 5;
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
              *(_DWORD *)&a4 = 16;
              goto LABEL_21;
            }
LABEL_156:
            *(_DWORD *)&a4 = 3;
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
              *(_DWORD *)&a4 = 25;
              goto LABEL_21;
            }
LABEL_149:
            *(_DWORD *)&a4 = 10;
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
          *(_DWORD *)&a4 = 20;
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
                *(_DWORD *)&a4 = 29;
                goto LABEL_21;
              }
LABEL_147:
              *(_DWORD *)&a4 = 22;
              goto LABEL_21;
            }
LABEL_121:
            *(_DWORD *)&a4 = 11;
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
            *(_DWORD *)&a4 = 12;
            goto LABEL_21;
          }
LABEL_162:
          *(_DWORD *)&a4 = 13;
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
          *(_DWORD *)&a4 = 19;
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
            *(_DWORD *)&a4 = 7;
            goto LABEL_21;
          }
          if (a4 == 32401)
          {
LABEL_173:
            *(_DWORD *)&a4 = 17;
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
            *(_DWORD *)&a4 = 30;
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
          *(_DWORD *)&a4 = 4;
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
          *(_DWORD *)&a4 = 15;
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
          *(_DWORD *)&a4 = 18;
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
        *(_DWORD *)&a4 = 27;
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
        *(_DWORD *)&a4 = 21;
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
          *(_DWORD *)&a4 = 2;
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
          *(_DWORD *)&a4 = 28;
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
        *(_DWORD *)&a4 = 26;
        goto LABEL_21;
      }
      goto LABEL_127;
    }
    if (a4 != 720)
    {
      if (a4 == 1665)
      {
LABEL_84:
        *(_DWORD *)&a4 = 31;
        goto LABEL_21;
      }
      goto LABEL_127;
    }
LABEL_174:
    *(_DWORD *)&a4 = 6;
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
        *(_DWORD *)&a4 = 23;
        goto LABEL_21;
      }
      if (a4 == 484)
        goto LABEL_118;
      goto LABEL_127;
    }
    if (a4 == 384)
    {
LABEL_146:
      *(_DWORD *)&a4 = 9;
      goto LABEL_21;
    }
    if (a4 != 390)
LABEL_127:
      -[CUIPlaceholderCUINamedRenditionInfo attributePresent:withValue:].cold.1();
LABEL_175:
    *(_DWORD *)&a4 = 14;
  }
LABEL_21:
  v9 = keyFormat->var2;
  if (v9)
  {
    v10 = 0;
    v11 = keyFormat->var3;
    v12 = a4;
    while (v11[v10] != a3)
    {
      ++v10;
      v12 += 32;
      if (v9 == (_DWORD)v10)
        return;
    }
    if ((int)v10 < 33)
    {
      if ((v12 & 0x80000000) == 0)
        CUIBitVectorSetBit((os_unfair_lock_s *)self->_bitmap, v12);
    }
    else
    {
      _CUILog();
    }
  }
}

- (void)clearAttributePresent:(int)a3 withValue:(unsigned __int16)a4
{
  unint64_t platform;
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;

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
      v8 = *var3++;
      if (v8 == 16)
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
    *(_DWORD *)&a4 = a4 != 0;
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
            *(_DWORD *)&a4 = 24;
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
          *(_DWORD *)&a4 = 8;
          goto LABEL_21;
        }
        if (a4 == 384)
          goto LABEL_146;
        if (a4 != 390)
LABEL_92:
          -[CUIPlaceholderCUINamedRenditionInfo attributePresent:withValue:].cold.2(a4, platform);
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
                *(_DWORD *)&a4 = 1;
                goto LABEL_21;
              }
LABEL_89:
              *(_DWORD *)&a4 = 5;
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
              *(_DWORD *)&a4 = 16;
              goto LABEL_21;
            }
LABEL_156:
            *(_DWORD *)&a4 = 3;
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
              *(_DWORD *)&a4 = 25;
              goto LABEL_21;
            }
LABEL_149:
            *(_DWORD *)&a4 = 10;
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
          *(_DWORD *)&a4 = 20;
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
                *(_DWORD *)&a4 = 29;
                goto LABEL_21;
              }
LABEL_147:
              *(_DWORD *)&a4 = 22;
              goto LABEL_21;
            }
LABEL_121:
            *(_DWORD *)&a4 = 11;
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
            *(_DWORD *)&a4 = 12;
            goto LABEL_21;
          }
LABEL_162:
          *(_DWORD *)&a4 = 13;
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
          *(_DWORD *)&a4 = 19;
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
            *(_DWORD *)&a4 = 7;
            goto LABEL_21;
          }
          if (a4 == 32401)
          {
LABEL_173:
            *(_DWORD *)&a4 = 17;
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
            *(_DWORD *)&a4 = 30;
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
          *(_DWORD *)&a4 = 4;
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
          *(_DWORD *)&a4 = 15;
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
          *(_DWORD *)&a4 = 18;
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
        *(_DWORD *)&a4 = 27;
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
        *(_DWORD *)&a4 = 21;
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
          *(_DWORD *)&a4 = 2;
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
          *(_DWORD *)&a4 = 28;
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
        *(_DWORD *)&a4 = 26;
        goto LABEL_21;
      }
      goto LABEL_127;
    }
    if (a4 != 720)
    {
      if (a4 == 1665)
      {
LABEL_84:
        *(_DWORD *)&a4 = 31;
        goto LABEL_21;
      }
      goto LABEL_127;
    }
LABEL_174:
    *(_DWORD *)&a4 = 6;
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
        *(_DWORD *)&a4 = 23;
        goto LABEL_21;
      }
      if (a4 == 484)
        goto LABEL_118;
      goto LABEL_127;
    }
    if (a4 == 384)
    {
LABEL_146:
      *(_DWORD *)&a4 = 9;
      goto LABEL_21;
    }
    if (a4 != 390)
LABEL_127:
      -[CUIPlaceholderCUINamedRenditionInfo attributePresent:withValue:].cold.1();
LABEL_175:
    *(_DWORD *)&a4 = 14;
  }
LABEL_21:
  v9 = keyFormat->var2;
  if (v9)
  {
    v10 = 0;
    v11 = keyFormat->var3;
    v12 = a4;
    while (v11[v10] != a3)
    {
      ++v10;
      v12 += 32;
      if (v9 == (_DWORD)v10)
        return;
    }
    if ((int)v10 < 33)
    {
      if ((v12 & 0x80000000) == 0)
        CUIBitVectorUnSetBit((os_unfair_lock_s *)self->_bitmap, v12);
    }
    else
    {
      _CUILog();
    }
  }
}

- (unint64_t)numberOfBitsSet
{
  return (int)CUIBitVectorNumberOfBitsSet((os_unfair_lock_s *)self->_bitmap);
}

- (void)decrementValue:(int64_t *)a3 forAttribute:(int)a4
{
  int64_t v7;
  unint64_t platform;
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v12;
  unsigned int v13;
  int64_t v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int *v18;
  int64_t v19;
  unint64_t v20;
  const _renditionkeyfmt *v21;
  uint64_t v22;
  unsigned int *v23;
  int v24;
  unsigned __int16 v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int v30;
  int v31;
  unsigned int v32;

  v7 = *a3;
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
      v12 = *var3++;
      if (v12 == 16)
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
    LOWORD(v14) = (unsigned __int16)*a3 != 0;
    goto LABEL_22;
  }
  if (a4 == 16)
  {
    if (platform == -1)
    {
      v29 = (unsigned __int16)*a3;
      if (v29 > 0x86F)
      {
        if ((unsigned __int16)*a3 > 0x9E3u)
        {
          if ((unsigned __int16)*a3 > 0xAD9u)
          {
            if ((unsigned __int16)*a3 > 0xEFFu)
            {
              if (v29 == 3840)
              {
LABEL_347:
                LOWORD(v14) = 7;
                goto LABEL_22;
              }
              if (v29 == 32401)
                goto LABEL_353;
            }
            else
            {
              if (v29 == 2778)
                goto LABEL_331;
              if (v29 == 2796)
                goto LABEL_317;
            }
          }
          else if ((unsigned __int16)*a3 > 0xA7Fu)
          {
            if (v29 == 2688)
              goto LABEL_343;
            if (v29 == 2732)
            {
LABEL_341:
              LOWORD(v14) = 4;
              goto LABEL_22;
            }
          }
          else
          {
            if (v29 == 2532)
              goto LABEL_327;
            if (v29 == 2556)
              goto LABEL_321;
          }
        }
        else if ((unsigned __int16)*a3 > 0x923u)
        {
          if ((unsigned __int16)*a3 > 0x953u)
          {
            if (v29 == 2388)
              goto LABEL_349;
            if (v29 == 2436)
              goto LABEL_301;
          }
          else
          {
            if (v29 == 2340)
            {
LABEL_312:
              LOWORD(v14) = 18;
              goto LABEL_22;
            }
            if (v29 == 2360)
              goto LABEL_348;
          }
        }
        else if ((unsigned __int16)*a3 > 0x8B9u)
        {
          if (v29 == 2234)
          {
LABEL_289:
            LOWORD(v14) = 27;
            goto LABEL_22;
          }
          if (v29 == 2266)
            goto LABEL_330;
        }
        else
        {
          if (v29 == 2160)
          {
LABEL_335:
            LOWORD(v14) = 21;
            goto LABEL_22;
          }
          if (v29 == 2224)
            goto LABEL_329;
        }
      }
      else if ((unsigned __int16)*a3 > 0x1F5u)
      {
        if ((unsigned __int16)*a3 > 0x2CFu)
        {
          if ((unsigned __int16)*a3 > 0x6FFu)
          {
            if (v29 == 1792)
              goto LABEL_337;
            if (v29 == 1964)
            {
LABEL_304:
              LOWORD(v14) = 26;
              goto LABEL_22;
            }
          }
          else
          {
            if (v29 == 720)
            {
LABEL_354:
              LOWORD(v14) = 6;
              goto LABEL_22;
            }
            if (v29 == 1665)
            {
LABEL_264:
              LOWORD(v14) = 31;
              goto LABEL_22;
            }
          }
        }
        else if ((unsigned __int16)*a3 > 0x238u)
        {
          if (v29 == 569)
            goto LABEL_328;
          if (v29 == 570)
            goto LABEL_336;
        }
        else
        {
          if (v29 == 502)
          {
LABEL_238:
            LOWORD(v14) = 28;
            goto LABEL_22;
          }
          if (v29 == 568)
            goto LABEL_244;
        }
      }
      else if ((unsigned __int16)*a3 > 0x17Fu)
      {
        if ((unsigned __int16)*a3 > 0x1ADu)
        {
          if (v29 == 430)
            goto LABEL_322;
          if (v29 == 484)
            goto LABEL_298;
        }
        else
        {
          if (v29 == 384)
          {
LABEL_326:
            LOWORD(v14) = 9;
            goto LABEL_22;
          }
          if (v29 == 390)
          {
LABEL_355:
            LOWORD(v14) = 14;
            goto LABEL_22;
          }
        }
      }
      else if ((unsigned __int16)*a3 > 0x13Fu)
      {
        if (v29 == 320)
          goto LABEL_318;
        if (v29 == 340)
          goto LABEL_342;
      }
      else
      {
        v14 = *a3;
        if (!(unsigned __int16)*a3)
          goto LABEL_22;
        if (v29 == 163)
          goto LABEL_269;
      }
      -[CUIPlaceholderCUINamedRenditionInfo decrementValue:forAttribute:].cold.1();
    }
    if ((unsigned __int16)*a3)
    {
      switch(platform)
      {
        case 0uLL:
          v13 = (unsigned __int16)*a3;
          if (v13 <= 0x7AB)
          {
            if (v13 == 1665)
              goto LABEL_264;
            if (v13 != 1864)
              goto LABEL_272;
            goto LABEL_244;
          }
          if (v13 == 1964)
            goto LABEL_304;
          if (v13 != 2234)
            goto LABEL_272;
          goto LABEL_289;
        case 3uLL:
          v31 = (unsigned __int16)*a3;
          if (v31 == 3840)
            goto LABEL_347;
          if (v31 == 1088)
            goto LABEL_269;
          if (v31 != 720)
            goto LABEL_272;
          goto LABEL_354;
        case 4uLL:
          v30 = (unsigned __int16)*a3;
          if (v30 > 0x1AD)
          {
            if ((unsigned __int16)*a3 > 0x1E3u)
            {
              if (v30 != 484)
              {
                if (v30 != 496)
                {
                  if (v30 != 502)
                    goto LABEL_272;
                  goto LABEL_238;
                }
LABEL_317:
                LOWORD(v14) = 30;
                goto LABEL_22;
              }
LABEL_298:
              LOWORD(v14) = 24;
              goto LABEL_22;
            }
            if (v30 != 430)
            {
              if (v30 != 446)
                goto LABEL_272;
              goto LABEL_321;
            }
LABEL_322:
            LOWORD(v14) = 23;
            goto LABEL_22;
          }
          if ((unsigned __int16)*a3 <= 0x17Fu)
          {
            if (v30 != 320)
            {
              if (v30 != 340)
                goto LABEL_272;
LABEL_342:
              LOWORD(v14) = 13;
              goto LABEL_22;
            }
LABEL_318:
            LOWORD(v14) = 8;
            goto LABEL_22;
          }
          if (v30 == 384)
            goto LABEL_326;
          if (v30 != 390)
LABEL_272:
            -[CUIPlaceholderCUINamedRenditionInfo decrementValue:forAttribute:].cold.2(v7, platform);
          goto LABEL_355;
        case 5uLL:
          if ((unsigned __int16)*a3 == 3648)
            goto LABEL_244;
          goto LABEL_272;
        default:
          if (platform > 2)
            goto LABEL_272;
          v32 = (unsigned __int16)*a3;
          if (v32 <= 0x983)
          {
            if ((unsigned __int16)*a3 <= 0x8AFu)
            {
              if ((unsigned __int16)*a3 <= 0x239u)
              {
                if (v32 != 163)
                {
                  if (v32 != 568)
                  {
                    if (v32 != 569)
                      goto LABEL_272;
LABEL_328:
                    LOWORD(v14) = 2;
                    goto LABEL_22;
                  }
LABEL_244:
                  LOWORD(v14) = 1;
                  goto LABEL_22;
                }
LABEL_269:
                LOWORD(v14) = 5;
                goto LABEL_22;
              }
              if (v32 != 570)
              {
                if (v32 != 1792)
                {
                  if (v32 != 2160)
                    goto LABEL_272;
                  goto LABEL_335;
                }
LABEL_337:
                LOWORD(v14) = 16;
                goto LABEL_22;
              }
LABEL_336:
              LOWORD(v14) = 3;
              goto LABEL_22;
            }
            if ((unsigned __int16)*a3 <= 0x937u)
            {
              if (v32 != 2224)
              {
                if (v32 != 2266)
                {
                  if (v32 != 2340)
                    goto LABEL_272;
                  goto LABEL_312;
                }
LABEL_330:
                LOWORD(v14) = 25;
                goto LABEL_22;
              }
LABEL_329:
              LOWORD(v14) = 10;
              goto LABEL_22;
            }
            if (v32 != 2360)
            {
              if (v32 != 2388)
              {
                if (v32 != 2420)
                  goto LABEL_272;
                goto LABEL_347;
              }
LABEL_349:
              LOWORD(v14) = 15;
              goto LABEL_22;
            }
LABEL_348:
            LOWORD(v14) = 20;
            goto LABEL_22;
          }
          if ((unsigned __int16)*a3 <= 0xABFu)
          {
            if ((unsigned __int16)*a3 <= 0xA3Du)
            {
              if (v32 != 2436)
              {
                if (v32 != 2532)
                {
                  if (v32 != 2556)
                    goto LABEL_272;
LABEL_321:
                  LOWORD(v14) = 29;
                  goto LABEL_22;
                }
LABEL_327:
                LOWORD(v14) = 22;
                goto LABEL_22;
              }
LABEL_301:
              LOWORD(v14) = 11;
              goto LABEL_22;
            }
            if (v32 == 2622)
              goto LABEL_342;
            if (v32 != 2688)
            {
              if (v32 != 2732)
                goto LABEL_272;
              goto LABEL_341;
            }
LABEL_343:
            LOWORD(v14) = 12;
            goto LABEL_22;
          }
          if ((unsigned __int16)*a3 <= 0xB33u)
          {
            if (v32 == 2752)
              goto LABEL_318;
            if (v32 != 2778)
            {
              if (v32 != 2796)
                goto LABEL_272;
              goto LABEL_317;
            }
LABEL_331:
            LOWORD(v14) = 19;
            goto LABEL_22;
          }
          if (v32 == 2868)
            goto LABEL_355;
          if (v32 == 3024)
            goto LABEL_354;
          if (v32 != 32401)
            goto LABEL_272;
          break;
      }
LABEL_353:
      LOWORD(v14) = 17;
      goto LABEL_22;
    }
    LOWORD(v14) = 0;
  }
  else
  {
LABEL_20:
    v14 = *a3;
  }
LABEL_22:
  v15 = keyFormat->var2;
  if (v15)
  {
    v16 = 0;
    v17 = (unsigned __int16)v14;
    v18 = keyFormat->var3;
    while (v18[v16] != a4)
    {
      ++v16;
      v17 += 32;
      if (v15 == (_DWORD)v16)
        return;
    }
    if ((int)v16 > 32)
    {
LABEL_28:
      _CUILog();
      return;
    }
    if ((v17 & 0x80000000) == 0 && v7)
    {
      do
      {
        if (CUIBitVectorIsBitSet((os_unfair_lock_s *)self->_bitmap, v17))
          return;
        v19 = *a3 - 1;
        *a3 = v19;
        v21 = self->_keyFormat;
        v20 = self->_platform;
        if (a4 == 16 && v20 == -1)
        {
          v22 = v21->var2;
          if (!(_DWORD)v22)
            return;
          v23 = v21->var3;
          while (1)
          {
            v24 = *v23++;
            if (v24 == 16)
              break;
            if (!--v22)
              return;
          }
        }
        if (a4 > 0x1C)
        {
          v25 = v19;
          goto LABEL_200;
        }
        if (a4 == 13)
        {
          v25 = (unsigned __int16)v19 != 0;
          goto LABEL_200;
        }
        if (a4 == 16)
        {
          if (v20 != -1)
          {
            if (!(_WORD)v19)
            {
              v25 = 0;
              goto LABEL_200;
            }
            switch(v20)
            {
              case 0uLL:
                if ((unsigned __int16)v19 <= 0x7ABu)
                {
                  if ((unsigned __int16)v19 == 1665)
                    goto LABEL_108;
                  if ((unsigned __int16)v19 != 1864)
                    goto LABEL_356;
                  goto LABEL_96;
                }
                if ((unsigned __int16)v19 == 1964)
                  goto LABEL_148;
                if ((unsigned __int16)v19 != 2234)
                  goto LABEL_356;
                goto LABEL_133;
              case 3uLL:
                if ((unsigned __int16)v19 == 3840)
                  goto LABEL_191;
                if ((unsigned __int16)v19 == 1088)
                  goto LABEL_113;
                if ((unsigned __int16)v19 != 720)
                  goto LABEL_356;
                break;
              case 4uLL:
                if ((unsigned __int16)v19 <= 0x1ADu)
                {
                  if ((unsigned __int16)v19 <= 0x17Fu)
                  {
                    if ((unsigned __int16)v19 == 320)
                      goto LABEL_162;
                    if ((unsigned __int16)v19 != 340)
                      goto LABEL_356;
                    goto LABEL_186;
                  }
                  if ((unsigned __int16)v19 == 384)
                    goto LABEL_170;
                  if ((unsigned __int16)v19 != 390)
                    goto LABEL_356;
                  goto LABEL_199;
                }
                if ((unsigned __int16)v19 <= 0x1E3u)
                {
                  if ((unsigned __int16)v19 == 430)
                    goto LABEL_166;
                  if ((unsigned __int16)v19 != 446)
                    goto LABEL_356;
                  goto LABEL_165;
                }
                if ((unsigned __int16)v19 == 484)
                  goto LABEL_142;
                if ((unsigned __int16)v19 != 496)
                {
                  if ((unsigned __int16)v19 != 502)
                    goto LABEL_356;
                  goto LABEL_94;
                }
                goto LABEL_161;
              case 5uLL:
                if ((unsigned __int16)v19 == 3648)
                  goto LABEL_96;
                goto LABEL_356;
              default:
                if (v20 > 2)
                  goto LABEL_356;
                if ((unsigned __int16)v19 <= 0x983u)
                {
                  if ((unsigned __int16)v19 <= 0x8AFu)
                  {
                    if ((unsigned __int16)v19 <= 0x239u)
                    {
                      if ((unsigned __int16)v19 == 163)
                        goto LABEL_113;
                      if ((unsigned __int16)v19 != 568)
                      {
                        if ((unsigned __int16)v19 != 569)
                          goto LABEL_356;
                        goto LABEL_172;
                      }
                      goto LABEL_96;
                    }
                    if ((unsigned __int16)v19 == 570)
                      goto LABEL_180;
                    if ((unsigned __int16)v19 != 1792)
                    {
                      if ((unsigned __int16)v19 != 2160)
                        goto LABEL_356;
                      goto LABEL_179;
                    }
                    goto LABEL_181;
                  }
                  if ((unsigned __int16)v19 <= 0x937u)
                  {
                    if ((unsigned __int16)v19 == 2224)
                      goto LABEL_173;
                    if ((unsigned __int16)v19 != 2266)
                    {
                      if ((unsigned __int16)v19 != 2340)
                        goto LABEL_356;
                      goto LABEL_156;
                    }
                    goto LABEL_174;
                  }
                  if ((unsigned __int16)v19 == 2360)
                    goto LABEL_192;
                  if ((unsigned __int16)v19 != 2388)
                  {
                    if ((unsigned __int16)v19 != 2420)
                      goto LABEL_356;
                    goto LABEL_191;
                  }
                  goto LABEL_193;
                }
                if ((unsigned __int16)v19 <= 0xABFu)
                {
                  if ((unsigned __int16)v19 <= 0xA3Du)
                  {
                    if ((unsigned __int16)v19 == 2436)
                      goto LABEL_145;
                    if ((unsigned __int16)v19 != 2532)
                    {
                      if ((unsigned __int16)v19 != 2556)
                        goto LABEL_356;
                      goto LABEL_165;
                    }
                    goto LABEL_171;
                  }
                  if ((unsigned __int16)v19 == 2622)
                    goto LABEL_186;
                  if ((unsigned __int16)v19 != 2688)
                  {
                    if ((unsigned __int16)v19 != 2732)
                      goto LABEL_356;
                    goto LABEL_185;
                  }
                  goto LABEL_187;
                }
                if ((unsigned __int16)v19 <= 0xB33u)
                {
                  if ((unsigned __int16)v19 == 2752)
                    goto LABEL_162;
                  if ((unsigned __int16)v19 != 2778)
                  {
                    if ((unsigned __int16)v19 != 2796)
                      goto LABEL_356;
                    goto LABEL_161;
                  }
                  goto LABEL_175;
                }
                if ((unsigned __int16)v19 == 2868)
                  goto LABEL_199;
                if ((unsigned __int16)v19 != 3024)
                {
                  if ((unsigned __int16)v19 != 32401)
LABEL_356:
                    -[CUIPlaceholderCUINamedRenditionInfo decrementValue:forAttribute:].cold.2(v19, v20);
                  goto LABEL_197;
                }
                return;
            }
LABEL_198:
            v25 = 6;
            goto LABEL_200;
          }
          if ((unsigned __int16)v19 > 0x86Fu)
          {
            if ((unsigned __int16)v19 > 0x9E3u)
            {
              if ((unsigned __int16)v19 > 0xAD9u)
              {
                if ((unsigned __int16)v19 > 0xEFFu)
                {
                  if ((unsigned __int16)v19 == 3840)
                  {
LABEL_191:
                    v25 = 7;
                  }
                  else
                  {
                    if ((unsigned __int16)v19 != 32401)
LABEL_357:
                      -[CUIPlaceholderCUINamedRenditionInfo decrementValue:forAttribute:].cold.1();
LABEL_197:
                    v25 = 17;
                  }
                }
                else if ((unsigned __int16)v19 == 2778)
                {
LABEL_175:
                  v25 = 19;
                }
                else
                {
                  if ((unsigned __int16)v19 != 2796)
                    goto LABEL_357;
LABEL_161:
                  v25 = 30;
                }
              }
              else if ((unsigned __int16)v19 > 0xA7Fu)
              {
                if ((unsigned __int16)v19 == 2688)
                {
LABEL_187:
                  v25 = 12;
                }
                else
                {
                  if ((unsigned __int16)v19 != 2732)
                    goto LABEL_357;
LABEL_185:
                  v25 = 4;
                }
              }
              else if ((unsigned __int16)v19 == 2532)
              {
LABEL_171:
                v25 = 22;
              }
              else
              {
                if ((unsigned __int16)v19 != 2556)
                  goto LABEL_357;
LABEL_165:
                v25 = 29;
              }
            }
            else if ((unsigned __int16)v19 > 0x923u)
            {
              if ((unsigned __int16)v19 > 0x953u)
              {
                if ((unsigned __int16)v19 == 2388)
                {
LABEL_193:
                  v25 = 15;
                }
                else
                {
                  if ((unsigned __int16)v19 != 2436)
                    goto LABEL_357;
LABEL_145:
                  v25 = 11;
                }
              }
              else if ((unsigned __int16)v19 == 2340)
              {
LABEL_156:
                v25 = 18;
              }
              else
              {
                if ((unsigned __int16)v19 != 2360)
                  goto LABEL_357;
LABEL_192:
                v25 = 20;
              }
            }
            else if ((unsigned __int16)v19 > 0x8B9u)
            {
              if ((unsigned __int16)v19 == 2234)
              {
LABEL_133:
                v25 = 27;
              }
              else
              {
                if ((unsigned __int16)v19 != 2266)
                  goto LABEL_357;
LABEL_174:
                v25 = 25;
              }
            }
            else if ((unsigned __int16)v19 == 2160)
            {
LABEL_179:
              v25 = 21;
            }
            else
            {
              if ((unsigned __int16)v19 != 2224)
                goto LABEL_357;
LABEL_173:
              v25 = 10;
            }
          }
          else if ((unsigned __int16)v19 > 0x1F5u)
          {
            if ((unsigned __int16)v19 > 0x2CFu)
            {
              if ((unsigned __int16)v19 > 0x6FFu)
              {
                if ((unsigned __int16)v19 == 1792)
                {
LABEL_181:
                  v25 = 16;
                }
                else
                {
                  if ((unsigned __int16)v19 != 1964)
                    goto LABEL_357;
LABEL_148:
                  v25 = 26;
                }
              }
              else
              {
                if ((unsigned __int16)v19 == 720)
                  goto LABEL_198;
                if ((unsigned __int16)v19 != 1665)
                  goto LABEL_357;
LABEL_108:
                v25 = 31;
              }
            }
            else if ((unsigned __int16)v19 > 0x238u)
            {
              if ((unsigned __int16)v19 == 569)
              {
LABEL_172:
                v25 = 2;
              }
              else
              {
                if ((unsigned __int16)v19 != 570)
                  goto LABEL_357;
LABEL_180:
                v25 = 3;
              }
            }
            else if ((unsigned __int16)v19 == 502)
            {
LABEL_94:
              v25 = 28;
            }
            else
            {
              if ((unsigned __int16)v19 != 568)
                goto LABEL_357;
LABEL_96:
              v25 = 1;
            }
          }
          else if ((unsigned __int16)v19 > 0x17Fu)
          {
            if ((unsigned __int16)v19 > 0x1ADu)
            {
              if ((unsigned __int16)v19 == 430)
              {
LABEL_166:
                v25 = 23;
              }
              else
              {
                if ((unsigned __int16)v19 != 484)
                  goto LABEL_357;
LABEL_142:
                v25 = 24;
              }
            }
            else if ((unsigned __int16)v19 == 384)
            {
LABEL_170:
              v25 = 9;
            }
            else
            {
              if ((unsigned __int16)v19 != 390)
                goto LABEL_357;
LABEL_199:
              v25 = 14;
            }
          }
          else if ((unsigned __int16)v19 > 0x13Fu)
          {
            if ((unsigned __int16)v19 == 320)
            {
LABEL_162:
              v25 = 8;
            }
            else
            {
              if ((unsigned __int16)v19 != 340)
                goto LABEL_357;
LABEL_186:
              v25 = 13;
            }
          }
          else
          {
            v25 = v19;
            if ((_WORD)v19)
            {
              if ((unsigned __int16)v19 != 163)
                goto LABEL_357;
LABEL_113:
              v25 = 5;
            }
          }
        }
        else
        {
          v25 = v19;
          if (((1 << a4) & 0x100600E6) != 0)
            return;
        }
LABEL_200:
        v26 = v21->var2;
        if (!v26)
          return;
        v27 = 0;
        v17 = v25;
        v28 = v21->var3;
        while (v28[v27] != a4)
        {
          v17 += 32;
          if (v26 == (_DWORD)++v27)
            return;
        }
        if ((int)v27 > 32)
          goto LABEL_28;
      }
      while (v19 && (v17 & 0x80000000) == 0);
    }
  }
}

- (void)incrementIndex:(unint64_t *)a3 inValues:(id)a4 forAttribute:(int)a5
{
  uint64_t v9;
  unint64_t platform;
  uint64_t v11;
  const _renditionkeyfmt *keyFormat;
  uint64_t var2;
  unsigned int *var3;
  int v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  const _renditionkeyfmt *v23;
  uint64_t v24;
  unsigned int *v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int *v29;

  v9 = objc_msgSend(a4, "count");
  platform = self->_platform;
  v11 = objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", *a3), "integerValue");
  keyFormat = self->_keyFormat;
  if (a5 == 16 && platform == -1)
  {
    var2 = keyFormat->var2;
    if (!(_DWORD)var2)
      return;
    var3 = keyFormat->var3;
    while (1)
    {
      v15 = *var3++;
      if (v15 == 16)
        break;
      if (!--var2)
        return;
    }
  }
  if (a5 <= 0x1C)
  {
    if (((1 << a5) & 0x100600E6) != 0)
      return;
    if (a5 == 13)
    {
      LOWORD(v11) = (unsigned __int16)v11 != 0;
    }
    else if (a5 == 16)
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
        -[CUIPlaceholderCUINamedRenditionInfo decrementValue:forAttribute:].cold.1();
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
              -[CUIPlaceholderCUINamedRenditionInfo decrementValue:forAttribute:].cold.2(v11, platform);
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
  v16 = keyFormat->var2;
  if (v16)
  {
    v17 = 0;
    v18 = (unsigned __int16)v11;
    v19 = keyFormat->var3;
    while (v19[v17] != a5)
    {
      ++v17;
      v18 += 32;
      if (v16 == (_DWORD)v17)
        return;
    }
    if ((int)v17 > 32)
    {
LABEL_27:
      _CUILog();
      return;
    }
    if ((v18 & 0x80000000) == 0)
    {
      v20 = v9 - 1;
      if (*a3 < v9 - 1)
      {
        do
        {
          if (CUIBitVectorIsBitSet((os_unfair_lock_s *)self->_bitmap, v18))
            return;
          ++*a3;
          v21 = self->_platform;
          v22 = objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:"), "integerValue");
          v23 = self->_keyFormat;
          if (a5 == 16 && v21 == -1)
          {
            v24 = v23->var2;
            if (!(_DWORD)v24)
              return;
            v25 = v23->var3;
            while (1)
            {
              v26 = *v25++;
              if (v26 == 16)
                break;
              if (!--v24)
                return;
            }
          }
          if (a5 <= 0x1C)
          {
            if (a5 == 13)
            {
              LOWORD(v22) = (unsigned __int16)v22 != 0;
              goto LABEL_198;
            }
            if (a5 == 16)
            {
              if (v21 != -1)
              {
                if (!(_WORD)v22)
                {
                  LOWORD(v22) = 0;
                  goto LABEL_198;
                }
                switch(v21)
                {
                  case 0uLL:
                    if ((unsigned __int16)v22 <= 0x7ABu)
                    {
                      if ((unsigned __int16)v22 == 1665)
                        goto LABEL_106;
                      if ((unsigned __int16)v22 != 1864)
                        goto LABEL_354;
                      goto LABEL_94;
                    }
                    if ((unsigned __int16)v22 == 1964)
                      goto LABEL_146;
                    if ((unsigned __int16)v22 != 2234)
                      goto LABEL_354;
                    goto LABEL_131;
                  case 3uLL:
                    if ((unsigned __int16)v22 == 3840)
                      goto LABEL_189;
                    if ((unsigned __int16)v22 == 1088)
                      goto LABEL_111;
                    if ((unsigned __int16)v22 != 720)
                      goto LABEL_354;
                    break;
                  case 4uLL:
                    if ((unsigned __int16)v22 <= 0x1ADu)
                    {
                      if ((unsigned __int16)v22 <= 0x17Fu)
                      {
                        if ((unsigned __int16)v22 == 320)
                          goto LABEL_160;
                        if ((unsigned __int16)v22 != 340)
                          goto LABEL_354;
                        goto LABEL_184;
                      }
                      if ((unsigned __int16)v22 == 384)
                        goto LABEL_168;
                      if ((unsigned __int16)v22 != 390)
                        goto LABEL_354;
                      goto LABEL_197;
                    }
                    if ((unsigned __int16)v22 <= 0x1E3u)
                    {
                      if ((unsigned __int16)v22 == 430)
                        goto LABEL_164;
                      if ((unsigned __int16)v22 != 446)
                        goto LABEL_354;
                      goto LABEL_163;
                    }
                    if ((unsigned __int16)v22 == 484)
                      goto LABEL_140;
                    if ((unsigned __int16)v22 != 496)
                    {
                      if ((unsigned __int16)v22 != 502)
                        goto LABEL_354;
                      goto LABEL_92;
                    }
                    goto LABEL_159;
                  case 5uLL:
                    if ((unsigned __int16)v22 == 3648)
                      goto LABEL_94;
                    goto LABEL_354;
                  default:
                    if (v21 > 2)
                      goto LABEL_354;
                    if ((unsigned __int16)v22 <= 0x983u)
                    {
                      if ((unsigned __int16)v22 <= 0x8AFu)
                      {
                        if ((unsigned __int16)v22 <= 0x239u)
                        {
                          if ((unsigned __int16)v22 == 163)
                            goto LABEL_111;
                          if ((unsigned __int16)v22 != 568)
                          {
                            if ((unsigned __int16)v22 != 569)
                              goto LABEL_354;
                            goto LABEL_170;
                          }
                          goto LABEL_94;
                        }
                        if ((unsigned __int16)v22 == 570)
                          goto LABEL_178;
                        if ((unsigned __int16)v22 != 1792)
                        {
                          if ((unsigned __int16)v22 != 2160)
                            goto LABEL_354;
                          goto LABEL_177;
                        }
                        goto LABEL_179;
                      }
                      if ((unsigned __int16)v22 <= 0x937u)
                      {
                        if ((unsigned __int16)v22 == 2224)
                          goto LABEL_171;
                        if ((unsigned __int16)v22 != 2266)
                        {
                          if ((unsigned __int16)v22 != 2340)
                            goto LABEL_354;
                          goto LABEL_154;
                        }
                        goto LABEL_172;
                      }
                      if ((unsigned __int16)v22 == 2360)
                        goto LABEL_190;
                      if ((unsigned __int16)v22 != 2388)
                      {
                        if ((unsigned __int16)v22 != 2420)
                          goto LABEL_354;
                        goto LABEL_189;
                      }
                      goto LABEL_191;
                    }
                    if ((unsigned __int16)v22 <= 0xABFu)
                    {
                      if ((unsigned __int16)v22 <= 0xA3Du)
                      {
                        if ((unsigned __int16)v22 == 2436)
                          goto LABEL_143;
                        if ((unsigned __int16)v22 != 2532)
                        {
                          if ((unsigned __int16)v22 != 2556)
                            goto LABEL_354;
                          goto LABEL_163;
                        }
                        goto LABEL_169;
                      }
                      if ((unsigned __int16)v22 == 2622)
                        goto LABEL_184;
                      if ((unsigned __int16)v22 != 2688)
                      {
                        if ((unsigned __int16)v22 != 2732)
                          goto LABEL_354;
                        goto LABEL_183;
                      }
                      goto LABEL_185;
                    }
                    if ((unsigned __int16)v22 <= 0xB33u)
                    {
                      if ((unsigned __int16)v22 == 2752)
                        goto LABEL_160;
                      if ((unsigned __int16)v22 != 2778)
                      {
                        if ((unsigned __int16)v22 != 2796)
                          goto LABEL_354;
                        goto LABEL_159;
                      }
                      goto LABEL_173;
                    }
                    if ((unsigned __int16)v22 == 2868)
                      goto LABEL_197;
                    if ((unsigned __int16)v22 != 3024)
                    {
                      if ((unsigned __int16)v22 != 32401)
LABEL_354:
                        -[CUIPlaceholderCUINamedRenditionInfo decrementValue:forAttribute:].cold.2(v22, v21);
                      goto LABEL_195;
                    }
                    return;
                }
LABEL_196:
                LOWORD(v22) = 6;
                goto LABEL_198;
              }
              if ((unsigned __int16)v22 > 0x86Fu)
              {
                if ((unsigned __int16)v22 > 0x9E3u)
                {
                  if ((unsigned __int16)v22 > 0xAD9u)
                  {
                    if ((unsigned __int16)v22 > 0xEFFu)
                    {
                      if ((unsigned __int16)v22 == 3840)
                      {
LABEL_189:
                        LOWORD(v22) = 7;
                      }
                      else
                      {
                        if ((unsigned __int16)v22 != 32401)
LABEL_355:
                          -[CUIPlaceholderCUINamedRenditionInfo decrementValue:forAttribute:].cold.1();
LABEL_195:
                        LOWORD(v22) = 17;
                      }
                    }
                    else if ((unsigned __int16)v22 == 2778)
                    {
LABEL_173:
                      LOWORD(v22) = 19;
                    }
                    else
                    {
                      if ((unsigned __int16)v22 != 2796)
                        goto LABEL_355;
LABEL_159:
                      LOWORD(v22) = 30;
                    }
                  }
                  else if ((unsigned __int16)v22 > 0xA7Fu)
                  {
                    if ((unsigned __int16)v22 == 2688)
                    {
LABEL_185:
                      LOWORD(v22) = 12;
                    }
                    else
                    {
                      if ((unsigned __int16)v22 != 2732)
                        goto LABEL_355;
LABEL_183:
                      LOWORD(v22) = 4;
                    }
                  }
                  else if ((unsigned __int16)v22 == 2532)
                  {
LABEL_169:
                    LOWORD(v22) = 22;
                  }
                  else
                  {
                    if ((unsigned __int16)v22 != 2556)
                      goto LABEL_355;
LABEL_163:
                    LOWORD(v22) = 29;
                  }
                }
                else if ((unsigned __int16)v22 > 0x923u)
                {
                  if ((unsigned __int16)v22 > 0x953u)
                  {
                    if ((unsigned __int16)v22 == 2388)
                    {
LABEL_191:
                      LOWORD(v22) = 15;
                    }
                    else
                    {
                      if ((unsigned __int16)v22 != 2436)
                        goto LABEL_355;
LABEL_143:
                      LOWORD(v22) = 11;
                    }
                  }
                  else if ((unsigned __int16)v22 == 2340)
                  {
LABEL_154:
                    LOWORD(v22) = 18;
                  }
                  else
                  {
                    if ((unsigned __int16)v22 != 2360)
                      goto LABEL_355;
LABEL_190:
                    LOWORD(v22) = 20;
                  }
                }
                else if ((unsigned __int16)v22 > 0x8B9u)
                {
                  if ((unsigned __int16)v22 == 2234)
                  {
LABEL_131:
                    LOWORD(v22) = 27;
                  }
                  else
                  {
                    if ((unsigned __int16)v22 != 2266)
                      goto LABEL_355;
LABEL_172:
                    LOWORD(v22) = 25;
                  }
                }
                else if ((unsigned __int16)v22 == 2160)
                {
LABEL_177:
                  LOWORD(v22) = 21;
                }
                else
                {
                  if ((unsigned __int16)v22 != 2224)
                    goto LABEL_355;
LABEL_171:
                  LOWORD(v22) = 10;
                }
              }
              else if ((unsigned __int16)v22 > 0x1F5u)
              {
                if ((unsigned __int16)v22 > 0x2CFu)
                {
                  if ((unsigned __int16)v22 > 0x6FFu)
                  {
                    if ((unsigned __int16)v22 == 1792)
                    {
LABEL_179:
                      LOWORD(v22) = 16;
                    }
                    else
                    {
                      if ((unsigned __int16)v22 != 1964)
                        goto LABEL_355;
LABEL_146:
                      LOWORD(v22) = 26;
                    }
                  }
                  else
                  {
                    if ((unsigned __int16)v22 == 720)
                      goto LABEL_196;
                    if ((unsigned __int16)v22 != 1665)
                      goto LABEL_355;
LABEL_106:
                    LOWORD(v22) = 31;
                  }
                }
                else if ((unsigned __int16)v22 > 0x238u)
                {
                  if ((unsigned __int16)v22 == 569)
                  {
LABEL_170:
                    LOWORD(v22) = 2;
                  }
                  else
                  {
                    if ((unsigned __int16)v22 != 570)
                      goto LABEL_355;
LABEL_178:
                    LOWORD(v22) = 3;
                  }
                }
                else if ((unsigned __int16)v22 == 502)
                {
LABEL_92:
                  LOWORD(v22) = 28;
                }
                else
                {
                  if ((unsigned __int16)v22 != 568)
                    goto LABEL_355;
LABEL_94:
                  LOWORD(v22) = 1;
                }
              }
              else if ((unsigned __int16)v22 > 0x17Fu)
              {
                if ((unsigned __int16)v22 > 0x1ADu)
                {
                  if ((unsigned __int16)v22 == 430)
                  {
LABEL_164:
                    LOWORD(v22) = 23;
                  }
                  else
                  {
                    if ((unsigned __int16)v22 != 484)
                      goto LABEL_355;
LABEL_140:
                    LOWORD(v22) = 24;
                  }
                }
                else if ((unsigned __int16)v22 == 384)
                {
LABEL_168:
                  LOWORD(v22) = 9;
                }
                else
                {
                  if ((unsigned __int16)v22 != 390)
                    goto LABEL_355;
LABEL_197:
                  LOWORD(v22) = 14;
                }
              }
              else if ((unsigned __int16)v22 > 0x13Fu)
              {
                if ((unsigned __int16)v22 == 320)
                {
LABEL_160:
                  LOWORD(v22) = 8;
                }
                else
                {
                  if ((unsigned __int16)v22 != 340)
                    goto LABEL_355;
LABEL_184:
                  LOWORD(v22) = 13;
                }
              }
              else if ((_WORD)v22)
              {
                if ((unsigned __int16)v22 != 163)
                  goto LABEL_355;
LABEL_111:
                LOWORD(v22) = 5;
              }
            }
            else if (((1 << a5) & 0x100600E6) != 0)
            {
              return;
            }
          }
LABEL_198:
          v27 = v23->var2;
          if (!v27)
            return;
          v28 = 0;
          v18 = (unsigned __int16)v22;
          v29 = v23->var3;
          while (v29[v28] != a5)
          {
            v18 += 32;
            if (v27 == (_DWORD)++v28)
              return;
          }
          if ((int)v28 > 32)
            goto LABEL_27;
        }
        while (*a3 < v20 && (v18 & 0x80000000) == 0);
      }
    }
  }
}

+ (int)subtypeToIndexWithPlatform:(int64_t)a3 andInput:(unsigned __int16)a4
{
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
          -[CUIPlaceholderCUINamedRenditionInfo attributePresent:withValue:].cold.2(a4, a3);
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
      -[CUIPlaceholderCUINamedRenditionInfo attributePresent:withValue:].cold.1();
    return 14;
  }
}

+ (int)subtypeFromIndexWithPlatform:(int64_t)a3 andIndex:(unsigned __int16)a4
{
  return __CUISubtypeFromIndex(a3, a4);
}

- (BOOL)containsVectorGlyphInterpolationSources
{
  return -[CUIPlaceholderCUINamedRenditionInfo containsVectorGlyphWithWeight:size:](self, "containsVectorGlyphWithWeight:size:", 1, 1)&& -[CUIPlaceholderCUINamedRenditionInfo containsVectorGlyphWithWeight:size:](self, "containsVectorGlyphWithWeight:size:", 4, 1)&& -[CUIPlaceholderCUINamedRenditionInfo containsVectorGlyphWithWeight:size:](self, "containsVectorGlyphWithWeight:size:", 9, 1);
}

- (BOOL)containsVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4
{
  unsigned __int16 v4;

  v4 = a4;
  return -[CUIPlaceholderCUINamedRenditionInfo attributePresent:withValue:](self, "attributePresent:withValue:", 26, (unsigned __int16)a3) >= 1&& -[CUIPlaceholderCUINamedRenditionInfo attributePresent:withValue:](self, "attributePresent:withValue:", 27, v4) > 0;
}

- (void)initWithKeyFormat:andPlatform:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  abort();
}

- (void)attributePresent:withValue:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  abort();
}

- (void)attributePresent:(uint64_t)a1 withValue:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_0_2();
  abort();
}

- (void)decrementValue:forAttribute:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  abort();
}

- (void)decrementValue:(uint64_t)a1 forAttribute:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_2();
  abort();
}

@end
