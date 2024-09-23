@implementation _CUIThemeTextureRendition

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeTextureRendition;
  -[CUIThemeRendition dealloc](&v3, sel_dealloc);
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  id v6;
  uint64_t var10;
  char *v8;
  char *v9;
  int v10;
  char *v11;
  int v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unsigned int v16;
  _DWORD *v17;
  uint64_t v18;
  CUIRenditionKey *v19;
  objc_super v21;
  _OWORD v22[6];

  v21.receiver = self;
  v21.super_class = (Class)_CUIThemeTextureRendition;
  v6 = -[CUIThemeRendition _initWithCSIHeader:version:](&v21, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  var10 = a3->var10;
  v8 = (char *)&a3->var0 + 4 * a3->var11.var0 + var10;
  v10 = *((_DWORD *)v8 + 45);
  v9 = v8 + 180;
  if (v10 != 1415074898)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("CUIThemeRendition.m"), 2581, CFSTR("CoreUI: Expecting a kCSITextureDataSignature but didn't find it"));
    var10 = a3->var10;
  }
  if ((_DWORD)var10)
  {
    v11 = &v9[-var10];
    do
    {
      if (*(_DWORD *)v11 == 1014)
      {
        *((_QWORD *)v6 + 28) = *((unsigned int *)v11 + 3);
        *((_BYTE *)v6 + 232) = *((_DWORD *)v11 + 4) != 0;
      }
      v11 += *((unsigned int *)v11 + 1) + 8;
    }
    while (v11 < v9);
  }
  v12 = *((unsigned __int16 *)v9 + 10);
  v13 = *((unsigned int *)v9 + 2);
  v14 = objc_alloc_init((Class)TXRTextureInfo);
  *((_QWORD *)v6 + 30) = v14;
  objc_msgSend(v14, "setDimensions:", *(double *)&a3->var3);
  objc_msgSend(*((id *)v6 + 30), "setCubemap:", v12 == 5);
  objc_msgSend(*((id *)v6 + 30), "setPixelFormat:", v13);
  objc_msgSend(*((id *)v6 + 30), "setArrayLength:", *((unsigned int *)v9 + 4));
  objc_msgSend(*((id *)v6 + 30), "setMipmapLevelCount:", *((unsigned __int16 *)v9 + 11));
  if (*((_BYTE *)v6 + 232))
    v15 = 2;
  else
    v15 = *((_QWORD *)v6 + 28) == 2;
  objc_msgSend(*((id *)v6 + 30), "setAlphaInfo:", v15);
  *((_QWORD *)v6 + 31) = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", *((unsigned __int16 *)v9 + 11));
  if (*((_WORD *)v9 + 11))
  {
    v16 = 0;
    v17 = v9 + 24;
    do
    {
      memset(v22, 0, 92);
      if (*v17 >= 0x58u)
        v18 = 88;
      else
        v18 = *v17;
      __memcpy_chk(v22, v17 + 2, v18, 92);
      v19 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", v22);
      objc_msgSend(*((id *)v6 + 31), "addObject:", v19);

      v17 = (_DWORD *)((char *)v17 + *v17 + 8);
      ++v16;
    }
    while (v16 < *((unsigned __int16 *)v9 + 11));
  }
  return v6;
}

- (id)mipLevels
{
  return self->_textureMipLevels;
}

- (void)_setStructuredThemeStore:(id)a3
{
  objc_storeWeak((id *)&self->_sourceProvider, a3);
}

- (id)_texturedImageWithKey:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = objc_msgSend(objc_loadWeak((id *)&self->_sourceProvider), "renditionWithKey:", objc_msgSend(a3, "keyList"));
  v5 = objc_opt_class(_CUIThemeTextureImageRendition, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
  {
    v7 = (objc_class *)objc_opt_class(v3, v6);
    v8 = NSStringFromClass(v7);
    _CUILog(4, (uint64_t)"CoreUI: tried to find the TextureImageRendition but got back a '%@'", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    return 0;
  }
  return v3;
}

- (id)provideTextureInfo
{
  return self->_textureInfo;
}

- (int64_t)textureIntepretation
{
  return self->_textureInterpretation;
}

- (id)provideImageInfoAtLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5 withBufferAllocator:(id)a6
{
  id v10;
  id result;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD *v18;
  id v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = -[_CUIThemeTextureRendition mipLevels](self, "mipLevels", a3, a4, 0);
  result = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (result)
  {
    v12 = result;
    v13 = *(_QWORD *)v23;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v14);
        if (objc_msgSend(v15, "themeDimension2") == (id)a3)
        {
          v16 = -[_CUIThemeTextureRendition _texturedImageWithKey:](self, "_texturedImageWithKey:", v15);
          if (v16)
          {
            v17 = objc_msgSend(v16, "textureImages");
            if ((unint64_t)objc_msgSend(v17, "count") >= a5)
            {
              v18 = objc_msgSend(v17, "objectAtIndex:", a5);
              v19 = objc_msgSend(a6, "newBufferWithLength:", v18[3] * *((unsigned int *)v18 + 9));
              if (v19)
              {
                v20 = v19;
                -[CSITextureHelper expandIntoBuffer:error:]((uint64_t)v18, v19);
                v21 = objc_alloc_init((Class)TXRImageInfo);
                objc_msgSend(v21, "setOffset:", 0);
                objc_msgSend(v21, "setBuffer:", v20);
                objc_msgSend(v21, "setBytesPerRow:", v18[3]);
                objc_msgSend(v21, "setBytesPerImage:", *((unsigned int *)v18 + 10));
                objc_msgSend(v21, "setError:", 0);

                return v21;
              }
            }
          }
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      result = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v12 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceProvider);
}

@end
