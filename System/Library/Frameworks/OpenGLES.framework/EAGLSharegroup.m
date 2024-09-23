@implementation EAGLSharegroup

- (void)loadGLIPlugin:(__GLDPixelFormatRec *)a3 sharedWithCompute:(BOOL)a4
{
  *((_QWORD *)self->_private + 2) = a3;
  *((_QWORD *)self->_private + 3) = gfxCreateSharedState();
  if (*((_QWORD *)self->_private + 3))
  {
    gfxRetainSharedStateAndHash();
    *((_DWORD *)self->_private + 2) = 1;
  }
}

- (EAGLSharegroup)init
{
  return 0;
}

- (EAGLSharegroup)initWithAPI:(unint64_t)a3
{
  return -[EAGLSharegroup initWithAPI:sharedWithCompute:](self, "initWithAPI:sharedWithCompute:", a3, 0);
}

- (EAGLSharegroup)initWithAPI:(unint64_t)a3 sharedWithCompute:(BOOL)a4
{
  _BOOL8 v4;
  int v6;
  EAGLSharegroup *v7;
  _EAGLSharegroupPrivate *v8;
  _EAGLSharegroupPrivate *v9;
  uint64_t v10;
  int v11;
  objc_super v13;

  if (a3 - 1 >= 3)
  {

    return 0;
  }
  v4 = a4;
  v6 = dword_20655F314[a3 - 1];
  v13.receiver = self;
  v13.super_class = (Class)EAGLSharegroup;
  v7 = -[EAGLSharegroup init](&v13, sel_init);
  if (v7)
  {
    v8 = (_EAGLSharegroupPrivate *)malloc_type_calloc(1uLL, 0x20uLL, 0x1020040FD9D5386uLL);
    v7->_private = v8;
    if (!v8)
      goto LABEL_13;
    *((_BYTE *)v8 + 12) = 1;
    if ((eagl_init(0) & 1) == 0)
      goto LABEL_13;
    v9 = v7->_private;
    *(_QWORD *)v9 = a3;
    v10 = gli_pixelformat;
    if (gli_pixelformat)
    {
      while (1)
      {
        v9 = v7->_private;
        if (*((_DWORD *)v9 + 2))
          break;
        v11 = *(_DWORD *)(v10 + 12);
        if ((v11 & 0x100) != 0 && (v6 & ~v11) == 0)
          -[EAGLSharegroup loadGLIPlugin:sharedWithCompute:](v7, "loadGLIPlugin:sharedWithCompute:", v10, v4);
        v10 = *(_QWORD *)v10;
        if (!v10)
        {
          v9 = v7->_private;
          break;
        }
      }
    }
    if (!*((_DWORD *)v9 + 2))
    {
LABEL_13:

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  _EAGLSharegroupPrivate *v3;
  _EAGLSharegroupPrivate *v4;
  objc_super v5;

  v3 = self->_private;
  if (v3)
  {
    if (*((_DWORD *)v3 + 2) == 1 && *((_QWORD *)v3 + 3))
    {
      gfxReleaseSharedStateAndHash();
      *((_QWORD *)self->_private + 3) = 0;
      v3 = self->_private;
    }
    *((_QWORD *)v3 + 2) = 0;
    v4 = self->_private;
    if (*((_BYTE *)v4 + 12))
    {
      eagl_dealloc();
      v4 = self->_private;
    }
    free(v4);
    self->_private = 0;
  }
  -[EAGLSharegroup setDebugLabel:](self, "setDebugLabel:", 0);
  v5.receiver = self;
  v5.super_class = (Class)EAGLSharegroup;
  -[EAGLSharegroup dealloc](&v5, sel_dealloc);
}

- (unint64_t)APIs
{
  return *(_QWORD *)self->_private;
}

- (__GLISharedRec)getGLIShared
{
  return (__GLISharedRec *)*((_QWORD *)self->_private + 3);
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
