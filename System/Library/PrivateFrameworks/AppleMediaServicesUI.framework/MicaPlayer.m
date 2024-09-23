@implementation MicaPlayer

- (MicaPlayer)initWithData:(id)a3 url:(id)a4 retinaScale:(double)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  MicaPlayer *v25;
  id v27;

  v8 = a4;
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = a3;
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v15, v10, &v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v27;
  if (v17)
  {
    objc_msgSend(v8, "absoluteString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unable to open Mica file: %@"), v18);

    objc_msgSend(v17, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("error = %@"), v19);

  }
  if (!v16
    || (objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("rootLayer")),
        (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_8:
    NSLog(CFSTR("Unable to load Mica document from data"));
    v25 = 0;
    goto LABEL_9;
  }
  v21 = v20;
  objc_msgSend(v20, "setGeometryFlipped:", +[MicaPlayer BOOLFromDictionary:key:defaultValue:](MicaPlayer, "BOOLFromDictionary:key:defaultValue:", v16, CFSTR("geometryFlipped"), 0) ^ 1);
  objc_msgSend(v21, "setMasksToBounds:", 1);
  LODWORD(v22) = 0;
  objc_msgSend(v21, "setRepeatCount:", v22);
  objc_msgSend(v8, "absoluteString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("publishedObjects"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[MicaPlayer initWithPath:retinaScale:rootLayer:publishedObjects:](self, "initWithPath:retinaScale:rootLayer:publishedObjects:", v23, v21, v24, a5);

  if (!v25)
    goto LABEL_8;
LABEL_9:

  return v25;
}

- (MicaPlayer)initWithFileName:(id)a3 retinaScale:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  MicaPlayer *v9;
  MicaPlayer *v10;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForResource:withExtension:", v6, CFSTR("caar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "path");
    v9 = (MicaPlayer *)objc_claimAutoreleasedReturnValue();
    v10 = -[MicaPlayer initWithPath:retinaScale:](self, "initWithPath:retinaScale:", v9, a4);
    self = v9;
  }
  else
  {
    NSLog(CFSTR("Unable to find Mica document: %@"), v6);
    v10 = 0;
  }

  return v10;
}

- (MicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  MicaPlayer *v13;

  v6 = a3;
  +[MicaPlayer rootDictForPath:](MicaPlayer, "rootDictForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7
    || (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rootLayer")),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_6:
    NSLog(CFSTR("Unable to load Mica document with path: %@"), v6);
    v13 = 0;
    goto LABEL_7;
  }
  v10 = v9;
  objc_msgSend(v9, "setGeometryFlipped:", +[MicaPlayer BOOLFromDictionary:key:defaultValue:](MicaPlayer, "BOOLFromDictionary:key:defaultValue:", v8, CFSTR("geometryFlipped"), 0) ^ 1);
  objc_msgSend(v10, "setMasksToBounds:", 1);
  LODWORD(v11) = 0;
  objc_msgSend(v10, "setRepeatCount:", v11);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("publishedObjects"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MicaPlayer initWithPath:retinaScale:rootLayer:publishedObjects:](self, "initWithPath:retinaScale:rootLayer:publishedObjects:", v6, v10, v12, a4);

  if (!v13)
    goto LABEL_6;
LABEL_7:

  return v13;
}

- (MicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4 rootLayer:(id)a5 publishedObjects:(id)a6
{
  id v10;
  id v11;
  id v12;
  MicaPlayer *v13;
  MicaPlayer *v14;
  double v15;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MicaPlayer;
  v13 = -[MicaPlayer init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    -[MicaPlayer setPath:](v13, "setPath:", v10);
    -[MicaPlayer setRootLayer:](v14, "setRootLayer:", v11);
    -[MicaPlayer setPublishedObjects:](v14, "setPublishedObjects:", v12);
    LODWORD(v15) = 1.0;
    -[MicaPlayer setPreferredPlaybackSpeed:](v14, "setPreferredPlaybackSpeed:", v15);
    -[MicaPlayer setRetinaScale:](v14, "setRetinaScale:", a4);
    objc_msgSend(v11, "duration");
    -[MicaPlayer setDocumentDuration:](v14, "setDocumentDuration:");
    -[CALayer setDuration:](v14->_rootLayer, "setDuration:", INFINITY);
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[MicaPlayer stopPlayTimer](self, "stopPlayTimer");
  v3.receiver = self;
  v3.super_class = (Class)MicaPlayer;
  -[MicaPlayer dealloc](&v3, sel_dealloc);
}

+ (id)rootDictForPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v20;
  id v21;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v21 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v4, 1, &v21);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v21;
    if (v6)
    {
      objc_msgSend(v3, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Unable to open Mica file: %@"), v7);

      objc_msgSend(v6, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("error = %@"), v8);

    }
    if (v5)
    {
      v9 = (void *)MEMORY[0x24BDBCF20];
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v6;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v14, v5, &v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v20;

      if (v16)
      {
        objc_msgSend(v3, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Unable to open Mica file: %@"), v17);

        objc_msgSend(v16, "description");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("error = %@"), v18);

      }
    }
    else
    {
      v15 = 0;
      v16 = v6;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)BOOLFromDictionary:(id)a3 key:(id)a4 defaultValue:(BOOL)a5
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    a5 = objc_msgSend(v6, "BOOLValue");

  return a5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[MicaPlayer path](self, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[MicaPlayer rootLayer](self, "rootLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mp_deepCopyLayer");

  -[MicaPlayer publishedObjects](self, "publishedObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MicaPlayer rootLayer](self, "rootLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MicaPlayer updatePublishedObjects:toReferenceLayersInTree:ratherThanLayersInTree:](MicaPlayer, "updatePublishedObjects:toReferenceLayersInTree:ratherThanLayersInTree:", v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MicaPlayer retinaScale](self, "retinaScale");
  v13 = (void *)objc_msgSend(v12, "initWithPath:retinaScale:rootLayer:publishedObjects:", v6, v8, v11);

  return v13;
}

+ (id)updatePublishedObjects:(id)a3 toReferenceLayersInTree:(id)a4 ratherThanLayersInTree:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v24;
  void *v25;
  void *v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v9, "mp_allLayersInTree");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v9;
    objc_msgSend(v9, "mp_allAnimationsInTree");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mp_allLayersInTree");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mp_allAnimationsInTree");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v7, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v19 = v10;
          v20 = v11;
          if ((isKindOfClass & 1) != 0
            || (objc_opt_class(), v21 = objc_opt_isKindOfClass(), v20 = v25, v19 = v26, (v21 & 1) != 0))
          {
            objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v19, "indexOfObjectIdenticalTo:", v17));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v22, v16);

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v13);
    }

    v9 = v24;
  }

  return v28;
}

- (void)addToLayer:(id)a3 onTop:(BOOL)a4 gravity:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  CALayer *rootLayer;
  id v11;

  v6 = a4;
  v11 = a3;
  v8 = a5;
  -[CALayer superlayer](self->_rootLayer, "superlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[MicaPlayer pause](self, "pause");
    -[MicaPlayer setPlaybackTime:](self, "setPlaybackTime:", 0.0);
    -[MicaPlayer moveAndResizeWithinParentLayer:usingGravity:animate:](self, "moveAndResizeWithinParentLayer:usingGravity:animate:", v11, v8, 0);
    rootLayer = self->_rootLayer;
    if (v6)
      objc_msgSend(v11, "addSublayer:", rootLayer);
    else
      objc_msgSend(v11, "insertSublayer:atIndex:", rootLayer, 0);
  }

}

- (void)removeFromSuperlayer
{
  void *v3;

  -[CALayer superlayer](self->_rootLayer, "superlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MicaPlayer pause](self, "pause");
    -[CALayer removeFromSuperlayer](self->_rootLayer, "removeFromSuperlayer");
  }
}

- (void)moveAndResizeWithinParentLayer:(id)a3 usingGravity:(id)a4 animate:(BOOL)a5
{
  _BOOL8 v5;
  CALayer *rootLayer;
  id v9;
  id v10;

  v5 = a5;
  rootLayer = self->_rootLayer;
  v9 = a4;
  v10 = a3;
  -[MicaPlayer retinaScale](self, "retinaScale");
  -[CALayer mp_moveAndResizeWithinParentLayer:usingGravity:geometryFlipped:retinaScale:animate:](rootLayer, "mp_moveAndResizeWithinParentLayer:usingGravity:geometryFlipped:retinaScale:animate:", v10, v9, 1, v5);

}

- (id)publishedLayerWithKey:(id)a3 required:(BOOL)a4
{
  void *v4;

  -[MicaPlayer publishedObjectWithKey:required:](self, "publishedObjectWithKey:required:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v4 = 0;
    }
  }
  return v4;
}

- (id)publishedObjectWithKey:(id)a3 required:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_publishedObjects, "objectForKeyedSubscript:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v4 && !v7)
  {
    -[NSString lastPathComponent](self->_path, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Missing published object '%@' in Mica document '%@'"), v6, v9);

  }
  return v8;
}

- (void)play
{
  double v3;
  double v4;
  double v5;

  if (!-[MicaPlayer isPlaying](self, "isPlaying"))
  {
    v3 = CACurrentMediaTime();
    -[MicaPlayer playbackTime](self, "playbackTime");
    -[CALayer setBeginTime:](self->_rootLayer, "setBeginTime:", v3 - v4 / self->_preferredPlaybackSpeed);
    -[CALayer setTimeOffset:](self->_rootLayer, "setTimeOffset:", 0.0);
    *(float *)&v5 = self->_preferredPlaybackSpeed;
    -[CALayer setSpeed:](self->_rootLayer, "setSpeed:", v5);
    -[MicaPlayer startPlayTimerIfNeeded](self, "startPlayTimerIfNeeded");
    -[MicaPlayer notifyDelegateDidStartPlaying](self, "notifyDelegateDidStartPlaying");
  }
}

- (void)pause
{
  double v3;

  if (-[MicaPlayer isPlaying](self, "isPlaying"))
  {
    -[MicaPlayer playbackTime](self, "playbackTime");
    -[CALayer setTimeOffset:](self->_rootLayer, "setTimeOffset:");
    -[CALayer setBeginTime:](self->_rootLayer, "setBeginTime:", 0.0);
    LODWORD(v3) = 0;
    -[CALayer setSpeed:](self->_rootLayer, "setSpeed:", v3);
    -[MicaPlayer stopPlayTimer](self, "stopPlayTimer");
    -[MicaPlayer notifyDelegateDidStopPlaying](self, "notifyDelegateDidStopPlaying");
  }
}

- (BOOL)isPlaying
{
  float v2;

  -[CALayer speed](self->_rootLayer, "speed");
  return v2 != 0.0;
}

- (void)setPreferredPlaybackSpeed:(float)a3
{
  float v4;
  double v5;

  if (a3 <= 0.0)
    v4 = 1.0;
  else
    v4 = a3;
  self->_preferredPlaybackSpeed = v4;
  if (-[MicaPlayer isPlaying](self, "isPlaying"))
  {
    *(float *)&v5 = v4;
    -[CALayer setSpeed:](self->_rootLayer, "setSpeed:", v5);
  }
}

- (double)playbackTime
{
  double v3;
  double v4;
  double v5;
  float v6;
  double result;

  if (-[MicaPlayer isPlaying](self, "isPlaying"))
  {
    v3 = CACurrentMediaTime();
    -[CALayer beginTime](self->_rootLayer, "beginTime");
    v5 = v3 - v4;
    -[CALayer speed](self->_rootLayer, "speed");
    return v5 * v6;
  }
  else
  {
    -[CALayer timeOffset](self->_rootLayer, "timeOffset");
  }
  return result;
}

- (void)setPlaybackTime:(double)a3
{
  _BOOL4 v5;
  double v6;

  v5 = -[MicaPlayer isPlaying](self, "isPlaying");
  v6 = 0.0;
  if (v5)
  {
    v6 = CACurrentMediaTime() - a3;
    a3 = 0.0;
  }
  -[CALayer setBeginTime:](self->_rootLayer, "setBeginTime:", v6);
  -[CALayer setTimeOffset:](self->_rootLayer, "setTimeOffset:", a3);
  -[MicaPlayer notifyDelegateDidChangePlaybackTime](self, "notifyDelegateDidChangePlaybackTime");
}

- (BOOL)isPlaybackAtEnd
{
  double v3;
  double v4;
  double v5;

  -[MicaPlayer playbackTime](self, "playbackTime");
  v4 = v3;
  -[MicaPlayer documentDuration](self, "documentDuration");
  return v4 >= v5 + -0.001;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (-[MicaPlayer isTimerNeeded](self, "isTimerNeeded"))
    -[MicaPlayer startPlayTimerIfNeeded](self, "startPlayTimerIfNeeded");
  else
    -[MicaPlayer stopPlayTimer](self, "stopPlayTimer");
}

- (void)notifyDelegateDidStartPlaying
{
  MicaPlayerDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "micaPlayerDidStartPlaying:", self);

    }
  }
}

- (void)notifyDelegateDidStopPlaying
{
  MicaPlayerDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "micaPlayerDidStopPlaying:", self);

    }
  }
}

- (void)notifyDelegateDidChangePlaybackTime
{
  MicaPlayerDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "micaPlayerDidChangePlaybackTime:isPlaybackAtEnd:", self, -[MicaPlayer isPlaybackAtEnd](self, "isPlaybackAtEnd"));

    }
  }
}

- (void)notifyDelegateDidChangePlaybackTimeIsPlaybackAtEnd:(BOOL)a3
{
  _BOOL8 v3;
  MicaPlayerDelegate **p_delegate;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  id v10;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)p_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v10, "micaPlayerDidChangePlaybackTime:isPlaybackAtEnd:", self, v3);

    }
  }
}

- (BOOL)isTimerNeeded
{
  double v3;
  char v4;
  void *v5;
  void *v6;

  if (-[MicaPlayer isPlaying](self, "isPlaying"))
  {
    -[MicaPlayer documentDuration](self, "documentDuration");
    if (v3 == INFINITY)
    {
      -[MicaPlayer delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[MicaPlayer delegate](self, "delegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_opt_respondsToSelector();

      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 1;
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (void)startPlayTimerIfNeeded
{
  void *v3;
  NSTimer *v4;
  NSTimer *playTimer;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_playTimer)
  {
    if (-[MicaPlayer isTimerNeeded](self, "isTimerNeeded"))
    {
      objc_initWeak(&location, self);
      v3 = (void *)MEMORY[0x24BDBCF40];
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __36__MicaPlayer_startPlayTimerIfNeeded__block_invoke;
      v6[3] = &unk_24CB522D0;
      objc_copyWeak(&v7, &location);
      objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 1, v6, 0.0333333333);
      v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      playTimer = self->_playTimer;
      self->_playTimer = v4;

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

void __36__MicaPlayer_startPlayTimerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "runPlayTimer:", v3);

}

- (void)stopPlayTimer
{
  NSTimer *playTimer;
  NSTimer *v4;

  playTimer = self->_playTimer;
  if (playTimer)
  {
    -[NSTimer invalidate](playTimer, "invalidate");
    v4 = self->_playTimer;
    self->_playTimer = 0;

  }
}

- (void)runPlayTimer:(id)a3
{
  _BOOL8 v4;

  v4 = -[MicaPlayer isPlaybackAtEnd](self, "isPlaybackAtEnd", a3);
  if (v4)
  {
    if (self->_loopDuringPlayback)
      -[MicaPlayer setPlaybackTime:](self, "setPlaybackTime:", 0.0);
    else
      -[MicaPlayer pause](self, "pause");
  }
  -[MicaPlayer notifyDelegateDidChangePlaybackTimeIsPlaybackAtEnd:](self, "notifyDelegateDidChangePlaybackTimeIsPlaybackAtEnd:", v4);
}

- (MicaPlayerDelegate)delegate
{
  return (MicaPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSDictionary)publishedObjects
{
  return self->_publishedObjects;
}

- (void)setPublishedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_publishedObjects, a3);
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setRootLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rootLayer, a3);
}

- (double)retinaScale
{
  return self->_retinaScale;
}

- (void)setRetinaScale:(double)a3
{
  self->_retinaScale = a3;
}

- (double)documentDuration
{
  return self->_documentDuration;
}

- (void)setDocumentDuration:(double)a3
{
  self->_documentDuration = a3;
}

- (float)preferredPlaybackSpeed
{
  return self->_preferredPlaybackSpeed;
}

- (BOOL)loopDuringPlayback
{
  return self->_loopDuringPlayback;
}

- (void)setLoopDuringPlayback:(BOOL)a3
{
  self->_loopDuringPlayback = a3;
}

- (NSTimer)playTimer
{
  return self->_playTimer;
}

- (void)setPlayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_playTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playTimer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_publishedObjects, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
