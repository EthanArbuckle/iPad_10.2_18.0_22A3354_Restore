@implementation BWPointCloudFormatRequirements

- (BWPointCloudFormatRequirements)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWPointCloudFormatRequirements;
  return -[BWFormatRequirements init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWPointCloudFormatRequirements;
  -[BWPointCloudFormatRequirements dealloc](&v3, sel_dealloc);
}

- (BWPointCloudFormatRequirements)initWithCoder:(id)a3
{
  BWPointCloudFormatRequirements *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v4 = -[BWPointCloudFormatRequirements init](self, "init");
  if (v4)
  {
    v4->_maxPoints = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("maxPoints"));
    v4->_dataBufferSize = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("dataBufferSize"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v7[0] = objc_opt_class();
    v7[1] = objc_opt_class();
    v4->_supportedDataFormats = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2)), CFSTR("supportedDataFormats"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_maxPoints, CFSTR("maxPoints"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_dataBufferSize, CFSTR("dataBufferSize"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_supportedDataFormats, CFSTR("supportedDataFormats"));
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || objc_msgSend(a3, "maxPoints") != self->_maxPoints
    || objc_msgSend(a3, "dataBufferSize") != self->_dataBufferSize)
  {
    return 0;
  }
  if ((NSArray *)objc_msgSend(a3, "supportedDataFormats") == self->_supportedDataFormats)
    return 1;
  return objc_msgSend((id)objc_msgSend(a3, "supportedDataFormats"), "isEqual:", self->_supportedDataFormats);
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_supportedDataFormats, "hash");
}

- (unsigned)mediaType
{
  return 1885564004;
}

- (Class)formatClass
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  NSArray *supportedDataFormats;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  v4 = v3;
  if (self->_maxPoints)
    objc_msgSend(v3, "appendFormat:", CFSTR("%i"), self->_maxPoints);
  else
    objc_msgSend(v3, "appendString:", CFSTR("[any points]"));
  objc_msgSend(v4, "appendString:", CFSTR(", "));
  if (-[NSArray count](self->_supportedDataFormats, "count"))
  {
    if (-[NSArray count](self->_supportedDataFormats, "count") == 1)
    {
      v5 = BWStringFromCVPixelFormatType(objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_supportedDataFormats, "objectAtIndexedSubscript:", 0), "unsignedIntValue"));
    }
    else
    {
      objc_msgSend(v4, "appendString:", CFSTR("["));
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      supportedDataFormats = self->_supportedDataFormats;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](supportedDataFormats, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        v10 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(supportedDataFormats);
            v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
            if (-v9 != (_DWORD)i)
              objc_msgSend(v4, "appendString:", CFSTR(", "));
            objc_msgSend(v4, "appendString:", BWStringFromCVPixelFormatType(objc_msgSend(v12, "unsignedIntValue")));
          }
          v9 += v8;
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](supportedDataFormats, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v8);
      }
      v5 = CFSTR("]");
    }
  }
  else
  {
    v5 = CFSTR("[any format]");
  }
  objc_msgSend(v4, "appendString:", v5);
  return v4;
}

- (NSDictionary)dataBufferAttributes
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CA8C80];
  v4[0] = MEMORY[0x1E0C9AAB0];
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
}

- (unint64_t)maxPoints
{
  return self->_maxPoints;
}

- (void)setMaxPoints:(unint64_t)a3
{
  self->_maxPoints = a3;
}

- (NSArray)supportedDataFormats
{
  return self->_supportedDataFormats;
}

- (void)setSupportedDataFormats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)dataBufferSize
{
  return self->_dataBufferSize;
}

- (void)setDataBufferSize:(unint64_t)a3
{
  self->_dataBufferSize = a3;
}

- (BOOL)memoryPoolUseAllowed
{
  return self->_memoryPoolUseAllowed;
}

- (void)setMemoryPoolUseAllowed:(BOOL)a3
{
  self->_memoryPoolUseAllowed = a3;
}

@end
