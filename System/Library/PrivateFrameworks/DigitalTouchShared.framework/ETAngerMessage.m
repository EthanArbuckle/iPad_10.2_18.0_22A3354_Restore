@implementation ETAngerMessage

+ (unsigned)messageType
{
  return 10;
}

- (ETAngerMessage)init
{
  ETAngerMessage *v2;
  uint64_t v3;
  NSMutableArray *points;
  uint64_t v5;
  NSMutableArray *delays;
  ETAngerMessage *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ETAngerMessage;
  v2 = -[ETMessage init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    points = v2->_points;
    v2->_points = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    delays = v2->_delays;
    v2->_delays = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (ETAngerMessage)initWithArchiveData:(id)a3
{
  id v4;
  ETAngerMessage *v5;
  ETPAnger *v6;
  ETPAnger *v7;
  float v8;
  float v9;
  CGFloat v10;
  float v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64x2_t v27;
  NSMutableArray *points;
  void *v29;
  unint64_t v30;
  NSMutableArray *delays;
  void *v32;
  ETAngerMessage *v33;
  void *v35;
  void *v36;
  float64x2_t v37;
  float64x2_t v38;
  uint64_t v39;
  double v40;
  float64x2_t v41;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)ETAngerMessage;
  v5 = -[ETMessage initWithArchiveData:](&v42, sel_initWithArchiveData_, v4);
  if (v5)
  {
    v6 = -[ETPAnger initWithData:]([ETPAnger alloc], "initWithData:", v4);
    v7 = v6;
    if (v6
      && -[ETPAnger hasDuration](v6, "hasDuration")
      && -[ETPAnger hasNormalizedCenterX](v7, "hasNormalizedCenterX")
      && -[ETPAnger hasNormalizedCenterY](v7, "hasNormalizedCenterY"))
    {
      -[ETPAnger duration](v7, "duration");
      v5->_duration = v8;
      -[ETPAnger normalizedCenterX](v7, "normalizedCenterX");
      v10 = v9;
      -[ETPAnger normalizedCenterY](v7, "normalizedCenterY");
      v5->_normalizedCenter.x = v10;
      v5->_normalizedCenter.y = v11;
      if (!-[ETPAnger hasPoints](v7, "hasPoints"))
      {
LABEL_17:
        v33 = v5;
LABEL_21:

        goto LABEL_22;
      }
      -[ETPAnger points](v7, "points");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");
      v14 = objc_retainAutorelease(v12);
      v39 = objc_msgSend(v14, "bytes");
      -[ETPAnger delays](v7, "delays");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");
      v17 = objc_retainAutorelease(v15);
      v18 = objc_msgSend(v17, "bytes");
      if (v13 >> 2 == v16 >> 1)
      {
        v35 = v17;
        v36 = v14;
        if (v13 >= 4)
        {
          v19 = v18;
          v20 = 0;
          if (v13 >> 2 <= 1)
            v21 = 1;
          else
            v21 = v13 >> 2;
          __asm { FMOV            V0.2D, #-1.0 }
          v37 = _Q0;
          v38 = (float64x2_t)vdupq_n_s64(0x40DFFFC000000000uLL);
          do
          {
            v27.i64[0] = (unsigned __int16)*(_DWORD *)(v39 + 4 * v20);
            v27.i64[1] = vshr_n_u32((uint32x2_t)vdup_n_s32(*(_DWORD *)(v39 + 4 * v20)), 0x10uLL).u32[1];
            v41 = vaddq_f64(vdivq_f64(vcvtq_f64_s64(v27), v38), v37);
            if (!v20)
              v5->_normalizedCenter = (CGPoint)v41;
            points = v5->_points;
            objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", &v41, "{CGPoint=dd}");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](points, "addObject:", v29);

            LOWORD(v30) = *(_WORD *)(v19 + 2 * v20);
            v40 = (double)v30 / 1000.0;
            delays = v5->_delays;
            objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", &v40, "d");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](delays, "addObject:", v32);

            ++v20;
          }
          while (v21 != v20);
        }

        goto LABEL_17;
      }

    }
    v33 = 0;
    goto LABEL_21;
  }
  v33 = 0;
LABEL_22:

  return v33;
}

- (id)archiveData
{
  ETPAnger *v3;
  double duration;
  CGFloat x;
  CGFloat y;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  float v16;
  unsigned int v17;
  float v18;
  void *v19;
  void *v20;
  id v22;
  __int128 v23;
  double v24;
  __int128 v25;

  v3 = objc_alloc_init(ETPAnger);
  duration = self->_duration;
  *(float *)&duration = duration;
  -[ETPAnger setDuration:](v3, "setDuration:", duration);
  x = self->_normalizedCenter.x;
  *(float *)&x = x;
  -[ETPAnger setNormalizedCenterX:](v3, "setNormalizedCenterX:", x);
  y = self->_normalizedCenter.y;
  *(float *)&y = y;
  -[ETPAnger setNormalizedCenterY:](v3, "setNormalizedCenterY:", y);
  v7 = -[NSMutableArray count](self->_points, "count");
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLength:", 4 * v7);
  v22 = objc_retainAutorelease(v8);
  v9 = objc_msgSend(v22, "mutableBytes");
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLength:", 2 * v7);
  v11 = objc_retainAutorelease(v10);
  v12 = objc_msgSend(v11, "mutableBytes");
  if (v7)
  {
    v13 = v12;
    v14 = 0;
    v23 = *MEMORY[0x24BDBEFB0];
    do
    {
      v25 = v23;
      -[NSMutableArray objectAtIndexedSubscript:](self->_points, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "getValue:", &v25);

      v16 = (*(double *)&v25 + 1.0) * 32767.0;
      v17 = llroundf(v16);
      v18 = (*((double *)&v25 + 1) + 1.0) * 32767.0;
      *(_DWORD *)(v9 + 4 * v14) = v17 | (llroundf(v18) << 16);
      v24 = 0.0;
      -[NSMutableArray objectAtIndexedSubscript:](self->_delays, "objectAtIndexedSubscript:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "getValue:", &v24);

      *(_WORD *)(v13 + 2 * v14++) = llround(v24 * 1000.0);
    }
    while (v7 != v14);
  }
  -[ETPAnger setPoints:](v3, "setPoints:", v22);
  -[ETPAnger setDelays:](v3, "setDelays:", v11);
  -[ETPAnger data](v3, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)displayInScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id SKUniformClass_0;
  double v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  SKSpriteNode *v21;
  SKSpriteNode **p_anger;
  SKSpriteNode *anger;
  SKSpriteNode *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  SKSpriteNode *v30;
  void *v31;
  SKSpriteNode *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id SKActionClass_1;
  void *v41;
  SKSpriteNode *v42;
  void *v43;
  SKSpriteNode *v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  SKSpriteNode *v53;
  id v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  __int128 v62;
  id val;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  __int128 v71;
  double v72;
  id from;
  __int128 v74;
  uint64_t v75;
  void *v76;
  id *v77;
  id location;
  id *p_location;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[2];
  _QWORD v83[4];

  v83[2] = *MEMORY[0x24BDAC8D0];
  val = a3;
  ETFrameworkBundle();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v74 = 0;
  *((_QWORD *)&v74 + 1) = &v74;
  v75 = 0x2020000000;
  v5 = getSKSetResourceBundleSymbolLoc_ptr_1;
  v76 = getSKSetResourceBundleSymbolLoc_ptr_1;
  if (!getSKSetResourceBundleSymbolLoc_ptr_1)
  {
    v6 = (void *)SpriteKitLibrary_1();
    v5 = dlsym(v6, "SKSetResourceBundle");
    *(_QWORD *)(*((_QWORD *)&v74 + 1) + 24) = v5;
    getSKSetResourceBundleSymbolLoc_ptr_1 = v5;
  }
  _Block_object_dispose(&v74, 8);
  if (!v5)
    -[ETMessage displayInScene:].cold.1();
  ((void (*)(id))v5)(v4);

  SKUniformClass_0 = getSKUniformClass_0();
  LODWORD(v8) = 0;
  objc_msgSend(SKUniformClass_0, "uniformWithName:float:", CFSTR("u_shader_time"), v8);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  p_location = &location;
  v80 = 0x2050000000;
  v9 = (id)getSKTextureClass_softClass_0;
  v81 = getSKTextureClass_softClass_0;
  if (!getSKTextureClass_softClass_0)
  {
    *(_QWORD *)&v74 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v74 + 1) = 3221225472;
    v75 = (uint64_t)__getSKTextureClass_block_invoke_0;
    v76 = &unk_24F6E6C30;
    v77 = &location;
    __getSKTextureClass_block_invoke_0((uint64_t)&v74);
    v9 = p_location[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&location, 8);
  objc_msgSend(v10, "textureWithImageNamed:", CFSTR("angerAtlas"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getSKUniformClass_0(), "uniformWithName:texture:", CFSTR("u_tex2"), v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  p_location = &location;
  v80 = 0x2050000000;
  v11 = (id)getSKShaderClass_softClass_0;
  v81 = getSKShaderClass_softClass_0;
  if (!getSKShaderClass_softClass_0)
  {
    *(_QWORD *)&v74 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v74 + 1) = 3221225472;
    v75 = (uint64_t)__getSKShaderClass_block_invoke_0;
    v76 = &unk_24F6E6C30;
    v77 = &location;
    __getSKShaderClass_block_invoke_0((uint64_t)&v74);
    v11 = p_location[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&location, 8);
  objc_msgSend(v12, "shaderWithFileNamed:", CFSTR("anger"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v58;
  v83[1] = v60;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setUniforms:", v13);

  objc_msgSend(val, "size");
  v15 = v14;
  location = 0;
  p_location = &location;
  v80 = 0x2050000000;
  v16 = (id)getSKSpriteNodeClass_softClass_1;
  v81 = getSKSpriteNodeClass_softClass_1;
  if (!getSKSpriteNodeClass_softClass_1)
  {
    *(_QWORD *)&v74 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v74 + 1) = 3221225472;
    v75 = (uint64_t)__getSKSpriteNodeClass_block_invoke_1;
    v76 = &unk_24F6E6C30;
    v77 = &location;
    __getSKSpriteNodeClass_block_invoke_1((uint64_t)&v74);
    v16 = p_location[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&location, 8);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "colorSpaceConvertedColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = fmin(v15, 272.0);
  objc_msgSend(v17, "spriteNodeWithColor:size:", v19, v20, v20 / 272.0 * 340.0);
  v21 = (SKSpriteNode *)objc_claimAutoreleasedReturnValue();
  p_anger = &self->_anger;
  anger = self->_anger;
  self->_anger = v21;

  -[SKSpriteNode setShader:](self->_anger, "setShader:", v61);
  v24 = self->_anger;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "colorSpaceConvertedColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKSpriteNode setColor:](v24, "setColor:", v26);

  -[SKSpriteNode setColorBlendFactor:](self->_anger, "setColorBlendFactor:", 1.0);
  -[SKSpriteNode setBlendMode:](self->_anger, "setBlendMode:", 1);
  -[ETAngerMessage _updateCenterFromNormalizedPoint:inScene:](self, "_updateCenterFromNormalizedPoint:inScene:", val, self->_normalizedCenter.x, self->_normalizedCenter.y);
  objc_msgSend(val, "size");
  v28 = v27 / 156.0;
  if (v28 <= 1.0)
    v29 = 0.5;
  else
    v29 = v28 * 0.5;
  -[SKSpriteNode setScale:](self->_anger, "setScale:", v29);
  objc_msgSend(val, "addChild:", *p_anger);
  v30 = *p_anger;
  objc_msgSend(getSKActionClass_1(), "fadeInWithDuration:", 0.2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKSpriteNode runAction:withKey:](v30, "runAction:withKey:", v31, CFSTR("fade"));

  v32 = *p_anger;
  objc_msgSend(getSKActionClass_1(), "scaleTo:duration:", 1.5, 0.2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKSpriteNode runAction:withKey:](v32, "runAction:withKey:", v33, CFSTR("scale"));

  v57 = 120;
  if (self->_duration != 0.0)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, val);
    if (!-[ETMessage isRenderingOffscreen](self, "isRenderingOffscreen"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[NSMutableArray count](self->_points, "count");
      if (v35 >= 1)
      {
        v36 = 0;
        v62 = *MEMORY[0x24BDBEFB0];
        do
        {
          v74 = v62;
          -[NSMutableArray objectAtIndexedSubscript:](self->_points, "objectAtIndexedSubscript:", v36, v57);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "getValue:", &v74);

          v72 = 0.0;
          -[NSMutableArray objectAtIndexedSubscript:](self->_delays, "objectAtIndexedSubscript:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "getValue:", &v72);

          objc_msgSend(getSKActionClass_1(), "waitForDuration:", v72);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v39);

          SKActionClass_1 = getSKActionClass_1();
          v68[0] = MEMORY[0x24BDAC760];
          v68[1] = 3221225472;
          v68[2] = __33__ETAngerMessage_displayInScene___block_invoke;
          v68[3] = &unk_24F6E7178;
          objc_copyWeak(&v69, &location);
          v71 = v74;
          objc_copyWeak(&v70, &from);
          objc_msgSend(SKActionClass_1, "runBlock:", v68);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v41);

          objc_destroyWeak(&v70);
          objc_destroyWeak(&v69);
          ++v36;
        }
        while (v35 != v36);
      }
      v42 = self->_anger;
      objc_msgSend(getSKActionClass_1(), "sequence:", v34);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKSpriteNode runAction:](v42, "runAction:", v43);

      v44 = self->_anger;
      v45 = getSKActionClass_1();
      objc_msgSend(getSKActionClass_1(), "waitForDuration:", *(double *)((char *)&self->super.super.isa + v57) + 0.2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = v46;
      v47 = getSKActionClass_1();
      v66[0] = MEMORY[0x24BDAC760];
      v66[1] = 3221225472;
      v66[2] = __33__ETAngerMessage_displayInScene___block_invoke_2;
      v66[3] = &unk_24F6E70C0;
      objc_copyWeak(&v67, &location);
      v48 = MEMORY[0x24BDAC9B8];
      v49 = MEMORY[0x24BDAC9B8];
      objc_msgSend(v47, "runBlock:queue:", v66, v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v82[1] = v50;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v82, 2);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "sequence:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKSpriteNode runAction:](v44, "runAction:", v52);

      objc_destroyWeak(&v67);
    }
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  v53 = self->_anger;
  v54 = getSKActionClass_1();
  v64[0] = MEMORY[0x24BDAC760];
  v64[1] = 3221225472;
  v64[2] = __33__ETAngerMessage_displayInScene___block_invoke_3;
  v64[3] = &unk_24F6E7110;
  v65 = v60;
  v55 = v60;
  objc_msgSend(v54, "customActionWithDuration:actionBlock:", v64, (double)10 + 0.2 + 0.2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKSpriteNode runAction:](v53, "runAction:", v56);

}

void __33__ETAngerMessage_displayInScene___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateCenterFromNormalizedPoint:inScene:", v2, *(double *)(a1 + 48), *(double *)(a1 + 56));

}

void __33__ETAngerMessage_displayInScene___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stopPlaying");

}

uint64_t __33__ETAngerMessage_displayInScene___block_invoke_3(uint64_t a1)
{
  void *v1;
  float v2;
  double v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "floatValue");
  v3 = v2 + 0.01666;
  *(float *)&v3 = v3;
  return objc_msgSend(v1, "setFloatValue:", v3);
}

- (void)_updateCenterFromNormalizedPoint:(CGPoint)a3 inScene:(id)a4
{
  SKSpriteNode *anger;

  anger = self->_anger;
  -[ETMessage scenePointFromNormalizedPoint:inScene:](self, "scenePointFromNormalizedPoint:inScene:", a4, a3.x, a3.y);
  -[SKSpriteNode setPosition:](anger, "setPosition:");
}

- (void)stopPlaying
{
  void *v3;
  SKSpriteNode *anger;
  id SKActionClass_1;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SKSpriteNode *v10;
  void *v11;
  SKSpriteNode *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  dispatch_time_t v21;
  _QWORD v22[4];
  id v23;
  ETAngerMessage *v24;
  _QWORD v25[4];
  id v26;
  id location;
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x24BDAC8D0];
  -[ETMessage delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageWillStopPlaying:", self);
  -[SKSpriteNode removeAllActions](self->_anger, "removeAllActions");
  anger = self->_anger;
  SKActionClass_1 = getSKActionClass_1();
  objc_msgSend(getSKActionClass_1(), "fadeOutWithDuration:", 0.2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v6;
  objc_msgSend(getSKActionClass_1(), "removeFromParent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(SKActionClass_1, "sequence:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKSpriteNode runAction:withKey:](anger, "runAction:withKey:", v9, CFSTR("fade"));

  v10 = self->_anger;
  objc_msgSend(getSKActionClass_1(), "scaleTo:duration:", 0.0, 0.2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKSpriteNode runAction:withKey:](v10, "runAction:withKey:", v11, CFSTR("scale"));

  objc_initWeak(&location, self->_anger);
  v12 = self->_anger;
  v13 = getSKActionClass_1();
  objc_msgSend(getSKActionClass_1(), "waitForDuration:", 0.2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  v15 = getSKActionClass_1();
  v16 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __29__ETAngerMessage_stopPlaying__block_invoke;
  v25[3] = &unk_24F6E70C0;
  objc_copyWeak(&v26, &location);
  objc_msgSend(v15, "runBlock:", v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sequence:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKSpriteNode runAction:](v12, "runAction:", v19);

  -[SKSpriteNode parent](self->_anger, "parent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = v20 == 0;

  if ((_DWORD)v14)
  {
    objc_msgSend(v3, "messageDidStopPlaying:", self);
  }
  else
  {
    v21 = dispatch_time(0, 1000000000);
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __29__ETAngerMessage_stopPlaying__block_invoke_2;
    v22[3] = &unk_24F6E6B78;
    v23 = v3;
    v24 = self;
    dispatch_after(v21, MEMORY[0x24BDAC9B8], v22);

  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __29__ETAngerMessage_stopPlaying__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "removeFromParent");

}

uint64_t __29__ETAngerMessage_stopPlaying__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "messageDidStopPlaying:", *(_QWORD *)(a1 + 40));
}

- (void)setNormalizedPoint:(CGPoint)a3 atRelativeTime:(double)a4 inScene:(id)a5
{
  NSMutableArray *delays;
  void *v7;
  id v8;
  void *v9;
  NSMutableArray *points;
  void *v11;
  double v12;
  CGPoint v13;

  v13 = a3;
  v12 = a4;
  delays = self->_delays;
  v7 = (void *)MEMORY[0x24BDD1968];
  v8 = a5;
  objc_msgSend(v7, "valueWithBytes:objCType:", &v12, "d");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](delays, "addObject:", v9);

  points = self->_points;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v13, "{CGPoint=dd}");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](points, "addObject:", v11);

  -[ETAngerMessage _updateCenterFromNormalizedPoint:inScene:](self, "_updateCenterFromNormalizedPoint:inScene:", v8, v13.x, v13.y);
}

- (id)messageTypeAsString
{
  return CFSTR("Anger");
}

- (double)messageDuration
{
  return self->_duration + 0.2 + 0.2;
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

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delays, 0);
  objc_storeStrong((id *)&self->_points, 0);
  objc_storeStrong((id *)&self->_anger, 0);
}

@end
