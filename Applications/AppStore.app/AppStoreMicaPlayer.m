@implementation AppStoreMicaPlayer

- (AppStoreMicaPlayer)initWithFileName:(id)a3 retinaScale:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  AppStoreMicaPlayer *v9;
  AppStoreMicaPlayer *v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLForResource:withExtension:", v6, CFSTR("caar")));

  if (v8)
  {
    v9 = (AppStoreMicaPlayer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
    v10 = -[AppStoreMicaPlayer initWithPath:retinaScale:](self, "initWithPath:retinaScale:", v9, a4);
    self = v9;
  }
  else
  {
    NSLog(CFSTR("Unable to find Mica document: %@"), v6);
    v10 = 0;
  }

  return v10;
}

- (AppStoreMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  AppStoreMicaPlayer *v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AppStoreMicaPlayer rootDictForPath:](AppStoreMicaPlayer, "rootDictForPath:", v6));
  v8 = v7;
  if (!v7
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rootLayer")))) == 0)
  {

LABEL_6:
    NSLog(CFSTR("Unable to load Mica document with path: %@"), v6);
    v13 = 0;
    goto LABEL_7;
  }
  v10 = v9;
  objc_msgSend(v9, "setGeometryFlipped:", +[AppStoreMicaPlayer BOOLFromDictionary:key:defaultValue:](AppStoreMicaPlayer, "BOOLFromDictionary:key:defaultValue:", v8, CFSTR("geometryFlipped"), 0) ^ 1);
  objc_msgSend(v10, "setMasksToBounds:", 1);
  LODWORD(v11) = 0;
  objc_msgSend(v10, "setRepeatCount:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("publishedObjects")));
  v13 = -[AppStoreMicaPlayer initWithPath:retinaScale:rootLayer:publishedObjects:](self, "initWithPath:retinaScale:rootLayer:publishedObjects:", v6, v10, v12, a4);

  if (!v13)
    goto LABEL_6;
LABEL_7:

  return v13;
}

- (AppStoreMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4 rootLayer:(id)a5 publishedObjects:(id)a6
{
  id v10;
  id v11;
  id v12;
  AppStoreMicaPlayer *v13;
  AppStoreMicaPlayer *v14;
  double v15;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AppStoreMicaPlayer;
  v13 = -[AppStoreMicaPlayer init](&v17, "init");
  v14 = v13;
  if (v13)
  {
    -[AppStoreMicaPlayer setPath:](v13, "setPath:", v10);
    -[AppStoreMicaPlayer setRootLayer:](v14, "setRootLayer:", v11);
    -[AppStoreMicaPlayer setPublishedObjects:](v14, "setPublishedObjects:", v12);
    LODWORD(v15) = 1.0;
    -[AppStoreMicaPlayer setPreferredPlaybackSpeed:](v14, "setPreferredPlaybackSpeed:", v15);
    -[AppStoreMicaPlayer setRetinaScale:](v14, "setRetinaScale:", a4);
    objc_msgSend(v11, "duration");
    -[AppStoreMicaPlayer setDocumentDuration:](v14, "setDocumentDuration:");
    -[CALayer setDuration:](v14->_rootLayer, "setDuration:", INFINITY);
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[AppStoreMicaPlayer stopPlayTimer](self, "stopPlayTimer");
  v3.receiver = self;
  v3.super_class = (Class)AppStoreMicaPlayer;
  -[AppStoreMicaPlayer dealloc](&v3, "dealloc");
}

+ (id)rootDictForPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v19;
  id v20;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));
  if (v4)
  {
    v20 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v4, 1, &v20));
    v6 = v20;
    v7 = v6;
    if (v5)
    {
      v8 = objc_opt_class(CALayer);
      v9 = objc_opt_class(NSMutableDictionary);
      v10 = objc_opt_class(NSArray);
      v11 = objc_opt_class(NSNumber);
      v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(NSString), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v19 = v7;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v13, v5, &v19));
      v15 = v19;

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
        NSLog(CFSTR("Unable to open Mica file: %@"), v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
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

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", a4));
  v7 = v6;
  if (v6)
    a5 = objc_msgSend(v6, "BOOLValue");

  return a5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppStoreMicaPlayer path](self, "path"));
  v6 = objc_msgSend(v5, "copy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AppStoreMicaPlayer rootLayer](self, "rootLayer"));
  v8 = objc_msgSend(v7, "mp_deepCopyLayer");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AppStoreMicaPlayer publishedObjects](self, "publishedObjects"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppStoreMicaPlayer rootLayer](self, "rootLayer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AppStoreMicaPlayer updatePublishedObjects:toReferenceLayersInTree:ratherThanLayersInTree:](AppStoreMicaPlayer, "updatePublishedObjects:toReferenceLayersInTree:ratherThanLayersInTree:", v9, v8, v10));

  v12 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  -[AppStoreMicaPlayer retinaScale](self, "retinaScale");
  v13 = objc_msgSend(v12, "initWithPath:retinaScale:rootLayer:publishedObjects:", v6, v8, v11);

  return v13;
}

+ (id)updatePublishedObjects:(id)a3 toReferenceLayersInTree:(id)a4 ratherThanLayersInTree:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  uint64_t v22;
  char v23;
  void *v24;
  id v26;
  void *v27;
  void *v28;
  id obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (v7 && objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mp_allLayersInTree"));
    v26 = v9;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mp_allAnimationsInTree"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mp_allLayersInTree"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mp_allAnimationsInTree"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v16));
          v18 = objc_opt_class(CALayer);
          isKindOfClass = objc_opt_isKindOfClass(v17, v18);
          v20 = v10;
          v21 = v11;
          if ((isKindOfClass & 1) != 0
            || (v22 = objc_opt_class(CAAnimation),
                v23 = objc_opt_isKindOfClass(v17, v22),
                v21 = v27,
                v20 = v28,
                (v23 & 1) != 0))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", objc_msgSend(v20, "indexOfObjectIdenticalTo:", v17)));
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v24, v16);

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v13);
    }

    v9 = v26;
  }

  return v30;
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
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer superlayer](self->_rootLayer, "superlayer"));

  if (!v9)
  {
    -[AppStoreMicaPlayer pause](self, "pause");
    -[AppStoreMicaPlayer setPlaybackTime:](self, "setPlaybackTime:", 0.0);
    -[AppStoreMicaPlayer moveAndResizeWithinParentLayer:usingGravity:animate:](self, "moveAndResizeWithinParentLayer:usingGravity:animate:", v11, v8, 0);
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer superlayer](self->_rootLayer, "superlayer"));

  if (v3)
  {
    -[AppStoreMicaPlayer pause](self, "pause");
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
  -[AppStoreMicaPlayer retinaScale](self, "retinaScale");
  -[CALayer mp_moveAndResizeWithinParentLayer:usingGravity:geometryFlipped:retinaScale:animate:](rootLayer, "mp_moveAndResizeWithinParentLayer:usingGravity:geometryFlipped:retinaScale:animate:", v10, v9, 1, v5);

}

- (id)publishedLayerWithKey:(id)a3 required:(BOOL)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppStoreMicaPlayer publishedObjectWithKey:required:](self, "publishedObjectWithKey:required:", a3, a4));
  if (v4)
  {
    v5 = objc_opt_class(CALayer);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
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
  v7 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_publishedObjects, "objectForKeyedSubscript:", v6));
  v8 = (void *)v7;
  if (v4 && !v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](self->_path, "lastPathComponent"));
    NSLog(CFSTR("Missing published object '%@' in Mica document '%@'"), v6, v9);

  }
  return v8;
}

- (void)play
{
  double v3;
  double v4;
  double v5;

  if (!-[AppStoreMicaPlayer isPlaying](self, "isPlaying"))
  {
    v3 = CACurrentMediaTime();
    -[AppStoreMicaPlayer playbackTime](self, "playbackTime");
    -[CALayer setBeginTime:](self->_rootLayer, "setBeginTime:", v3 - v4 / self->_preferredPlaybackSpeed);
    -[CALayer setTimeOffset:](self->_rootLayer, "setTimeOffset:", 0.0);
    *(float *)&v5 = self->_preferredPlaybackSpeed;
    -[CALayer setSpeed:](self->_rootLayer, "setSpeed:", v5);
    -[AppStoreMicaPlayer startPlayTimerIfNeeded](self, "startPlayTimerIfNeeded");
    -[AppStoreMicaPlayer notifyDelegateDidStartPlaying](self, "notifyDelegateDidStartPlaying");
  }
}

- (void)pause
{
  double v3;

  if (-[AppStoreMicaPlayer isPlaying](self, "isPlaying"))
  {
    -[AppStoreMicaPlayer playbackTime](self, "playbackTime");
    -[CALayer setTimeOffset:](self->_rootLayer, "setTimeOffset:");
    -[CALayer setBeginTime:](self->_rootLayer, "setBeginTime:", 0.0);
    LODWORD(v3) = 0;
    -[CALayer setSpeed:](self->_rootLayer, "setSpeed:", v3);
    -[AppStoreMicaPlayer stopPlayTimer](self, "stopPlayTimer");
    -[AppStoreMicaPlayer notifyDelegateDidStopPlaying](self, "notifyDelegateDidStopPlaying");
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
  if (-[AppStoreMicaPlayer isPlaying](self, "isPlaying"))
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

  if (-[AppStoreMicaPlayer isPlaying](self, "isPlaying"))
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
  unsigned int v5;
  double v6;

  v5 = -[AppStoreMicaPlayer isPlaying](self, "isPlaying");
  v6 = 0.0;
  if (v5)
  {
    v6 = CACurrentMediaTime() - a3;
    a3 = 0.0;
  }
  -[CALayer setBeginTime:](self->_rootLayer, "setBeginTime:", v6);
  -[CALayer setTimeOffset:](self->_rootLayer, "setTimeOffset:", a3);
  -[AppStoreMicaPlayer notifyDelegateDidChangePlaybackTime](self, "notifyDelegateDidChangePlaybackTime");
}

- (BOOL)isPlaybackAtEnd
{
  double v3;
  double v4;
  double v5;

  -[AppStoreMicaPlayer playbackTime](self, "playbackTime");
  v4 = v3;
  -[AppStoreMicaPlayer documentDuration](self, "documentDuration");
  return v4 >= v5 + -0.001;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (-[AppStoreMicaPlayer isTimerNeeded](self, "isTimerNeeded"))
    -[AppStoreMicaPlayer startPlayTimerIfNeeded](self, "startPlayTimerIfNeeded");
  else
    -[AppStoreMicaPlayer stopPlayTimer](self, "stopPlayTimer");
}

- (void)notifyDelegateDidStartPlaying
{
  AppStoreMicaPlayerDelegate **p_delegate;
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
    v7 = objc_opt_respondsToSelector(v6, "micaPlayerDidStartPlaying:");

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "micaPlayerDidStartPlaying:", self);

    }
  }
}

- (void)notifyDelegateDidStopPlaying
{
  AppStoreMicaPlayerDelegate **p_delegate;
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
    v7 = objc_opt_respondsToSelector(v6, "micaPlayerDidStopPlaying:");

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "micaPlayerDidStopPlaying:", self);

    }
  }
}

- (void)notifyDelegateDidChangePlaybackTime
{
  AppStoreMicaPlayerDelegate **p_delegate;
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
    v7 = objc_opt_respondsToSelector(v6, "micaPlayerDidChangePlaybackTime:");

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "micaPlayerDidChangePlaybackTime:", self);

    }
  }
}

- (BOOL)isTimerNeeded
{
  double v3;
  char v4;
  void *v5;
  void *v6;

  if (-[AppStoreMicaPlayer isPlaying](self, "isPlaying"))
  {
    -[AppStoreMicaPlayer documentDuration](self, "documentDuration");
    if (v3 == INFINITY)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppStoreMicaPlayer delegate](self, "delegate"));
      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppStoreMicaPlayer delegate](self, "delegate"));
        v4 = objc_opt_respondsToSelector(v6, "micaPlayerDidChangePlaybackTime:");

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
  NSTimer *v3;
  NSTimer *playTimer;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_playTimer)
  {
    if (-[AppStoreMicaPlayer isTimerNeeded](self, "isTimerNeeded"))
    {
      objc_initWeak(&location, self);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100087B6C;
      v5[3] = &unk_100754C38;
      objc_copyWeak(&v6, &location);
      v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, v5, 0.0333333333));
      playTimer = self->_playTimer;
      self->_playTimer = v3;

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
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
  if (-[AppStoreMicaPlayer isPlaybackAtEnd](self, "isPlaybackAtEnd", a3))
  {
    if (self->_loopDuringPlayback)
      -[AppStoreMicaPlayer setPlaybackTime:](self, "setPlaybackTime:", 0.0);
    else
      -[AppStoreMicaPlayer pause](self, "pause");
  }
  -[AppStoreMicaPlayer notifyDelegateDidChangePlaybackTime](self, "notifyDelegateDidChangePlaybackTime");
}

- (AppStoreMicaPlayerDelegate)delegate
{
  return (AppStoreMicaPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

@end
