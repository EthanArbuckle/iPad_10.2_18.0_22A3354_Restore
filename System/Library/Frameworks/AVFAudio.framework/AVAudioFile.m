@implementation AVAudioFile

- (AVAudioFile)initForReading:(NSURL *)fileURL error:(NSError *)outError
{
  return -[AVAudioFile initForReading:commonFormat:interleaved:error:](self, "initForReading:commonFormat:interleaved:error:", fileURL, 1, 0, outError);
}

- (AVAudioFile)initForReading:(NSURL *)fileURL commonFormat:(AVAudioCommonFormat)format interleaved:(BOOL)interleaved error:(NSError *)outError
{
  _BOOL8 v7;
  NSURL *v10;
  id v11;
  uint64_t v12;
  const __CFURL *v13;
  uint64_t v14;
  id v15;
  id v17;
  objc_super v18;

  v7 = interleaved;
  v10 = fileURL;
  v18.receiver = self;
  v18.super_class = (Class)AVAudioFile;
  v11 = -[AVAudioFile init](&v18, sel_init);
  if (!v11)
  {
    v15 = 0;
    if (!outError)
      goto LABEL_8;
    goto LABEL_7;
  }
  v12 = operator new();
  v13 = v10;
  *(_QWORD *)(v12 + 8) = 0;
  *(_QWORD *)v12 = v13;
  *(_BYTE *)(v12 + 16) = 0;
  *(_QWORD *)(v12 + 24) = 0;
  *(_QWORD *)(v12 + 32) = -1;
  *(_QWORD *)(v12 + 40) = 0;
  *(_QWORD *)(v12 + 48) = 0;
  *(_DWORD *)(v12 + 56) = 1;
  v17 = 0;
  _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 136, "AVAudioFileImpl", "fileURL != nil", v13 != 0);
  v14 = ExtAudioFileOpenURL(v13, (ExtAudioFileRef *)(v12 + 8));
  if (_AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 137, (uint64_t)"AVAudioFileImpl", (uint64_t)"ExtAudioFileOpenURL((__bridge CFURLRef)fileURL, &_extAudioFile)", v14, &v17))
  {
    AVAudioFileImpl::_initCommonReading(v12, format, v7, &v17);
  }

  v15 = v17;
  std::unique_ptr<AVAudioFileImpl>::reset[abi:ne180100]((uint64_t *)v11 + 1, v12);
  if (v15)
  {
    objc_msgSend(v11, "close");

    v11 = 0;
  }
  if (outError)
LABEL_7:
    *outError = (NSError *)objc_retainAutorelease(v15);
LABEL_8:

  return (AVAudioFile *)v11;
}

- (id)initForReadingFromExtAudioFile:(OpaqueExtAudioFile *)a3 error:(id *)a4
{
  return -[AVAudioFile initForReadingFromExtAudioFile:commonFormat:interleaved:error:](self, "initForReadingFromExtAudioFile:commonFormat:interleaved:error:", a3, 1, 0, a4);
}

- (id)initForReadingFromExtAudioFile:(OpaqueExtAudioFile *)a3 commonFormat:(unint64_t)a4 interleaved:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  uint64_t v11;
  id v12;
  id v14;
  objc_super v15;

  v7 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVAudioFile;
  v10 = -[AVAudioFile init](&v15, sel_init);
  if (!v10)
  {
    v12 = 0;
    if (!a6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v11 = operator new();
  *(_QWORD *)v11 = 0;
  *(_QWORD *)(v11 + 8) = a3;
  *(_BYTE *)(v11 + 16) = 0;
  *(_QWORD *)(v11 + 24) = 0;
  *(_QWORD *)(v11 + 32) = -1;
  *(_QWORD *)(v11 + 40) = 0;
  *(_QWORD *)(v11 + 48) = 0;
  *(_DWORD *)(v11 + 56) = 1;
  v14 = 0;
  AVAudioFileImpl::_initCommonReading(v11, (AVAudioCommonFormat)a4, v7, &v14);
  v12 = v14;
  std::unique_ptr<AVAudioFileImpl>::reset[abi:ne180100]((uint64_t *)v10 + 1, v11);
  if (v12)
  {
    objc_msgSend(v10, "close");

    v10 = 0;
  }
  if (a6)
LABEL_5:
    *a6 = objc_retainAutorelease(v12);
LABEL_6:

  return v10;
}

- (AVAudioFile)initForWriting:(NSURL *)fileURL settings:(NSDictionary *)settings error:(NSError *)outError
{
  return -[AVAudioFile initForWriting:settings:commonFormat:interleaved:error:](self, "initForWriting:settings:commonFormat:interleaved:error:", fileURL, settings, 1, 0, outError);
}

- (AVAudioFile)initForWriting:(NSURL *)fileURL settings:(NSDictionary *)settings commonFormat:(AVAudioCommonFormat)format interleaved:(BOOL)interleaved error:(NSError *)outError
{
  _BOOL4 v8;
  NSURL *v12;
  id v13;
  uint64_t v14;
  NSURL *v15;
  NSDictionary *v16;
  NSURL *v17;
  ExtAudioFileRef *v18;
  void *v19;
  void *v20;
  AudioFileTypeID v21;
  id v22;
  NSString *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  AVAudioChannelLayout *v27;
  AVAudioChannelLayout *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  int v33;
  OpaqueAudioConverter *AudioConverter;
  uint64_t v35;
  OpaqueAudioConverter *v36;
  uint64_t v37;
  void *v39;
  AVAudioChannelLayout *v40;
  BOOL v41[4];
  NSURL *v42;
  NSDictionary *v43;
  id v44;
  objc_super v45;
  int inPropertyData;
  AudioStreamBasicDescription inStreamDesc;
  int v48;

  v8 = interleaved;
  v12 = fileURL;
  v43 = settings;
  v45.receiver = self;
  v45.super_class = (Class)AVAudioFile;
  v13 = -[AVAudioFile init](&v45, sel_init);
  if (!v13)
  {
    v22 = 0;
    if (!outError)
      goto LABEL_42;
    goto LABEL_41;
  }
  *(_DWORD *)v41 = v8;
  v42 = v12;
  v14 = operator new();
  v15 = v12;
  v16 = v43;
  v17 = v15;
  *(_QWORD *)v14 = v17;
  *(_QWORD *)(v14 + 8) = 0;
  v18 = (ExtAudioFileRef *)(v14 + 8);
  *(_BYTE *)(v14 + 16) = 0;
  *(_QWORD *)(v14 + 24) = 0;
  *(_QWORD *)(v14 + 32) = -1;
  *(_QWORD *)(v14 + 40) = 0;
  *(_QWORD *)(v14 + 48) = 0;
  *(_DWORD *)(v14 + 56) = 0;
  v44 = 0;
  _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 301, "AVAudioFileImpl", "fileURL != nil", v17 != 0);
  -[NSDictionary objectForKey:](v16, "objectForKey:", CFSTR("AVAudioFileTypeKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = objc_msgSend(v19, "unsignedIntValue");
  }
  else
  {
    -[NSURL pathExtension](v17, "pathExtension");
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    v21 = fileTypeFromExtension(v23);

  }
  v24 = asbdFromSettingsAndFileType2(v16, 0, v21, &inStreamDesc);
  if (_AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 315, (uint64_t)"AVAudioFileImpl", (uint64_t)"err", v24, &v44))
  {
    v25 = ExtAudioFileCreateWithURL((CFURLRef)v17, v21, &inStreamDesc, 0, 1u, (ExtAudioFileRef *)(v14 + 8));
    if (_AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 318, (uint64_t)"AVAudioFileImpl", (uint64_t)"ExtAudioFileCreateWithURL((__bridge CFURLRef)fileURL, fileType, &fileASBD, NULL, kAudioFileFlags_EraseFile, &_extAudioFile)", v25, &v44))
    {
      -[NSDictionary objectForKey:](v16, "objectForKey:", CFSTR("AVChannelLayoutKey"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v26;
      if (v26)
      {
        v27 = -[AVAudioChannelLayout initWithLayout:]([AVAudioChannelLayout alloc], "initWithLayout:", objc_msgSend(objc_retainAutorelease(v26), "bytes"));
      }
      else
      {
        if (inStreamDesc.mChannelsPerFrame < 3)
          goto LABEL_16;
        v28 = [AVAudioChannelLayout alloc];
        v27 = -[AVAudioChannelLayout initWithLayoutTag:](v28, "initWithLayoutTag:", inStreamDesc.mChannelsPerFrame | 0x930000);
      }
      if (v27)
      {
        v40 = v27;
        if (-[AVAudioChannelLayout layout](v27, "layout"))
          ExtAudioFileSetProperty(*v18, 0x66636C6Fu, -[AVAudioChannelLayout layoutSize](v40, "layoutSize"), -[AVAudioChannelLayout layout](v40, "layout"));
LABEL_17:
        v29 = AVAudioFileImpl::SetFormats((AVAudioFileImpl *)v14, format, *(unsigned int *)v41, &inStreamDesc, v40);
        if (!_AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 335, (uint64_t)"AVAudioFileImpl", (uint64_t)"SetFormats(format, interleaved, fileASBD, avacl)", v29, &v44))
        {
LABEL_38:

          goto LABEL_39;
        }
        AVAudioFileImpl::ReadMagicCookie((AVAudioFileImpl *)v14);
        -[NSDictionary objectForKey:](v16, "objectForKey:", CFSTR("AVEncoderBitRateStrategyKey"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          v32 = v30;
          if (objc_msgSend(v32, "compare:", CFSTR("AVAudioBitRateStrategy_Constant")))
          {
            if (objc_msgSend(v32, "compare:", CFSTR("AVAudioBitRateStrategy_LongTermAverage")))
            {
              if (objc_msgSend(v32, "compare:", CFSTR("AVAudioBitRateStrategy_VariableConstrained")))
              {
                if (objc_msgSend(v32, "compare:", CFSTR("AVAudioBitRateStrategy_Variable")))
                {
LABEL_35:

                  goto LABEL_37;
                }
                v33 = 3;
              }
              else
              {
                v33 = 2;
              }
            }
            else
            {
              v33 = 1;
            }
          }
          else
          {
            v33 = 0;
          }
          inPropertyData = v33;

          AudioConverter = (OpaqueAudioConverter *)AVAudioFileImpl::GetAudioConverter(*v18, &v44);
          if (AudioConverter)
          {
            v35 = AudioConverterSetProperty(AudioConverter, 0x61636266u, 4u, &inPropertyData);
            if (!_AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 345, (uint64_t)"AVAudioFileImpl", (uint64_t)"AudioConverterSetProperty(converter, kAudioCodecPropertyBitRateControlMode, sizeof(UInt32), &value)", v35, &v44))
            {
LABEL_37:

              goto LABEL_38;
            }
            v33 = inPropertyData;
          }
          if (v33 == 3)
          {
            -[NSDictionary objectForKey:](v16, "objectForKey:", CFSTR("AVEncoderQualityForVBRKey"));
            v32 = (id)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              v36 = (OpaqueAudioConverter *)AVAudioFileImpl::GetAudioConverter(*v18, &v44);
              if (v36)
              {
                v48 = objc_msgSend(v32, "intValue");
                v37 = AudioConverterSetProperty(v36, 0x76627271u, 4u, &v48);
                _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 433, (uint64_t)"setVBRQuality", (uint64_t)"AudioConverterSetProperty(converter, kAudioCodecPropertySoundQualityForVBR, sizeof(UInt32), &audioQuality)", v37, &v44);
              }
            }
            goto LABEL_35;
          }
        }
        AVAudioFileImpl::setBitRate(v14, v16, &v44);
        goto LABEL_37;
      }
LABEL_16:
      v40 = 0;
      goto LABEL_17;
    }
  }
LABEL_39:

  v22 = v44;
  std::unique_ptr<AVAudioFileImpl>::reset[abi:ne180100]((uint64_t *)v13 + 1, v14);
  if (!v22)
  {
    v12 = v42;
    if (!outError)
      goto LABEL_42;
    goto LABEL_41;
  }
  v12 = v42;
  objc_msgSend(v13, "close");

  v13 = 0;
  if (outError)
LABEL_41:
    *outError = (NSError *)objc_retainAutorelease(v22);
LABEL_42:

  return (AVAudioFile *)v13;
}

- (id)initSecondaryReader:(id)a3 format:(id)a4 error:(id *)a5
{
  _QWORD *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t Property;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v19;
  _QWORD *v20;
  id v21;
  objc_super v22;
  UInt32 ioPropertyDataSize;
  AudioFileID outPropertyData;

  v9 = a3;
  v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)AVAudioFile;
  v11 = -[AVAudioFile init](&v22, sel_init);
  if (v11)
  {
    v12 = operator new();
    v13 = v9[1];
    v20 = v9;
    v19 = v10;
    *(_QWORD *)v12 = *(id *)v13;
    *(_QWORD *)(v12 + 8) = 0;
    *(_BYTE *)(v12 + 16) = 0;
    *(_QWORD *)(v12 + 24) = 0;
    *(_QWORD *)(v12 + 32) = -1;
    *(_QWORD *)(v12 + 40) = 0;
    *(_QWORD *)(v12 + 48) = 0;
    *(_DWORD *)(v12 + 56) = 1;
    v21 = 0;
    outPropertyData = 0;
    ioPropertyDataSize = 8;
    Property = ExtAudioFileGetProperty(*(ExtAudioFileRef *)(v13 + 8), 0x6166696Cu, &ioPropertyDataSize, &outPropertyData);
    if (_AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 216, (uint64_t)"AVAudioFileImpl", (uint64_t)"ExtAudioFileGetProperty(openFileImpl->_extAudioFile, kExtAudioFileProperty_AudioFile, &propSize, &openAudioFileID)", Property, &v21))
    {
      v15 = ExtAudioFileWrapAudioFileID(outPropertyData, 0, (ExtAudioFileRef *)(v12 + 8));
      if (_AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 220, (uint64_t)"AVAudioFileImpl", (uint64_t)"ExtAudioFileWrapAudioFileID(openAudioFileID, false, &_extAudioFile)", v15, &v21))
      {
        objc_storeStrong((id *)(v12 + 24), a4);
        objc_storeStrong((id *)(v12 + 40), *(id *)(v13 + 40));
        v16 = AVAudioFileImpl::CheckClientFormatSet((AVAudioFileImpl *)v12);
        _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 226, (uint64_t)"AVAudioFileImpl", (uint64_t)"CheckClientFormatSet()", v16, &v21);
        objc_storeStrong((id *)(v12 + 48), a3);
      }
    }

    v17 = v21;
    std::unique_ptr<AVAudioFileImpl>::reset[abi:ne180100]((uint64_t *)v11 + 1, v12);
    if (v17)
    {
      objc_msgSend(v11, "close");

      v11 = 0;
      if (!a5)
        goto LABEL_10;
    }
    else if (!a5)
    {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v17 = 0;
  if (a5)
LABEL_9:
    *a5 = objc_retainAutorelease(v17);
LABEL_10:

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[AVAudioFile close](self, "close");
  std::unique_ptr<AVAudioFileImpl>::reset[abi:ne180100]((uint64_t *)&self->_impl, 0);
  v3.receiver = self;
  v3.super_class = (Class)AVAudioFile;
  -[AVAudioFile dealloc](&v3, sel_dealloc);
}

- (void)close
{
  AVAudioFileImpl *value;
  OpaqueExtAudioFile *v3;

  value = self->_impl.__ptr_.__value_;
  if (value)
  {
    v3 = (OpaqueExtAudioFile *)*((_QWORD *)value + 1);
    if (v3)
    {
      ExtAudioFileDispose(v3);
      *((_QWORD *)value + 1) = 0;
    }
  }
}

- (BOOL)isOpen
{
  return *((_QWORD *)self->_impl.__ptr_.__value_ + 1) != 0;
}

- (BOOL)readIntoBuffer:(AVAudioPCMBuffer *)buffer error:(NSError *)outError
{
  AVAudioPCMBuffer *v6;

  v6 = buffer;
  LOBYTE(outError) = -[AVAudioFile readIntoBuffer:frameCount:error:](self, "readIntoBuffer:frameCount:error:", v6, -[AVAudioPCMBuffer frameCapacity](v6, "frameCapacity"), outError);

  return (char)outError;
}

- (BOOL)writeFromBuffer:(const AVAudioPCMBuffer *)buffer error:(NSError *)outError
{
  AVAudioPCMBuffer *v6;
  char v7;
  int v8;
  id v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  AVAudioFileImpl *value;
  uint64_t v14;
  id v16;

  v6 = (id)buffer;
  v7 = *((_QWORD *)self->_impl.__ptr_.__value_ + 1) != 0;
  v16 = 0;
  v8 = _AVAE_CheckAndReturnErr(556, (uint64_t)"-[AVAudioFile writeFromBuffer:error:]", (uint64_t)"_impl->isOpen()", v7, 4294967253, &v16);
  v9 = v16;
  v10 = v9;
  if (v8)
  {
    v11 = 0;
    if (outError)
      *outError = (NSError *)objc_retainAutorelease(v9);
  }
  else
  {
    _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 561, "-[AVAudioFile writeFromBuffer:error:]", "buffer != nil", v6 != 0);
    if (-[AVAudioPCMBuffer frameCapacity](v6, "frameCapacity"))
    {
      v12 = AVAudioFileImpl::CheckClientFormatSet(self->_impl.__ptr_.__value_);
      _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 566, (uint64_t)"-[AVAudioFile writeFromBuffer:error:]", (uint64_t)"_impl->CheckClientFormatSet()", v12, outError);
      value = self->_impl.__ptr_.__value_;
      *((_QWORD *)value + 4) = -1;
      v14 = ExtAudioFileWrite(*((ExtAudioFileRef *)value + 1), -[AVAudioPCMBuffer frameLength](v6, "frameLength"), -[AVAudioBuffer audioBufferList](v6, "audioBufferList"));
      v11 = _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 570, (uint64_t)"-[AVAudioFile writeFromBuffer:error:]", (uint64_t)"ExtAudioFileWrite(_impl->_extAudioFile, buffer.frameLength, buffer.audioBufferList)", v14, outError);
    }
    else
    {
      v11 = 1;
    }
  }

  return v11;
}

- (BOOL)readIntoBuffer:(AVAudioPCMBuffer *)buffer frameCount:(AVAudioFrameCount)frames error:(NSError *)outError
{
  uint64_t v6;
  AVAudioPCMBuffer *v8;
  char v9;
  int v10;
  NSError *v11;
  NSError *v12;
  int v13;
  NSError *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  UInt32 v19;
  UInt32 ioNumberFrames;
  NSError *v22;
  id v23;

  v6 = *(_QWORD *)&frames;
  v8 = buffer;
  v9 = *((_QWORD *)self->_impl.__ptr_.__value_ + 1) != 0;
  v23 = 0;
  v10 = _AVAE_CheckAndReturnErr(576, (uint64_t)"-[AVAudioFile readIntoBuffer:frameCount:error:]", (uint64_t)"_impl->isOpen()", v9, 4294967253, &v23);
  v11 = (NSError *)v23;
  v12 = v11;
  if (!v10)
  {
    _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 581, "-[AVAudioFile readIntoBuffer:frameCount:error:]", "buffer != nil", v8 != 0);
    _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 582, "-[AVAudioFile readIntoBuffer:frameCount:error:]", "frames <= buffer.frameCapacity", -[AVAudioPCMBuffer frameCapacity](v8, "frameCapacity") >= v6);
    v22 = v12;
    v13 = _AVAE_CheckAndReturnErr(583, (uint64_t)"-[AVAudioFile readIntoBuffer:frameCount:error:]", (uint64_t)"buffer.frameCapacity != 0", -[AVAudioPCMBuffer frameCapacity](v8, "frameCapacity") != 0, 4294967246, &v22);
    v14 = v22;

    if (v13)
    {
      if (outError)
      {
        v11 = v14;
        goto LABEL_7;
      }
    }
    else
    {
      v16 = AVAudioFileImpl::CheckClientFormatSet(self->_impl.__ptr_.__value_);
      if (_AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 588, (uint64_t)"-[AVAudioFile readIntoBuffer:frameCount:error:]", (uint64_t)"_impl->CheckClientFormatSet()", v16, outError))
      {
        ioNumberFrames = v6;
        -[AVAudioPCMBuffer setFrameLength:](v8, "setFrameLength:", v6);
        v17 = ExtAudioFileRead(*((ExtAudioFileRef *)self->_impl.__ptr_.__value_ + 1), &ioNumberFrames, -[AVAudioBuffer mutableAudioBufferList](v8, "mutableAudioBufferList"));
        v18 = _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 593, (uint64_t)"-[AVAudioFile readIntoBuffer:frameCount:error:]", (uint64_t)"ExtAudioFileRead(_impl->_extAudioFile, &ioFrames, buffer.mutableAudioBufferList)", v17, outError);
        v19 = ioNumberFrames;
        -[AVAudioPCMBuffer setFrameLength:](v8, "setFrameLength:", ioNumberFrames);
        if (v19)
          v15 = v18;
        else
          v15 = 0;
        goto LABEL_14;
      }
    }
    v15 = 0;
LABEL_14:
    v12 = v14;
    goto LABEL_15;
  }
  if (!outError)
  {
    v15 = 0;
    goto LABEL_15;
  }
LABEL_7:
  v12 = objc_retainAutorelease(v11);
  v15 = 0;
  *outError = v12;
LABEL_15:

  return v15;
}

- (AVAudioFormat)fileFormat
{
  return (AVAudioFormat *)*((id *)self->_impl.__ptr_.__value_ + 5);
}

- (AVAudioFormat)processingFormat
{
  return (AVAudioFormat *)*((id *)self->_impl.__ptr_.__value_ + 3);
}

- (AVAudioFramePosition)length
{
  AVAudioFileImpl *value;
  OpaqueExtAudioFile *v4;
  AVAudioFramePosition v5;
  BOOL v6;
  uint64_t Property;
  UInt32 ioPropertyDataSize;
  AVAudioFramePosition outPropertyData;

  value = self->_impl.__ptr_.__value_;
  v4 = (OpaqueExtAudioFile *)*((_QWORD *)value + 1);
  v5 = *((_QWORD *)value + 4);
  if (v4)
    v6 = v5 == -1;
  else
    v6 = 0;
  if (v6)
  {
    outPropertyData = 0;
    ioPropertyDataSize = 8;
    Property = ExtAudioFileGetProperty(v4, 0x2366726Du, &ioPropertyDataSize, &outPropertyData);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 617, (uint64_t)"-[AVAudioFile length]", (uint64_t)"ExtAudioFileGetProperty(_impl->_extAudioFile, kExtAudioFileProperty_FileLengthFrames, &propSize, &length)", Property, 0);
    v5 = outPropertyData;
    *((_QWORD *)self->_impl.__ptr_.__value_ + 4) = outPropertyData;
  }
  return v5;
}

- (AVAudioFramePosition)framePosition
{
  AVAudioFileImpl *value;
  uint64_t v4;
  uint64_t v5;
  SInt64 outFrameOffset;

  value = self->_impl.__ptr_.__value_;
  if (!*((_QWORD *)value + 1))
    return -1;
  outFrameOffset = 0;
  v4 = AVAudioFileImpl::CheckClientFormatSet(value);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 629, (uint64_t)"-[AVAudioFile framePosition]", (uint64_t)"_impl->CheckClientFormatSet()", v4, 0);
  v5 = ExtAudioFileTell(*((ExtAudioFileRef *)self->_impl.__ptr_.__value_ + 1), &outFrameOffset);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 630, (uint64_t)"-[AVAudioFile framePosition]", (uint64_t)"ExtAudioFileTell(_impl->_extAudioFile, &pos)", v5, 0);
  return outFrameOffset;
}

- (void)setFramePosition:(AVAudioFramePosition)framePosition
{
  AVAudioFileImpl *value;
  uint64_t v6;
  uint64_t v7;

  value = self->_impl.__ptr_.__value_;
  if (*((_QWORD *)value + 1))
  {
    v6 = AVAudioFileImpl::CheckClientFormatSet(value);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 639, (uint64_t)"-[AVAudioFile setFramePosition:]", (uint64_t)"_impl->CheckClientFormatSet()", v6, 0);
    v7 = ExtAudioFileSeek(*((ExtAudioFileRef *)self->_impl.__ptr_.__value_ + 1), framePosition);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioFile.mm", 640, (uint64_t)"-[AVAudioFile setFramePosition:]", (uint64_t)"ExtAudioFileSeek(_impl->_extAudioFile, pos)", v7, 0);
  }
}

- (NSURL)url
{
  return (NSURL *)*(id *)self->_impl.__ptr_.__value_;
}

- (void).cxx_destruct
{
  std::unique_ptr<AVAudioFileImpl>::reset[abi:ne180100]((uint64_t *)&self->_impl, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
