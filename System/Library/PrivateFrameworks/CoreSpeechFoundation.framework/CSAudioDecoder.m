@implementation CSAudioDecoder

- (CSAudioDecoder)initWithInASBD:(AudioStreamBasicDescription *)a3 outASBD:(AudioStreamBasicDescription *)a4
{
  CSAudioDecoder *v6;
  CSAudioDecoder *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CSAudioDecoder *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CSAudioDecoder;
  v6 = -[CSAudioDecoder init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    AudioConverterNew(a3, a4, &v6->_decoder);
    if (!v7->_decoder)
    {
      v12 = 0;
      goto LABEL_6;
    }
    v8 = *(_OWORD *)&a3->mSampleRate;
    v9 = *(_OWORD *)&a3->mBytesPerPacket;
    *(_QWORD *)&v7->_inASBD.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
    *(_OWORD *)&v7->_inASBD.mSampleRate = v8;
    *(_OWORD *)&v7->_inASBD.mBytesPerPacket = v9;
    v10 = *(_OWORD *)&a4->mSampleRate;
    v11 = *(_OWORD *)&a4->mBytesPerPacket;
    *(_QWORD *)&v7->_outASBD.mBitsPerChannel = *(_QWORD *)&a4->mBitsPerChannel;
    *(_OWORD *)&v7->_outASBD.mBytesPerPacket = v11;
    *(_OWORD *)&v7->_outASBD.mSampleRate = v10;
  }
  v12 = v7;
LABEL_6:

  return v12;
}

- (void)dealloc
{
  OpaqueAudioConverter *decoder;
  objc_super v4;

  decoder = self->_decoder;
  if (decoder)
  {
    AudioConverterDispose(decoder);
    self->_decoder = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CSAudioDecoder;
  -[CSAudioDecoder dealloc](&v4, sel_dealloc);
}

- (void)addPackets:(id)a3 audioStreamHandleId:(unint64_t)a4 remoteVAD:(id)a5 timestamp:(unint64_t)a6 arrivalTimestampToAudioRecorder:(unint64_t)a7 wasBuffered:(BOOL)a8 receivedNumChannels:(unsigned int)a9
{
  id v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  UInt32 mFramesPerPacket;
  void *v16;
  id v17;
  UInt32 v18;
  OpaqueAudioConverter *decoder;
  OSStatus v20;
  void *v21;
  void *v22;
  id WeakRetained;
  uint64_t v24;
  id *location;
  id v30;
  id obj;
  uint64_t v32;
  _QWORD inInputDataProcUserData[8];
  _QWORD v34[4];
  _QWORD v35[3];
  int v36;
  UInt32 ioOutputDataPacketSize;
  AudioBufferList outOutputData;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v30 = a5;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v12)
  {
    v32 = *(_QWORD *)v40;
    location = (id *)&self->_delegate;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v40 != v32)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        mFramesPerPacket = self->_inASBD.mFramesPerPacket;
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 2 * mFramesPerPacket);
        memset(&outOutputData.mNumberBuffers + 1, 0, 20);
        outOutputData.mNumberBuffers = 1;
        v17 = objc_retainAutorelease(v16);
        outOutputData.mBuffers[0].mData = (void *)objc_msgSend(v17, "mutableBytes");
        v18 = objc_msgSend(v17, "length");
        outOutputData.mBuffers[0].mNumberChannels = 1;
        outOutputData.mBuffers[0].mDataByteSize = v18;
        ioOutputDataPacketSize = mFramesPerPacket;
        v35[0] = 0;
        v35[1] = v35;
        v35[2] = 0x2020000000;
        v36 = 0;
        v34[0] = 0;
        v34[1] = v34;
        v34[2] = 0x2020000000;
        v34[3] = 1;
        decoder = self->_decoder;
        inInputDataProcUserData[0] = MEMORY[0x1E0C809B0];
        inInputDataProcUserData[1] = 3221225472;
        inInputDataProcUserData[2] = __133__CSAudioDecoder_addPackets_audioStreamHandleId_remoteVAD_timestamp_arrivalTimestampToAudioRecorder_wasBuffered_receivedNumChannels___block_invoke;
        inInputDataProcUserData[3] = &unk_1E687F1D8;
        inInputDataProcUserData[4] = v14;
        inInputDataProcUserData[5] = v34;
        inInputDataProcUserData[6] = v35;
        inInputDataProcUserData[7] = &v43;
        v20 = AudioConverterFillComplexBuffer(decoder, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_BlockInvoke_5914, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0);
        if ((v20 == 1836086393 || !v20) && ioOutputDataPacketSize && outOutputData.mNumberBuffers)
        {
          if (2 * (unint64_t)ioOutputDataPacketSize > outOutputData.mBuffers[0].mDataByteSize)
          {
            _Block_object_dispose(v34, 8);
            _Block_object_dispose(v35, 8);

            goto LABEL_19;
          }
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", outOutputData.mBuffers[0].mData);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[CSConfig inputRecordingIsFloat](CSConfig, "inputRecordingIsFloat"))
          {
            +[CSFLPCMTypeConverter convertToFloatLPCMBufFromShortLPCMBuf:](CSFLPCMTypeConverter, "convertToFloatLPCMBufFromShortLPCMBuf:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            WeakRetained = objc_loadWeakRetained(location);
            HIDWORD(v24) = a9;
            LOBYTE(v24) = a8;
            objc_msgSend(WeakRetained, "audioDecoderDidDecodePackets:audioStreamHandleId:buffer:remoteVAD:timestamp:arrivalTimestampToAudioRecorder:wasBuffered:receivedNumChannels:", self, a4, v22, v30, a6, a7, v24);

          }
          else
          {
            v22 = objc_loadWeakRetained(location);
            HIDWORD(v24) = a9;
            LOBYTE(v24) = a8;
            objc_msgSend(v22, "audioDecoderDidDecodePackets:audioStreamHandleId:buffer:remoteVAD:timestamp:arrivalTimestampToAudioRecorder:wasBuffered:receivedNumChannels:", self, a4, v21, v30, a6, a7, v24);
          }

        }
        _Block_object_dispose(v34, 8);
        _Block_object_dispose(v35, 8);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_19:

}

- (CSAudioDecoderDelegate)delegate
{
  return (CSAudioDecoderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __133__CSAudioDecoder_addPackets_audioStreamHandleId_remoteVAD_timestamp_arrivalTimestampToAudioRecorder_wasBuffered_receivedNumChannels___block_invoke(uint64_t a1, _DWORD *a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v7;
  uint64_t result;
  _QWORD *v9;
  int v10;
  id v11;
  uint64_t v12;

  v7 = *a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= v7)
  {
    if ((_DWORD)v7 == 1)
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "length");
      v11 = objc_retainAutorelease(*(id *)(a1 + 32));
      *(_QWORD *)(a3 + 16) = objc_msgSend(v11, "bytes");
      *(_DWORD *)(a3 + 12) = v10;
      if (a4)
      {
        v12 = *(_QWORD *)(a1 + 56);
        *(_QWORD *)v12 = 0;
        *(_DWORD *)(v12 + 8) = 0;
        *(_DWORD *)(v12 + 12) = v10;
        *a4 = v12;
      }
      --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

      return 0;
    }
    else
    {
      return 1752524863;
    }
  }
  else
  {
    result = 1836086393;
    *a2 = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_DWORD *)(a3 + 12) = 0;
    if (a4)
    {
      v9 = *(_QWORD **)(a1 + 56);
      *v9 = 0;
      v9[1] = 0;
      *a4 = v9;
    }
  }
  return result;
}

@end
