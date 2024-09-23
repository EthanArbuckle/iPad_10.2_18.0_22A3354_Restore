@implementation AVAssetVariantVideoAttributes

- (AVVideoRange)videoRange
{
  return (AVVideoRange)objc_msgSend((id)-[FigAlternateObjC videoAttributes](self->_figAlternateObjC, "videoAttributes"), "videoRange");
}

- (NSArray)codecTypes
{
  return (NSArray *)objc_msgSend((id)-[FigAlternateObjC videoAttributes](self->_figAlternateObjC, "videoAttributes"), "codecTypes");
}

- (CGSize)presentationSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)-[FigAlternateObjC videoAttributes](self->_figAlternateObjC, "videoAttributes"), "presentationSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)nominalFrameRate
{
  double result;

  objc_msgSend((id)-[FigAlternateObjC videoAttributes](self->_figAlternateObjC, "videoAttributes"), "nominalFrameRate");
  return result;
}

- (id)immersiveAttributes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  AVAssetVariantVideoImmersiveAttributes *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  MEMORY[0x194033BF8](self->_mutex, a2);
  if (!self->_allImmersiveAttributes)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)objc_msgSend((id)-[FigAlternateObjC videoAttributes](self->_figAlternateObjC, "videoAttributes", 0), "immersiveAttributes");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = -[AVAssetVariantVideoImmersiveAttributes initWithFigVideoImmersiveAttributes:]([AVAssetVariantVideoImmersiveAttributes alloc], "initWithFigVideoImmersiveAttributes:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
          objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    self->_allImmersiveAttributes = (NSArray *)objc_msgSend(v3, "copy");
  }
  MEMORY[0x194033C04](self->_mutex);
  return self->_allImmersiveAttributes;
}

- (NSArray)videoLayoutAttributes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  AVAssetVariantVideoLayoutAttributes *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  MEMORY[0x194033BF8](self->_mutex, a2);
  if (!self->_allVideoLayoutAttributes)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)objc_msgSend((id)-[FigAlternateObjC videoAttributes](self->_figAlternateObjC, "videoAttributes", 0), "videoLayoutAttributes");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = -[AVAssetVariantVideoLayoutAttributes initWithFigVideoImmersiveAttributes:]([AVAssetVariantVideoLayoutAttributes alloc], "initWithFigVideoImmersiveAttributes:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
          objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    self->_allVideoLayoutAttributes = (NSArray *)v3;
  }
  MEMORY[0x194033C04](self->_mutex);
  return self->_allVideoLayoutAttributes;
}

- (void)dealloc
{
  objc_super v3;

  FigSimpleMutexDestroy();

  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariantVideoAttributes;
  -[AVAssetVariantVideoAttributes dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  NSString *v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[AVAssetVariantVideoAttributes videoRange](self, "videoRange");
  -[AVAssetVariantVideoAttributes presentationSize](self, "presentationSize");
  v8 = (int)v7;
  -[AVAssetVariantVideoAttributes presentationSize](self, "presentationSize");
  v10 = (int)v9;
  -[AVAssetVariantVideoAttributes nominalFrameRate](self, "nominalFrameRate");
  *(float *)&v11 = v11;
  v12 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, videoRange:%@ size:%dx%d, framerate:%0.2f codecs:%@"), v5, self, v6, v8, v10, *(float *)&v11, -[AVAssetVariantVideoAttributes codecTypes](self, "codecTypes"));
  objc_msgSend(v12, "appendFormat:", CFSTR(" videoLayoutAttributes:%@"), -[AVAssetVariantVideoAttributes videoLayoutAttributes](self, "videoLayoutAttributes"));
  objc_msgSend(v12, "appendFormat:", CFSTR(">"));
  return v12;
}

- (AVAssetVariantVideoAttributes)initWithFigAlternateObjC:(id)a3
{
  AVAssetVariantVideoAttributes *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAssetVariantVideoAttributes;
  v4 = -[AVAssetVariantVideoAttributes init](&v6, sel_init);
  if (v4)
  {
    v4->_figAlternateObjC = (FigAlternateObjC *)a3;
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v4;
}

@end
