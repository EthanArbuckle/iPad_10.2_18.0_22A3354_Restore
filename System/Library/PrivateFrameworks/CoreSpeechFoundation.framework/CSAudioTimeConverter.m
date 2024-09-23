@implementation CSAudioTimeConverter

- (CSAudioTimeConverter)init
{
  CSAudioTimeConverter *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSAudioTimeConverter;
  v2 = -[CSAudioTimeConverter init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSSampleCountHostTimeConverter", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_anchorSampleCount = 0;
    v2->_anchorHostTime = 0;
  }
  return v2;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[anchorHostTime = %llu]"), self->_anchorHostTime);
  objc_msgSend(v3, "appendFormat:", CFSTR("[anchorSampleCount = %llu]"), self->_anchorSampleCount);
  return v3;
}

- (void)processSampleCount:(unint64_t)a3 hostTime:(unint64_t)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CSAudioTimeConverter_processSampleCount_hostTime___block_invoke;
  block[3] = &unk_1E687F490;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (unint64_t)hostTimeFromSampleCount:(unint64_t)a3
{
  NSObject *queue;
  unint64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSAudioTimeConverter_hostTimeFromSampleCount___block_invoke;
  block[3] = &unk_1E6880E38;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (unint64_t)sampleCountFromHostTime:(unint64_t)a3
{
  NSObject *queue;
  unint64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSAudioTimeConverter_sampleCountFromHostTime___block_invoke;
  block[3] = &unk_1E6880E38;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)anchorSampleCount
{
  return self->_anchorSampleCount;
}

- (void)setAnchorSampleCount:(unint64_t)a3
{
  self->_anchorSampleCount = a3;
}

- (unint64_t)anchorHostTime
{
  return self->_anchorHostTime;
}

- (void)setAnchorHostTime:(unint64_t)a3
{
  self->_anchorHostTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

unint64_t __48__CSAudioTimeConverter_sampleCountFromHostTime___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;

  v2 = a1[6];
  v3 = a1[4];
  v5 = *(_QWORD *)(v3 + 16);
  v4 = *(_QWORD *)(v3 + 24);
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  result = +[CSFTimeUtils sampleCountFromHostTime:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "sampleCountFromHostTime:anchorHostTime:anchorSampleCount:sampleRate:", v2, v4, v5);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

unint64_t __48__CSAudioTimeConverter_hostTimeFromSampleCount___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;

  v2 = a1[6];
  v3 = a1[4];
  v5 = *(_QWORD *)(v3 + 16);
  v4 = *(_QWORD *)(v3 + 24);
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  result = +[CSFTimeUtils hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:", v2, v4, v5);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

_QWORD *__52__CSAudioTimeConverter_processSampleCount_hostTime___block_invoke(_QWORD *result)
{
  *(_QWORD *)(result[4] + 16) = result[5];
  *(_QWORD *)(result[4] + 24) = result[6];
  return result;
}

@end
