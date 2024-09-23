@implementation CUIRenditionKey

- (void)setThemeIdiom:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 15, a3);
}

- (int64_t)themeIdiom
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 15);
}

- (void)setThemeDisplayGamut:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 24, a3);
}

- (void)setThemeDirection:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 4, a3);
}

- (void)setThemeDeploymentTarget:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 25, a3);
}

- (void)setThemeSizeClassVertical:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 21, a3);
}

- (void)setThemeSizeClassHorizontal:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 20, a3);
}

- (void)dealloc
{
  _renditionkeytoken *key;
  objc_super v4;

  key = self->_key;
  if (key)
    free(key);
  v4.receiver = self;
  v4.super_class = (Class)CUIRenditionKey;
  -[CUIRenditionKey dealloc](&v4, sel_dealloc);
}

- (void)setThemeScale:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 12, a3);
}

- (int64_t)themeDeploymentTarget
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 25);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "initWithKeyList:", key);
}

- (CUIRenditionKey)initWithKeyList:(const _renditionkeytoken *)a3
{
  CUIRenditionKey *v4;
  CUIRenditionKey *v5;
  unsigned int v6;
  unsigned __int16 v7;
  _renditionkeytoken *stackKey;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CUIRenditionKey;
  v4 = -[CUIRenditionKey init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_highwaterKeyCount = 21;
    v6 = CUIRenditionKeyTokenCount((uint64_t)a3);
    v7 = v6;
    if (v6 <= v5->_highwaterKeyCount)
    {
      stackKey = v5->_stackKey;
    }
    else
    {
      stackKey = (_renditionkeytoken *)malloc_type_calloc(v6 + 1, 4uLL, 0x100004052888210uLL);
      v5->_key = stackKey;
      if (!stackKey)
      {

        return 0;
      }
      v5->_highwaterKeyCount = v7;
    }
    CUIRenditionKeyCopy(stackKey, a3, (unsigned __int16)(v7 + 1));
  }
  return v5;
}

- (const)keyList
{
  if (self->_key)
    return self->_key;
  else
    return self->_stackKey;
}

- (void)setThemeSubtype:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 16, a3);
}

- (void)setThemeMemoryClass:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 22, a3);
}

- (void)setThemeLocalization:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 13, a3);
}

- (void)setThemeGraphicsClass:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 23, a3);
}

- (void)setThemeAppearance:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 7, a3);
}

- (void)setThemeGlyphWeight:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 26, a3);
}

- (int64_t)themeIdentifier
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 17);
}

- (void)setThemePart:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 2, a3);
}

- (void)setThemeElement:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 1, a3);
}

- (int64_t)themePart
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 2);
}

- (void)setThemeGlyphSize:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 27, a3);
}

- (int64_t)themeAppearance
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 7);
}

- (void)setThemeDimension2:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 9, a3);
}

- (int64_t)themeDirection
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 4);
}

- (int64_t)themeGlyphWeight
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 26);
}

- (int64_t)themeGlyphSize
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 27);
}

+ (CUIRenditionKey)renditionKeyWithKeyList:(const _renditionkeytoken *)a3
{
  return -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", a3);
}

- (int64_t)themeLocalization
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 13);
}

- (int64_t)themeDisplayGamut
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 24);
}

- (int64_t)themeSizeClassVertical
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 21);
}

- (int64_t)themeSizeClassHorizontal
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 20);
}

+ (void)initialize
{
  if ((id)objc_opt_class(CUIRenditionKey, a2) == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

+ (id)renditionKey
{
  return objc_alloc_init(CUIRenditionKey);
}

- (void)_expandKeyIfNecessaryForCount:(uint64_t)a1
{
  __int16 v2;
  uint64_t v4;
  void *v5;
  void *v6;

  if (a1)
  {
    v2 = a2;
    v4 = *(unsigned __int16 *)(a1 + 104);
    if (v4 < a2)
    {
      v5 = malloc_type_calloc(v4 + 1, 4uLL, 0x100004052888210uLL);
      CUIRenditionKeyCopy(v5, *(_WORD **)(a1 + 96), (unsigned __int16)(*(_WORD *)(a1 + 104) + 1));
      v6 = *(void **)(a1 + 96);
      if (v6)
        free(v6);
      *(_QWORD *)(a1 + 96) = v5;
      *(_WORD *)(a1 + 104) = v2;
    }
  }
}

- (CUIRenditionKey)init
{
  int v3;

  v3 = 0;
  return -[CUIRenditionKey initWithKeyList:](self, "initWithKeyList:", &v3);
}

- (CUIRenditionKey)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int16 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _WORD *v14;
  unsigned __int16 *v15;
  unsigned int v16;
  unsigned int v17;
  CUIRenditionKey *v18;
  unint64_t v20;
  _OWORD v21[6];

  v20 = 0;
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v5 = (char *)objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("CUIRenditionKeyBytes"), &v20);
    v6 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("CUIRenditionKeyVersion"));
  }
  else
  {
    v5 = (char *)objc_msgSend(a3, "decodeBytesWithReturnedLength:", &v20);
    v6 = objc_msgSend(a3, "versionForClassName:", CFSTR("CUIRenditionKey"));
  }
  v7 = (uint64_t)v6;
  v8 = v20;
  v9 = v20 >> 2;
  memset(v21, 0, 92);
  if (v20 < 0x60)
  {
    v10 = (unsigned __int16 *)v21;
    if (v20 < 4)
      goto LABEL_11;
  }
  else
  {
    v10 = (unsigned __int16 *)malloc_type_calloc(v9 + 2, 4uLL, 0x100004052888210uLL);
  }
  v11 = 0;
  if (v9 <= 1)
    v12 = 1;
  else
    v12 = v9;
  do
  {
    *(_DWORD *)&v10[v11] = *(_DWORD *)&v5[v11 * 2];
    v11 += 2;
    --v12;
  }
  while (v12);
LABEL_11:
  if (v7 <= 0 && !CUIRenditionKeyValueForAttribute(v10, 1) && v8 >= 4)
  {
    if (v9 <= 1)
      v13 = 1;
    else
      v13 = v9;
    v14 = v10 + 1;
    v15 = (unsigned __int16 *)(v5 + 2);
    do
    {
      v16 = *(v15 - 1);
      v17 = *v15;
      v15 += 2;
      *(v14 - 1) = bswap32(v16) >> 16;
      *v14 = bswap32(v17) >> 16;
      v14 += 2;
      --v13;
    }
    while (v13);
  }
  v18 = -[CUIRenditionKey initWithKeyList:](self, "initWithKeyList:", v10);
  if (v10 != (unsigned __int16 *)v21)
    free(v10);
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  _renditionkeytoken *key;
  unsigned int v5;
  uint64_t v6;
  __int128 *v7;
  unint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[32];

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  v5 = CUIRenditionKeyTokenCount((uint64_t)key);
  v13 = 0u;
  memset(v14, 0, 28);
  v6 = v5;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  if (v5 < 0x18)
    v7 = &v10;
  else
    v7 = (__int128 *)malloc_type_calloc(v5 + 2, 4uLL, 0x100004052888210uLL);
  v8 = 0;
  v9 = v6 + 1;
  do
  {
    *(_renditionkeytoken *)((char *)v7 + v8) = key[v8 / 4];
    v8 += 4;
  }
  while (4 * v6 + 4 != v8);
  if (objc_msgSend(a3, "allowsKeyedCoding", v10, v11, v12, v13, *(_QWORD *)v14, *(_OWORD *)&v14[8], *(_QWORD *)&v14[24]))
  {
    objc_msgSend(a3, "encodeInteger:forKey:", +[CUIRenditionKey version](CUIRenditionKey, "version"), CFSTR("CUIRenditionKeyVersion"));
    objc_msgSend(a3, "encodeBytes:length:forKey:", v7, 4 * v9, CFSTR("CUIRenditionKeyBytes"));
  }
  else
  {
    objc_msgSend(a3, "encodeBytes:length:", v7, 4 * v9);
  }
  if (v7 != &v10)
    free(v7);
}

- (void)setValuesFromKeyList:(const _renditionkeytoken *)a3
{
  unsigned __int16 identifier;
  uint64_t v6;
  unsigned __int16 *p_value;
  __int16 v8;
  _renditionkeytoken *key;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int16 *i;
  uint64_t v19;

  identifier = a3->identifier;
  if (*a3)
  {
    v6 = 0;
    p_value = &a3[1].value;
    do
    {
      if (CUIRenditionKeyIndexForAttribute(&self->_key->identifier, identifier) != -1)
        ++v6;
      identifier = *(p_value - 1);
      v8 = *p_value | identifier;
      p_value += 2;
    }
    while (v8);
  }
  else
  {
    v6 = 0;
  }
  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  v10 = CUIRenditionKeyTokenCount((uint64_t)key);
  v11 = v10 - v6 + CUIRenditionKeyTokenCount((uint64_t)a3);
  if (v11 <= self->_highwaterKeyCount)
    goto LABEL_14;
  -[CUIRenditionKey _expandKeyIfNecessaryForCount:]((uint64_t)self, v11);
  if (v11 <= self->_highwaterKeyCount)
  {
    key = self->_key;
LABEL_14:
    for (i = &a3->value; ; i += 2)
    {
      if (*i)
      {
        CUIRenditionKeySetValueForAttribute(&key->identifier, *(i - 1), *i, (unsigned __int16)(v11 + 1));
      }
      else if (!*(i - 1))
      {
        return;
      }
    }
  }
  _CUILog(4, (uint64_t)"couldn't allocate memory!", v12, v13, v14, v15, v16, v17, v19);
}

- (void)copyValuesFromKeyList:(const _renditionkeytoken *)a3
{
  _renditionkeytoken *key;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  v6 = CUIRenditionKeyTokenCount((uint64_t)a3);
  v7 = v6;
  if (v6 > self->_highwaterKeyCount)
  {
    -[CUIRenditionKey _expandKeyIfNecessaryForCount:]((uint64_t)self, v6);
    if (v7 > self->_highwaterKeyCount)
    {
      _CUILog(4, (uint64_t)"couldn't allocate memory!", v8, v9, v10, v11, v12, v13, v14);
      return;
    }
    key = self->_key;
  }
  CUIRenditionKeyCopy(key, a3, (unsigned __int16)(v7 + 1));
}

- (void)removeValueForKeyTokenIdentifier:(int64_t)a3
{
  _renditionkeytoken *key;

  key = self->_key;
  if (!key)
    key = self->_stackKey;
  CUIRenditionKeySetValueForAttribute(&key->identifier, (unsigned __int16)a3, 0, (unsigned __int16)(self->_highwaterKeyCount + 1));
}

- (CUIRenditionKey)initWithThemeElement:(int64_t)a3 themePart:(int64_t)a4 themeSize:(int64_t)a5 themeDirection:(int64_t)a6 themeValue:(int64_t)a7 themeDimension1:(int64_t)a8 themeDimension2:(int64_t)a9 themeState:(int64_t)a10 themePresentationState:(int64_t)a11 themeLayer:(int64_t)a12 themeScale:(int64_t)a13 themeIdentifier:(int64_t)a14
{
  _OWORD v21[6];

  memset(v21, 0, 92);
  _CUIRenditionKeySetIntegerValueForAttribute((unsigned __int16 *)v21, 1, a3);
  _CUIRenditionKeySetIntegerValueForAttribute((unsigned __int16 *)v21, 2, a4);
  _CUIRenditionKeySetIntegerValueForAttribute((unsigned __int16 *)v21, 3, a5);
  _CUIRenditionKeySetIntegerValueForAttribute((unsigned __int16 *)v21, 4, a6);
  _CUIRenditionKeySetIntegerValueForAttribute((unsigned __int16 *)v21, 6, a7);
  _CUIRenditionKeySetIntegerValueForAttribute((unsigned __int16 *)v21, 8, a8);
  _CUIRenditionKeySetIntegerValueForAttribute((unsigned __int16 *)v21, 9, a9);
  _CUIRenditionKeySetIntegerValueForAttribute((unsigned __int16 *)v21, 10, a10);
  _CUIRenditionKeySetIntegerValueForAttribute((unsigned __int16 *)v21, 14, a11);
  _CUIRenditionKeySetIntegerValueForAttribute((unsigned __int16 *)v21, 11, a12);
  _CUIRenditionKeySetIntegerValueForAttribute((unsigned __int16 *)v21, 12, a13);
  _CUIRenditionKeySetIntegerValueForAttribute((unsigned __int16 *)v21, 17, a14);
  return -[CUIRenditionKey initWithKeyList:](self, "initWithKeyList:", v21);
}

- (int64_t)themeElement
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 1);
}

- (void)setThemeSize:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 3, a3);
}

- (int64_t)themeSize
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 3);
}

- (void)setThemeValue:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 6, a3);
}

- (int64_t)themeValue
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 6);
}

- (void)setThemePreviousValue:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 18, a3);
}

- (int64_t)themePreviousValue
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 18);
}

- (void)setThemeDimension1:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 8, a3);
}

- (int64_t)themeDimension1
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 8);
}

- (int64_t)themeDimension2
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 9);
}

- (void)setThemeState:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 10, a3);
}

- (int64_t)themeState
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 10);
}

- (void)setThemePreviousState:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 19, a3);
}

- (int64_t)themePreviousState
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 19);
}

- (void)setThemePresentationState:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 14, a3);
}

- (int64_t)themePresentationState
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 14);
}

- (void)setThemeLayer:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 11, a3);
}

- (int64_t)themeLayer
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 11);
}

- (int64_t)themeScale
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 12);
}

- (int64_t)themeSubtype
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 16);
}

- (int64_t)themeMemoryClass
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 22);
}

- (int64_t)themeGraphicsClass
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  return CUIRenditionKeyValueForAttribute(&key->identifier, 23);
}

- (void)setThemeIdentifier:(int64_t)a3
{
  _renditionkeytoken *key;

  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  _CUIRenditionKeySetIntegerValueForAttribute(&key->identifier, 17, a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIRenditionKey;
  return objc_msgSend(-[CUIRenditionKey description](&v3, sel_description), "stringByAppendingFormat:", CFSTR("\nelement: %ld,\npart: %ld,\nidentifier: %ld,\ndirection: %ld,\ndim1: %ld,\ndim2: %ld,\nsizeClassHorizontal: %ld,\nsizeClassVertical: %ld,\nidiom: %ld,\nsubtype: %ld,\nscale: %ld\ngamut: %ld\ntarget: %ld\nmemoryClass %ld\ngraphicsClass:%ld\ndeployment: %ld\nappearance identifier: %ld \nlocalization identifier: %ld \nglyph size: %ld \nglyph weight: %ld "), -[CUIRenditionKey themeElement](self, "themeElement"), -[CUIRenditionKey themePart](self, "themePart"), -[CUIRenditionKey themeIdentifier](self, "themeIdentifier"), -[CUIRenditionKey themeDirection](self, "themeDirection"), -[CUIRenditionKey themeDimension1](self, "themeDimension1"), -[CUIRenditionKey themeDimension2](self, "themeDimension2"), -[CUIRenditionKey themeSizeClassHorizontal](self, "themeSizeClassHorizontal"), -[CUIRenditionKey themeSizeClassVertical](self, "themeSizeClassVertical"), -[CUIRenditionKey themeIdiom](self, "themeIdiom"), -[CUIRenditionKey themeSubtype](self, "themeSubtype"), -[CUIRenditionKey themeScale](self, "themeScale"), -[CUIRenditionKey themeDisplayGamut](self, "themeDisplayGamut"), -[CUIRenditionKey themeDeploymentTarget](self, "themeDeploymentTarget"), -[CUIRenditionKey themeMemoryClass](self, "themeMemoryClass"), -[CUIRenditionKey themeGraphicsClass](self, "themeGraphicsClass"), -[CUIRenditionKey themeDeploymentTarget](self, "themeDeploymentTarget"),
           -[CUIRenditionKey themeAppearance](self, "themeAppearance"),
           -[CUIRenditionKey themeLocalization](self, "themeLocalization"),
           -[CUIRenditionKey themeGlyphSize](self, "themeGlyphSize"),
           -[CUIRenditionKey themeGlyphWeight](self, "themeGlyphWeight"));
}

- (id)nameOfAttributeName:(int)a3
{
  if ((a3 - 1) > 0x1A)
    return &stru_1E41B97C0;
  else
    return off_1E41B1D00[a3 - 1];
}

- (id)descriptionBasedOnKeyFormat:(const _renditionkeyfmt *)a3
{
  uint64_t var2;
  _renditionkeytoken *key;
  unsigned int *var3;
  __CFString *v7;
  int v8;
  unsigned int v9;
  id v10;

  var2 = a3->var2;
  if (self->_key)
    key = self->_key;
  else
    key = self->_stackKey;
  if (!(_DWORD)var2)
    return &stru_1E41B97C0;
  var3 = a3->var3;
  v7 = &stru_1E41B97C0;
  do
  {
    v9 = *(unsigned __int16 *)var3++;
    v8 = v9;
    v10 = -[CUIRenditionKey nameOfAttributeName:](self, "nameOfAttributeName:", v9);
    if (objc_msgSend(v10, "length"))
      v7 = (__CFString *)-[__CFString stringByAppendingString:](v7, "stringByAppendingString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %lu "), v10, CUIRenditionKeyValueForAttribute(&key->identifier, v8)));
    --var2;
  }
  while (var2);
  return v7;
}

@end
