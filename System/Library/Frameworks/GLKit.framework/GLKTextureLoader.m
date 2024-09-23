@implementation GLKTextureLoader

- (GLKTextureLoader)initWithSharegroup:(EAGLSharegroup *)sharegroup
{
  GLKTextureLoader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GLKTextureLoader;
  v4 = -[GLKTextureLoader init](&v6, sel_init);
  if (v4)
  {
    -[GLKTextureLoader setGlContext:](v4, "setGlContext:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDE2818]), "initWithAPI:sharegroup:", -[EAGLSharegroup APIs](sharegroup, "APIs"), sharegroup));
    if (-[GLKTextureLoader glContext](v4, "glContext"))
    {
      -[GLKTextureLoader setNsLock:](v4, "setNsLock:", objc_alloc_init(MEMORY[0x24BDD1648]));
      if (-[GLKTextureLoader nsLock](v4, "nsLock"))
      {
        -[EAGLContext setDebugLabel:](-[GLKTextureLoader glContext](v4, "glContext"), "setDebugLabel:", CFSTR("GLKTextureLoader"));
        return v4;
      }
      fwrite("Failed to create texture loader lock\n", 0x25uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      -[GLKTextureLoader setGlContext:](v4, "setGlContext:", 0);
    }
    else
    {
      fwrite("Failed to create texture loader context\n", 0x28uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    }

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[GLKTextureLoader setGlContext:](self, "setGlContext:", 0);
  -[GLKTextureLoader setNsLock:](self, "setNsLock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)GLKTextureLoader;
  -[GLKTextureLoader dealloc](&v3, sel_dealloc);
}

+ (id)lockAndSwitchContext:(id)a3 glContext:(id)a4
{
  void *v5;

  objc_msgSend(a3, "lock");
  if (!a4)
    return 0;
  v5 = (void *)objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", a4);
  return v5;
}

+ (void)unlockAndRestoreContext:(id)a3 glContext:(id)a4
{
  if (a3)
  {
    glFlush();
    objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", a4);
  }
  objc_msgSend(a3, "unlock");
}

+ (id)_textureWithTexture:(id)a3 error:(id *)a4
{
  GLKTextureInfo *v6;
  GLuint textures;

  if (!a3)
    return 0;
  textures = 0;
  glGenTextures(1, &textures);
  if (objc_msgSend(a3, "uploadToGLTexture:error:", textures, a4))
  {
    if (objc_msgSend(a3, "dataCategory") != 5
      && objc_msgSend(a3, "isMipmapped")
      && objc_msgSend(a3, "numMipMapLevels") == 1)
    {
      glGenerateMipmap(objc_msgSend(a3, "bindTarget"));
    }
    v6 = [GLKTextureInfo alloc];
    return -[GLKTextureInfo initWithTexture:textureName:](v6, "initWithTexture:textureName:", a3, textures);
  }
  else
  {
    glDeleteTextures(1, &textures);
    return 0;
  }
}

+ (id)_textureWithTextureTXR:(id)a3 error:(id *)a4
{
  GLKTextureInfo *v6;
  GLuint textures;

  if (!a3)
    return 0;
  textures = 0;
  glGenTextures(1, &textures);
  if (objc_msgSend(a3, "uploadToGLTexture:error:", textures, a4))
  {
    v6 = [GLKTextureInfo alloc];
    return -[GLKTextureInfo initWithTextureTXR:textureName:](v6, "initWithTextureTXR:textureName:", a3, textures);
  }
  else
  {
    glDeleteTextures(1, &textures);
    return 0;
  }
}

+ (id)commonTextureWithContentsOfData:(id)a3 options:(id)a4 error:(id *)a5 lock:(id)a6 glContext:(id)a7
{
  GLKTexture *v11;
  GLKTexture *v12;
  uint64_t v13;
  id v14;

  if (a3)
  {
    v11 = -[GLKTexture initWithData:forceCubeMap:wasCubeMap:cubeMapIndex:options:error:]([GLKTexture alloc], "initWithData:forceCubeMap:wasCubeMap:cubeMapIndex:options:error:", a3, 0, 0, 0, a4, a5);
    if (v11)
    {
      v12 = v11;
      v13 = objc_msgSend(a1, "lockAndSwitchContext:glContext:", a6, a7);
      v14 = +[GLKTextureLoader _textureWithTexture:error:](GLKTextureLoader, "_textureWithTexture:error:", v12, a5);
      objc_msgSend(a1, "unlockAndRestoreContext:glContext:", a6, v13);

      return v14;
    }
  }
  else if (a5)
  {
    *a5 = (id)_GLKTextureErrorWithCodeAndErrorString(1, (uint64_t)CFSTR("Invalid NSData"));
  }
  return 0;
}

+ (id)commonTextureWithContentsOfURL:(id)a3 options:(id)a4 error:(id *)a5 lock:(id)a6 glContext:(id)a7
{
  void *v13;
  uint64_t v14;
  uint64_t v15;
  GLKTexture *v16;
  uint64_t v17;
  id v18;
  id v20;

  if (objc_msgSend(a3, "isFileURL")
    && (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    if (a5)
    {
      v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find resource %@ at specified location."), objc_msgSend(a3, "lastPathComponent"));
      v15 = 0;
      goto LABEL_11;
    }
    return 0;
  }
  v20 = 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:error:", a3, 1, &v20);
  if (v20)
  {
    if (a5)
    {
      v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid NSData, %@"), objc_msgSend(v20, "localizedDescription"));
      v15 = 1;
LABEL_11:
      v18 = 0;
      *a5 = (id)_GLKTextureErrorWithCodeAndErrorString(v15, v14);
      return v18;
    }
    return 0;
  }
  if (!v13)
    return 0;
  v16 = -[GLKTexture initWithData:forceCubeMap:wasCubeMap:cubeMapIndex:options:error:]([GLKTexture alloc], "initWithData:forceCubeMap:wasCubeMap:cubeMapIndex:options:error:", v13, 0, 0, 0, a4, a5);

  if (!v16)
    return 0;
  -[GLKTexture setLabel:](v16, "setLabel:", objc_msgSend(a3, "relativeString"));
  v17 = objc_msgSend(a1, "lockAndSwitchContext:glContext:", a6, a7);
  v18 = +[GLKTextureLoader _textureWithTexture:error:](GLKTextureLoader, "_textureWithTexture:error:", v16, a5);
  objc_msgSend(a1, "unlockAndRestoreContext:glContext:", a6, v17);

  return v18;
}

+ (id)commonTextureWithName:(id)a3 scaleFactor:(double)a4 bundle:(id)a5 options:(id)a6 error:(id *)a7 lock:(id)a8 glContext:(id)a9
{
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  const char *v25;
  const __CFString *v26;
  id v27;
  id v28;
  GLKTextureTXR *v30;
  GLKTextureTXR *v31;
  uint64_t v32;

  v16 = objc_msgSend(MEMORY[0x24BE28C28], "defaultUICatalogForBundle:", a5);
  if (v16)
  {
    v17 = (void *)v16;
    v18 = objc_alloc_init(MEMORY[0x24BEB6DB8]);
    v19 = objc_msgSend(v17, "namedTextureWithName:scaleFactor:", a3, a4);
    if (v19)
    {
      v20 = (void *)v19;
      v21 = (void *)MEMORY[0x212BB24BC]();
      v22 = (void *)objc_msgSend(v20, "textureWithBufferAllocator:", v18);
      v23 = v22;
      objc_autoreleasePoolPop(v21);
      switch(objc_msgSend(v22, "pixelFormat"))
      {
        case 150:
          if (!a7)
            goto LABEL_21;
          v24 = (void *)MEMORY[0x24BDD17C8];
          v25 = "BC6H_RGBFloat";
          break;
        case 151:
          if (!a7)
            goto LABEL_21;
          v24 = (void *)MEMORY[0x24BDD17C8];
          v25 = "BC6H_RGBUfloat";
          break;
        case 152:
          if (!a7)
            goto LABEL_21;
          v24 = (void *)MEMORY[0x24BDD17C8];
          v25 = "BC7_RGBAUnorm";
          break;
        case 153:
          if (!a7)
            goto LABEL_21;
          v24 = (void *)MEMORY[0x24BDD17C8];
          v25 = "BC7_RGBAUnorm_sRGB";
          break;
        default:
          if (v22
            && (!a9 ? (v28 = (id)objc_msgSend(MEMORY[0x24BDE2818], "currentContext")) : (v28 = a9),
                (v30 = -[GLKTextureTXR initWithTexture:API:options:error:]([GLKTextureTXR alloc], "initWithTexture:API:options:error:", v22, objc_msgSend(v28, "API"), a6, a7)) != 0))
          {
            v31 = v30;
            -[GLKTextureTXR setLabel:](v30, "setLabel:", a3);
            v32 = objc_msgSend(a1, "lockAndSwitchContext:glContext:", a8, a9);
            v27 = +[GLKTextureLoader _textureWithTextureTXR:error:](GLKTextureLoader, "_textureWithTextureTXR:error:", v31, a7);
            objc_msgSend(a1, "unlockAndRestoreContext:glContext:", a8, v32);

          }
          else
          {
            v27 = 0;
          }

          return v27;
      }
      *a7 = (id)_GLKTextureErrorWithCodeAndErrorString(7, objc_msgSend(v24, "stringWithFormat:", CFSTR("Texture was created with unsupported pixel format: %s"), v25));
LABEL_21:

      return 0;
    }
    if (a7)
    {
      v26 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find texture named \"%@\" in supplied bundle"), a3);
      goto LABEL_10;
    }
    return 0;
  }
  if (!a7)
    return 0;
  v26 = CFSTR("Could not get asset catalog from supplied bundle");
LABEL_10:
  v27 = 0;
  *a7 = (id)_GLKTextureErrorWithCodeAndErrorString(0, (uint64_t)v26);
  return v27;
}

+ (id)commonTextureWithCGImage:(CGImage *)a3 options:(id)a4 error:(id *)a5 lock:(id)a6 glContext:(id)a7
{
  GLKTexture *v11;
  GLKTexture *v12;
  uint64_t v13;
  id v14;

  if (a3)
  {
    v11 = -[GLKTexture initWithCGImage:forceCubeMap:wasCubeMap:cubeMapIndex:options:error:]([GLKTexture alloc], "initWithCGImage:forceCubeMap:wasCubeMap:cubeMapIndex:options:error:", a3, 0, 0, 0, a4, a5);
    if (v11)
    {
      v12 = v11;
      v13 = objc_msgSend(a1, "lockAndSwitchContext:glContext:", a6, a7);
      v14 = +[GLKTextureLoader _textureWithTexture:error:](GLKTextureLoader, "_textureWithTexture:error:", v12, a5);
      objc_msgSend(a1, "unlockAndRestoreContext:glContext:", a6, v13);

      return v14;
    }
  }
  else if (a5)
  {
    *a5 = (id)_GLKTextureErrorWithCodeAndErrorString(2, (uint64_t)CFSTR("Invalid CGImage"));
  }
  return 0;
}

+ (id)commonCubeMapWithContentsOfFiles:(id)a3 options:(id)a4 error:(id *)a5 lock:(id)a6 glContext:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  GLKTexture *v19;
  uint64_t v20;
  BOOL v21;
  GLKTextureInfo *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  id result;
  uint64_t v27;
  GLKTextureInfo *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  uint64_t v32;
  uint64_t target;
  uint64_t v34;
  GLKTextureInfo *v35;
  char v36;
  id v37;
  GLuint textures;

  if (objc_msgSend(a3, "count") == 6)
  {
    textures = 0;
    v13 = objc_msgSend(a1, "lockAndSwitchContext:glContext:", a6, a7);
    glGenTextures(1, &textures);
    objc_msgSend(a1, "unlockAndRestoreContext:glContext:", a6, v13);
    if (!objc_msgSend(a3, "count"))
    {
      v34 = 0;
      v35 = 0;
      target = 3553;
LABEL_27:
      v27 = objc_msgSend(a1, "lockAndSwitchContext:glContext:", a6, a7);
      if (HIDWORD(v34) == 5 || (v34 & 1) == 0)
      {
        v28 = v35;
      }
      else
      {
        v28 = v35;
        if (HIDWORD(target) == 1)
          glGenerateMipmap(target);
      }
LABEL_45:
      objc_msgSend(a1, "unlockAndRestoreContext:glContext:", a6, v27);
      return v28;
    }
    v14 = 0;
    v34 = 0;
    v35 = 0;
    target = 3553;
    while (1)
    {
      v15 = (void *)objc_msgSend(a3, "objectAtIndex:", v14);
      objc_opt_class();
      v16 = v15;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v15);
        else
          v16 = 0;
      }
      if ((objc_msgSend(v16, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
      {
        if (!a5)
          return 0;
        v23 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find resource %@ at specified location."), objc_msgSend(v16, "lastPathComponent"));
        v24 = 0;
LABEL_25:
        v25 = (void *)_GLKTextureErrorWithCodeAndErrorString(v24, (uint64_t)v23);
        result = 0;
        *a5 = v25;
        return result;
      }
      v37 = 0;
      v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:error:", v16, 1, &v37);
      if (!v17)
      {
        if (a5)
        {
          v29 = (void *)MEMORY[0x24BDD17C8];
          if (v37)
            v30 = (const __CFString *)objc_msgSend(v37, "localizedDescription");
          else
            v30 = &stru_24C849D78;
          v31 = (const __CFString *)objc_msgSend(v29, "stringWithFormat:", CFSTR("Invalid NSData for face %d, %@"), v14, v30, target);
          v32 = 1;
LABEL_43:
          *a5 = (id)_GLKTextureErrorWithCodeAndErrorString(v32, (uint64_t)v31);
        }
LABEL_44:
        v27 = objc_msgSend(a1, "lockAndSwitchContext:glContext:", a6, a7);
        glDeleteTextures(1, &textures);

        v28 = 0;
        goto LABEL_45;
      }
      v18 = (void *)v17;
      v36 = 0;
      v19 = -[GLKTexture initWithData:forceCubeMap:wasCubeMap:cubeMapIndex:options:error:]([GLKTexture alloc], "initWithData:forceCubeMap:wasCubeMap:cubeMapIndex:options:error:", v17, 1, &v36, v14, a4, a5);

      if (!v19)
        goto LABEL_44;
      if (-[GLKTexture dataCategory](v19, "dataCategory") == 5 && v36)
      {

        if (a5)
        {
          v31 = CFSTR("PVR atlas unsupported");
          v32 = 5;
          goto LABEL_43;
        }
        goto LABEL_44;
      }
      if (!v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = (void *)objc_msgSend(v15, "relativeString");
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_18;
        }
        -[GLKTexture setLabel:](v19, "setLabel:", v15);
      }
LABEL_18:
      v20 = objc_msgSend(a1, "lockAndSwitchContext:glContext:", a6, a7);
      v21 = -[GLKTexture uploadToGLTexture:error:](v19, "uploadToGLTexture:error:", textures, a5);
      objc_msgSend(a1, "unlockAndRestoreContext:glContext:", a6, v20);
      if (!v21)
      {

        goto LABEL_44;
      }
      if (!v14)
      {
        v22 = [GLKTextureInfo alloc];
        v35 = -[GLKTextureInfo initWithTexture:textureName:](v22, "initWithTexture:textureName:", v19, textures);
        HIDWORD(v34) = -[GLKTexture dataCategory](v19, "dataCategory");
        LOBYTE(v34) = -[GLKTexture isMipmapped](v19, "isMipmapped");
        LODWORD(target) = -[GLKTexture bindTarget](v19, "bindTarget");
        HIDWORD(target) = -[GLKTexture numMipMapLevels](v19, "numMipMapLevels");
      }

      if (objc_msgSend(a3, "count") <= (unint64_t)++v14)
        goto LABEL_27;
    }
  }
  if (a5)
  {
    v23 = CFSTR("Invalid number of files");
    v24 = 6;
    goto LABEL_25;
  }
  return 0;
}

+ (id)commonCubeMapWithContentsOfURL:(id)a3 options:(id)a4 error:(id *)a5 lock:(id)a6 glContext:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  void *v15;
  GLKTexture *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  id result;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  char v28;
  int v29;
  unsigned int v30;
  void *v31;
  unint64_t v32;
  char v33;
  char *v34;
  uint64_t v35;
  size_t v36;
  uint64_t v37;
  char *v38;
  void *v39;
  int v40;
  char *v41;
  void *v42;
  GLKTexture *v43;
  uint64_t v44;
  _BOOL4 v45;
  GLKTextureInfo *v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  GLenum target;
  unint64_t v52;
  id v53;
  id *v54;
  id v55;
  unsigned int v56;
  int v57;
  uint64_t size;
  unsigned int v59;
  GLKTexture *v60;
  int v61;
  id v62;
  char v63;
  GLuint textures;

  if (objc_msgSend(a3, "isFileURL")
    && (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    if (a5)
    {
      v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find resource %@ at specified location."), objc_msgSend(a3, "lastPathComponent"));
      v23 = 0;
LABEL_23:
      v31 = (void *)_GLKTextureErrorWithCodeAndErrorString(v23, v22);
      result = 0;
      *a5 = v31;
      return result;
    }
    return 0;
  }
  textures = 0;
  v13 = objc_msgSend(a1, "lockAndSwitchContext:glContext:", a6, a7);
  glGenTextures(1, &textures);
  objc_msgSend(a1, "unlockAndRestoreContext:glContext:", a6, v13);
  v63 = 0;
  v62 = 0;
  v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:error:", a3, 1, &v62);
  if (!v14)
  {
    if (a5)
    {
      v20 = (void *)MEMORY[0x24BDD17C8];
      if (v62)
        v21 = (const __CFString *)objc_msgSend(v62, "localizedDescription");
      else
        v21 = &stru_24C849D78;
      v22 = objc_msgSend(v20, "stringWithFormat:", CFSTR("Invalid NSData, %@"), v21);
      v23 = 1;
      goto LABEL_23;
    }
    return 0;
  }
  v15 = (void *)v14;
  v16 = -[GLKTexture initWithData:forceCubeMap:wasCubeMap:cubeMapIndex:options:error:]([GLKTexture alloc], "initWithData:forceCubeMap:wasCubeMap:cubeMapIndex:options:error:", v14, 1, &v63, 0, 0, a5);

  if (!v16)
  {
LABEL_26:
    v19 = objc_msgSend(a1, "lockAndSwitchContext:glContext:", a6, a7);
    v18 = 0;
LABEL_27:
    glDeleteTextures(1, &textures);

    goto LABEL_28;
  }
  if (-[GLKTexture dataCategory](v16, "dataCategory") != 5)
  {
    if (-[GLKTexture dataCategory](v16, "dataCategory") == 5)
    {

      v19 = objc_msgSend(a1, "lockAndSwitchContext:glContext:", a6, a7);
LABEL_28:
      v18 = 0;
      goto LABEL_29;
    }
    v25 = -[GLKTexture width](v16, "width");
    v26 = 3 * -[GLKTexture height](v16, "height");
    v27 = -[GLKTexture height](v16, "height");
    v56 = 6 * -[GLKTexture width](v16, "width");
    v59 = v25;
    if (v25 != 2 * v26 && v27 != v56)
      goto LABEL_19;
    v57 = 2 * v26;
    if (v25 == 2 * v26)
    {
      v61 = -[GLKTexture height](v16, "height");
      v32 = -[GLKTexture rowBytes](v16, "rowBytes") / 6uLL;
    }
    else
    {
      if (v27 != v56)
        goto LABEL_19;
      v61 = -[GLKTexture width](v16, "width");
      v32 = -[GLKTexture rowBytes](v16, "rowBytes");
    }
    if ((_DWORD)v32 && v61)
    {
      v50 = v27;
      v53 = a4;
      v54 = a5;
      v55 = a7;
      v60 = v16;
      v34 = -[NSData bytes](-[GLKTexture imageData](v16, "imageData"), "bytes");
      v35 = 0;
      v48 = 0;
      v49 = 0;
      v47 = 0;
      v36 = (int)v32;
      size = (int)v32 * (uint64_t)v61;
      v52 = v32;
      v37 = 6 * (int)v32;
      target = 3553;
      while (1)
      {
        if (v59 == v57)
        {
          v34 = (char *)(-[NSData bytes](-[GLKTexture imageData](v60, "imageData"), "bytes") + v35 * v36);
          v38 = (char *)malloc_type_malloc(size, 0xA2F0899DuLL);
          v39 = v38;
          v40 = v61;
          if (v61 >= 1)
          {
            v41 = v38;
            do
            {
              memcpy(v41, v34, v36);
              v34 += v37;
              v41 += v36;
              --v40;
            }
            while (v40);
          }
          v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v39, size, 1);
        }
        else if (v50 == v56)
        {
          v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v34, size, 0);
          v34 += size;
        }
        else
        {
          v42 = 0;
        }
        v43 = -[GLKTexture initWithDecodedData:width:height:rowBytes:texture:cubeMapIndex:options:error:]([GLKTexture alloc], "initWithDecodedData:width:height:rowBytes:texture:cubeMapIndex:options:error:", v42, v61, v61, v52, v60, v35, v53, v54);

        if (!v35)
          -[GLKTexture setLabel:](v43, "setLabel:", objc_msgSend(a3, "relativeString"));
        v44 = objc_msgSend(a1, "lockAndSwitchContext:glContext:", a6, v55);
        v45 = -[GLKTexture uploadToGLTexture:error:](v43, "uploadToGLTexture:error:", textures, v54);
        objc_msgSend(a1, "unlockAndRestoreContext:glContext:", a6, v44);
        if (!v45)
          break;
        if (!v35)
        {
          v46 = [GLKTextureInfo alloc];
          v49 = -[GLKTextureInfo initWithTexture:textureName:](v46, "initWithTexture:textureName:", v43, textures);
          BYTE4(v48) = -[GLKTexture isMipmapped](v43, "isMipmapped");
          target = -[GLKTexture bindTarget](v43, "bindTarget");
          LODWORD(v48) = -[GLKTexture dataCategory](v43, "dataCategory");
          v47 = -[GLKTexture numMipMapLevels](v43, "numMipMapLevels");
        }

        if (++v35 == 6)
        {
          v33 = 1;
          goto LABEL_59;
        }
      }

      v33 = 0;
LABEL_59:
      a7 = v55;
      v16 = v60;
      v18 = (id)v49;
      v29 = v48;
      v28 = BYTE4(v48);
      v30 = v47;
LABEL_33:

      v19 = objc_msgSend(a1, "lockAndSwitchContext:glContext:", a6, a7);
      if ((v33 & 1) != 0)
      {
        if (v29 != 5 && (v28 & 1) != 0 && v30 == 1)
          glGenerateMipmap(target);
        goto LABEL_29;
      }
      goto LABEL_27;
    }
LABEL_19:
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v18 = 0;
    if (a5)
      *a5 = (id)_GLKTextureErrorWithCodeAndErrorString(9, (uint64_t)CFSTR("Invalid cube map dimensions"));
    v33 = 1;
    target = 3553;
    goto LABEL_33;
  }
  if (!v63)
  {

    if (a5)
      *a5 = (id)_GLKTextureErrorWithCodeAndErrorString(11, (uint64_t)CFSTR("PVR file does not contain cubemap data"));
    goto LABEL_26;
  }
  v17 = objc_msgSend(a1, "lockAndSwitchContext:glContext:", a6, a7);
  v18 = +[GLKTextureLoader _textureWithTexture:error:](GLKTextureLoader, "_textureWithTexture:error:", v16, a5);
  objc_msgSend(a1, "unlockAndRestoreContext:glContext:", a6, v17);

  v19 = objc_msgSend(a1, "lockAndSwitchContext:glContext:", a6, a7);
  if (!v18)
    goto LABEL_27;
LABEL_29:
  objc_msgSend(a1, "unlockAndRestoreContext:glContext:", a6, v19);
  return v18;
}

+ (GLKTextureInfo)textureWithContentsOfFile:(NSString *)path options:(NSDictionary *)options error:(NSError *)outError
{
  if (objc_msgSend(MEMORY[0x24BDE2818], "currentContext"))
    return (GLKTextureInfo *)objc_msgSend(a1, "textureWithContentsOfURL:options:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", path), options, outError);
  if (outError)
    *outError = (NSError *)_GLKTextureErrorWithCodeAndErrorString(17, (uint64_t)CFSTR("Invalid EAGL context"));
  return 0;
}

+ (GLKTextureInfo)textureWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)outError
{
  if (objc_msgSend(MEMORY[0x24BDE2818], "currentContext"))
    return (GLKTextureInfo *)objc_msgSend(a1, "commonTextureWithContentsOfURL:options:error:lock:glContext:", url, options, outError, 0, 0);
  if (outError)
    *outError = (NSError *)_GLKTextureErrorWithCodeAndErrorString(17, (uint64_t)CFSTR("Invalid EAGL context"));
  return 0;
}

+ (GLKTextureInfo)textureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor bundle:(NSBundle *)bundle options:(NSDictionary *)options error:(NSError *)outError
{
  if (objc_msgSend(MEMORY[0x24BDE2818], "currentContext"))
    return (GLKTextureInfo *)objc_msgSend(a1, "commonTextureWithName:scaleFactor:bundle:options:error:lock:glContext:", name, bundle, options, outError, 0, 0, scaleFactor);
  if (outError)
    *outError = (NSError *)_GLKTextureErrorWithCodeAndErrorString(17, (uint64_t)CFSTR("Invalid EAGL context"));
  return 0;
}

+ (GLKTextureInfo)textureWithContentsOfData:(NSData *)data options:(NSDictionary *)options error:(NSError *)outError
{
  if (objc_msgSend(MEMORY[0x24BDE2818], "currentContext"))
    return (GLKTextureInfo *)objc_msgSend(a1, "commonTextureWithContentsOfData:options:error:lock:glContext:", data, options, outError, 0, 0);
  if (outError)
    *outError = (NSError *)_GLKTextureErrorWithCodeAndErrorString(17, (uint64_t)CFSTR("Invalid EAGL context"));
  return 0;
}

+ (GLKTextureInfo)textureWithCGImage:(CGImageRef)cgImage options:(NSDictionary *)options error:(NSError *)outError
{
  if (objc_msgSend(MEMORY[0x24BDE2818], "currentContext"))
    return (GLKTextureInfo *)objc_msgSend(a1, "commonTextureWithCGImage:options:error:lock:glContext:", cgImage, options, outError, 0, 0);
  if (outError)
    *outError = (NSError *)_GLKTextureErrorWithCodeAndErrorString(17, (uint64_t)CFSTR("Invalid EAGL context"));
  return 0;
}

+ (GLKTextureInfo)cubeMapWithContentsOfFiles:(NSArray *)paths options:(NSDictionary *)options error:(NSError *)outError
{
  if (objc_msgSend(MEMORY[0x24BDE2818], "currentContext"))
    return (GLKTextureInfo *)objc_msgSend(a1, "commonCubeMapWithContentsOfFiles:options:error:lock:glContext:", paths, options, outError, 0, 0);
  if (outError)
    *outError = (NSError *)_GLKTextureErrorWithCodeAndErrorString(17, (uint64_t)CFSTR("Invalid EAGL context"));
  return 0;
}

+ (GLKTextureInfo)cubeMapWithContentsOfFile:(NSString *)path options:(NSDictionary *)options error:(NSError *)outError
{
  if (objc_msgSend(MEMORY[0x24BDE2818], "currentContext"))
    return +[GLKTextureLoader cubeMapWithContentsOfURL:options:error:](GLKTextureLoader, "cubeMapWithContentsOfURL:options:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", path), options, outError);
  if (outError)
    *outError = (NSError *)_GLKTextureErrorWithCodeAndErrorString(17, (uint64_t)CFSTR("Invalid EAGL context"));
  return 0;
}

+ (GLKTextureInfo)cubeMapWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)outError
{
  if (objc_msgSend(MEMORY[0x24BDE2818], "currentContext"))
    return (GLKTextureInfo *)+[GLKTextureLoader commonCubeMapWithContentsOfURL:options:error:lock:glContext:](GLKTextureLoader, "commonCubeMapWithContentsOfURL:options:error:lock:glContext:", url, options, outError, 0, 0);
  if (outError)
    *outError = (NSError *)_GLKTextureErrorWithCodeAndErrorString(17, (uint64_t)CFSTR("Invalid EAGL context"));
  return 0;
}

- (void)textureWithContentsOfFile:(NSString *)path options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block
{
  -[GLKTextureLoader textureWithContentsOfURL:options:queue:completionHandler:](self, "textureWithContentsOfURL:options:queue:completionHandler:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", path), options, queue, block);
}

- (void)textureWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block
{
  NSObject *v10;
  NSObject *global_queue;
  _QWORD blocka[9];

  if (queue)
    v10 = queue;
  else
    v10 = MEMORY[0x24BDAC9B8];
  dispatch_retain(v10);
  global_queue = dispatch_get_global_queue(-2, 0);
  blocka[0] = MEMORY[0x24BDAC760];
  blocka[1] = 3221225472;
  blocka[2] = __77__GLKTextureLoader_textureWithContentsOfURL_options_queue_completionHandler___block_invoke;
  blocka[3] = &unk_24C848390;
  blocka[4] = url;
  blocka[5] = options;
  blocka[6] = self;
  blocka[7] = v10;
  blocka[8] = block;
  dispatch_async(global_queue, blocka);
}

void __77__GLKTextureLoader_textureWithContentsOfURL_options_queue_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD block[6];
  uint64_t v4;

  v4 = 0;
  v2 = +[GLKTextureLoader commonTextureWithContentsOfURL:options:error:lock:glContext:](GLKTextureLoader, "commonTextureWithContentsOfURL:options:error:lock:glContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &v4, objc_msgSend(*(id *)(a1 + 48), "nsLock"), objc_msgSend(*(id *)(a1 + 48), "glContext"));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__GLKTextureLoader_textureWithContentsOfURL_options_queue_completionHandler___block_invoke_2;
  block[3] = &unk_24C848368;
  block[4] = v2;
  block[5] = v4;
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), block);
}

void __77__GLKTextureLoader_textureWithContentsOfURL_options_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

- (void)textureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor bundle:(NSBundle *)bundle options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block
{
  NSObject *v14;
  NSObject *global_queue;
  _QWORD blocka[11];

  if (queue)
    v14 = queue;
  else
    v14 = MEMORY[0x24BDAC9B8];
  dispatch_retain(v14);
  global_queue = dispatch_get_global_queue(-2, 0);
  blocka[0] = MEMORY[0x24BDAC760];
  blocka[1] = 3221225472;
  blocka[2] = __87__GLKTextureLoader_textureWithName_scaleFactor_bundle_options_queue_completionHandler___block_invoke;
  blocka[3] = &unk_24C8483B8;
  *(CGFloat *)&blocka[10] = scaleFactor;
  blocka[4] = name;
  blocka[5] = bundle;
  blocka[6] = options;
  blocka[7] = self;
  blocka[8] = v14;
  blocka[9] = block;
  dispatch_async(global_queue, blocka);
}

void __87__GLKTextureLoader_textureWithName_scaleFactor_bundle_options_queue_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD block[6];
  uint64_t v4;

  v4 = 0;
  v2 = +[GLKTextureLoader commonTextureWithName:scaleFactor:bundle:options:error:lock:glContext:](GLKTextureLoader, "commonTextureWithName:scaleFactor:bundle:options:error:lock:glContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v4, objc_msgSend(*(id *)(a1 + 56), "nsLock"), objc_msgSend(*(id *)(a1 + 56), "glContext"), *(double *)(a1 + 80));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__GLKTextureLoader_textureWithName_scaleFactor_bundle_options_queue_completionHandler___block_invoke_2;
  block[3] = &unk_24C848368;
  block[4] = v2;
  block[5] = v4;
  dispatch_async(*(dispatch_queue_t *)(a1 + 64), block);
}

void __87__GLKTextureLoader_textureWithName_scaleFactor_bundle_options_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

- (void)textureWithContentsOfData:(NSData *)data options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block
{
  NSObject *v10;
  NSObject *global_queue;
  _QWORD blocka[9];

  if (queue)
    v10 = queue;
  else
    v10 = MEMORY[0x24BDAC9B8];
  dispatch_retain(v10);
  global_queue = dispatch_get_global_queue(-2, 0);
  blocka[0] = MEMORY[0x24BDAC760];
  blocka[1] = 3221225472;
  blocka[2] = __78__GLKTextureLoader_textureWithContentsOfData_options_queue_completionHandler___block_invoke;
  blocka[3] = &unk_24C848390;
  blocka[4] = data;
  blocka[5] = options;
  blocka[6] = self;
  blocka[7] = v10;
  blocka[8] = block;
  dispatch_async(global_queue, blocka);
}

void __78__GLKTextureLoader_textureWithContentsOfData_options_queue_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD block[6];
  uint64_t v4;

  v4 = 0;
  v2 = +[GLKTextureLoader commonTextureWithContentsOfData:options:error:lock:glContext:](GLKTextureLoader, "commonTextureWithContentsOfData:options:error:lock:glContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &v4, objc_msgSend(*(id *)(a1 + 48), "nsLock"), objc_msgSend(*(id *)(a1 + 48), "glContext"));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__GLKTextureLoader_textureWithContentsOfData_options_queue_completionHandler___block_invoke_2;
  block[3] = &unk_24C848368;
  block[4] = v2;
  block[5] = v4;
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), block);
}

void __78__GLKTextureLoader_textureWithContentsOfData_options_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

- (void)textureWithCGImage:(CGImageRef)cgImage options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block
{
  NSObject *v10;
  NSObject *global_queue;
  _QWORD blocka[9];

  if (queue)
    v10 = queue;
  else
    v10 = MEMORY[0x24BDAC9B8];
  dispatch_retain(v10);
  global_queue = dispatch_get_global_queue(-2, 0);
  blocka[0] = MEMORY[0x24BDAC760];
  blocka[1] = 3221225472;
  blocka[2] = __71__GLKTextureLoader_textureWithCGImage_options_queue_completionHandler___block_invoke;
  blocka[3] = &unk_24C8483E0;
  blocka[7] = block;
  blocka[8] = cgImage;
  blocka[4] = options;
  blocka[5] = self;
  blocka[6] = v10;
  dispatch_async(global_queue, blocka);
}

void __71__GLKTextureLoader_textureWithCGImage_options_queue_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD block[6];
  uint64_t v4;

  v4 = 0;
  v2 = +[GLKTextureLoader commonTextureWithCGImage:options:error:lock:glContext:](GLKTextureLoader, "commonTextureWithCGImage:options:error:lock:glContext:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), &v4, objc_msgSend(*(id *)(a1 + 40), "nsLock"), objc_msgSend(*(id *)(a1 + 40), "glContext"));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__GLKTextureLoader_textureWithCGImage_options_queue_completionHandler___block_invoke_2;
  block[3] = &unk_24C848368;
  block[4] = v2;
  block[5] = v4;
  dispatch_async(*(dispatch_queue_t *)(a1 + 48), block);
}

void __71__GLKTextureLoader_textureWithCGImage_options_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

- (void)cubeMapWithContentsOfFiles:(NSArray *)paths options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block
{
  NSObject *v10;
  NSObject *global_queue;
  _QWORD blocka[9];

  if (queue)
    v10 = queue;
  else
    v10 = MEMORY[0x24BDAC9B8];
  dispatch_retain(v10);
  global_queue = dispatch_get_global_queue(-2, 0);
  blocka[0] = MEMORY[0x24BDAC760];
  blocka[1] = 3221225472;
  blocka[2] = __79__GLKTextureLoader_cubeMapWithContentsOfFiles_options_queue_completionHandler___block_invoke;
  blocka[3] = &unk_24C848390;
  blocka[4] = paths;
  blocka[5] = options;
  blocka[6] = self;
  blocka[7] = v10;
  blocka[8] = block;
  dispatch_async(global_queue, blocka);
}

void __79__GLKTextureLoader_cubeMapWithContentsOfFiles_options_queue_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD block[6];
  uint64_t v4;

  v4 = 0;
  v2 = +[GLKTextureLoader commonCubeMapWithContentsOfFiles:options:error:lock:glContext:](GLKTextureLoader, "commonCubeMapWithContentsOfFiles:options:error:lock:glContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &v4, objc_msgSend(*(id *)(a1 + 48), "nsLock"), objc_msgSend(*(id *)(a1 + 48), "glContext"));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__GLKTextureLoader_cubeMapWithContentsOfFiles_options_queue_completionHandler___block_invoke_2;
  block[3] = &unk_24C848368;
  block[4] = v2;
  block[5] = v4;
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), block);
}

void __79__GLKTextureLoader_cubeMapWithContentsOfFiles_options_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

- (void)cubeMapWithContentsOfFile:(NSString *)path options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block
{
  -[GLKTextureLoader cubeMapWithContentsOfURL:options:queue:completionHandler:](self, "cubeMapWithContentsOfURL:options:queue:completionHandler:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", path), options, queue, block);
}

- (void)cubeMapWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block
{
  NSObject *v10;
  NSObject *global_queue;
  _QWORD blocka[9];

  if (queue)
    v10 = queue;
  else
    v10 = MEMORY[0x24BDAC9B8];
  dispatch_retain(v10);
  global_queue = dispatch_get_global_queue(-2, 0);
  blocka[0] = MEMORY[0x24BDAC760];
  blocka[1] = 3221225472;
  blocka[2] = __77__GLKTextureLoader_cubeMapWithContentsOfURL_options_queue_completionHandler___block_invoke;
  blocka[3] = &unk_24C848390;
  blocka[4] = url;
  blocka[5] = options;
  blocka[6] = self;
  blocka[7] = v10;
  blocka[8] = block;
  dispatch_async(global_queue, blocka);
}

void __77__GLKTextureLoader_cubeMapWithContentsOfURL_options_queue_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD block[6];
  uint64_t v4;

  v4 = 0;
  v2 = +[GLKTextureLoader commonCubeMapWithContentsOfURL:options:error:lock:glContext:](GLKTextureLoader, "commonCubeMapWithContentsOfURL:options:error:lock:glContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &v4, objc_msgSend(*(id *)(a1 + 48), "nsLock"), objc_msgSend(*(id *)(a1 + 48), "glContext"));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__GLKTextureLoader_cubeMapWithContentsOfURL_options_queue_completionHandler___block_invoke_2;
  block[3] = &unk_24C848368;
  block[4] = v2;
  block[5] = v4;
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), block);
}

void __77__GLKTextureLoader_cubeMapWithContentsOfURL_options_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

- (EAGLContext)glContext
{
  return (EAGLContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGlContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSLock)nsLock
{
  return (NSLock *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNsLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)supportsASTC_LDR
{
  return self->_supportsASTC_LDR;
}

- (void)setSupportsASTC_LDR:(BOOL)a3
{
  self->_supportsASTC_LDR = a3;
}

- (BOOL)supportsETC2
{
  return self->_supportsETC2;
}

- (void)setSupportsETC2:(BOOL)a3
{
  self->_supportsETC2 = a3;
}

@end
