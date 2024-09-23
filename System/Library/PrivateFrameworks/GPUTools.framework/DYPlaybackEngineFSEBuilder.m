@implementation DYPlaybackEngineFSEBuilder

- (DYPlaybackEngineFSEBuilder)init
{
  -[DYPlaybackEngineFSEBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DYPlaybackEngineFSEBuilder)initWithPlaybackEngineCache:(void *)a3
{
  DYPlaybackEngineFSEBuilder *v4;
  DYPlaybackEngineFSEBuilder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DYPlaybackEngineFSEBuilder;
  v4 = -[DYCaptureVisitor init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_cache = a3;
    -[DYInOrderInstructionFilesVisitor setVisitDeltaFiles:](v4, "setVisitDeltaFiles:", 1);
  }
  return v5;
}

- (void)visitCaptureStore:(id)a3
{
  _QWORD *cache;
  objc_super v5;

  self->_store = (DYCaptureStore *)a3;
  v5.receiver = self;
  v5.super_class = (Class)DYPlaybackEngineFSEBuilder;
  -[DYInOrderInstructionFilesVisitor visitCaptureStore:](&v5, sel_visitCaptureStore_);
  self->_store = 0;
  cache = self->_cache;
  if (cache[3] != *cache)
  {
    if (cache[4] != *cache)
      return;
LABEL_5:
    cache[4] = cache[1];
    return;
  }
  cache[3] = cache[1];
  cache = self->_cache;
  if (cache[4] == *cache)
    goto LABEL_5;
}

- (void)visitFunctionStreamFile:(id)a3
{
  uint64_t v5;
  id v6;
  _QWORD *cache;
  uint64_t *v8;
  _QWORD *v9;
  id *v10;
  NSData *v11;
  NSData *v12;
  _QWORD *v13;
  __int128 v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  GPUTools::Playback::DecodedFunctionStream *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  GPUTools::Playback::DecodedFunctionStream *v31;
  GPUTools::Playback::DecodedFunctionStream *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  GPUTools::Playback::FunctionStreamEntry *v40[2];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;

  v5 = operator new();
  v6 = a3;
  *(_QWORD *)v5 = 0;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(v5 + 8));
  *(_OWORD *)(v5 + 464) = 0u;
  *(_OWORD *)(v5 + 480) = 0u;
  *(_QWORD *)(v5 + 504) = 0;
  *(_QWORD *)(v5 + 512) = 0;
  *(_QWORD *)(v5 + 520) = v6;
  cache = self->_cache;
  v40[0] = (GPUTools::Playback::FunctionStreamEntry *)v5;
  v8 = (uint64_t *)cache[1];
  if ((unint64_t)v8 >= cache[2])
  {
    v9 = std::vector<std::unique_ptr<GPUTools::Playback::FunctionStreamEntry>>::__push_back_slow_path<std::unique_ptr<GPUTools::Playback::FunctionStreamEntry>>(cache, (uint64_t *)v40);
  }
  else
  {
    v40[0] = 0;
    *v8 = v5;
    v9 = v8 + 1;
  }
  cache[1] = v9;
  v10 = (id *)v40[0];
  v40[0] = 0;
  if (v10)
  {
    GPUTools::Playback::FunctionStreamEntry::~FunctionStreamEntry(v10);
    MEMORY[0x24262211C]();
  }
  v46 = 0;
  v11 = (NSData *)objc_msgSend(a3, "copyMutableData:", &v46);
  if (!v11)
    goto LABEL_29;
  v12 = v11;
  v13 = (_QWORD *)(v5 + 504);
  GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::Create(v11, 0, &v46, v40);
  v14 = *(_OWORD *)v40;
  v40[0] = 0;
  v40[1] = 0;
  v15 = *(std::__shared_weak_count **)(v5 + 512);
  *(_OWORD *)(v5 + 504) = v14;
  if (!v15)
    goto LABEL_11;
  p_shared_owners = (unint64_t *)&v15->__shared_owners_;
  do
    v17 = __ldaxr(p_shared_owners);
  while (__stlxr(v17 - 1, p_shared_owners));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
    v18 = (std::__shared_weak_count *)v40[1];
    if (!v40[1])
      goto LABEL_15;
  }
  else
  {
LABEL_11:
    v18 = (std::__shared_weak_count *)v40[1];
    if (!v40[1])
      goto LABEL_15;
  }
  v19 = (unint64_t *)&v18->__shared_owners_;
  do
    v20 = __ldaxr(v19);
  while (__stlxr(v20 - 1, v19));
  if (!v20)
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);

    v21 = *v13;
    if (*v13)
      goto LABEL_16;
LABEL_29:
    _DYOLog();
    return;
  }
LABEL_15:

  v21 = *v13;
  if (!*v13)
    goto LABEL_29;
LABEL_16:
  (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)(v21 + 8) + 40))(*(_QWORD *)(v21 + 8), 0);
  v22 = self->_cache;
  v23 = v22[7];
  if (v23 && self->_buildDecodedFunctionStreams)
  {
    v24 = v23 - v22[8];
    v25 = operator new();
    GPUTools::Playback::DecodedFunctionStream::DecodedFunctionStream(v25, self->_store, a3, *v13, v24, (char *)self->_cache + 120);
    v26 = *(GPUTools::Playback::DecodedFunctionStream **)v5;
    *(_QWORD *)v5 = v25;
    if (v26)
    {
      GPUTools::Playback::DecodedFunctionStream::~DecodedFunctionStream(v26);
      MEMORY[0x24262211C]();
      v25 = *(_QWORD *)v5;
    }
    v27 = *v13;
    v28 = *(_QWORD *)(*v13 + 24);
    GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v40);
    v41 = v28;
    v42 = v28;
    v43 = *(_QWORD *)(v27 + 24);
    v44 = *(_QWORD *)(v27 + 8);
    v45 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v44 + 16))(v44);
    v29 = *(_QWORD *)(v25 + 456);
    v30 = v41;
    GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)v40);
    if (v29 == v30)
    {
      v31 = *(GPUTools::Playback::DecodedFunctionStream **)v5;
      *((_QWORD *)self->_cache + 8) += *(_QWORD *)(*(_QWORD *)v5 + 528);
      goto LABEL_33;
    }
    v31 = *(GPUTools::Playback::DecodedFunctionStream **)v5;
    if (*(_QWORD *)(*(_QWORD *)v5 + 504) != *(_QWORD *)(*(_QWORD *)v5 + 496))
    {
      *((_QWORD *)self->_cache + 7) = 0;
LABEL_33:
      GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v40);
      v33 = *((_QWORD *)v31 + 57);
      v34 = *((_QWORD *)v31 + 58);
      v41 = v33;
      v42 = v34;
      v35 = *((_QWORD *)v31 + 59);
      v36 = *((_QWORD *)v31 + 60);
      v43 = v35;
      v44 = v36;
      v37 = *((_BYTE *)v31 + 488);
      goto LABEL_34;
    }
    *(_QWORD *)v5 = 0;
    GPUTools::Playback::DecodedFunctionStream::~DecodedFunctionStream(v31);
    MEMORY[0x24262211C]();
    v31 = *(GPUTools::Playback::DecodedFunctionStream **)v5;
    *((_QWORD *)self->_cache + 7) = 0;
    if (v31)
      goto LABEL_33;
  }
  else
  {
    v32 = *(GPUTools::Playback::DecodedFunctionStream **)v5;
    if (*(_QWORD *)v5)
    {
      GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v40);
      v33 = *((_QWORD *)v32 + 57);
      v34 = *((_QWORD *)v32 + 58);
      v41 = v33;
      v42 = v34;
      v35 = *((_QWORD *)v32 + 59);
      v36 = *((_QWORD *)v32 + 60);
      v43 = v35;
      v44 = v36;
      v37 = *((_BYTE *)v32 + 488);
LABEL_34:
      v45 = v37;
      goto LABEL_35;
    }
  }
  v38 = *v13;
  v39 = *(_QWORD *)(*v13 + 16);
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v40);
  v41 = v39;
  v42 = v39;
  v43 = *(_QWORD *)(v38 + 24);
  v44 = *(_QWORD *)(v38 + 8);
  v37 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v44 + 16))(v44);
  v45 = v37;
  v33 = v41;
  v34 = v42;
  v35 = v43;
  v36 = v44;
LABEL_35:
  *(_QWORD *)(v5 + 464) = v33;
  *(_QWORD *)(v5 + 472) = v34;
  *(_QWORD *)(v5 + 480) = v35;
  *(_QWORD *)(v5 + 488) = v36;
  *(_BYTE *)(v5 + 496) = v37;
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)v40);
}

- (void)performPreVisitActions
{
  std::vector<std::unique_ptr<GPUTools::Playback::FunctionStreamEntry>>::reserve((uint64_t)self->_cache, -[NSArray count](self->super._captureFiles, "count")+ -[NSArray count](self->super._initialPhaseFiles, "count")+ -[NSArray count](self->super._deltaFiles, "count"));
  *((_QWORD *)self->_cache + 3) = *(_QWORD *)self->_cache;
  *((_QWORD *)self->_cache + 4) = *(_QWORD *)self->_cache;
}

- (void)performPreCaptureVisitActions
{
  *((_QWORD *)self->_cache + 3) = *((_QWORD *)self->_cache + 1);
  self->_buildDecodedFunctionStreams = 1;
}

- (void)performPostCaptureVisitActions
{
  *((_QWORD *)self->_cache + 4) = *((_QWORD *)self->_cache + 1);
}

- (void)visitFunctionStreamFile:(GPUTools::Playback::DecodedFunctionStream *)a1 .cold.1(GPUTools::Playback::DecodedFunctionStream *a1)
{
  GPUTools::Playback::DecodedFunctionStream::~DecodedFunctionStream(a1);
  JUMPOUT(0x24262211CLL);
}

@end
