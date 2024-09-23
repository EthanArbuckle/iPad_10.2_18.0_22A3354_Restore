@implementation SNAudioBufferList

- (SNAudioBufferList)initWithFormat:(id)a3
{
  id v4;
  SNAudioBufferList *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  CABufferList *v9;
  CABufferList *value;
  _OWORD v12[2];
  uint64_t v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SNAudioBufferList;
  v5 = -[SNAudioBufferList init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "streamDescription");
    v7 = *(_OWORD *)v6;
    v8 = *(_OWORD *)(v6 + 16);
    v13 = *(_QWORD *)(v6 + 32);
    v12[0] = v7;
    v12[1] = v8;
    v9 = (CABufferList *)sub_1D44E14D8((uint64_t)"", (uint64_t)v12);
    value = v5->_ringBufferWriteBufferList.__ptr_.__value_;
    v5->_ringBufferWriteBufferList.__ptr_.__value_ = v9;
    if (value)
      sub_1D44E0BFC((_DWORD)v5 + 8, value);
  }

  return v5;
}

- (const)bufferList
{
  return (const AudioBufferList *)((char *)self->_ringBufferWriteBufferList.__ptr_.__value_ + 24);
}

+ (void)unownedViewOfRecentFramesWithSourceBuffer:(id)a3 destinationBuffer:(id)a4 numberOfRecentFrames:(unsigned int)a5
{
  _QWORD *v6;
  unsigned int *v7;
  int v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  _QWORD *v13;
  const char *v14;
  int v15;
  const char *v16;
  const char *v17;
  id v18;

  v6 = (_QWORD *)*((_QWORD *)a4 + 1);
  v18 = a3;
  if (objc_msgSend(v18, "frameLength") < a5)
  {
    v14 = "numberOfRecentFrames <= sourceBuffer.frameLength";
    v15 = 22;
    v16 = "SNAudioBufferList.mm";
    v17 = "unownedViewOfRecentFrames";
    goto LABEL_10;
  }
  v7 = (unsigned int *)objc_msgSend(v18, "audioBufferList");
  if (v6[1])
  {
    v14 = "mBufferMemory == NULL";
    v15 = 158;
    v16 = "CABufferList.h";
    v17 = "VerifyNotTrashingOwnedBuffer";
LABEL_10:
    __assert_rtn(v17, v16, v15, v14);
  }
  memcpy(v6 + 3, v7, (16 * *v7) | 8);
  v8 = objc_msgSend(v18, "frameLength");
  objc_msgSend(v18, "format");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "streamDescription");
  if (v6[1])
    __assert_rtn("VerifyNotTrashingOwnedBuffer", "CABufferList.h", 158, "mBufferMemory == NULL");
  v11 = *((_DWORD *)v6 + 6);
  if (v11)
  {
    v12 = *(_DWORD *)(v10 + 24) * (v8 - a5);
    v13 = v6 + 5;
    do
    {
      *v13 += v12;
      *((_DWORD *)v13 - 1) -= v12;
      v13 += 2;
      --v11;
    }
    while (v11);
  }

}

- (void).cxx_destruct
{
  unique_ptr<CABufferList, std::default_delete<CABufferList>> *p_ringBufferWriteBufferList;
  CABufferList *v3;
  CABufferList *value;

  value = self->_ringBufferWriteBufferList.__ptr_.__value_;
  p_ringBufferWriteBufferList = &self->_ringBufferWriteBufferList;
  v3 = value;
  p_ringBufferWriteBufferList->__ptr_.__value_ = 0;
  if (value)
    sub_1D44E0BFC((int)p_ringBufferWriteBufferList, v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
