@implementation ETHeartbeatMessage

+ (unsigned)messageType
{
  return 2;
}

- (ETHeartbeatMessage)initWithArchiveData:(id)a3
{
  id v4;
  ETHeartbeatMessage *v5;
  ETPHeartbeat *v6;
  ETHeartbeatMessage *v7;
  float v8;
  CGFloat v9;
  float v10;
  float v11;
  float v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ETHeartbeatMessage;
  v5 = -[ETMessage initWithArchiveData:](&v14, sel_initWithArchiveData_, v4);
  if (!v5)
  {
LABEL_11:
    v7 = v5;
    goto LABEL_12;
  }
  v6 = -[ETPHeartbeat initWithData:]([ETPHeartbeat alloc], "initWithData:", v4);
  v7 = (ETHeartbeatMessage *)v6;
  if (v6)
  {
    -[ETPHeartbeat beatsPerMinute](v6, "beatsPerMinute");
    -[ETHeartbeatMessage setBeatsPerMinute:](v5, "setBeatsPerMinute:");
    -[ETHeartbeatMessage setDuration:](v5, "setDuration:", -[ETHeartbeatMessage duration](v7, "duration"));
    if (-[ETHeartbeatMessage hasNormalizedCenterX](v7, "hasNormalizedCenterX")
      && -[ETHeartbeatMessage hasNormalizedCenterY](v7, "hasNormalizedCenterY"))
    {
      -[ETHeartbeatMessage normalizedCenterX](v7, "normalizedCenterX");
      v9 = v8;
      -[ETHeartbeatMessage normalizedCenterY](v7, "normalizedCenterY");
      v5->_normalizedCenter.x = v9;
      v5->_normalizedCenter.y = v10;
    }
    if (-[ETHeartbeatMessage hasRotation](v7, "hasRotation"))
    {
      -[ETHeartbeatMessage rotation](v7, "rotation");
      v5->_rotation = v11;
    }
    if (-[ETHeartbeatMessage hasHeartbreakTime](v7, "hasHeartbreakTime"))
    {
      -[ETHeartbeatMessage heartbreakTime](v7, "heartbreakTime");
      v5->_heartbreakTime = v12;
    }

    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

- (id)archiveData
{
  ETPHeartbeat *v3;
  double v4;
  CGFloat x;
  CGFloat y;
  double rotation;
  double heartbreakTime;
  void *v9;

  v3 = objc_alloc_init(ETPHeartbeat);
  *(float *)&v4 = self->_beatsPerMinute;
  -[ETPHeartbeat setBeatsPerMinute:](v3, "setBeatsPerMinute:", v4);
  -[ETPHeartbeat setDuration:](v3, "setDuration:", self->_duration);
  x = self->_normalizedCenter.x;
  *(float *)&x = x;
  -[ETPHeartbeat setNormalizedCenterX:](v3, "setNormalizedCenterX:", x);
  y = self->_normalizedCenter.y;
  *(float *)&y = y;
  -[ETPHeartbeat setNormalizedCenterY:](v3, "setNormalizedCenterY:", y);
  rotation = self->_rotation;
  *(float *)&rotation = rotation;
  -[ETPHeartbeat setRotation:](v3, "setRotation:", rotation);
  heartbreakTime = self->_heartbreakTime;
  *(float *)&heartbreakTime = heartbreakTime;
  -[ETPHeartbeat setHeartbreakTime:](v3, "setHeartbreakTime:", heartbreakTime);
  -[ETPHeartbeat data](v3, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)displayInScene:(id)a3
{
  id v4;
  id v5;
  id location;

  v4 = a3;
  v5 = objc_initWeak(&location, v4);
  -[ETHeartbeatMessage _displayInScene:useDuration:](self, "_displayInScene:useDuration:", v4, 1);

  objc_destroyWeak(&location);
}

- (void)_displayInScene:(id)a3 useDuration:(BOOL)a4
{
  -[ETHeartbeatMessage _displayInScene:useDuration:fastStart:](self, "_displayInScene:useDuration:fastStart:", a3, a4, 0);
}

- (void)_displayInScene:(id)a3 useDuration:(BOOL)a4 fastStart:(BOOL)a5
{
  _BOOL4 v5;
  float v7;
  float v8;
  double v9;
  float v10;
  float v11;
  float v12;
  SKNode *v13;
  SKNode *heartNode;
  SKNode *v15;
  double v16;
  double v17;
  double v18;
  float v19;
  float v20;
  id v21;
  void *v22;
  void *v23;
  SKShader *v24;
  SKShader *linesShader;
  SKUniform *v26;
  SKUniform *burTexUniform;
  SKUniform *v28;
  SKUniform *noiseTexUniform;
  id SKUniformClass;
  double v31;
  SKUniform *v32;
  SKUniform *speedUniform;
  id v34;
  double v35;
  SKUniform *v36;
  SKUniform *scaleUniform;
  id v38;
  double v39;
  SKUniform *v40;
  SKUniform *shaderTimeUniform;
  SKUniform *v42;
  SKUniform *v43;
  void *v44;
  SKSpriteNode *v45;
  SKSpriteNode *heartLines;
  void *v47;
  SKNode *v48;
  SKNode *heartScale;
  SKTexture *v50;
  SKTexture *heartbreakAtlas;
  SKUniform *v52;
  SKUniform *warpedTexAtlasUniform;
  SKShader *v54;
  SKShader *heartShader;
  SKUniform *v56;
  SKUniform *v57;
  void *v58;
  SKSpriteNode *v59;
  SKSpriteNode *heart;
  void *v61;
  SKNode *v62;
  id SKActionClass_0;
  double v64;
  void *v65;
  SKSpriteNode *v66;
  id v67;
  id v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  NSObject *v75;
  id v76;
  void *v77;
  id v78;
  id *v79;
  uint64_t v80;
  id v81;
  void *v82;
  void *v83;
  uint64_t v84;
  id v85;
  id v86;
  uint64_t v87;
  id v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  SKNode *v115;
  id v116;
  void *v117;
  SKNode *v118;
  _BOOL4 v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  _QWORD v125[5];
  _QWORD v126[5];
  float v127;
  _QWORD v128[5];
  _QWORD v129[4];
  id v130;
  _QWORD v131[4];
  id v132;
  uint8_t buf[8];
  uint8_t *v134;
  uint64_t v135;
  void *v136;
  _QWORD v137[2];
  _QWORD v138[3];
  _QWORD v139[3];
  _QWORD v140[2];
  _QWORD v141[2];
  _QWORD v142[2];
  _QWORD v143[4];
  _QWORD v144[7];

  v5 = a5;
  v119 = a4;
  v144[5] = *MEMORY[0x24BDAC8D0];
  v124 = a3;
  -[ETHeartbeatMessage beatsPerMinute](self, "beatsPerMinute");
  v8 = v7;
  v9 = 60.0 / v7;
  v10 = v9 * 0.800000012;
  v11 = fminf(v10, 0.75);
  *(float *)&v9 = v9 - v11;
  v12 = fmaxf(*(float *)&v9, 0.01);
  self->_hapticLoopPeriod = v11 + v12;
  self->_broken = 0;
  objc_msgSend(getSKNodeClass(), "node");
  v13 = (SKNode *)objc_claimAutoreleasedReturnValue();
  heartNode = self->_heartNode;
  self->_heartNode = v13;

  v15 = self->_heartNode;
  -[ETMessage scenePointFromNormalizedPoint:inScene:](self, "scenePointFromNormalizedPoint:inScene:", v124, self->_normalizedCenter.x, self->_normalizedCenter.y);
  -[SKNode setPosition:](v15, "setPosition:");
  -[SKNode setZRotation:](self->_heartNode, "setZRotation:", self->_rotation);
  objc_msgSend(v124, "size");
  v17 = fmax(v16 / 156.0, 1.0);
  -[ETHeartbeatMessage scale](self, "scale");
  v18 = 0.5;
  if (v19 > 0.0)
  {
    -[ETHeartbeatMessage scale](self, "scale");
    v18 = v20;
  }
  -[SKNode setScale:](self->_heartNode, "setScale:", v17 * v18);
  ETFrameworkBundle();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v134 = buf;
  v135 = 0x2020000000;
  v22 = getSKSetResourceBundleSymbolLoc_ptr_0;
  v136 = getSKSetResourceBundleSymbolLoc_ptr_0;
  if (!getSKSetResourceBundleSymbolLoc_ptr_0)
  {
    v23 = (void *)SpriteKitLibrary_0();
    v22 = dlsym(v23, "SKSetResourceBundle");
    *((_QWORD *)v134 + 3) = v22;
    getSKSetResourceBundleSymbolLoc_ptr_0 = v22;
  }
  _Block_object_dispose(buf, 8);
  if (!v22)
    -[ETMessage displayInScene:].cold.1();
  ((void (*)(id))v22)(v21);

  objc_msgSend(getSKTextureClass(), "textureWithImageNamed:", CFSTR("blends_heartToRndRect65"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getSKTextureClass(), "textureNoiseWithSmoothness:size:grayscale:", 1, 0.6, 268.0, 253.0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getSKShaderClass(), "shaderWithFileNamed:", CFSTR("heartLines"));
  v24 = (SKShader *)objc_claimAutoreleasedReturnValue();
  linesShader = self->_linesShader;
  self->_linesShader = v24;

  objc_msgSend(getSKUniformClass(), "uniformWithName:texture:", CFSTR("u_tex2"), v123);
  v26 = (SKUniform *)objc_claimAutoreleasedReturnValue();
  burTexUniform = self->_burTexUniform;
  self->_burTexUniform = v26;

  objc_msgSend(getSKUniformClass(), "uniformWithName:texture:", CFSTR("u_tex3"), v122);
  v28 = (SKUniform *)objc_claimAutoreleasedReturnValue();
  noiseTexUniform = self->_noiseTexUniform;
  self->_noiseTexUniform = v28;

  SKUniformClass = getSKUniformClass();
  *(float *)&v31 = v8 / 60.0;
  objc_msgSend(SKUniformClass, "uniformWithName:float:", CFSTR("u_speed"), v31);
  v32 = (SKUniform *)objc_claimAutoreleasedReturnValue();
  speedUniform = self->_speedUniform;
  self->_speedUniform = v32;

  v34 = getSKUniformClass();
  LODWORD(v35) = 0;
  objc_msgSend(v34, "uniformWithName:float:", CFSTR("u_scale"), v35);
  v36 = (SKUniform *)objc_claimAutoreleasedReturnValue();
  scaleUniform = self->_scaleUniform;
  self->_scaleUniform = v36;

  v38 = getSKUniformClass();
  LODWORD(v39) = 0;
  objc_msgSend(v38, "uniformWithName:float:", CFSTR("u_shader_time"), v39);
  v40 = (SKUniform *)objc_claimAutoreleasedReturnValue();
  shaderTimeUniform = self->_shaderTimeUniform;
  self->_shaderTimeUniform = v40;

  v42 = self->_noiseTexUniform;
  v144[0] = self->_burTexUniform;
  v144[1] = v42;
  v43 = self->_scaleUniform;
  v144[2] = self->_speedUniform;
  v144[3] = v43;
  v144[4] = self->_shaderTimeUniform;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v144, 5);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKShader setUniforms:](self->_linesShader, "setUniforms:", v44);

  objc_msgSend(getSKSpriteNodeClass(), "spriteNodeWithImageNamed:", CFSTR("compositeHeart"));
  v45 = (SKSpriteNode *)objc_claimAutoreleasedReturnValue();
  heartLines = self->_heartLines;
  self->_heartLines = v45;

  -[SKSpriteNode setShader:](self->_heartLines, "setShader:", self->_linesShader);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.9046, 0.0, 0.0742, 1.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKSpriteNode setColor:](self->_heartLines, "setColor:", v47);

  -[SKSpriteNode setColorBlendFactor:](self->_heartLines, "setColorBlendFactor:", 1.0);
  -[SKSpriteNode setBlendMode:](self->_heartLines, "setBlendMode:", 5);
  -[SKSpriteNode setScale:](self->_heartLines, "setScale:", 0.8);
  objc_msgSend(getSKNodeClass(), "node");
  v48 = (SKNode *)objc_claimAutoreleasedReturnValue();
  heartScale = self->_heartScale;
  self->_heartScale = v48;

  objc_msgSend(getSKTextureClass(), "textureWithImageNamed:", CFSTR("HeartbreakAtlas"));
  v50 = (SKTexture *)objc_claimAutoreleasedReturnValue();
  heartbreakAtlas = self->_heartbreakAtlas;
  self->_heartbreakAtlas = v50;

  objc_msgSend(getSKTextureClass(), "textureWithImageNamed:", CFSTR("warpedHeartAtlas"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getSKUniformClass(), "uniformWithName:texture:", CFSTR("u_tex2"), v121);
  v52 = (SKUniform *)objc_claimAutoreleasedReturnValue();
  warpedTexAtlasUniform = self->_warpedTexAtlasUniform;
  self->_warpedTexAtlasUniform = v52;

  objc_msgSend(getSKShaderClass(), "shaderWithFileNamed:", CFSTR("heart"));
  v54 = (SKShader *)objc_claimAutoreleasedReturnValue();
  heartShader = self->_heartShader;
  self->_heartShader = v54;

  v56 = self->_speedUniform;
  v143[0] = self->_warpedTexAtlasUniform;
  v143[1] = v56;
  v57 = self->_shaderTimeUniform;
  v143[2] = self->_scaleUniform;
  v143[3] = v57;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v143, 4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKShader setUniforms:](self->_heartShader, "setUniforms:", v58);

  objc_msgSend(getSKSpriteNodeClass(), "spriteNodeWithImageNamed:", CFSTR("heartAndBlur"));
  v59 = (SKSpriteNode *)objc_claimAutoreleasedReturnValue();
  heart = self->_heart;
  self->_heart = v59;

  -[SKSpriteNode setShader:](self->_heart, "setShader:", self->_heartShader);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.18, 0.3, 1.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKSpriteNode setColor:](self->_heart, "setColor:", v61);

  -[SKSpriteNode setColorBlendFactor:](self->_heart, "setColorBlendFactor:", 1.0);
  -[SKSpriteNode setBlendMode:](self->_heart, "setBlendMode:", 5);
  -[SKSpriteNode setScale:](self->_heart, "setScale:", 0.75);
  -[SKNode addChild:](self->_heartScale, "addChild:", self->_heartLines);
  -[SKNode addChild:](self->_heartScale, "addChild:", self->_heart);
  -[SKNode addChild:](self->_heartNode, "addChild:", self->_heartScale);
  objc_msgSend(v124, "addChild:", self->_heartNode);
  -[SKNode setAlpha:](self->_heartNode, "setAlpha:", 0.0);
  -[SKSpriteNode setAlpha:](self->_heartLines, "setAlpha:", 0.0);
  v62 = self->_heartNode;
  SKActionClass_0 = getSKActionClass_0();
  if (v5)
    v64 = 0.0;
  else
    v64 = 0.5;
  objc_msgSend(SKActionClass_0, "fadeInWithDuration:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode runAction:withKey:](v62, "runAction:withKey:", v65, CFSTR("fade"));

  v66 = self->_heartLines;
  v67 = getSKActionClass_0();
  v68 = getSKActionClass_0();
  v69 = 0.0;
  if (!v5)
    v69 = 0.3;
  objc_msgSend(v68, "waitForDuration:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v142[0] = v70;
  objc_msgSend(getSKActionClass_0(), "fadeInWithDuration:", v64);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v142[1] = v71;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v142, 2);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "sequence:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKSpriteNode runAction:withKey:](v66, "runAction:withKey:", v73, CFSTR("fade"));

  if (v119 && !-[ETMessage isRenderingOffscreen](self, "isRenderingOffscreen"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C68B000, v75, OS_LOG_TYPE_INFO, "Using duration", buf, 2u);
      }

    }
    objc_initWeak((id *)buf, self);
    if (self->_heartbreakTime == 0.0)
    {
      v85 = getSKActionClass_0();
      objc_msgSend(getSKActionClass_0(), "waitForDuration:", (float)((float)self->_duration + 0.5));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v140[0] = v77;
      v86 = getSKActionClass_0();
      v129[0] = MEMORY[0x24BDAC760];
      v129[1] = 3221225472;
      v129[2] = __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke_2;
      v129[3] = &unk_24F6E70C0;
      v79 = &v130;
      objc_copyWeak(&v130, (id *)buf);
      v87 = MEMORY[0x24BDAC9B8];
      v88 = MEMORY[0x24BDAC9B8];
      objc_msgSend(v86, "runBlock:queue:", v129, v87);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v140[1] = v82;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v140, 2);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "sequence:", v83);
      v84 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v76 = getSKActionClass_0();
      objc_msgSend(getSKActionClass_0(), "waitForDuration:", self->_heartbreakTime);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v141[0] = v77;
      v78 = getSKActionClass_0();
      v131[0] = MEMORY[0x24BDAC760];
      v131[1] = 3221225472;
      v131[2] = __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke;
      v131[3] = &unk_24F6E70C0;
      v79 = &v132;
      objc_copyWeak(&v132, (id *)buf);
      v80 = MEMORY[0x24BDAC9B8];
      v81 = MEMORY[0x24BDAC9B8];
      objc_msgSend(v78, "runBlock:queue:", v131, v80);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v141[1] = v82;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v141, 2);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "sequence:", v83);
      v84 = objc_claimAutoreleasedReturnValue();
    }
    v89 = (void *)v84;

    objc_destroyWeak(v79);
    -[SKNode runAction:](self->_heartNode, "runAction:", v89);

    objc_destroyWeak((id *)buf);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C68B000, v74, OS_LOG_TYPE_INFO, "Not using duration", buf, 2u);
    }

  }
  v118 = self->_heartNode;
  v90 = getSKActionClass_0();
  objc_msgSend(getSKActionClass_0(), "waitForDuration:", v64);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v139[0] = v120;
  v91 = getSKActionClass_0();
  v128[0] = MEMORY[0x24BDAC760];
  v128[1] = 3221225472;
  v128[2] = __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke_29;
  v128[3] = &unk_24F6E6A98;
  v128[4] = self;
  objc_msgSend(v91, "runBlock:", v128);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v139[1] = v92;
  v93 = getSKActionClass_0();
  v94 = getSKActionClass_0();
  v95 = getSKActionClass_0();
  v126[0] = MEMORY[0x24BDAC760];
  v126[1] = 3221225472;
  v126[2] = __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke_2_30;
  v126[3] = &unk_24F6E70E8;
  v126[4] = self;
  v127 = v11;
  objc_msgSend(v95, "runBlock:", v126);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v138[0] = v96;
  objc_msgSend(getSKActionClass_0(), "waitForDuration:", v11);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v138[1] = v97;
  objc_msgSend(getSKActionClass_0(), "waitForDuration:", v12);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v138[2] = v98;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v138, 3);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "sequence:", v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "repeatActionForever:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v139[2] = v101;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v139, 3);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "sequence:", v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode runAction:](v118, "runAction:", v103);

  v104 = getSKActionClass_0();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.5, 1.0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "colorizeWithColor:colorBlendFactor:duration:", v105, 1.0, v11 * 0.5);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  v107 = getSKActionClass_0();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.9046, 0.0, 0.3, 1.0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "colorizeWithColor:colorBlendFactor:duration:", v108, 1.0, v11 * 0.5);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v106, "setTimingMode:", 3);
  objc_msgSend(v109, "setTimingMode:", 3);
  v110 = getSKActionClass_0();
  v111 = getSKActionClass_0();
  v137[0] = v106;
  v137[1] = v109;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v137, 2);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "sequence:", v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "repeatActionForever:", v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKSpriteNode runAction:](self->_heart, "runAction:", v114);
  -[SKSpriteNode runAction:](self->_heartLines, "runAction:", v114);
  v115 = self->_heartNode;
  v116 = getSKActionClass_0();
  v125[0] = MEMORY[0x24BDAC760];
  v125[1] = 3221225472;
  v125[2] = __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke_3;
  v125[3] = &unk_24F6E7110;
  v125[4] = self;
  objc_msgSend(v116, "customActionWithDuration:actionBlock:", v125, (float)((float)((float)10 + 0.5) + 0.6));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode runAction:](v115, "runAction:", v117);

}

void __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "breakHeart");

}

void __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stopPlaying");

}

uint64_t __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke_29(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startAudioPlayback");
}

uint64_t __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke_2_30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "playBeatWithDuration:", *(float *)(a1 + 40));
}

uint64_t __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke_3(uint64_t a1)
{
  void *v1;
  float v2;
  double v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  objc_msgSend(v1, "floatValue");
  *(float *)&v3 = v2 + 0.016667;
  return objc_msgSend(v1, "setFloatValue:", v3);
}

- (void)moveHeartNodeByX:(double)a3 y:(double)a4 duration:(double)a5
{
  SKNode *heartNode;
  id v6;

  heartNode = self->_heartNode;
  objc_msgSend(getSKActionClass_0(), "moveByX:y:duration:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SKNode runAction:](heartNode, "runAction:", v6);

}

- (void)playBeatWithDuration:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id SKActionClass_0;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[6];
  int v19;
  _QWORD v20[6];
  int v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(getSKActionClass_0(), "scaleTo:duration:", 1.65, a3 * 0.25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getSKActionClass_0(), "scaleTo:duration:", 1.0, a3 * 0.600000024);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getSKActionClass_0(), "waitForDuration:", a3 * 0.150000006);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingMode:", 3);
  objc_msgSend(v6, "setTimingMode:", 3);
  SKActionClass_0 = getSKActionClass_0();
  v23[0] = v5;
  v23[1] = v7;
  v23[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(SKActionClass_0, "sequence:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKNode runAction:](self->_heartScale, "runAction:", v10);
  v11 = getSKActionClass_0();
  v12 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __43__ETHeartbeatMessage_playBeatWithDuration___block_invoke;
  v20[3] = &unk_24F6E7138;
  v21 = 1048576000;
  *(double *)&v20[5] = a3;
  v20[4] = self;
  objc_msgSend(v11, "customActionWithDuration:actionBlock:", v20, a3 * 0.25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __43__ETHeartbeatMessage_playBeatWithDuration___block_invoke_2;
  v18[3] = &unk_24F6E7138;
  v19 = 1058642330;
  *(double *)&v18[5] = a3;
  v18[4] = self;
  objc_msgSend(getSKActionClass_0(), "customActionWithDuration:actionBlock:", v18, a3 * 0.600000024);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setTimingMode:", 2);
  objc_msgSend(v14, "setTimingMode:", 1);
  v15 = getSKActionClass_0();
  v22[0] = v13;
  v22[1] = v7;
  v22[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sequence:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKNode runAction:](self->_heartNode, "runAction:", v17);
}

uint64_t __43__ETHeartbeatMessage_playBeatWithDuration___block_invoke(uint64_t a1, double a2)
{
  double v2;

  v2 = a2 / (*(double *)(a1 + 40) * *(float *)(a1 + 48));
  *(float *)&v2 = v2;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setFloatValue:", v2);
}

uint64_t __43__ETHeartbeatMessage_playBeatWithDuration___block_invoke_2(uint64_t a1, double a2)
{
  double v2;

  v2 = 1.0 - a2 / (*(double *)(a1 + 40) * *(float *)(a1 + 48));
  *(float *)&v2 = v2;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setFloatValue:", v2);
}

- (void)startHeartbeat:(id)a3
{
  -[ETHeartbeatMessage startHeartbeat:fastStart:](self, "startHeartbeat:fastStart:", a3, 0);
}

- (void)startHeartbeat:(id)a3 fastStart:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id location;

  v4 = a4;
  v6 = a3;
  v7 = objc_initWeak(&location, v6);
  -[ETHeartbeatMessage _displayInScene:useDuration:fastStart:](self, "_displayInScene:useDuration:fastStart:", v6, 0, v4);

  objc_destroyWeak(&location);
}

- (void)stopPlaying
{
  SKSpriteNode *heartLines;
  void *v4;
  void *v5;
  SKNode *heartNode;
  id SKActionClass_0;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD block[4];
  id v15;
  ETHeartbeatMessage *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  heartLines = self->_heartLines;
  objc_msgSend(getSKActionClass_0(), "fadeOutWithDuration:", 0.480000019);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKSpriteNode runAction:withKey:](heartLines, "runAction:withKey:", v4, CFSTR("fade"));

  -[ETHeartbeatMessage _stopAudioPlayback](self, "_stopAudioPlayback");
  -[ETMessage delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageWillStopPlaying:", self);
  -[SKNode removeAllActions](self->_heartNode, "removeAllActions");
  heartNode = self->_heartNode;
  SKActionClass_0 = getSKActionClass_0();
  objc_msgSend(getSKActionClass_0(), "fadeOutWithDuration:", 0.600000024);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(getSKActionClass_0(), "removeFromParent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(SKActionClass_0, "sequence:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode runAction:withKey:](heartNode, "runAction:withKey:", v11, CFSTR("fade"));

  -[SKNode parent](self->_heartNode, "parent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = dispatch_time(0, 600000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__ETHeartbeatMessage_stopPlaying__block_invoke;
    block[3] = &unk_24F6E6B78;
    v15 = v5;
    v16 = self;
    dispatch_after(v13, MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_msgSend(v5, "messageDidStopPlaying:", self);
  }

}

uint64_t __33__ETHeartbeatMessage_stopPlaying__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "messageDidStopPlaying:", *(_QWORD *)(a1 + 40));
}

- (void)breakHeart
{
  double Current;
  double v4;
  double v5;
  double v6;
  SKSpriteNode *heartLines;
  void *v8;
  SKSpriteNode *heart;
  id SKActionClass_0;
  void *v11;
  void *v12;
  SKUniform *v13;
  SKNode *heartNode;
  id v15;
  uint64_t v16;
  SKUniform *v17;
  void *v18;
  SKNode *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  id location;
  _QWORD v34[4];
  SKUniform *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  if (!self->_broken)
  {
    self->_broken = 1;
    if (self->_heartbreakTime == 0.0)
    {
      Current = CFAbsoluteTimeGetCurrent();
      -[ETMessage timeCreated](self, "timeCreated");
      self->_heartbreakTime = Current - v4;
    }
    -[SKSpriteNode removeAllActions](self->_heart, "removeAllActions");
    -[SKNode removeAllActions](self->_heartNode, "removeAllActions");
    -[SKSpriteNode removeAllActions](self->_heartLines, "removeAllActions");
    -[SKNode removeAllActions](self->_heartScale, "removeAllActions");
    LODWORD(v5) = 1023969327;
    -[SKUniform setFloatValue:](self->_shaderTimeUniform, "setFloatValue:", v5);
    LODWORD(v6) = 1.0;
    -[SKUniform setFloatValue:](self->_scaleUniform, "setFloatValue:", v6);
    -[SKUniform setTextureValue:](self->_warpedTexAtlasUniform, "setTextureValue:", self->_heartbreakAtlas);
    heartLines = self->_heartLines;
    objc_msgSend(getSKActionClass_0(), "fadeOutWithDuration:", 0.2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSpriteNode runAction:](heartLines, "runAction:", v8);

    heart = self->_heart;
    SKActionClass_0 = getSKActionClass_0();
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.5, 0.0, 0.1, 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(SKActionClass_0, "colorizeWithColor:colorBlendFactor:duration:", v11, 1.0, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSpriteNode runAction:](heart, "runAction:", v12);

    v13 = self->_shaderTimeUniform;
    heartNode = self->_heartNode;
    v15 = getSKActionClass_0();
    v16 = MEMORY[0x24BDAC760];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __32__ETHeartbeatMessage_breakHeart__block_invoke;
    v34[3] = &unk_24F6E7110;
    v17 = v13;
    v35 = v17;
    objc_msgSend(v15, "customActionWithDuration:actionBlock:", v34, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKNode runAction:](heartNode, "runAction:", v18);

    objc_initWeak(&location, self);
    v19 = self->_heartNode;
    v20 = getSKActionClass_0();
    objc_msgSend(getSKActionClass_0(), "waitForDuration:", 1.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v21;
    v22 = getSKActionClass_0();
    v28 = v16;
    v29 = 3221225472;
    v30 = __32__ETHeartbeatMessage_breakHeart__block_invoke_2;
    v31 = &unk_24F6E70C0;
    objc_copyWeak(&v32, &location);
    v23 = MEMORY[0x24BDAC9B8];
    v24 = MEMORY[0x24BDAC9B8];
    objc_msgSend(v22, "runBlock:queue:", &v28, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2, v28, v29, v30, v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sequence:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKNode runAction:](v19, "runAction:", v27);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

  }
}

uint64_t __32__ETHeartbeatMessage_breakHeart__block_invoke(uint64_t a1, double a2)
{
  double v2;

  v2 = fmax(a2, 0.033333);
  *(float *)&v2 = v2;
  return objc_msgSend(*(id *)(a1 + 32), "setFloatValue:", v2);
}

void __32__ETHeartbeatMessage_breakHeart__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stopPlaying");

}

- (id)messageTypeAsString
{
  return CFSTR("Heartbeat");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p bpm:%3.0f duration:%d>"), v5, self, self->_beatsPerMinute, self->_duration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setMute:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ETHeartbeatMessage;
  -[ETMessage setMute:](&v5, sel_setMute_);
  if (v3)
    -[ETHeartbeatMessage _stopAudioPlayback](self, "_stopAudioPlayback");
  else
    -[ETHeartbeatMessage _startAudioPlayback](self, "_startAudioPlayback");
}

- (double)messageDuration
{
  return (float)((float)((float)self->_duration + 0.5) + 0.6);
}

- (float)beatsPerMinute
{
  return self->_beatsPerMinute;
}

- (void)setBeatsPerMinute:(float)a3
{
  self->_beatsPerMinute = a3;
}

- (int)duration
{
  return self->_duration;
}

- (void)setDuration:(int)a3
{
  self->_duration = a3;
}

- (float)scale
{
  return self->_scale;
}

- (void)setScale:(float)a3
{
  self->_scale = a3;
}

- (CGPoint)normalizedCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_normalizedCenter.x;
  y = self->_normalizedCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setNormalizedCenter:(CGPoint)a3
{
  self->_normalizedCenter = a3;
}

- (double)rotation
{
  return self->_rotation;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
}

- (BOOL)isBroken
{
  return self->_broken;
}

- (double)heartbreakTime
{
  return self->_heartbreakTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbreakAtlas, 0);
  objc_storeStrong((id *)&self->_heartScale, 0);
  objc_storeStrong((id *)&self->_shaderTimeUniform, 0);
  objc_storeStrong((id *)&self->_scaleUniform, 0);
  objc_storeStrong((id *)&self->_noiseTexUniform, 0);
  objc_storeStrong((id *)&self->_burTexUniform, 0);
  objc_storeStrong((id *)&self->_warpedTexAtlasUniform, 0);
  objc_storeStrong((id *)&self->_speedUniform, 0);
  objc_storeStrong((id *)&self->_heartShader, 0);
  objc_storeStrong((id *)&self->_linesShader, 0);
  objc_storeStrong((id *)&self->_heartWisp, 0);
  objc_storeStrong((id *)&self->_heart, 0);
  objc_storeStrong((id *)&self->_heartLines, 0);
  objc_storeStrong((id *)&self->_heartNode, 0);
}

@end
