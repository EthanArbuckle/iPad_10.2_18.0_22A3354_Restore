@implementation APRKStreamRecorder

- (int)startRecordingAtURL:(id)a3
{
  uint64_t v3;
  __int128 v4;
  int *p_audioTrackID;
  int *p_videoTrackID;
  const __CFAllocator *v7;
  id v8;
  __CFDictionary *Mutable;
  int *v10;
  int v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, int *);
  int v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, int *);

  v3 = MEMORY[0x24BDC0D40];
  v4 = *MEMORY[0x24BDC0D40];
  self->_audioTrackID = 0;
  p_audioTrackID = &self->_audioTrackID;
  *(_OWORD *)&self->_recordingStartTime.value = v4;
  self->_recordingStartTime.epoch = *(_QWORD *)(v3 + 16);
  self->_videoTrackID = 0;
  p_videoTrackID = &self->_videoTrackID;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = a3;
  Mutable = CFDictionaryCreateMutable(v7, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDDCE98], (const void *)*MEMORY[0x24BDBD270]);
  CFRunLoopGetCurrent();
  v10 = p_audioTrackID - 8;
  v11 = FigAssetWriterCreateWithURL();

  if (!v11)
  {
    v12 = *(_QWORD *)v10;
    v13 = *(uint64_t (**)(uint64_t, uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v13)
    {
      v14 = v13(v12, 1936684398, p_audioTrackID);
      if (v14)
      {
        v11 = v14;
      }
      else
      {
        v15 = *(_QWORD *)v10;
        v16 = *(uint64_t (**)(uint64_t, uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
        if (v16)
        {
          v11 = v16(v15, 1986618469, p_videoTrackID);
          if (!v11)
            goto LABEL_14;
        }
        else
        {
          v11 = -12782;
        }
      }
    }
    else
    {
      v11 = -12782;
    }
  }
  APSLogErrorAt();
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_14:
  if (Mutable)
    CFRelease(Mutable);
  return v11;
}

- (BOOL)finalizeRecording
{
  uint64_t videoTrackID;
  OpaqueFigAssetWriter *assetWriter;
  uint64_t (*v5)(OpaqueFigAssetWriter *, uint64_t);
  _BOOL4 v6;
  OpaqueFigAssetWriter *v7;
  unsigned int (*v8)(OpaqueFigAssetWriter *);
  int v9;
  OpaqueFigAssetWriter *v10;

  videoTrackID = self->_videoTrackID;
  if ((_DWORD)videoTrackID)
  {
    assetWriter = self->_assetWriter;
    v5 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 104);
    if (v5)
      v6 = v5(assetWriter, videoTrackID) != 0;
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  v7 = self->_assetWriter;
  v8 = *(unsigned int (**)(OpaqueFigAssetWriter *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 120);
  if (v8)
  {
    if (v8(v7))
      v9 = 1;
    else
      v9 = v6;
  }
  else
  {
    v9 = 1;
  }
  v10 = self->_assetWriter;
  if (v10)
  {
    CFRelease(v10);
    self->_assetWriter = 0;
  }
  *(_QWORD *)&self->_audioTrackID = 0;
  return v9 == 0;
}

- (int)recordVideoSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return -[APRKStreamRecorder _recordSampleBuffer:toTrackWithID:](self, "_recordSampleBuffer:toTrackWithID:", a3, self->_videoTrackID);
}

- (int)recordAudioSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return -[APRKStreamRecorder _recordSampleBuffer:toTrackWithID:](self, "_recordSampleBuffer:toTrackWithID:", a3, self->_audioTrackID);
}

- (int)_recordSampleBuffer:(opaqueCMSampleBuffer *)a3 toTrackWithID:(int)a4
{
  uint64_t v4;
  CMTimeEpoch epoch;
  OpaqueFigAssetWriter *assetWriter;
  uint64_t (*v9)(OpaqueFigAssetWriter *, CMTime *);
  int v10;
  OpaqueFigAssetWriter *v11;
  uint64_t (*v12)(OpaqueFigAssetWriter *, uint64_t, opaqueCMSampleBuffer *);
  int v13;
  CMTime v15;
  CMTime v16;

  v4 = *(_QWORD *)&a4;
  if (a3)
    CFRetain(a3);
  if ((self->_recordingStartTime.flags & 1) == 0)
  {
    CMSampleBufferGetPresentationTimeStamp(&v16, a3);
    *(_OWORD *)&self->_recordingStartTime.value = *(_OWORD *)&v16.value;
    epoch = v16.epoch;
    self->_recordingStartTime.epoch = v16.epoch;
    assetWriter = self->_assetWriter;
    *(_OWORD *)&v15.value = *(_OWORD *)&self->_recordingStartTime.value;
    v15.epoch = epoch;
    v9 = *(uint64_t (**)(OpaqueFigAssetWriter *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
    if (v9)
    {
      v16 = v15;
      v10 = v9(assetWriter, &v16);
      if (!v10)
        goto LABEL_6;
      v13 = v10;
    }
    else
    {
      v13 = -12782;
    }
    APSLogErrorAt();
    goto LABEL_12;
  }
LABEL_6:
  v11 = self->_assetWriter;
  v12 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 80);
  if (v12)
  {
    v13 = v12(v11, v4, a3);
    if (!v13)
      goto LABEL_16;
  }
  else
  {
    v13 = -12782;
  }
LABEL_12:
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_16:
  if (a3)
    CFRelease(a3);
  return v13;
}

@end
