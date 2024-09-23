@implementation BWFaceDetectionNode

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  NSArray *boxedMetadataOutputs;
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
  if (self->_metadataObjectOutputEnabled)
    -[BWNodeOutput makeConfiguredFormatLive](self->_metadataObjectOutput, "makeConfiguredFormatLive", a3, a4, a5);
  if (self->_boxedMetadataOutputEnabled)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    boxedMetadataOutputs = self->_boxedMetadataOutputs;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](boxedMetadataOutputs, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
            objc_enumerationMutation(boxedMetadataOutputs);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "makeConfiguredFormatLive");
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](boxedMetadataOutputs, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (BWNodeOutput)metadataObjectOutput
{
  return self->_metadataObjectOutput;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  NSArray *boxedMetadataOutputs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  $95D729B680665BEAEFA1D6FCA8238556 *p_startMarkerBufferPTS;
  __int128 *v15;
  CMTimeEpoch epoch;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double x;
  double y;
  double width;
  double height;
  _BOOL4 v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  __int128 v47;
  int64_t v48;
  NSArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  int v58;
  const void *propertyList;
  CFPropertyListRef propertyLista[2];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  CMSampleTimingInfo sampleTimingArray;
  double v66;
  double v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  CFTypeRef cf;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;
  CGRect v82;
  CGRect v83;

  v81 = *MEMORY[0x1E0C80C00];
  cf = 0;
  if (!a3)
    return;
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    boxedMetadataOutputs = self->_boxedMetadataOutputs;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](boxedMetadataOutputs, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v74 != v9)
            objc_enumerationMutation(boxedMetadataOutputs);
          objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "emitSampleBuffer:", a3);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](boxedMetadataOutputs, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
      }
      while (v8);
    }
    -[BWNodeOutput emitSampleBuffer:](self->_metadataObjectOutput, "emitSampleBuffer:", a3);
    -[BWNodeOutput emitSampleBuffer:](self->super.super._output, "emitSampleBuffer:", a3);
    v11 = (void *)CMGetAttachment(a3, CFSTR("FileWriterAction"), 0);
    if (v11)
    {
      v12 = v11;
      if ((objc_msgSend(v11, "isEqualToString:", 0x1E495A0B8) & 1) == 0
        && (objc_msgSend(v12, "isEqualToString:", 0x1E495A0D8) & 1) == 0)
      {
        v13 = objc_msgSend(v12, "isEqualToString:", 0x1E495A078);
        p_startMarkerBufferPTS = &self->_startMarkerBufferPTS;
        v15 = (__int128 *)MEMORY[0x1E0CA2E18];
        if (v13)
        {
          CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.duration, a3);
          *(_OWORD *)&p_startMarkerBufferPTS->value = *(_OWORD *)&sampleTimingArray.duration.value;
          epoch = sampleTimingArray.duration.epoch;
        }
        else
        {
          *(_OWORD *)&p_startMarkerBufferPTS->value = *MEMORY[0x1E0CA2E18];
          epoch = *((_QWORD *)v15 + 2);
        }
        self->_startMarkerBufferPTS.epoch = epoch;
        v47 = *v15;
        *(_OWORD *)&self->_prevBoxedFacePTS.value = *v15;
        v48 = *((_QWORD *)v15 + 2);
        self->_prevBoxedFacePTS.epoch = v48;
        *(_OWORD *)&self->_prevBoxedFaceDur.value = v47;
        self->_prevBoxedFaceDur.epoch = v48;
        *(_OWORD *)propertyLista = v47;
        *(_OWORD *)&self->_prevBoxedNoFacePTS.value = v47;
        self->_prevBoxedNoFacePTS.epoch = v48;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v49 = -[NSDictionary allValues](self->_detectionTimingInfoByBoxedOutput, "allValues");
        v50 = -[NSArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v70;
          do
          {
            for (j = 0; j != v51; ++j)
            {
              if (*(_QWORD *)v70 != v52)
                objc_enumerationMutation(v49);
              v54 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j);
              if (v54)
              {
                *(_OWORD *)(v54 + 8) = *(_OWORD *)propertyLista;
                *(_QWORD *)(v54 + 24) = v48;
                *(_OWORD *)(v54 + 32) = *(_OWORD *)propertyLista;
                *(_QWORD *)(v54 + 48) = v48;
                *(_OWORD *)(v54 + 56) = *(_OWORD *)propertyLista;
                *(_QWORD *)(v54 + 72) = v48;
                *(_DWORD *)(v54 + 80) = 0;
              }
            }
            v51 = -[NSArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
          }
          while (v51);
        }
      }
    }
    return;
  }
  v17 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v17)
  {
    fig_log_get_emitter();
LABEL_80:
    FigDebugAssert3();
    return;
  }
  v18 = v17;
  v19 = objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
  v20 = objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06998]);
  v66 = 0.0;
  v67 = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  v68 = _Q0;
  propertyList = (const void *)v19;
  if (v20 | v19)
  {
    FigCFDictionaryGetCGRectIfPresent();
    if (self->_metadataObjectOutputEnabled)
    {
      memset(&sampleTimingArray, 0, sizeof(sampleTimingArray));
      if (CMSampleBufferGetSampleTimingInfoArray(a3, 1, &sampleTimingArray, 0)
        || CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, (CMSampleBufferRef *)&cf))
      {
        fig_log_get_emitter();
        goto LABEL_80;
      }
    }
  }
  os_unfair_lock_lock(&self->_rectOfInterestLock);
  x = self->_rectOfInterest.origin.x;
  y = self->_rectOfInterest.origin.y;
  width = self->_rectOfInterest.size.width;
  height = self->_rectOfInterest.size.height;
  os_unfair_lock_unlock(&self->_rectOfInterestLock);
  v30 = 0;
  v31 = *(double *)&v68;
  v32 = 1.0;
  if (*(double *)&v68 == 1.0)
  {
    v31 = *((double *)&v68 + 1);
    if (*((double *)&v68 + 1) == 1.0)
    {
      v83.origin.x = 0.0;
      v83.origin.y = 0.0;
      v83.size.width = 1.0;
      v83.size.height = 1.0;
      v82.origin.x = x;
      v82.origin.y = y;
      v82.size.width = width;
      v82.size.height = height;
      v30 = CGRectEqualToRect(v82, v83);
    }
  }
  v33 = objc_msgSend((id)v20, "count", v32, v31);
  v34 = (uint64_t *)MEMORY[0x1E0D06F20];
  v57 = v18;
  if (v33
    && (v35 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v20, "firstObject"), "objectForKeyedSubscript:", *MEMORY[0x1E0D06F20]), "longLongValue"), v35 > self->_previousDetectedFacesTimestamp))
  {
    self->_previousDetectedFacesTimestamp = v35;
    if (v30)
      v36 = (id)v20;
    else
      v36 = BWCreateCorrectedFacesArray((void *)v20, v66, v67, *(double *)&v68, *((double *)&v68 + 1), x, y, width, height);
    v37 = v36;
    if (self->_metadataObjectOutputEnabled
      && -[NSSet containsObject:](self->_enabledDetectedObjectTypes, "containsObject:", *MEMORY[0x1E0D064A0]))
    {
      v58 = -[BWFaceDetectionNode _addFacesArray:toSampleBuffer:]((uint64_t)self, v37, cf);
    }
    else
    {
      v58 = 0;
    }
    if (self->_boxedMetadataOutputEnabled && !v19)
      -[BWFaceDetectionNode _renderSampleBufferForBoxedMetadataOutput:withFaceArray:]((uint64_t)self, a3, v37);

  }
  else
  {
    v58 = 0;
  }
  if (!v19)
  {
LABEL_73:
    if (!v58)
      goto LABEL_75;
    goto LABEL_74;
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v38 = (void *)objc_msgSend((id)v19, "allValues");
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v62;
    v42 = *v34;
LABEL_40:
    v43 = 0;
    while (1)
    {
      if (*(_QWORD *)v62 != v41)
        objc_enumerationMutation(v38);
      v44 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * v43), "objectForKeyedSubscript:", v42), "longLongValue");
      if (v44 > self->_previousDetectedObjectsTimestamp)
        break;
      if (v40 == ++v43)
      {
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
        if (v40)
          goto LABEL_40;
        goto LABEL_73;
      }
    }
    self->_previousDetectedObjectsTimestamp = v44;
    if (v30 && !self->_metadataObjectOutputEnabled)
    {
      v46 = 0;
    }
    else
    {
      v45 = (id)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], propertyList, 1uLL);
      v46 = v45;
      if (!v30)
        BWCorrectRectanglesInDetectedObjectsInfo(v45, v66, v67, *(double *)&v68, *((double *)&v68 + 1), self->_rectOfInterest.origin.x, self->_rectOfInterest.origin.y, self->_rectOfInterest.size.width, self->_rectOfInterest.size.height);
    }
    if (self->_boxedMetadataOutputEnabled)
    {
      if (v46)
        v55 = v46;
      else
        v55 = (void *)propertyList;
      -[BWFaceDetectionNode _renderSampleBufferForBoxedMetadataOutput:withDetectedObjectsInfo:]((uint64_t)self, a3, v55);
    }
    if (!self->_metadataObjectOutputEnabled)
      goto LABEL_73;
    BWFilterDetectedObjectsInfoUsingSet((uint64_t)v46, self->_enabledDetectedObjectTypes);
    v56 = objc_msgSend((id)objc_msgSend(v57, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A8]), "intValue");
    if (((v58 | -[BWFaceDetectionNode _addDetectedObjectsInfo:detectedObjectsSource:toSampleBuffer:]((uint64_t)self, v46, v56, cf)) & 1) != 0)goto LABEL_74;
    goto LABEL_75;
  }
  if ((v58 & 1) != 0)
LABEL_74:
    -[BWNodeOutput emitSampleBuffer:](self->super.super._output, "emitSampleBuffer:", cf);
LABEL_75:
  if (cf)
    CFRelease(cf);
}

- (uint64_t)_addDetectedObjectsInfo:(uint64_t)a3 detectedObjectsSource:(const void *)a4 toSampleBuffer:
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v19;
  v13 = *MEMORY[0x1E0D064D0];
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(a2);
      v15 = (void *)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i)), "objectForKeyedSubscript:", v13);
      if (v15)
      {
        v10 += objc_msgSend(v15, "count");
        v11 = 1;
      }
    }
    v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v9);
  if (v10 <= 0 && ((*(_DWORD *)(a1 + 204) != 0) & v11) != 1)
    return 0;
  v16 = 1;
  CMSetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05C30], a2, 1u);
  *(_DWORD *)(a1 + 204) = v10;
  CMSetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05C38], (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3), 1u);
  return v16;
}

- (void)setRectOfInterest:(CGRect)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v8;
  CGRect v9;

  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = 1.0;
  v9.size.height = 1.0;
  v8 = CGRectIntersection(a3, v9);
  x = v8.origin.x;
  y = v8.origin.y;
  width = v8.size.width;
  height = v8.size.height;
  if (CGRectIsEmpty(v8))
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  os_unfair_lock_lock(&self->_rectOfInterestLock);
  self->_rectOfInterest.origin.x = x;
  self->_rectOfInterest.origin.y = y;
  self->_rectOfInterest.size.width = width;
  self->_rectOfInterest.size.height = height;
  os_unfair_lock_unlock(&self->_rectOfInterestLock);
}

- (void)setMetadataObjectOutputEnabled:(BOOL)a3
{
  if (self->_metadataObjectOutputEnabled != a3)
    self->_metadataObjectOutputEnabled = a3;
}

- (void)setBoxedMetadataOutputEnabled:(BOOL)a3
{
  if (self->_boxedMetadataOutputEnabled != a3)
    self->_boxedMetadataOutputEnabled = a3;
}

- (BOOL)metadataObjectOutputEnabled
{
  return self->_metadataObjectOutputEnabled;
}

- (BWFaceDetectionNode)initWithObjectMetadataIdentifiers:(id)a3 movieFileOutputMetadataIdentifierGroups:(id)a4
{
  BWNodeInput *v6;
  CFIndex v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  CMMetadataFormatDescriptionRef v25;
  BWNodeOutput *v26;
  void *v27;
  BWBoxedOutputDetectionTimingInfo *v28;
  id v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id obj;
  uint64_t v56;
  uint64_t v57;
  const __CFAllocator *allocator;
  CFMutableDictionaryRef theDict;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  objc_super v75;
  CMMetadataFormatDescriptionRef formatDescriptionOut;
  _BYTE v77[128];
  uint64_t v78;
  uint64_t v79;
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[3];
  _QWORD v86[3];
  uint64_t v87;
  uint64_t v88;
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[3];
  _QWORD v95[3];
  uint64_t v96;
  uint64_t v97;
  _QWORD v98[3];
  _QWORD v99[3];
  _QWORD v100[2];
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[3];
  _QWORD v104[3];
  uint64_t v105;
  uint64_t v106;
  _QWORD v107[3];
  _QWORD v108[3];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[3];
  _QWORD v113[3];
  uint64_t v114;
  uint64_t v115;
  _QWORD v116[3];
  _QWORD v117[3];
  uint64_t v118;
  uint64_t v119;
  _QWORD v120[3];
  _QWORD v121[3];
  uint64_t v122;
  uint64_t v123;
  _QWORD v124[3];
  _QWORD v125[3];
  _QWORD v126[2];
  _QWORD v127[2];
  _QWORD v128[4];
  _QWORD v129[3];
  _QWORD v130[5];

  v130[3] = *MEMORY[0x1E0C80C00];
  v75.receiver = self;
  v75.super_class = (Class)BWFaceDetectionNode;
  v70 = -[BWNode init](&v75, sel_init);
  if (!v70)
    return 0;
  v6 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1835365473, v70);
  objc_msgSend(v70, "addInput:", v6);

  *((_QWORD *)v70 + 19) = 0;
  *((_QWORD *)v70 + 20) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(v70 + 168) = _Q0;
  *((_DWORD *)v70 + 46) = 0;
  *((_QWORD *)v70 + 17) = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1836016234, v70);
  v35 = a3;
  objc_msgSend(*((id *)v70 + 17), "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", a3));
  objc_msgSend(v70, "addOutput:", *((_QWORD *)v70 + 17));
  *((_DWORD *)v70 + 52) = 0;
  *((_DWORD *)v70 + 57) = 0;
  *((_DWORD *)v70 + 60) = 0;
  *((_DWORD *)v70 + 63) = 0;
  *((_DWORD *)v70 + 66) = 0;
  v12 = objc_msgSend(a4, "count");
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v12);
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v12, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFAutorelease(theDict);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = a4;
  v60 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
  if (v60)
  {
    v57 = *(_QWORD *)v72;
    v67 = *MEMORY[0x1E0CA2558];
    v14 = *MEMORY[0x1E0CA2528];
    v15 = *MEMORY[0x1E0CA2518];
    v54 = *MEMORY[0x1E0CA24B0];
    v16 = *MEMORY[0x1E0CA4BD8];
    v53 = *MEMORY[0x1E0CA4C18];
    v17 = *MEMORY[0x1E0CA2478];
    v52 = *MEMORY[0x1E0CA4C10];
    v18 = *MEMORY[0x1E0CA2430];
    v68 = *MEMORY[0x1E0CA2540];
    v69 = *MEMORY[0x1E0CA2538];
    v19 = *MEMORY[0x1E0C9AE40];
    v51 = *MEMORY[0x1E0CA4C20];
    v49 = *MEMORY[0x1E0CA4C28];
    v50 = *MEMORY[0x1E0CA23F0];
    v66 = *MEMORY[0x1E0CA2560];
    v48 = *MEMORY[0x1E0CA24B8];
    v46 = *MEMORY[0x1E0CA4C38];
    v47 = *MEMORY[0x1E0CA4C30];
    v64 = *MEMORY[0x1E0CA2550];
    v45 = *MEMORY[0x1E0CA24A8];
    v43 = *MEMORY[0x1E0CA4C08];
    v44 = *MEMORY[0x1E0CA4C00];
    v65 = *MEMORY[0x1E0CA2548];
    v42 = *MEMORY[0x1E0CA24A0];
    v40 = *MEMORY[0x1E0CA4BF8];
    v41 = *MEMORY[0x1E0CA4BF0];
    v63 = *MEMORY[0x1E0CA2568];
    v39 = *MEMORY[0x1E0CA24C0];
    v37 = *MEMORY[0x1E0CA4CA8];
    v38 = *MEMORY[0x1E0CA4CB0];
    v56 = *MEMORY[0x1E0CA2518];
    v62 = *MEMORY[0x1E0CA2430];
    v36 = v13;
    while (2)
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v72 != v57)
          objc_enumerationMutation(obj);
        v61 = v20;
        v21 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v20);
        formatDescriptionOut = 0;
        v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        if (objc_msgSend(v21, "containsObject:", v67))
        {
          v129[0] = v14;
          v129[1] = v15;
          v130[0] = v67;
          v130[1] = v54;
          v129[2] = v16;
          v126[0] = v14;
          v126[1] = v15;
          v127[0] = v53;
          v127[1] = v17;
          v128[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v127, v126, 2);
          v124[0] = v14;
          v124[1] = v15;
          v125[0] = v52;
          v125[1] = v62;
          v124[2] = v69;
          v122 = v68;
          v123 = v19;
          v125[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1);
          v128[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, v124, 3);
          v120[0] = v14;
          v120[1] = v15;
          v121[0] = v51;
          v121[1] = v50;
          v120[2] = v69;
          v118 = v68;
          v119 = v19;
          v121[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
          v128[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, v120, 3);
          v116[0] = v14;
          v116[1] = v15;
          v117[0] = v49;
          v117[1] = v50;
          v116[2] = v69;
          v13 = v36;
          v114 = v68;
          v115 = v19;
          v117[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
          v128[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, v116, 3);
          v130[2] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 4);
          v18 = v62;
          objc_msgSend(v22, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v129, 3));
        }
        if (objc_msgSend(v21, "containsObject:", v66))
        {
          v112[0] = v14;
          v112[1] = v15;
          v113[0] = v66;
          v113[1] = v48;
          v112[2] = v16;
          v109[0] = v14;
          v109[1] = v15;
          v110[0] = v47;
          v110[1] = v17;
          v111[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
          v107[0] = v14;
          v107[1] = v15;
          v108[0] = v46;
          v108[1] = v18;
          v107[2] = v69;
          v105 = v68;
          v106 = v19;
          v108[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
          v111[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 3);
          v113[2] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 2);
          objc_msgSend(v22, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v113, v112, 3));
        }
        if (objc_msgSend(v21, "containsObject:", v64))
        {
          v103[0] = v14;
          v103[1] = v15;
          v104[0] = v64;
          v104[1] = v45;
          v103[2] = v16;
          v100[0] = v14;
          v100[1] = v15;
          v101[0] = v44;
          v101[1] = v17;
          v102[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 2);
          v98[0] = v14;
          v98[1] = v15;
          v99[0] = v43;
          v99[1] = v18;
          v98[2] = v69;
          v96 = v68;
          v97 = v19;
          v99[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
          v102[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 3);
          v104[2] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 2);
          objc_msgSend(v22, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 3));
        }
        if (objc_msgSend(v21, "containsObject:", v65))
        {
          v94[0] = v14;
          v94[1] = v15;
          v95[0] = v65;
          v95[1] = v42;
          v94[2] = v16;
          v91[0] = v14;
          v91[1] = v15;
          v92[0] = v41;
          v92[1] = v17;
          v93[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 2);
          v89[0] = v14;
          v89[1] = v15;
          v90[0] = v40;
          v90[1] = v18;
          v89[2] = v69;
          v87 = v68;
          v88 = v19;
          v90[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
          v93[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 3);
          v95[2] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
          objc_msgSend(v22, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 3));
        }
        if (objc_msgSend(v21, "containsObject:", v63))
        {
          v85[0] = v14;
          v85[1] = v15;
          v86[0] = v63;
          v86[1] = v39;
          v85[2] = v16;
          v82[0] = v14;
          v82[1] = v15;
          v83[0] = v38;
          v83[1] = v17;
          v84[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
          v80[0] = v14;
          v80[1] = v15;
          v81[0] = v37;
          v81[1] = v18;
          v80[2] = v69;
          v78 = v68;
          v79 = v19;
          v81[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
          v84[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 3);
          v86[2] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
          objc_msgSend(v22, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 3));
        }
        if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications(allocator, 0x6D656278u, (CFArrayRef)v22, &formatDescriptionOut))
        {
          goto LABEL_33;
        }
        v23 = v14;
        v24 = v16;
        v25 = formatDescriptionOut;
        CFAutorelease(formatDescriptionOut);
        v26 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1835365473, v70);
        -[BWNodeOutput setFormat:](v26, "setFormat:", +[BWMetadataFormat formatWithMetadataFormatDescription:](BWMetadataFormat, "formatWithMetadataFormatDescription:", v25));
        objc_msgSend(v70, "addOutput:", v26);
        v27 = v13;
        objc_msgSend(v13, "addObject:", v26);
        v28 = objc_alloc_init(BWBoxedOutputDetectionTimingInfo);
        CFDictionaryAddValue(theDict, v26, v28);

        if (objc_msgSend(v21, "containsObject:", v67))
        {
          if (-[BWFaceDetectionNode _populateLocalIDsForFacesWithFormatDescription:]((uint64_t)v70))
            goto LABEL_33;
        }
        if (objc_msgSend(v21, "containsObject:", v66)
          && -[BWFaceDetectionNode _populateLocalIDsForHumanBodiesWithFormatDescription:]((uint64_t)v70)
          || objc_msgSend(v21, "containsObject:", v65)
          && -[BWFaceDetectionNode _populateLocalIDsForCatBodiesWithFormatDescription:]((uint64_t)v70)
          || objc_msgSend(v21, "containsObject:", v64)
          && -[BWFaceDetectionNode _populateLocalIDsForDogBodiesWithFormatDescription:]((uint64_t)v70)
          || objc_msgSend(v21, "containsObject:", v63)
          && -[BWFaceDetectionNode _populateLocalIDsForSalientObjectsWithFormatDescription:]((uint64_t)v70))
        {
LABEL_33:
          fig_log_get_emitter();
          FigDebugAssert3();

          return 0;
        }
        v20 = v61 + 1;
        v13 = v27;
        v16 = v24;
        v14 = v23;
        v15 = v56;
        v18 = v62;
      }
      while (v60 != v61 + 1);
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
      if (v60)
        continue;
      break;
    }
  }
  v29 = (id)objc_msgSend(v13, "count");
  if (v29)
    v29 = v13;
  *((_QWORD *)v70 + 18) = v29;
  *((_QWORD *)v70 + 35) = theDict;
  v30 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  FigCaptureAddDetectedObjectTypesFromMetadataIdentifiersToSet(v35, v30);
  *((_QWORD *)v70 + 24) = v30;
  v70[188] = 0;
  v70[189] = 0;
  *((_DWORD *)v70 + 104) = 0;
  v31 = MEMORY[0x1E0CA2E18];
  v32 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)(v70 + 344) = *MEMORY[0x1E0CA2E18];
  v33 = *(_QWORD *)(v31 + 16);
  *((_QWORD *)v70 + 45) = v33;
  *((_OWORD *)v70 + 23) = v32;
  *((_QWORD *)v70 + 48) = v33;
  *(_OWORD *)(v70 + 392) = v32;
  *((_QWORD *)v70 + 51) = v33;
  *((_DWORD *)v70 + 50) = -1;
  *((_DWORD *)v70 + 51) = -1;
  *((_DWORD *)v70 + 105) = 1667592803;
  *((_DWORD *)v70 + 106) = 1937008995;
  objc_msgSend(v70, "setSupportsLiveReconfiguration:", 0);
  return (BWFaceDetectionNode *)v70;
}

+ (void)initialize
{
  objc_opt_class();
}

- (uint64_t)_populateLocalIDsForFacesWithFormatDescription:(uint64_t)result
{
  _DWORD *v1;
  unsigned int LocalIDForMetadataIdentifyingFactors;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;

  if (result)
  {
    v1 = (_DWORD *)result;
    if (*(_DWORD *)(result + 208))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      LocalIDForMetadataIdentifyingFactors = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
      if (LocalIDForMetadataIdentifyingFactors)
      {
        v1[52] = bswap32(LocalIDForMetadataIdentifyingFactors);
        v1[72] = v1[52];
        v3 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
        if (v3)
        {
          v1[53] = bswap32(v3);
          v1[73] = v1[53];
          v4 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
          if (v4)
          {
            v1[54] = bswap32(v4);
            v1[74] = v1[54];
            v5 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
            if (v5)
            {
              v1[55] = bswap32(v5);
              v1[75] = v1[55];
              v6 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
              if (v6)
              {
                v7 = v6;
                result = 0;
                v1[56] = bswap32(v7);
                v1[76] = v1[56];
                return result;
              }
            }
          }
        }
      }
    }
    return 4294954516;
  }
  return result;
}

- (uint64_t)_populateLocalIDsForHumanBodiesWithFormatDescription:(uint64_t)result
{
  _DWORD *v1;
  unsigned int LocalIDForMetadataIdentifyingFactors;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;

  if (result)
  {
    v1 = (_DWORD *)result;
    if (*(_DWORD *)(result + 228))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      LocalIDForMetadataIdentifyingFactors = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
      if (LocalIDForMetadataIdentifyingFactors)
      {
        v1[57] = bswap32(LocalIDForMetadataIdentifyingFactors);
        v3 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
        if (v3)
        {
          v1[58] = bswap32(v3);
          v4 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
          if (v4)
          {
            v5 = v4;
            result = 0;
            v1[59] = bswap32(v5);
            return result;
          }
        }
      }
    }
    return 4294954516;
  }
  return result;
}

- (uint64_t)_populateLocalIDsForCatBodiesWithFormatDescription:(uint64_t)result
{
  _DWORD *v1;
  unsigned int LocalIDForMetadataIdentifyingFactors;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;

  if (result)
  {
    v1 = (_DWORD *)result;
    if (*(_DWORD *)(result + 240))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      LocalIDForMetadataIdentifyingFactors = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
      if (LocalIDForMetadataIdentifyingFactors)
      {
        v1[60] = bswap32(LocalIDForMetadataIdentifyingFactors);
        v3 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
        if (v3)
        {
          v1[61] = bswap32(v3);
          v4 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
          if (v4)
          {
            v5 = v4;
            result = 0;
            v1[62] = bswap32(v5);
            return result;
          }
        }
      }
    }
    return 4294954516;
  }
  return result;
}

- (uint64_t)_populateLocalIDsForDogBodiesWithFormatDescription:(uint64_t)result
{
  _DWORD *v1;
  unsigned int LocalIDForMetadataIdentifyingFactors;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;

  if (result)
  {
    v1 = (_DWORD *)result;
    if (*(_DWORD *)(result + 252))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      LocalIDForMetadataIdentifyingFactors = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
      if (LocalIDForMetadataIdentifyingFactors)
      {
        v1[63] = bswap32(LocalIDForMetadataIdentifyingFactors);
        v3 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
        if (v3)
        {
          v1[64] = bswap32(v3);
          v4 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
          if (v4)
          {
            v5 = v4;
            result = 0;
            v1[65] = bswap32(v5);
            return result;
          }
        }
      }
    }
    return 4294954516;
  }
  return result;
}

- (uint64_t)_populateLocalIDsForSalientObjectsWithFormatDescription:(uint64_t)result
{
  _DWORD *v1;
  unsigned int LocalIDForMetadataIdentifyingFactors;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;

  if (result)
  {
    v1 = (_DWORD *)result;
    if (*(_DWORD *)(result + 264))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      LocalIDForMetadataIdentifyingFactors = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
      if (LocalIDForMetadataIdentifyingFactors)
      {
        v1[66] = bswap32(LocalIDForMetadataIdentifyingFactors);
        v3 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
        if (v3)
        {
          v1[67] = bswap32(v3);
          v4 = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
          if (v4)
          {
            v5 = v4;
            result = 0;
            v1[68] = bswap32(v5);
            return result;
          }
        }
      }
    }
    return 4294954516;
  }
  return result;
}

- (void)dealloc
{
  OpaqueCMBlockBuffer *emptyMetadataSampleData;
  objc_super v4;

  emptyMetadataSampleData = self->_emptyMetadataSampleData;
  if (emptyMetadataSampleData)
    CFRelease(emptyMetadataSampleData);
  v4.receiver = self;
  v4.super_class = (Class)BWFaceDetectionNode;
  -[BWFanOutNode dealloc](&v4, sel_dealloc);
}

- (CGRect)rectOfInterest
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rectOfInterest.origin.x;
  y = self->_rectOfInterest.origin.y;
  width = self->_rectOfInterest.size.width;
  height = self->_rectOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)boxedMetadataOutputEnabled
{
  return self->_boxedMetadataOutputEnabled;
}

- (id)nodeSubType
{
  return CFSTR("FaceDetection");
}

- (void)didReachEndOfDataForInput:(id)a3
{
  NSArray *boxedMetadataOutputs;
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
  if (self->_metadataObjectOutputEnabled)
    -[BWNodeOutput markEndOfLiveOutput](self->_metadataObjectOutput, "markEndOfLiveOutput", a3);
  if (self->_boxedMetadataOutputEnabled)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    boxedMetadataOutputs = self->_boxedMetadataOutputs;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](boxedMetadataOutputs, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
            objc_enumerationMutation(boxedMetadataOutputs);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "markEndOfLiveOutput");
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](boxedMetadataOutputs, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
  }
}

- (uint64_t)_addFacesArray:(const void *)a3 toSampleBuffer:
{
  uint64_t v6;

  if (!a1 || !objc_msgSend(a2, "count") && !*(_DWORD *)(a1 + 200))
    return 0;
  v6 = 1;
  CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C68], a2, 1u);
  CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C70], (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a2, "count")), 1u);
  *(_DWORD *)(a1 + 200) = objc_msgSend(a2, "count");
  return v6;
}

- (void)_renderSampleBufferForBoxedMetadataOutput:(void *)a3 withFaceArray:
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  const opaqueCMFormatDescription *v11;
  uint64_t v12;
  int v13;
  int *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  uint64_t v21;
  CGFloat v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int64_t v26;
  char *v27;
  void *v28;
  uint64_t v29;
  const __CFDictionary *v30;
  char *v31;
  double v32;
  unsigned int v33;
  unsigned int v34;
  char *v35;
  float64x2_t v36;
  __int128 v37;
  unsigned int v38;
  void *v39;
  size_t v40;
  double v41;
  uint64_t v42;
  char *v43;
  unsigned int v44;
  void *v45;
  char *v46;
  unsigned int v47;
  uint64_t v48;
  const void *EmptyMetadataSample;
  OpaqueCMBlockBuffer *v50;
  OpaqueCMBlockBuffer *v51;
  CMTimeFlags v52;
  CGFloat width;
  CMTimeFlags y_high;
  CMTimeFlags v55;
  const __CFAllocator *v56;
  CMTimeEpoch v57;
  __int128 v58;
  __int128 v59;
  CMTimeEpoch v60;
  __int128 v61;
  const opaqueCMFormatDescription *v62;
  int v63;
  uint64_t blockLength;
  double v65;
  void *v66;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *memoryBlock;
  CGFloat obja;
  size_t sampleSizeArray;
  CMSampleTimingInfo sampleTimingArray;
  CMTime v79;
  CMTime rhs;
  CMTime time2;
  CGRect time1;
  CMTime v83;
  CMTime time;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  CFTypeRef cf;
  CMBlockBufferRef theBuffer;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  CGFloat x;
  CMTimeScale y_low;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v4 = *(void **)(a1 + 144);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
  if (!v5)
    return;
  v6 = v5;
  v7 = *(_QWORD *)v92;
  v8 = *MEMORY[0x1E0CA2558];
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v92 != v7)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
      if ((-[__CFArray containsObject:](CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)objc_msgSend((id)objc_msgSend(v10, "format"), "formatDescription")), "containsObject:", v8) & 1) != 0)
      {
        v66 = v10;
        if (!v10)
          return;
        v11 = (const opaqueCMFormatDescription *)objc_msgSend((id)objc_msgSend(v10, "format"), "formatDescription");
        v12 = objc_msgSend(a3, "count");
        v13 = v12;
        v14 = &OBJC_IVAR___BWFigVideoCaptureDevice__numAPSStatisticsSamples;
        if (!v12 && !*(_DWORD *)(a1 + 416) && ((*(_BYTE *)(a1 + 332) & 1) == 0 || (*(_BYTE *)(a1 + 404) & 1) != 0))
          return;
        cf = 0;
        theBuffer = 0;
        x = *MEMORY[0x1E0CA2E18];
        y_low = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
        v65 = *(double *)(MEMORY[0x1E0CA2E18] + 16);
        if (v12 < 1)
        {
          EmptyMetadataSample = (const void *)-[BWFaceDetectionNode _getEmptyMetadataSampleData](a1);
          if (!EmptyMetadataSample)
          {
            v16 = 0;
            theBuffer = 0;
            goto LABEL_65;
          }
          v50 = (OpaqueCMBlockBuffer *)CFRetain(EmptyMetadataSample);
          theBuffer = v50;
          if (!v50)
            goto LABEL_76;
          v51 = v50;
          if ((*(_BYTE *)(a1 + 380) & 1) != 0)
          {
            time2 = *(CMTime *)(a1 + 344);
            rhs = *(CMTime *)(a1 + 368);
            CMTimeAdd((CMTime *)&time1, &time2, &rhs);
            x = time1.origin.x;
            y_high = HIDWORD(time1.origin.y);
            y_low = LODWORD(time1.origin.y);
            width = time1.size.width;
          }
          else if ((*(_DWORD *)(a1 + 332) & 1) == 0
                 || (v52 = *(_DWORD *)(a1 + 332), (*(_BYTE *)(a1 + 356) & 1) != 0)
                 || (*(_BYTE *)(a1 + 404) & 1) != 0)
          {
            memset(&time1, 0, 24);
            CMTimeMake((CMTime *)&time1, *(_DWORD *)(a1 + 352) / 240, *(_DWORD *)(a1 + 352));
            if (!*(_QWORD *)&time1.origin.x)
              *(_QWORD *)&time1.origin.x = 1;
            rhs = *(CMTime *)(a1 + 344);
            *(CGPoint *)&v79.value = time1.origin;
            v79.epoch = *(_QWORD *)&time1.size.width;
            CMTimeAdd(&time2, &rhs, &v79);
            x = *(double *)&time2.value;
            y_high = time2.flags;
            y_low = time2.timescale;
            width = *(double *)&time2.epoch;
          }
          else
          {
            x = *(double *)(a1 + 320);
            y_low = *(_DWORD *)(a1 + 328);
            width = *(double *)(a1 + 336);
            y_high = v52;
          }
          *(double *)(a1 + 360) = v65;
          v58 = *MEMORY[0x1E0CA2E18];
          *(_OWORD *)(a1 + 344) = *MEMORY[0x1E0CA2E18];
          *(double *)(a1 + 384) = v65;
          *(_OWORD *)(a1 + 368) = v58;
          *(CGFloat *)(a1 + 392) = x;
          *(_DWORD *)(a1 + 400) = y_low;
          *(_DWORD *)(a1 + 404) = y_high;
          *(CGFloat *)(a1 + 408) = width;
          v56 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          v57 = *(_QWORD *)&width;
          goto LABEL_63;
        }
        v62 = v11;
        v63 = v12;
        v15 = *(unsigned int *)(MEMORY[0x1E0CA2E18] + 12);
        blockLength = 100 * v12;
        v16 = (char *)malloc_type_malloc(100 * v12, 0xB22F57A6uLL);
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
        if (v17)
        {
          v18 = v17;
          memoryBlock = v16;
          v19 = 0;
          v20 = 0;
          v68 = *MEMORY[0x1E0D06F20];
          v72 = *MEMORY[0x1E0D06A48];
          v71 = *MEMORY[0x1E0D06D58];
          v70 = *MEMORY[0x1E0D06888];
          v69 = *MEMORY[0x1E0D06890];
          v73 = *(_QWORD *)v86;
          v21 = *(_QWORD *)v86;
          v22 = v65;
          v23 = v15;
          while (1)
          {
            if (v21 != v73)
              objc_enumerationMutation(a3);
            v24 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v20);
            if ((v23 & 1) == 0)
            {
              v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * v20), "objectForKeyedSubscript:", v68);
              if (v25)
              {
                objc_msgSend(v25, "longLongValue");
                v26 = FigHostTimeToNanoseconds();
                CMTimeMake(&time, v26, 1000000000);
                CMSampleBufferGetPresentationTimeStamp(&v83, a2);
                CMTimeConvertScale((CMTime *)&time1, &time, v83.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                x = time1.origin.x;
                v23 = HIDWORD(time1.origin.y);
                y_low = LODWORD(time1.origin.y);
                v22 = time1.size.width;
              }
            }
            v27 = &memoryBlock[v19];
            v28 = (void *)objc_msgSend(v24, "objectForKeyedSubscript:", v72);
            if (v28)
            {
              *((_DWORD *)v27 + 6) = 201326592;
              *((_DWORD *)v27 + 7) = *(_DWORD *)(a1 + 292);
              *((_DWORD *)v27 + 8) = bswap32(objc_msgSend(v28, "unsignedIntValue"));
              v29 = 36;
            }
            else
            {
              v29 = 24;
            }
            v30 = (const __CFDictionary *)objc_msgSend(v24, "objectForKeyedSubscript:", v71);
            if (v30)
            {
              v31 = &v27[v29];
              *(_DWORD *)v31 = 671088640;
              *((_DWORD *)v31 + 1) = *(_DWORD *)(a1 + 296);
              memset(&time1, 0, sizeof(time1));
              if (!CGRectMakeWithDictionaryRepresentation(v30, &time1))
              {
                fig_log_get_emitter();
                FigDebugAssert3();
                v16 = memoryBlock;
                goto LABEL_65;
              }
              v32 = time1.origin.x;
              *(float *)&v33 = time1.origin.x;
              v34 = bswap32(v33);
              v35 = &v27[v29];
              *((_DWORD *)v35 + 2) = v34;
              v36.f64[0] = time1.origin.y;
              v36.f64[1] = v32 + time1.size.width;
              *(int8x8_t *)&v37 = vrev32_s8((int8x8_t)vcvt_f32_f64(v36));
              *((_QWORD *)&v37 + 1) = v37;
              *(_OWORD *)(v35 + 12) = v37;
              *(float *)&v37 = v36.f64[0] + time1.size.height;
              v38 = bswap32(v37);
              *((_DWORD *)v35 + 7) = v38;
              *((_DWORD *)v35 + 8) = v34;
              *((_DWORD *)v35 + 9) = v38;
              v29 += 40;
            }
            v39 = (void *)objc_msgSend(v24, "objectForKeyedSubscript:", v70);
            if (v39)
            {
              v40 = v19;
              v41 = v22;
              v42 = v23;
              v43 = &v27[v29];
              *(_DWORD *)v43 = 201326592;
              *((_DWORD *)v43 + 1) = *(_DWORD *)(a1 + 300);
              objc_msgSend(v39, "floatValue");
              *((_DWORD *)v43 + 2) = bswap32(v44);
              v23 = v42;
              v22 = v41;
              v19 = v40;
              v29 += 12;
            }
            v45 = (void *)objc_msgSend(v24, "objectForKeyedSubscript:", v69);
            if (v45)
            {
              v46 = &v27[v29];
              *(_DWORD *)v46 = 201326592;
              *((_DWORD *)v46 + 1) = *(_DWORD *)(a1 + 304);
              objc_msgSend(v45, "floatValue");
              *((_DWORD *)v46 + 2) = bswap32(v47);
              v29 += 12;
            }
            *(_DWORD *)v27 = bswap32(v29);
            v19 += v29;
            *((_DWORD *)v27 + 1) = *(_DWORD *)(a1 + 288);
            *((_DWORD *)v27 + 2) = bswap32(v29 - 8);
            *((_DWORD *)v27 + 3) = 1667592803;
            *((_DWORD *)v27 + 4) = bswap32(v29 - 16);
            *((_DWORD *)v27 + 5) = 1937008995;
            if (++v20 >= v18)
            {
              v48 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
              if (!v48)
              {
                obja = v22;
                v16 = memoryBlock;
                goto LABEL_45;
              }
              v18 = v48;
              v20 = 0;
            }
            v21 = *(_QWORD *)v86;
          }
        }
        v19 = 0;
        obja = v65;
        LODWORD(v23) = v15;
LABEL_45:
        v55 = v23;
        v56 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v16, blockLength, (CFAllocatorRef)*MEMORY[0x1E0C9AE10], 0, 0, v19, 0, &theBuffer))
        {
          fig_log_get_emitter();
          FigDebugAssert3();
LABEL_65:
          free(v16);
          if (theBuffer)
            CFRelease(theBuffer);
          if (cf)
            CFRelease(cf);
          return;
        }
        v11 = v62;
        v13 = v63;
        v14 = &OBJC_IVAR___BWFigVideoCaptureDevice__numAPSStatisticsSamples;
        if ((v55 & 1) != 0)
        {
          if ((*(_BYTE *)(a1 + 356) & 1) != 0)
          {
            time1.origin.x = x;
            *(_QWORD *)&time1.origin.y = __PAIR64__(v55, y_low);
            y_high = v55;
            v57 = *(_QWORD *)&obja;
            time1.size.width = obja;
            time2 = *(CMTime *)(a1 + 344);
            if (CMTimeCompare((CMTime *)&time1, &time2) > 0)
            {
              *(CGFloat *)&time2.value = x;
              time2.timescale = y_low;
              time2.flags = v55;
              *(CGFloat *)&time2.epoch = obja;
              rhs = *(CMTime *)(a1 + 344);
              CMTimeSubtract((CMTime *)&time1, &time2, &rhs);
              *(CGPoint *)(a1 + 368) = time1.origin;
              *(CGFloat *)(a1 + 384) = time1.size.width;
              goto LABEL_53;
            }
          }
          else
          {
            y_high = v55;
            v57 = *(_QWORD *)&obja;
            if ((*(_BYTE *)(a1 + 404) & 1) == 0)
            {
LABEL_53:
              *(CGFloat *)(a1 + 344) = x;
              *(_DWORD *)(a1 + 352) = y_low;
              *(_DWORD *)(a1 + 356) = y_high;
              *(_QWORD *)(a1 + 360) = v57;
              v51 = theBuffer;
LABEL_63:
              v59 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
              *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
              *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v59;
              v60 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
              v61 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
              *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E90];
              sampleTimingArray.duration.epoch = v61;
              *(CGFloat *)&sampleTimingArray.presentationTimeStamp.value = x;
              sampleTimingArray.presentationTimeStamp.timescale = y_low;
              sampleTimingArray.presentationTimeStamp.flags = y_high;
              sampleTimingArray.decodeTimeStamp.epoch = v60;
              sampleTimingArray.presentationTimeStamp.epoch = v57;
              sampleSizeArray = CMBlockBufferGetDataLength(v51);
              if (!CMSampleBufferCreate(v56, theBuffer, 1u, 0, 0, v11, 1, 1, &sampleTimingArray, 1, &sampleSizeArray, (CMSampleBufferRef *)&cf))
              {
                objc_msgSend(v66, "emitSampleBuffer:", cf);
                v16 = 0;
                *(_DWORD *)(a1 + v14[769]) = v13;
                goto LABEL_65;
              }
              fig_log_get_emitter();
              goto LABEL_75;
            }
            time1.origin.x = x;
            *(_QWORD *)&time1.origin.y = __PAIR64__(v55, y_low);
            time1.size.width = obja;
            time2 = *(CMTime *)(a1 + 392);
            if (CMTimeCompare((CMTime *)&time1, &time2) > 0)
            {
              *(_OWORD *)(a1 + 392) = *MEMORY[0x1E0CA2E18];
              *(double *)(a1 + 408) = v65;
              y_high = v55;
              v57 = *(_QWORD *)&obja;
              goto LABEL_53;
            }
          }
          fig_log_get_emitter();
        }
        else
        {
          fig_log_get_emitter();
        }
LABEL_75:
        FigDebugAssert3();
LABEL_76:
        v16 = 0;
        goto LABEL_65;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
    if (v6)
      continue;
    break;
  }
}

- (uint64_t)_renderSampleBufferForBoxedMetadataOutput:(void *)a3 withDetectedObjectsInfo:
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFArrayRef Identifiers;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  uint64_t v16;
  char v17;
  char v18;
  char v19;
  id obj;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v23 = result;
  if (result)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = *(id *)(result + 144);
    result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    v24 = result;
    if (result)
    {
      v21 = *(_QWORD *)v39;
      v4 = *MEMORY[0x1E0D064A0];
      v32 = *MEMORY[0x1E0D06478];
      v33 = *MEMORY[0x1E0D06498];
      v30 = *MEMORY[0x1E0D06488];
      v28 = *MEMORY[0x1E0D064C0];
      v27 = *MEMORY[0x1E0CA2568];
      v29 = *MEMORY[0x1E0CA2550];
      v31 = *MEMORY[0x1E0CA2548];
      v5 = *MEMORY[0x1E0CA2560];
      v6 = *MEMORY[0x1E0CA2558];
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v39 != v21)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v7);
          v26 = v7;
          Identifiers = CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)objc_msgSend((id)objc_msgSend(v25, "format"), "formatDescription"));
          v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v35 != v12)
                  objc_enumerationMutation(a3);
                v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                v15 = objc_msgSend(v14, "isEqualToString:", v4);
                v16 = v6;
                if ((v15 & 1) == 0)
                {
                  v17 = objc_msgSend(v14, "isEqualToString:", v33);
                  v16 = v5;
                  if ((v17 & 1) == 0)
                  {
                    v18 = objc_msgSend(v14, "isEqualToString:", v32);
                    v16 = v31;
                    if ((v18 & 1) == 0)
                    {
                      v19 = objc_msgSend(v14, "isEqualToString:", v30);
                      v16 = v29;
                      if ((v19 & 1) == 0)
                      {
                        if (objc_msgSend(v14, "isEqualToString:", v28))
                          v16 = v27;
                        else
                          v16 = 0;
                      }
                    }
                  }
                }
                if (-[__CFArray containsObject:](Identifiers, "containsObject:", v16))
                  objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", v14), v14);
              }
              v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            }
            while (v11);
          }
          -[BWFaceDetectionNode _renderSampleBuffer:forBoxedMetadataOutput:withDetectedObjectsInfo:](v23, a2, v25, v9);
          v7 = v26 + 1;
        }
        while (v26 + 1 != v24);
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        v24 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)_renderSampleBuffer:(void *)a3 forBoxedMetadataOutput:(void *)a4 withDetectedObjectsInfo:
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  __int128 *v18;
  CMTimeEpoch v19;
  uint64_t v20;
  const void *EmptyMetadataSample;
  uint64_t v22;
  CMTimeFlags v23;
  CMTimeEpoch v24;
  char *v25;
  int v26;
  size_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int64_t v31;
  int v32;
  _DWORD *v33;
  _DWORD *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _OWORD *v41;
  __int128 v42;
  int32_t v43;
  int64_t v44;
  __int128 v45;
  CMTimeValue v46;
  uint64_t v47;
  __int128 v48;
  CMTimeEpoch v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t blockLength;
  uint64_t v54;
  const opaqueCMFormatDescription *formatDescription;
  uint64_t v57;
  uint64_t v58;
  CMTimeEpoch epoch;
  CMTimeFlags flags;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  size_t sampleSizeArray;
  CMSampleTimingInfo sampleTimingArray;
  __int128 v70;
  CMTimeEpoch v71;
  CMTime v72;
  CMTime v73;
  CMTime v74;
  CMTime rhs;
  CMTime lhs;
  CMTime time2;
  CMTime v78;
  CMTime v79;
  CMTime v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  CMTime v85;
  CMTime time;
  CMTime time1;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  CFTypeRef cf;
  CMBlockBufferRef theBuffer;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  formatDescription = (const opaqueCMFormatDescription *)objc_msgSend((id)objc_msgSend(a3, "format"), "formatDescription");
  v67 = a1;
  v57 = objc_msgSend(*(id *)(a1 + 280), "objectForKeyedSubscript:", a3);
  theBuffer = 0;
  cf = 0;
  value = *MEMORY[0x1E0CA2E18];
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v93;
    v11 = *MEMORY[0x1E0D064A0];
    v12 = *MEMORY[0x1E0D064D0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v93 != v10)
          objc_enumerationMutation(a4);
        v14 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "isEqualToString:", v11);
        v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", v14), "objectForKeyedSubscript:", v12), "count");
        if (v15)
          v17 = 0;
        else
          v17 = v16;
        v8 += v17;
        if (v15)
          v9 = v16;
      }
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v18 = (__int128 *)MEMORY[0x1E0CA2E18];
  v19 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  if (v9 + v8)
  {
    blockLength = 76 * v8 + 100 * v9;
    v54 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v25 = (char *)malloc_type_malloc(blockLength, 0xE1FE03E5uLL);
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v62 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
    if (v62)
    {
      v26 = 0;
      v27 = 0;
      flags = *((_DWORD *)v18 + 3);
      v65 = *(_QWORD *)v89;
      v63 = *MEMORY[0x1E0D064A0];
      v64 = *MEMORY[0x1E0D06F20];
      v58 = *MEMORY[0x1E0D064D0];
      epoch = v19;
      while (2)
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v89 != v65)
            objc_enumerationMutation(a4);
          v29 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v28);
          v30 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", v29), "objectForKeyedSubscript:", v64);
          if (v30)
          {
            objc_msgSend(v30, "longLongValue");
            v31 = FigHostTimeToNanoseconds();
            CMTimeMake(&time, v31, 1000000000);
            CMSampleBufferGetPresentationTimeStamp(&v85, a2);
            CMTimeConvertScale(&time1, &time, v85.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
            value = time1.value;
            flags = time1.flags;
            timescale = time1.timescale;
            epoch = time1.epoch;
          }
          v66 = v28;
          v32 = objc_msgSend(v29, "isEqualToString:", v63);
          v33 = (_DWORD *)-[BWFaceDetectionNode localIDsForKey:](v67, v29);
          if (*v33)
          {
            v34 = v33;
            v35 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", v29), "objectForKeyedSubscript:", v58);
            v81 = 0u;
            v82 = 0u;
            v83 = 0u;
            v84 = 0u;
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v81, v98, 16);
            if (v36)
            {
              v37 = v36;
              v38 = *(_QWORD *)v82;
LABEL_37:
              v39 = 0;
              v26 += v37;
              while (1)
              {
                if (*(_QWORD *)v82 != v38)
                  objc_enumerationMutation(v35);
                v40 = -[BWFaceDetectionNode append:toBoxedData:localIDs:isFace:](v67, *(void **)(*((_QWORD *)&v81 + 1) + 8 * v39), &v25[v27], v34, v32);
                if (!v40)
                  goto LABEL_53;
                v27 += v40;
                if (v37 == ++v39)
                {
                  v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v81, v98, 16);
                  if (v37)
                    goto LABEL_37;
                  break;
                }
              }
            }
          }
          v28 = v66 + 1;
        }
        while (v66 + 1 != v62);
        v62 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
        if (v62)
          continue;
        break;
      }
      v41 = (_OWORD *)MEMORY[0x1E0CA2E18];
      if (v27)
      {
        if (!CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v25, blockLength, (CFAllocatorRef)*MEMORY[0x1E0C9AE10], 0, 0, v27, 0, &theBuffer))
        {
          v20 = v57;
          v23 = flags;
          if ((flags & 1) != 0)
          {
            v24 = epoch;
            if (!v57)
              goto LABEL_68;
            if ((*(_BYTE *)(v57 + 20) & 1) != 0)
            {
              v51 = *(_OWORD *)(v57 + 8);
              v80.epoch = *(_QWORD *)(v57 + 24);
              *(_OWORD *)&v80.value = v51;
              time1.value = value;
              time1.timescale = timescale;
              time1.flags = flags;
              time1.epoch = epoch;
              if (CMTimeCompare(&time1, &v80) > 0)
              {
                v52 = *(_OWORD *)(v57 + 8);
                v78.epoch = *(_QWORD *)(v57 + 24);
                *(_OWORD *)&v78.value = v52;
                time1.value = value;
                time1.timescale = timescale;
                time1.flags = flags;
                time1.epoch = epoch;
                CMTimeSubtract(&v79, &time1, &v78);
                *(CMTime *)(v57 + 32) = v79;
                goto LABEL_78;
              }
            }
            else
            {
              if ((*(_BYTE *)(v57 + 68) & 1) == 0)
              {
LABEL_78:
                *(_QWORD *)(v57 + 8) = value;
                *(_DWORD *)(v57 + 16) = timescale;
                *(_DWORD *)(v57 + 20) = flags;
                v47 = 24;
                goto LABEL_67;
              }
              time2 = *(CMTime *)(v57 + 56);
              time1.value = value;
              time1.timescale = timescale;
              time1.flags = flags;
              time1.epoch = epoch;
              if (CMTimeCompare(&time1, &time2) > 0)
              {
                *(_OWORD *)(v57 + 56) = *v41;
                *(_QWORD *)(v57 + 72) = v54;
                goto LABEL_78;
              }
            }
          }
          fig_log_get_emitter();
          goto LABEL_80;
        }
      }
    }
LABEL_53:
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    v20 = v57;
    if (v57)
    {
      if (!*(_DWORD *)(v57 + 80) && ((*(_BYTE *)(v67 + 332) & 1) == 0 || (*(_BYTE *)(v57 + 68) & 1) != 0))
        return;
    }
    else if ((*(_BYTE *)(v67 + 332) & 1) == 0)
    {
      return;
    }
    EmptyMetadataSample = (const void *)-[BWFaceDetectionNode _getEmptyMetadataSampleData](v67);
    if (EmptyMetadataSample)
    {
      theBuffer = (CMBlockBufferRef)CFRetain(EmptyMetadataSample);
      if (!theBuffer)
        goto LABEL_81;
      if (v57)
      {
        if ((*(_BYTE *)(v57 + 44) & 1) != 0)
        {
          v42 = *(_OWORD *)(v57 + 8);
          lhs.epoch = *(_QWORD *)(v57 + 24);
          *(_OWORD *)&lhs.value = v42;
          rhs = *(CMTime *)(v57 + 32);
          CMTimeAdd(&time1, &lhs, &rhs);
          value = time1.value;
          v23 = time1.flags;
          timescale = time1.timescale;
          v24 = time1.epoch;
          v70 = *v18;
          v71 = v19;
          goto LABEL_66;
        }
        v22 = v67 + 320;
        if ((*(_BYTE *)(v67 + 332) & 1) != 0 && (*(_BYTE *)(v57 + 20) & 1) == 0 && (*(_BYTE *)(v57 + 68) & 1) == 0)
          goto LABEL_26;
        memset(&time1, 0, sizeof(time1));
        v43 = *(_DWORD *)(v57 + 16);
        v44 = v43 / 240;
      }
      else
      {
        v22 = v67 + 320;
        if ((*(_BYTE *)(v67 + 332) & 1) != 0)
        {
LABEL_26:
          value = *(_QWORD *)v22;
          v23 = *(_DWORD *)(v22 + 12);
          timescale = *(_DWORD *)(v22 + 8);
          v24 = *(_QWORD *)(v22 + 16);
          goto LABEL_65;
        }
        v44 = 0;
        v43 = 0;
        memset(&time1, 0, sizeof(time1));
      }
      CMTimeMake(&time1, v44, v43);
      if (!time1.value)
        time1.value = 1;
      if (v57)
      {
        v45 = *(_OWORD *)(v57 + 8);
        v73.epoch = *(_QWORD *)(v57 + 24);
        *(_OWORD *)&v73.value = v45;
      }
      else
      {
        memset(&v73, 0, sizeof(v73));
      }
      v72 = time1;
      CMTimeAdd(&v74, &v73, &v72);
      value = v74.value;
      v23 = v74.flags;
      timescale = v74.timescale;
      v24 = v74.epoch;
LABEL_65:
      v70 = *v18;
      v71 = v19;
      if (!v57)
      {
        v26 = 0;
LABEL_68:
        v48 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
        *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
        *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v48;
        v49 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
        v50 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
        *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E90];
        sampleTimingArray.duration.epoch = v50;
        sampleTimingArray.presentationTimeStamp.value = value;
        sampleTimingArray.presentationTimeStamp.timescale = timescale;
        sampleTimingArray.presentationTimeStamp.flags = v23;
        sampleTimingArray.decodeTimeStamp.epoch = v49;
        sampleTimingArray.presentationTimeStamp.epoch = v24;
        sampleSizeArray = CMBlockBufferGetDataLength(theBuffer);
        if (!CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theBuffer, 1u, 0, 0, formatDescription, 1, 1, &sampleTimingArray, 1, &sampleSizeArray, (CMSampleBufferRef *)&cf))
        {
          objc_msgSend(a3, "emitSampleBuffer:", cf);
          if (v20)
          {
            v25 = 0;
            *(_DWORD *)(v20 + 80) = v26;
            goto LABEL_71;
          }
LABEL_81:
          v25 = 0;
          goto LABEL_71;
        }
        fig_log_get_emitter();
LABEL_80:
        FigDebugAssert3();
        goto LABEL_81;
      }
LABEL_66:
      v26 = 0;
      *(_OWORD *)(v57 + 8) = v70;
      *(_QWORD *)(v57 + 24) = v71;
      *(_OWORD *)(v57 + 32) = *v18;
      v46 = value;
      *(_QWORD *)(v57 + 48) = v19;
      *(_QWORD *)(v57 + 56) = v46;
      v47 = 72;
      *(_DWORD *)(v57 + 64) = timescale;
      *(_DWORD *)(v57 + 68) = v23;
LABEL_67:
      *(_QWORD *)(v20 + v47) = v24;
      goto LABEL_68;
    }
    v25 = 0;
    theBuffer = 0;
  }
LABEL_71:
  free(v25);
  if (theBuffer)
    CFRelease(theBuffer);
  if (cf)
    CFRelease(cf);
}

- (uint64_t)localIDsForKey:(uint64_t)result
{
  uint64_t v3;
  int *v4;

  if (result)
  {
    v3 = result;
    if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D064A0]) & 1) != 0)
    {
      v4 = &OBJC_IVAR___BWFaceDetectionNode__localIDsForFaces_BE;
    }
    else if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D06498]) & 1) != 0)
    {
      v4 = &OBJC_IVAR___BWFaceDetectionNode__localIDsForDetectedHumanBodies_BE;
    }
    else if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D06488]) & 1) != 0)
    {
      v4 = &OBJC_IVAR___BWFaceDetectionNode__localIDsForDetectedDogBodies_BE;
    }
    else if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D06478]) & 1) != 0)
    {
      v4 = &OBJC_IVAR___BWFaceDetectionNode__localIDsForDetectedCatBodies_BE;
    }
    else
    {
      if (!objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D064C0]))
        return 0;
      v4 = &OBJC_IVAR___BWFaceDetectionNode__localIDsForDetectedSalientObjects_BE;
    }
    return v3 + *v4;
  }
  return result;
}

- (uint64_t)append:(_DWORD *)a3 toBoxedData:(_DWORD *)a4 localIDs:(int)a5 isFace:
{
  _QWORD *v10;
  void *v11;
  int v12;
  uint64_t v13;
  const __CFDictionary *v14;
  int v15;
  _DWORD *v16;
  float64x2_t v17;
  unsigned int v18;
  double height;
  CGFloat v20;
  unsigned int v21;
  _DWORD *v22;
  __int128 v23;
  unsigned int v24;
  void *v25;
  int v26;
  _DWORD *v27;
  unsigned int v28;
  void *v29;
  int v30;
  _DWORD *v31;
  unsigned int v32;
  CGRect rect;

  if (!a1)
    return 0;
  v10 = (_QWORD *)MEMORY[0x1E0D06A48];
  if (!a5)
    v10 = (_QWORD *)MEMORY[0x1E0D06460];
  v11 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *v10);
  if (v11)
  {
    v12 = a4[1];
    a3[6] = 201326592;
    a3[7] = v12;
    a3[8] = bswap32(objc_msgSend(v11, "unsignedIntValue"));
    v13 = 9;
  }
  else
  {
    v13 = 6;
  }
  v14 = (const __CFDictionary *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D58]);
  if (!v14)
    goto LABEL_10;
  v15 = a4[2];
  v16 = &a3[v13];
  *v16 = 671088640;
  v16[1] = v15;
  memset(&rect, 0, sizeof(rect));
  if (!CGRectMakeWithDictionaryRepresentation(v14, &rect))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v17.f64[0] = rect.origin.y;
  *(float *)&v18 = rect.origin.x;
  height = rect.size.height;
  v20 = rect.origin.x + rect.size.width;
  v21 = bswap32(v18);
  v22 = &a3[v13];
  v22[2] = v21;
  v17.f64[1] = v20;
  *(int8x8_t *)&v23 = vrev32_s8((int8x8_t)vcvt_f32_f64(v17));
  *((_QWORD *)&v23 + 1) = v23;
  *(_OWORD *)(v22 + 3) = v23;
  *(float *)&v23 = v17.f64[0] + height;
  v24 = bswap32(v23);
  v22[7] = v24;
  v22[8] = v21;
  v22[9] = v24;
  v13 += 10;
LABEL_10:
  if (a5)
  {
    v25 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06888]);
    if (v25)
    {
      v26 = a4[3];
      v27 = &a3[v13];
      *v27 = 201326592;
      v27[1] = v26;
      objc_msgSend(v25, "floatValue");
      v27[2] = bswap32(v28);
      v13 += 3;
    }
    v29 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06890]);
    if (v29)
    {
      v30 = a4[4];
      v31 = &a3[v13];
      *v31 = 201326592;
      v31[1] = v30;
      objc_msgSend(v29, "floatValue");
      v31[2] = bswap32(v32);
      v13 += 3;
    }
  }
  *a3 = bswap32(v13 * 4);
  a3[1] = *a4;
  a3[2] = bswap32(v13 * 4 - 8);
  a3[3] = *(_DWORD *)(a1 + 420);
  a3[4] = bswap32(v13 * 4 - 16);
  a3[5] = *(_DWORD *)(a1 + 424);
  return v13 * 4;
}

- (uint64_t)_getEmptyMetadataSampleData
{
  uint64_t v1;
  char *dataPointerOut;

  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 312))
    {
      if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 8uLL, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 8uLL, 1u, (CMBlockBufferRef *)(result + 312)))
      {
        fig_log_get_emitter();
      }
      else
      {
        dataPointerOut = 0;
        if (!CMBlockBufferGetDataPointer(*(CMBlockBufferRef *)(v1 + 312), 0, 0, 0, &dataPointerOut))
        {
          *(_QWORD *)dataPointerOut = 0x8000000;
          return *(_QWORD *)(v1 + 312);
        }
        fig_log_get_emitter();
      }
      FigDebugAssert3();
    }
    return *(_QWORD *)(v1 + 312);
  }
  return result;
}

- (NSArray)boxedMetadataOutputs
{
  return self->_boxedMetadataOutputs;
}

@end
