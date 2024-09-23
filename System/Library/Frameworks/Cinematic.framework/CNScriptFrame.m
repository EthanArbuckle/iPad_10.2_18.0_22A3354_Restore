@implementation CNScriptFrame

- (CNScriptFrame)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  void *v4;
  CNScriptFrame *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB26C0]), "initWithSampleBuffer:", a3);
  v5 = -[CNScriptFrame initWithTimedMetadataGroup:](self, "initWithTimedMetadataGroup:", v4);

  return v5;
}

- (CNScriptFrame)initWithTimedMetadataGroup:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  CNScriptFrame *v12;
  void *v13;
  char isKindOfClass;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a3, "items", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "key");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", 0x2504502C8);

        if (v11)
        {
          objc_msgSend(v9, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v9, "value");
            v15 = objc_claimAutoreleasedReturnValue();
            self = (CNScriptFrame *)-[CNScriptFrame _initWithTimedData:](self, "_initWithTimedData:", v15);
            v12 = self;
          }
          else
          {
            _CNLogSystem();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              -[CNRenderingSessionFrameAttributes initWithTimedMetadataGroup:sessionAttributes:].cold.1(0x2504502C8, v9, v15);
            v12 = 0;
          }

          goto LABEL_16;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (CMTime)time
{
  CMTime *result;

  result = (CMTime *)self->_internalFrame;
  if (result)
    return (CMTime *)-[CMTime time](result, "time");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (float)focusDisparity
{
  float result;

  -[PTCinematographyFrame focusDistance](self->_internalFrame, "focusDistance");
  return result;
}

- (CNDetection)focusDetection
{
  void *v3;
  id v4;
  int v5;
  double v6;
  id v7;
  _BYTE v9[24];

  -[PTCinematographyFrame focusDetection](self->_internalFrame, "focusDetection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BE74B58]);
    -[CNScriptFrame time](self, "time");
    -[CNScriptFrame focusDisparity](self, "focusDisparity");
    LODWORD(v6) = v5;
    v3 = (void *)objc_msgSend(v4, "initWithTime:rect:focusDistance:", v9, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), v6);
    objc_msgSend(v3, "setDetectionType:", 0);
    objc_msgSend(v3, "setTrackIdentifier:", -[PTCinematographyFrame focusTrackIdentifier](self->_internalFrame, "focusTrackIdentifier"));
    objc_msgSend(v3, "setGroupIdentifier:", -[PTCinematographyFrame focusGroupIdentifier](self->_internalFrame, "focusGroupIdentifier"));
  }
  v7 = +[CNDetection _copyDetectionFromInternal:](CNDetection, "_copyDetectionFromInternal:", v3);

  return (CNDetection *)v7;
}

- (NSArray)allDetections
{
  void *v2;
  id v3;

  -[PTCinematographyFrame allDetections](self->_internalFrame, "allDetections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[CNDetection _copyDetectionsFromInternal:](CNDetection, "_copyDetectionsFromInternal:", v2);

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CNScriptFrame internalFrame](self, "internalFrame");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internalFrame");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CNScriptFrame internalFrame](self, "internalFrame");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initCopyingInternalFrame:", self->_internalFrame);
}

- (id)_initTakingInternalFrame:(id)a3
{
  id v5;
  CNScriptFrame *v6;
  CNScriptFrame *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNScriptFrame;
  v6 = -[CNScriptFrame init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_internalFrame, a3);

  return v7;
}

- (id)_initCopyingInternalFrame:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = -[CNScriptFrame _initTakingInternalFrame:](self, "_initTakingInternalFrame:", v4);

  return v5;
}

- (id)_initWithTimedData:(id)a3
{
  void *v4;
  CNScriptFrame *v5;

  objc_msgSend(MEMORY[0x24BE74BA0], "objectFromData:error:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    self = (CNScriptFrame *)-[CNScriptFrame _initTakingInternalFrame:](self, "_initTakingInternalFrame:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PTCinematographyFrame)internalFrame
{
  return (PTCinematographyFrame *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternalFrame:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalFrame, 0);
}

- (CNDetection)detectionForID:(CNDetectionID)detectionID
{
  void *v4;
  void *v5;
  id v6;

  -[CNScriptFrame internalFrame](self, "internalFrame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detectionForTrackIdentifier:", detectionID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = +[CNDetection _copyDetectionFromInternal:](CNDetection, "_copyDetectionFromInternal:", v5);
  else
    v6 = 0;

  return (CNDetection *)v6;
}

- (CNDetection)bestDetectionForGroupID:(CNDetectionGroupID)detectionGroupID
{
  void *v4;
  void *v5;
  id v6;

  -[CNScriptFrame internalFrame](self, "internalFrame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bestDetectionForGroupIdentifier:", detectionGroupID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = +[CNDetection _copyDetectionFromInternal:](CNDetection, "_copyDetectionFromInternal:", v5);
  else
    v6 = 0;

  return (CNDetection *)v6;
}

+ (id)_copyFrameFromInternal:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initCopyingInternalFrame:", v4);

  return v5;
}

+ (id)_copyFramesFromInternal:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(a1, "_copyFrameFromInternal:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

+ (id)_copyInternalFromFrames:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "internalFrame", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

@end
