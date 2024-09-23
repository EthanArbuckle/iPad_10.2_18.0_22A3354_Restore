@implementation EAGLContext

- (EAGLContext)init
{
  abort();
}

- (EAGLContext)initWithAPI:(EAGLRenderingAPI)api
{
  return -[EAGLContext initWithAPI:properties:](self, "initWithAPI:properties:", api, 0);
}

- (EAGLContext)initWithAPI:(unint64_t)a3 sharedWithCompute:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  EAGLContext *v8;

  v4 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4), CFSTR("EAGLContextPropertySharedWithCompute"));
  v8 = -[EAGLContext initWithAPI:properties:](self, "initWithAPI:properties:", a3, v7);

  return v8;
}

- (EAGLContext)initWithAPI:(EAGLRenderingAPI)api sharegroup:(EAGLSharegroup *)sharegroup
{
  id v7;
  void *v8;
  EAGLContext *v9;

  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = v7;
  if (sharegroup)
    objc_msgSend(v7, "setObject:forKey:", sharegroup, CFSTR("EAGLContextPropertySharegroup"));
  v9 = -[EAGLContext commonInitWithAPI:properties:](self, "commonInitWithAPI:properties:", api, v8);

  return v9;
}

- (EAGLContext)initWithAPI:(unint64_t)a3 properties:(id)a4
{
  int v7;
  void *v9;
  EAGLContext *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("EAGLContextPropertyClientLabel")), "intValue");
    if ((v7 - 1) < 8)
      return (EAGLContext *)-[EAGLContext commonInitWithAPI:properties:](self, "commonInitWithAPI:properties:", a3, a4);
    if (v7)
    {

      return 0;
    }
    else
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:copyItems:", a4, 0);
      objc_msgSend(v11, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1), CFSTR("EAGLContextPropertyClientLabel"));
      v10 = -[EAGLContext commonInitWithAPI:properties:](self, "commonInitWithAPI:properties:", a3, v11);

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x20BCF8A20](self, a2);
    v12 = CFSTR("EAGLContextPropertySharedWithCompute");
    v13[0] = MEMORY[0x24BDBD1C0];
    v10 = -[EAGLContext commonInitWithAPI:properties:](self, "commonInitWithAPI:properties:", a3, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1));
    objc_autoreleasePoolPop(v9);
  }
  return v10;
}

- (id)commonInitWithAPI:(unint64_t)a3 properties:(id)a4
{
  EAGLContext *v6;
  void *v7;
  uint64_t v8;
  EAGLSharegroup *v9;
  EAGLSharegroup *v10;
  _EAGLContextPrivate *v11;
  uint64_t v12;
  _EAGLSharegroupPrivate *v13;
  int v14;
  char *v15;
  unsigned int v16;
  int v18;
  int v19;
  int v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)EAGLContext;
  v6 = -[EAGLContext init](&v21, sel_init);
  if (!v6)
    return v6;
  v7 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("EAGLContextPropertySharegroup"));
  v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("EAGLContextPropertySharedWithCompute")), "BOOLValue");
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      fprintf_l((FILE *)*MEMORY[0x24BDAC8D8], 0, "%s: not a valid sharegroup\n", "-[EAGLContext commonInitWithAPI:properties:]");
      goto LABEL_24;
    }
    v9 = v7;
  }
  else
  {
    v9 = -[EAGLSharegroup initWithAPI:sharedWithCompute:]([EAGLSharegroup alloc], "initWithAPI:sharedWithCompute:", a3, v8);
  }
  v10 = v9;
  if (!v9 || -[EAGLSharegroup APIs](v9, "APIs") != a3)
    goto LABEL_24;
  v11 = (_EAGLContextPrivate *)malloc_type_calloc(1uLL, 0x40E8uLL, 0x10A00409BC24E64uLL);
  v6->_private = v11;
  if (!v11)
  {

    goto LABEL_24;
  }
  v12 = 0;
  *((_QWORD *)v11 + 1) = v10;
  *((_QWORD *)v11 + 2) = a3;
  *(_QWORD *)v11 = v6;
  *((_DWORD *)v11 + 6) = 0;
  if (a3 - 1 <= 2)
    v12 = dword_20655F308[a3 - 1];
  v13 = v10->_private;
  if (*((_DWORD *)v13 + 2) != 1)
    goto LABEL_29;
  if (off_253DCA650((char *)v11 + 32, *((_QWORD *)v13 + 2), *((_QWORD *)v13 + 3), (char *)v11 + 40, (char *)v11 + 8328, v12))
  {
LABEL_24:

    return 0;
  }
  v14 = commonInitWithAPI_properties__EAGL_MTENGINE_FLAG;
  if (commonInitWithAPI_properties__EAGL_MTENGINE_FLAG == -1)
  {
    v15 = getenv("EAGL_MTENGINE_FLAG");
    v14 = (v15 || (v15 = getenv("ATF_GL_MTENGINE")) != 0) && *v15 != 48;
    commonInitWithAPI_properties__EAGL_MTENGINE_FLAG = v14;
  }
  if (v14)
  {
    v20 = 1;
    off_253DCA670(*((_QWORD *)v6->_private + 4), 313, &v20);
  }
  v16 = gfxLinkedOSVersion();
  v20 = v16;
  off_253DCA670(*((_QWORD *)v6->_private + 4), 701, &v20);
  if (v16 <= 2)
  {
    v19 = 1;
    off_253DCA670(*((_QWORD *)v6->_private + 4), 995, &v19);
LABEL_27:
    v19 = 1;
    off_253DCA670(*((_QWORD *)v6->_private + 4), 929, &v19);
    v18 = 1;
    off_253DCA670(*((_QWORD *)v6->_private + 4), 928, &v18);
    goto LABEL_28;
  }
  if (v16 == 3)
    goto LABEL_27;
LABEL_28:
  v19 = v12 & 0x40;
  off_253DCA670(*((_QWORD *)v6->_private + 4), 927, &v19);
  v20 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("EAGLContextPropertyClientLabel")), "intValue");
  off_253DCA670(*((_QWORD *)v6->_private + 4), 703, &v20);
LABEL_29:
  LOBYTE(v20) = 0;
  if (eagl_dict_read_BOOL(a4, (uint64_t)CFSTR("EAGLContextPropertyClientRetainRelease"), &v20)
    && (_BYTE)v20)
  {
    *((_DWORD *)v6->_private + 6) |= 1u;
  }
  return v6;
}

- (void)dealloc
{
  _EAGLContextPrivate *v3;
  _EAGLContextPrivate *v4;
  void *v5;
  objc_super v6;

  v3 = self->_private;
  if (v3)
  {
    if (*((_QWORD *)v3 + 4) && *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v3 + 1) + 8) + 8) == 1)
    {
      off_253DCA658();
      v3 = self->_private;
    }
    *((_QWORD *)v3 + 4) = 0;
    bzero((char *)self->_private + 40, 0x2060uLL);
    bzero((char *)self->_private + 8328, 0x2060uLL);
    v4 = self->_private;
    v5 = (void *)*((_QWORD *)v4 + 1);
    if (v5)
    {

      v4 = self->_private;
      *((_QWORD *)v4 + 1) = 0;
    }
    free(v4);
    self->_private = 0;
  }
  -[EAGLContext setDebugLabel:](self, "setDebugLabel:", 0);
  v6.receiver = self;
  v6.super_class = (Class)EAGLContext;
  -[EAGLContext dealloc](&v6, sel_dealloc);
}

+ (BOOL)setCurrentContext:(EAGLContext *)context
{
  _EAGLContextPrivate *v4;
  _EAGLContextPrivate *v5;
  _BOOL4 v6;
  EAGLContext *v7;
  _QWORD *v8;

  v4 = *(_EAGLContextPrivate **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 240);
  if (context)
    v5 = context->_private;
  else
    v5 = 0;
  if (v4 == v5)
  {
LABEL_13:
    LOBYTE(v6) = 1;
    return v6;
  }
  v6 = eagl_ctx_tls_set(v5);
  if (v6)
  {
    if (context && (*((_BYTE *)context->_private + 24) & 1) == 0)
      v7 = context;
    if (v4)
    {
      v8 = *(_QWORD **)v4;
      if (*(_QWORD *)v4)
      {
        if ((*(_BYTE *)(v8[1] + 24) & 1) == 0)

      }
    }
    goto LABEL_13;
  }
  return v6;
}

+ (EAGLContext)currentContext
{
  EAGLContext **v2;

  v2 = *(EAGLContext ***)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 240);
  if (v2)
    return *v2;
  else
    return 0;
}

- (EAGLRenderingAPI)API
{
  return *((_QWORD *)self->_private + 2);
}

- (EAGLSharegroup)sharegroup
{
  return (EAGLSharegroup *)*((_QWORD *)self->_private + 1);
}

- (BOOL)isMultiThreaded
{
  int v3;

  v3 = 0;
  -[EAGLContext getParameter:to:](self, "getParameter:to:", 313, &v3);
  return v3 != 0;
}

- (void)setMultiThreaded:(BOOL)multiThreaded
{
  _BOOL4 v3;

  v3 = multiThreaded;
  -[EAGLContext setParameter:to:](self, "setParameter:to:", 313, &v3);
}

- (BOOL)renderbufferStorage:(NSUInteger)target fromDrawable:(id)drawable
{
  EAGLContext *v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  __CFString *v11;
  uint64_t v12;
  char v13;
  _EAGLContextPrivate *v14;
  uint64_t v15;
  unsigned __int8 v17;

  v4 = self;
  LOBYTE(self) = 0;
  v17 = 0;
  if (target != 36161)
    return (char)self;
  if (drawable)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (v6 = objc_msgSend(drawable, "performSelector:", sel_nativeWindow)) == 0)
    {
      fprintf_l((FILE *)*MEMORY[0x24BDAC8D8], 0, "%s: invalid drawable\n");
      goto LABEL_30;
    }
    v7 = v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(drawable, "performSelector:", sel_drawableProperties);
      if (v8)
      {
        v9 = v8;
        v10 = eagl_dict_read_BOOL(v8, (uint64_t)CFSTR("EAGLDrawablePropertyRetained"), &v17);
        v11 = (__CFString *)objc_msgSend(v9, "objectForKey:", CFSTR("EAGLDrawablePropertyColorFormat"));
        v12 = 32856;
        if (v11 != CFSTR("EAGLColorFormat8888") && v11)
        {
          if (v11 == CFSTR("EAGLColorFormat565"))
          {
            v12 = 36194;
          }
          else if (v11 == CFSTR("EAGLColorFormatS8888"))
          {
            v12 = 35907;
          }
          else if (v11 == CFSTR("EAGLColorFormatSRGB_XR10"))
          {
            v12 = 37874;
          }
          else if (v11 == CFSTR("EAGLColorFormatRGBA_XR10_64BPP"))
          {
            v12 = 35446;
          }
          else
          {
            if (v11 != CFSTR("EAGLColorFormatSRGBA_XR10_64BPP"))
            {
              if (v11 == CFSTR("EAGLColorFormatSRGB_XR10_A8_2P"))
                v12 = 37881;
              else
                v12 = 32856;
              if (v11 == CFSTR("EAGLColorFormatSRGB_XR10_A8_2P"))
                v13 = v10;
              else
                v13 = 0;
              if ((v13 & 1) == 0)
                goto LABEL_38;
              goto LABEL_26;
            }
            v12 = 35447;
          }
        }
        if ((v10 & 1) == 0)
        {
LABEL_38:
          fprintf_l((FILE *)*MEMORY[0x24BDAC8D8], 0, "%s: invalid property values\n");
          goto LABEL_30;
        }
        goto LABEL_26;
      }
    }
  }
  else
  {
    v7 = 0;
  }
  v12 = 32856;
LABEL_26:
  v14 = v4->_private;
  if (*(_DWORD *)(*(_QWORD *)(*((_QWORD *)v14 + 1) + 8) + 8) != 1)
  {
LABEL_30:
    LOBYTE(self) = 0;
    return (char)self;
  }
  v15 = v17;
  off_253DCA6A8(*((_QWORD *)v14 + 4), 0, 0, 0);
  if (!drawable || (LODWORD(self) = off_253DCA6A8(*((_QWORD *)v4->_private + 4), v7, v15, v12), (_DWORD)self))
    LOBYTE(self) = 1;
  return (char)self;
}

- (BOOL)presentRenderbuffer:(NSUInteger)target
{
  _EAGLContextPrivate *v3;
  int v4;

  v3 = self->_private;
  v4 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v3 + 1) + 8) + 8);
  if (v4 == 1)
    off_253DCA6B0(*((_QWORD *)v3 + 4), 0, target, 0.0);
  return v4 == 1;
}

- (BOOL)presentRenderbuffer:(NSUInteger)target atTime:(CFTimeInterval)presentationTime
{
  _EAGLContextPrivate *v4;
  int v5;

  v4 = self->_private;
  v5 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v4 + 1) + 8) + 8);
  if (v5 == 1)
    off_253DCA6B0(*((_QWORD *)v4 + 4), 0, target, presentationTime);
  return v5 == 1;
}

- (BOOL)presentRenderbuffer:(NSUInteger)target afterMinimumDuration:(CFTimeInterval)duration
{
  _EAGLContextPrivate *v4;
  int v5;

  v4 = self->_private;
  v5 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v4 + 1) + 8) + 8);
  if (v5 == 1)
    off_253DCA6B0(*((_QWORD *)v4 + 4), 1, target, duration);
  return v5 == 1;
}

- (BOOL)attachImage:(unint64_t)a3 toCoreSurface:(__IOSurface *)a4 invertedRender:(BOOL)a5
{
  signed int PixelFormat;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t Width;
  uint64_t v15;

  if (*(_DWORD *)(*(_QWORD *)(*((_QWORD *)self->_private + 1) + 8) + 8) != 1)
    return 0;
  PixelFormat = IOSurfaceGetPixelFormat(a4);
  if (PixelFormat > 1278555444)
  {
    if (PixelFormat <= 1395864161)
    {
      if (PixelFormat != 1278555445)
      {
        if (PixelFormat == 1278555701)
        {
          v10 = 6407;
          if (a3 == 36161)
            v11 = 36194;
          else
            v11 = 6407;
          v12 = 33635;
          goto LABEL_39;
        }
        if (PixelFormat == 1380401729)
        {
          v10 = 6408;
          if (a3 == 36161)
            v11 = 32856;
          else
            v11 = 6408;
          v12 = 33639;
          goto LABEL_39;
        }
        goto LABEL_40;
      }
LABEL_25:
      v10 = 6408;
      if (a3 == 36161)
        v11 = 32855;
      else
        v11 = 6408;
      v12 = 32820;
      goto LABEL_39;
    }
    if (PixelFormat == 1932866865 || PixelFormat == 1395995957)
      goto LABEL_25;
    if (PixelFormat == 1395864162)
      goto LABEL_19;
    goto LABEL_40;
  }
  if (PixelFormat <= 1093677111)
  {
    if (PixelFormat == 875836468)
    {
      if (a3 == 36161)
        v11 = 32854;
      else
        v11 = 6408;
      v12 = 32819;
      goto LABEL_38;
    }
    if (PixelFormat == 892679473)
      goto LABEL_25;
    goto LABEL_40;
  }
  switch(PixelFormat)
  {
    case 1093677112:
      v12 = 5121;
      v11 = 6406;
      v10 = 6406;
      goto LABEL_39;
    case 1111970369:
LABEL_19:
      if (a3 == 36161)
        v11 = 32856;
      else
        v11 = 6408;
      v12 = 33639;
LABEL_38:
      v10 = 32993;
      goto LABEL_39;
    case 1278226488:
      v12 = 5121;
      v11 = 6409;
      v10 = 6409;
LABEL_39:
      Width = IOSurfaceGetWidth(a4);
      BYTE4(v15) = a5;
      LODWORD(v15) = 0;
      return -[EAGLContext texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:](self, "texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:", a4, a3, v11, Width, IOSurfaceGetHeight(a4), v10, v12, v15);
  }
LABEL_40:
  fprintf_l((FILE *)*MEMORY[0x24BDAC8D8], 0, "Unsupported IOSurface format: 0x%08x\n", PixelFormat);
  return 0;
}

- (BOOL)texImageIOSurface:(IOSurfaceRef)ioSurface target:(NSUInteger)target internalFormat:(NSUInteger)internalFormat width:(uint32_t)width height:(uint32_t)height format:(NSUInteger)format type:(NSUInteger)type plane:(uint32_t)plane
{
  uint64_t v11;

  BYTE4(v11) = 0;
  LODWORD(v11) = plane;
  return -[EAGLContext texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:](self, "texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:", ioSurface, target, internalFormat, *(_QWORD *)&width, *(_QWORD *)&height, format, type, v11);
}

- (BOOL)texImageIOSurface:(__IOSurface *)a3 target:(unint64_t)a4 internalFormat:(unint64_t)a5 width:(unsigned int)a6 height:(unsigned int)a7 format:(unint64_t)a8 type:(unint64_t)a9 plane:(unsigned int)a10 invert:(BOOL)a11
{
  int v11;
  int v14;
  IOSurfaceID v15;
  IOSurfaceID ID;
  _BOOL4 v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  int v24;
  unsigned int v25;
  int v26;
  uint64_t v27;

  v11 = a8;
  v14 = a5;
  v15 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  ID = IOSurfaceGetID(a3);
  v19 = v15;
  v20 = v14;
  v21 = a6;
  v22 = a7;
  v23 = v11;
  v24 = a9;
  v25 = a10;
  v26 = 0;
  if (off_253DCA670(*((_QWORD *)self->_private + 4), 910, &ID))
  {
    fprintf_l((FILE *)*MEMORY[0x24BDAC8D8], 0, "Failed to create IOSurface image (texture)\n");
  }
  else
  {
    ID = v15;
    v19 = a11;
    if (!off_253DCA670(*((_QWORD *)self->_private + 4), 921, &ID))
      return 1;
    fprintf_l((FILE *)*MEMORY[0x24BDAC8D8], 0, "Failed to create IOSurface image (inversion)\n");
  }
  return 0;
}

- (BOOL)setBlockFence:(id)a3 onQueue:(id)a4
{
  return !-[EAGLContext setParameter:to:](self, "setParameter:to:", 611, a4)
      && -[EAGLContext setParameter:to:](self, "setParameter:to:", 612, a3) == 0;
}

- (unint64_t)setParameter:(unsigned int)a3 to:(int *)a4
{
  _EAGLContextPrivate *v4;

  v4 = self->_private;
  if (*(_DWORD *)(*(_QWORD *)(*((_QWORD *)v4 + 1) + 8) + 8) == 1)
    return off_253DCA670(*((_QWORD *)v4 + 4), *(_QWORD *)&a3, a4);
  else
    return 10000;
}

- (unint64_t)getParameter:(unsigned int)a3 to:(int *)a4
{
  _EAGLContextPrivate *v4;

  v4 = self->_private;
  if (*(_DWORD *)(*(_QWORD *)(*((_QWORD *)v4 + 1) + 8) + 8) == 1)
    return off_253DCA678(*((_QWORD *)v4 + 4), *(_QWORD *)&a3, a4);
  else
    return 10000;
}

- (EAGLMacroContext)getMacroContextPrivate
{
  return (EAGLMacroContext *)((char *)self->_private + 32);
}

- (NSString)debugLabel
{
  return self->debugLabel;
}

- (void)setDebugLabel:(NSString *)debugLabel
{
  objc_setProperty_nonatomic_copy(self, a2, debugLabel, 16);
}

@end
