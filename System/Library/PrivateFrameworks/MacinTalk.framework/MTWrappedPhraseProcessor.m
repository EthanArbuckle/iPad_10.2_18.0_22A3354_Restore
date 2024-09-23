@implementation MTWrappedPhraseProcessor

- (MTWrappedPhraseProcessor)initWithVoice:(id)a3 frontend:(id)a4
{
  id v6;
  id v7;
  MTWrappedPhraseProcessor *v8;
  MTWrappedPhraseProcessor *v9;
  NSNumber *pitchModulation;
  MTBEPersistentParam *v11;
  uint64_t v12;
  AVAudioFormat *format;
  __CFBundle *v14;
  const __CFURL *v15;
  __CFReadStream *v16;
  __CFReadStream *v17;
  SLDictLookup *v18;
  const __CFLocale *v19;
  id WeakRetained;
  MTFBlockNotifier *v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  MTBENotifier *v30;
  MTBENotifier *v31;
  _BYTE v33[1310];
  _BYTE v34[354];
  objc_super v35;

  v6 = a3;
  v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)MTWrappedPhraseProcessor;
  v8 = -[MTWrappedPhraseProcessor init](&v35, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_voice, v6);
    v9->_currentSampleCount = 0;
    pitchModulation = v9->_pitchModulation;
    v9->_pitchModulation = (NSNumber *)&unk_1E936F188;

    objc_storeStrong((id *)&v9->_frontend, a4);
    v11 = (MTBEPersistentParam *)operator new();
    MTBEPersistentParam::MTBEPersistentParam(v11);
    v9->_fPParams = v11;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initWithStreamDescription:", &macinTalkOutputFormat);
    format = v9->_format;
    v9->_format = (AVAudioFormat *)v12;

    v14 = (__CFBundle *)SLGetSpeechDictionaryBundle();
    if (v14)
    {
      v15 = CFBundleCopyResourceURL(v14, CFSTR("HomophonesEng"), 0, 0);
      if (v15)
      {
        v16 = CFReadStreamCreateWithFile(0, v15);
        v17 = v16;
        if (v16)
        {
          CFReadStreamOpen(v16);
          v9->_fPParams->var6 = (__CFDictionary *)CFPropertyListCreateWithStream(0, v17, 0, 0, 0, 0);
          CFRelease(v17);
        }
        CFRelease(v15);
      }
    }
    v18 = (SLDictLookup *)objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v9->_fPParams->var13 = (SLDictLookup *)SLDictLookup::Create(v18, v19);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_voice);
    objc_msgSend(WeakRetained, "pitchCoeff");
    v9->_fPParams->var12 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();

    v21 = (MTFBlockNotifier *)operator new();
    MTFBlockNotifier::MTFBlockNotifier(v21, v9);
    if (*(_DWORD *)(objc_msgSend(v6, "description") + 4) == 1734437985
      || *(_DWORD *)(objc_msgSend(v6, "description") + 4) == 1835364215)
    {
      v22 = objc_msgSend(v6, "privateData");
      v24 = MTPBVoice::MTPBVoice(v34, v22, v23);
      MTBEParam::MTBEParam(v33, 1, v34, 0, 0, v24);
    }
    else
    {
      v25 = objc_msgSend(v6, "privateData");
      MTBEParam::MTBEParam(v33, 0, v25, 0, 0, v26);
    }
    *((_DWORD *)v21 + 2) = MTBEParam::GetRate((MTBEParam *)v33) << 16;
    *((_DWORD *)v21 + 3) = 3072 * MTBEParam::GetPitch((MTBEParam *)v33) + 2054400;
    v27 = (void *)MEMORY[0x1E0CB37E8];
    *(float *)&v28 = (float)MTBEParam::GetModulation((MTBEParam *)v33) * 0.000015259;
    objc_msgSend(v27, "numberWithFloat:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTWrappedPhraseProcessor setDefaultModulation:](v9, "setDefaultModulation:", v29);

    *((_DWORD *)v21 + 4) = MTBEParam::GetModulation((MTBEParam *)v33);
    *((_DWORD *)v21 + 5) = MTBEParam::GetVolume((MTBEParam *)v33);
    -[MTWrappedPhraseProcessor setNotifier:](v9, "setNotifier:", v21);
    v30 = (MTBENotifier *)operator new();
    MTBENotifier::MTBENotifier(v30);
    -[MTWrappedPhraseProcessor setResetState:](v9, "setResetState:", v30);
    v31 = (MTBENotifier *)operator new();
    MTBENotifier::MTBENotifier(v31);
    -[MTWrappedPhraseProcessor setSaveState:](v9, "setSaveState:", v31);
  }

  return v9;
}

- (void)setPitchModulation:(id)a3
{
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  id v10;

  v10 = a3;
  -[MTWrappedPhraseProcessor defaultModulation](self, "defaultModulation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;
  objc_msgSend(v10, "floatValue");
  v9 = v8;

  objc_storeStrong((id *)&self->_pitchModulation, a3);
  *(_DWORD *)(-[MTWrappedPhraseProcessor notifier](self, "notifier") + 16) = vcvts_n_s32_f32(v7 * v9, 0x10uLL);

}

- (BOOL)processNextPhrase
{
  void *v3;
  void *v4;
  MTBEPhraseParam *v5;
  void *v6;
  MTBEVoiceContents v7;
  MTFESpeechElement *v8;
  MTBENotifier *v9;
  MTBENotifier *v10;
  MTBENotifier *v11;
  MTBEPersistentParam *v12;
  MTBEVoiceContents v13;
  void *v14;
  MTBEPhraseProcessor *v15;
  void *v16;
  const VoiceDescription *v17;
  const MTBEPhraseParam *v18;

  -[MTWrappedPhraseProcessor frontend](self, "frontend");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setUnOwned:", 1);
  if (v4)
  {
    v5 = (MTBEPhraseParam *)operator new();
    -[MTWrappedPhraseProcessor voice](self, "voice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7.var0 = *(void **)objc_msgSend(v6, "wrapped");
    v8 = (MTFESpeechElement *)objc_msgSend(v4, "wrapped");
    v9 = -[MTWrappedPhraseProcessor notifier](self, "notifier");
    v10 = -[MTWrappedPhraseProcessor saveState](self, "saveState");
    v11 = -[MTWrappedPhraseProcessor resetState](self, "resetState");
    v12 = -[MTWrappedPhraseProcessor fPParams](self, "fPParams");
    v13.var0 = v7.var0;
    MTBEPhraseParam::MTBEPhraseParam(v5, v13, v8, v9, v10, v11, v12);

    -[MTWrappedPhraseProcessor voice](self, "voice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (MTBEPhraseProcessor *)objc_msgSend(v14, "description");
    -[MTWrappedPhraseProcessor voice](self, "voice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (const VoiceDescription *)objc_msgSend(v16, "privateData");
    -[MTWrappedPhraseProcessor setProcessor:](self, "setProcessor:", MTBEPhraseProcessor::Create(v15, v17, v5, v18));

  }
  return v4 != 0;
}

- (id)nextBuffer
{
  uint64_t v3;
  unsigned int (****v4)(_QWORD, uint64_t);
  uint64_t v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 *v11;
  int v12;
  void *v13;
  _QWORD v14[5];
  _DWORD v15[4];
  uint64_t v16;

  if (!-[MTWrappedPhraseProcessor processor](self, "processor")
    && !-[MTWrappedPhraseProcessor processNextPhrase](self, "processNextPhrase"))
  {
    return 0;
  }
  if (*(_BYTE *)(-[MTWrappedPhraseProcessor processor](self, "processor") + 2881))
    MTFEFrameFiller::SyncWithUnitSearch((uint64_t)(-[MTWrappedPhraseProcessor processor](self, "processor") + 2728));
  v3 = operator new();
  *(_QWORD *)(v3 + 24) = 0;
  *(_QWORD *)v3 = 0;
  *(_QWORD *)(v3 + 8) = 0;
  *(_WORD *)(v3 + 16) = 0;
  v4 = -[MTWrappedPhraseProcessor processor](self, "processor");
  if ((**v4[9])(v4[9], v3) && *(_WORD *)(v3 + 8))
  {
    -[MTWrappedPhraseProcessor setCurrentSampleCount:](self, "setCurrentSampleCount:", -[MTWrappedPhraseProcessor currentSampleCount](self, "currentSampleCount") + *(unsigned __int16 *)(v3 + 8));
    MTBEPhraseProcessor::UpdateNotifierFromEngine((MTBEPhraseProcessor *)-[MTWrappedPhraseProcessor processor](self, "processor"));
    v5 = *(_QWORD *)v3;
    v6 = 4 * *(unsigned __int16 *)(v3 + 8);
    v15[0] = 1;
    v15[2] = 1;
    v15[3] = v6;
    v16 = v5;
    v7 = objc_alloc(MEMORY[0x1E0C89AC0]);
    -[MTWrappedPhraseProcessor format](self, "format");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __38__MTWrappedPhraseProcessor_nextBuffer__block_invoke;
    v14[3] = &__block_descriptor_40_e49_v16__0r__AudioBufferList_I_1_AudioBuffer_II_v___8l;
    v14[4] = v3;
    v9 = (void *)objc_msgSend(v7, "initWithPCMFormat:bufferListNoCopy:deallocator:", v8, v15, v14);

    return v9;
  }
  else
  {
    v11 = -[MTWrappedPhraseProcessor processor](self, "processor");
    v12 = v11[2882];
    v11[2882] = 0;
    if (!v12)
    {
      if (-[MTWrappedPhraseProcessor processor](self, "processor"))
      {
        v13 = -[MTWrappedPhraseProcessor processor](self, "processor");
        if (v13)
          (*(void (**)(void *))(*(_QWORD *)v13 + 48))(v13);
      }
      -[MTWrappedPhraseProcessor setProcessor:](self, "setProcessor:", 0);
    }
    -[MTWrappedPhraseProcessor nextBuffer](self, "nextBuffer");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

uint64_t __38__MTWrappedPhraseProcessor_nextBuffer__block_invoke(uint64_t a1)
{
  uint64_t result;

  MTMBSegment::Free(*(MTMBSegment **)(a1 + 32));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    JUMPOUT(0x1D8233BA8);
  return result;
}

- (void)generatedSampleForWord:(unint64_t)a3 length:(unsigned __int16)a4
{
  uint64_t v4;
  id v7;

  v4 = a4;
  -[MTWrappedPhraseProcessor delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didGenerateSamplesForWord:stringPosition:length:", -[MTWrappedPhraseProcessor currentSampleCount](self, "currentSampleCount"), a3, v4);

}

- (void)generatedSampleForPhoneme:(signed __int16)a3
{
  uint64_t v3;
  id v5;

  v3 = a3;
  -[MTWrappedPhraseProcessor delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didGenerateSamplesForPhoneme:phonemeOpcode:", -[MTWrappedPhraseProcessor currentSampleCount](self, "currentSampleCount"), v3);

}

- (void)generatedSampleForSync:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[MTWrappedPhraseProcessor delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didGenerateSamplesForSync:message:", -[MTWrappedPhraseProcessor currentSampleCount](self, "currentSampleCount"), v3);

}

- (void)finishedSampleGeneration
{
  id v2;

  -[MTWrappedPhraseProcessor delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didFinishGeneratingSamples");

}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  MTBEPersistentParam *v6;
  MTBENotifier *v7;
  MTBENotifier *v8;
  MTBENotifier *v9;
  objc_super v10;

  if (-[MTWrappedPhraseProcessor processor](self, "processor"))
  {
    v3 = -[MTWrappedPhraseProcessor processor](self, "processor");
    if (v3)
      (*(void (**)(void *))(*(_QWORD *)v3 + 48))(v3);
  }
  if ((_QWORD)-[MTWrappedPhraseProcessor fPParams](self, "fPParams")[88])
  {
    v4 = (uint64_t)-[MTWrappedPhraseProcessor fPParams](self, "fPParams")[88];
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  }
  if ((_QWORD)-[MTWrappedPhraseProcessor fPParams](self, "fPParams")[56])
  {
    v5 = (uint64_t)-[MTWrappedPhraseProcessor fPParams](self, "fPParams")[56];
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 56))(v5);
  }
  if ((_QWORD)-[MTWrappedPhraseProcessor fPParams](self, "fPParams")[40])
    CFRelease((CFTypeRef)-[MTWrappedPhraseProcessor fPParams](self, "fPParams")[40]);
  v6 = -[MTWrappedPhraseProcessor fPParams](self, "fPParams");
  if (v6)
  {
    MTBEPersistentParam::~MTBEPersistentParam(v6);
    MEMORY[0x1D8233BA8]();
  }
  v7 = -[MTWrappedPhraseProcessor saveState](self, "saveState");
  if (v7)
    (*((void (**)(MTBENotifier *))v7->var0 + 1))(v7);
  v8 = -[MTWrappedPhraseProcessor resetState](self, "resetState");
  if (v8)
    (*((void (**)(MTBENotifier *))v8->var0 + 1))(v8);
  v9 = -[MTWrappedPhraseProcessor notifier](self, "notifier");
  if (v9)
    (*((void (**)(MTBENotifier *))v9->var0 + 1))(v9);
  v10.receiver = self;
  v10.super_class = (Class)MTWrappedPhraseProcessor;
  -[MTWrappedPhraseProcessor dealloc](&v10, sel_dealloc);
}

- (MacinTalkPhraseProcessorDelegate)delegate
{
  return (MacinTalkPhraseProcessorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSNumber)pitchModulation
{
  return self->_pitchModulation;
}

- (void)processor
{
  return self->_processor;
}

- (void)setProcessor:(void *)a3
{
  self->_processor = a3;
}

- (MTFVoice)voice
{
  return (MTFVoice *)objc_loadWeakRetained((id *)&self->_voice);
}

- (void)setVoice:(id)a3
{
  objc_storeWeak((id *)&self->_voice, a3);
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (MTBEPersistentParam)fPParams
{
  return self->_fPParams;
}

- (void)setFPParams:(MTBEPersistentParam *)a3
{
  self->_fPParams = a3;
}

- (MTBENotifier)notifier
{
  return self->_notifier;
}

- (void)setNotifier:(MTBENotifier *)a3
{
  self->_notifier = a3;
}

- (MTBENotifier)saveState
{
  return self->_saveState;
}

- (void)setSaveState:(MTBENotifier *)a3
{
  self->_saveState = a3;
}

- (MTBENotifier)resetState
{
  return self->_resetState;
}

- (void)setResetState:(MTBENotifier *)a3
{
  self->_resetState = a3;
}

- (NSNumber)defaultModulation
{
  return self->_defaultModulation;
}

- (void)setDefaultModulation:(id)a3
{
  objc_storeStrong((id *)&self->_defaultModulation, a3);
}

- (int64_t)currentSampleCount
{
  return self->_currentSampleCount;
}

- (void)setCurrentSampleCount:(int64_t)a3
{
  self->_currentSampleCount = a3;
}

- (MTFrontendSimple)frontend
{
  return self->_frontend;
}

- (void)setFrontend:(id)a3
{
  objc_storeStrong((id *)&self->_frontend, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontend, 0);
  objc_storeStrong((id *)&self->_defaultModulation, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_destroyWeak((id *)&self->_voice);
  objc_storeStrong((id *)&self->_pitchModulation, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
