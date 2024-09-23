@implementation _CUILayerStackRendition

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CUILayerStackRendition;
  -[_CUIRawDataRendition dealloc](&v3, sel_dealloc);
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  id *v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  uint64_t var10;
  char v12;
  unsigned int *v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int *v16;
  CUIRenditionLayerReference *v17;
  unint64_t v18;
  unint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  unsigned int v24;
  float *v25;
  CUIRenditionLayerReference *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unsigned int v31;
  uint64_t v32;
  NSAssertionHandler *v34;
  uint64_t v35;
  objc_class *v36;
  NSString *v37;
  char *v38;
  objc_super v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _DWORD v44[7];

  v39.receiver = self;
  v39.super_class = (Class)_CUILayerStackRendition;
  v6 = -[_CUIRawDataRendition _initWithCSIHeader:version:](&v39, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  if (a3->var6 != 1145132097)
  {
    v34 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v36 = (objc_class *)objc_opt_class(v6, v35);
    v37 = NSStringFromClass(v36);
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("CUIThemeRendition.m"), 2368, CFSTR("CoreUI: -[%@ %@] pixel format must be kCSIPixelFormatRawData"), v37, NSStringFromSelector(a2));
  }
  LODWORD(v7) = a3->var3;
  LODWORD(v8) = a3->var4;
  v9 = (double)v7;
  v10 = (double)v8;

  v6[28] = -[CUIRenditionMetrics initwithImageSize:scale:]((double *)[CUIRenditionMetrics alloc], v9, v10, (double)objc_msgSend(v6, "internalScale"));
  var10 = a3->var10;
  if ((_DWORD)var10)
  {
    v12 = 0;
    v13 = &a3->var11.var1[a3->var11.var0 + 1];
    v14 = (unsigned int *)((char *)v13 + var10);
    v38 = (char *)v13 + var10;
    do
    {
      if (*v13 == 1012)
      {
        v6[29] = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v13[2]);
        if (v13[2])
        {
          v15 = 0;
          v16 = v13 + 4;
          do
          {
            v17 = objc_alloc_init(CUIRenditionLayerReference);
            LODWORD(v18) = v16[3];
            LODWORD(v19) = v16[4];
            -[CUIRenditionLayerReference setFrame:](v17, "setFrame:", (double)(int)v16[1], (double)(int)v16[2], (double)v18, (double)v19);
            -[CUIRenditionLayerReference setOpacity:](v17, "setOpacity:", *((float *)v16 + 6));
            -[CUIRenditionLayerReference setBlendMode:](v17, "setBlendMode:", v16[5]);
            -[CUIRenditionLayerReference setFixedFrame:](v17, "setFixedFrame:", *v16 & 1);
            v43 = 0u;
            memset(v44, 0, sizeof(v44));
            v41 = 0u;
            v42 = 0u;
            v40 = 0u;
            v20 = v16[7];
            if (v20 >= 0x58)
              v21 = 88;
            else
              v21 = v20;
            __memcpy_chk(&v40, v16 + 8, v21, 92);
            -[CUIRenditionLayerReference setReferenceKey:](v17, "setReferenceKey:", -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", &v40));
            objc_msgSend(v6[29], "addObject:", v17);

            v16 = (unsigned int *)((char *)v16 + v16[7] + 32);
            ++v15;
          }
          while (v15 < v13[2]);
          v12 = 1;
          v14 = (unsigned int *)v38;
        }
        else
        {
          v12 = 1;
        }
      }
      v13 = (unsigned int *)((char *)v13 + v13[1] + 8);
    }
    while (v13 < v14);
    if ((v12 & 1) == 0)
    {
      v22 = a3->var10;
      if ((_DWORD)v22)
      {
        v23 = (char *)v14 - v22;
        do
        {
          if (*(_DWORD *)v23 == 1009)
          {
            v6[29] = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", *((unsigned int *)v23 + 2));
            if (*((_DWORD *)v23 + 2))
            {
              v24 = 0;
              v25 = (float *)(v23 + 16);
              do
              {
                v26 = objc_alloc_init(CUIRenditionLayerReference);
                *(float *)&v27 = *v25;
                *(float *)&v28 = v25[1];
                *(float *)&v29 = v25[2];
                *(float *)&v30 = v25[3];
                -[CUIRenditionLayerReference setFrame:](v26, "setFrame:", (double)v27, (double)v28, (double)v29, (double)v30);
                -[CUIRenditionLayerReference setOpacity:](v26, "setOpacity:", v25[5]);
                -[CUIRenditionLayerReference setBlendMode:](v26, "setBlendMode:", *((unsigned int *)v25 + 4));
                v43 = 0u;
                memset(v44, 0, sizeof(v44));
                v41 = 0u;
                v42 = 0u;
                v40 = 0u;
                v31 = *((_DWORD *)v25 + 6);
                if (v31 >= 0x58)
                  v32 = 88;
                else
                  v32 = v31;
                __memcpy_chk(&v40, v25 + 7, v32, 92);
                -[CUIRenditionLayerReference setReferenceKey:](v26, "setReferenceKey:", -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", &v40));
                objc_msgSend(v6[29], "addObject:", v26);

                v25 = (float *)((char *)v25 + *((unsigned int *)v25 + 6) + 28);
                ++v24;
              }
              while (v24 < *((_DWORD *)v23 + 2));
            }
          }
          v23 += *((unsigned int *)v23 + 1) + 8;
        }
        while (v23 < v38);
      }
    }
  }
  return v6;
}

- (id)layerReferences
{
  return self->_layers;
}

- (id)metrics
{
  return self->_renditionMetrics;
}

@end
