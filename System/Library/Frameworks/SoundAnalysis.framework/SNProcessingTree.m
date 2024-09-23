@implementation SNProcessingTree

- (SNProcessingTree)initWithError:(id *)a3
{
  SNProcessingTree *v4;
  uint64_t v5;
  ProcessingTree *v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  __n128 (*v20)(__n128 *, __n128 *);
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SNProcessingTree;
  v4 = -[SNProcessingTree init](&v25, sel_init);
  if (v4)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x4012000000;
    v20 = sub_1D450564C;
    v21 = sub_1D450565C;
    v23 = 0;
    v24 = 0;
    v22 = &unk_1D45DB8F5;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1D4505664;
    v16[3] = &unk_1E97C4D50;
    v16[4] = &v17;
    if (sub_1D44FE4D8((uint64_t)SNDSPGraphUtilities, v16, (uint64_t)a3))
    {
      v6 = (ProcessingTree *)v18[6];
      v5 = v18[7];
      if (v5)
      {
        v7 = (unint64_t *)(v5 + 8);
        do
          v8 = __ldxr(v7);
        while (__stxr(v8 + 1, v7));
      }
      cntrl = (std::__shared_weak_count *)v4->_processingTree.__cntrl_;
      v4->_processingTree.__ptr_ = v6;
      v4->_processingTree.__cntrl_ = (__shared_weak_count *)v5;
      if (cntrl)
      {
        p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
        do
          v11 = __ldaxr(p_shared_owners);
        while (__stlxr(v11 - 1, p_shared_owners));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
          std::__shared_weak_count::__release_weak(cntrl);
        }
      }
    }
    else
    {

      v4 = 0;
    }
    _Block_object_dispose(&v17, 8);
    v12 = v24;
    if (v24)
    {
      v13 = (unint64_t *)&v24->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }
  return v4;
}

- (shared_ptr<SoundAnalysis::ProcessingTree>)processingTree
{
  ProcessingTree **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<SoundAnalysis::ProcessingTree> result;

  cntrl = self->_processingTree.__cntrl_;
  *v2 = self->_processingTree.__ptr_;
  v2[1] = (ProcessingTree *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (ProcessingTree *)self;
  return result;
}

- (BOOL)processBuffer:(id)a3 framePosition:(int64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  SNProcessingTree *v13;
  int64_t v14;

  v8 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D45057C4;
  v11[3] = &unk_1E97C4D78;
  v13 = self;
  v14 = a4;
  v12 = v8;
  v9 = v8;
  LOBYTE(a5) = sub_1D44FE4D8((uint64_t)SNDSPGraphUtilities, v11, (uint64_t)a5);

  return (char)a5;
}

- (id)maxFramesPerSliceWithError:(id *)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D450589C;
  v4[3] = &unk_1E97C46D8;
  v4[4] = self;
  sub_1D44FCF34((uint64_t)SNDSPGraphUtilities, v4, (uint64_t)a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)writeDSPGraphDotFilesToDirectory:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D4505968;
  v9[3] = &unk_1E97C4840;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  LOBYTE(a4) = sub_1D44FE4D8((uint64_t)SNDSPGraphUtilities, v9, (uint64_t)a4);

  return (char)a4;
}

- (BOOL)setProcessingContexts:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SNProcessingTree *v11;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D4505A90;
  v9[3] = &unk_1E97C4840;
  v10 = v6;
  v11 = self;
  v7 = v6;
  LOBYTE(a4) = sub_1D44FE4D8((uint64_t)SNDSPGraphUtilities, v9, (uint64_t)a4);

  return (char)a4;
}

- (BOOL)setFormat:(SNFormatAndBlockSize *)a3 error:(id *)a4
{
  __int128 v4;
  __int128 v5;
  _QWORD v7[5];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v7[1] = 3221225472;
  v4 = *(_OWORD *)&a3->var0.mBytesPerPacket;
  v8 = *(_OWORD *)&a3->var0.mSampleRate;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = sub_1D4505D48;
  v7[3] = &unk_1E97C4DA0;
  v5 = *(_OWORD *)&a3->var0.mBitsPerChannel;
  v9 = v4;
  v10 = v5;
  v7[4] = self;
  return sub_1D44FE4D8((uint64_t)SNDSPGraphUtilities, v7, (uint64_t)a4);
}

- (id)clientSampleTimeFromSampleTime:(int64_t)a3 fromBox:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  int64_t v14;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D4505E50;
  v12[3] = &unk_1E97C4DC8;
  v13 = v8;
  v14 = a3;
  v12[4] = self;
  v9 = v8;
  sub_1D44FCF34((uint64_t)SNDSPGraphUtilities, v12, (uint64_t)a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)clientSampleRateWithError:(id *)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D4505F00;
  v4[3] = &unk_1E97C46D8;
  v4[4] = self;
  sub_1D44FCF34((uint64_t)SNDSPGraphUtilities, v4, (uint64_t)a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  sub_1D44DAAE4((uint64_t)&self->_processingTree);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
