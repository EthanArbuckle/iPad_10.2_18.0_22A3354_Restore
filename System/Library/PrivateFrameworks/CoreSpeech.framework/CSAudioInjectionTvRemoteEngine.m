@implementation CSAudioInjectionTvRemoteEngine

- (CSAudioInjectionTvRemoteEngine)initWithStreamHandleId:(unint64_t)a3
{
  CSAudioInjectionTvRemoteEngine *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  void *v6;
  int v7;
  uint64_t v8;
  CSAudioConverter *encoder;
  uint64_t v10;
  NSUUID *uuid;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CSAudioInjectionTvRemoteEngine;
  v3 = -[CSAudioInjectionEngine initWithStreamHandleId:](&v13, sel_initWithStreamHandleId_, a3);
  if (v3)
  {
    v4 = dispatch_queue_create("CSAudioInjectionTvRemoteEngine", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "useSpeexForAudioInjection");

    if (v7)
      +[CSAudioConverter speexConverter](CSAudioConverter, "speexConverter");
    else
      +[CSAudioConverter opusConverter](CSAudioConverter, "opusConverter");
    v8 = objc_claimAutoreleasedReturnValue();
    encoder = v3->_encoder;
    v3->_encoder = (CSAudioConverter *)v8;

    -[CSAudioConverter setDelegate:](v3->_encoder, "setDelegate:", v3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    uuid = v3->_uuid;
    v3->_uuid = (NSUUID *)v10;

  }
  return v3;
}

- (BOOL)isAlwaysOnVoiceTriggerAvailable
{
  return 0;
}

- (BOOL)alwaysOnVoiceTriggerEnabled
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSAudioInjectionTvRemoteEngine;
  v4 = a3;
  -[CSAudioInjectionEngine setDelegate:](&v5, sel_setDelegate_, self);
  objc_storeWeak((id *)&self->_delegate, v4);

}

- (void)start
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CSAudioInjectionTvRemoteEngine;
  -[CSAudioInjectionEngine start](&v2, sel_start);
}

- (void)stop
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CSAudioInjectionTvRemoteEngine;
  -[CSAudioInjectionEngine stop](&v2, sel_stop);
}

- (BOOL)injectAudio:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSAudioInjectionTvRemoteEngine;
  return -[CSAudioInjectionEngine injectAudio:](&v4, sel_injectAudio_, a3);
}

- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSAudioInjectionTvRemoteEngine;
  return -[CSAudioInjectionEngine injectAudio:withScaleFactor:playbackStarted:completion:](&v7, sel_injectAudio_withScaleFactor_playbackStarted_completion_, a3, a5, a6);
}

- (BOOL)isRecording
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSAudioInjectionTvRemoteEngine;
  return -[CSAudioInjectionEngine isRecording](&v3, sel_isRecording);
}

- (void)startAudioStreamWithOption:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSAudioInjectionTvRemoteEngine;
  -[CSAudioInjectionEngine startAudioStreamWithOption:](&v3, sel_startAudioStreamWithOption_, a3);
}

- (void)stopAudioStream
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CSAudioInjectionTvRemoteEngine;
  -[CSAudioInjectionEngine stopAudioStream](&v2, sel_stopAudioStream);
}

- (void)audioEngineDidStartRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  _BOOL8 v6;
  id WeakRetained;
  char v10;
  id v11;
  id v12;

  v6 = a5;
  v12 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "audioEngineDidStartRecord:audioStreamHandleId:successfully:error:", self, a4, v6, v12);

  }
}

- (void)audioEngineDidStopRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 reason:(unint64_t)a5
{
  CSAudioInjectionEngineDelegate **p_delegate;
  id WeakRetained;
  char v10;
  id v11;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v11, "audioEngineDidStopRecord:audioStreamHandleId:reason:", self, a4, a5);

  }
}

- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8
{
  CSAudioConverter *encoder;
  id v10;

  encoder = self->_encoder;
  v10 = a5;
  -[CSAudioConverter addSamples:timestamp:arrivalTimestampToAudioRecorder:](encoder, "addSamples:timestamp:arrivalTimestampToAudioRecorder:", v10, a7, mach_absolute_time());

}

- (void)audioConverterDidConvertPackets:(id)a3 packets:(id)a4 durationInSec:(float)a5 timestamp:(unint64_t)a6 arrivalTimestampToAudioRecorder:(unint64_t)a7
{
  id WeakRetained;
  char v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  id v16;

  v16 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D18FD0]);
    objc_msgSend(v11, "setPackets:", v16);
    objc_msgSend(v11, "setTimeStamp:", a6);
    objc_msgSend(v11, "setStreamHandleID:", -[CSAudioInjectionEngine audioStreamHandleId](self, "audioStreamHandleId"));
    objc_msgSend(v11, "setNumChannels:", 1);
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "useSpeexForAudioInjection");

    if (v13)
      v14 = 1936745848;
    else
      v14 = 1869641075;
    objc_msgSend(v11, "setAudioFormat:", v14);
    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v15, "audioEngineAudioChunkForTvAvailable:audioChunk:", self, v11);

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSAudioInjectionEngineDelegate)delegate
{
  return (CSAudioInjectionEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (CSAudioInjectionDevice)connectedDevice
{
  return (CSAudioInjectionDevice *)objc_loadWeakRetained((id *)&self->_connectedDevice);
}

- (void)setConnectedDevice:(id)a3
{
  objc_storeWeak((id *)&self->_connectedDevice, a3);
}

- (CSAudioConverter)encoder
{
  return self->_encoder;
}

- (void)setEncoder:(id)a3
{
  objc_storeStrong((id *)&self->_encoder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoder, 0);
  objc_destroyWeak((id *)&self->_connectedDevice);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
