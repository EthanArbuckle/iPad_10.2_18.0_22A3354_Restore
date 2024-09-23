@implementation AKUIMicaPlayer

- (AKUIMicaPlayer)initWithFileName:(id)a3 retinaScale:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AKUIMicaPlayer *v11;
  AKUIMicaPlayer *v12;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/AuthKitUI.framework"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "pathForResource:ofType:", v6, CFSTR("caar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileURLWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "path");
    v11 = (AKUIMicaPlayer *)objc_claimAutoreleasedReturnValue();
    v12 = -[AKUIMicaPlayer initWithPath:retinaScale:](self, "initWithPath:retinaScale:", v11, a4);
    self = v11;
  }
  else
  {
    NSLog(CFSTR("Unable to find Mica document: %@"), v6);
    v12 = 0;
  }

  return v12;
}

- (AKUIMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  AKUIMicaPlayer *v13;

  v6 = a3;
  +[AKUIMicaPlayer rootDictForPath:](AKUIMicaPlayer, "rootDictForPath:", v6);
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
  objc_msgSend(v9, "setGeometryFlipped:", +[AKUIMicaPlayer BOOLFromDictionary:key:defaultValue:](AKUIMicaPlayer, "BOOLFromDictionary:key:defaultValue:", v8, CFSTR("geometryFlipped"), 0) ^ 1);
  objc_msgSend(v10, "setMasksToBounds:", 1);
  LODWORD(v11) = 0;
  objc_msgSend(v10, "setRepeatCount:", v11);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("publishedObjects"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AKUIMicaPlayer initWithPath:retinaScale:rootLayer:publishedObjects:](self, "initWithPath:retinaScale:rootLayer:publishedObjects:", v6, v10, v12, a4);

  if (!v13)
    goto LABEL_6;
LABEL_7:

  return v13;
}

- (AKUIMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4 rootLayer:(id)a5 publishedObjects:(id)a6
{
  id v10;
  id v11;
  id v12;
  AKUIMicaPlayer *v13;
  AKUIMicaPlayer *v14;
  double v15;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AKUIMicaPlayer;
  v13 = -[AKUIMicaPlayer init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    -[AKUIMicaPlayer setPath:](v13, "setPath:", v10);
    -[AKUIMicaPlayer setRootLayer:](v14, "setRootLayer:", v11);
    -[AKUIMicaPlayer setPublishedObjects:](v14, "setPublishedObjects:", v12);
    LODWORD(v15) = 1.0;
    -[AKUIMicaPlayer setPreferredPlaybackSpeed:](v14, "setPreferredPlaybackSpeed:", v15);
    -[AKUIMicaPlayer setRetinaScale:](v14, "setRetinaScale:", a4);
    objc_msgSend(v11, "duration");
    -[AKUIMicaPlayer setDocumentDuration:](v14, "setDocumentDuration:");
    -[CALayer setDuration:](v14->_rootLayer, "setDuration:", INFINITY);
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[AKUIMicaPlayer stopPlayTimer](self, "stopPlayTimer");
  v3.receiver = self;
  v3.super_class = (Class)AKUIMicaPlayer;
  -[AKUIMicaPlayer dealloc](&v3, sel_dealloc);
}

+ (id)rootDictForPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v19;
  id v20;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 1, &v20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v20;
    v7 = v6;
    if (v5)
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v7;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v13, v5, &v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v19;

      if (v15)
      {
        objc_msgSend(v3, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Unable to open Mica file: %@"), v16);

        objc_msgSend(v15, "description");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("error = %@"), v17);

      }
    }
    else
    {
      v14 = 0;
      v15 = v6;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
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

  -[AKUIMicaPlayer path](self, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[AKUIMicaPlayer rootLayer](self, "rootLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mp_deepCopyLayer");

  -[AKUIMicaPlayer publishedObjects](self, "publishedObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKUIMicaPlayer rootLayer](self, "rootLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKUIMicaPlayer updatePublishedObjects:toReferenceLayersInTree:ratherThanLayersInTree:](AKUIMicaPlayer, "updatePublishedObjects:toReferenceLayersInTree:ratherThanLayersInTree:", v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[AKUIMicaPlayer retinaScale](self, "retinaScale");
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

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
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
    -[AKUIMicaPlayer pause](self, "pause");
    -[AKUIMicaPlayer setPlaybackTime:](self, "setPlaybackTime:", 0.0);
    -[AKUIMicaPlayer moveAndResizeWithinParentLayer:usingGravity:animate:](self, "moveAndResizeWithinParentLayer:usingGravity:animate:", v11, v8, 0);
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
    -[AKUIMicaPlayer pause](self, "pause");
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
  -[AKUIMicaPlayer retinaScale](self, "retinaScale");
  -[CALayer mp_moveAndResizeWithinParentLayer:usingGravity:geometryFlipped:retinaScale:animate:](rootLayer, "mp_moveAndResizeWithinParentLayer:usingGravity:geometryFlipped:retinaScale:animate:", v10, v9, 1, v5);

}

- (id)publishedLayerWithKey:(id)a3 required:(BOOL)a4
{
  void *v4;

  -[AKUIMicaPlayer publishedObjectWithKey:required:](self, "publishedObjectWithKey:required:", a3, a4);
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

  if (!-[AKUIMicaPlayer isPlaying](self, "isPlaying"))
  {
    v3 = CACurrentMediaTime();
    -[AKUIMicaPlayer playbackTime](self, "playbackTime");
    -[CALayer setBeginTime:](self->_rootLayer, "setBeginTime:", v3 - v4 / self->_preferredPlaybackSpeed);
    -[CALayer setTimeOffset:](self->_rootLayer, "setTimeOffset:", 0.0);
    *(float *)&v5 = self->_preferredPlaybackSpeed;
    -[CALayer setSpeed:](self->_rootLayer, "setSpeed:", v5);
    -[AKUIMicaPlayer startPlayTimerIfNeeded](self, "startPlayTimerIfNeeded");
    -[AKUIMicaPlayer notifyDelegateDidStartPlaying](self, "notifyDelegateDidStartPlaying");
  }
}

- (void)pause
{
  double v3;

  if (-[AKUIMicaPlayer isPlaying](self, "isPlaying"))
  {
    -[AKUIMicaPlayer playbackTime](self, "playbackTime");
    -[CALayer setTimeOffset:](self->_rootLayer, "setTimeOffset:");
    -[CALayer setBeginTime:](self->_rootLayer, "setBeginTime:", 0.0);
    LODWORD(v3) = 0;
    -[CALayer setSpeed:](self->_rootLayer, "setSpeed:", v3);
    -[AKUIMicaPlayer stopPlayTimer](self, "stopPlayTimer");
    -[AKUIMicaPlayer notifyDelegateDidStopPlaying](self, "notifyDelegateDidStopPlaying");
  }
}

- (void)gotoEnd
{
  double v3;
  double v4;

  if (!-[AKUIMicaPlayer isPlaying](self, "isPlaying"))
  {
    -[CALayer setBeginTime:](self->_rootLayer, "setBeginTime:", 0.0);
    -[AKUIMicaPlayer documentDuration](self, "documentDuration");
    -[CALayer setTimeOffset:](self->_rootLayer, "setTimeOffset:", v3 + -0.001);
    LODWORD(v4) = 0;
    -[CALayer setSpeed:](self->_rootLayer, "setSpeed:", v4);
    -[AKUIMicaPlayer startPlayTimerIfNeeded](self, "startPlayTimerIfNeeded");
    -[AKUIMicaPlayer notifyDelegateDidStartPlaying](self, "notifyDelegateDidStartPlaying");
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
  if (-[AKUIMicaPlayer isPlaying](self, "isPlaying"))
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

  if (-[AKUIMicaPlayer isPlaying](self, "isPlaying"))
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

  v5 = -[AKUIMicaPlayer isPlaying](self, "isPlaying");
  v6 = 0.0;
  if (v5)
  {
    v6 = CACurrentMediaTime() - a3;
    a3 = 0.0;
  }
  -[CALayer setBeginTime:](self->_rootLayer, "setBeginTime:", v6);
  -[CALayer setTimeOffset:](self->_rootLayer, "setTimeOffset:", a3);
  -[AKUIMicaPlayer notifyDelegateDidChangePlaybackTime](self, "notifyDelegateDidChangePlaybackTime");
}

- (BOOL)isPlaybackAtEnd
{
  double v3;
  double v4;
  double v5;

  -[AKUIMicaPlayer playbackTime](self, "playbackTime");
  v4 = v3;
  -[AKUIMicaPlayer documentDuration](self, "documentDuration");
  return v4 >= v5 + -0.001;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (-[AKUIMicaPlayer isTimerNeeded](self, "isTimerNeeded"))
    -[AKUIMicaPlayer startPlayTimerIfNeeded](self, "startPlayTimerIfNeeded");
  else
    -[AKUIMicaPlayer stopPlayTimer](self, "stopPlayTimer");
}

- (void)setRootLayer:(id)a3
{
  CALayer *v4;
  NSObject *v5;
  CALayer *rootLayer;

  v4 = (CALayer *)a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AKUIMicaPlayer setRootLayer:].cold.1((uint64_t)v4, v5);

  -[CALayer setInheritsTiming:](v4, "setInheritsTiming:", 0);
  rootLayer = self->_rootLayer;
  self->_rootLayer = v4;

}

- (void)notifyDelegateDidStartPlaying
{
  AKUIMicaPlayerDelegate **p_delegate;
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
      objc_msgSend(v8, "AKUIMicaPlayerDidStartPlaying:", self);

    }
  }
}

- (void)notifyDelegateDidStopPlaying
{
  AKUIMicaPlayerDelegate **p_delegate;
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
      objc_msgSend(v8, "AKUIMicaPlayerDidStopPlaying:", self);

    }
  }
}

- (void)notifyDelegateDidChangePlaybackTime
{
  AKUIMicaPlayerDelegate **p_delegate;
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
      objc_msgSend(v8, "AKUIMicaPlayerDidChangePlaybackTime:", self);

    }
  }
}

- (BOOL)isTimerNeeded
{
  double v3;
  char v4;
  void *v5;
  void *v6;

  if (-[AKUIMicaPlayer isPlaying](self, "isPlaying"))
  {
    -[AKUIMicaPlayer documentDuration](self, "documentDuration");
    if (v3 == INFINITY)
    {
      -[AKUIMicaPlayer delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[AKUIMicaPlayer delegate](self, "delegate");
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
    if (-[AKUIMicaPlayer isTimerNeeded](self, "isTimerNeeded"))
    {
      objc_initWeak(&location, self);
      v3 = (void *)MEMORY[0x1E0C99E88];
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __40__AKUIMicaPlayer_startPlayTimerIfNeeded__block_invoke;
      v6[3] = &unk_1E7679058;
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

void __40__AKUIMicaPlayer_startPlayTimerIfNeeded__block_invoke(uint64_t a1, void *a2)
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
  if (-[AKUIMicaPlayer isPlaybackAtEnd](self, "isPlaybackAtEnd", a3))
  {
    if (self->_loopDuringPlayback)
      -[AKUIMicaPlayer setPlaybackTime:](self, "setPlaybackTime:", 0.0);
    else
      -[AKUIMicaPlayer pause](self, "pause");
  }
  -[AKUIMicaPlayer notifyDelegateDidChangePlaybackTime](self, "notifyDelegateDidChangePlaybackTime");
}

- (AKUIMicaPlayerDelegate)delegate
{
  return (AKUIMicaPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
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

- (NSDictionary)publishedObjects
{
  return self->_publishedObjects;
}

- (void)setPublishedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_publishedObjects, a3);
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
  objc_storeStrong((id *)&self->_publishedObjects, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setRootLayer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1BD795000, a2, OS_LOG_TYPE_DEBUG, "Disabling inherits timing on root layer: %@", (uint8_t *)&v2, 0xCu);
}

@end
