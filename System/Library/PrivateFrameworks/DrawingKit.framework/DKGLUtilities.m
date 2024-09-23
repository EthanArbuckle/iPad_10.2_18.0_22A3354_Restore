@implementation DKGLUtilities

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__DKGLUtilities_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_once != -1)
    dispatch_once(&initialize_once, block);
}

void __27__DKGLUtilities_initialize__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__postGLActiveNotification, *MEMORY[0x24BDF7510], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__postGLInactiveNotification, *MEMORY[0x24BDF7528], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__postGLInactiveNotification, *MEMORY[0x24BDD0C28], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__postGLActiveNotification, *MEMORY[0x24BDD0C10], 0);

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "applicationState");

  if (v7 == 2)
    atomic_store(0, DKSafeToUseOpenGL);
}

+ (id)pathForResource:(id)a3 ofType:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathForResource:ofType:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (unsigned)compileShader:(id)a3 ofType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  GLenum v10;
  GLuint Shader;
  id v12;
  uint64_t v14;
  GLint params;
  GLint length;
  GLchar *string;
  GLchar infolog[256];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[DKGLUtilities pathForResource:ofType:](DKGLUtilities, "pathForResource:ofType:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v7, 4, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    NSLog(CFSTR("Error loading shader %@ %@"), v5, v6);
    goto LABEL_9;
  }
  v9 = (void *)v8;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("vert")))
    v10 = 35633;
  else
    v10 = 35632;
  Shader = glCreateShader(v10);
  v12 = objc_retainAutorelease(v9);
  string = (GLchar *)objc_msgSend(v12, "UTF8String");
  length = objc_msgSend(v12, "length");
  glShaderSource(Shader, 1, (const GLchar *const *)&string, &length);
  glCompileShader(Shader);
  params = 0;
  glGetShaderiv(Shader, 0x8B81u, &params);
  if (!params)
  {
    glGetShaderInfoLog(Shader, 256, 0, infolog);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", infolog);
    v14 = objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error occurred: %@"), v14);
LABEL_9:
    exit(1);
  }

  return Shader;
}

+ (void)createFBO:(unsigned int *)a3 depthRB:(unsigned int *)a4 texture:(unsigned int *)a5 width:(int)a6 height:(int)a7 format:(unsigned int)a8
{
  if (a3 && a5)
  {
    glGenTextures(1, a5);
    glBindTexture(0xDE1u, *a5);
    glTexImage2D(0xDE1u, 0, 6408, a6, a7, 0, 0x1908u, 0x1401u, 0);
    glTexParameteri(0xDE1u, 0x2801u, 9728);
    glTexParameteri(0xDE1u, 0x2800u, 9728);
    glTexParameteri(0xDE1u, 0x2802u, 33071);
    glTexParameteri(0xDE1u, 0x2803u, 33071);
    glGenFramebuffers(1, a3);
    glBindFramebuffer(0x8D40u, *a3);
    glFramebufferTexture2D(0x8D40u, 0x8CE0u, 0xDE1u, *a5, 0);
  }
  if (a4)
  {
    glGenRenderbuffers(1, a4);
    glBindRenderbuffer(0x8D41u, *a4);
    glRenderbufferStorage(0x8D41u, 0x81A6u, a6, a7);
    glFramebufferRenderbuffer(0x8D40u, 0x8D00u, 0x8D41u, *a4);
  }
  glDisable(0xB71u);
  glDepthMask(0);
  glEnable(0xBE2u);
  glBlendFunc(0x302u, 0x303u);
  glClearColor(0.0, 0.0, 0.0, 0.0);
  glClear(0x4000u);
  glViewport(0, 0, a6, a7);
}

+ (void)deleteFBO:(unsigned int *)a3 depthRB:(unsigned int *)a4 texture:(unsigned int *)a5
{
  if (a3)
  {
    glDeleteFramebuffers(1, a3);
    *a3 = 0;
  }
  if (a4)
  {
    glDeleteRenderbuffers(1, a4);
    *a4 = 0;
  }
  if (a5)
  {
    glDeleteTextures(1, a5);
    *a5 = 0;
  }
}

+ (void)createVBO:(unsigned int *)a3 size:(int64_t)a4 data:(void *)a5 usage:(unsigned int)a6
{
  glGenBuffers(1, a3);
  glBindBuffer(0x8892u, *a3);
  glBufferData(0x8892u, a4, a5, a6);
}

+ (void)deleteVBO:(unsigned int *)a3
{
  if (a3)
  {
    glDeleteVertexArraysOES();
    *a3 = 0;
  }
}

+ (void)createTexture:(unsigned int *)a3 withImageName:(id)a4 ofType:(id)a5
{
  id v7;
  id v8;
  GLenum Error;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v16;
  _QWORD pixels[3];

  pixels[2] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  Error = glGetError();
  if (Error)
    printf("glError: %04x caught at %s:%u\n", Error, "/Library/Caches/com.apple.xbs/Sources/DrawingKit/DrawingKit/Source/Shared/GLUtilities/DKGLUtilities.m", 175);
  +[DKGLUtilities pathForResource:ofType:](DKGLUtilities, "pathForResource:ofType:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD1A00], "textureWithContentsOfFile:options:error:", v10, 0, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  v13 = v12;
  if (v11)
    v14 = v12 == 0;
  else
    v14 = 0;
  if (v14)
  {
    if (a3)
      *a3 = objc_msgSend(v11, "name");
  }
  else
  {
    objc_msgSend(v12, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s failed to load texture with error: %@"), "+[DKGLUtilities createTexture:withImageName:ofType:]", v15);

    if (a3)
    {
      pixels[0] = -1;
      pixels[1] = -1;
      glGenTextures(1, a3);
      glBindTexture(0xDE1u, *a3);
      glTexImage2D(0xDE1u, 0, 6408, 2, 2, 0, 0x1908u, 0x1401u, pixels);
    }
  }

}

+ (void)createRepeatableTexture:(unsigned int *)a3 withImageName:(id)a4 ofType:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "createTexture:withImageName:ofType:", a3, v8, v7);

  if (a3)
  {
    glBindTexture(0xDE1u, *a3);
    glTexParameteri(0xDE1u, 0x2800u, 9729);
    glTexParameteri(0xDE1u, 0x2801u, 9729);
    glTexParameteri(0xDE1u, 0x2802u, 10497);
    glTexParameteri(0xDE1u, 0x2803u, 10497);
  }
}

+ (void)deleteTexture:(unsigned int *)a3
{
  if (a3)
  {
    glDeleteTextures(1, a3);
    *a3 = 0;
  }
}

+ (void)drawQuadAtX:(float)a3 Y:(float)a4 width:(float)a5 height:(float)a6
{
  GLuint buffers[2];
  _DWORD data[2];
  __int128 v8;
  float v9;
  float v10;
  __int128 v11;
  float v12;
  float v13;
  __int128 v14;
  float v15;
  float v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  buffers[1] = 0;
  *(float *)data = a3;
  *(float *)&data[1] = a4;
  v9 = a3 + a5;
  v10 = a4;
  v12 = a3;
  v13 = a4 + a6;
  v15 = a3 + a5;
  v16 = a4 + a6;
  v8 = xmmword_21DCC07B0;
  v11 = xmmword_21DCC07C0;
  v14 = xmmword_21DCC07D0;
  v17 = xmmword_21DCC07E0;
  glGenBuffers(1, &buffers[1]);
  glBindBuffer(0x8892u, buffers[1]);
  glBufferData(0x8892u, 96, data, 0x88E4u);
  glGenVertexArraysOES();
  glBindVertexArrayOES();
  glEnableVertexAttribArray(0);
  glEnableVertexAttribArray(1u);
  glVertexAttribPointer(0, 4, 0x1406u, 0, 24, 0);
  glVertexAttribPointer(1u, 2, 0x1406u, 0, 24, (const GLvoid *)0x10);
  glDrawArrays(5u, 0, 4);
  glBindBuffer(0x8892u, 0);
  glDeleteBuffers(1, &buffers[1]);
  glDeleteVertexArraysOES();
}

+ (void)setProjectionMatrixForWidth:(float)a3 height:(float)a4 flipped:(BOOL)a5 matrix:(id *)a6
{
  uint64_t v6;
  float32x4_t v7;
  float v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[4];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v6 = 0;
  v7.i32[0] = -1.0;
  if (a5)
    v8 = 1.0;
  else
    v8 = -1.0;
  v7.f32[1] = v8;
  v7.i32[2] = 0;
  v7.i32[3] = 1.0;
  v12[2] = xmmword_21DCC07F0;
  v12[3] = xmmword_21DCC0790;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  do
  {
    *(__int128 *)((char *)&v13 + v6 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_21DCC0800, COERCE_FLOAT(v12[v6])), (float32x4_t)xmmword_21DCC07B0, *(float32x2_t *)&v12[v6], 1), (float32x4_t)xmmword_21DCC07F0, (float32x4_t)v12[v6], 2), v7, (float32x4_t)v12[v6], 3);
    ++v6;
  }
  while (v6 != 4);
  v9 = v14;
  v10 = v15;
  v11 = v16;
  *(_OWORD *)a6 = v13;
  *((_OWORD *)a6 + 1) = v9;
  *((_OWORD *)a6 + 2) = v10;
  *((_OWORD *)a6 + 3) = v11;
}

+ (void)translateMatrix:(id *)a3 byX:(float)a4 Y:(float)a5 result:(id *)a6
{
  uint64_t v6;
  int v8;
  float v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[4];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v6 = 0;
  v8 = 0;
  v9 = 1.0;
  v10 = *(float32x4_t *)a3;
  v11 = *((float32x4_t *)a3 + 1);
  v12 = *((float32x4_t *)a3 + 2);
  v13 = *((float32x4_t *)a3 + 3);
  v17[2] = xmmword_21DCC07F0;
  v17[3] = *(_OWORD *)&a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  do
  {
    *(__int128 *)((char *)&v18 + v6 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, COERCE_FLOAT(v17[v6])), v11, *(float32x2_t *)&v17[v6], 1), v12, (float32x4_t)v17[v6], 2), v13, (float32x4_t)v17[v6], 3);
    ++v6;
  }
  while (v6 != 4);
  v14 = v19;
  v15 = v20;
  v16 = v21;
  *(_OWORD *)a6 = v18;
  *((_OWORD *)a6 + 1) = v14;
  *((_OWORD *)a6 + 2) = v15;
  *((_OWORD *)a6 + 3) = v16;
}

+ (id)snapshotImageOfFrameBufferWithID:(unsigned int)a3 bufferSize:(CGSize)a4 displayScale:(double)a5
{
  double height;
  double width;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  GLvoid *v12;
  const __CFData *v13;
  const __CFData *v14;
  CGDataProviderRef v15;
  CGDataProvider *v16;
  CGColorSpace *DeviceRGB;
  CGImage *v18;
  void *v19;
  GLint param;
  GLint params;

  if (a3)
  {
    height = a4.height;
    width = a4.width;
    params = 0;
    glGetIntegerv(0x8CA6u, &params);
    glPushGroupMarkerEXT(0, "Take Snapshot");
    glBindFramebuffer(0x8D40u, a3);
    v9 = (unint64_t)(width * a5);
    v10 = (unint64_t)(height * a5);
    param = 0;
    v11 = malloc_type_malloc(4 * v9 * v10, 0xCB0DC8F5uLL);
    if (v11)
    {
      v12 = v11;
      glGetIntegerv(0xD05u, &param);
      glPixelStorei(0xD05u, 1);
      glReadPixels(0, 0, (unint64_t)(width * a5), (unint64_t)(height * a5), 0x1908u, 0x1401u, v12);
      glPixelStorei(0xD05u, param);
      v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v12, 4 * v9 * v10);
      if (v13)
      {
        v14 = v13;
        v15 = CGDataProviderCreateWithCFData(v13);
        if (v15)
        {
          v16 = v15;
          DeviceRGB = CGColorSpaceCreateDeviceRGB();
          v18 = CGImageCreate((unint64_t)(width * a5), (unint64_t)(height * a5), 8uLL, 0x20uLL, 4 * v9, DeviceRGB, 3u, v16, 0, 0, kCGRenderingIntentDefault);
          if (v18)
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", v18, 0, a5);
          else
            v19 = 0;
          CGColorSpaceRelease(DeviceRGB);
          CGDataProviderRelease(v16);
          CGImageRelease(v18);
        }
        else
        {
          v19 = 0;
        }
        CFRelease(v14);
      }
      else
      {
        v19 = 0;
      }
      free(v12);
    }
    else
    {
      v19 = 0;
    }
    glPopGroupMarkerEXT();
    glBindFramebuffer(0x8D40u, params);
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

+ (id)createPlatformGLContext
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDE2818]), "initWithAPI:", 2);
}

+ (id)createSharedGLContext
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a1;
  objc_sync_enter(v2);
  if (sSharegroupContext)
  {
    v3 = objc_alloc(MEMORY[0x24BDE2818]);
    objc_msgSend((id)sSharegroupContext, "sharegroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithAPI:sharegroup:", 2, v4);
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE2818]), "initWithAPI:", 2);
    objc_storeStrong((id *)&sSharegroupContext, v5);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)sTextureCache;
    sTextureCache = v6;
  }

  objc_sync_exit(v2);
  return v5;
}

+ (void)teardownSharedGLContext
{
  void *v2;
  void *v3;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v2 = (void *)sSharegroupContext;
  sSharegroupContext = 0;

  v3 = (void *)sTextureCache;
  sTextureCache = 0;

  objc_sync_exit(obj);
}

+ (void)createSharedRepeatableTexture:(unsigned int *)a3 withImageName:(id)a4 ofType:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v8 = a5;
  v9 = a1;
  objc_sync_enter(v9);
  if (!sTextureCache)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sharegroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sSharegroupContext, "sharegroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12)
  {
    objc_msgSend((id)sTextureCache, "objectForKeyedSubscript:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      *a3 = objc_msgSend(v13, "unsignedIntegerValue");
    }
    else
    {
      objc_msgSend(v9, "createRepeatableTexture:withImageName:ofType:", a3, v16, v8);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)sTextureCache, "setObject:forKeyedSubscript:", v15, v16);

    }
  }
  else
  {
LABEL_3:
    *a3 = 0;
  }
  objc_sync_exit(v9);

}

+ (BOOL)setCurrentGLContext:(id)a3
{
  return objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", a3);
}

+ (void)_postGLActiveNotification
{
  atomic_store(1u, DKSafeToUseOpenGL);
}

+ (void)_postGLInactiveNotification
{
  if (objc_msgSend(a1, "gpuAvailable"))
    objc_msgSend(a1, "teardownSharedGLContext");
  atomic_store(0, DKSafeToUseOpenGL);
}

+ (BOOL)gpuAvailable
{
  unsigned __int8 v2;

  v2 = atomic_load(DKSafeToUseOpenGL);
  return v2 & 1;
}

+ (void)setCurrentClearColor
{
  GLfloat v2;
  GLfloat v3;
  GLfloat v4;

  if (DKIsDarkMode())
  {
    v2 = 0.0;
    v3 = 0.0;
    v4 = 0.0;
  }
  else
  {
    v2 = 1.0;
    v3 = 1.0;
    v4 = 1.0;
  }
  glClearColor(v2, v3, v4, 1.0);
}

@end
