@implementation BWVideoFormatRequirements

- (void)setSupportedColorSpaceProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BWVideoFormatRequirements)init
{
  BWVideoFormatRequirements *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVideoFormatRequirements;
  result = -[BWFormatRequirements init](&v3, sel_init);
  if (result)
  {
    result->_prewireBuffers = 1;
    result->_memoryPoolUseAllowed = 1;
  }
  return result;
}

- (id)_resolvePixelFormat
{
  id *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = (id *)objc_msgSend(result[4], "count");
    if ((unint64_t)result >= 2)
    {
      v2 = v1[4];
      v3 = v1[5];
      if (v3)
      {
        v13 = 0u;
        v14 = 0u;
        v11 = 0u;
        v12 = 0u;
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        if (v4)
        {
          v5 = v4;
          v6 = 0;
          v7 = *(_QWORD *)v12;
          do
          {
            for (i = 0; i != v5; ++i)
            {
              if (*(_QWORD *)v12 != v7)
                objc_enumerationMutation(v3);
              v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
              if (objc_msgSend(v2, "containsObject:", v9))
              {
                if (!v6)
                  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                objc_msgSend(v6, "addObject:", v9);
              }
            }
            v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
          }
          while (v5);
        }
        else
        {
          v6 = 0;
        }
        if (objc_msgSend(v6, "count"))
          v2 = v6;
      }
      v10 = FigCapturePixelFormatWithLeastAverageBandwidth(v2);

      v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
      result = (id *)(id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v1[4] = result;
    }
  }
  return result;
}

- (NSArray)supportedPixelFormats
{
  return self->_supportedPixelFormats;
}

- (NSArray)supportedCacheModes
{
  return self->_supportedCacheModes;
}

- (NSArray)supportedColorSpaceProperties
{
  return self->_supportedColorSpaceProperties;
}

- (unint64_t)height
{
  return self->_height;
}

- (uint64_t)_resolveWith:(uint64_t)result printErrors:(void *)a2
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  int v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  int v17;
  char v18;
  id v19;
  char v20;
  char v21;

  if (!result)
    return result;
  v3 = result;
  v4 = objc_msgSend(a2, "width");
  v5 = *(_QWORD *)(v3 + 8);
  if (v5)
    v6 = v5 == v4;
  else
    v6 = 1;
  v7 = v6;
  if (v4 && v7)
  {
    *(_QWORD *)(v3 + 8) = v4;
  }
  else
  {
    v8 = v7 ^ 1;
    if (!v4)
      v8 = 0;
    if ((v8 & 1) != 0)
      return 0;
  }
  v9 = objc_msgSend(a2, "height");
  v10 = *(_QWORD *)(v3 + 16);
  if (v10)
    v11 = v10 == v9;
  else
    v11 = 1;
  v12 = v11;
  if (v9 && v12)
  {
    *(_QWORD *)(v3 + 16) = v9;
  }
  else
  {
    v13 = v12 ^ 1;
    if (!v9)
      v13 = 0;
    if ((v13 & 1) != 0)
      return 0;
  }
  v14 = objc_msgSend(a2, "sliceCount");
  v15 = *(_QWORD *)(v3 + 24);
  if (v15)
    v16 = v15 == v14;
  else
    v16 = 1;
  v17 = v16;
  if (!v14 || !v17)
  {
    v18 = v17 ^ 1;
    if (!v14)
      v18 = 0;
    if ((v18 & 1) == 0)
      goto LABEL_38;
    return 0;
  }
  *(_QWORD *)(v3 + 24) = v14;
LABEL_38:
  result = vfr_resolveNumericalArrays((id *)(v3 + 32), (void *)objc_msgSend(a2, "supportedPixelFormats"));
  if ((_DWORD)result)
  {
    vfr_resolveNumericalArrays((id *)(v3 + 40), (void *)objc_msgSend(a2, "preferredPixelFormats"));
    v19 = (id)objc_msgSend(*(id *)(v3 + 40), "bw_intersectWithArray:", *(_QWORD *)(v3 + 32));

    *(_QWORD *)(v3 + 40) = v19;
    result = vfr_resolveNumericalArrays((id *)(v3 + 48), (void *)objc_msgSend(a2, "supportedColorSpaceProperties"));
    if ((_DWORD)result)
    {
      result = vfr_resolveNumericalArrays((id *)(v3 + 88), (void *)objc_msgSend(a2, "supportedCacheModes"));
      if ((_DWORD)result)
      {
        vfr_resolveOptionalAlignmentFactors((uint64_t *)(v3 + 56), objc_msgSend(a2, "bytesPerRowAlignment"));
        vfr_resolveOptionalAlignmentFactors((uint64_t *)(v3 + 64), objc_msgSend(a2, "planeAlignment"));
        vfr_resolveOptionalAlignmentFactors((uint64_t *)(v3 + 72), objc_msgSend(a2, "widthAlignment"));
        vfr_resolveOptionalAlignmentFactors((uint64_t *)(v3 + 80), objc_msgSend(a2, "heightAlignment"));
        if (*(_BYTE *)(v3 + 96))
          v20 = objc_msgSend(a2, "prewireBuffers");
        else
          v20 = 0;
        *(_BYTE *)(v3 + 96) = v20;
        if (*(_BYTE *)(v3 + 97) && (objc_msgSend(a2, "memoryPoolUseAllowed"), *(_BYTE *)(v3 + 97)))
          v21 = objc_msgSend(a2, "memoryPoolUseAllowed");
        else
          v21 = 0;
        *(_BYTE *)(v3 + 97) = v21;
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)memoryPoolUseAllowed
{
  return self->_memoryPoolUseAllowed;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v11;
  uint64_t v13;
  uint64_t v14;

  if (a3 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v13 = v4;
    v14 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(a3, "width") == self->_width
      && objc_msgSend(a3, "height") == self->_height
      && objc_msgSend(a3, "sliceCount") == self->_sliceCount
      && objc_msgSend(a3, "bytesPerRowAlignment") == self->_bytesPerRowAlignment
      && objc_msgSend(a3, "planeAlignment") == self->_planeAlignment
      && objc_msgSend(a3, "widthAlignment") == self->_widthAlignment
      && objc_msgSend(a3, "heightAlignment") == self->_heightAlignment
      && self->_prewireBuffers == objc_msgSend(a3, "prewireBuffers")
      && self->_memoryPoolUseAllowed == objc_msgSend(a3, "memoryPoolUseAllowed"))
    {
      if (((NSArray *)objc_msgSend(a3, "supportedPixelFormats") == self->_supportedPixelFormats
         || (v11 = objc_msgSend((id)objc_msgSend(a3, "supportedPixelFormats"), "isEqual:", self->_supportedPixelFormats)) != 0)
        && ((NSArray *)objc_msgSend(a3, "preferredPixelFormats", v6, v5, v13, v14, v7, v8) == self->_preferredPixelFormats
         || (v11 = objc_msgSend((id)objc_msgSend(a3, "preferredPixelFormats"), "isEqual:", self->_preferredPixelFormats)) != 0)
        && ((NSArray *)objc_msgSend(a3, "supportedColorSpaceProperties") == self->_supportedColorSpaceProperties
         || (v11 = objc_msgSend((id)objc_msgSend(a3, "supportedColorSpaceProperties"), "isEqual:", self->_supportedColorSpaceProperties)) != 0))
      {
        if ((NSArray *)objc_msgSend(a3, "supportedCacheModes") == self->_supportedCacheModes)
          LOBYTE(v11) = 1;
        else
          LOBYTE(v11) = objc_msgSend((id)objc_msgSend(a3, "supportedCacheModes"), "isEqual:", self->_supportedCacheModes);
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  return v11;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)sliceCount
{
  return self->_sliceCount;
}

- (unint64_t)bytesPerRowAlignment
{
  return self->_bytesPerRowAlignment;
}

- (unint64_t)planeAlignment
{
  return self->_planeAlignment;
}

- (BOOL)prewireBuffers
{
  return self->_prewireBuffers;
}

- (unint64_t)widthAlignment
{
  return self->_widthAlignment;
}

- (unint64_t)heightAlignment
{
  return self->_heightAlignment;
}

- (NSArray)preferredPixelFormats
{
  return self->_preferredPixelFormats;
}

- (void)setSupportedCacheModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (Class)formatClass
{
  return (Class)objc_opt_class();
}

- (BWVideoFormatRequirements)initWithPixelBufferAttributes:(id)a3
{
  BWVideoFormatRequirements *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *supportedCacheModes;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t width;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t height;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  objc_super v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v34.receiver = self;
    v34.super_class = (Class)BWVideoFormatRequirements;
    v4 = -[BWFormatRequirements init](&v34, sel_init);
    if (v4)
    {
      v33 = *MEMORY[0x1E0CA90E0];
      v4->_width = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:"), "unsignedIntegerValue");
      v32 = *MEMORY[0x1E0CA8FD8];
      v4->_height = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:"), "unsignedIntegerValue");
      v4->_sliceCount = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9018]), "unsignedIntegerValue");
      v31 = *MEMORY[0x1E0CA9040];
      v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35[0] = v5;
        v6 = (NSArray *)(id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      }
      else
      {
        v6 = (NSArray *)objc_msgSend(v5, "copy");
      }
      v4->_supportedPixelFormats = v6;
      v7 = *MEMORY[0x1E0CA8F68];
      v4->_bytesPerRowAlignment = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8F68]), "unsignedIntegerValue");
      v8 = *MEMORY[0x1E0CA9048];
      v4->_planeAlignment = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9048]), "unsignedIntegerValue");
      v9 = *MEMORY[0x1E0CA8F80];
      v10 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8F80]);
      if (objc_msgSend(v10, "count"))
        v4->_supportedCacheModes = (NSArray *)objc_msgSend(v10, "copy");
      v4->_prewireBuffers = 1;
      v4->_memoryPoolUseAllowed = 1;
      v11 = *MEMORY[0x1E0CA8FF0];
      v12 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FF0]);
      if (v12)
      {
        v13 = v12;
        v14 = objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CBBF10]);
        if (v14)
        {
          v15 = v14;
          supportedCacheModes = v4->_supportedCacheModes;
          if (!supportedCacheModes
            || (objc_msgSend(-[NSArray objectAtIndexedSubscript:](supportedCacheModes, "objectAtIndexedSubscript:", 0), "isEqual:", v15), !v4->_supportedCacheModes))
          {
            v4->_supportedCacheModes = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v15, 0);
          }
        }
        v17 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC188]);
        if (v17)
          v4->_prewireBuffers = objc_msgSend(v17, "BOOLValue");
      }
      v18 = *MEMORY[0x1E0CA8FB8];
      v19 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FB8]);
      if (v19)
      {
        width = v4->_width;
        if (width)
        {
          v21 = objc_msgSend(v19, "unsignedIntegerValue");
          v22 = v21 + 1;
          while ((v21 + width) % v22 || !(width % v22))
          {
            if (++v22 > 0x1000)
            {
              v22 = 0;
              break;
            }
          }
          v4->_widthAlignment = v22;
        }
      }
      v23 = *MEMORY[0x1E0CA8FA0];
      v24 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FA0]);
      if (v24)
      {
        height = v4->_height;
        if (height)
        {
          v26 = objc_msgSend(v24, "unsignedIntegerValue");
          v27 = v26 + 1;
          while ((v26 + height) % v27 || !(height % v27))
          {
            if (++v27 > 0x1000)
            {
              v27 = 0;
              break;
            }
          }
          v4->_heightAlignment = v27;
        }
      }
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v33, v32, v31, v7, v8, v9, v18, v23, v11, 0);
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", objc_msgSend(a3, "allKeys"));
      objc_msgSend(v29, "minusSet:", v28);
      objc_msgSend(v29, "count");

    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (NSDictionary)pixelBufferAttributes
{
  NSDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t widthAlignment;
  unint64_t width;
  unint64_t v10;
  uint64_t v12;
  unint64_t heightAlignment;
  unint64_t height;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  NSArray *supportedCacheModes;
  void *v20;
  void *v21;

  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  if (self->_width)
  {
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:");
    -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CA90E0]);
  }
  if (self->_height)
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:");
    -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CA8FD8]);
  }
  if (self->_sliceCount)
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:");
    -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CA9018]);
  }
  -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", self->_supportedPixelFormats, *MEMORY[0x1E0CA9040]);
  if (self->_bytesPerRowAlignment)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:");
    -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CA8F68]);
  }
  widthAlignment = self->_widthAlignment;
  if (widthAlignment)
  {
    width = self->_width;
    if (width)
    {
      v10 = width % widthAlignment;
      if (widthAlignment - v10 >= widthAlignment ? -(uint64_t)v10 : widthAlignment - v10)
      {
        v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:");
        -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CA8FB8]);
      }
    }
  }
  heightAlignment = self->_heightAlignment;
  if (heightAlignment)
  {
    height = self->_height;
    if (height)
    {
      v15 = height % heightAlignment;
      if (heightAlignment - v15 >= heightAlignment ? -(uint64_t)v15 : heightAlignment - v15)
      {
        v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:");
        -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CA8FA0]);
      }
    }
  }
  if (self->_planeAlignment)
  {
    v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:");
    -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CA9048]);
  }
  supportedCacheModes = self->_supportedCacheModes;
  if (supportedCacheModes)
    -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", supportedCacheModes, *MEMORY[0x1E0CA8F80]);
  v20 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = v20;
  if (!self->_prewireBuffers)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CBC188]);
  -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CA8FF0]);
  if (FigCapturePlatformIOSurfaceWiringAssertionEnabled())
    -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CA9000]);
  return v3;
}

- (void)setBytesPerRowAlignment:(unint64_t)a3
{
  self->_bytesPerRowAlignment = a3;
}

- (void)setHeightAlignment:(unint64_t)a3
{
  self->_heightAlignment = a3;
}

- (void)setPlaneAlignment:(unint64_t)a3
{
  self->_planeAlignment = a3;
}

- (void)setMemoryPoolUseAllowed:(BOOL)a3
{
  self->_memoryPoolUseAllowed = a3;
}

- (void)setWidthAlignment:(unint64_t)a3
{
  self->_widthAlignment = a3;
}

- (void)setSliceCount:(unint64_t)a3
{
  self->_sliceCount = a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVideoFormatRequirements;
  -[BWVideoFormatRequirements dealloc](&v3, sel_dealloc);
}

+ (id)cacheModesForOptimizedCPUAccess
{
  return vfr_cacheModesForOptimalAccess(0, 0);
}

- (void)setSupportedPixelFormats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (void)setPreferredPixelFormats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setPrewireBuffers:(BOOL)a3
{
  self->_prewireBuffers = a3;
}

+ (id)cacheModesForOptimizedHWAccess
{
  return vfr_cacheModesForOptimalAccess(1, 0);
}

+ (id)cacheModesForOptimizedDisplayAccess
{
  return vfr_cacheModesForOptimalAccess(1, 1);
}

+ (void)initialize
{
  objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)formatRequirements
{
  return objc_alloc_init((Class)a1);
}

- (BWVideoFormatRequirements)initWithCoder:(id)a3
{
  BWVideoFormatRequirements *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v4 = -[BWVideoFormatRequirements init](self, "init");
  if (v4)
  {
    v4->_width = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("width"));
    v4->_height = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("height"));
    v4->_sliceCount = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("numberOfSlices"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v8[0] = objc_opt_class();
    v8[1] = objc_opt_class();
    v6 = objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2));
    v4->_supportedPixelFormats = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v6, CFSTR("supportedPixelFormats"));
    v4->_preferredPixelFormats = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v6, CFSTR("preferredPixelFormats"));
    v4->_supportedColorSpaceProperties = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v6, CFSTR("supportedColorSpaceProperties"));
    v4->_bytesPerRowAlignment = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("bytesPerRowAlignment"));
    v4->_planeAlignment = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("planeAlignment"));
    v4->_widthAlignment = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("widthAlignment"));
    v4->_heightAlignment = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("heightAlignment"));
    v4->_supportedCacheModes = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v6, CFSTR("supportedCacheModes"));
    v4->_prewireBuffers = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("prewireBuffers"));
    v4->_memoryPoolUseAllowed = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("memoryPoolUseAllowed"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_width, CFSTR("width"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_height, CFSTR("height"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_sliceCount, CFSTR("numberOfSlices"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_supportedPixelFormats, CFSTR("supportedPixelFormats"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_preferredPixelFormats, CFSTR("preferredPixelFormats"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_supportedColorSpaceProperties, CFSTR("supportedColorSpaceProperties"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_bytesPerRowAlignment, CFSTR("bytesPerRowAlignment"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_planeAlignment, CFSTR("planeAlignment"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_widthAlignment, CFSTR("widthAlignment"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_heightAlignment, CFSTR("heightAlignment"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_supportedCacheModes, CFSTR("supportedCacheModes"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_prewireBuffers, CFSTR("prewireBuffers"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_memoryPoolUseAllowed, CFSTR("memoryPoolUseAllowed"));
}

- (unsigned)mediaType
{
  return 1986618469;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t widthAlignment;
  unint64_t width;
  unint64_t height;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t heightAlignment;
  unint64_t v12;
  unint64_t v13;
  const __CFString *v14;
  NSArray *supportedPixelFormats;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSArray *supportedColorSpaceProperties;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  const __CFString *v29;
  NSArray *supportedCacheModes;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  void *v37;
  unsigned int v38;
  unint64_t v39;
  const __CFString *v40;
  uint64_t v42;
  BWVideoFormatRequirements *v43;
  int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  v4 = v3;
  if (self->_width)
    objc_msgSend(v3, "appendFormat:", CFSTR("%i"), self->_width);
  else
    objc_msgSend(v3, "appendString:", CFSTR("[any width]"));
  objc_msgSend(v4, "appendString:", CFSTR(" x "));
  if (self->_height)
    objc_msgSend(v4, "appendFormat:", CFSTR("%i"), self->_height);
  else
    objc_msgSend(v4, "appendString:", CFSTR("[any height]"));
  if (self->_sliceCount)
    objc_msgSend(v4, "appendFormat:", CFSTR(" x %i"), self->_sliceCount);
  widthAlignment = self->_widthAlignment;
  if (widthAlignment || self->_heightAlignment)
  {
    width = self->_width;
    if (width && (height = self->_height) != 0)
    {
      if (width % widthAlignment)
        v8 = widthAlignment - width % widthAlignment;
      else
        v8 = 0;
      if (widthAlignment)
        v9 = v8;
      else
        v9 = 0;
      v10 = v9 + width;
      heightAlignment = self->_heightAlignment;
      if (height % heightAlignment)
        v12 = heightAlignment - height % heightAlignment;
      else
        v12 = 0;
      if (heightAlignment)
        v13 = v12;
      else
        v13 = 0;
      objc_msgSend(v4, "appendFormat:", CFSTR(" (%i x %i)"), v10, v13 + height);
    }
    else
    {
      if (widthAlignment)
        objc_msgSend(v4, "appendFormat:", CFSTR(", WidthAlignment = %i"), self->_widthAlignment);
      if (self->_heightAlignment)
        objc_msgSend(v4, "appendFormat:", CFSTR(", HeightAlignment = %i"), self->_heightAlignment, v42);
    }
  }
  objc_msgSend(v4, "appendString:", CFSTR(", "));
  if (-[NSArray count](self->_supportedPixelFormats, "count"))
  {
    if (-[NSArray count](self->_supportedPixelFormats, "count") == 1)
    {
      v14 = BWStringFromCVPixelFormatType(objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_supportedPixelFormats, "objectAtIndexedSubscript:", 0), "unsignedIntValue"));
    }
    else
    {
      objc_msgSend(v4, "appendString:", CFSTR("["));
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      supportedPixelFormats = self->_supportedPixelFormats;
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](supportedPixelFormats, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      if (v16)
      {
        v17 = v16;
        v18 = 0;
        v19 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v54 != v19)
              objc_enumerationMutation(supportedPixelFormats);
            v21 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            if (-v18 != (_DWORD)i)
              objc_msgSend(v4, "appendString:", CFSTR(", "));
            objc_msgSend(v4, "appendString:", BWStringFromCVPixelFormatType(objc_msgSend(v21, "unsignedIntValue")));
          }
          v18 += v17;
          v17 = -[NSArray countByEnumeratingWithState:objects:count:](supportedPixelFormats, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
        }
        while (v17);
      }
      v14 = CFSTR("]");
    }
  }
  else
  {
    v14 = CFSTR("[any pixel format]");
  }
  objc_msgSend(v4, "appendString:", v14);
  if (-[NSArray count](self->_supportedColorSpaceProperties, "count"))
  {
    objc_msgSend(v4, "appendString:", CFSTR(", ["));
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    supportedColorSpaceProperties = self->_supportedColorSpaceProperties;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](supportedColorSpaceProperties, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v23)
    {
      v24 = v23;
      v43 = self;
      v25 = 0;
      v26 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v50 != v26)
            objc_enumerationMutation(supportedColorSpaceProperties);
          v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          if (-v25 != (_DWORD)j)
            objc_msgSend(v4, "appendString:", CFSTR(", "));
          objc_msgSend(v4, "appendFormat:", CFSTR("%@"), BWColorSpacePropertiesToString(objc_msgSend(v28, "unsignedIntValue")));
        }
        v25 += v24;
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](supportedColorSpaceProperties, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v24);
      self = v43;
    }
    v29 = CFSTR("]");
  }
  else
  {
    v29 = CFSTR(", [any color space]");
  }
  objc_msgSend(v4, "appendString:", v29);
  if (self->_bytesPerRowAlignment)
    objc_msgSend(v4, "appendFormat:", CFSTR(", BPRAlignment = %i"), self->_bytesPerRowAlignment);
  if (self->_planeAlignment)
    objc_msgSend(v4, "appendFormat:", CFSTR(", PlaneAlignment = %i"), self->_planeAlignment);
  if (-[NSArray count](self->_supportedCacheModes, "count"))
  {
    objc_msgSend(v4, "appendString:", CFSTR(", CacheModes = ["));
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    supportedCacheModes = self->_supportedCacheModes;
    v31 = -[NSArray countByEnumeratingWithState:objects:count:](supportedCacheModes, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    if (v31)
    {
      v32 = v31;
      v33 = 0;
      v34 = *(_QWORD *)v46;
      do
      {
        v35 = 0;
        v44 = v33;
        v36 = -v33;
        do
        {
          if (*(_QWORD *)v46 != v34)
            objc_enumerationMutation(supportedCacheModes);
          v37 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v35);
          if (v36 != (_DWORD)v35)
            objc_msgSend(v4, "appendString:", CFSTR(", "));
          HIDWORD(v39) = objc_msgSend(v37, "unsignedIntValue");
          LODWORD(v39) = HIDWORD(v39);
          v38 = v39 >> 8;
          v40 = CFSTR("Unknown");
          if (v38 <= 7)
            v40 = off_1E49243C0[v38];
          objc_msgSend(v4, "appendString:", v40);
          ++v35;
        }
        while (v32 != v35);
        v33 = v44 + v32;
        v32 = -[NSArray countByEnumeratingWithState:objects:count:](supportedCacheModes, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      }
      while (v32);
    }
    objc_msgSend(v4, "appendString:", CFSTR("]"));
  }
  return v4;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), NSStringFromClass(v4), self, -[BWVideoFormatRequirements description](self, "description"));
}

+ (id)cacheModesForCacheProfile:(int)a3
{
  FigCreatePixelBufferAttributesWithIOSurfaceSupport();
  return 0;
}

@end
