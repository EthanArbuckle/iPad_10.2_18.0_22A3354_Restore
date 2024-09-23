@implementation FigCaptureMicSourcePipeline

- (uint64_t)sourceNode
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)clock
{
  if (result)
    return objc_msgSend(*(id *)(result + 40), "clock");
  return result;
}

- (uint64_t)nextOutputForMicSourcePosition:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(*(id *)(result + 48 + 8 * a2), "outputs");
    ++*(_DWORD *)(v3 + 96 + 4 * a2);
    return objc_msgSend(v4, "objectAtIndexedSubscript:");
  }
  return result;
}

+ (void)initialize
{
  objc_opt_class();
}

- (_QWORD)initWithConfiguration:(void *)a3 graph:(uint64_t)a4 name:(uint64_t)a5 audioSession:(void *)a6 cmSession:(char)a7 isAppAudioSession:(char)a8 audioSessionIsProxy:(unsigned __int8)a9 audioIsPlayingToBuiltinSpeaker:(uint64_t)a10 renderDelegate:
{
  void *v18;
  _QWORD *v19;
  void *v20;
  objc_super v22;

  if (!a1)
    return 0;
  if (a5 && a6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("*** AVAudioSession and CMSession arguments cannot both be non-nil -- AVAudioSession: %@, CMSession: %@"), a5, a6);
  if (a2)
    v18 = *(void **)(a2 + 8);
  else
    v18 = 0;
  v22.receiver = a1;
  v22.super_class = (Class)FigCaptureMicSourcePipeline;
  v19 = objc_msgSendSuper2(&v22, sel_initWithGraph_name_sourceID_, a3, a4, objc_msgSend(v18, "sourceID"));
  if (v19)
  {
    v20 = a2 ? *(void **)(a2 + 32) : 0;
    v19[14] = v20;
    if (-[FigCaptureMicSourcePipeline _buildMicSourcePipelineWithConfiguration:graph:audioSession:cmSession:isAppAudioSession:audioSessionIsProxy:audioIsPlayingToBuiltinSpeaker:renderDelegate:]((id *)v19, a2, a3, a5, a6, a7, a8, a9, a10))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v19;
}

- (uint64_t)_buildMicSourcePipelineWithConfiguration:(void *)a3 graph:(uint64_t)a4 audioSession:(void *)a5 cmSession:(char)a6 isAppAudioSession:(char)a7 audioSessionIsProxy:(unsigned __int8)a8 audioIsPlayingToBuiltinSpeaker:(uint64_t)a9 renderDelegate:
{
  uint64_t v14;
  void *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, const __CFString *, _QWORD, id *);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, const __CFString *, uint64_t, CFTypeRef *);
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  char v33;
  id v34;
  uint64_t v35;
  CFTypeRef v36;
  _BOOL8 v37;
  _BOOL8 v38;
  BOOL v39;
  __int128 v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  BWAudioSourceNode *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49;
  char v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  char v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  id *v59;
  uint64_t v60;
  uint64_t v61;
  BWAudioSplitNode *v62;
  BWFanOutNode *v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  _BOOL4 v70;
  void *v71;
  char v72;
  void *v73;
  char v74;
  BWAudioSourceNode *v75;
  uint64_t v76;
  id *v78;
  id obj;
  id obja;
  uint64_t v81;
  unsigned int v82;
  objc_super v83;
  objc_super v84;
  objc_super v85;
  __int128 v86;
  __int128 v87;
  CFTypeRef cf;
  id v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v14 = a2;
  v89 = 0;
  v90 = 0;
  cf = 0;
  if (a2)
    v16 = *(void **)(a2 + 8);
  else
    v16 = 0;
  v17 = objc_msgSend(v16, "source");
  v18 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 48);
  if (!v18)
  {
    v22 = 4294954514;
LABEL_11:
    fig_log_get_emitter();
    goto LABEL_76;
  }
  v19 = *MEMORY[0x1E0C9AE00];
  v20 = v18(v17, CFSTR("AttributesDictionary"), *MEMORY[0x1E0C9AE00], &v89);
  if ((_DWORD)v20)
  {
    v22 = v20;
    goto LABEL_11;
  }
  v78 = a1;
  if (!FigCaptureAudiomxdSupportEnabled())
  {
    if (v14)
      v23 = *(void **)(v14 + 8);
    else
      v23 = 0;
    v24 = objc_msgSend(v23, "source");
    v25 = *(uint64_t (**)(uint64_t, const __CFString *, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 8)
                                                                                      + 48);
    if (v25)
    {
      v26 = v25(v24, CFSTR("Clock"), v19, &cf);
      if (!(_DWORD)v26)
      {
LABEL_16:
        if (v14)
          v27 = *(void **)(v14 + 16);
        else
          v27 = 0;
        v71 = a3;
        v91 = 0u;
        v92 = 0u;
        v93 = 0u;
        v94 = 0u;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
        v76 = v14;
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v92;
          while (2)
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v92 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
              if (objc_msgSend(v32, "audioCaptureMode") == 3
                || objc_msgSend(v32, "audioCaptureMode") == 4
                || objc_msgSend(v32, "audioCaptureMode") == 5)
              {
                v33 = 1;
                v14 = v76;
                goto LABEL_31;
              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
            v33 = 0;
            v14 = v76;
            if (v29)
              continue;
            break;
          }
        }
        else
        {
          v33 = 0;
        }
LABEL_31:
        v72 = a7;
        v74 = a6;
        obj = a5;
        v81 = a4;
        v34 = v89;
        if (v14)
        {
          v35 = *(_QWORD *)(v14 + 48);
          v36 = cf;
          v37 = *(_BYTE *)(v14 + 56) != 0;
          v38 = *(_BYTE *)(v14 + 57) != 0;
          v39 = *(_BYTE *)(v14 + 58) != 0;
          v40 = *(_OWORD *)(v14 + 76);
          v86 = *(_OWORD *)(v14 + 60);
          v87 = v40;
          v41 = *(_BYTE *)(v14 + 59) != 0;
          v42 = objc_msgSend(*(id *)(v14 + 8), "clientAudioClockDeviceUID");
          v43 = *(_QWORD *)(v14 + 16);
        }
        else
        {
          v36 = cf;
          v86 = 0u;
          v87 = 0u;
          v42 = objc_msgSend(0, "clientAudioClockDeviceUID");
          v38 = 0;
          v35 = 0;
          v37 = 0;
          v39 = 0;
          v41 = 0;
          v43 = 0;
        }
        LOBYTE(v68) = v33;
        LOBYTE(v67) = v41;
        BYTE3(v66) = a8;
        BYTE2(v66) = v72;
        BYTE1(v66) = v39;
        LOBYTE(v66) = v74;
        v44 = +[BWAudioSourceNode audioSourceNodeWithAttributes:sessionPreset:clock:doConfigureAudio:doMixWithOthers:audioSession:CMSession:isAppAudioSession:doEndInterruption:audioSessionIsProxy:audioIsPlayingToBuiltinSpeaker:clientAuditToken:clientOSVersionSupportsDecoupledIO:clientAudioClockDeviceUID:audioCaptureConnectionConfigurations:isConfiguredForContinuityCapture:](BWAudioSourceNode, "audioSourceNodeWithAttributes:sessionPreset:clock:doConfigureAudio:doMixWithOthers:audioSession:CMSession:isAppAudioSession:doEndInterruption:audioSessionIsProxy:audioIsPlayingToBuiltinSpeaker:clientAuditToken:clientOSVersionSupportsDecoupledIO:clientAudioClockDeviceUID:audioCaptureConnectionConfigurations:isConfiguredForContinuityCapture:", v34, v35, v36, v37, v38, v81, obj, v66, &v86, v67, v42, v43, v68);
        if (cf)
          CFRelease(cf);

        if (!v44)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          return 4294954510;
        }
        -[BWNode setRenderDelegate:](v44, "setRenderDelegate:", a9);
        v75 = v44;
        if (v76)
        {
          v45 = *(void **)(v76 + 16);
          v69 = *(void **)(v76 + 24);
          v73 = *(void **)(v76 + 32);
          v70 = *(_BYTE *)(v76 + 40) != 0;
        }
        else
        {
          v73 = 0;
          v45 = 0;
          v69 = 0;
          v70 = 0;
        }
        v91 = 0u;
        v92 = 0u;
        v93 = 0u;
        v94 = 0u;
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
        if (v46)
        {
          v47 = v46;
          obja = v45;
          v48 = 0;
          v49 = 0;
          v50 = 0;
          v82 = 0;
          v51 = *(_QWORD *)v92;
          do
          {
            for (j = 0; j != v47; ++j)
            {
              if (*(_QWORD *)v92 != v51)
                objc_enumerationMutation(obja);
              v53 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v53, "sinkConfiguration"), "sinkType") == 4)
                v54 = 1;
              else
                v54 = objc_msgSend((id)objc_msgSend(v53, "irisSinkConfiguration"), "irisMovieCaptureEnabled");
              v55 = objc_msgSend((id)objc_msgSend(v53, "irisSinkConfiguration"), "irisMovieCaptureEnabled");
              v56 = objc_msgSend(v53, "windNoiseRemovalEnabled");
              if (objc_msgSend(v53, "audioCaptureMode"))
                v82 = objc_msgSend(v53, "audioCaptureMode");
              v49 |= v54;
              v48 |= v55;
              v50 |= v56;
            }
            v47 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
          }
          while (v47);
        }
        else
        {
          v48 = 0;
          v49 = 0;
          v50 = 0;
          v82 = 0;
        }
        if ((a8 & (v82 == 2)) != 0)
          v57 = 0;
        else
          v57 = v82;
        if ((v48 & 1) != 0)
          v58 = 0;
        else
          v58 = v57;
        -[BWAudioSourceNode setLivePhotoCaptureEnabled:](v75, "setLivePhotoCaptureEnabled:", v48 & 1);
        -[BWAudioSourceNode setAudioCaptureMode:](v75, "setAudioCaptureMode:", v58);
        -[BWAudioSourceNode setWindNoiseRemovalEnabled:](v75, "setWindNoiseRemovalEnabled:", v50 & 1);
        -[BWAudioSourceNode setVideoRecordingEnabled:](v75, "setVideoRecordingEnabled:", v49 & 1);
        -[BWAudioSourceNode setLevelMeteringEnabled:](v75, "setLevelMeteringEnabled:", 1);
        if (BWAudioCaptureModeIsSpatial(v57))
        {
          objc_msgSend((id)objc_msgSend(v69, "requiredFormat"), "fieldOfView");
          -[BWAudioSourceNode setStereoAudioCapturePairedCameraBaseFieldOfView:](v75, "setStereoAudioCapturePairedCameraBaseFieldOfView:");
          objc_msgSend(v69, "videoZoomFactor");
          -[BWAudioSourceNode setStereoAudioCapturePairedCameraZoomFactor:](v75, "setStereoAudioCapturePairedCameraZoomFactor:");
          objc_msgSend(v73, "setZoomCompletionDelegateForStereoAudio:", v75);
          -[BWAudioSourceNode setFlipStereoAudioCaptureChannels:](v75, "setFlipStereoAudioCaptureChannels:", v70);
        }
        v59 = v78;
        v85.receiver = v78;
        v85.super_class = (Class)FigCaptureMicSourcePipeline;
        if ((objc_msgSendSuper2(&v85, sel_addNode_error_, v75, &v90) & 1) != 0)
        {
          v60 = 0;
          v78[5] = v75;
          while (1)
          {
            v61 = objc_msgSend(-[FigCaptureMicSourcePipelineConfiguration micConnectionConfigurationsForMicSourcePosition:](v76, v60), "count");
            if ((int)v61 >= 1)
            {
              if (objc_msgSend(v59[5], "audioCaptureMode") == 2)
              {
                v62 = -[BWAudioSplitNode initWithInputChannelLayoutTag:output1ChannelLayoutTag:output2ChannelLayoutTag:]([BWAudioSplitNode alloc], "initWithInputChannelLayoutTag:output1ChannelLayoutTag:output2ChannelLayoutTag:", 4027580422, 6619138, 12451844);
                -[BWNode setName:](v62, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AudioSplitNode (%d -> %d:%d)"), 6, 2, 4));
                v84.receiver = v59;
                v84.super_class = (Class)FigCaptureMicSourcePipeline;
                if ((objc_msgSendSuper2(&v84, sel_addNode_error_, v62, &v90) & 1) == 0
                  || (objc_msgSend(v71, "connectOutput:toInput:pipelineStage:", objc_msgSend(v59[5], "outputForMicSourcePosition:", v60), -[BWNode input](v62, "input"), 0) & 1) == 0)
                {
                  break;
                }
                v59[v60 + 9] = v62;
              }
              else
              {
                v62 = 0;
              }
              v63 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", v61, 1936684398);
              -[BWNode setName:](v63, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Audio FanOutNode (%@)"), BWCaptureDevicePositionToString(v60)));
              v83.receiver = v59;
              v83.super_class = (Class)FigCaptureMicSourcePipeline;
              if ((objc_msgSendSuper2(&v83, sel_addNode_error_, v63, &v90) & 1) == 0)
                break;
              v59[v60 + 6] = v63;
              v64 = objc_msgSend(v59[5], "outputForMicSourcePosition:", v60);
              if (v62)
                v64 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v62, "outputs"), "objectAtIndexedSubscript:", 0);
              v59 = v78;
              if ((objc_msgSend(v71, "connectOutput:toInput:pipelineStage:", v64, -[BWNode input](v63, "input"), 0) & 1) == 0)
                break;
            }
            if (++v60 == 3)
              goto LABEL_73;
          }
          fig_log_get_emitter();
        }
        else
        {
          fig_log_get_emitter();
        }
        goto LABEL_81;
      }
      v22 = v26;
    }
    else
    {
      v22 = 4294954514;
    }
    fig_log_get_emitter();
LABEL_76:
    FigDebugAssert3();
    if ((_DWORD)v22)
      return v22;
    goto LABEL_77;
  }
  if (a4)
  {
    v21 = FigAudioSessionClockCreateForAVAudioSession();
    if ((_DWORD)v21)
    {
      v22 = v21;
      fig_log_get_emitter();
      goto LABEL_76;
    }
    goto LABEL_16;
  }
  fig_log_get_emitter();
LABEL_81:
  FigDebugAssert3();
LABEL_73:
  v22 = 0;
LABEL_77:
  if (v90)
    return objc_msgSend(v90, "code");
  return v22;
}

- (void)dealloc
{
  uint64_t i;
  uint64_t j;
  objc_super v5;

  -[BWZoomCommandHandler setZoomCompletionDelegateForStereoAudio:](self->_zoomCommandHandlerForStereoAudioCapture, "setZoomCompletionDelegateForStereoAudio:", 0);

  for (i = 0; i != 3; ++i)
  for (j = 0; j != 3; ++j)

  v5.receiver = self;
  v5.super_class = (Class)FigCaptureMicSourcePipeline;
  -[FigCaptureSourcePipeline dealloc](&v5, sel_dealloc);
}

- (uint64_t)cinematicAudioOutputForMicSourcePosition:(uint64_t)a1
{
  if (a1 && (unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 72 + 8 * a2), "outputs"), "count") >= 2)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 72 + 8 * a2), "outputs"), "objectAtIndexedSubscript:", 1);
  else
    return 0;
}

- (uint64_t)updateWithAudioSession:(_OWORD *)a3 clientAuditToken:
{
  void *v3;
  __int128 v4;
  _OWORD v5[2];

  if (result)
  {
    v3 = *(void **)(result + 40);
    v4 = a3[1];
    v5[0] = *a3;
    v5[1] = v4;
    return objc_msgSend(v3, "updateWithAudioSession:clientAuditToken:", a2, v5);
  }
  return result;
}

@end
