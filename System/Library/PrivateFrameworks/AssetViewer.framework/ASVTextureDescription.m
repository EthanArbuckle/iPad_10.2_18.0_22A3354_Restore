@implementation ASVTextureDescription

- (ASVTextureDescription)initWithName:(id)a3 originalSize:(id)a4 originalPixelFormat:(id)a5 destinationPixelFormat:(int64_t)a6 downsamplingFactor:(int64_t)a7 fileType:(BOOL)a8 generateMipmaps:
{
  uint64_t v8;
  int64_t var1;
  int64_t var0;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  id v17;
  ASVTextureDescription *v18;
  ASVTextureDescription *v19;
  objc_super v21;

  var1 = a5.var1;
  var0 = a5.var0;
  v12 = a4.var1;
  v13 = a4.var0;
  v14 = v8;
  v17 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ASVTextureDescription;
  v18 = -[ASVTextureDescription init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    *(_QWORD *)&v18->_originalSize[7] = v14;
    v18->_originalPixelFormat.colorModel = v13;
    v18->_originalPixelFormat.pixelEncoding = v12;
    v18->_destinationPixelFormat.colorModel = var0;
    v18->_destinationPixelFormat.pixelEncoding = var1;
    v18->_downsamplingFactor = a6;
    v18->_fileType = a7;
    objc_storeStrong((id *)&v18->_name, a3);
    v19->_generateMipmaps = a8;
  }

  return v19;
}

- (ASVTextureDescription)initWithName:(id)a3 destinationPixelFormat:(id)a4 imageProperties:(__CFDictionary *)a5 fileType:(__CFString *)a6 generateMipmaps:(BOOL)a7
{
  int64_t var1;
  int64_t var0;
  id v14;
  ASVTextureDescription *v15;
  ASVTextureDescription *v16;
  uint64_t v17;
  const __CFNumber *Value;
  const __CFNumber *v19;
  const __CFNumber *v20;
  BOOL v21;
  ASVTextureDescription *v23;
  const __CFNumber *v24;
  const void *v25;
  const void *v26;
  const void *v27;
  const __CFBoolean *v29;
  int v30;
  uint64_t v31;
  uint64_t v33;
  int64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t valuePtr;
  objc_super v39;

  var1 = a4.var1;
  var0 = a4.var0;
  v14 = a3;
  v39.receiver = self;
  v39.super_class = (Class)ASVTextureDescription;
  v15 = -[ASVTextureDescription init](&v39, sel_init);
  v16 = v15;
  if (!v15)
    goto LABEL_39;
  objc_storeStrong((id *)&v15->_name, a3);
  v16->_generateMipmaps = a7;
  v17 = 1;
  v16->_downsamplingFactor = 1;
  if (!CFEqual(a6, (CFTypeRef)*MEMORY[0x1E0CA5BA8]))
  {
    if (CFEqual(a6, (CFTypeRef)*MEMORY[0x1E0CA5C10]))
    {
      v17 = 2;
    }
    else if (CFEqual(a6, (CFTypeRef)*MEMORY[0x1E0CA5C80]))
    {
      v17 = 3;
    }
    else if (CFEqual(a6, CFSTR("public.heic")) || CFEqual(a6, CFSTR("public.heif")))
    {
      v17 = 4;
    }
    else if (CFEqual(a6, (CFTypeRef)*MEMORY[0x1E0CA5B68]))
    {
      v17 = 5;
    }
    else
    {
      v17 = 6;
    }
  }
  v16->_fileType = v17;
  Value = (const __CFNumber *)CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0CBD048]);
  v19 = (const __CFNumber *)CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0CBD040]);
  v20 = (const __CFNumber *)CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0CBCA08]);
  if (Value)
    v21 = v19 == 0;
  else
    v21 = 1;
  if (!v21 && v20 != 0)
  {
    v24 = v20;
    v37 = 0;
    valuePtr = 0;
    CFNumberGetValue(Value, kCFNumberNSIntegerType, &valuePtr);
    CFNumberGetValue(v19, kCFNumberNSIntegerType, &v37);
    *(_QWORD *)&v16->_originalSize[7] = __PAIR64__(v37, valuePtr);
    v36 = 0;
    CFNumberGetValue(v24, kCFNumberNSIntegerType, &v36);
    v25 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0CBC8C8]);
    v26 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0CBCF38]);
    v27 = (const void *)*MEMORY[0x1E0CBCEA0];
    if (CFDictionaryContainsKey(a5, (const void *)*MEMORY[0x1E0CBCEA0]))
    {
      v29 = (const __CFBoolean *)CFDictionaryGetValue(a5, v27);
      v30 = CFBooleanGetValue(v29);
      if (!v25)
        goto LABEL_36;
    }
    else
    {
      v30 = 0;
      if (!v25)
        goto LABEL_36;
    }
    if (CFEqual(v25, (CFTypeRef)*MEMORY[0x1E0CBC8D8]))
    {
      v31 = 1;
      if (v30)
        v31 = 2;
      if (v36 < 9 && *MEMORY[0x1E0C9AE50] == (_QWORD)v26)
        v33 = 6;
      else
        v33 = v31;
LABEL_37:
      v34 = +[ASVTextureDescription pixelEncodingForBitsPerComponent:](ASVTextureDescription, "pixelEncodingForBitsPerComponent:", v36);
      v16->_originalPixelFormat.colorModel = v33;
      v16->_originalPixelFormat.pixelEncoding = v34;
      v16->_destinationPixelFormat.colorModel = var0;
      v16->_destinationPixelFormat.pixelEncoding = var1;
      if (var0)
      {
        if (var1)
        {
LABEL_39:
          v23 = v16;
          goto LABEL_40;
        }
      }
      else
      {
        v16->_destinationPixelFormat.colorModel = v33;
        if (var1)
          goto LABEL_39;
      }
      v16->_destinationPixelFormat.pixelEncoding = v34;
      goto LABEL_39;
    }
    if (CFEqual(v25, (CFTypeRef)*MEMORY[0x1E0CBC8D0]))
    {
      if (v30)
        v33 = 5;
      else
        v33 = 4;
      goto LABEL_37;
    }
LABEL_36:
    v33 = 0;
    goto LABEL_37;
  }
  v23 = 0;
LABEL_40:

  return v23;
}

- (__n64)destinationSize
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  __n64 result;

  objc_msgSend(a1, "originalSize");
  v3 = v2 / objc_msgSend(a1, "downsamplingFactor");
  objc_msgSend(a1, "originalSize");
  v5 = v4;
  v6 = objc_msgSend(a1, "downsamplingFactor");
  result.n64_u32[0] = v3;
  result.n64_u32[1] = v5 / v6;
  return result;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ASVTextureDescription name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVTextureDescription originalSize](self, "originalSize");
  v6 = v5;
  -[ASVTextureDescription originalSize](self, "originalSize");
  v8 = v7;
  -[ASVTextureDescription destinationSize](self, "destinationSize");
  v10 = v9;
  -[ASVTextureDescription destinationSize](self, "destinationSize");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: original (%d, %d), destination (%d, %d)"), v4, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)requiresDownsampling
{
  return -[ASVTextureDescription downsamplingFactor](self, "downsamplingFactor") > 1;
}

+ (unint64_t)bytesPerComponentForColorModel:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  else
    return qword_1D94E1E18[a3 - 1];
}

+ (unint64_t)bytesPerComponentForPixelEncoding:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return qword_1D94E1E48[a3 - 1];
}

+ (int64_t)pixelEncodingForBitsPerComponent:(unint64_t)a3
{
  int64_t v3;

  v3 = 3;
  if (a3 != 32)
    v3 = 0;
  if (a3 == 16)
    v3 = 2;
  if (a3 < 9)
    return 1;
  else
    return v3;
}

+ (unint64_t)bytesPerPixelForPixelFormat:(id)a3
{
  int64_t var1;
  unint64_t v4;

  var1 = a3.var1;
  v4 = +[ASVTextureDescription bytesPerComponentForColorModel:](ASVTextureDescription, "bytesPerComponentForColorModel:", a3.var0);
  return +[ASVTextureDescription bytesPerComponentForPixelEncoding:](ASVTextureDescription, "bytesPerComponentForPixelEncoding:", var1)* v4;
}

- (double)originalSize
{
  return *(double *)(a1 + 16);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)originalPixelFormat
{
  int64_t pixelEncoding;
  int64_t colorModel;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  pixelEncoding = self->_originalPixelFormat.pixelEncoding;
  colorModel = self->_originalPixelFormat.colorModel;
  result.var1 = pixelEncoding;
  result.var0 = colorModel;
  return result;
}

- (int64_t)downsamplingFactor
{
  return self->_downsamplingFactor;
}

- (void)setDownsamplingFactor:(int64_t)a3
{
  self->_downsamplingFactor = a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)destinationPixelFormat
{
  int64_t pixelEncoding;
  int64_t colorModel;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  pixelEncoding = self->_destinationPixelFormat.pixelEncoding;
  colorModel = self->_destinationPixelFormat.colorModel;
  result.var1 = pixelEncoding;
  result.var0 = colorModel;
  return result;
}

- (int64_t)fileType
{
  return self->_fileType;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)generateMipmaps
{
  return self->_generateMipmaps;
}

- (void)setGenerateMipmaps:(BOOL)a3
{
  self->_generateMipmaps = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
