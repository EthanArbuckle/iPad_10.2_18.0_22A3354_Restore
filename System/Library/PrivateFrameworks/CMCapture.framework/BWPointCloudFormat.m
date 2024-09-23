@implementation BWPointCloudFormat

+ (void)initialize
{
  objc_opt_class();
}

+ (id)formatByResolvingRequirements:(id)a3
{
  return (id)objc_msgSend(a1, "formatByResolvingRequirements:printErrors:", a3, 1);
}

+ (id)formatByResolvingRequirements:(id)a3 printErrors:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id result;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "count");
  if (!v5)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("requirements array must have 1 or more objects");
LABEL_20:
    objc_exception_throw((id)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v17, 0));
  }
  v6 = v5;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v7)
    goto LABEL_10;
  v8 = v7;
  v9 = *(_QWORD *)v19;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(a3);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = *MEMORY[0x1E0C99778];
        v17 = CFSTR("requirementsArray must contain BWPointCloudFormatRequirements objects");
        goto LABEL_20;
      }
      ++v10;
    }
    while (v8 != v10);
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v8);
LABEL_10:
  if (v6 == 1)
  {
    v11 = +[BWPointCloudFormat _formatRequirementsByResolvingFormatRequirements:withFormatRequirements:]((uint64_t)BWPointCloudFormat, (void *)objc_msgSend(a3, "firstObject"), 0);
  }
  else
  {
    v11 = 0;
    for (i = 1; v6 != i; ++i)
    {
      v14 = (void *)objc_msgSend(a3, "objectAtIndex:", i);
      if (!v11)
        v11 = (void *)objc_msgSend(a3, "objectAtIndex:", i - 1);
      result = +[BWPointCloudFormat _formatRequirementsByResolvingFormatRequirements:withFormatRequirements:]((uint64_t)BWPointCloudFormat, v11, v14);
      v11 = result;
      if (!result)
        return result;
    }
  }
  return -[BWPointCloudFormat _initWithResolvedFormatRequirements:]([BWPointCloudFormat alloc], v11);
}

+ (BWPointCloudFormatRequirements)_formatRequirementsByResolvingFormatRequirements:(void *)a3 withFormatRequirements:
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BWPointCloudFormatRequirements *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = (void *)objc_msgSend(a2, "supportedDataFormats");
  v6 = (void *)objc_msgSend(a3, "supportedDataFormats");
  if (objc_msgSend(v5, "count") && objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v5);
          v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v6, "containsObject:", v12))
            objc_msgSend(v7, "addObject:", v12);
        }
        v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }
  }
  else if (objc_msgSend(v5, "count"))
  {
    v7 = v5;
  }
  else
  {
    v7 = v6;
  }
  v13 = objc_msgSend(a2, "maxPoints");
  v14 = objc_msgSend(a3, "maxPoints");
  v15 = v14;
  if (v13 && v14 && v13 != v14)
    return 0;
  v16 = objc_msgSend(a2, "dataBufferSize");
  v17 = objc_msgSend(a3, "dataBufferSize");
  v18 = v17;
  if (v16)
  {
    if (v17 && v16 != v17)
      return 0;
  }
  v19 = objc_alloc_init(BWPointCloudFormatRequirements);
  -[BWPointCloudFormatRequirements setSupportedDataFormats:](v19, "setSupportedDataFormats:", v7);
  if (v13)
    v20 = v13;
  else
    v20 = v15;
  -[BWPointCloudFormatRequirements setMaxPoints:](v19, "setMaxPoints:", v20);
  if (v16)
    v21 = v16;
  else
    v21 = v18;
  -[BWPointCloudFormatRequirements setDataBufferSize:](v19, "setDataBufferSize:", v21);
  return v19;
}

- (_QWORD)_initWithResolvedFormatRequirements:(void *)a1
{
  _QWORD *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)BWPointCloudFormat;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3)
  {
    v3[4] = objc_msgSend((id)objc_msgSend(a2, "dataBufferAttributes"), "copy");
    *((_DWORD *)v3 + 6) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "supportedDataFormats"), "firstObject"), "intValue");
    v3[1] = objc_msgSend(a2, "maxPoints");
    v3[2] = objc_msgSend(a2, "dataBufferSize");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWPointCloudFormat;
  -[BWPointCloudFormat dealloc](&v3, sel_dealloc);
}

- (unsigned)mediaType
{
  return 1885564004;
}

- (NSString)description
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@, %ld points (%ld bytes)"), BWStringFromCVPixelFormatType(self->_dataFormat), self->_maxPoints, self->_dataBufferSize);
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), NSStringFromClass(v4), self, -[BWPointCloudFormat description](self, "description"));
}

- (opaqueCMFormatDescription)formatDescription
{
  uint64_t v3;
  const __CFDictionary *v4;
  opaqueCMFormatDescription *result;
  CFTypeRef arg;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  arg = 0;
  v7[0] = *MEMORY[0x1E0CA4A58];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[BWPointCloudFormat maxPoints](self, "maxPoints"));
  v7[1] = *MEMORY[0x1E0CA2240];
  v8[0] = v3;
  v8[1] = MEMORY[0x1E0C9AA70];
  v4 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  CMFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], -[BWPointCloudFormat mediaType](self, "mediaType"), -[BWPointCloudFormat dataFormat](self, "dataFormat"), v4, (CMFormatDescriptionRef *)&arg);
  result = (opaqueCMFormatDescription *)arg;
  if (arg)
    return (opaqueCMFormatDescription *)CFAutorelease(arg);
  return result;
}

- (NSDictionary)dataBufferAttributes
{
  return self->_dataBufferAttributes;
}

- (unint64_t)maxPoints
{
  return self->_maxPoints;
}

- (unsigned)dataFormat
{
  return self->_dataFormat;
}

- (unint64_t)dataBufferSize
{
  return self->_dataBufferSize;
}

@end
