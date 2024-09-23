@implementation KVItemMapper

- (KVItemMapper)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (KVItemMapper)initWithObjectClass:(Class)a3 error:(id *)a4
{
  KVItemMapper *v6;
  void *v7;
  objc_class *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  KMItemMapper *mapper;
  KVItemMapper *v13;
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v15.receiver = self;
  v15.super_class = (Class)KVItemMapper;
  v6 = -[KVItemMapper init](&v15, sel_init);
  if (!v6)
    goto LABEL_5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v7 = (void *)qword_1ED114558;
  v20 = qword_1ED114558;
  if (!qword_1ED114558)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1B7103B98;
    v16[3] = &unk_1E6B7B448;
    v16[4] = &v17;
    sub_1B7103B98((uint64_t)v16);
    v7 = (void *)v18[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v17, 8);
  v9 = [v8 alloc];
  v11 = objc_msgSend_initWithObjectClass_error_(v9, v10, (uint64_t)a3, (uint64_t)a4);
  mapper = v6->_mapper;
  v6->_mapper = (KMItemMapper *)v11;

  if (!v6->_mapper)
    v13 = 0;
  else
LABEL_5:
    v13 = v6;

  return v13;
}

- (int64_t)targetItemType
{
  return ((uint64_t (*)(KMItemMapper *, char *))MEMORY[0x1E0DE7D20])(self->_mapper, sel_targetItemType);
}

- (id)mapObject:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0DE7D20](self->_mapper, sel_itemsFromExternalObject_additionalFields_error_, a3, 0);
}

- (id)mapObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  return (id)MEMORY[0x1E0DE7D20](self->_mapper, sel_itemsFromExternalObject_additionalFields_error_, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapper, 0);
}

@end
