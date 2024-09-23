@implementation BWStillImageBufferRouterNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWStillImageBufferRouterNode)initWithInputPortTypes:(id)a3 HDRSupported:(BOOL)a4 SISSupported:(BOOL)a5 GNRSISSupported:(BOOL)a6 LTMHDRSupported:(BOOL)a7 depthDataDeliveryEnabled:(BOOL)a8
{
  BWStillImageBufferRouterNode *v14;
  int v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  BWNodeInput *v25;
  BWVideoFormatRequirements *v26;
  const char *v27;
  BWNodeOutput *v28;
  BWVideoFormatRequirements *v29;
  BWNodeOutput *v30;
  BWVideoFormatRequirements *v31;
  BWNodeOutput *v32;
  BWVideoFormatRequirements *v33;
  BWNodeOutput *v34;
  BWVideoFormatRequirements *v35;
  BWNodeOutput *v36;
  BWVideoFormatRequirements *v37;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)BWStillImageBufferRouterNode;
  v14 = -[BWNode init](&v44, sel_init);
  if (v14)
  {
    v14->_inputPortTypes = (NSArray *)a3;
    v15 = objc_msgSend(a3, "containsObject:", *MEMORY[0x1E0D05A18]);
    if (v15)
      LOBYTE(v15) = objc_msgSend(a3, "containsObject:", *MEMORY[0x1E0D05A30]);
    v14->_usingBravoDevice = v15;
    v16 = objc_msgSend(a3, "containsObject:", *MEMORY[0x1E0D05A38]);
    if (v16)
      LOBYTE(v16) = objc_msgSend(a3, "containsObject:", *MEMORY[0x1E0D05A40]);
    v14->_usingPearlDevice = v16;
    v14->_HDRSupported = a4;
    v14->_SISSupported = a5;
    v14->_GNRSISSupported = a6;
    v14->_LTMHDRSupported = a7;
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = a3;
    v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v41;
      do
      {
        v22 = 0;
        v23 = v20;
        do
        {
          if (*(_QWORD *)v41 != v21)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v22);
          v25 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v14, v23 + v22);
          v26 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWNodeInput setFormatRequirements:](v25, "setFormatRequirements:", v26);

          -[BWNodeInput setPassthroughMode:](v25, "setPassthroughMode:", 1);
          -[BWNodeInput setRetainedBufferCount:](v25, "setRetainedBufferCount:", 0);
          -[BWNodeInput setName:](v25, "setName:", BWPortTypeToDisplayString(v24, v27));
          -[BWNode addInput:](v14, "addInput:", v25);
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, v24);

          ++v22;
        }
        while (v19 != v22);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        v20 = v23 + v22;
      }
      while (v19);
    }
    v14->_portTypeToInput = (NSDictionary *)objc_msgSend(v17, "copy");
    v28 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v14);
    v29 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeOutput setFormatRequirements:](v28, "setFormatRequirements:", v29);

    -[BWNodeOutput setPassthroughMode:](v28, "setPassthroughMode:", 1);
    -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v28, "setIndexOfInputWhichDrivesThisOutput:", 0);
    -[BWNodeOutput setName:](v28, "setName:", CFSTR("Default"));
    -[BWNode addOutput:](v14, "addOutput:", v28);
    v14->_defaultOutput = v28;

    if (v14->_HDRSupported && !v14->_LTMHDRSupported && !a8)
    {
      v30 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v14);
      v31 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeOutput setFormatRequirements:](v30, "setFormatRequirements:", v31);

      -[BWNodeOutput setPassthroughMode:](v30, "setPassthroughMode:", 1);
      -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v30, "setIndexOfInputWhichDrivesThisOutput:", 0);
      -[BWNodeOutput setName:](v30, "setName:", CFSTR("Legacy HDR"));
      -[BWNode addOutput:](v14, "addOutput:", v30);
      v14->_HDROutput = v30;

    }
    if (v14->_SISSupported && !v14->_GNRSISSupported)
    {
      v32 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v14);
      v33 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeOutput setFormatRequirements:](v32, "setFormatRequirements:", v33);

      -[BWNodeOutput setPassthroughMode:](v32, "setPassthroughMode:", 1);
      -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v32, "setIndexOfInputWhichDrivesThisOutput:", 0);
      -[BWNodeOutput setName:](v32, "setName:", CFSTR("Legacy SIS/OIS"));
      -[BWNode addOutput:](v14, "addOutput:", v32);
      v14->_SISOutput = v32;

    }
    if (v14->_usingBravoDevice)
    {
      v34 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v14);
      v35 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeOutput setFormatRequirements:](v34, "setFormatRequirements:", v35);

      -[BWNodeOutput setPassthroughMode:](v34, "setPassthroughMode:", 1);
      -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v34, "setIndexOfInputWhichDrivesThisOutput:", objc_msgSend(obj, "indexOfObject:", *MEMORY[0x1E0D05A30]));
      -[BWNodeOutput setName:](v34, "setName:", CFSTR("Bravo Telephoto"));
      -[BWNode addOutput:](v14, "addOutput:", v34);
      v14->_bravoTelephotoOutput = v34;

    }
    if (v14->_usingPearlDevice)
    {
      v36 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v14);
      v37 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeOutput setFormatRequirements:](v36, "setFormatRequirements:", v37);

      -[BWNodeOutput setPassthroughMode:](v36, "setPassthroughMode:", 1);
      -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v36, "setIndexOfInputWhichDrivesThisOutput:", objc_msgSend(obj, "indexOfObject:", *MEMORY[0x1E0D05A40]));
      -[BWNodeOutput setName:](v36, "setName:", CFSTR("Pearl IR / Depth"));
      -[BWNode addOutput:](v14, "addOutput:", v36);
      v14->_pearlInfraredOutput = v36;

    }
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageBufferRouterNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Coordinator");
}

- (id)nodeSubType
{
  return CFSTR("StillImageBufferRouter");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a4, "index", a3))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = -[BWNode outputs](self, "outputs", 0);
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setFormat:", objc_msgSend(a4, "format"));
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1, a4, a5))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = -[BWNode outputs](self, "outputs", 0);
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "makeConfiguredFormatLive");
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 0))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = -[BWNode outputs](self, "outputs", 0);
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "markEndOfLiveOutput");
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = (void *)CMGetAttachment(a3, CFSTR("BWStillImageCaptureSettings"), 0);
  v7 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v9 = (void *)-[BWStillImageBufferRouterNode _outputForInput:resolvedStillImageCaptureSettings:metadata:]((uint64_t)self, v8, v6, v7);
  if (v9)
    objc_msgSend(v9, "emitSampleBuffer:", a3);
}

- (uint64_t)_outputForInput:(void *)a3 resolvedStillImageCaptureSettings:(void *)a4 metadata:
{
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  __int16 v12;
  unsigned int v13;
  int v14;
  int *v15;
  uint64_t v16;
  int v17;
  int v18;
  void *v19;
  double v20;
  _BOOL4 v21;
  int v22;

  if (result)
  {
    v6 = result;
    v7 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    v8 = (void *)objc_msgSend(a3, "captureStreamSettingsForPortType:", v7);
    if (objc_msgSend(v8, "validBracketedCaptureSequenceNumbers"))
    {
      v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue");
      v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]), "intValue");
      v11 = (v9 & 1) != 0 ? &unk_1E49F9ED0 : (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
      if (!objc_msgSend((id)objc_msgSend(v8, "validBracketedCaptureSequenceNumbers"), "containsObject:", v11))return 0;
    }
    v12 = objc_msgSend(a3, "captureFlags");
    v13 = objc_msgSend(a3, "captureType");
    result = 0;
    if (v13 <= 0xC)
    {
      if (((1 << v13) & 0x1DC6) != 0)
      {
        v14 = *(unsigned __int8 *)(v6 + 96);
        goto LABEL_10;
      }
      if (((1 << v13) & 0x30) != 0)
      {
        if (*(_BYTE *)(v6 + 96) && (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D05A30]) & 1) != 0)
          goto LABEL_12;
        if (*(_BYTE *)(v6 + 97) && (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D05A40]) & 1) != 0)
          goto LABEL_15;
        v16 = 136;
        goto LABEL_22;
      }
      if (v13 == 3)
      {
        v17 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue");
        if ((v12 & 0x400) != 0)
        {
          v18 = v17;
          v19 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06038]);
          if (v19)
          {
            objc_msgSend(v19, "doubleValue");
            v21 = v20 == 0.0;
          }
          else
          {
            v21 = 0;
          }
          if ((v18 | v21) == 1)
          {
            v22 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D05A18]);
            v15 = &OBJC_IVAR___BWStillImageBufferRouterNode__bravoTelephotoOutput;
            if (v22)
              v15 = &OBJC_IVAR___BWStillImageBufferRouterNode__defaultOutput;
          }
          else
          {
            v15 = &OBJC_IVAR___BWStillImageBufferRouterNode__HDROutput;
          }
          return *(_QWORD *)(v6 + *v15);
        }
        v14 = *(unsigned __int8 *)(v6 + 96);
        if ((v12 & 0x800) != 0)
        {
LABEL_10:
          if (v14 && (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D05A30]) & 1) != 0)
            goto LABEL_12;
          if (*(_BYTE *)(v6 + 97) && (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D05A40]) & 1) != 0)
          {
LABEL_15:
            v15 = &OBJC_IVAR___BWStillImageBufferRouterNode__pearlInfraredOutput;
            return *(_QWORD *)(v6 + *v15);
          }
LABEL_23:
          v15 = &OBJC_IVAR___BWStillImageBufferRouterNode__defaultOutput;
          return *(_QWORD *)(v6 + *v15);
        }
        if (!*(_BYTE *)(v6 + 96) || !objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D05A30]))
        {
          if (*(_BYTE *)(v6 + 97) && (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D05A40]) & 1) != 0)
            goto LABEL_15;
          v16 = 128;
LABEL_22:
          result = *(_QWORD *)(v6 + v16);
          if (result)
            return result;
          goto LABEL_23;
        }
        result = *(_QWORD *)(v6 + 128);
        if (!result)
        {
LABEL_12:
          v15 = &OBJC_IVAR___BWStillImageBufferRouterNode__bravoTelephotoOutput;
          return *(_QWORD *)(v6 + *v15);
        }
      }
    }
  }
  return result;
}

- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v4 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[BWStillImageBufferRouterNode _defaultOutputsForInput:]((uint64_t)self, a4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)_defaultOutputsForInput:(uint64_t)a1
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (!a1)
    return 0;
  v3 = (void *)objc_msgSend(*(id *)(a1 + 104), "objectAtIndexedSubscript:", objc_msgSend(a2, "index"));
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (*(_BYTE *)(a1 + 96) && objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D05A30]))
  {
    v5 = 144;
LABEL_8:
    v6 = *(_QWORD *)(a1 + v5);
LABEL_12:
    objc_msgSend(v4, "addObject:", v6);
    return v4;
  }
  if (*(_BYTE *)(a1 + 97) && objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D05A40]))
  {
    v5 = 152;
    goto LABEL_8;
  }
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 120));
  if (*(_QWORD *)(a1 + 128))
    objc_msgSend(v4, "addObject:");
  v6 = *(_QWORD *)(a1 + 136);
  if (v6)
    goto LABEL_12;
  return v4;
}

- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[BWStillImageBufferRouterNode _defaultOutputsForInput:]((uint64_t)self, a4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "emitStillImagePrewarmMessageWithSettings:", a3, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[BWStillImageBufferRouterNode _defaultOutputsForInput:]((uint64_t)self, a4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "emitNodeError:", a3, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (id)inputForPortType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_portTypeToInput, "objectForKeyedSubscript:", a3);
}

- (BWNodeOutput)defaultOutput
{
  return self->_defaultOutput;
}

- (BWNodeOutput)HDROutput
{
  return self->_HDROutput;
}

- (BWNodeOutput)SISOutput
{
  return self->_SISOutput;
}

- (BWNodeOutput)bravoTelephotoOutput
{
  return self->_bravoTelephotoOutput;
}

- (BWNodeOutput)pearlInfraredOutput
{
  return self->_pearlInfraredOutput;
}

@end
