@implementation AUAudioUnitOfflineProcessor

- (AUAudioUnitOfflineProcessor)initWithAudioUnit:(id)a3 inputFileURL:(id)a4 outputFileURL:(id)a5 ioSampleRate:(int64_t)a6
{
  id v11;
  const __CFURL *v12;
  const __CFURL *v13;
  char *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  BOOL v19;
  OSStatus v20;
  NSObject *v21;
  ExtAudioFileRef *v23;
  OSStatus Property;
  NSObject *v25;
  OSStatus v26;
  double v27;
  OSStatus v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  OSStatus v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  _QWORD v44[4];
  id v45;
  id location;
  id v47;
  id v48;
  UInt32 ioPropertyDataSize;
  ExtAudioFileRef outExtAudioFile;
  objc_super v51;
  _BYTE v52[24];
  AudioStreamBasicDescription inPropertyData;
  uint8_t buf[32];
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = (const __CFURL *)a4;
  v13 = (const __CFURL *)a5;
  v51.receiver = self;
  v51.super_class = (Class)AUAudioUnitOfflineProcessor;
  v14 = -[AUAudioUnitOfflineProcessor init](&v51, sel_init);
  if (!v14)
    goto LABEL_20;
  if (!v11)
    goto LABEL_6;
  v15 = objc_msgSend(v11, "renderResourcesAllocated") ^ 1;
  if (!v12)
    LOBYTE(v15) = 0;
  if ((v15 & 1) == 0)
  {
LABEL_6:
    APCLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229580000, v16, OS_LOG_TYPE_ERROR, "Bad input argument to AUAudioUnitOfflineProcessor", buf, 2u);
    }
LABEL_18:

LABEL_19:
    v14 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v11, "inputBusses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count") != 1)
  {

LABEL_16:
    APCLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229580000, v16, OS_LOG_TYPE_ERROR, "AUAudioUnitOfflineProcessor only supports single bus IO audio units", buf, 2u);
    }
    goto LABEL_18;
  }
  objc_msgSend(v11, "outputBusses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count") == 1;

  if (!v19)
    goto LABEL_16;
  objc_storeStrong((id *)v14 + 3, a3);
  outExtAudioFile = 0;
  v20 = ExtAudioFileOpenURL(v12, &outExtAudioFile);
  if (v20)
  {
    APCLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "open input file";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v20;
      _os_log_impl(&dword_229580000, v21, OS_LOG_TYPE_ERROR, "Error creating offline processor: failed to %s (error %d)", buf, 0x12u);
    }

    goto LABEL_19;
  }
  v23 = (ExtAudioFileRef *)(v14 + 8);
  std::unique_ptr<OpaqueExtAudioFile,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueExtAudioFile*,&(ExtAudioFileDispose)>>::reset[abi:ne180100]((OpaqueExtAudioFile **)v14 + 1, outExtAudioFile);
  ioPropertyDataSize = 8;
  Property = ExtAudioFileGetProperty(*((ExtAudioFileRef *)v14 + 1), 0x2366726Du, &ioPropertyDataSize, v14 + 144);
  if (Property)
  {
    APCLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "query input file length";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = Property;
      _os_log_impl(&dword_229580000, v25, OS_LOG_TYPE_ERROR, "Error creating offline processor: failed to %s (error %d)", buf, 0x12u);
    }
LABEL_34:

    goto LABEL_19;
  }
  v55 = 0;
  memset(buf, 0, sizeof(buf));
  ioPropertyDataSize = 40;
  v26 = ExtAudioFileGetProperty(*v23, 0x66666D74u, &ioPropertyDataSize, buf);
  if (v26)
  {
    APCLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(inPropertyData.mSampleRate) = 136315394;
      *(_QWORD *)((char *)&inPropertyData.mSampleRate + 4) = "query input file format";
      LOWORD(inPropertyData.mFormatFlags) = 1024;
      *(AudioFormatFlags *)((char *)&inPropertyData.mFormatFlags + 2) = v26;
      _os_log_impl(&dword_229580000, v25, OS_LOG_TYPE_ERROR, "Error creating offline processor: failed to %s (error %d)", (uint8_t *)&inPropertyData, 0x12u);
    }
    goto LABEL_34;
  }
  v27 = *(double *)buf;
  if (a6 >= 0)
    v27 = (double)a6;
  inPropertyData.mSampleRate = v27;
  *(_OWORD *)&inPropertyData.mFormatID = xmmword_2295A2CB0;
  *(_OWORD *)&inPropertyData.mBytesPerFrame = xmmword_2295A2CC0;
  v28 = ExtAudioFileSetProperty(*v23, 0x63666D74u, 0x28u, &inPropertyData);
  if (v28)
  {
    APCLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v52 = 136315394;
      *(_QWORD *)&v52[4] = "set input file client data format";
      *(_WORD *)&v52[12] = 1024;
      *(_DWORD *)&v52[14] = v28;
      _os_log_impl(&dword_229580000, v25, OS_LOG_TYPE_ERROR, "Error creating offline processor: failed to %s (error %d)", v52, 0x12u);
    }
    goto LABEL_34;
  }
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithStreamDescription:", &inPropertyData);
  objc_msgSend(v11, "inputBusses");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend(v31, "setFormat:error:", v29, &v48);
  v32 = v48;

  if (v32)
  {
    APCLogObject();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v52 = 138412290;
      *(_QWORD *)&v52[4] = v32;
      _os_log_impl(&dword_229580000, v33, OS_LOG_TYPE_ERROR, "Error setting the AU input bus format: %@", v52, 0xCu);
    }

LABEL_43:
    v37 = v14;
LABEL_44:

    goto LABEL_19;
  }
  objc_msgSend(v11, "outputBusses");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(v35, "setFormat:error:", v29, &v47);
  v32 = v47;

  if (v32)
  {
    APCLogObject();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v52 = 138412290;
      *(_QWORD *)&v52[4] = v32;
      _os_log_impl(&dword_229580000, v36, OS_LOG_TYPE_ERROR, "Error setting the AU output bus format: %@", v52, 0xCu);
    }

    goto LABEL_43;
  }
  if (v13)
  {
    v38 = ExtAudioFileCreateWithURL(v13, 0x57415645u, &inPropertyData, 0, 1u, &outExtAudioFile);
    if (v38)
    {
      APCLogObject();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v52 = 136315394;
        *(_QWORD *)&v52[4] = "create output file";
        *(_WORD *)&v52[12] = 1024;
        *(_DWORD *)&v52[14] = v38;
        _os_log_impl(&dword_229580000, v37, OS_LOG_TYPE_ERROR, "Error creating offline processor: failed to %s (error %d)", v52, 0x12u);
      }
      v32 = v14;
      goto LABEL_44;
    }
    std::unique_ptr<OpaqueExtAudioFile,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueExtAudioFile*,&(ExtAudioFileDispose)>>::reset[abi:ne180100]((OpaqueExtAudioFile **)v14 + 2, outExtAudioFile);
  }
  objc_initWeak(&location, v14);
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __89__AUAudioUnitOfflineProcessor_initWithAudioUnit_inputFileURL_outputFileURL_ioSampleRate___block_invoke;
  v44[3] = &unk_24F24BC48;
  objc_copyWeak(&v45, &location);
  v39 = MEMORY[0x22E2CB86C](v44);
  v40 = (void *)*((_QWORD *)v14 + 17);
  *((_QWORD *)v14 + 17) = v39;

  -[AUAudioUnitOfflineProcessor initWithAudioUnit:inputFileURL:outputFileURL:ioSampleRate:]::$_0::operator()<CA::StreamDescription,std::vector<float>>((uint64_t)&inPropertyData, (char **)v14 + 11, (uint64_t)v52);
  v41 = (void *)*((_QWORD *)v14 + 5);
  if (v41)
  {
    *((_QWORD *)v14 + 6) = v41;
    operator delete(v41);
    *((_QWORD *)v14 + 5) = 0;
    *((_QWORD *)v14 + 6) = 0;
    *((_QWORD *)v14 + 7) = 0;
  }
  *(_OWORD *)(v14 + 40) = *(_OWORD *)v52;
  *((_QWORD *)v14 + 7) = *(_QWORD *)&v52[16];
  -[AUAudioUnitOfflineProcessor initWithAudioUnit:inputFileURL:outputFileURL:ioSampleRate:]::$_0::operator()<CA::StreamDescription,std::vector<float>>((uint64_t)&inPropertyData, (char **)v14 + 14, (uint64_t)v52);
  v42 = (void *)*((_QWORD *)v14 + 8);
  if (v42)
  {
    *((_QWORD *)v14 + 9) = v42;
    operator delete(v42);
    *((_QWORD *)v14 + 8) = 0;
    *((_QWORD *)v14 + 9) = 0;
    *((_QWORD *)v14 + 10) = 0;
  }
  *((_OWORD *)v14 + 4) = *(_OWORD *)v52;
  *((_QWORD *)v14 + 10) = *(_QWORD *)&v52[16];
  APCLogObject();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v52 = 0;
    _os_log_impl(&dword_229580000, v43, OS_LOG_TYPE_INFO, "Finished offline processor init", v52, 2u);
  }

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);

LABEL_20:
  return (AUAudioUnitOfflineProcessor *)v14;
}

uint64_t __89__AUAudioUnitOfflineProcessor_initWithAudioUnit_inputFileURL_outputFileURL_ioSampleRate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, UInt32 a4, uint64_t a5, uint64_t a6)
{
  id WeakRetained;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  std::logic_error *exception;
  UInt32 ioNumberFrames;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  ioNumberFrames = a4;
  v9 = ExtAudioFileRead(*((ExtAudioFileRef *)WeakRetained + 1), &ioNumberFrames, *((AudioBufferList **)WeakRetained + 5));
  if ((_DWORD)v9)
  {
    APCLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v9;
      _os_log_impl(&dword_229580000, v10, OS_LOG_TYPE_ERROR, "Read of source file error: %d", buf, 8u);
    }

  }
  else
  {
    if (ioNumberFrames != a4)
    {
      APCLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229580000, v11, OS_LOG_TYPE_ERROR, "Read of source file returned an unexpected number of frames", buf, 2u);
      }

    }
    *(_DWORD *)a6 = 1;
    *(_DWORD *)(a6 + 8) = 1;
    v12 = *((_QWORD *)WeakRetained + 5);
    if (!*(_DWORD *)v12)
    {
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::logic_error::logic_error(exception, "accessing a CA::BufferList with an out-of-range index");
      exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
      __cxa_throw(exception, (struct type_info *)off_24F24AF80, MEMORY[0x24BEDAB00]);
    }
    *(_QWORD *)(a6 + 16) = *(_QWORD *)(v12 + 16);
    *(_DWORD *)(a6 + 12) = *(_DWORD *)(v12 + 12);
  }

  return v9;
}

- (double)initWithAudioUnit:inputFileURL:outputFileURL:ioSampleRate:
{
  uint64_t v6;
  unint64_t v7;
  std::vector<char>::pointer begin;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  std::vector<char>::pointer v12;
  uint64_t v13;
  double result;
  std::vector<char>::value_type __x[4];
  std::vector<char> v16;

  if ((*(_DWORD *)(a1 + 12) & 0x20) != 0)
    v6 = *(unsigned int *)(a1 + 28);
  else
    v6 = 1;
  __x[0] = 0;
  std::vector<char>::vector(&v16, (16 * v6) | 8, __x);
  *(_DWORD *)v16.__begin_ = v6;
  if ((*(_DWORD *)(a1 + 12) & 0x20) != 0)
    v7 = (*(_DWORD *)(a1 + 28) << 11);
  else
    v7 = 2048;
  *(_DWORD *)__x = 0;
  std::vector<float>::assign(a2, v7, __x);
  begin = v16.__begin_;
  v9 = *(unsigned int *)v16.__begin_;
  if ((_DWORD)v9)
  {
    v10 = 0;
    v11 = *a2;
    v12 = v16.__begin_ + 16;
    v13 = v9 << 11;
    do
    {
      *(_QWORD *)v12 = &v11[4 * (v10 & 0xFFFFF800)];
      *((_QWORD *)v12 - 1) = 0x200000000001;
      v10 += 2048;
      v12 += 16;
    }
    while (v13 != v10);
  }
  *(_QWORD *)a3 = begin;
  result = *(double *)&v16.__end_;
  *(_OWORD *)(a3 + 8) = *(_OWORD *)&v16.__end_;
  return result;
}

- (BOOL)run
{
  AUAudioUnit *audioUnit;
  BOOL v4;
  id v5;
  BOOL v6;
  void *v7;
  id renderBlock;
  SInt64 assetLength;
  int v10;
  unsigned int v11;
  UInt32 v12;
  OpaqueExtAudioFile *value;
  OSStatus v14;
  OSStatus v15;
  BOOL v17;
  NSObject *v18;
  NSObject *v20;
  SInt64 outFrameOffset;
  id v23;
  uint8_t v24[4];
  OSStatus v25;
  uint8_t buf[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  audioUnit = self->_audioUnit;
  v23 = 0;
  v4 = -[AUAudioUnit allocateRenderResourcesAndReturnError:](audioUnit, "allocateRenderResourcesAndReturnError:", &v23);
  v5 = v23;
  if (v5)
    v6 = 0;
  else
    v6 = v4;
  if (!v6)
  {
    APCLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v5;
      _os_log_impl(&dword_229580000, v18, OS_LOG_TYPE_ERROR, "Allocate resources failed on AU: %@", buf, 0xCu);
    }

LABEL_21:
    v17 = 0;
    goto LABEL_22;
  }
  -[AUAudioUnit renderBlock](self->_audioUnit, "renderBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  renderBlock = self->_renderBlock;
  self->_renderBlock = v7;

  v28 = 0u;
  v29 = 0u;
  *(_OWORD *)buf = 0u;
  v27 = 0u;
  ExtAudioFileSeek(self->_srcFile.__ptr_.__value_, 0);
  outFrameOffset = 0;
  assetLength = self->_assetLength;
  if (assetLength >= 1)
  {
    v10 = 0;
    while (1)
    {
      v11 = assetLength - v10;
      v12 = v11 >= 0x800 ? 2048 : v11;
      (*((void (**)(void))self->_renderBlock + 2))();
      value = self->_destFile.__ptr_.__value_;
      if (value)
      {
        v14 = ExtAudioFileWrite(value, v12, (const AudioBufferList *)self->_destBufferList.mStorage.__begin_);
        v15 = v14;
        if ((v14 + 66560) >= 2 && v14 != 0)
          break;
      }
      *(double *)buf = *(double *)buf + (double)v12;
      ExtAudioFileTell(self->_srcFile.__ptr_.__value_, &outFrameOffset);
      v10 = outFrameOffset;
      assetLength = self->_assetLength;
      if (outFrameOffset >= assetLength)
        goto LABEL_17;
    }
    APCLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v24 = 67109120;
      v25 = v15;
      _os_log_impl(&dword_229580000, v20, OS_LOG_TYPE_ERROR, "AUAudioUnitOfflineProcessor write to output file failed (error %d)", v24, 8u);
    }

    goto LABEL_21;
  }
LABEL_17:
  std::unique_ptr<OpaqueExtAudioFile,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueExtAudioFile*,&(ExtAudioFileDispose)>>::reset[abi:ne180100](&self->_destFile.__ptr_.__value_, 0);
  v17 = 1;
LABEL_22:

  return v17;
}

- (int64_t)assetLength
{
  return self->_assetLength;
}

- (void).cxx_destruct
{
  float *begin;
  float *v4;
  char *v5;
  char *v6;

  objc_storeStrong(&self->_pullInputBlock, 0);
  begin = self->_destAudioStorage.__begin_;
  if (begin)
  {
    self->_destAudioStorage.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_srcAudioStorage.__begin_;
  if (v4)
  {
    self->_srcAudioStorage.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_destBufferList.mStorage.__begin_;
  if (v5)
  {
    self->_destBufferList.mStorage.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_srcBufferList.mStorage.__begin_;
  if (v6)
  {
    self->_srcBufferList.mStorage.__end_ = v6;
    operator delete(v6);
  }
  objc_storeStrong(&self->_renderBlock, 0);
  objc_storeStrong((id *)&self->_audioUnit, 0);
  std::unique_ptr<OpaqueExtAudioFile,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueExtAudioFile*,&(ExtAudioFileDispose)>>::reset[abi:ne180100](&self->_destFile.__ptr_.__value_, 0);
  std::unique_ptr<OpaqueExtAudioFile,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueExtAudioFile*,&(ExtAudioFileDispose)>>::reset[abi:ne180100](&self->_srcFile.__ptr_.__value_, 0);
}

- (id).cxx_construct
{
  std::vector<char>::value_type __x;
  std::vector<char>::value_type v5;

  self->_srcFile.__ptr_.__value_ = 0;
  self->_destFile.__ptr_.__value_ = 0;
  __x = 0;
  std::vector<char>::vector((std::vector<char> *)&self->_srcBufferList, 8uLL, &__x);
  *(_DWORD *)self->_srcBufferList.mStorage.__begin_ = 0;
  v5 = 0;
  std::vector<char>::vector((std::vector<char> *)&self->_destBufferList, 8uLL, &v5);
  *(_DWORD *)self->_destBufferList.mStorage.__begin_ = 0;
  *(_OWORD *)&self->_srcAudioStorage.__begin_ = 0u;
  *(_OWORD *)&self->_srcAudioStorage.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_destAudioStorage.__end_ = 0u;
  return self;
}

@end
