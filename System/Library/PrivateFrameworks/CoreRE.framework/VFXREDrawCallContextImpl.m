@implementation VFXREDrawCallContextImpl

- (id)texture:(int)a3 :(id)a4
{
  id v6;
  TextureTableCollection *v7;
  TextureTableCollection *v8;
  TextureSource *var0;
  char *v10;
  uint64_t v11;
  char v12;
  unsigned __int8 *v13;
  int v14;
  TextureSource *var1;
  char *v16;
  uint64_t v17;
  char v18;
  unsigned __int8 *v19;
  int v20;
  TextureSource *var2;
  char *v22;
  uint64_t v23;
  char v24;
  unsigned __int8 *v25;
  int v26;
  TextureSource *var3;
  char *v28;
  uint64_t v29;
  char v30;
  unsigned __int8 *v31;
  int v32;
  TextureSource *var4;
  char *v34;
  uint64_t v35;
  char v36;
  unsigned __int8 *v37;
  int v38;
  TextureSource *var5;
  char *v40;
  uint64_t v41;
  char v42;
  unsigned __int8 *v43;
  int v44;
  TextureSource *var9;
  char *v46;
  uint64_t v47;
  char v48;
  unsigned __int8 *v49;
  int v50;
  TextureSource *var10;
  char *v52;
  uint64_t v53;
  char v54;
  unsigned __int8 *v55;
  int v56;
  TextureSource *v57;
  id v58;
  void *v59;
  id v61;
  uint64_t v62;

  v6 = a4;
  v7 = -[VFXREDrawCallContextImpl _textureTable](self, "_textureTable");
  v8 = v7;
  switch(a3)
  {
    case 0:
      var0 = v7->var0.var0.var0;
      v10 = (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      if (v10)
      {
        v11 = *v10;
        if (*v10)
        {
          v12 = v10[1];
          if (v12)
          {
            v13 = (unsigned __int8 *)(v10 + 2);
            do
            {
              v11 = 31 * v11 + v12;
              v14 = *v13++;
              v12 = v14;
            }
            while (v14);
          }
          v11 &= ~0x8000000000000000;
        }
      }
      else
      {
        v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v61 = (id)v11;
      (*(void (**)(uint64_t *__return_ptr, TextureSource *, id *))(*(_QWORD *)var0 + 32))(&v62, var0, &v61);
      if (!(_BYTE)v62)
        goto LABEL_78;
      v57 = v8->var0.var0.var0;
      goto LABEL_76;
    case 1:
      var1 = v7->var0.var0.var1;
      v16 = (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      if (v16)
      {
        v17 = *v16;
        if (*v16)
        {
          v18 = v16[1];
          if (v18)
          {
            v19 = (unsigned __int8 *)(v16 + 2);
            do
            {
              v17 = 31 * v17 + v18;
              v20 = *v19++;
              v18 = v20;
            }
            while (v20);
          }
          v17 &= ~0x8000000000000000;
        }
      }
      else
      {
        v17 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v61 = (id)v17;
      (*(void (**)(uint64_t *__return_ptr, TextureSource *, id *))(*(_QWORD *)var1 + 32))(&v62, var1, &v61);
      if (!(_BYTE)v62)
        goto LABEL_78;
      v57 = v8->var0.var0.var1;
      goto LABEL_76;
    case 2:
      var2 = v7->var0.var0.var2;
      v22 = (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      if (v22)
      {
        v23 = *v22;
        if (*v22)
        {
          v24 = v22[1];
          if (v24)
          {
            v25 = (unsigned __int8 *)(v22 + 2);
            do
            {
              v23 = 31 * v23 + v24;
              v26 = *v25++;
              v24 = v26;
            }
            while (v26);
          }
          v23 &= ~0x8000000000000000;
        }
      }
      else
      {
        v23 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v61 = (id)v23;
      (*(void (**)(uint64_t *__return_ptr, TextureSource *, id *))(*(_QWORD *)var2 + 32))(&v62, var2, &v61);
      if (!(_BYTE)v62)
        goto LABEL_78;
      v57 = v8->var0.var0.var2;
      goto LABEL_76;
    case 3:
      var3 = v7->var0.var0.var3;
      v28 = (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      if (v28)
      {
        v29 = *v28;
        if (*v28)
        {
          v30 = v28[1];
          if (v30)
          {
            v31 = (unsigned __int8 *)(v28 + 2);
            do
            {
              v29 = 31 * v29 + v30;
              v32 = *v31++;
              v30 = v32;
            }
            while (v32);
          }
          v29 &= ~0x8000000000000000;
        }
      }
      else
      {
        v29 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v61 = (id)v29;
      (*(void (**)(uint64_t *__return_ptr, TextureSource *, id *))(*(_QWORD *)var3 + 32))(&v62, var3, &v61);
      if (!(_BYTE)v62)
        goto LABEL_78;
      v57 = v8->var0.var0.var3;
      goto LABEL_76;
    case 4:
      var4 = v7->var0.var0.var4;
      v34 = (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      if (v34)
      {
        v35 = *v34;
        if (*v34)
        {
          v36 = v34[1];
          if (v36)
          {
            v37 = (unsigned __int8 *)(v34 + 2);
            do
            {
              v35 = 31 * v35 + v36;
              v38 = *v37++;
              v36 = v38;
            }
            while (v38);
          }
          v35 &= ~0x8000000000000000;
        }
      }
      else
      {
        v35 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v61 = (id)v35;
      (*(void (**)(uint64_t *__return_ptr, TextureSource *, id *))(*(_QWORD *)var4 + 32))(&v62, var4, &v61);
      if (!(_BYTE)v62)
        goto LABEL_78;
      v57 = v8->var0.var0.var4;
      goto LABEL_76;
    case 5:
      var5 = v7->var0.var0.var5;
      if (!var5)
        goto LABEL_78;
      v40 = (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      if (v40)
      {
        v41 = *v40;
        if (*v40)
        {
          v42 = v40[1];
          if (v42)
          {
            v43 = (unsigned __int8 *)(v40 + 2);
            do
            {
              v41 = 31 * v41 + v42;
              v44 = *v43++;
              v42 = v44;
            }
            while (v44);
          }
          v41 &= ~0x8000000000000000;
        }
      }
      else
      {
        v41 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v61 = (id)v41;
      (*(void (**)(uint64_t *__return_ptr, TextureSource *, id *))(*(_QWORD *)var5 + 32))(&v62, var5, &v61);
      if (!(_BYTE)v62)
        goto LABEL_78;
      v57 = v8->var0.var0.var5;
      goto LABEL_76;
    case 6:
      var9 = v7->var0.var0.var9;
      v46 = (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      if (v46)
      {
        v47 = *v46;
        if (*v46)
        {
          v48 = v46[1];
          if (v48)
          {
            v49 = (unsigned __int8 *)(v46 + 2);
            do
            {
              v47 = 31 * v47 + v48;
              v50 = *v49++;
              v48 = v50;
            }
            while (v50);
          }
          v47 &= ~0x8000000000000000;
        }
      }
      else
      {
        v47 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v61 = (id)v47;
      (*(void (**)(uint64_t *__return_ptr, TextureSource *, id *))(*(_QWORD *)var9 + 32))(&v62, var9, &v61);
      if (!(_BYTE)v62)
        goto LABEL_78;
      v57 = v8->var0.var0.var9;
      goto LABEL_76;
    case 7:
      var10 = v7->var0.var0.var10;
      if (!var10)
        goto LABEL_78;
      v52 = (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      if (v52)
      {
        v53 = *v52;
        if (*v52)
        {
          v54 = v52[1];
          if (v54)
          {
            v55 = (unsigned __int8 *)(v52 + 2);
            do
            {
              v53 = 31 * v53 + v54;
              v56 = *v55++;
              v54 = v56;
            }
            while (v56);
          }
          v53 &= ~0x8000000000000000;
        }
      }
      else
      {
        v53 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v61 = (id)v53;
      (*(void (**)(uint64_t *__return_ptr, TextureSource *, id *))(*(_QWORD *)var10 + 32))(&v62, var10, &v61);
      if (!(_BYTE)v62)
        goto LABEL_78;
      v57 = v8->var0.var0.var10;
LABEL_76:
      (*(void (**)(id *__return_ptr))(*(_QWORD *)v57 + 24))(&v61);
      v58 = v61;
      v59 = v58;
      if (v58)

      break;
    default:
LABEL_78:
      v59 = 0;
      break;
  }

  return v59;
}

- (id)buffer:(int)a3 :(id)a4 :(int64_t *)a5 :(int64_t *)a6
{
  id v10;
  _QWORD *v11;
  re::BufferTableReference *v12;
  _QWORD *v13;
  char *v14;
  uint64_t v15;
  char v16;
  unsigned __int8 *v17;
  int v18;
  uint64_t v19;
  void *Buffer;
  unint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v25;

  v10 = a4;
  v11 = -[VFXREDrawCallContextImpl _bufferTable](self, "_bufferTable");
  switch(a3)
  {
    case 0:
      v12 = (re::BufferTableReference *)(v11 + 66);
      goto LABEL_10;
    case 1:
      v12 = (re::BufferTableReference *)(v11 + 6);
      goto LABEL_10;
    case 2:
      v12 = (re::BufferTableReference *)(v11 + 12);
      goto LABEL_10;
    case 3:
      v12 = (re::BufferTableReference *)(v11 + 18);
      goto LABEL_10;
    case 4:
      v12 = (re::BufferTableReference *)(v11 + 24);
      goto LABEL_10;
    case 5:
      v12 = (re::BufferTableReference *)(v11 + 30);
      goto LABEL_10;
    case 6:
      v12 = (re::BufferTableReference *)(v11 + 54);
      goto LABEL_10;
    case 7:
      v12 = (re::BufferTableReference *)(v11 + 72);
LABEL_10:
      v13 = (_QWORD *)*((_QWORD *)v12 + 5);
      if (!v13)
        goto LABEL_20;
      v14 = (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      if (v14)
      {
        v15 = *v14;
        if (*v14)
        {
          v16 = v14[1];
          if (v16)
          {
            v17 = (unsigned __int8 *)(v14 + 2);
            do
            {
              v15 = 31 * v15 + v16;
              v18 = *v17++;
              v16 = v18;
            }
            while (v18);
          }
          v15 &= ~0x8000000000000000;
        }
      }
      else
      {
        v15 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v25 = v15;
      v19 = re::HashBrown<re::WeakStringID,re::IndexAndProtectionOptions,re::Hash<re::WeakStringID>,re::EqualTo<re::WeakStringID>,re::Hash<re::IndexAndProtectionOptions>,false>::find(v13, &v25);
      if (v19 == -1)
        goto LABEL_20;
      Buffer = (void *)re::BufferTableReference::getBuffer(v12, *(unsigned __int8 *)(v13[1] + 16 * v19 + 8));
      v22 = v21;
      v23 = Buffer;
      *a5 = v22;
      *a6 = HIDWORD(v22);
      break;
    default:
LABEL_20:
      v23 = 0;
      break;
  }

  return v23;
}

- (id)sampler:(int)a3 :(id)a4
{
  return 0;
}

- (const)constantData:(int)a3
{
  _QWORD *v3;
  const char *result;

  switch(a3)
  {
    case 1:
      v3 = -[VFXREDrawCallContextImpl _constantTable](self, "_constantTable");
      goto LABEL_8;
    case 5:
      v3 = -[VFXREDrawCallContextImpl _constantTable](self, "_constantTable") + 48;
      goto LABEL_8;
    case 8:
      v3 = -[VFXREDrawCallContextImpl _constantTable](self, "_constantTable") + 8;
      goto LABEL_8;
    case 9:
      v3 = -[VFXREDrawCallContextImpl _constantTable](self, "_constantTable") + 16;
      goto LABEL_8;
    case 10:
      v3 = -[VFXREDrawCallContextImpl _constantTable](self, "_constantTable") + 24;
LABEL_8:
      result = (const char *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)*v3 + 16))(*v3);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)constantOffsetAndSize:(int)a3 :(id)a4 :(int64_t *)a5 :(int64_t *)a6
{
  id v10;
  BOOL v11;
  uint64_t (***v12)(_QWORD, uint64_t *);
  char *v13;
  uint64_t v14;
  char v15;
  unsigned __int8 *v16;
  int v17;
  char *v18;
  char v19;
  unsigned __int8 *v20;
  int v21;
  char *v22;
  char v23;
  unsigned __int8 *v24;
  int v25;
  char *v26;
  char v27;
  unsigned __int8 *v28;
  int v29;
  char *v30;
  char v31;
  unsigned __int8 *v32;
  int v33;
  unsigned __int16 *v34;
  uint64_t v36;

  v10 = a4;
  v11 = 0;
  switch(a3)
  {
    case 1:
      v12 = *(uint64_t (****)(_QWORD, uint64_t *))-[VFXREDrawCallContextImpl _constantTable](self, "_constantTable");
      v13 = (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      if (!v13)
        goto LABEL_32;
      v14 = *v13;
      if (!*v13)
        goto LABEL_33;
      v15 = v13[1];
      if (v15)
      {
        v16 = (unsigned __int8 *)(v13 + 2);
        do
        {
          v14 = 31 * v14 + v15;
          v17 = *v16++;
          v15 = v17;
        }
        while (v17);
      }
      goto LABEL_31;
    case 5:
      v12 = *(uint64_t (****)(_QWORD, uint64_t *))(-[VFXREDrawCallContextImpl _constantTable](self, "_constantTable")+ 48);
      v18 = (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      if (!v18)
        goto LABEL_32;
      v14 = *v18;
      if (!*v18)
        goto LABEL_33;
      v19 = v18[1];
      if (v19)
      {
        v20 = (unsigned __int8 *)(v18 + 2);
        do
        {
          v14 = 31 * v14 + v19;
          v21 = *v20++;
          v19 = v21;
        }
        while (v21);
      }
      goto LABEL_31;
    case 8:
      v12 = *(uint64_t (****)(_QWORD, uint64_t *))(-[VFXREDrawCallContextImpl _constantTable](self, "_constantTable")+ 8);
      v22 = (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      if (!v22)
        goto LABEL_32;
      v14 = *v22;
      if (!*v22)
        goto LABEL_33;
      v23 = v22[1];
      if (v23)
      {
        v24 = (unsigned __int8 *)(v22 + 2);
        do
        {
          v14 = 31 * v14 + v23;
          v25 = *v24++;
          v23 = v25;
        }
        while (v25);
      }
      goto LABEL_31;
    case 9:
      v12 = *(uint64_t (****)(_QWORD, uint64_t *))(-[VFXREDrawCallContextImpl _constantTable](self, "_constantTable")+ 16);
      v26 = (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      if (!v26)
        goto LABEL_32;
      v14 = *v26;
      if (!*v26)
        goto LABEL_33;
      v27 = v26[1];
      if (v27)
      {
        v28 = (unsigned __int8 *)(v26 + 2);
        do
        {
          v14 = 31 * v14 + v27;
          v29 = *v28++;
          v27 = v29;
        }
        while (v29);
      }
      goto LABEL_31;
    case 10:
      v12 = *(uint64_t (****)(_QWORD, uint64_t *))(-[VFXREDrawCallContextImpl _constantTable](self, "_constantTable")+ 24);
      v30 = (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      if (v30)
      {
        v14 = *v30;
        if (*v30)
        {
          v31 = v30[1];
          if (v31)
          {
            v32 = (unsigned __int8 *)(v30 + 2);
            do
            {
              v14 = 31 * v14 + v31;
              v33 = *v32++;
              v31 = v33;
            }
            while (v33);
          }
LABEL_31:
          v14 &= ~0x8000000000000000;
        }
      }
      else
      {
LABEL_32:
        v14 = 0x7FFFFFFFFFFFFFFFLL;
      }
LABEL_33:
      v36 = v14;
      v34 = (unsigned __int16 *)(**v12)(v12, &v36);
      if (v34)
      {
        *a5 = *v34;
        *a6 = *((unsigned __int8 *)v34 + 2);
        v11 = 1;
      }
      else
      {
        v11 = 0;
      }
LABEL_36:

      return v11;
    default:
      goto LABEL_36;
  }
}

- (void)viewports:(const void *)a3 :(int64_t *)a4
{
  *a3 = *(const void **)(-[VFXREDrawCallContextImpl _viewports](self, "_viewports") + 16);
  *a4 = *(_QWORD *)(-[VFXREDrawCallContextImpl _viewports](self, "_viewports") + 8);
}

- (void)setLateLatchingPatchHandler:(id)a3
{
  id v4;

  v4 = a3;
  if (-[VFXREDrawCallContextImpl _patchHandler](self, "_patchHandler"))
    re::PatchHandler::setHandler((_QWORD *)-[VFXREDrawCallContextImpl _patchHandler](self, "_patchHandler"), v4);

}

- (VFXRERenderTargetInfo)renderTargetInfo
{
  VFXRERenderTargetInfoImpl *v3;

  v3 = objc_alloc_init(VFXRERenderTargetInfoImpl);
  -[VFXRERenderTargetInfoImpl set_renderTargetInfo:](v3, "set_renderTargetInfo:", -[VFXREDrawCallContextImpl _renderTargetInfo](self, "_renderTargetInfo"));
  return (VFXRERenderTargetInfo *)v3;
}

- (BOOL)isDrawingDepthOnly
{
  _BOOL4 v3;

  if (-[VFXREDrawCallContextImpl _isDepthOnly](self, "_isDepthOnly"))
    LOBYTE(v3) = 1;
  else
    return (-[VFXREDrawCallContextImpl _stateOverride](self, "_stateOverride") >> 1) & 1;
  return v3;
}

- (VFXStencilInfo)stencilInfo
{
  VFXREStencilInfoImpl *v3;
  void *v4;
  void *v5;
  char v7;
  unsigned __int8 v8[8];
  unsigned __int8 v9[8];
  unsigned __int8 v10;

  -[VFXREDrawCallContextImpl _stencilInfo](self, "_stencilInfo");
  if (!v8[0])
  {
    -[VFXREDrawCallContextImpl _stencilInfo](self, "_stencilInfo");
    if (!v7)
      return (VFXStencilInfo *)0;
  }
  v3 = objc_alloc_init(VFXREStencilInfoImpl);
  -[VFXREDrawCallContextImpl _stencilInfo](self, "_stencilInfo");
  __39__VFXREDrawCallContextImpl_stencilInfo__block_invoke(v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VFXREStencilInfoImpl set_frontFaceTest:](v3, "set_frontFaceTest:", v4);

  -[VFXREDrawCallContextImpl _stencilInfo](self, "_stencilInfo");
  __39__VFXREDrawCallContextImpl_stencilInfo__block_invoke(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VFXREStencilInfoImpl set_backFaceTest:](v3, "set_backFaceTest:", v5);

  -[VFXREDrawCallContextImpl _stencilInfo](self, "_stencilInfo");
  -[VFXREStencilInfoImpl set_frontReferenceValue:](v3, "set_frontReferenceValue:", v10);
  -[VFXREDrawCallContextImpl _stencilInfo](self, "_stencilInfo");
  -[VFXREStencilInfoImpl set_backReferenceValue:](v3, "set_backReferenceValue:", v10);
  return (VFXStencilInfo *)v3;
}

id __39__VFXREDrawCallContextImpl_stencilInfo__block_invoke(unsigned __int8 *a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDDD718]);
  objc_msgSend(v2, "setStencilCompareFunction:", a1[3]);
  objc_msgSend(v2, "setStencilFailureOperation:", a1[4]);
  objc_msgSend(v2, "setDepthFailureOperation:", a1[5]);
  objc_msgSend(v2, "setDepthStencilPassOperation:", a1[6]);
  objc_msgSend(v2, "setReadMask:", a1[1]);
  objc_msgSend(v2, "setWriteMask:", a1[2]);
  return v2;
}

- (BOOL)useDitherFade
{
  const void *v3;

  v3 = -[VFXREDrawCallContextImpl _dynamicFunctionConstants](self, "_dynamicFunctionConstants");
  if (v3)
    LOBYTE(v3) = *(_BYTE *)(-[VFXREDrawCallContextImpl _dynamicFunctionConstants](self, "_dynamicFunctionConstants") + 24) & 1;
  return (char)v3;
}

- (BOOL)enableClipping
{
  const void *v3;

  v3 = -[VFXREDrawCallContextImpl _dynamicFunctionConstants](self, "_dynamicFunctionConstants");
  if (v3)
    LODWORD(v3) = (*(unsigned __int8 *)(-[VFXREDrawCallContextImpl _dynamicFunctionConstants](self, "_dynamicFunctionConstants")+ 24) >> 1) & 1;
  return (char)v3;
}

- (BOOL)renderForBlur
{
  return 0;
}

- (BOOL)enableBreakthrough
{
  return 0;
}

- (BOOL)enableNearFieldVignetting
{
  return 0;
}

- (int)portalClippingMode
{
  unsigned __int8 v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  re *v8;
  const char *v9;
  uint64_t v11;

  v3 = atomic_load((unsigned __int8 *)&qword_254118DD0);
  if ((v3 & 1) == 0)
  {
    v8 = (re *)__cxa_guard_acquire(&qword_254118DD0);
    if ((_DWORD)v8)
    {
      qword_254118DC8 = re::hashString(v8, v9);
      __cxa_guard_release(&qword_254118DD0);
    }
  }
  v4 = -[VFXREDrawCallContextImpl _dynamicFunctionConstants](self, "_dynamicFunctionConstants");
  if (v4)
  {
    v5 = *(_QWORD **)-[VFXREDrawCallContextImpl _dynamicFunctionConstants](self, "_dynamicFunctionConstants");
    if ((!v5
       || (v11 = qword_254118DC8,
           v4 = re::HashBrown<re::WeakStringID,re::IndexAndProtectionOptions,re::Hash<re::WeakStringID>,re::EqualTo<re::WeakStringID>,re::Hash<re::IndexAndProtectionOptions>,false>::find(v5, &v11), v4 == -1))&& ((v5 = *(_QWORD **)(-[VFXREDrawCallContextImpl _dynamicFunctionConstants](self, "_dynamicFunctionConstants") + 8)) == 0|| (v11 = qword_254118DC8, v4 = re::HashBrown<re::WeakStringID,re::IndexAndProtectionOptions,re::Hash<re::WeakStringID>,re::EqualTo<re::WeakStringID>,re::Hash<re::IndexAndProtectionOptions>,false>::find(v5, &v11), v4 == -1)))
    {
      v7 = *(_QWORD **)(-[VFXREDrawCallContextImpl _dynamicFunctionConstants](self, "_dynamicFunctionConstants") + 16);
      if (!v7
        || (v11 = qword_254118DC8,
            v4 = re::HashBrown<re::WeakStringID,re::IndexAndProtectionOptions,re::Hash<re::WeakStringID>,re::EqualTo<re::WeakStringID>,re::Hash<re::IndexAndProtectionOptions>,false>::find(v7, &v11), v4 == -1))
      {
        LODWORD(v4) = 0;
        return v4;
      }
      v6 = v7[1];
    }
    else
    {
      v6 = v5[1];
    }
    LODWORD(v4) = *(_DWORD *)(v6 + 16 * v4 + 8);
  }
  return v4;
}

- (BOOL)depthOnly
{
  _BOOL4 v3;

  if (-[VFXREDrawCallContextImpl _isDepthOnly](self, "_isDepthOnly"))
    LOBYTE(v3) = 1;
  else
    return (-[VFXREDrawCallContextImpl _stateOverride](self, "_stateOverride") >> 1) & 1;
  return v3;
}

- (int64_t)statsVertexCount
{
  int64_t result;

  result = -[VFXREDrawCallContextImpl _meshStats](self, "_meshStats");
  if (result)
    return *(int *)(result + 64);
  return result;
}

- (void)setStatsVertexCount:(int64_t)a3
{
  int v3;
  MeshStats *v4;

  v3 = a3;
  v4 = -[VFXREDrawCallContextImpl _meshStats](self, "_meshStats");
  if (v4)
    v4->var16 = v3;
}

- (int64_t)statsPrimitiveCount
{
  int64_t result;

  result = -[VFXREDrawCallContextImpl _meshStats](self, "_meshStats");
  if (result)
    return *(int *)(result + 60);
  return result;
}

- (void)setStatsPrimitiveCount:(int64_t)a3
{
  int v3;
  MeshStats *v4;

  v3 = a3;
  v4 = -[VFXREDrawCallContextImpl _meshStats](self, "_meshStats");
  if (v4)
    v4->var15 = v3;
}

- (int64_t)statsDrawcallCount
{
  int64_t result;

  result = -[VFXREDrawCallContextImpl _meshStats](self, "_meshStats");
  if (result)
    return *(int *)(result + 56);
  return result;
}

- (void)setStatsDrawcallCount:(int64_t)a3
{
  int v3;
  MeshStats *v4;

  v3 = a3;
  v4 = -[VFXREDrawCallContextImpl _meshStats](self, "_meshStats");
  if (v4)
    v4->var14 = v3;
}

- (TextureTableCollection)_textureTable
{
  return self->__textureTable;
}

- (void)set_textureTable:(TextureTableCollection *)a3
{
  self->__textureTable = a3;
}

- (void)_bufferTable
{
  return self->__bufferTable;
}

- (void)set_bufferTable:(void *)a3
{
  self->__bufferTable = a3;
}

- (void)_samplerTable
{
  return self->__samplerTable;
}

- (void)set_samplerTable:(void *)a3
{
  self->__samplerTable = a3;
}

- (void)_constantTable
{
  return self->__constantTable;
}

- (void)set_constantTable:(void *)a3
{
  self->__constantTable = a3;
}

- (const)_viewports
{
  return self->__viewports;
}

- (void)set_viewports:(const void *)a3
{
  self->__viewports = a3;
}

- (const)_renderTargetInfo
{
  return self->__renderTargetInfo;
}

- (void)set_renderTargetInfo:(const RenderTargetInfo *)a3
{
  self->__renderTargetInfo = a3;
}

- (const)_dynamicFunctionConstants
{
  return self->__dynamicFunctionConstants;
}

- (void)set_dynamicFunctionConstants:(const void *)a3
{
  self->__dynamicFunctionConstants = a3;
}

- (PatchHandler)_patchHandler
{
  return self->__patchHandler;
}

- (void)set_patchHandler:(PatchHandler *)a3
{
  self->__patchHandler = a3;
}

- (StencilInfo)_stencilInfo
{
  *retstr = *(StencilInfo *)((char *)self + 88);
  return self;
}

- (void)set_stencilInfo:(StencilInfo *)a3
{
  StencilStateInfo state;

  state = a3->state;
  self->__stencilInfo.referenceValue = a3->referenceValue;
  self->__stencilInfo.state = state;
}

- (float)_fadeOpacity
{
  return self->__fadeOpacity;
}

- (void)set_fadeOpacity:(float)a3
{
  self->__fadeOpacity = a3;
}

- (BOOL)_isDrawingBlur
{
  return self->__isDrawingBlur;
}

- (void)set_isDrawingBlur:(BOOL)a3
{
  self->__isDrawingBlur = a3;
}

- (BOOL)_isDepthOnly
{
  return self->__isDepthOnly;
}

- (void)set_isDepthOnly:(BOOL)a3
{
  self->__isDepthOnly = a3;
}

- (unsigned)_stateOverride
{
  return self->__stateOverride;
}

- (void)set_stateOverride:(unsigned __int8)a3
{
  self->__stateOverride = a3;
}

- (MeshStats)_meshStats
{
  return self->__meshStats;
}

- (void)set_meshStats:(MeshStats *)a3
{
  self->__meshStats = a3;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 134217472;
  *((_QWORD *)self + 12) = 134217472;
  return self;
}

@end
