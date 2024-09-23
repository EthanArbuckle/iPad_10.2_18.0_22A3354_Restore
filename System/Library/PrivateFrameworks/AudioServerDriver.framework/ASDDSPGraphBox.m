@implementation ASDDSPGraphBox

- (ASDDSPGraphBox)init
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[ASDDSPGraphBox init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Do not call %@"), v4);

  return 0;
}

- (ASDDSPGraphBox)initWithBox:(void *)a3 fromGraph:(shared_ptr<DSPGraph::Graph>)a4
{
  uint64_t *ptr;
  ASDDSPGraphBox *v7;
  void *v9;
  void *v10;
  objc_super v11;

  ptr = (uint64_t *)a4.__ptr_;
  v11.receiver = self;
  v11.super_class = (Class)ASDDSPGraphBox;
  v7 = -[ASDDSPGraphBox init](&v11, sel_init, a3, a4.__ptr_, a4.__cntrl_);
  if (v7)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("ASDDSPGraphBox.mm"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("box"));

    }
    if (!*ptr)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("ASDDSPGraphBox.mm"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("graph"));

    }
    v7->_box = a3;
    std::shared_ptr<DSPGraph::Graph>::operator=[abi:ne180100](&v7->_graph.__ptr_, ptr);
  }
  return v7;
}

- (BOOL)startRecordingPort:(int64_t)a3 toFile:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t (***v13)();
  uint64_t v14;
  _QWORD v16[5];
  id v17;
  int64_t v18;
  uint64_t (**v19)();
  char v20;
  uint64_t (***v21)();
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __44__ASDDSPGraphBox_startRecordingPort_toFile___block_invoke;
  v16[3] = &unk_24DBCA0E0;
  v16[4] = self;
  v7 = v6;
  v17 = v7;
  v18 = a3;
  v19 = &off_24DBC9E00;
  v20 = 0;
  v21 = &v19;
  v12 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v16);
  v13 = v21;
  if (v21 == &v19)
  {
    v14 = 4;
    v13 = &v19;
    goto LABEL_5;
  }
  if (v21)
  {
    v14 = 5;
LABEL_5:
    ((void (*)(uint64_t (***)(), uint64_t, uint64_t, uint64_t, uint64_t))(*v13)[v14])(v13, v8, v9, v10, v11);
  }

  return v12;
}

uint64_t __44__ASDDSPGraphBox_startRecordingPort_toFile___block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t, _QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 152))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), *(unsigned int *)(a1 + 48), 1, 0, 4130);
  return 1;
}

- (BOOL)startRecordingPort:(int64_t)a3 toFile:(id)a4 withAudioCapturerOptions:(unint64_t)a5
{
  id v8;
  id v9;
  char v10;
  uint64_t (***v11)();
  uint64_t v12;
  _QWORD v14[5];
  id v15;
  int64_t v16;
  unint64_t v17;
  uint64_t (**v18)();
  char v19;
  uint64_t (***v20)();
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__ASDDSPGraphBox_startRecordingPort_toFile_withAudioCapturerOptions___block_invoke;
  v14[3] = &unk_24DBCA488;
  v14[4] = self;
  v9 = v8;
  v15 = v9;
  v16 = a3;
  v17 = a5;
  v18 = &off_24DBC9E00;
  v19 = 0;
  v20 = &v18;
  v10 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v14);
  v11 = v20;
  if (v20 == &v18)
  {
    v12 = 4;
    v11 = &v18;
    goto LABEL_5;
  }
  if (v20)
  {
    v12 = 5;
LABEL_5:
    (*v11)[v12]();
  }

  return v10;
}

uint64_t __69__ASDDSPGraphBox_startRecordingPort_toFile_withAudioCapturerOptions___block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8)
                                                                           + 152))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), *(unsigned int *)(a1 + 48), 1, 0, *(_QWORD *)(a1 + 56));
  return 1;
}

- (BOOL)stopRecordingPort:(int64_t)a3
{
  char v3;
  uint64_t (***v4)();
  uint64_t v5;
  _QWORD v7[6];
  uint64_t (**v8)();
  char v9;
  uint64_t (***v10)();
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__ASDDSPGraphBox_stopRecordingPort___block_invoke;
  v7[3] = &unk_24DBCA4B0;
  v7[4] = self;
  v7[5] = a3;
  v8 = &off_24DBC9E00;
  v9 = 0;
  v10 = &v8;
  v3 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v7);
  v4 = v10;
  if (v10 == &v8)
  {
    v5 = 4;
    v4 = &v8;
    goto LABEL_5;
  }
  if (v10)
  {
    v5 = 5;
LABEL_5:
    (*v4)[v5]();
  }
  return v3;
}

uint64_t __36__ASDDSPGraphBox_stopRecordingPort___block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 160))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned int *)(a1 + 40));
  return 1;
}

- (BOOL)startInjectingPort:(int64_t)a3 toFile:(id)a4 shouldLoop:(BOOL)a5
{
  id v8;
  id v9;
  char v10;
  uint64_t (***v11)();
  uint64_t v12;
  _QWORD v14[5];
  id v15;
  int64_t v16;
  BOOL v17;
  uint64_t (**v18)();
  char v19;
  uint64_t (***v20)();
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__ASDDSPGraphBox_startInjectingPort_toFile_shouldLoop___block_invoke;
  v14[3] = &unk_24DBCA4D8;
  v14[4] = self;
  v9 = v8;
  v15 = v9;
  v16 = a3;
  v17 = a5;
  v18 = &off_24DBC9E00;
  v19 = 0;
  v20 = &v18;
  v10 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v14);
  v11 = v20;
  if (v20 == &v18)
  {
    v12 = 4;
    v11 = &v18;
    goto LABEL_5;
  }
  if (v20)
  {
    v12 = 5;
LABEL_5:
    (*v11)[v12]();
  }

  return v10;
}

uint64_t __55__ASDDSPGraphBox_startInjectingPort_toFile_shouldLoop___block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 136))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), *(unsigned int *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  return 1;
}

- (BOOL)stopInjectingPort:(int64_t)a3
{
  char v3;
  uint64_t (***v4)();
  uint64_t v5;
  _QWORD v7[6];
  uint64_t (**v8)();
  char v9;
  uint64_t (***v10)();
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__ASDDSPGraphBox_stopInjectingPort___block_invoke;
  v7[3] = &unk_24DBCA4B0;
  v7[4] = self;
  v7[5] = a3;
  v8 = &off_24DBC9E00;
  v9 = 0;
  v10 = &v8;
  v3 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v7);
  v4 = v10;
  if (v10 == &v8)
  {
    v5 = 4;
    v4 = &v8;
    goto LABEL_5;
  }
  if (v10)
  {
    v5 = 5;
LABEL_5:
    (*v4)[v5]();
  }
  return v3;
}

uint64_t __36__ASDDSPGraphBox_stopInjectingPort___block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 144))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned int *)(a1 + 40));
  return 1;
}

- (NSString)name
{
  char *box;
  _QWORD *v3;

  box = (char *)self->_box;
  v3 = box + 32;
  if (box[55] < 0)
    v3 = (_QWORD *)*v3;
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
}

- (int64_t)numInputs
{
  return ((*((_QWORD *)self->_box + 9) - *((_QWORD *)self->_box + 8)) >> 5);
}

- (int64_t)numOutputs
{
  return ((*((_QWORD *)self->_box + 12) - *((_QWORD *)self->_box + 11)) >> 5);
}

- (BOOL)getParameterList:(unsigned int *)a3 numParameterIDs:(int64_t *)a4 inScope:(unsigned int)a5
{
  char v5;
  uint64_t (***v6)();
  uint64_t v7;
  _QWORD v9[7];
  unsigned int v10;
  uint64_t (**v11)();
  char v12;
  uint64_t (***v13)();
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__ASDDSPGraphBox_getParameterList_numParameterIDs_inScope___block_invoke;
  v9[3] = &unk_24DBCA108;
  v10 = a5;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a3;
  v11 = &off_24DBC9E00;
  v12 = 0;
  v13 = &v11;
  v5 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v9);
  v6 = v13;
  if (v13 == &v11)
  {
    v7 = 4;
    v6 = &v11;
    goto LABEL_5;
  }
  if (v13)
  {
    v7 = 5;
LABEL_5:
    (*v6)[v7]();
  }
  return v5;
}

uint64_t __59__ASDDSPGraphBox_getParameterList_numParameterIDs_inScope___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  size_t v4;
  void *v5;
  void *v7;
  void *v8;

  (*(void (**)(void **__return_ptr, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 96))(&v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned int *)(a1 + 56));
  v2 = v7;
  v3 = v8;
  v4 = (_BYTE *)v8 - (_BYTE *)v7;
  **(_QWORD **)(a1 + 40) = ((_BYTE *)v8 - (_BYTE *)v7) >> 2;
  v5 = *(void **)(a1 + 48);
  if (v5 && v3 != v2)
  {
    memmove(v5, v2, v4);
    v2 = v7;
  }
  if (v2)
  {
    v8 = v2;
    operator delete(v2);
  }
  return 1;
}

- (BOOL)getParameterInfo:(AudioUnitParameterInfo *)a3 forID:(unsigned int)a4 inScope:(unsigned int)a5
{
  int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[6];
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(_OWORD *__return_ptr, void *, _QWORD, _QWORD))(*(_QWORD *)self->_box + 104))(v11, self->_box, *(_QWORD *)&a5, *(_QWORD *)&a4);
  v6 = v13;
  if (v13)
  {
    v7 = v11[5];
    *(_OWORD *)&a3->clumpID = v11[4];
    *(_OWORD *)&a3->unit = v7;
    *(_QWORD *)&a3->flags = v12;
    v8 = v11[1];
    *(_OWORD *)a3->name = v11[0];
    *(_OWORD *)&a3->name[16] = v8;
    v9 = v11[3];
    *(_OWORD *)&a3->name[32] = v11[2];
    *(_OWORD *)&a3->name[48] = v9;
  }
  return v6 != 0;
}

- (BOOL)getParameter:(float *)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6
{
  char v6;
  uint64_t (***v7)();
  uint64_t v8;
  _QWORD v10[6];
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t (**v14)();
  char v15;
  uint64_t (***v16)();
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__ASDDSPGraphBox_getParameter_forID_scope_element___block_invoke;
  v10[3] = &unk_24DBCA108;
  v10[4] = self;
  v10[5] = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = &off_24DBC9E00;
  v15 = 0;
  v16 = &v14;
  v6 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v10);
  v7 = v16;
  if (v16 == &v14)
  {
    v8 = 4;
    v7 = &v14;
    goto LABEL_5;
  }
  if (v16)
  {
    v8 = 5;
LABEL_5:
    (*v7)[v8]();
  }
  return v6;
}

uint64_t __51__ASDDSPGraphBox_getParameter_forID_scope_element___block_invoke(uint64_t a1)
{
  **(float **)(a1 + 40) = (*(float (**)(_QWORD, _QWORD, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32)
                                                                                                + 8)
                                                                                  + 88))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56));
  return 1;
}

- (BOOL)hasParameter:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5
{
  char v5;
  uint64_t (***v6)();
  uint64_t v7;
  _QWORD v9[5];
  unsigned int v10;
  unsigned int v11;
  uint64_t (**v12)();
  char v13;
  uint64_t (***v14)();
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__ASDDSPGraphBox_hasParameter_scope_element___block_invoke;
  v9[3] = &unk_24DBCA4B0;
  v9[4] = self;
  v10 = a4;
  v11 = a3;
  v12 = &off_24DBC9E00;
  v13 = 0;
  v14 = &v12;
  v5 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v9);
  v6 = v14;
  if (v14 == &v12)
  {
    v7 = 4;
    v6 = &v12;
    goto LABEL_5;
  }
  if (v14)
  {
    v7 = 5;
LABEL_5:
    (*v6)[v7]();
  }
  return v5;
}

BOOL __45__ASDDSPGraphBox_hasParameter_scope_element___block_invoke(uint64_t a1)
{
  _DWORD *v2;
  _DWORD *v3;
  _DWORD *v5;
  _DWORD *v6;

  (*(void (**)(_DWORD **__return_ptr, _QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8) + 96))(&v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned int *)(a1 + 40));
  v2 = v6;
  v3 = v5;
  if (v5 != v6)
  {
    v3 = v5;
    while (*v3 != *(_DWORD *)(a1 + 44))
    {
      if (++v3 == v6)
      {
        v3 = v6;
        break;
      }
    }
  }
  if (v5)
  {
    v6 = v5;
    operator delete(v5);
  }
  return v3 != v2;
}

- (BOOL)setParameter:(float)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 bufferOffset:(int64_t)a7
{
  char v7;
  uint64_t (***v8)();
  uint64_t v9;
  _QWORD v11[6];
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  float v15;
  uint64_t (**v16)();
  char v17;
  uint64_t (***v18)();
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__ASDDSPGraphBox_setParameter_forID_scope_element_bufferOffset___block_invoke;
  v11[3] = &unk_24DBCA500;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a3;
  v11[4] = self;
  v11[5] = a7;
  v16 = &off_24DBC9E00;
  v17 = 0;
  v18 = &v16;
  v7 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v11);
  v8 = v18;
  if (v18 == &v16)
  {
    v9 = 4;
    v8 = &v16;
    goto LABEL_5;
  }
  if (v18)
  {
    v9 = 5;
LABEL_5:
    (*v8)[v9]();
  }
  return v7;
}

uint64_t __64__ASDDSPGraphBox_setParameter_forID_scope_element_bufferOffset___block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 8)
                                                                        + 80))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 40), *(float *)(a1 + 60));
  return 1;
}

- (void)box
{
  return self->_box;
}

- (void).cxx_destruct
{
  std::shared_ptr<DSPGraph::Graph>::~shared_ptr[abi:ne180100]((uint64_t)&self->_graph);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
