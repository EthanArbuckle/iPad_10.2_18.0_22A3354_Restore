@implementation SKScene

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v13;
  id v14;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 0, &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  v14 = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v14);
  v6 = v14;

  objc_msgSend(v5, "setRequiresSecureCoding:", 0);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  v9 = *MEMORY[0x1E0CB2CD0];
  v13 = v6;
  objc_msgSend(v5, "decodeTopLevelObjectOfClasses:forKey:error:", v7, v9, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v13;

  return v10;
}

- (SKScene)init
{
  return -[SKScene initWithSize:](self, "initWithSize:", 1.0, 1.0);
}

- (SKScene)initWithSize:(CGSize)size
{
  double height;
  double width;
  SKScene *v5;
  SKScene *v6;
  uint64_t v7;
  NSMutableArray *allChildenWithConstraints;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CGSize v15;
  uint64_t v16;
  NSMapTable *touchMap;
  uint64_t v18;
  SKPhysicsBody *scenePinBody;
  uint64_t skcSceneNode;
  unsigned int v21;
  unsigned int v22;
  __int128 v24;
  objc_super v25;

  height = size.height;
  width = size.width;
  v25.receiver = self;
  v25.super_class = (Class)SKScene;
  v5 = -[SKEffectNode init](&v25, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SKEffectNode setShouldEnableEffects:](v5, "setShouldEnableEffects:", 0);
    v6->_lastUpdate = -1.0;
    v6->_pausedTime = 0.0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    allChildenWithConstraints = v6->_allChildenWithConstraints;
    v6->_allChildenWithConstraints = (NSMutableArray *)v7;

    v9 = objc_alloc_init(MEMORY[0x1E0D7D330]);
    objc_msgSend(v9, "setVelocityThreshold:", 0.1);
    -[SKScene set_pkPhysicsWorld:](v6, "set_pkPhysicsWorld:", v9);
    objc_storeStrong((id *)&v6->_physicsWorld, v9);
    LODWORD(v10) = 1041865114;
    LODWORD(v11) = 1.0;
    LODWORD(v12) = 1041865114;
    LODWORD(v13) = 1041865114;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithComponentRGBA:", v10, v12, v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKScene setBackgroundColor:](v6, "setBackgroundColor:", v14);

    objc_storeWeak(&v6->_view, 0);
    v6->_bounds.origin.x = 0.0;
    v6->_bounds.origin.y = 0.0;
    v6->_bounds.size.width = width;
    v6->_bounds.size.height = height;
    v15 = v6->_bounds.size;
    v6->_visibleRect.origin = v6->_bounds.origin;
    v6->_visibleRect.size = v15;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v16 = objc_claimAutoreleasedReturnValue();
    touchMap = v6->_touchMap;
    v6->_touchMap = (NSMapTable *)v16;

    -[SKScene setSize:](v6, "setSize:", width, height);
    -[SKScene setAnchorPoint:](v6, "setAnchorPoint:", 0.0, 0.0);
    -[SKNode setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 1);
    -[SKScene set_usesExplicitRender:](v6, "set_usesExplicitRender:", 0);
    -[SKScene set_usesExplicitUpdate:](v6, "set_usesExplicitUpdate:", 0);
    +[SKPhysicsBody bodyWithCircleOfRadius:](SKPhysicsBody, "bodyWithCircleOfRadius:", 1.0);
    v18 = objc_claimAutoreleasedReturnValue();
    scenePinBody = v6->_scenePinBody;
    v6->_scenePinBody = (SKPhysicsBody *)v18;

    -[SKPhysicsBody setDynamic:](v6->_scenePinBody, "setDynamic:", 0);
    -[SKPhysicsBody setCategoryBitMask:](v6->_scenePinBody, "setCategoryBitMask:", 0);
    objc_msgSend(v9, "addBody:", v6->_scenePinBody);
    skcSceneNode = (uint64_t)v6->_skcSceneNode;
    *(float *)&v21 = width;
    *(float *)&v22 = height;
    v24 = __PAIR64__(v22, v21);
    SKCNode::setSize(skcSceneNode, &v24);
    -[SKScene sceneDidLoad](v6, "sceneDidLoad");

  }
  return v6;
}

- (SKScene)initWithCoder:(id)a3
{
  id v4;
  SKScene *v5;
  SKScene *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SKPhysicsBody *scenePinBody;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  float v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSMapTable *touchMap;
  uint64_t v38;
  NSMutableArray *allChildenWithConstraints;
  void *v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  SKPhysicsWorld *physicsWorld;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  SKPhysicsBody *v56;
  void *v57;
  SKScene *v58;
  BOOL v59;
  SKScene *v60;
  SKScene *v62;
  void *v63;
  _QWORD v64[4];
  SKScene *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  objc_super v70;
  _BYTE v71[128];
  _QWORD v72[2];
  _QWORD v73[4];

  v73[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  v70.receiver = v5;
  v70.super_class = (Class)SKScene;
  v63 = v4;
  v6 = -[SKEffectNode initWithCoder:](&v70, sel_initWithCoder_, v4);
  v62 = v6;
  if (v6)
    v7 = v6 == v5;
  else
    v7 = 0;
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99E60];
    v73[0] = objc_opt_class();
    v73[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_scenePinBody"));
    v11 = objc_claimAutoreleasedReturnValue();
    scenePinBody = v5->_scenePinBody;
    v5->_scenePinBody = (SKPhysicsBody *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Scene_bounds"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "CGRectValue");
    v5->_bounds.origin.x = v14;
    v5->_bounds.origin.y = v15;
    v5->_bounds.size.width = v16;
    v5->_bounds.size.height = v17;

    v18 = (void *)MEMORY[0x1E0CEA478];
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backgroundColorR"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backgroundColorG"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v24 = v23;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backgroundColorB"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v27 = v26;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backgroundColorA"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v29 = v21;
    *(float *)&v30 = v24;
    *(float *)&v31 = v27;
    *(float *)&v33 = v32;
    *(float *)&v32 = v29;
    objc_msgSend(v18, "colorWithComponentRGBA:", v32, v30, v31, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKScene setBackgroundColor:](v5, "setBackgroundColor:", v34);

    -[SKScene setSize:](v5, "setSize:", v5->_bounds.size.width, v5->_bounds.size.height);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_anchorPoint"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "CGPointValue");
    -[SKScene setAnchorPoint:](v5, "setAnchorPoint:");

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v36 = objc_claimAutoreleasedReturnValue();
    touchMap = v5->_touchMap;
    v5->_touchMap = (NSMapTable *)v36;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v38 = objc_claimAutoreleasedReturnValue();
    allChildenWithConstraints = v5->_allChildenWithConstraints;
    v5->_allChildenWithConstraints = (NSMutableArray *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_visibleRect"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "CGRectValue");
    v5->_visibleRect.origin.x = v41;
    v5->_visibleRect.origin.y = v42;
    v5->_visibleRect.size.width = v43;
    v5->_visibleRect.size.height = v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_scaleMode"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKScene setScaleMode:](v5, "setScaleMode:", (int)objc_msgSend(v45, "intValue"));

    v46 = (void *)MEMORY[0x1E0C99E60];
    v72[0] = objc_opt_class();
    v72[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setWithArray:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v48, CFSTR("_physicsWorld"));
    v49 = objc_claimAutoreleasedReturnValue();
    physicsWorld = v5->_physicsWorld;
    v5->_physicsWorld = (SKPhysicsWorld *)v49;

    -[SKScene set_pkPhysicsWorld:](v5, "set_pkPhysicsWorld:", v5->_physicsWorld);
    -[SKNode setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 1);
    -[SKScene set_usesExplicitRender:](v5, "set_usesExplicitRender:", 0);
    -[SKScene set_usesExplicitUpdate:](v5, "set_usesExplicitUpdate:", 0);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_camera"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKScene setCamera:](v5, "setCamera:", v51);

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    -[SKPhysicsWorld bodies](v5->_physicsWorld, "bodies");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    if (v53)
    {
      v54 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v67 != v54)
            objc_enumerationMutation(v52);
          v56 = *(SKPhysicsBody **)(*((_QWORD *)&v66 + 1) + 8 * i);
          -[SKPhysicsBody node](v56, "node");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "scene");
          v58 = (SKScene *)objc_claimAutoreleasedReturnValue();
          if (v58 == v5)
          {

          }
          else
          {
            v59 = v56 == v5->_scenePinBody;

            if (!v59)
              -[SKPhysicsWorld removeBody:](v5->_physicsWorld, "removeBody:", v56);
          }
        }
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
      }
      while (v53);
    }

    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __25__SKScene_initWithCoder___block_invoke;
    v64[3] = &unk_1EA4FF760;
    v60 = v5;
    v65 = v60;
    -[SKNode enumerateChildNodesWithName:usingBlock:](v60, "enumerateChildNodesWithName:usingBlock:", CFSTR(".//SKFieldNode"), v64);
    -[SKNode enumerateChildNodesWithName:usingBlock:](v60, "enumerateChildNodesWithName:usingBlock:", CFSTR(".//SKReferenceNode"), &__block_literal_global_4);
    -[SKScene sceneDidLoad](v60, "sceneDidLoad");

  }
  return v62;
}

void __25__SKScene_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 304);
    objc_msgSend(v5, "field");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addField:", v4);

  }
}

void __25__SKScene_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "resolveReferenceNode");

}

- (void)dealloc
{
  AVAudioEngine *audioEngine;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[AVAudioEngine reset](self->_audioEngine, "reset");
  -[AVAudioEngine stop](self->_audioEngine, "stop");
  audioEngine = self->_audioEngine;
  self->_audioEngine = 0;

  -[SKNode _descendants](self, "_descendants");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeAllActions");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SKScene;
  -[SKNode dealloc](&v8, sel_dealloc);
}

- (BOOL)_hasConstraints
{
  return -[NSMutableArray count](self->_allChildenWithConstraints, "count") != 0;
}

- (void)_registerConstraintsForNode:(id)a3
{
  -[NSMutableArray addObject:](self->_allChildenWithConstraints, "addObject:", a3);
}

- (void)_removeConstraintsForNode:(id)a3
{
  -[NSMutableArray removeExactObject:](self->_allChildenWithConstraints, "removeExactObject:", a3);
}

- (UIColor)backgroundColor
{
  double v2;
  double v3;
  double v4;
  double v5;
  _DWORD *skcNode;

  skcNode = self->super.super._skcNode;
  LODWORD(v2) = skcNode[76];
  LODWORD(v3) = skcNode[77];
  LODWORD(v4) = skcNode[78];
  LODWORD(v5) = skcNode[79];
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithComponentRGBA:", v2, v3, v4, v5);
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  UIColor *v4;
  void *skcNode;
  int v6;
  __int128 v7;
  unsigned int v8;
  unsigned int v9;
  __int128 v10;

  v4 = backgroundColor;
  -[UIColor componentRGBA](v4, "componentRGBA");
  skcNode = self->super.super._skcNode;
  DWORD1(v7) = v6;
  *((_QWORD *)&v7 + 1) = __PAIR64__(v9, v8);
  v10 = v7;
  (*(void (**)(void *, __int128 *))(*(_QWORD *)skcNode + 184))(skcNode, &v10);

}

- (CGPoint)convertPointFromParent:(CGPoint)a3
{
  float32x4_t v3;
  float32_t y;
  float64x2_t v5;
  double v6;
  CGPoint result;

  v3.f32[0] = a3.x;
  y = a3.y;
  v3.f32[1] = y;
  v3.i32[2] = 0;
  v3.i32[3] = 1.0;
  v5 = vcvtq_f64_f32((float32x2_t)*(_OWORD *)&vmlsq_f32(v3, *((float32x4_t *)self->super.super._skcNode + 21), *((float32x4_t *)self->super.super._skcNode + 22)));
  v6 = v5.f64[1];
  result.x = v5.f64[0];
  result.y = v6;
  return result;
}

- (CGPoint)convertPointToParent:(CGPoint)a3
{
  float32x4_t v3;
  float32_t y;
  float64x2_t v5;
  double v6;
  CGPoint result;

  v3.f32[0] = a3.x;
  y = a3.y;
  v3.f32[1] = y;
  v3.i32[2] = 0;
  v3.i32[3] = 1.0;
  v5 = vcvtq_f64_f32((float32x2_t)*(_OWORD *)&vmlaq_f32(v3, *((float32x4_t *)self->super.super._skcNode + 21), *((float32x4_t *)self->super.super._skcNode + 22)));
  v6 = v5.f64[1];
  result.x = v5.f64[0];
  result.y = v6;
  return result;
}

- (SKSceneScaleMode)scaleMode
{
  return *((_QWORD *)self->_skcSceneNode + 91);
}

- (void)setScaleMode:(SKSceneScaleMode)scaleMode
{
  *((_QWORD *)self->_skcSceneNode + 91) = scaleMode;
}

- (SKNode)listener
{
  return (SKNode *)objc_loadWeakRetained((id *)&self->_listener);
}

- (void)setListener:(SKNode *)listener
{
  objc_storeWeak((id *)&self->_listener, listener);
}

- (void)handleAVAudioEngineInterruption:(id)a3
{
  AVAudioEngine *audioEngine;
  void *v5;
  id v6;

  -[AVAudioEngine mainMixerNode](self->_audioEngine, "mainMixerNode", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  audioEngine = self->_audioEngine;
  -[SKScene avAudioEnvironmentNode](self, "avAudioEnvironmentNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioEngine connect:to:format:](audioEngine, "connect:to:format:", v5, v6, 0);

  -[SKScene checkAudioEngine](self, "checkAudioEngine");
}

- (AVAudioEngine)audioEngine
{
  AVAudioEngine *audioEngine;
  AVAudioEngine *v4;
  AVAudioEngine *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;

  audioEngine = self->_audioEngine;
  if (!audioEngine)
  {
    v4 = (AVAudioEngine *)objc_alloc_init(MEMORY[0x1E0C89A88]);
    v5 = self->_audioEngine;
    self->_audioEngine = v4;

    -[AVAudioEngine mainMixerNode](self->_audioEngine, "mainMixerNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    -[SKScene frame](self, "frame");
    v9 = v8;
    objc_msgSend(v7, "distanceAttenuationParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9 * 0.150000006;
    *(float *)&v11 = v9 * 0.150000006;
    objc_msgSend(v10, "setReferenceDistance:", v11);

    -[SKScene frame](self, "frame");
    v13 = v12;
    objc_msgSend(v7, "distanceAttenuationParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v15 = v13;
    objc_msgSend(v14, "setMaximumDistance:", v15);

    LODWORD(v16) = 0;
    LODWORD(v17) = 0;
    LODWORD(v18) = 0;
    objc_msgSend(v7, "setListenerPosition:", v16, v17, v18);
    -[AVAudioEngine attachNode:](self->_audioEngine, "attachNode:", v7);
    -[AVAudioEngine connect:to:format:](self->_audioEngine, "connect:to:format:", v7, v6, 0);
    -[SKScene setAvAudioEnvironmentNode:](self, "setAvAudioEnvironmentNode:", v7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_handleAVAudioEngineInterruption_, *MEMORY[0x1E0C89650], self->_audioEngine);

    -[SKScene checkAudioEngine](self, "checkAudioEngine");
    audioEngine = self->_audioEngine;
  }
  return audioEngine;
}

- (CGPoint)anchorPoint
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)((char *)self->super.super._skcNode + 352));
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (void)setAnchorPoint:(CGPoint)anchorPoint
{
  double y;
  double x;
  SKCNode *skcNode;
  unsigned int v7;
  unsigned int v8;
  __n128 v9;
  CGFloat v10;
  __int128 v11;

  y = anchorPoint.y;
  x = anchorPoint.x;
  skcNode = (SKCNode *)self->super.super._skcNode;
  *(float *)&v7 = anchorPoint.x;
  *(float *)&v8 = anchorPoint.y;
  v11 = __PAIR64__(v8, v7);
  SKCNode::setAnchor(skcNode, &v11);
  v9.n128_f64[0] = -(x * self->_bounds.size.width);
  v10 = -(y * self->_bounds.size.height);
  *(_QWORD *)&self->_bounds.origin.x = v9.n128_u64[0];
  self->_bounds.origin.y = v10;
  v9.n128_f32[0] = v9.n128_f64[0];
  *(float *)&v10 = v10;
  SKCNode::setTranslation((SKCNode *)self->super.super._skcNode, v9, *(float *)&v10);
  -[SKScene setVisibleRect:](self, "setVisibleRect:", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
}

- (void)_makeBackingNode
{
  SKCSceneNode *v2;

  v2 = (SKCSceneNode *)operator new();
  SKCSceneNode::SKCSceneNode(v2);
  return v2;
}

- (void)_didMakeBackingNode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKScene;
  -[SKEffectNode _didMakeBackingNode](&v3, sel__didMakeBackingNode);
  self->_skcSceneNode = -[SKNode _backingNode](self, "_backingNode");
}

- (CGPoint)position
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  NSLog(CFSTR("SKScene: Setting the position of a SKScene has no effect."), a2, a3.x, a3.y);
}

- (void)setScale:(double)a3
{
  NSLog(CFSTR("SKScene: Setting the scale of a SKScene has no effect."), a2, a3);
}

- (double)xScale
{
  return 1.0;
}

- (void)setXScale:(double)a3
{
  NSLog(CFSTR("SKScene: Setting the scale of a SKScene has no effect."), a2, a3);
}

- (double)yScale
{
  return 1.0;
}

- (void)setYScale:(double)a3
{
  NSLog(CFSTR("SKScene: Setting the scale of a SKScene has no effect."), a2, a3);
}

- (double)zRotation
{
  return 0.0;
}

- (void)setZRotation:(double)a3
{
  NSLog(CFSTR("SKScene: Setting the zRotation of a SKScene has no effect."), a2, a3);
}

- (double)zPosition
{
  return 0.0;
}

- (void)setZPosition:(double)a3
{
  NSLog(CFSTR("SKScene: Setting the zPosition of a SKScene has no effect."), a2, a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SKScene;
  -[SKEffectNode encodeWithCoder:](&v16, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_scenePinBody, CFSTR("_scenePinBody"));
  v15 = *((_OWORD *)self->_skcSceneNode + 19);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(float *)&v15, (_QWORD)v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backgroundColorR"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)&v15 + 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_backgroundColorG"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)&v15 + 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_backgroundColorB"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)&v15 + 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("_backgroundColorA"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, self->_bounds.size.width, self->_bounds.size.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("Scene_bounds"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_visibleRect.origin.x, self->_visibleRect.origin.y, self->_visibleRect.size.width, self->_visibleRect.size.height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_visibleRect"));

  -[SKScene camera](self, "camera");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("_camera"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SKScene scaleMode](self, "scaleMode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("_scaleMode"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_physicsWorld, CFSTR("_physicsWorld"));
  v13 = (void *)MEMORY[0x1E0CB3B18];
  -[SKScene anchorPoint](self, "anchorPoint");
  objc_msgSend(v13, "valueWithCGPoint:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("_anchorPoint"));

}

- (BOOL)isEqualToNode:(id)a3
{
  SKScene *v4;
  SKScene *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  float v10;
  double v11;
  unsigned int v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  float v17;
  double v18;
  unsigned int v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  float v24;
  double v25;
  unsigned int v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  float v31;
  double v32;
  unsigned int v33;
  SKSceneScaleMode v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  BOOL v41;
  objc_super v43;

  v4 = (SKScene *)a3;
  if (self == v4)
  {
    v41 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v43.receiver = self;
      v43.super_class = (Class)SKScene;
      if (!-[SKEffectNode isEqualToNode:](&v43, sel_isEqualToNode_, v5))
        goto LABEL_16;
      -[SKScene backgroundColor](self, "backgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "green");
      v8 = v7;
      -[SKScene backgroundColor](v5, "backgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "green");
      v10 = v8;
      *(float *)&v11 = v11;
      v12 = COERCE_UNSIGNED_INT(v10 - *(float *)&v11) & 0x60000000;

      if (v12)
        goto LABEL_16;
      -[SKScene backgroundColor](self, "backgroundColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "red");
      v15 = v14;
      -[SKScene backgroundColor](v5, "backgroundColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "red");
      v17 = v15;
      *(float *)&v18 = v18;
      v19 = COERCE_UNSIGNED_INT(v17 - *(float *)&v18) & 0x60000000;

      if (v19)
        goto LABEL_16;
      -[SKScene backgroundColor](self, "backgroundColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "blue");
      v22 = v21;
      -[SKScene backgroundColor](v5, "backgroundColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "blue");
      v24 = v22;
      *(float *)&v25 = v25;
      v26 = COERCE_UNSIGNED_INT(v24 - *(float *)&v25) & 0x60000000;

      if (v26)
        goto LABEL_16;
      -[SKScene backgroundColor](self, "backgroundColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "alpha");
      v29 = v28;
      -[SKScene backgroundColor](v5, "backgroundColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "alpha");
      v31 = v29;
      *(float *)&v32 = v32;
      v33 = COERCE_UNSIGNED_INT(v31 - *(float *)&v32) & 0x60000000;

      if (v33
        || !CGRectEqualToRect(self->_bounds, v5->_bounds)
        || !CGRectEqualToRect(self->_visibleRect, v5->_visibleRect)
        || (v34 = -[SKScene scaleMode](self, "scaleMode"), v34 != -[SKScene scaleMode](v5, "scaleMode")))
      {
LABEL_16:
        v41 = 0;
      }
      else
      {
        -[SKScene anchorPoint](self, "anchorPoint");
        v36 = v35;
        v38 = v37;
        -[SKScene anchorPoint](v5, "anchorPoint");
        v41 = v38 == v40 && v36 == v39;
      }

    }
    else
    {
      v41 = 0;
    }
  }

  return v41;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGPoint v9;
  CGRect v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SKNode name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKScene frame](self, "frame");
  NSStringFromCGRect(v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKScene anchorPoint](self, "anchorPoint");
  NSStringFromCGPoint(v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SKScene> name:'%@' frame:%@ anchor:%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGPoint)convertPointFromView:(CGPoint)point
{
  CGFloat y;
  CGFloat x;
  SKView *WeakRetained;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint v12;
  CGPoint result;

  y = point.y;
  x = point.x;
  WeakRetained = (SKView *)objc_loadWeakRetained(&self->_view);
  v12.x = x;
  v12.y = y;
  v7 = CGPointConvertFromViewToScene(WeakRetained, self, v12).n128_u64[0];
  v9 = v8;

  v10 = *(double *)&v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)convertPointToView:(CGPoint)point
{
  CGFloat y;
  CGFloat x;
  SKView *WeakRetained;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint v12;
  CGPoint result;

  y = point.y;
  x = point.x;
  WeakRetained = (SKView *)objc_loadWeakRetained(&self->_view);
  v12.x = x;
  v12.y = y;
  v7 = CGPointConvertFromSceneToView(self, WeakRetained, v12).n128_u64[0];
  v9 = v8;

  v10 = *(double *)&v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
}

- (void)setVisibleRectSize:(CGSize)a3
{
  -[SKScene setVisibleRect:](self, "setVisibleRect:", self->_visibleRect.origin.x, self->_visibleRect.origin.y, a3.width, a3.height);
}

- (CGSize)visibleRectSize
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v6;
  double v7;
  double v8;
  CGSize result;
  CGRect v10;
  CGRect v11;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  v6 = CGRectGetWidth(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  v7 = CGRectGetHeight(v11);
  v8 = v6;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)setVisibleRectCenter:(CGPoint)a3
{
  -[SKScene setVisibleRect:](self, "setVisibleRect:", a3.x - self->_visibleRect.size.width * 0.5, a3.y - self->_visibleRect.size.height * 0.5);
}

- (CGPoint)visibleRectCenter
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  double MidY;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MidY = CGRectGetMidY(v11);
  v8 = MidX;
  result.y = MidY;
  result.x = v8;
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)size
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *skcNode;
  unsigned int v14;
  SKCNode *v15;
  double v16;
  double v17;
  __n128 v18;
  __int128 v19;

  height = size.height;
  width = size.width;
  -[SKScene size](self, "size");
  v7 = v6;
  v9 = v8;
  self->_bounds.size.width = width;
  self->_bounds.size.height = height;
  -[SKScene anchorPoint](self, "anchorPoint");
  self->_bounds.origin.x = -(v10 * width);
  v11 = self->_bounds.size.height;
  -[SKScene anchorPoint](self, "anchorPoint");
  self->_bounds.origin.y = -(v12 * v11);
  skcNode = self->super.super._skcNode;
  *(float *)&v14 = width;
  *(float *)&v12 = height;
  v19 = __PAIR64__(LODWORD(v12), v14);
  SKCNode::setSize((uint64_t)skcNode, &v19);
  v15 = (SKCNode *)self->super.super._skcNode;
  -[SKScene anchorPoint](self, "anchorPoint");
  *(float *)&height = -(v16 * self->_bounds.size.width);
  -[SKScene anchorPoint](self, "anchorPoint");
  v18.n128_f64[0] = -(v17 * self->_bounds.size.height);
  *(float *)&v17 = v18.n128_f64[0];
  v18.n128_u32[0] = LODWORD(height);
  SKCNode::setTranslation(v15, v18, *(float *)&v17);
  -[SKScene setVisibleRect:](self, "setVisibleRect:", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  -[SKScene didChangeSize:](self, "didChangeSize:", v7, v9);
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

+ (SKScene)sceneWithSize:(CGSize)size
{
  double height;
  double width;
  void *v5;
  void *v6;
  void *v7;
  CGSize v9;

  height = size.height;
  width = size.width;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSize:", size.width, size.height);
  if (width < 0.0 || height < 0.0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v9.width = width;
    v9.height = height;
    NSStringFromCGSize(v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", CFSTR("Invalid size specified"), CFSTR("Invalid size specified: %@"), v7);

  }
  return (SKScene *)v5;
}

+ (SKScene)sceneWithContentsOfFile:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "stringByAppendingPathExtension:", CFSTR("sks"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  if (objc_msgSend(v3, "isAbsolutePath"))
  {
    v6 = v3;
  }
  else
  {
    SKGetResourceBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathForResource:ofType:", v3, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v13 = 0;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, &v13);
    v10 = v13;
    objc_msgSend(v9, "setRequiresSecureCoding:", 0);
    objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scene"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("root"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11 = 0;
  }

  return (SKScene *)v11;
}

+ (SKScene)sceneWithContentsOfFile:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  CGSize v11;

  height = a4.height;
  width = a4.width;
  +[SKScene sceneWithContentsOfFile:](SKScene, "sceneWithContentsOfFile:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (width <= 0.0 || height <= 0.0)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v11.width = width;
    v11.height = height;
    NSStringFromCGSize(v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", CFSTR("Invalid size specified"), CFSTR("Invalid size specified: %@"), v8);

  }
  *(_QWORD *)(v6 + 216) = 0;
  *(_QWORD *)(v6 + 224) = 0;
  *(double *)(v6 + 232) = width;
  *(double *)(v6 + 240) = height;
  v9 = *(_OWORD *)(v6 + 232);
  *(_OWORD *)(v6 + 168) = *(_OWORD *)(v6 + 216);
  *(_OWORD *)(v6 + 184) = v9;
  objc_msgSend((id)v6, "setSize:", width, height);
  return (SKScene *)(id)v6;
}

- (SKPhysicsWorld)physicsWorld
{
  return self->_physicsWorld;
}

- (void)checkAudioEngine
{
  AVAudioEngine *audioEngine;
  int v4;
  id WeakRetained;
  id v6;
  char v7;
  _BOOL4 v8;
  int v9;
  id v10;
  AVAudioEngine *v11;
  char v12;
  uint64_t v13;

  audioEngine = self->_audioEngine;
  if (audioEngine)
    v4 = -[AVAudioEngine isRunning](audioEngine, "isRunning");
  else
    v4 = 0;
  WeakRetained = objc_loadWeakRetained(&self->_view);

  if (!WeakRetained)
    goto LABEL_7;
  v6 = objc_loadWeakRetained(&self->_view);
  v7 = objc_opt_respondsToSelector();

  v8 = -[SKNode isPaused](self, "isPaused");
  if ((v7 & 1) != 0)
  {
    if (v8)
    {
LABEL_7:
      v9 = 0;
      goto LABEL_10;
    }
    v10 = objc_loadWeakRetained(&self->_view);
    v9 = objc_msgSend(v10, "isPaused") ^ 1;

  }
  else
  {
    v9 = !v8;
  }
LABEL_10:
  if (v4 != v9)
  {
    v11 = self->_audioEngine;
    v12 = v9 ^ 1;
    if (!v11)
      v12 = 1;
    if ((v12 & 1) != 0)
    {
      -[AVAudioEngine pause](v11, "pause");
    }
    else
    {
      v13 = 0;
      -[AVAudioEngine startAndReturnError:](v11, "startAndReturnError:", &v13);
    }
  }
}

- (void)_didMoveToView:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  self->_lastUpdate = skCurrentTime();
  objc_storeWeak(&self->_view, v4);
  -[SKScene checkAudioEngine](self, "checkAudioEngine");
  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __26__SKScene__didMoveToView___block_invoke;
    v5[3] = &unk_1EA4FF760;
    v5[4] = self;
    -[SKNode enumerateChildNodesWithName:usingBlock:](self, "enumerateChildNodesWithName:usingBlock:", CFSTR(".//SKAudioNode"), v5);
  }
  -[SKScene didMoveToView:](self, "didMoveToView:", v4);

}

void __26__SKScene__didMoveToView___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "_connectToScene:", *(_QWORD *)(a1 + 32));

}

- (void)_update:(double)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  SKScene *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id WeakRetained;
  id v19;
  char v20;
  id v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  _OWORD *v26;
  void *v27;
  SKPhysicsBody *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *j;
  void *v33;
  int v34;
  int v35;
  SKPhysicsBody *v36;
  SKPhysicsBody *v37;
  _BOOL4 v38;
  void *v39;
  _QWORD *v40;
  uint64_t v41;
  void *v42;
  float v43;
  void *v44;
  double v45;
  id v46;
  id v47;
  char v48;
  id v49;
  double v50;
  void *v51;
  uint64_t v52;
  char *v53;
  void *v54;
  void *v55;
  BOOL v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  BOOL v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  float v88;
  float v89;
  double v90;
  float v91;
  float v92;
  __double2 v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  id v103;
  void *v104;
  BOOL v105;
  double v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  void *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  void *v116;
  double v117;
  double v118;
  void *v119;
  float v120;
  float v121;
  double v122;
  float v123;
  float v124;
  void *v125;
  double v126;
  double v127;
  void *v128;
  float v129;
  float v130;
  double v131;
  float v132;
  float v133;
  void *v134;
  void *v135;
  double v136;
  double v137;
  double v138;
  double v139;
  void *v140;
  BOOL v141;
  double v142;
  double v143;
  double v144;
  double v145;
  void *v146;
  BOOL v147;
  void *v148;
  void *v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  void *v156;
  void *v157;
  double v158;
  double v159;
  double v160;
  double v161;
  void *v162;
  void *v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  float v171;
  float v172;
  double v173;
  float v174;
  double v175;
  double v176;
  void *v177;
  double v178;
  double v179;
  void *v180;
  float v181;
  float v182;
  double v183;
  float v184;
  id v185;
  void *v186;
  BOOL v187;
  double v188;
  double v189;
  double v190;
  double v191;
  void *v192;
  BOOL v193;
  void *v194;
  void *v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  void *v202;
  void *v203;
  double v204;
  double v205;
  double v206;
  double v207;
  void *v208;
  void *v209;
  double v210;
  double v211;
  double v212;
  double v213;
  void *v214;
  double v215;
  double v216;
  void *v217;
  float v218;
  float v219;
  float v220;
  float v221;
  float v222;
  float v223;
  float v224;
  float v225;
  double v226;
  float v227;
  float v228;
  double v229;
  double v230;
  double v231;
  double v232;
  float v233;
  float v234;
  double v235;
  float v236;
  float v237;
  double v238;
  double v239;
  void *v240;
  double v241;
  double v242;
  void *v243;
  float v244;
  float v245;
  double v246;
  float v247;
  id v248;
  double v249;
  double v250;
  double v251;
  double v252;
  void *v253;
  double v254;
  double v255;
  void *v256;
  float v257;
  float v258;
  double v259;
  float v260;
  float v261;
  void *v262;
  double v263;
  double v264;
  void *v265;
  float v266;
  float v267;
  double v268;
  float v269;
  float v270;
  double v271;
  double v272;
  double v273;
  double v274;
  void *v275;
  BOOL v276;
  void *v277;
  void *v278;
  double v279;
  double v280;
  double v281;
  double v282;
  double v283;
  double v284;
  double v285;
  double v286;
  double v287;
  float v288;
  float v289;
  double v290;
  id v291;
  double v292;
  double v293;
  double v294;
  double v295;
  void *v296;
  double v297;
  double v298;
  void *v299;
  float v300;
  float v301;
  double v302;
  float v303;
  float v304;
  void *v305;
  double v306;
  double v307;
  void *v308;
  double v309;
  double v310;
  float v311;
  float v312;
  float v313;
  double v314;
  double v315;
  double v316;
  double v317;
  void *v318;
  BOOL v319;
  void *v320;
  void *v321;
  double v322;
  double v323;
  double v324;
  double v325;
  double v326;
  double v327;
  void *v328;
  double v329;
  double v330;
  void *v331;
  double v332;
  double v333;
  float v334;
  float v335;
  float v336;
  float v337;
  float v338;
  float v339;
  float v340;
  float v341;
  float v342;
  uint64_t v343;
  void *v344;
  double v345;
  id v346;
  id v347;
  char v348;
  id v349;
  id v350;
  id v351;
  char v352;
  id v353;
  double v354;
  SKScene *v355;
  id v356;
  void *v357;
  double v358;
  double v359;
  double MidX;
  double v361;
  double v362;
  void *v363;
  double v364;
  double v365;
  double v366;
  uint64_t v367;
  id *location;
  id obj;
  NSMutableArray *obja;
  SKScene *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  char *v376;
  id v377;
  char *v378;
  id i;
  id v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  void *__p;
  void *v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  objc_super v400;
  void **v401;
  _BYTE v402[128];
  _BYTE v403[128];
  _QWORD v404[3];
  _QWORD *v405;
  _BYTE v406[128];
  _BYTE v407[128];
  uint64_t v408;
  CGRect v409;
  CGRect v410;

  v408 = *MEMORY[0x1E0C80C00];
  if (*((_BYTE *)self->_skcSceneNode + 172))
    return;
  v4 = CACurrentMediaTime();
  _perfBeginClientUpdate(v4);
  v372 = self;
  -[SKScene view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (sk_debug_get_optional())
    kdebug_trace();

  -[SKScene delegate](v372, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (-[SKScene delegate](v372, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[SKScene delegate](v372, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "update:forScene:", v372, a3);

    v10 = v372;
  }
  else
  {
    v10 = v372;
    -[SKScene update:](v372, "update:", a3);
  }
  -[SKScene view](v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (sk_debug_get_optional())
    kdebug_trace();

  if (v372->_lastUpdate < 0.0)
    v372->_lastUpdate = a3;
  v12 = CACurrentMediaTime();
  _perfBeginActions(v12);
  -[SKScene view](v372, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (sk_debug_get_optional())
    kdebug_trace();

  if (SKCNode::matchesAnyFlags((SKCNode *)v372->_skcSceneNode, 32, 32))
  {
    v400.receiver = v372;
    v400.super_class = (Class)SKScene;
    -[SKNode _update:](&v400, sel__update_, a3);
  }
  else
  {
    -[SKScene view](v372, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    kdebug_trace();

  }
  -[SKScene view](v372, "view", 152);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (sk_debug_get_optional())
    kdebug_trace();

  v16 = CACurrentMediaTime();
  _perfEndActions(v16);
  SKCRendererRemoveCompletedSoundSources();
  if (a3 - *(double *)((char *)&v372->super.super.super.super.isa + v367) <= 0.00000011920929)
    v17 = 0.0166666675;
  else
    v17 = a3 - *(double *)((char *)&v372->super.super.super.super.isa + v367);
  location = (id *)&v372->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&v372->_delegate);
  if (WeakRetained
    && (v19 = objc_loadWeakRetained(location),
        v20 = objc_opt_respondsToSelector(),
        v19,
        WeakRetained,
        (v20 & 1) != 0))
  {
    v21 = objc_loadWeakRetained(location);
    objc_msgSend(v21, "didEvaluateActionsForScene:", v372);

  }
  else
  {
    -[SKScene didEvaluateActions](v372, "didEvaluateActions");
  }
  if (!-[SKNode isPaused](v372, "isPaused"))
  {
    if (SKCNode::matchesAnyFlags((SKCNode *)v372->_skcSceneNode, 8, 8))
    {
      v22 = CACurrentMediaTime();
      _perfBeginPhysics(v22);
      -[SKScene view](v372, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (sk_debug_get_optional())
        kdebug_trace();

      v398 = 0u;
      v399 = 0u;
      v396 = 0u;
      v397 = 0u;
      -[SKPhysicsWorld bodies](v372->_physicsWorld, "bodies");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v375 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v396, v407, 16);
      if (v375)
      {
        v373 = *(_QWORD *)v397;
        do
        {
          for (i = 0; i != (id)v375; i = (char *)i + 1)
          {
            if (*(_QWORD *)v397 != v373)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v396 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v24, "representedObject");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v377 = v25;
              v26 = (_OWORD *)objc_msgSend(v25, "_backingNode");
              v389 = 0uLL;
              SKCNode::resolveWorldPositionRotationAndScale(v26, &v389, 0, 0);
              (*(void (**)(_OWORD *))(*(_QWORD *)v26 + 200))(v26);
              objc_msgSend(v377, "parent");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "physicsBody");
              v28 = (SKPhysicsBody *)objc_claimAutoreleasedReturnValue();
              if (!v28)
                v28 = v372->_scenePinBody;
              v394 = 0u;
              v395 = 0u;
              v392 = 0u;
              v393 = 0u;
              objc_msgSend(v24, "_joints");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = (id)objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v392, v406, 16);
              if (v30)
              {
                v31 = *(_QWORD *)v393;
                while (2)
                {
                  for (j = 0; j != v30; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v393 != v31)
                      objc_enumerationMutation(v29);
                    v33 = *(void **)(*((_QWORD *)&v392 + 1) + 8 * (_QWORD)j);
                    v34 = objc_msgSend(v33, "_implicit");
                    if (v27)
                      v35 = v34;
                    else
                      v35 = 0;
                    if (v35 == 1)
                    {
                      objc_msgSend(v33, "bodyA");
                      v36 = (SKPhysicsBody *)objc_claimAutoreleasedReturnValue();
                      if (v36 == v28)
                      {

LABEL_53:
                        v30 = v33;
                        goto LABEL_54;
                      }
                      objc_msgSend(v33, "bodyB");
                      v37 = (SKPhysicsBody *)objc_claimAutoreleasedReturnValue();
                      v38 = v37 == v28;

                      if (v38)
                        goto LABEL_53;
                    }
                  }
                  v30 = (id)objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v392, v406, 16);
                  if (v30)
                    continue;
                  break;
                }
              }
LABEL_54:

              if (!objc_msgSend(v24, "pinned"))
              {
                if (v30)
                  -[SKPhysicsWorld removeJoint:](v372->_physicsWorld, "removeJoint:", v30);
                goto LABEL_70;
              }
              if (objc_msgSend(v24, "allowsRotation"))
              {
                if (!v30)
                  goto LABEL_59;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  -[SKPhysicsWorld removeJoint:](v372->_physicsWorld, "removeJoint:", v30);

LABEL_59:
                  if (v28)
                  {
                    +[SKPhysicsJointPin jointWithBodyA:bodyB:anchor:](SKPhysicsJointPin, "jointWithBodyA:bodyB:anchor:", v28, v24, *(float *)&v389, *((float *)&v389 + 1));
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "setFrictionTorque:", 0.0);
                    objc_msgSend(v39, "set_implicit:", 1);
                    -[SKPhysicsWorld addJoint:](v372->_physicsWorld, "addJoint:", v39);
                    goto LABEL_68;
                  }
                  goto LABEL_69;
                }
              }
              else
              {
                if (v30)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    goto LABEL_70;
                  -[SKPhysicsWorld removeJoint:](v372->_physicsWorld, "removeJoint:", v30);

                }
                if (v28)
                {
                  +[SKPhysicsJointFixed jointWithBodyA:bodyB:anchor:](SKPhysicsJointFixed, "jointWithBodyA:bodyB:anchor:", v28, v24, *(float *)&v389, *((float *)&v389 + 1));
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "set_implicit:", 1);
                  -[SKPhysicsWorld addJoint:](v372->_physicsWorld, "addJoint:", v39);
LABEL_68:

                }
LABEL_69:
                v30 = 0;
              }
LABEL_70:

              v25 = v377;
            }

          }
          v375 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v396, v407, 16);
        }
        while (v375);
      }

      MEMORY[0x1DF0CF4B8](&v389, -[PKPhysicsWorld aether](v372->__pkPhysicsWorld, "aether"));
      v404[0] = &off_1EA4FF810;
      v405 = v404;
      PKCAether::Evaluator::foreach((uint64_t)&v389, (uint64_t)v404);
      v40 = v405;
      if (v405 == v404)
      {
        v41 = 4;
        v40 = v404;
      }
      else
      {
        if (!v405)
        {
LABEL_79:
          v43 = v17;
          -[SKPhysicsWorld stepWithTime:velocityIterations:positionIterations:](v372->_physicsWorld, "stepWithTime:velocityIterations:positionIterations:", 8, 3, fminf(v43, 1.0));
          -[SKScene view](v372, "view");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (sk_debug_get_optional())
            kdebug_trace();

          v45 = CACurrentMediaTime();
          _perfEndPhysics(v45);
          if (__p)
          {
            v391 = __p;
            operator delete(__p);
          }
          v401 = (void **)&v389;
          std::vector<std::shared_ptr<PKCField>>::__destroy_vector::operator()[abi:ne180100](&v401);
          goto LABEL_84;
        }
        v41 = 5;
      }
      (*(void (**)(void))(*v40 + 8 * v41))();
      goto LABEL_79;
    }
    -[SKScene view](v372, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    kdebug_trace();

  }
LABEL_84:
  v46 = objc_loadWeakRetained(location);
  if (v46
    && (v47 = objc_loadWeakRetained(location),
        v48 = objc_opt_respondsToSelector(),
        v47,
        v46,
        (v48 & 1) != 0))
  {
    v49 = objc_loadWeakRetained(location);
    objc_msgSend(v49, "didSimulatePhysicsForScene:", v372);

  }
  else
  {
    -[SKScene didSimulatePhysics](v372, "didSimulatePhysics");
  }
  v50 = CACurrentMediaTime();
  _perfBeginConstraints(v50);
  -[SKScene view](v372, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (sk_debug_get_optional())
    kdebug_trace();

  v387 = 0u;
  v388 = 0u;
  v385 = 0u;
  v386 = 0u;
  obja = v372->_allChildenWithConstraints;
  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v385, v403, 16);
  if (v52)
  {
    v374 = *(_QWORD *)v386;
    do
    {
      v53 = 0;
      v376 = (char *)v52;
      do
      {
        if (*(_QWORD *)v386 != v374)
          objc_enumerationMutation(obja);
        v54 = *(void **)(*((_QWORD *)&v385 + 1) + 8 * (_QWORD)v53);
        objc_msgSend(v54, "constraints");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v378 = v53;
        v56 = v55 == 0;

        if (!v56)
        {
          v383 = 0u;
          v384 = 0u;
          v381 = 0u;
          v382 = 0u;
          objc_msgSend(v54, "constraints");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v381, v402, 16);
          if (!v58)
            goto LABEL_200;
          v59 = *(_QWORD *)v382;
          v380 = v57;
          while (1)
          {
            v60 = 0;
            do
            {
              if (*(_QWORD *)v382 != v59)
                objc_enumerationMutation(v380);
              v61 = *(void **)(*((_QWORD *)&v381 + 1) + 8 * v60);
              if ((objc_msgSend(v61, "enabled") & 1) != 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v62 = v61;
                  objc_msgSend(v62, "referenceNode");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  v64 = v63 == 0;

                  if (!v64)
                  {
                    objc_msgSend(v54, "position");
                    v66 = v65;
                    v68 = v67;
                    objc_msgSend(v62, "referenceNode");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "parent");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "convertPoint:fromNode:", v70, v66, v68);
                    v72 = v71;
                    v74 = v73;

                    objc_msgSend(v62, "referenceNode");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "parent");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "convertPoint:fromNode:", v76, v66 + 1.0, v68 + 0.0);
                    v78 = v77;
                    v80 = v79;

                    objc_msgSend(v54, "zRotation");
                    v82 = v81;
                    v83 = atan2(-(v78 - v72), v80 - v74);
                    objc_msgSend(v62, "zRotationRange");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v84, "lowerLimit");
                    v86 = v85;
                    objc_msgSend(v62, "zRotationRange");
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "upperLimit");
                    v88 = v82 + v83;
                    v91 = v90;
                    if (v88 <= v91)
                      v91 = v82 + v83;
                    v89 = v86;
                    if (v91 >= v89)
                      v92 = v91;
                    else
                      v92 = v86;
LABEL_109:

                    v93 = __sincos_stret(v92);
                    objc_msgSend(v62, "referenceNode");
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "parent");
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v94, "convertPoint:toNode:", v95, v72 + v93.__cosval, v74 + v93.__sinval);
                    v97 = v96;
                    v99 = v98;

                    objc_msgSend(v54, "position");
                    v101 = v100;
                    objc_msgSend(v54, "position");
                    objc_msgSend(v54, "setZRotation:", (double)(atan2(-(v97 - v101), v99 - v102) + 1.57079633));
                    goto LABEL_177;
                  }
                  objc_msgSend(v54, "zRotation");
                  v176 = v175;
                  objc_msgSend(v62, "zRotationRange");
                  v177 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v177, "lowerLimit");
                  v179 = v178;
                  objc_msgSend(v62, "zRotationRange");
                  v180 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v180, "upperLimit");
                  v181 = v176;
                  v184 = v183;
                  if (v181 <= v184)
                    v184 = v176;
                  v182 = v179;
                  if (v184 < v182)
                    v184 = v179;
                  goto LABEL_175;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v103 = v61;
                  objc_msgSend(v103, "referenceNode");
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                  v105 = v104 == 0;

                  if (v105)
                  {
                    objc_msgSend(v54, "position");
                    v230 = v229;
                    objc_msgSend(v103, "xRange");
                    v177 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v177, "lowerLimit");
                    v232 = v231;
                    objc_msgSend(v103, "xRange");
                    v180 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v180, "upperLimit");
                    v233 = v230;
                    v236 = v235;
                    if (v233 <= v236)
                      v236 = v230;
                    v234 = v232;
                    if (v236 >= v234)
                      v237 = v236;
                    else
                      v237 = v232;
                    objc_msgSend(v54, "position");
                    v239 = v238;
                    objc_msgSend(v103, "yRange");
                    v240 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v240, "lowerLimit");
                    v242 = v241;
                    objc_msgSend(v103, "yRange");
                    v243 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v243, "upperLimit");
                    v244 = v239;
                    v247 = v246;
                    if (v244 <= v247)
                      v247 = v239;
                    v245 = v242;
                    if (v247 < v245)
                      v247 = v242;
                    objc_msgSend(v54, "setPosition:", v237, v247);

                    goto LABEL_176;
                  }
                  objc_msgSend(v54, "position");
                  v107 = v106;
                  v109 = v108;
                  objc_msgSend(v103, "referenceNode");
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "parent");
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v110, "convertPoint:fromNode:", v111, v107, v109);
                  v113 = v112;
                  v115 = v114;

                  objc_msgSend(v103, "xRange");
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v116, "lowerLimit");
                  v118 = v117;
                  objc_msgSend(v103, "xRange");
                  v119 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v119, "upperLimit");
                  v120 = v113;
                  v123 = v122;
                  if (v120 <= v123)
                    v123 = v113;
                  v121 = v118;
                  if (v123 >= v121)
                    v124 = v123;
                  else
                    v124 = v118;
                  objc_msgSend(v103, "yRange");
                  v125 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v125, "lowerLimit");
                  v127 = v126;
                  objc_msgSend(v103, "yRange");
                  v128 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v128, "upperLimit");
                  v129 = v115;
                  v132 = v131;
                  if (v129 <= v132)
                    v132 = v115;
                  v130 = v127;
                  if (v132 >= v130)
                    v133 = v132;
                  else
                    v133 = v127;

                  objc_msgSend(v103, "referenceNode");
                  v134 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "parent");
                  v135 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v134, "convertPoint:toNode:", v135, v124, v133);
                  v137 = v136;
                  v139 = v138;

                  objc_msgSend(v54, "setPosition:", v137, v139);
LABEL_177:

                  goto LABEL_178;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v62 = v61;
                  objc_msgSend(v62, "referenceNode");
                  v140 = (void *)objc_claimAutoreleasedReturnValue();
                  v141 = v140 == 0;

                  if (!v141)
                  {
                    objc_msgSend(v62, "point");
                    v143 = v142;
                    v145 = v144;
                    objc_msgSend(v62, "node");
                    v146 = (void *)objc_claimAutoreleasedReturnValue();
                    v147 = v146 == 0;

                    if (!v147)
                    {
                      objc_msgSend(v54, "parent");
                      v148 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v62, "node");
                      v149 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v148, "convertPoint:fromNode:", v149, v143, v145);
                      v143 = v150;
                      v145 = v151;

                    }
                    objc_msgSend(v54, "position");
                    v153 = v152;
                    v155 = v154;
                    objc_msgSend(v62, "referenceNode");
                    v156 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "parent");
                    v157 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v156, "convertPoint:fromNode:", v157, v143, v145);
                    v159 = v158;
                    v161 = v160;

                    objc_msgSend(v62, "referenceNode");
                    v162 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "parent");
                    v163 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v162, "convertPoint:fromNode:", v163, v153, v155);
                    v72 = v164;
                    v74 = v165;

                    v166 = atan2(-(v159 - v72), v161 - v74);
                    objc_msgSend(v54, "zRotation");
                    v168 = v167;
                    objc_msgSend(v62, "offset");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v84, "lowerLimit");
                    v170 = v169;
                    objc_msgSend(v62, "offset");
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "upperLimit");
                    v171 = v168;
                    v174 = v166 + 1.57079633 + v173;
                    if (v171 <= v174)
                      v174 = v168;
                    v172 = v166 + 1.57079633 + v170;
                    if (v174 >= v172)
                      v92 = v174;
                    else
                      v92 = v166 + 1.57079633 + v170;
                    goto LABEL_109;
                  }
                  objc_msgSend(v62, "point");
                  v272 = v271;
                  v274 = v273;
                  objc_msgSend(v62, "node");
                  v275 = (void *)objc_claimAutoreleasedReturnValue();
                  v276 = v275 == 0;

                  if (!v276)
                  {
                    objc_msgSend(v54, "parent");
                    v277 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v62, "node");
                    v278 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v277, "convertPoint:fromNode:", v278, v272, v274);
                    v272 = v279;
                    v274 = v280;

                  }
                  objc_msgSend(v54, "position");
                  v283 = atan2(-(v272 - v281), v274 - v282);
                  objc_msgSend(v54, "zRotation");
                  v285 = v284;
                  objc_msgSend(v62, "offset");
                  v177 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v177, "lowerLimit");
                  v287 = v286;
                  objc_msgSend(v62, "offset");
                  v180 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v180, "upperLimit");
                  v288 = v285;
                  v184 = v283 + 1.57079633 + v290;
                  if (v288 <= v184)
                    v184 = v285;
                  v289 = v283 + 1.57079633 + v287;
                  if (v184 < v289)
                    v184 = v283 + 1.57079633 + v287;
LABEL_175:
                  objc_msgSend(v54, "setZRotation:", v184);
                  goto LABEL_176;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v185 = v61;
                  objc_msgSend(v185, "referenceNode");
                  v186 = (void *)objc_claimAutoreleasedReturnValue();
                  v187 = v186 == 0;

                  if (v187)
                  {
                    objc_msgSend(v185, "point");
                    v315 = v314;
                    v317 = v316;
                    objc_msgSend(v185, "node");
                    v318 = (void *)objc_claimAutoreleasedReturnValue();
                    v319 = v318 == 0;

                    if (!v319)
                    {
                      objc_msgSend(v54, "parent");
                      v320 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v185, "node");
                      v321 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v320, "convertPoint:fromNode:", v321, v315, v317);
                      v315 = v322;
                      v317 = v323;

                    }
                    objc_msgSend(v54, "position");
                    v325 = v324;
                    v327 = v326;
                    objc_msgSend(v185, "distanceRange");
                    v328 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v328, "lowerLimit");
                    v330 = v329;
                    objc_msgSend(v185, "distanceRange");
                    v331 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v331, "upperLimit");
                    v333 = v332;

                    v334 = v317;
                    v335 = v315;
                    v336 = v325;
                    v337 = v327;
                    v338 = v335 - v336;
                    v339 = v334 - v337;
                    v340 = sqrtf((float)(v339 * v339) + (float)(v338 * v338));
                    if (v340 > 0.0)
                    {
                      v341 = fmax(v330, 0.0);
                      v342 = v333;
                      if (v340 <= v342)
                        v342 = v340;
                      if (v342 >= v341)
                        v341 = v342;
                      objc_msgSend(v54, "setPosition:", (float)((float)((float)(v338 * (float)(1.0 / v340)) * (float)(v340 - v341)) + v336), (float)((float)((float)(v339 * (float)(1.0 / v340)) * (float)(v340 - v341)) + v337));
                    }
                  }
                  else
                  {
                    objc_msgSend(v185, "point");
                    v189 = v188;
                    v191 = v190;
                    objc_msgSend(v185, "node");
                    v192 = (void *)objc_claimAutoreleasedReturnValue();
                    v193 = v192 == 0;

                    if (!v193)
                    {
                      objc_msgSend(v54, "parent");
                      v194 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v185, "node");
                      v195 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v194, "convertPoint:fromNode:", v195, v189, v191);
                      v189 = v196;
                      v191 = v197;

                    }
                    objc_msgSend(v54, "position");
                    v199 = v198;
                    v201 = v200;
                    objc_msgSend(v185, "referenceNode");
                    v202 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "parent");
                    v203 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v202, "convertPoint:fromNode:", v203, v189, v191);
                    v205 = v204;
                    v207 = v206;

                    objc_msgSend(v185, "referenceNode");
                    v208 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "parent");
                    v209 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v208, "convertPoint:fromNode:", v209, v199, v201);
                    v211 = v210;
                    v213 = v212;

                    objc_msgSend(v185, "distanceRange");
                    v214 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v214, "lowerLimit");
                    v216 = v215;
                    objc_msgSend(v185, "distanceRange");
                    v217 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v217, "upperLimit");
                    v218 = v205;
                    v219 = v207;
                    v220 = v211;
                    v221 = v213;
                    v222 = v218 - v220;
                    v223 = v219 - v221;
                    v224 = sqrtf((float)(v223 * v223) + (float)(v222 * v222));
                    v225 = fmax(v216, 0.0);
                    v227 = v226;
                    if (v224 <= v227)
                      v227 = v224;
                    if (v227 >= v225)
                      v228 = v227;
                    else
                      v228 = v225;

                    objc_msgSend(v185, "referenceNode");
                    v177 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "parent");
                    v180 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v177, "convertPoint:toNode:", v180, (float)((float)((float)(v222 * (float)(1.0 / v224)) * (float)(v224 - v228)) + v220), (float)((float)((float)(v223 * (float)(1.0 / v224)) * (float)(v224 - v228)) + v221));
                    objc_msgSend(v54, "setPosition:");
LABEL_176:

                  }
                  goto LABEL_177;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v248 = v61;
                  objc_msgSend(v54, "size");
                  v250 = v249;
                  v252 = v251;
                  objc_msgSend(v248, "widthRange");
                  v253 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v253, "lowerLimit");
                  v255 = v254;
                  objc_msgSend(v248, "widthRange");
                  v256 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v256, "upperLimit");
                  v257 = v250;
                  v260 = v259;
                  if (v257 <= v260)
                    v260 = v250;
                  v258 = v255;
                  if (v260 >= v258)
                    v261 = v260;
                  else
                    v261 = v255;

                  objc_msgSend(v248, "heightRange");
                  v262 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v262, "lowerLimit");
                  v264 = v263;
                  objc_msgSend(v248, "heightRange");
                  v265 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v265, "upperLimit");
                  v266 = v252;
                  v269 = v268;
                  if (v266 <= v269)
                    v269 = v252;
                  v267 = v264;
                  if (v269 >= v267)
                    v270 = v269;
                  else
                    v270 = v264;

                  objc_msgSend(v54, "setSize:", v261, v270);
                  goto LABEL_177;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v291 = v61;
                  objc_msgSend(v54, "xScale");
                  v293 = v292;
                  objc_msgSend(v54, "yScale");
                  v295 = v294;
                  objc_msgSend(v291, "xRange");
                  v296 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v296, "lowerLimit");
                  v298 = v297;
                  objc_msgSend(v291, "xRange");
                  v299 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v299, "upperLimit");
                  v300 = v293;
                  v303 = v302;
                  if (v300 <= v303)
                    v303 = v293;
                  v301 = v298;
                  if (v303 >= v301)
                    v304 = v303;
                  else
                    v304 = v298;

                  objc_msgSend(v291, "yRange");
                  v305 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v305, "lowerLimit");
                  v307 = v306;
                  objc_msgSend(v291, "yRange");
                  v308 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v308, "upperLimit");
                  v310 = v309;

                  objc_msgSend(v54, "setXScale:", v304);
                  v311 = v295;
                  v313 = v310;
                  if (v311 > v313)
                    v311 = v310;
                  v312 = v307;
                  if (v311 < v312)
                    v311 = v307;
                  objc_msgSend(v54, "setYScale:", v311);
                  goto LABEL_177;
                }
              }
LABEL_178:
              ++v60;
            }
            while (v58 != v60);
            v57 = v380;
            v343 = objc_msgSend(v380, "countByEnumeratingWithState:objects:count:", &v381, v402, 16);
            v58 = v343;
            if (!v343)
            {
LABEL_200:

              break;
            }
          }
        }
        v53 = v378 + 1;
      }
      while (v378 + 1 != v376);
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v385, v403, 16);
    }
    while (v52);
  }

  -[SKScene view](v372, "view");
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  if (sk_debug_get_optional())
    kdebug_trace();

  v345 = CACurrentMediaTime();
  _perfEndConstraints(v345);
  v346 = objc_loadWeakRetained(location);
  if (v346
    && (v347 = objc_loadWeakRetained(location),
        v348 = objc_opt_respondsToSelector(),
        v347,
        v346,
        (v348 & 1) != 0))
  {
    v349 = objc_loadWeakRetained(location);
    objc_msgSend(v349, "didApplyConstraintsForScene:", v372);

  }
  else
  {
    -[SKScene didApplyConstraints](v372, "didApplyConstraints");
  }
  v350 = objc_loadWeakRetained(location);
  if (v350
    && (v351 = objc_loadWeakRetained(location),
        v352 = objc_opt_respondsToSelector(),
        v351,
        v350,
        (v352 & 1) != 0))
  {
    v353 = objc_loadWeakRetained(location);
    objc_msgSend(v353, "didFinishUpdateForScene:", v372);

  }
  else
  {
    -[SKScene didFinishUpdate](v372, "didFinishUpdate");
  }
  v354 = CACurrentMediaTime();
  _perfEndClientUpdate(v354);
  v355 = v372;
  if (v372->_audioEngine)
  {
    v356 = objc_loadWeakRetained((id *)&v372->_listener);
    v357 = v356;
    if (v356)
    {
      objc_msgSend(v356, "convertPoint:toNode:", v372, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    }
    else
    {
      -[SKScene frame](v372, "frame");
      MidX = CGRectGetMidX(v409);
      -[SKScene frame](v372, "frame");
      objc_msgSend(0, "convertPoint:toNode:", v372, MidX, CGRectGetMidY(v410));
    }
    v361 = v358;
    v362 = v359;
    -[SKScene avAudioEnvironmentNode](v372, "avAudioEnvironmentNode");
    v363 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v364 = v362;
    *(float *)&v365 = v361;
    LODWORD(v366) = 0;
    objc_msgSend(v363, "setListenerPosition:", v365, v364, v366);

    v355 = v372;
  }
  *(double *)((char *)&v355->super.super.super.super.isa + v367) = a3;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  if (-[SKNode isPaused](self, "isPaused") != a3)
  {
    v5 = skCurrentTime();
    v6 = 160;
    if (!v3)
    {
      v6 = 152;
      v5 = v5 - self->_pausedTime + self->_lastUpdate;
    }
    *(double *)((char *)&self->super.super.super.super.isa + v6) = v5;
  }
  v7.receiver = self;
  v7.super_class = (Class)SKScene;
  -[SKNode setPaused:](&v7, sel_setPaused_, v3);
  -[SKScene checkAudioEngine](self, "checkAudioEngine");
}

- (SKView)view
{
  return (SKView *)objc_loadWeakRetained(&self->_view);
}

+ (id)debugHierarchyPropertyDescriptions
{
  const CFDictionaryKeyCallBacks *v2;
  const CFDictionaryValueCallBacks *v3;
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  __CFDictionary *v8;
  __CFDictionary *v9;
  __CFDictionary *v10;
  __CFDictionary *v11;
  __CFDictionary *v12;
  CFNumberRef v13;
  CFNumberRef v14;
  void *v15;
  uint64_t valuePtr;
  _QWORD v18[10];

  v18[9] = *MEMORY[0x1E0C80C00];
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9AEB8];
  v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("audioEngine"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v18[0] = Mutable;
  v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("backgroundColor"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("color"));
  v18[1] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("camera"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v18[2] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("delegate"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v18[3] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("listener"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v18[4] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("physicsWorld"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v18[5] = v9;
  v10 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("size"));
  CFDictionaryAddValue(v10, CFSTR("propertyRuntimeType"), CFSTR("CGSize"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeSize"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v18[6] = v10;
  v11 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("scaleMode"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("SKSceneScaleMode"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("integer"));
  v18[7] = v11;
  v12 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v12, CFSTR("propertyName"), CFSTR("visualRepresentation"));
  CFDictionaryAddValue(v12, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(v12, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(v12, CFSTR("propertyFormat"), CFSTR("color"));
  valuePtr = 8;
  v13 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v12, CFSTR("visibility"), v13);
  CFRelease(v13);
  valuePtr = 1;
  v14 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v12, CFSTR("propertyOptions"), v14);
  CFRelease(v14);
  v18[8] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  CGColorSpaceRef v8;
  CGColor *v9;
  __CFDictionary *Mutable;
  CFStringRef v11;
  size_t NumberOfComponents;
  uint64_t v13;
  CFIndex v14;
  __CFString *v15;
  CFIndex v16;
  uint64_t v17;
  void *v18;
  id v19;
  CGColor *v20;
  __CFDictionary *v21;
  size_t v22;
  uint64_t v23;
  CFIndex v24;
  __CFString *v25;
  CFIndex v26;
  uint64_t v27;
  id v28;
  NSString *v29;
  NSString *v30;
  const CGFloat *Components;
  const void **v32;
  const void **v33;
  uint64_t v34;
  CFNumberRef *v35;
  CFArrayRef v36;
  uint64_t v37;
  CFTypeRef *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSString *v43;
  id v44;
  __CFString *v45;
  __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  void *v49;
  void *v50;
  id v51;
  const CGFloat *v52;
  const void **v53;
  const void **v54;
  uint64_t v55;
  CFNumberRef *v56;
  CFArrayRef v57;
  uint64_t v58;
  CFTypeRef *v59;
  CGColorSpaceRef v61;
  CGColorSpace *ColorSpace;
  CGColorSpace *space;
  CFStringRef spacea;
  id v65;
  id v66;
  _QWORD v67[3];
  _QWORD v68[4];

  v68[3] = *MEMORY[0x1E0C80C00];
  v65 = a3;
  v66 = a4;
  if (objc_msgSend(v65, "isEqualToString:", CFSTR("backgroundColor")))
  {
    objc_msgSend(v66, "backgroundColor");
    v8 = (CGColorSpaceRef)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (CGColor *)-[CGColorSpace CGColor](v8, "CGColor");
    if (v9)
    {
      Mutable = CFDictionaryCreateMutable(0, 20, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
      space = CGColorGetColorSpace(v9);
      v11 = CGColorSpaceCopyName(space);
      NumberOfComponents = CGColorGetNumberOfComponents(v9);
      v13 = NumberOfComponents << 32;
      v14 = (int)NumberOfComponents;
      if (NumberOfComponents << 32)
      {
        v15 = CFStringCreateMutable(0, 0);
        v61 = v8;
        v16 = v14 - 1;
        if ((unint64_t)v14 <= 1)
          v17 = 1;
        else
          v17 = v14;
        do
        {
          CFStringAppend(v15, CFSTR("CGf"));
          if (v16)
            CFStringAppend(v15, CFSTR(", "));
          --v16;
          --v17;
        }
        while (v17);
        v8 = v61;
      }
      else
      {
        v15 = &stru_1EA5021F8;
      }
      Components = CGColorGetComponents(v9);
      v32 = (const void **)malloc_type_malloc(v13 >> 29, 0x6004044C4A2DFuLL);
      v33 = v32;
      if (v13 >= 1)
      {
        if (v14 <= 1)
          v34 = 1;
        else
          v34 = v14;
        v35 = (CFNumberRef *)v32;
        do
        {
          *v35++ = CFNumberCreate(0, kCFNumberCGFloatType, Components++);
          --v34;
        }
        while (v34);
      }
      v36 = CFArrayCreate(0, v33, v14, MEMORY[0x1E0C9B378]);
      if (v13 >= 1)
      {
        if (v14 <= 1)
          v37 = 1;
        else
          v37 = v14;
        v38 = v33;
        do
        {
          CFRelease(*v38++);
          --v37;
        }
        while (v37);
      }
      free(v33);
      CGColorSpaceGetModel(space);
      if (v36)
        CFDictionaryAddValue(Mutable, CFSTR("componentValues"), v36);
      if (v15)
        CFDictionaryAddValue(Mutable, CFSTR("componentValuesFormat"), v15);
      if (v11)
        CFDictionaryAddValue(Mutable, CFSTR("colorSpaceName"), v11);
      if (v36)
        CFRelease(v36);
      if (v11)
        CFRelease(v11);
      if (v15)
        CFRelease(v15);
    }
    else
    {
      Mutable = 0;
    }

    v21 = Mutable;
    goto LABEL_99;
  }
  if (!objc_msgSend(v65, "isEqualToString:", CFSTR("visualRepresentation")))
  {
    v28 = v66;
    v29 = (NSString *)v65;
    if (-[NSString length](v29, "length"))
    {
      NSSelectorFromString(v29);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v30 = v29;
        if (v30)
        {
LABEL_25:
          objc_msgSend(v28, "valueForKey:", v30);
          v21 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
LABEL_71:

          goto LABEL_99;
        }
      }
      else
      {
        if (-[NSString length](v29, "length") < 2)
        {
          -[NSString uppercaseString](v29, "uppercaseString");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[NSString substringToIndex:](v29, "substringToIndex:", 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "uppercaseString");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString substringFromIndex:](v29, "substringFromIndex:", 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringByAppendingString:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(CFSTR("is"), "stringByAppendingString:", v42);
        v43 = (NSString *)objc_claimAutoreleasedReturnValue();
        NSSelectorFromString(v43);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v30 = v43;
        else
          v30 = 0;

        if (v30)
          goto LABEL_25;
      }
    }
    if (a6)
    {
      v44 = v28;
      v45 = v29;
      if (v44)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v44);
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v46 = &stru_1EA5021F8;
      }
      if (v45)
        v47 = v45;
      else
        v47 = &stru_1EA5021F8;
      v48 = v47;
      v67[0] = CFSTR("propertyName");
      v67[1] = CFSTR("objectDescription");
      v68[0] = v48;
      v68[1] = v46;
      v67[2] = CFSTR("errorDescription");
      v68[2] = &stru_1EA5021F8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 3);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = objc_retainAutorelease(v50);
      *a6 = v51;

    }
    v30 = 0;
    v21 = 0;
    goto LABEL_71;
  }
  objc_msgSend(v66, "createDebugHierarchyVisualRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v66, "createDebugHierarchyVisualRepresentation");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (CGColor *)objc_msgSend(v19, "CGColor");
    if (v20)
    {
      v21 = CFDictionaryCreateMutable(0, 20, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
      ColorSpace = CGColorGetColorSpace(v20);
      spacea = CGColorSpaceCopyName(ColorSpace);
      v22 = CGColorGetNumberOfComponents(v20);
      v23 = v22 << 32;
      v24 = (int)v22;
      if (v22 << 32)
      {
        v25 = CFStringCreateMutable(0, 0);
        v26 = v24 - 1;
        if ((unint64_t)v24 <= 1)
          v27 = 1;
        else
          v27 = v24;
        do
        {
          CFStringAppend(v25, CFSTR("CGf"));
          if (v26)
            CFStringAppend(v25, CFSTR(", "));
          --v26;
          --v27;
        }
        while (v27);
      }
      else
      {
        v25 = &stru_1EA5021F8;
      }
      v52 = CGColorGetComponents(v20);
      v53 = (const void **)malloc_type_malloc(v23 >> 29, 0x6004044C4A2DFuLL);
      v54 = v53;
      if (v23 >= 1)
      {
        if (v24 <= 1)
          v55 = 1;
        else
          v55 = v24;
        v56 = (CFNumberRef *)v53;
        do
        {
          *v56++ = CFNumberCreate(0, kCFNumberCGFloatType, v52++);
          --v55;
        }
        while (v55);
      }
      v57 = CFArrayCreate(0, v54, v24, MEMORY[0x1E0C9B378]);
      if (v23 >= 1)
      {
        if (v24 <= 1)
          v58 = 1;
        else
          v58 = v24;
        v59 = v54;
        do
        {
          CFRelease(*v59++);
          --v58;
        }
        while (v58);
      }
      free(v54);
      CGColorSpaceGetModel(ColorSpace);
      if (v57)
        CFDictionaryAddValue(v21, CFSTR("componentValues"), v57);
      if (v25)
        CFDictionaryAddValue(v21, CFSTR("componentValuesFormat"), v25);
      if (spacea)
        CFDictionaryAddValue(v21, CFSTR("colorSpaceName"), spacea);
      if (v57)
        CFRelease(v57);
      if (spacea)
        CFRelease(spacea);
      if (v25)
        CFRelease(v25);
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

LABEL_99:
  return v21;
}

- (SKCameraNode)camera
{
  return (SKCameraNode *)objc_loadWeakRetained((id *)&self->_camera);
}

- (void)setCamera:(SKCameraNode *)camera
{
  objc_storeWeak((id *)&self->_camera, camera);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (BOOL)_needsUpdate
{
  return self->__needsUpdate;
}

- (void)set_needsUpdate:(BOOL)a3
{
  self->__needsUpdate = a3;
}

- (BOOL)_needsRender
{
  return self->__needsRender;
}

- (void)set_needsRender:(BOOL)a3
{
  self->__needsRender = a3;
}

- (AVAudioEnvironmentNode)avAudioEnvironmentNode
{
  return self->_avAudioEnvironmentNode;
}

- (void)setAvAudioEnvironmentNode:(id)a3
{
  objc_storeStrong((id *)&self->_avAudioEnvironmentNode, a3);
}

- (PKPhysicsWorld)_pkPhysicsWorld
{
  return self->__pkPhysicsWorld;
}

- (void)set_pkPhysicsWorld:(id)a3
{
  objc_storeStrong((id *)&self->__pkPhysicsWorld, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pkPhysicsWorld, 0);
  objc_storeStrong((id *)&self->_avAudioEnvironmentNode, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_camera);
  objc_storeStrong((id *)&self->_physicsWorld, 0);
  objc_storeStrong((id *)&self->_audioEngine, 0);
  objc_destroyWeak((id *)&self->_listener);
  objc_destroyWeak(&self->_view);
  objc_storeStrong((id *)&self->_scenePinBody, 0);
  objc_storeStrong((id *)&self->_allChildenWithConstraints, 0);
  objc_storeStrong((id *)&self->_touchMap, 0);
}

- (void)_willMoveFromView:(id)a3
{
  id v4;

  v4 = a3;
  -[SKScene willMoveFromView:](self, "willMoveFromView:");
  objc_storeWeak(&self->_view, 0);
  -[SKScene checkAudioEngine](self, "checkAudioEngine");

}

- (void)set_usesExplicitUpdate:(BOOL)a3
{
  self->_usesExplicitUpdate = a3;
}

- (BOOL)_usesExplicitUpdate
{
  return self->_usesExplicitUpdate;
}

- (void)set_usesExplicitRender:(BOOL)a3
{
  self->_usesExplicitRender = a3;
}

- (BOOL)_usesExplicitRender
{
  return self->_usesExplicitRender;
}

- (void)_setNeedsUpdate
{
  -[SKScene set_needsUpdate:](self, "set_needsUpdate:", 1);
}

- (void)_setNeedsRender
{
  -[SKScene set_needsRender:](self, "set_needsRender:", 1);
}

- (BOOL)_isDirty
{
  return SKCNode::matchesAnyFlags((SKCNode *)self->super.super._skcNode, -1, -1);
}

- (void)_setDirty
{
  SKCNode::setDirty((SKCNode *)self->_skcSceneNode);
}

- (void)_notifyNextDirtyState
{
  *((_BYTE *)self->_skcSceneNode + 736) = 1;
}

- (void)_setBackgroundContentsWithBuffer:(__CVBuffer *)a3
{
  SKCSceneNode::setBackgroundFromPixelBuffer((SKCSceneNode *)self->_skcSceneNode, a3);
}

- (void)_update:
{
}

- (_QWORD)_update:
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1EA4FF810;
  return result;
}

- (uint64_t)_update:
{
    return a1 + 8;
  else
    return 0;
}

@end
