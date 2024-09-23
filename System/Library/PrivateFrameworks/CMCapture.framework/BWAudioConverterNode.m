@implementation BWAudioConverterNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWAudioConverterNode)init
{
  BWAudioConverterNode *v2;
  BWNodeInput *v3;
  BWNodeOutput *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWAudioConverterNode;
  v2 = -[BWNode init](&v6, sel_init);
  if (v2)
  {
    v3 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1936684398, v2);
    -[BWNode addInput:](v2, "addInput:", v3);

    v4 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1936684398, v2);
    -[BWNode addOutput:](v2, "addOutput:", v4);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BWAudioConverterNode _teardownAudioCompressionSBP]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)BWAudioConverterNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)_teardownAudioCompressionSBP
{
  uint64_t v2;
  void (*v3)(uint64_t);
  const void *v4;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 104);
    if (v2)
    {
      v3 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
      if (v3)
        v3(v2);
      v4 = *(const void **)(a1 + 104);
      if (v4)
      {
        CFRelease(v4);
        *(_QWORD *)(a1 + 104) = 0;
      }
    }
  }
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("AudioConverter");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", +[BWAudioFormat formatForAVAudioSettings:inputFormat:](BWAudioFormat, "formatForAVAudioSettings:inputFormat:", self->_settings, a3));
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  objc_super v9;

  if (a4)
  {
    -[BWNodeOutput setFormat:](self->super._output, "setFormat:", +[BWAudioFormat formatForAVAudioSettings:inputFormat:](BWAudioFormat, "formatForAVAudioSettings:inputFormat:", self->_settings, a4));
    if (self->_settings)
      -[BWAudioConverterNode _setupAudioCompressionSBPForInputFormat:]((uint64_t)self, a4);
  }
  v9.receiver = self;
  v9.super_class = (Class)BWAudioConverterNode;
  -[BWNode configurationWithID:updatedFormat:didBecomeLiveForInput:](&v9, sel_configurationWithID_updatedFormat_didBecomeLiveForInput_, a3, a4, a5);
}

- (uint64_t)_setupAudioCompressionSBPForInputFormat:(uint64_t)a1
{
  uint64_t v2;
  void *v5;
  const opaqueCMFormatDescription *v6;
  void *v7;
  const opaqueCMFormatDescription *v8;
  uint64_t v9;
  CMAudioFormatDescriptionRef v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, _QWORD, uint64_t);
  uint64_t v14;
  uint64_t FigBaseObject;
  uint64_t (*v16)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  CFTypeRef cf;
  size_t sizeOut;
  CMAudioFormatDescriptionRef desc;

  if (!a1)
    return 0;
  desc = 0;
  if (*(_QWORD *)(a1 + 104))
  {
    fig_log_get_emitter();
    v20 = v2;
    LODWORD(v19) = 0;
    FigDebugAssert3();
  }
  v5 = (void *)objc_msgSend(*(id *)(a1 + 16), "format", v19, v20);
  v6 = (const opaqueCMFormatDescription *)objc_msgSend(v5, "formatDescription");
  CMAudioFormatDescriptionGetStreamBasicDescription(v6);
  sizeOut = 0;
  CMAudioFormatDescriptionGetChannelLayout(v6, &sizeOut);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", objc_msgSend(v5, "audioCompressionSBPOptions"));
  v8 = (const opaqueCMFormatDescription *)objc_msgSend(a2, "formatDescription");
  if (*(_BYTE *)(a1 + 112))
  {
    v9 = -[BWAudioConverterNode createFormatDescriptionWithAudioExtension:withMagicCookie:outputFormatDescription:](a1, v8, 0, &desc);
    v10 = desc;
    if ((_DWORD)v9 || !desc)
      goto LABEL_22;
    CMAudioFormatDescriptionGetChannelLayout(desc, &sizeOut);
    if (-[BWAudioConverterNode _isAPACConversion]((const AudioStreamBasicDescription *)a1))
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E49F9198, *MEMORY[0x1E0CC3DA8]);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E49F91B0, *MEMORY[0x1E0CC3DC8]);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E49F91C8, *MEMORY[0x1E0CC3DC0]);
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = FigSampleBufferProcessorCreateWithAudioCompression();
  if ((_DWORD)v11)
  {
    v9 = v11;
    fig_log_get_emitter();
    goto LABEL_23;
  }
  v12 = *(_QWORD *)(a1 + 104);
  v13 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v13)
  {
    v9 = 4294954514;
LABEL_22:
    fig_log_get_emitter();
    goto LABEL_23;
  }
  v14 = v13(v12, acn_sampleBufferProcessorOutputCallback, a1);
  if ((_DWORD)v14)
  {
    v9 = v14;
    goto LABEL_22;
  }
  if (!*(_BYTE *)(a1 + 112)
    || !-[BWAudioConverterNode _isAPACConversion]((const AudioStreamBasicDescription *)a1))
  {
LABEL_20:
    v9 = 0;
    goto LABEL_24;
  }
  cf = 0;
  FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
  v16 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v16)
  {
    v17 = v16(FigBaseObject, *MEMORY[0x1E0CC5E20], 0, &cf);
    if (!(_DWORD)v17)
    {
      objc_msgSend(*(id *)(a1 + 16), "setFormat:", +[BWAudioFormat formatWithAudioFormatDescription:](BWAudioFormat, "formatWithAudioFormatDescription:", cf));
      if (cf)
        CFRelease(cf);
      goto LABEL_20;
    }
    v9 = v17;
  }
  else
  {
    v9 = 4294954514;
  }
  fig_log_get_emitter();
LABEL_23:
  FigDebugAssert3();
LABEL_24:

  if (v10)
    CFRelease(v10);
  return v9;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v5;

  -[BWAudioConverterNode _teardownAudioCompressionSBP]((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)BWAudioConverterNode;
  -[BWNode didReachEndOfDataForInput:](&v5, sel_didReachEndOfDataForInput_, a3);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  _DWORD *v6;
  OpaqueFigSampleBufferProcessor *audioCompressionSBP;
  unsigned int (*v8)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *);
  void *v9;
  OpaqueFigSampleBufferProcessor *v10;
  void (*v11)(OpaqueFigSampleBufferProcessor *);
  uint64_t FigBaseObject;
  unsigned int (*v13)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  void *v14;
  CFTypeRef value;

  v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  value = 0;
  if (!a3)
    goto LABEL_9;
  if (CMSampleBufferGetDataBuffer(a3) || CMSampleBufferGetImageBuffer(a3))
  {
    audioCompressionSBP = self->_audioCompressionSBP;
    if (!audioCompressionSBP
      || (v8 = *(unsigned int (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16)) == 0
      || v8(audioCompressionSBP, a3))
    {
LABEL_9:
      fig_log_get_emitter();
LABEL_10:
      FigDebugAssert3();
    }
  }
  else
  {
    v9 = (void *)CMGetAttachment(a3, CFSTR("FileWriterAction"), 0);
    if ((objc_msgSend(v9, "isEqualToString:", 0x1E495A098) & 1) != 0
      || objc_msgSend(v9, "isEqualToString:", 0x1E495A0F8))
    {
      v10 = self->_audioCompressionSBP;
      if (v10)
      {
        v11 = *(void (**)(OpaqueFigSampleBufferProcessor *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
        if (v11)
          v11(v10);
        if (self->_cinematicAudioCapture
          && -[BWAudioConverterNode _isAPACConversion]((const AudioStreamBasicDescription *)self))
        {
          FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
          v13 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 8)
                                                                                    + 48);
          if (!v13 || v13(FigBaseObject, *MEMORY[0x1E0CC5E20], 0, &value))
          {
            fig_log_get_emitter();
            goto LABEL_10;
          }
          CMSetAttachment(a3, CFSTR("TrackFormatDescription"), value, 1u);
          -[BWAudioConverterNode _resetAudioCompressionSBP]((uint64_t)self);
        }
      }
    }
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
    v14 = (void *)CMGetAttachment(a3, CFSTR("RecordingSettings"), 0);
    if (v14)
      -[BWAudioConverterNode _handleUpdatedRecordingSettings:]((uint64_t)self, v14);
  }
  if (value)
    CFRelease(value);
  if (*v6 == 1)
    kdebug_trace();
}

- (const)_isAPACConversion
{
  AudioFormatID mFormatID;

  if (result)
  {
    result = CMAudioFormatDescriptionGetStreamBasicDescription((CMAudioFormatDescriptionRef)objc_msgSend((id)objc_msgSend(*(id *)&result->mBytesPerPacket, "format"), "formatDescription"));
    if (result)
    {
      mFormatID = result->mFormatID;
      return (const AudioStreamBasicDescription *)(mFormatID == 1634754915
                                                || mFormatID == 1902211171
                                                || mFormatID == 1667330147);
    }
  }
  return result;
}

- (uint64_t)_resetAudioCompressionSBP
{
  uint64_t v1;
  const void *v2;

  if (result)
  {
    v1 = result;
    v2 = *(const void **)(result + 104);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(v1 + 104) = 0;
    }
    return -[BWAudioConverterNode _setupAudioCompressionSBPForInputFormat:](v1, (void *)objc_msgSend(*(id *)(v1 + 8), "format"));
  }
  return result;
}

- (void)_handleUpdatedRecordingSettings:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  BWAudioFormat *v7;
  BWAudioFormat *v8;
  CMAudioFormatDescriptionRef v9;
  CMAudioFormatDescriptionRef v10;

  if (a1)
  {
    v10 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (*(_BYTE *)(a1 + 112))
      {
        v4 = (void *)objc_msgSend(a2, "cinematicAudioSettings");
        goto LABEL_7;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        return;
    }
    v4 = (void *)objc_msgSend(a2, "audioSettings");
LABEL_7:
    v5 = v4;
    if (!v4)
      return;
    if (*(_QWORD *)(a1 + 96))
    {
      if ((objc_msgSend(v4, "isEqual:") & 1) != 0)
      {
        if (*(_QWORD *)(a1 + 96))
          return;
      }
      else
      {
        -[BWAudioConverterNode _teardownAudioCompressionSBP](a1);

        *(_QWORD *)(a1 + 96) = 0;
      }
    }
    *(_QWORD *)(a1 + 96) = v5;
    v6 = (void *)objc_msgSend(*(id *)(a1 + 8), "format");
    v7 = +[BWAudioFormat formatForAVAudioSettings:inputFormat:](BWAudioFormat, "formatForAVAudioSettings:inputFormat:", *(_QWORD *)(a1 + 96), v6);
    v8 = v7;
    if (*(_BYTE *)(a1 + 112))
    {
      if (-[BWAudioConverterNode createFormatDescriptionWithAudioExtension:withMagicCookie:outputFormatDescription:](a1, -[BWAudioFormat audioFormatDescription](v7, "audioFormatDescription"), 0, &v10))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v9 = v10;
        if (!v10)
          return;
LABEL_18:
        CFRelease(v9);
        return;
      }
      v9 = v10;
      v8 = +[BWAudioFormat formatWithAudioFormatDescription:](BWAudioFormat, "formatWithAudioFormatDescription:", v10);
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(*(id *)(a1 + 16), "setFormat:", v8);
    -[BWAudioConverterNode _setupAudioCompressionSBPForInputFormat:](a1, v6);
    if (!v9)
      return;
    goto LABEL_18;
  }
}

- (void)acquireHardware
{
  if (self->_audioCompressionSBP)
    FigSampleBufferProcessorAcquireHardware();
}

- (void)relinquishHardware
{
  if (self->_audioCompressionSBP)
    FigSampleBufferProcessorRelinquishHardware();
}

- (NSDictionary)gaplessPlaybackInfo
{
  OpaqueFigSampleBufferProcessor *audioCompressionSBP;
  uint64_t FigBaseObject;
  void (*v4)(uint64_t, _QWORD, _QWORD, OpaqueFigSampleBufferProcessor **);
  OpaqueFigSampleBufferProcessor *v6;

  v6 = 0;
  audioCompressionSBP = self->_audioCompressionSBP;
  if (audioCompressionSBP)
  {
    FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    v4 = *(void (**)(uint64_t, _QWORD, _QWORD, OpaqueFigSampleBufferProcessor **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                           + 48);
    if (v4)
    {
      v4(FigBaseObject, *MEMORY[0x1E0CC5E28], 0, &v6);
      audioCompressionSBP = v6;
    }
    else
    {
      audioCompressionSBP = 0;
    }
  }
  return (NSDictionary *)audioCompressionSBP;
}

- (void)setSettings:(id)a3
{
  NSDictionary *settings;

  settings = self->_settings;
  if (settings != a3)
  {

    self->_settings = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (id)settings
{
  return self->_settings;
}

- (void)setCinematicAudioCapture:(BOOL)a3
{
  self->_cinematicAudioCapture = a3;
}

- (BOOL)isCinematicAudioCapture
{
  return self->_cinematicAudioCapture;
}

- (uint64_t)createFormatDescriptionWithAudioExtension:(const __CFData *)a3 withMagicCookie:(CMAudioFormatDescriptionRef *)a4 outputFormatDescription:
{
  const __CFDictionary *Extensions;
  const __CFAllocator *v8;
  CFDataRef v9;
  const void **v10;
  const __CFDictionary *Value;
  const void *v12;
  const void *v13;
  CFTypeID v14;
  __CFDictionary *Mutable;
  CFTypeID v16;
  uint64_t v17;
  __CFDictionary *v18;
  __CFDictionary *v19;
  const void *v20;
  const __CFDictionary *v21;
  const __CFDictionary *v22;
  CFTypeID v23;
  const __CFDictionary *MutableCopy;
  const __CFArray *v25;
  const __CFArray *v26;
  CFTypeID v27;
  CFMutableArrayRef v28;
  CFTypeID v29;
  __CFArray *v30;
  const AudioStreamBasicDescription *StreamBasicDescription;
  const AudioChannelLayout *ChannelLayout;
  size_t Length;
  size_t sizeOut;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  UInt8 bytes[8];
  int v38;

  if (!a1)
    return 0;
  formatDescriptionOut = 0;
  Extensions = CMFormatDescriptionGetExtensions(desc);
  v8 = CFGetAllocator(desc);
  sizeOut = 0;
  *(_QWORD *)bytes = 0x1000100616E6963;
  v38 = 0x1000000;
  v9 = CFDataCreate(0, bytes, 12);
  v10 = (const void **)MEMORY[0x1E0CA2240];
  if (!Extensions)
  {
    Mutable = CFDictionaryCreateMutable(v8, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    goto LABEL_14;
  }
  Value = (const __CFDictionary *)CFDictionaryGetValue(Extensions, (const void *)*MEMORY[0x1E0CA2240]);
  if (Value)
  {
    v12 = CFDictionaryGetValue(Value, CFSTR("ngst"));
    if (v12)
    {
      v13 = v12;
      v14 = CFGetTypeID(v12);
      if (v14 == CFArrayGetTypeID())
      {
        if (!FigCFArrayContainsValue())
          goto LABEL_13;
      }
      else
      {
        v16 = CFGetTypeID(v13);
        if (v16 != CFDataGetTypeID() || !CFEqual(v13, v9))
          goto LABEL_13;
      }
      v17 = 0;
      v18 = 0;
      v19 = 0;
      if (!v9)
        goto LABEL_40;
      goto LABEL_39;
    }
  }
LABEL_13:
  Mutable = CFDictionaryCreateMutableCopy(v8, 0, Extensions);
LABEL_14:
  v18 = Mutable;
  if (!Mutable)
  {
    v19 = 0;
    v17 = 4294967246;
    if (!v9)
      goto LABEL_40;
    goto LABEL_39;
  }
  CFDictionaryRemoveValue(Mutable, (const void *)*MEMORY[0x1E0CA2278]);
  CFDictionaryRemoveValue(v18, (const void *)*MEMORY[0x1E0CA2270]);
  v20 = *v10;
  v21 = (const __CFDictionary *)CFDictionaryGetValue(v18, *v10);
  if (v21)
  {
    v22 = v21;
    v23 = CFGetTypeID(v21);
    if (v23 != CFDictionaryGetTypeID())
    {
      v19 = 0;
      goto LABEL_34;
    }
    MutableCopy = CFDictionaryCreateMutableCopy(v8, 0, v22);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutable(v8, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  }
  v19 = MutableCopy;
  if (!MutableCopy)
    goto LABEL_34;
  v25 = (const __CFArray *)CFDictionaryGetValue(MutableCopy, CFSTR("ngst"));
  if (v25)
  {
    v26 = v25;
    v27 = CFGetTypeID(v25);
    if (v27 == CFArrayGetTypeID())
    {
      v28 = CFArrayCreateMutableCopy(v8, 0, v26);
    }
    else
    {
      v29 = CFGetTypeID(v26);
      if (v29 != CFDataGetTypeID())
      {
        v30 = 0;
LABEL_31:
        CFArrayAppendValue(v30, v9);
        CFDictionarySetValue(v19, CFSTR("ngst"), v30);
        if (v30)
          CFRelease(v30);
        goto LABEL_33;
      }
      v28 = CFArrayCreateMutable(v8, 0, MEMORY[0x1E0C9B378]);
    }
    v30 = v28;
    goto LABEL_31;
  }
  CFDictionaryAddValue(v19, CFSTR("ngst"), v9);
LABEL_33:
  CFDictionarySetValue(v18, v20, v19);
LABEL_34:
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(desc);
  ChannelLayout = CMAudioFormatDescriptionGetChannelLayout(desc, &sizeOut);
  if (a3)
    Length = CFDataGetLength(a3);
  else
    Length = 0;
  v17 = CMAudioFormatDescriptionCreate(v8, StreamBasicDescription, sizeOut, ChannelLayout, Length, a3, v18, &formatDescriptionOut);
  if ((_DWORD)v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    if (!v9)
      goto LABEL_40;
    goto LABEL_39;
  }
  *a4 = formatDescriptionOut;
  formatDescriptionOut = 0;
  if (v9)
LABEL_39:
    CFRelease(v9);
LABEL_40:
  if (v19)
    CFRelease(v19);
  if (v18)
    CFRelease(v18);
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  return v17;
}

@end
