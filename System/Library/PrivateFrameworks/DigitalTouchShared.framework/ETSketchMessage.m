@implementation ETSketchMessage

+ (unsigned)messageType
{
  return 1;
}

- (ETSketchMessage)init
{
  ETSketchMessage *v2;
  uint64_t v3;
  NSMutableArray *strokes;
  uint64_t v5;
  NSMutableArray *colorsInMessage;
  ETSketchMessage *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ETSketchMessage;
  v2 = -[ETMessage init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    strokes = v2->_strokes;
    v2->_strokes = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    colorsInMessage = v2->_colorsInMessage;
    v2->_colorsInMessage = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (NSArray)strokes
{
  return (NSArray *)self->_strokes;
}

- (NSArray)colorsInMessage
{
  return (NSArray *)self->_colorsInMessage;
}

- (unint64_t)numberOfColors
{
  return -[NSMutableArray count](self->_colorsInMessage, "count");
}

- (void)didReachRendererLimit
{
  id v3;

  -[ETMessage delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageWillReachSizeLimit:", self);

}

- (void)addStrokeWithColor:(id)a3
{
  id v4;
  NSMutableArray *strokes;
  id v6;

  v4 = a3;
  -[ETMessage setColor:](self, "setColor:", v4);
  -[NSMutableArray addObject:](self->_colorsInMessage, "addObject:", v4);

  strokes = self->_strokes;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](strokes, "addObject:", v6);

}

- (void)addSketchPoint:(CGPoint)a3
{
  float v4;
  unsigned int v5;
  float v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  unsigned int v11;
  __int16 v12;

  v4 = (a3.x + 1.0) * 32767.0;
  v5 = llroundf(v4);
  v6 = (a3.y + 1.0) * 32767.0;
  v11 = v5 | (llroundf(v6) << 16);
  -[ETMessage timeSource](self, "timeSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "elapsedTimeSinceStartOfMessage:", self);
  v12 = llround(v8 * 1000.0);

  -[NSMutableArray lastObject](self->_strokes, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v11, "{?={?=SS}{?=S}}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

- (BOOL)_decodeWithDoodle:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  unint64_t v10;
  id v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  ETSketchMessage *v21;
  void *v22;
  unsigned int v24;
  NSMutableArray *colorsInMessage;
  int v26;
  void *v27;
  unsigned __int16 v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char v43;
  ETSketchMessage *v44;
  uint64_t v45;
  int v46;
  __int16 v47;

  v4 = a3;
  v5 = objc_msgSend(v4, "doodleCount");
  objc_msgSend(v4, "doodleData");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  objc_msgSend(v4, "colorData");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v40 = objc_msgSend(v9, "bytes");
  v10 = objc_msgSend(v9, "length");
  v44 = self;
  self->_hasMultipleColors = v10 > 7;
  objc_msgSend(v4, "pointTimeDeltaData");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v45 = objc_msgSend(v11, "bytes");
  v12 = objc_msgSend(v11, "length");
  if (v5)
  {
    v34 = v11;
    v35 = v9;
    v36 = v6;
    v37 = v4;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = v8 >> 1;
    v41 = v10 >> 2;
    v42 = v7;
    v18 = v12 >> 1;
    v38 = v7 + 6;
    v39 = v5;
    v19 = 0x24BDBC000uLL;
    v20 = 0x255C18000uLL;
    v21 = v44;
    while (1)
    {
      v43 = v13;
      objc_msgSend(*(id *)(v19 + 3768), "array", v34, v35, v36, v37);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&v21->super.super.isa + *(int *)(v20 + 3320)), "addObject:", v22);
      if (v14 + 2 > v17)
        break;
      if (!v21->_hasMultipleColors || v15 >= v41)
        v24 = -1;
      else
        v24 = *(_DWORD *)(v40 + 4 * v15);
      colorsInMessage = v21->_colorsInMessage;
      v26 = *(unsigned __int16 *)(v42 + 2 * v14 + 2);
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", (double)v24 / 255.0, (double)BYTE1(v24) / 255.0, (double)BYTE2(v24) / 255.0, (double)HIBYTE(v24) / 255.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](colorsInMessage, "addObject:", v27);

      if (v26)
      {
        v28 = v26 + v16;
        v29 = v14 + 4;
        v30 = v38 + 2 * v14;
        v21 = v44;
        while (v29 <= v17)
        {
          v46 = *(_DWORD *)(v30 - 2);
          v47 = 0;
          if (v16 < v18)
            v47 = *(_WORD *)(v45 + 2 * v16);
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v46, "{?={?=SS}{?=S}}");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v31);

          ++v16;
          v29 += 2;
          v30 += 4;
          if (v28 == (unsigned __int16)v16)
          {
            v14 = v29 - 2;
            goto LABEL_18;
          }
        }
        break;
      }
      v14 += 2;
      v21 = v44;
LABEL_18:
      ++v15;

      v13 = v15 >= v39;
      v19 = 0x24BDBC000;
      v20 = 0x255C18000;
      if (v15 == v39)
      {
        v32 = 1;
        v6 = v36;
        v4 = v37;
        v11 = v34;
        v9 = v35;
        goto LABEL_22;
      }
    }

    v6 = v36;
    v4 = v37;
    v11 = v34;
    v9 = v35;
    v32 = v43;
  }
  else
  {
    v32 = 1;
  }
LABEL_22:

  return v32 & 1;
}

- (ETSketchMessage)initWithArchiveData:(id)a3
{
  id v4;
  ETSketchMessage *v5;
  ETPDoodle *v6;
  _BOOL4 v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ETSketchMessage;
  v5 = -[ETMessage initWithArchiveData:](&v9, sel_initWithArchiveData_, v4);
  if (!v5)
  {
LABEL_4:
    v6 = v5;
    goto LABEL_6;
  }
  v6 = -[ETPDoodle initWithData:]([ETPDoodle alloc], "initWithData:", v4);
  if (v6)
  {
    v7 = -[ETSketchMessage _decodeWithDoodle:](v5, "_decodeWithDoodle:", v6);

    if (!v7)
    {
      v6 = 0;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return (ETSketchMessage *)v6;
}

- (id)archiveData
{
  ETPDoodle *v3;
  uint64_t v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  float v24;
  unsigned int v25;
  float v26;
  unsigned int v27;
  float v28;
  unsigned int v29;
  float v30;
  _WORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v38;
  id v39;
  id v40;
  ETPDoodle *v41;
  uint64_t v42;
  uint64_t v43;
  ETSketchMessage *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  double v49;
  double v50;
  double v51;
  double v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(ETPDoodle);
  v4 = -[NSMutableArray count](self->_strokes, "count");
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v44 = self;
  v5 = self->_strokes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v46 != v9)
          objc_enumerationMutation(v5);
        v8 += objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "count");
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  -[ETPDoodle setDoodleCount:](v3, "setDoodleCount:", v4);
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLength:", 4 * (v8 + v4));
  v40 = objc_retainAutorelease(v11);
  v12 = objc_msgSend(v40, "mutableBytes");
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLength:", 4 * v4);
  v39 = objc_retainAutorelease(v13);
  v43 = objc_msgSend(v39, "mutableBytes");
  v41 = v3;
  if (-[ETMessage supportsPlaybackTimeOffset](v44, "supportsPlaybackTimeOffset"))
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "setLength:", 2 * v8);
      v15 = objc_retainAutorelease(v15);
      v16 = objc_msgSend(v15, "mutableBytes");
      goto LABEL_15;
    }
  }
  else
  {
    v15 = 0;
  }
  v16 = 0;
LABEL_15:
  v17 = objc_msgSend(v15, "length", v15);
  v42 = -[NSMutableArray count](v44->_strokes, "count");
  if (v42)
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = v17 >> 1;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](v44->_strokes, "objectAtIndexedSubscript:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](v44->_colorsInMessage, "objectAtIndexedSubscript:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0.0;
      v52 = 0.0;
      v49 = 0.0;
      v50 = 0.0;
      objc_msgSend(v23, "getRed:green:blue:alpha:", &v52, &v51, &v50, &v49);
      v24 = v52 * 255.0;
      v25 = llroundf(v24);
      v26 = v51 * 255.0;
      v27 = llroundf(v26);
      v28 = v50 * 255.0;
      v29 = llroundf(v28);
      v30 = v49 * 255.0;
      *(_DWORD *)(v43 + 4 * v18) = (v29 << 16) | (llroundf(v30) << 24) | (v27 << 8) | v25;

      v31 = (_WORD *)(v12 + 2 * v20);
      *v31 = 0;
      v31[1] = objc_msgSend(v22, "count");
      v32 = objc_msgSend(v22, "count");
      if (v32)
      {
        v33 = v32;
        for (j = 0; j != v33; ++j)
        {
          WORD2(v52) = 0;
          LODWORD(v52) = 0;
          objc_msgSend(v22, "objectAtIndexedSubscript:", j);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "getValue:", &v52);

          if (v16 && v19 < v21)
            *(_WORD *)(v16 + 2 * v19++) = WORD2(v52);
          *(_DWORD *)(v12 + 2 * v20 + 4) = LODWORD(v52);
          v20 += 2;
        }
      }
      v20 += 2;

      ++v18;
    }
    while (v18 != v42);
  }
  -[ETPDoodle setDoodleData:](v41, "setDoodleData:", v40);
  -[ETPDoodle setColorData:](v41, "setColorData:", v39);
  -[ETPDoodle setPointTimeDeltaData:](v41, "setPointTimeDeltaData:", v38);
  -[ETPDoodle data](v41, "data");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (id)messageTypeAsString
{
  return CFSTR("Drawing");
}

- (void)willBeginWisp
{
  void *v3;
  id v4;

  self->_didDrawPoints = 1;
  if (-[ETMessage delayWisp](self, "delayWisp"))
  {
    -[ETMessage parentMessage](self, "parentMessage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "childMessageDidDelayWisp:", self);

  }
  -[ETMessage delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageWillStopPlaying:", self);

}

- (void)didEndWisp
{
  id v3;

  self->_didEndWisping = 1;
  -[ETMessage delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDidStopPlaying:", self);

}

- (void)setParentMessage:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ETSketchMessage;
  -[ETMessage setParentMessage:](&v5, sel_setParentMessage_);
  -[ETMessage setDelayWisp:](self, "setDelayWisp:", a3 != 0);
}

- (void)convertToSimulatedPlaybackSpeed
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  ETSketchMessage *v18;
  NSMutableArray *obj;
  uint64_t v20;
  void *v21;
  int v22;
  __int16 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](self->_strokes, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = 96;
  v18 = self;
  obj = self->_strokes;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v3)
  {
    v4 = v3;
    v20 = *(_QWORD *)v29;
    v5 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count", v17, v18));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v9 = v7;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v25 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
              v23 = 0;
              v22 = 0;
              objc_msgSend(v14, "getValue:", &v22);
              v23 = llround(v5 * 1000.0);
              objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v22, "{?={?=SS}{?=S}}");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v15);

              v5 = v5 + 0.01666;
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v11);
        }

        objc_msgSend(v21, "addObject:", v8);
        v5 = v5 + 0.3;

      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v4);
  }

  v16 = *(Class *)((char *)&v18->super.super.isa + v17);
  *(Class *)((char *)&v18->super.super.isa + v17) = (Class)v21;

  -[ETMessage setSupportsPlaybackTimeOffset:](v18, "setSupportsPlaybackTimeOffset:", 1);
}

- (double)messageDuration
{
  void *v3;
  NSMutableArray *v4;
  unint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  int v17;
  __int16 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (-[ETMessage supportsPlaybackTimeOffset](self, "supportsPlaybackTimeOffset"))
  {
    -[NSMutableArray lastObject](self->_strokes, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v18 = 0;
      v17 = 0;
      -[NSMutableArray getValue:](v4, "getValue:", &v17);
      LOWORD(v5) = v18;
      v6 = (double)v5 / 1000.0 + 3.0;
    }
    else
    {
      v6 = 0.0;
    }
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = self->_strokes;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v4);
          v10 = v10
              + (double)(unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "count", (_QWORD)v13)
              * 0.01666
              + 0.3;
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      }
      while (v8);
      v6 = v10 + 3.0;
    }
    else
    {
      v6 = 3.0;
    }
  }

  return v6;
}

- (BOOL)hasMultipleColors
{
  return self->_hasMultipleColors;
}

- (void)setHasMultipleColors:(BOOL)a3
{
  self->_hasMultipleColors = a3;
}

- (BOOL)didEndWisping
{
  return self->_didEndWisping;
}

- (void)setDidEndWisping:(BOOL)a3
{
  self->_didEndWisping = a3;
}

- (BOOL)didDrawPoints
{
  return self->_didDrawPoints;
}

- (void)setDidDrawPoints:(BOOL)a3
{
  self->_didDrawPoints = a3;
}

- (BOOL)hideComet
{
  return self->_hideComet;
}

- (void)setHideComet:(BOOL)a3
{
  self->_hideComet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorsInMessage, 0);
  objc_storeStrong((id *)&self->_strokes, 0);
}

@end
