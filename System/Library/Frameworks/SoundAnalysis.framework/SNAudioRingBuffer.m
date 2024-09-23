@implementation SNAudioRingBuffer

- (SNAudioRingBuffer)initWithFormat:(id)a3 capacityFrames:(int64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  AT::RingBuffer *v10;
  AT::RingBuffer *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  int64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  AT::RingBuffer *(*v24)(uint64_t);
  uint64_t v25;
  AT::RingBuffer *v26;
  objc_super v27;

  v8 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SNAudioRingBuffer;
  v9 = -[SNAudioRingBuffer init](&v27, sel_init);
  if (v9)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3812000000;
    v23 = sub_1D4501FB0;
    v24 = sub_1D4501FC0;
    v25 = 0;
    v26 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1D4501FCC;
    v16[3] = &unk_1E97C4BC0;
    v18 = &v20;
    v17 = v8;
    v19 = a4;
    if (sub_1D44FE4D8((uint64_t)SNDSPGraphUtilities, v16, (uint64_t)a5))
    {
      v10 = (AT::RingBuffer *)v21[6];
      v21[6] = 0;
      sub_1D4502904((AT::RingBuffer **)v9 + 1, v10);
    }
    else
    {

      v9 = 0;
    }

    _Block_object_dispose(&v20, 8);
    v11 = v26;
    v26 = 0;
    if (v11)
    {
      AT::RingBuffer::~RingBuffer(v11);
      MEMORY[0x1D825DA8C](v12, 0x1020C4047CAF6D5, v13, v14);
    }
  }

  return (SNAudioRingBuffer *)v9;
}

- (id)formatWithError:(id *)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D45020C4;
  v4[3] = &unk_1E97C4BE8;
  v4[4] = self;
  sub_1D44FCF34((uint64_t)SNDSPGraphUtilities, v4, (uint64_t)a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)resizeWithFormat:(id)a3 newCapacityFrames:(unsigned int)a4 error:(id *)a5
{
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  unsigned int v13;

  v8 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D45021B0;
  v11[3] = &unk_1E97C4C10;
  v11[4] = self;
  v12 = v8;
  v13 = a4;
  v9 = v8;
  LOBYTE(a5) = sub_1D44FE4D8((uint64_t)SNDSPGraphUtilities, v11, (uint64_t)a5);

  return (char)a5;
}

- (id)capacityFramesWithError:(id *)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D4502308;
  v4[3] = &unk_1E97C46D8;
  v4[4] = self;
  sub_1D44FCF34((uint64_t)SNDSPGraphUtilities, v4, (uint64_t)a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)getTimeBoundsWithStartTime:(int64_t *)a3 endTime:(int64_t *)a4
{
  void *v4;
  id v5;
  char v6;
  id v8;
  _QWORD v9[7];

  v8 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D45023E0;
  v9[3] = &unk_1E97C4C38;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  sub_1D44FCF34((uint64_t)SNDSPGraphUtilities, v9, (uint64_t)&v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6 = objc_msgSend(v4, "BOOLValue");

  return v6;
}

- (BOOL)store:(const AudioBufferList *)a3 frameCount:(unsigned int)a4 frameNumber:(int64_t)a5 error:(id *)a6
{
  _QWORD v7[7];
  unsigned int v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D4502488;
  v7[3] = &unk_1E97C4C60;
  v7[4] = self;
  v7[5] = a3;
  v8 = a4;
  v7[6] = a5;
  return sub_1D44FE4D8((uint64_t)SNDSPGraphUtilities, v7, (uint64_t)a6);
}

- (BOOL)fetch:(AudioBufferList *)a3 frameCount:(unsigned int)a4 frameNumber:(int64_t)a5 error:(id *)a6
{
  _QWORD v7[7];
  unsigned int v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D4502520;
  v7[3] = &unk_1E97C4C60;
  v7[4] = self;
  v7[5] = a3;
  v8 = a4;
  v7[6] = a5;
  return sub_1D44FE4D8((uint64_t)SNDSPGraphUtilities, v7, (uint64_t)a6);
}

+ (id)copyToAVAudioBufferFrom:(id)a3 ringBufferStartSampleTime:(int64_t *)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  int64_t *v13;

  v7 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D4502600;
  v11[3] = &unk_1E97C4C88;
  v12 = v7;
  v13 = a4;
  v8 = v7;
  sub_1D44FCF34((uint64_t)SNDSPGraphUtilities, v11, (uint64_t)a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)copyRecentFramesOfAudioRingBufferToAVAudioBufferFrom:(id)a3 frameCount:(int64_t)a4 ringBufferStartSampleTime:(int64_t *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v12;
  _QWORD v13[4];
  id v14;
  int64_t v15;
  int64_t *v16;

  v7 = a3;
  v12 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1D45027D4;
  v13[3] = &unk_1E97C4CB0;
  v14 = v7;
  v15 = a4;
  v16 = a5;
  v8 = v7;
  sub_1D44FCF34((uint64_t)SNDSPGraphUtilities, v13, (uint64_t)&v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;

  return v9;
}

+ (BOOL)copyRecentFramesFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D45028CC;
  v12[3] = &unk_1E97C4840;
  v13 = v7;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  LOBYTE(a5) = sub_1D44FE4D8((uint64_t)SNDSPGraphUtilities, v12, (uint64_t)a5);

  return (char)a5;
}

- (void).cxx_destruct
{
  sub_1D4502904((AT::RingBuffer **)&self->_ringBuffer, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
