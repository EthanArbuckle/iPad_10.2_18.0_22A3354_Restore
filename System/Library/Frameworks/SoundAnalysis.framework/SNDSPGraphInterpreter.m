@implementation SNDSPGraphInterpreter

- (SNDSPGraphInterpreter)init
{
  SNDSPGraphInterpreter *v2;
  SNDSPGraphInterpreter *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t (***v8)();
  uint64_t v9;
  _QWORD v11[2];
  uint64_t (*v12)(uint64_t);
  void *v13;
  SNDSPGraphInterpreter *v14;
  objc_super v15;
  uint64_t (**v16)();
  char v17;
  uint64_t (***v18)();
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)SNDSPGraphInterpreter;
  v2 = -[SNDSPGraphInterpreter init](&v15, sel_init);
  if (!v2)
    return 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = sub_1D4502D64;
  v13 = &unk_1E97C4CD8;
  v3 = v2;
  v14 = v3;
  v16 = &off_1E97B0B58;
  v17 = 0;
  v18 = &v16;
  v4 = v11;
  v6 = ((uint64_t (*)(_QWORD *, uint64_t))v12)(v4, v5);

  v8 = v18;
  if (v18 == &v16)
  {
    v9 = 4;
    v8 = &v16;
    goto LABEL_7;
  }
  if (v18)
  {
    v9 = 5;
LABEL_7:
    ((void (*)(uint64_t (***)(), uint64_t))(*v8)[v9])(v8, v7);
  }
  if ((v6 & 1) == 0)
  {

    v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  Interpreter *value;

  value = self->_interpreter.__ptr_.__value_;
  self->_interpreter.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Interpreter *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
