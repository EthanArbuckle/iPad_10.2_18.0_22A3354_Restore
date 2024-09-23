@implementation SKVideoNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  id *skcVideoNode;
  void *v4;
  void *v5;
  objc_super v7;

  skcVideoNode = (id *)self->_skcVideoNode;
  if (skcVideoNode)
  {
    SKCVideoNode::getPlayer(skcVideoNode);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (self->_isUsingKVO && v4 != 0)
    {
      objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("rate"));
      objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("currentItem"));
    }
  }
  else
  {
    v5 = 0;
  }

  v7.receiver = self;
  v7.super_class = (Class)SKVideoNode;
  -[SKNode dealloc](&v7, sel_dealloc);
}

- (AVPlayer)_player
{
  return (AVPlayer *)SKCVideoNode::getPlayer((id *)self->_skcVideoNode);
}

- (void)set_player:(id)a3
{
  SKCVideoNode::setPlayer((id *)self->_skcVideoNode, (AVPlayer *)a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKVideoNode;
  -[SKNode encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_videoFileName, CFSTR("_videoFileName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_videoFileURL, CFSTR("_videoFileURL"));
  v5 = (void *)MEMORY[0x1E0CB3B18];
  -[SKVideoNode size](self, "size");
  v7 = v6;
  -[SKVideoNode size](self, "size");
  objc_msgSend(v5, "valueWithCGRect:", 0.0, 0.0, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("_bounds"));

}

- (SKVideoNode)init
{
  SKVideoNode *v2;
  SKVideoNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKVideoNode;
  v2 = -[SKNode init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SKVideoNode commonInit](v2, "commonInit");
  return v3;
}

- (SKVideoNode)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  SKVideoNode *v5;
  SKVideoNode *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  NSString *videoFileName;
  uint64_t v17;
  NSURL *videoFileURL;
  void *v19;
  NSURL *v20;
  NSURL *v21;
  AVAsset *v22;
  objc_super v24;

  v4 = aDecoder;
  v24.receiver = self;
  v24.super_class = (Class)SKVideoNode;
  v5 = -[SKNode initWithCoder:](&v24, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[SKVideoNode commonInit](v5, "commonInit");
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bounds"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    v9 = v8;
    v11 = v10;

    -[SKNode xScale](v6, "xScale");
    v13 = v12;
    -[SKNode yScale](v6, "yScale");
    -[SKVideoNode setSize:](v6, "setSize:", v9 * v13, v11 * v14);
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_videoFileName"));
    v15 = objc_claimAutoreleasedReturnValue();
    videoFileName = v6->_videoFileName;
    v6->_videoFileName = (NSString *)v15;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_videoFileURL"));
    v17 = objc_claimAutoreleasedReturnValue();
    videoFileURL = v6->_videoFileURL;
    v6->_videoFileURL = (NSURL *)v17;

    if (v6->_videoFileName)
    {
      SKGetResourceBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "URLForResource:withExtension:", v6->_videoFileName, 0);
      v20 = (NSURL *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = v6->_videoFileURL;
      if (v21)
        v20 = v21;
      else
        v20 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v20);
    v22 = (AVAsset *)objc_claimAutoreleasedReturnValue();
    SKCVideoNode::loadAVAsset((SKCVideoNode *)v6->_skcVideoNode, v22);

  }
  return v6;
}

- (SKVideoNode)initWithVideoURL:(NSURL *)url
{
  NSURL *v4;
  SKVideoNode *v5;
  SKVideoNode *v6;
  AVAsset *v7;
  objc_super v9;

  v4 = url;
  v9.receiver = self;
  v9.super_class = (Class)SKVideoNode;
  v5 = -[SKNode init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SKVideoNode commonInit](v5, "commonInit");
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v4);
      v7 = (AVAsset *)objc_claimAutoreleasedReturnValue();
      SKCVideoNode::loadAVAsset((SKCVideoNode *)v6->_skcVideoNode, v7);

    }
  }

  return v6;
}

- (SKVideoNode)initWithVideoFileNamed:(NSString *)videoFile
{
  NSString *v4;
  SKVideoNode *v5;
  SKVideoNode *v6;
  void *v7;
  void *v8;
  AVAsset *v9;
  objc_super v11;

  v4 = videoFile;
  v11.receiver = self;
  v11.super_class = (Class)SKVideoNode;
  v5 = -[SKNode init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SKVideoNode commonInit](v5, "commonInit");
    SKGetResourceBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLForResource:withExtension:", v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v8);
      v9 = (AVAsset *)objc_claimAutoreleasedReturnValue();
      SKCVideoNode::loadAVAsset((SKCVideoNode *)v6->_skcVideoNode, v9);

    }
  }

  return v6;
}

- (SKVideoNode)initWithFileNamed:(NSString *)videoFile
{
  NSString *v5;
  SKVideoNode *v6;
  SKVideoNode *v7;
  void *v8;
  void *v9;
  AVAsset *v10;
  objc_super v12;

  v5 = videoFile;
  v12.receiver = self;
  v12.super_class = (Class)SKVideoNode;
  v6 = -[SKNode init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    -[SKVideoNode commonInit](v6, "commonInit");
    objc_storeStrong((id *)&v7->_videoFileName, videoFile);
    SKGetResourceBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLForResource:withExtension:", v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v9);
      v10 = (AVAsset *)objc_claimAutoreleasedReturnValue();
      SKCVideoNode::loadAVAsset((SKCVideoNode *)v7->_skcVideoNode, v10);

    }
  }

  return v7;
}

- (SKVideoNode)initWithURL:(NSURL *)url
{
  NSURL *v4;
  SKVideoNode *v5;
  SKVideoNode *v6;
  AVAsset *v7;
  objc_super v9;

  v4 = url;
  v9.receiver = self;
  v9.super_class = (Class)SKVideoNode;
  v5 = -[SKNode init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SKVideoNode commonInit](v5, "commonInit");
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v4);
      v7 = (AVAsset *)objc_claimAutoreleasedReturnValue();
      SKCVideoNode::loadAVAsset((SKCVideoNode *)v6->_skcVideoNode, v7);

    }
  }

  return v6;
}

- (SKVideoNode)initWithAVPlayer:(AVPlayer *)player
{
  AVPlayer *v4;
  SKVideoNode *v5;
  SKVideoNode *v6;
  objc_super v8;

  v4 = player;
  v8.receiver = self;
  v8.super_class = (Class)SKVideoNode;
  v5 = -[SKNode init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SKVideoNode commonInit](v5, "commonInit");
    if (v4)
    {
      SKCVideoNode::setPlayer((id *)v6->_skcVideoNode, v4);
      v6->_isUsingKVO = 1;
      -[AVPlayer addObserver:forKeyPath:options:context:](v4, "addObserver:forKeyPath:options:context:", v6, CFSTR("rate"), 1, 0);
      -[AVPlayer addObserver:forKeyPath:options:context:](v4, "addObserver:forKeyPath:options:context:", v6, CFSTR("currentItem"), 1, 0);
    }
  }

  return v6;
}

+ (SKVideoNode)videoNodeWithVideoFileNamed:(NSString *)videoFile
{
  objc_msgSend(a1, "videoNodeWithFileNamed:", videoFile);
  return (SKVideoNode *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKVideoNode)videoNodeWithVideoURL:(NSURL *)videoURL
{
  objc_msgSend(a1, "videoNodeWithURL:", videoURL);
  return (SKVideoNode *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SKVideoNode)videoNodeWithFileNamed:(NSString *)videoFile
{
  NSString *v4;
  void *v5;

  v4 = videoFile;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFileNamed:", v4);

  return (SKVideoNode *)v5;
}

+ (SKVideoNode)videoNodeWithURL:(NSURL *)videoURL
{
  NSURL *v4;
  void *v5;

  v4 = videoURL;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v4);

  return (SKVideoNode *)v5;
}

+ (SKVideoNode)videoNodeWithAVPlayer:(AVPlayer *)player
{
  AVPlayer *v3;
  SKVideoNode *v4;

  v3 = player;
  v4 = -[SKVideoNode initWithAVPlayer:]([SKVideoNode alloc], "initWithAVPlayer:", v3);

  return v4;
}

- (BOOL)isEqualToNode:(id)a3
{
  SKVideoNode *v4;
  SKVideoNode *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSString *videoFileName;
  objc_super v21;

  v4 = (SKVideoNode *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v21.receiver = self;
      v21.super_class = (Class)SKVideoNode;
      if (!-[SKNode isEqualToNode:](&v21, sel_isEqualToNode_, v5))
        goto LABEL_13;
      -[SKVideoNode anchorPoint](self, "anchorPoint");
      v7 = v6;
      v9 = v8;
      -[SKVideoNode anchorPoint](v5, "anchorPoint");
      v11 = 0;
      if (v7 != v12)
        goto LABEL_14;
      if (v9 != v10)
        goto LABEL_14;
      -[SKVideoNode size](self, "size");
      v14 = v13;
      v16 = v15;
      -[SKVideoNode size](v5, "size");
      v11 = 0;
      if (v14 != v18 || v16 != v17)
        goto LABEL_14;
      videoFileName = self->_videoFileName;
      if (videoFileName == v5->_videoFileName || -[NSString isEqualToString:](videoFileName, "isEqualToString:"))
        v11 = self->_videoFileURL == v5->_videoFileURL;
      else
LABEL_13:
        v11 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CGPoint v10;
  CGSize v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SKNode name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode position](self, "position");
  NSStringFromCGPoint(v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKVideoNode size](self, "size");
  NSStringFromCGSize(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode zRotation](self, "zRotation");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SKVideoNode> name:'%@' position:%@ size:%@ rotation:%.2f"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("rate"))
    || objc_msgSend(v10, "isEqualToString:", CFSTR("currentItem")))
  {
    SKCNode::setDirty((SKCNode *)self->_skcVideoNode);
    SKCNode::recomputeFlags((SKCNode *)self->_skcVideoNode, 1);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKVideoNode;
    -[SKVideoNode observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_makeBackingNode
{
  SKCVideoNode *v2;

  v2 = (SKCVideoNode *)operator new();
  SKCVideoNode::SKCVideoNode(v2);
  return v2;
}

- (void)_didMakeBackingNode
{
  self->_skcVideoNode = -[SKNode _backingNode](self, "_backingNode");
}

- (void)setPaused:(BOOL)a3
{
  _BOOL4 v3;
  SKCVideoNode *skcVideoNode;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKVideoNode;
  -[SKNode setPaused:](&v6, sel_setPaused_);
  skcVideoNode = (SKCVideoNode *)self->_skcVideoNode;
  if (v3)
    SKCVideoNode::pause(skcVideoNode);
  else
    SKCVideoNode::play(skcVideoNode);
}

- (void)play
{
  SKCVideoNode::play((SKCVideoNode *)self->_skcVideoNode);
}

- (void)pause
{
  SKCVideoNode::pause((SKCVideoNode *)self->_skcVideoNode);
}

- (void)setSize:(CGSize)size
{
  BOOL v3;
  _BYTE *skcVideoNode;
  unsigned int v5;
  unsigned int v6;
  __int128 v7;

  v3 = size.width == *MEMORY[0x1E0C9D820];
  if (size.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
    v3 = 0;
  skcVideoNode = self->_skcVideoNode;
  skcVideoNode[560] = v3;
  *(float *)&v5 = size.width;
  *(float *)&v6 = size.height;
  v7 = __PAIR64__(v6, v5);
  SKCNode::setSize((uint64_t)skcVideoNode, &v7);
}

- (CGSize)size
{
  float64x2_t v2;
  double v3;
  CGSize result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)((char *)self->_skcVideoNode + 336));
  v3 = v2.f64[1];
  result.width = v2.f64[0];
  result.height = v3;
  return result;
}

- (CGPoint)anchorPoint
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)((char *)self->_skcVideoNode + 352));
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (void)setAnchorPoint:(CGPoint)anchorPoint
{
  SKCNode *skcVideoNode;
  unsigned int v4;
  unsigned int v5;
  __int128 v6;

  skcVideoNode = (SKCNode *)self->_skcVideoNode;
  *(float *)&v4 = anchorPoint.x;
  *(float *)&v5 = anchorPoint.y;
  v6 = __PAIR64__(v5, v4);
  SKCNode::setAnchor(skcVideoNode, &v6);
}

+ (id)debugHierarchyPropertyDescriptions
{
  const CFDictionaryKeyCallBacks *v2;
  const CFDictionaryValueCallBacks *v3;
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  __CFDictionary *v6;
  CFNumberRef v7;
  CFNumberRef v8;
  void *v9;
  uint64_t valuePtr;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9AEB8];
  v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("size"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("CGSize"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeSize"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v12[0] = Mutable;
  v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("anchorPoint"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("CGPoint"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypePoint"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v12[1] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("visualRepresentation"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("CGImage"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("public.data"));
  valuePtr = 8;
  v7 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v6, CFSTR("visibility"), v7);
  CFRelease(v7);
  valuePtr = 1;
  v8 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v6, CFSTR("propertyOptions"), v8);
  CFRelease(v8);
  v12[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSString *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  id v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  id v26;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("visualRepresentation")))
  {
    v11 = v10;
    v12 = (NSString *)v9;
    if (-[NSString length](v12, "length"))
    {
      NSSelectorFromString(v12);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v13 = v12;
        if (v13)
        {
LABEL_6:
          objc_msgSend(v11, "valueForKey:", v13);
          a6 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_23:

          goto LABEL_24;
        }
      }
      else
      {
        if (-[NSString length](v12, "length") < 2)
        {
          -[NSString uppercaseString](v12, "uppercaseString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[NSString substringToIndex:](v12, "substringToIndex:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "uppercaseString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString substringFromIndex:](v12, "substringFromIndex:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringByAppendingString:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(CFSTR("is"), "stringByAppendingString:", v17);
        v18 = (NSString *)objc_claimAutoreleasedReturnValue();
        NSSelectorFromString(v18);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v13 = v18;
        else
          v13 = 0;

        if (v13)
          goto LABEL_6;
      }
    }
    if (a6)
    {
      v19 = v11;
      v20 = v12;
      v28 = v19;
      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v19);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = &stru_1EA5021F8;
      }
      if (v20)
        v22 = v20;
      else
        v22 = &stru_1EA5021F8;
      v23 = v22;
      v31[0] = CFSTR("propertyName");
      v31[1] = CFSTR("objectDescription");
      v32[0] = v23;
      v32[1] = v21;
      v31[2] = CFSTR("errorDescription");
      v32[2] = &stru_1EA5021F8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_retainAutorelease(v25);
      *a6 = v26;

      v13 = 0;
      a6 = 0;
    }
    else
    {
      v13 = 0;
    }
    goto LABEL_23;
  }
  objc_msgSend(v10, "createDebugHierarchyVisualRepresentation");
  a6 = (id *)objc_claimAutoreleasedReturnValue();
  v29 = CFSTR("propertyFormat");
  v30 = *MEMORY[0x1E0CA5C10];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return a6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_videoFileURL, 0);
  objc_storeStrong((id *)&self->_videoFileName, 0);
}

@end
