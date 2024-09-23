@implementation SNTunableDSPGraphHost

- (SNTunableDSPGraphHost)initWithGraph:(id)a3 error:(id *)a4
{
  id v6;
  SNTunableDSPGraphHost *v7;
  AUProcessingBlock_DSPGraph *v8;
  AUProcessingBlock_DSPGraph *value;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  uint64_t (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  objc_super v22;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SNTunableDSPGraphHost;
  v7 = -[SNTunableDSPGraphHost init](&v22, sel_init);
  if (v7)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3812000000;
    v18 = sub_1D44DB4E8;
    v19 = sub_1D44DB4F8;
    v20 = 0;
    v21 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1D44DB518;
    v12[3] = &unk_1E97C42F8;
    v14 = &v15;
    v13 = v6;
    if (sub_1D44FE4D8((uint64_t)SNDSPGraphUtilities, v12, (uint64_t)a4))
    {
      v8 = (AUProcessingBlock_DSPGraph *)v16[6];
      v16[6] = 0;
      value = v7->_tuningHost.__ptr_.__value_;
      v7->_tuningHost.__ptr_.__value_ = v8;
      if (value)
        (*(void (**)(AUProcessingBlock_DSPGraph *))(*(_QWORD *)value + 8))(value);
    }
    else
    {

      v7 = 0;
    }

    _Block_object_dispose(&v15, 8);
    v10 = v21;
    v21 = 0;
    if (v10)
      (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  }

  return v7;
}

- (void).cxx_destruct
{
  AUProcessingBlock_DSPGraph *value;

  value = self->_tuningHost.__ptr_.__value_;
  self->_tuningHost.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(AUProcessingBlock_DSPGraph *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
