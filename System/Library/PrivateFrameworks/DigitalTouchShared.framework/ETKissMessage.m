@implementation ETKissMessage

+ (unsigned)messageType
{
  return 9;
}

+ (id)_kissColor
{
  if (_kissColor_onceToken != -1)
    dispatch_once(&_kissColor_onceToken, &__block_literal_global_6);
  return (id)_kissColor_color;
}

void __27__ETKissMessage__kissColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.87, 0.0, 0.52, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_kissColor_color;
  _kissColor_color = v0;

}

- (ETKissMessage)init
{
  ETKissMessage *v2;
  uint64_t v3;
  NSMutableArray *points;
  uint64_t v5;
  NSMutableArray *angles;
  uint64_t v7;
  NSMutableArray *delays;
  uint64_t v9;
  NSMutableSet *kissMarkNodes;
  ETKissMessage *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ETKissMessage;
  v2 = -[ETMessage init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    points = v2->_points;
    v2->_points = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    angles = v2->_angles;
    v2->_angles = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    delays = v2->_delays;
    v2->_delays = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    kissMarkNodes = v2->_kissMarkNodes;
    v2->_kissMarkNodes = (NSMutableSet *)v9;

    v11 = v2;
  }

  return v2;
}

- (ETKissMessage)initWithArchiveData:(id)a3
{
  id v4;
  ETKissMessage *v5;
  ETPKiss *v6;
  ETPKiss *v7;
  void *v8;
  unint64_t v9;
  unsigned int *v10;
  void *v11;
  unint64_t v12;
  unsigned __int16 *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  ETKissMessage *v17;
  unsigned __int16 *v18;
  uint64_t v19;
  unsigned int v25;
  int64x2_t v26;
  NSMutableArray *points;
  void *v28;
  unsigned int v29;
  NSMutableArray *angles;
  void *v31;
  unsigned int v32;
  NSMutableArray *delays;
  void *v34;
  NSObject *v35;
  ETPKiss *v37;
  id v38;
  id v39;
  id v40;
  float64x2_t v41;
  float64x2_t v42;
  unint64_t v43;
  double v44;
  double v45;
  uint8_t buf[16];
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)ETKissMessage;
  v5 = -[ETMessage initWithArchiveData:](&v47, sel_initWithArchiveData_, v4);
  if (v5)
  {
    v6 = -[ETPKiss initWithData:]([ETPKiss alloc], "initWithData:", v4);
    v7 = v6;
    if (v6)
    {
      if (-[ETPKiss hasPoints](v6, "hasPoints")
        && -[ETPKiss hasAngles](v7, "hasAngles")
        && -[ETPKiss hasDelays](v7, "hasDelays"))
      {
        -[ETPKiss points](v7, "points");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v8, "length");
        v9 = v43 >> 2;
        v40 = objc_retainAutorelease(v8);
        v10 = (unsigned int *)objc_msgSend(v40, "bytes");
        -[ETPKiss angles](v7, "angles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");
        v39 = objc_retainAutorelease(v11);
        v13 = (unsigned __int16 *)objc_msgSend(v39, "bytes");
        -[ETPKiss delays](v7, "delays");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");
        v38 = objc_retainAutorelease(v14);
        v16 = objc_msgSend(v38, "bytes");
        v17 = 0;
        if (v43 >> 2 == v12 >> 1 && v9 == v15 >> 1)
        {
          v37 = v7;
          if (v43 >= 4)
          {
            v18 = (unsigned __int16 *)v16;
            if (v9 <= 1)
              v19 = 1;
            else
              v19 = v43 >> 2;
            __asm { FMOV            V0.2D, #-1.0 }
            v41 = _Q0;
            v42 = (float64x2_t)vdupq_n_s64(0x40DFFFC000000000uLL);
            do
            {
              v25 = *v10++;
              v26.i64[0] = (unsigned __int16)v25;
              v26.i64[1] = vshr_n_u32((uint32x2_t)vdup_n_s32(v25), 0x10uLL).u32[1];
              *(float64x2_t *)buf = vaddq_f64(vdivq_f64(vcvtq_f64_s64(v26), v42), v41);
              points = v5->_points;
              objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", buf, "{CGPoint=dd}", v37);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObject:](points, "addObject:", v28);

              v29 = *v13++;
              v45 = (double)v29 / 1000.0;
              angles = v5->_angles;
              objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", &v45, "d");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObject:](angles, "addObject:", v31);

              v32 = *v18++;
              v44 = (double)v32 / 1000.0;
              delays = v5->_delays;
              objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", &v44, "d");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObject:](delays, "addObject:", v34);

              --v19;
            }
            while (v19);
          }
          v17 = v5;
          v7 = v37;
        }

        goto LABEL_22;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C68B000, v35, OS_LOG_TYPE_INFO, "Attempted to unarchive kiss that was missing points, angles, or delays.", buf, 2u);
        }

      }
    }
    v17 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v17 = 0;
LABEL_23:

  return v17;
}

- (id)archiveData
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  float v13;
  unsigned int v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  id v21;
  id v22;
  ETPKiss *v23;
  __int128 v24;
  double v25;
  double v26;
  __int128 v27;

  v23 = objc_alloc_init(ETPKiss);
  v3 = -[NSMutableArray count](self->_points, "count");
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLength:", 4 * v3);
  v22 = objc_retainAutorelease(v4);
  v5 = objc_msgSend(v22, "mutableBytes");
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLength:", 2 * v3);
  v21 = objc_retainAutorelease(v6);
  v7 = objc_msgSend(v21, "mutableBytes");
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLength:", 2 * v3);
  v20 = objc_retainAutorelease(v8);
  v9 = objc_msgSend(v20, "mutableBytes");
  if (v3)
  {
    v10 = v9;
    v11 = 0;
    v24 = *MEMORY[0x24BDBEFB0];
    do
    {
      v27 = v24;
      -[NSMutableArray objectAtIndexedSubscript:](self->_points, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "getValue:", &v27);

      v13 = (*(double *)&v27 + 1.0) * 32767.0;
      v14 = llroundf(v13);
      v15 = (*((double *)&v27 + 1) + 1.0) * 32767.0;
      *(_DWORD *)(v5 + 4 * v11) = v14 | (llroundf(v15) << 16);
      v26 = 0.0;
      -[NSMutableArray objectAtIndexedSubscript:](self->_angles, "objectAtIndexedSubscript:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "getValue:", &v26);

      *(_WORD *)(v7 + 2 * v11) = (int)(v26 * 1000.0);
      v25 = 0.0;
      -[NSMutableArray objectAtIndexedSubscript:](self->_delays, "objectAtIndexedSubscript:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "getValue:", &v25);

      *(_WORD *)(v10 + 2 * v11++) = llround(v25 * 1000.0);
    }
    while (v3 != v11);
  }
  -[ETPKiss setPoints:](v23, "setPoints:", v22);
  -[ETPKiss setAngles:](v23, "setAngles:", v21);
  -[ETPKiss setDelays:](v23, "setDelays:", v20);
  -[ETPKiss data](v23, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)_leaveMarkAtDelay:(double)a3
{
  return a3 < 0.3 && a3 > 0.0;
}

- (void)_initAtlas
{
  void *v3;
  void *v4;
  id v5;
  SKTexture *v6;
  SKTexture *atlas;
  SKUniform *v8;
  SKUniform *atlasUniform;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (!self->_atlas)
  {
    ETFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ET_SKSetResourceBundle(v3);

    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v4 = (void *)getSKTextureClass_softClass_1;
    v14 = getSKTextureClass_softClass_1;
    if (!getSKTextureClass_softClass_1)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __getSKTextureClass_block_invoke_1;
      v10[3] = &unk_24F6E6C30;
      v10[4] = &v11;
      __getSKTextureClass_block_invoke_1((uint64_t)v10);
      v4 = (void *)v12[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v11, 8);
    objc_msgSend(v5, "textureWithImageNamed:", CFSTR("KissAtlas"));
    v6 = (SKTexture *)objc_claimAutoreleasedReturnValue();
    atlas = self->_atlas;
    self->_atlas = v6;

    objc_msgSend(getSKUniformClass_1(), "uniformWithName:texture:", CFSTR("u_tex2"), self->_atlas);
    v8 = (SKUniform *)objc_claimAutoreleasedReturnValue();
    atlasUniform = self->_atlasUniform;
    self->_atlasUniform = v8;

  }
}

- (void)addKissAtNormalizedPoint:(CGPoint)a3 angle:(double)a4 time:(double)a5 toScene:(id)a6
{
  double lastKissTime;
  NSMutableArray *delays;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *points;
  void *v13;
  NSMutableArray *angles;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint v20;

  v20 = a3;
  lastKissTime = self->_lastKissTime;
  if (lastKissTime == 0.0)
    lastKissTime = a5;
  v18 = a5 - lastKissTime;
  v19 = a4;
  self->_lastKissTime = a5;
  delays = self->_delays;
  v9 = (void *)MEMORY[0x24BDD1968];
  v10 = a6;
  objc_msgSend(v9, "valueWithBytes:objCType:", &v18, "d");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](delays, "addObject:", v11);

  points = self->_points;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v20, "{CGPoint=dd}");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](points, "addObject:", v13);

  angles = self->_angles;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v19, "d");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](angles, "addObject:", v15);

  -[ETKissMessage _initAtlas](self, "_initAtlas");
  -[ETMessage scenePointFromNormalizedPoint:inScene:](self, "scenePointFromNormalizedPoint:inScene:", v10, v20.x, v20.y);
  -[ETKissMessage _displayKissAtPoint:angle:leavesMark:inScene:](self, "_displayKissAtPoint:angle:leavesMark:inScene:", -[ETKissMessage _leaveMarkAtDelay:](self, "_leaveMarkAtDelay:", v18), v10, v16, v17, v19);

}

- (BOOL)_hasKissesThatLeaveMark
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_delays;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v11 = 0.0;
        objc_msgSend(v8, "getValue:", &v11);
        if (-[ETKissMessage _leaveMarkAtDelay:](self, "_leaveMarkAtDelay:", v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)displayInScene:(id)a3
{
  id v4;
  NSMutableSet *v5;
  void *v6;
  uint64_t v7;
  char *i;
  void *v9;
  void *v10;
  id SKActionClass_2;
  void *v12;
  _BOOL4 v13;
  id v14;
  double v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSMutableSet *v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  BOOL v34;
  _QWORD v35[4];
  id v36;
  BOOL v37;
  _QWORD v38[5];
  id v39;
  id v40[3];
  void *v41;
  id from;
  id location[2];

  v4 = a3;
  self->_didDelegateWillStopPlaying = 0;
  self->_didDelegateDidStopPlaying = 0;
  -[ETKissMessage _initAtlas](self, "_initAtlas");
  objc_initWeak(location, v4);
  objc_initWeak(&from, self);
  v5 = self->_kissMarkNodes;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSMutableArray count](self->_points, "count");
  v27 = v5;
  v29 = v4;
  if (v7)
  {
    for (i = 0; i != (char *)v7; ++i)
    {
      v41 = 0;
      -[NSMutableArray objectAtIndexedSubscript:](self->_delays, "objectAtIndexedSubscript:", i, v27, v29);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getValue:", &v41);

      if (!-[ETMessage isRenderingOffscreen](self, "isRenderingOffscreen"))
      {
        objc_msgSend(getSKActionClass_2(), "waitForDuration:", *(double *)&v41);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v10);

      }
      SKActionClass_2 = getSKActionClass_2();
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __32__ETKissMessage_displayInScene___block_invoke;
      v38[3] = &unk_24F6E72A8;
      v38[4] = self;
      v40[1] = i;
      objc_copyWeak(&v39, &from);
      objc_copyWeak(v40, location);
      v40[2] = v41;
      objc_msgSend(SKActionClass_2, "runBlock:", v38);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v12);

      objc_destroyWeak(v40);
      objc_destroyWeak(&v39);
    }
  }
  if (!-[ETMessage isRenderingOffscreen](self, "isRenderingOffscreen", v27, v29))
  {
    v13 = -[ETKissMessage _hasKissesThatLeaveMark](self, "_hasKissesThatLeaveMark");
    v14 = getSKActionClass_2();
    v15 = 0.3;
    if (v13)
      v15 = 1.0;
    objc_msgSend(v14, "waitForDuration:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v16);

    v17 = getSKActionClass_2();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __32__ETKissMessage_displayInScene___block_invoke_2;
    v35[3] = &unk_24F6E72D0;
    v37 = v13;
    objc_copyWeak(&v36, &from);
    v18 = MEMORY[0x24BDAC9B8];
    v19 = MEMORY[0x24BDAC9B8];
    objc_msgSend(v17, "runBlock:queue:", v35, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v20);

    v21 = getSKActionClass_2();
    v22 = 1.7;
    if (v13)
      v22 = 1.0;
    objc_msgSend(v21, "waitForDuration:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v23);

    v24 = getSKActionClass_2();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __32__ETKissMessage_displayInScene___block_invoke_3;
    v31[3] = &unk_24F6E72F8;
    objc_copyWeak(&v33, &from);
    v34 = v13;
    v32 = v28;
    objc_msgSend(v24, "runBlock:", v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v25);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v36);
  }
  objc_msgSend(getSKActionClass_2(), "sequence:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "runAction:", v26);

  objc_destroyWeak(&from);
  objc_destroyWeak(location);

}

void __32__ETKissMessage_displayInScene___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  id *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  uint64_t v13;
  id v14;
  double v15;
  __int128 v16;

  v16 = *MEMORY[0x24BDBEFB0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:", &v16);

  v15 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getValue:", &v15);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (id *)(a1 + 48);
  v6 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "scenePointFromNormalizedPoint:inScene:", v6, v16);
  v8 = v7;
  v10 = v9;

  v11 = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = v15;
  v13 = objc_msgSend(*(id *)(a1 + 32), "_leaveMarkAtDelay:", *(double *)(a1 + 64));
  v14 = objc_loadWeakRetained(v5);
  objc_msgSend(v11, "_displayKissAtPoint:angle:leavesMark:inScene:", v13, v14, v8, v10, v12);

}

void __32__ETKissMessage_displayInScene___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  id v5;

  if (*(_BYTE *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "parentMessage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v3, "childMessageDidDelayWisp:", v4);

  }
  v5 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v5, "_notifyDelegateWillStopPlaying");

}

void __32__ETKissMessage_displayInScene___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  void *v4;
  int64_t v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id SKActionClass_2;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  dispatch_time_t v20;
  uint64_t v21;
  id *v22;
  _QWORD block[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[2];
  _BYTE v30[128];
  uint64_t v31;

  v1 = a1;
  v31 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "parentMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_3:
    v5 = 0;
    goto LABEL_13;
  }
  v6 = *(unsigned __int8 *)(v1 + 48);

  if (!v6)
    goto LABEL_3;
  v21 = v1;
  v22 = v2;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = *(id *)(v1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
        SKActionClass_2 = getSKActionClass_2();
        objc_msgSend(getSKActionClass_2(), "fadeOutWithDuration:", 0.25);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v14;
        objc_msgSend(getSKActionClass_2(), "removeFromParent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29[1] = v15;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(SKActionClass_2, "sequence:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "runAction:", v17);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

  v5 = 1000000000;
  v1 = v21;
  v2 = v22;
LABEL_13:
  if (!*(_BYTE *)(v1 + 48)
    || (v18 = objc_loadWeakRetained(v2),
        objc_msgSend(v18, "parentMessage"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        !v19))
  {
    v20 = dispatch_time(0, v5);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__ETKissMessage_displayInScene___block_invoke_4;
    block[3] = &unk_24F6E70C0;
    objc_copyWeak(&v24, v2);
    dispatch_after(v20, MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v24);
  }
}

void __32__ETKissMessage_displayInScene___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyDelegateDidStopPlaying");

}

- (void)_setKissLeavesMark:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "setLeavesMark:", 1);
    -[NSMutableSet addObject:](self->_kissMarkNodes, "addObject:", v4);

  }
}

- (void)_displayKissAtPoint:(CGPoint)a3 angle:(double)a4 leavesMark:(BOOL)a5 inScene:(id)a6
{
  _BOOL4 v6;
  double y;
  double x;
  id v11;
  id WeakRetained;
  _BOOL4 v13;
  id v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id SKUniformClass_1;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  double v33;
  _BOOL4 v34;
  id SKActionClass_2;
  double v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t);
  void *v50;
  ETKissMessage *v51;
  id v52;
  id v53;
  uint64_t *v54;
  _QWORD v55[4];
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[2];
  _QWORD v67[4];

  v6 = a5;
  y = a3.y;
  x = a3.x;
  v67[2] = *MEMORY[0x24BDAC8D0];
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lastKiss);

  if (WeakRetained)
    v13 = v6;
  else
    v13 = 0;
  if (v13
    && (v14 = objc_loadWeakRetained((id *)&self->_lastKiss),
        v15 = objc_msgSend(v14, "leavesMark"),
        v14,
        (v15 & 1) == 0))
  {
    v46 = objc_loadWeakRetained((id *)&self->_lastKiss);
    -[ETKissMessage _setKissLeavesMark:](self, "_setKissLeavesMark:", v46);

  }
  else
  {
    ETFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ET_SKSetResourceBundle(v16);

    v62 = 0;
    v63 = &v62;
    v64 = 0x2050000000;
    v17 = (void *)getSKShaderClass_softClass_1;
    v65 = getSKShaderClass_softClass_1;
    v18 = MEMORY[0x24BDAC760];
    if (!getSKShaderClass_softClass_1)
    {
      v57 = MEMORY[0x24BDAC760];
      v58 = 3221225472;
      v59 = (uint64_t)__getSKShaderClass_block_invoke_1;
      v60 = COERCE_DOUBLE(&unk_24F6E6C30);
      v61 = &v62;
      __getSKShaderClass_block_invoke_1((uint64_t)&v57);
      v17 = (void *)v63[3];
    }
    v19 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v62, 8);
    objc_msgSend(v19, "shaderWithFileNamed:", CFSTR("kiss"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    SKUniformClass_1 = getSKUniformClass_1();
    LODWORD(v22) = 0;
    objc_msgSend(SKUniformClass_1, "uniformWithName:float:", CFSTR("u_shader_time"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = self->_atlasUniform;
    v67[1] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setUniforms:", v24);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[KissNode kissNodeWithColor:size:](KissNode, "kissNodeWithColor:size:", v25, 256.0, 256.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "setShader:", v20);
    +[ETKissMessage _kissColor](ETKissMessage, "_kissColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setColor:", v27);

    objc_msgSend(v26, "setColorBlendFactor:", 1.0);
    objc_msgSend(v26, "setBlendMode:", 1);
    objc_msgSend(v26, "setPosition:", x, y);
    objc_msgSend(v26, "setZRotation:", a4 + 0.175);
    objc_msgSend(v11, "size");
    v29 = v28 / 156.0;
    if (v29 <= 1.0)
      v30 = 0.35;
    else
      v30 = v29 * 0.35;
    objc_msgSend(v26, "setScale:", v30);
    objc_msgSend(v26, "node");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addChild:", v31);

    if (v13)
    {
      -[ETKissMessage _setKissLeavesMark:](self, "_setKissLeavesMark:", v26);
      v32 = objc_loadWeakRetained((id *)&self->_lastKiss);
      -[ETKissMessage _setKissLeavesMark:](self, "_setKissLeavesMark:", v32);

    }
    objc_storeWeak((id *)&self->_lastKiss, v26);
    v57 = 0;
    v58 = (uint64_t)&v57;
    v59 = 0x2020000000;
    v60 = 0.0;
    v33 = 0.0;
    if (!v13)
    {
      v34 = -[ETMessage isRenderingOffscreen](self, "isRenderingOffscreen", 0.0);
      v33 = 0.3;
      if (!v34)
        v33 = 0.0;
    }
    v60 = 1.0 - v33;
    SKActionClass_2 = getSKActionClass_2();
    v36 = *(double *)(v58 + 24);
    v55[0] = v18;
    v55[1] = 3221225472;
    v55[2] = __62__ETKissMessage__displayKissAtPoint_angle_leavesMark_inScene___block_invoke;
    v55[3] = &unk_24F6E7110;
    v37 = v23;
    v56 = v37;
    objc_msgSend(SKActionClass_2, "customActionWithDuration:actionBlock:", v55, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "runAction:", v38);

    if ((objc_msgSend(v26, "leavesMark") & 1) == 0)
    {
      v39 = getSKActionClass_2();
      objc_msgSend(getSKActionClass_2(), "waitForDuration:", 1.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v40;
      v41 = getSKActionClass_2();
      v47 = v18;
      v48 = 3221225472;
      v49 = __62__ETKissMessage__displayKissAtPoint_angle_leavesMark_inScene___block_invoke_2;
      v50 = &unk_24F6E7320;
      v51 = self;
      v42 = v26;
      v52 = v42;
      v54 = &v57;
      v53 = v37;
      objc_msgSend(v41, "runBlock:", &v47);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v66[1] = v43;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 2, v47, v48, v49, v50, v51);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "sequence:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "runAction:", v45);

    }
    _Block_object_dispose(&v57, 8);

  }
}

uint64_t __62__ETKissMessage__displayKissAtPoint_angle_leavesMark_inScene___block_invoke(uint64_t a1, double a2)
{
  *(float *)&a2 = a2;
  return objc_msgSend(*(id *)(a1 + 32), "setFloatValue:", a2);
}

uint64_t __62__ETKissMessage__displayKissAtPoint_angle_leavesMark_inScene___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t result;
  void *v4;
  float v5;
  double v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isRenderingOffscreen");
  result = objc_msgSend(*(id *)(a1 + 40), "leavesMark");
  if (v2)
  {
    if ((_DWORD)result)
    {
      if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != 1.0)
      {
        v4 = *(void **)(a1 + 48);
        objc_msgSend(v4, "floatValue");
        v6 = 1.0 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + v5;
        *(float *)&v6 = v6;
        return objc_msgSend(v4, "setFloatValue:", v6);
      }
    }
  }
  else if ((result & 1) == 0)
  {
    return objc_msgSend(*(id *)(a1 + 40), "removeFromParent");
  }
  return result;
}

- (void)_notifyDelegateDidStopPlaying
{
  id v3;

  if (!self->_didDelegateDidStopPlaying)
  {
    self->_didDelegateDidStopPlaying = 1;
    -[ETMessage delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "messageDidStopPlaying:", self);

  }
}

- (void)_notifyDelegateWillStopPlaying
{
  id v3;

  if (!self->_didDelegateWillStopPlaying)
  {
    self->_didDelegateWillStopPlaying = 1;
    -[ETMessage delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "messageWillStopPlaying:", self);

  }
}

- (void)stopPlaying
{
  NSMutableSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  id SKActionClass_2;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  _QWORD block[4];
  id v15;
  id location;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = self->_kissMarkNodes;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v18 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        SKActionClass_2 = getSKActionClass_2();
        objc_msgSend(getSKActionClass_2(), "fadeOutWithDuration:", 0.25);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v8;
        objc_msgSend(getSKActionClass_2(), "removeFromParent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v21[1] = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(SKActionClass_2, "sequence:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "runAction:", v11);

      }
      v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v3);
  }

  -[NSMutableSet removeAllObjects](self->_kissMarkNodes, "removeAllObjects");
  -[ETKissMessage _notifyDelegateWillStopPlaying](self, "_notifyDelegateWillStopPlaying");
  objc_initWeak(&location, self);
  if (-[ETMessage missedDuringPlayback](self, "missedDuringPlayback"))
  {
    -[ETKissMessage _notifyDelegateDidStopPlaying](self, "_notifyDelegateDidStopPlaying");
  }
  else
  {
    v12 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__ETKissMessage_stopPlaying__block_invoke;
    block[3] = &unk_24F6E70C0;
    objc_copyWeak(&v15, &location);
    dispatch_after(v12, MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v15);
  }
  objc_destroyWeak(&location);
}

void __28__ETKissMessage_stopPlaying__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyDelegateDidStopPlaying");

}

- (id)messageTypeAsString
{
  return CFSTR("Kiss");
}

- (double)messageDuration
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  double v9;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_delays;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v11 = 0.0;
        objc_msgSend(v8, "getValue:", &v11);
        v6 = v6 + v11;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
    v9 = v6 + 1.0 + 0.25;
  }
  else
  {
    v9 = 1.25;
  }

  return v9;
}

- (BOOL)reachedSizeLimit
{
  return (unint64_t)-[NSMutableArray count](self->_points, "count") > 0x63;
}

- (void)setParentMessage:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ETKissMessage;
  -[ETMessage setParentMessage:](&v4, sel_setParentMessage_, a3);
  -[ETMessage setDelayWisp:](self, "setDelayWisp:", 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastKiss);
  objc_storeStrong((id *)&self->_kissMarkNodes, 0);
  objc_storeStrong((id *)&self->_delays, 0);
  objc_storeStrong((id *)&self->_angles, 0);
  objc_storeStrong((id *)&self->_points, 0);
  objc_storeStrong((id *)&self->_atlasUniform, 0);
  objc_storeStrong((id *)&self->_atlas, 0);
}

@end
