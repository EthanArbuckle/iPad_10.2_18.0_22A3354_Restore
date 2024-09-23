@implementation CNDetection

- (CNDetection)initWithTime:(CMTime *)time detectionType:(CNDetectionType)detectionType normalizedRect:(CGRect)normalizedRect focusDisparity:(float)focusDisparity
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  double v15;
  void *v16;
  CNDetection *v17;
  CMTime v19;

  height = normalizedRect.size.height;
  width = normalizedRect.size.width;
  y = normalizedRect.origin.y;
  x = normalizedRect.origin.x;
  v14 = objc_alloc(MEMORY[0x24BE74B58]);
  v19 = *time;
  *(float *)&v15 = focusDisparity;
  v16 = (void *)objc_msgSend(v14, "initWithTime:rect:focusDistance:", &v19, x, y, width, height, v15);
  objc_msgSend(v16, "setDetectionType:", detectionType);
  objc_msgSend(v16, "setTrackIdentifier:", -1);
  objc_msgSend(v16, "setGroupIdentifier:", -1);
  v17 = -[CNDetection _initTakingInternalDetection:](self, "_initTakingInternalDetection:", v16);

  return v17;
}

- (CMTime)time
{
  CMTime *result;

  result = (CMTime *)self->_internalDetection;
  if (result)
    return (CMTime *)-[CMTime time](result, "time");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (CNDetectionType)detectionType
{
  return -[PTCinematographyDetection detectionType](self->_internalDetection, "detectionType");
}

- (CNDetectionID)detectionID
{
  return -[PTCinematographyDetection trackIdentifier](self->_internalDetection, "trackIdentifier");
}

- (CNDetectionGroupID)detectionGroupID
{
  return -[PTCinematographyDetection groupIdentifier](self->_internalDetection, "groupIdentifier");
}

- (CGRect)normalizedRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[PTCinematographyDetection rect](self->_internalDetection, "rect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (float)focusDisparity
{
  float result;

  -[PTCinematographyDetection focusDistance](self->_internalDetection, "focusDistance");
  return result;
}

+ (int64_t)invalidDetectionID
{
  return -1;
}

+ (int64_t)invalidDetectionGroupID
{
  return -1;
}

+ (NSString)accessibilityLabelForDetectionType:(CNDetectionType)detectionType
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE74B58], "accessibilityLabelForDetectionType:", detectionType);
}

+ (BOOL)isValidDetectionID:(CNDetectionID)detectionID
{
  return PTTrackIDIsValid();
}

+ (BOOL)isValidDetectionGroupID:(CNDetectionGroupID)detectionGroupID
{
  return PTGroupIDIsValid();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CNDetection internalDetection](self, "internalDetection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internalDetection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CNDetection internalDetection](self, "internalDetection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initCopyingInternalDetection:", self->_internalDetection);
}

- (id)_initTakingInternalDetection:(id)a3
{
  id v5;
  CNDetection *v6;
  CNDetection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNDetection;
  v6 = -[CNDetection init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_internalDetection, a3);
    v7->_creationHash = -[CNDetection hash](v7, "hash");
  }

  return v7;
}

- (id)_initCopyingInternalDetection:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = -[CNDetection _initTakingInternalDetection:](self, "_initTakingInternalDetection:", v4);

  return v5;
}

+ (float)disparityInNormalizedRect:(CGRect)normalizedRect sourceDisparity:(CVPixelBufferRef)sourceDisparity detectionType:(CNDetectionType)detectionType priorDisparity:(float)priorDisparity
{
  float result;

  PTDisparityInNormalizedRectFromPixelBufferWithPrior();
  return result;
}

- (PTCinematographyDetection)internalDetection
{
  return (PTCinematographyDetection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternalDetection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)creationHash
{
  return self->_creationHash;
}

- (void)setCreationHash:(unint64_t)a3
{
  self->_creationHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDetection, 0);
}

+ (id)_copyDetectionFromInternal:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initCopyingInternalDetection:", v4);

  return v5;
}

+ (id)_copyDetectionsFromInternal:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(a1, "_copyDetectionFromInternal:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

+ (id)_copyInternalFromDetections:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "internalDetection", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (BOOL)_integrityCheck
{
  return -[CNDetection hash](self, "hash") == self->_creationHash;
}

@end
