@implementation DiskImageParamsUDIF_XPC

- (DiskImageParamsUDIF_XPC)initWithBackendXPC:(id)a3 header:()unique_ptr<udif:(std::default_delete<udif::header>>)a4 :header
{
  DiskImageParamsUDIF_XPC *v5;
  DiskImageParamsUDIF_XPC *v6;
  header *v7;
  header *value;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DiskImageParamsUDIF_XPC;
  v5 = -[DiskImageParamsXPC initWithBackendXPC:](&v11, sel_initWithBackendXPC_, a3);
  v6 = v5;
  if (v5)
  {
    v7 = *(header **)a4.__ptr_.__value_;
    *(_QWORD *)a4.__ptr_.__value_ = 0;
    value = v5->_header.__ptr_.__value_;
    v6->_header.__ptr_.__value_ = v7;
    if (value)
    {
      MEMORY[0x2199A8A18](value, 0x1000C407784F2AFLL);
      v7 = v6->_header.__ptr_.__value_;
    }
    if (!*(_QWORD *)((char *)v7 + 492))
    {
      -[DiskImageParamsUDIF_XPC createSinkDiskImage](v6, "createSinkDiskImage");
      *(_QWORD *)((char *)v6->_header.__ptr_.__value_ + 492) = (*(uint64_t (**)())(*(_QWORD *)v10 + 32))();
      if (v10)
        (*(void (**)())(*(_QWORD *)v10 + 16))();
    }
  }
  return v6;
}

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  _QWORD *v2;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  __int128 v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  header *value;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  unint64_t v38;
  _QWORD *v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  unique_ptr<DiskImage, std::default_delete<DiskImage>> v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  __int128 v47;
  std::__shared_weak_count *v48;
  unint64_t v49;
  uint64_t v50[3];

  v4 = v2;
  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "backend");
  else
    *(_OWORD *)v50 = 0uLL;

  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v50[0] + 48))(v50[0]))
  {
    -[DiskImageParamsXPC backendXPC](self, "backendXPC");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isUnlocked");

    if (v8)
    {
      v49 = -[DiskImageParamsUDIF_XPC blockSize](self, "blockSize");
      std::allocate_shared[abi:ne180100]<BufferedWriteBackend,std::allocator<BufferedWriteBackend>,std::shared_ptr<Backend> &,unsigned long,void>((uint64_t)v50, &v49, &v47);
      v9 = v47;
      v47 = 0uLL;
      v10 = (std::__shared_weak_count *)v50[1];
      *(_OWORD *)v50 = v9;
      if (v10)
      {
        p_shared_owners = (unint64_t *)&v10->__shared_owners_;
        do
          v12 = __ldaxr(p_shared_owners);
        while (__stlxr(v12 - 1, p_shared_owners));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
      }
      v13 = (std::__shared_weak_count *)*((_QWORD *)&v47 + 1);
      if (*((_QWORD *)&v47 + 1))
      {
        v14 = (unint64_t *)(*((_QWORD *)&v47 + 1) + 8);
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
    }
  }
  value = self->_header.__ptr_.__value_;
  v17 = operator new();
  *(_QWORD *)v17 = 0x4796C6F6BLL;
  *(_DWORD *)(v17 + 8) = 512;
  *(_DWORD *)(v17 + 12) = *((_DWORD *)value + 3);
  v18 = *((_OWORD *)value + 1);
  v19 = *((_OWORD *)value + 2);
  *(_QWORD *)(v17 + 48) = *((_QWORD *)value + 6);
  *(_OWORD *)(v17 + 16) = v18;
  *(_OWORD *)(v17 + 32) = v19;
  *(_DWORD *)(v17 + 56) = *((_DWORD *)value + 14);
  *(_DWORD *)(v17 + 60) = *((_DWORD *)value + 15);
  *(_OWORD *)(v17 + 64) = *((_OWORD *)value + 4);
  *(_QWORD *)(v17 + 80) = *((_QWORD *)value + 10);
  v20 = *(_OWORD *)((char *)value + 88);
  v21 = *(_OWORD *)((char *)value + 104);
  v22 = *(_OWORD *)((char *)value + 120);
  *(_OWORD *)(v17 + 136) = *(_OWORD *)((char *)value + 136);
  *(_OWORD *)(v17 + 120) = v22;
  *(_OWORD *)(v17 + 104) = v21;
  *(_OWORD *)(v17 + 88) = v20;
  v23 = *(_OWORD *)((char *)value + 152);
  v24 = *(_OWORD *)((char *)value + 168);
  v25 = *(_OWORD *)((char *)value + 184);
  *(_OWORD *)(v17 + 200) = *(_OWORD *)((char *)value + 200);
  *(_OWORD *)(v17 + 184) = v25;
  *(_OWORD *)(v17 + 168) = v24;
  *(_OWORD *)(v17 + 152) = v23;
  v26 = *(_OWORD *)((char *)value + 248);
  v27 = *(_OWORD *)((char *)value + 264);
  v28 = *(_OWORD *)((char *)value + 280);
  *(_OWORD *)(v17 + 232) = *(_OWORD *)((char *)value + 232);
  *(_OWORD *)(v17 + 264) = v27;
  *(_OWORD *)(v17 + 280) = v28;
  *(_OWORD *)(v17 + 248) = v26;
  v30 = *(_OWORD *)((char *)value + 312);
  v29 = *(_OWORD *)((char *)value + 328);
  v31 = *(_OWORD *)((char *)value + 296);
  *(_QWORD *)(v17 + 344) = *((_QWORD *)value + 43);
  *(_OWORD *)(v17 + 312) = v30;
  *(_OWORD *)(v17 + 328) = v29;
  *(_OWORD *)(v17 + 296) = v31;
  *(_OWORD *)(v17 + 216) = *(_OWORD *)((char *)value + 216);
  *(_QWORD *)(v17 + 352) = *((_QWORD *)value + 44);
  v32 = *(_OWORD *)((char *)value + 360);
  v33 = *(_OWORD *)((char *)value + 376);
  v34 = *(_OWORD *)((char *)value + 392);
  *(_OWORD *)(v17 + 408) = *(_OWORD *)((char *)value + 408);
  *(_OWORD *)(v17 + 392) = v34;
  *(_OWORD *)(v17 + 376) = v33;
  *(_OWORD *)(v17 + 360) = v32;
  v35 = *(_OWORD *)((char *)value + 424);
  v36 = *(_OWORD *)((char *)value + 440);
  v37 = *(_OWORD *)((char *)value + 456);
  *(_OWORD *)(v17 + 472) = *(_OWORD *)((char *)value + 472);
  *(_OWORD *)(v17 + 456) = v37;
  *(_OWORD *)(v17 + 440) = v36;
  *(_OWORD *)(v17 + 424) = v35;
  *(_DWORD *)(v17 + 488) = *((_DWORD *)value + 122);
  *(_QWORD *)(v17 + 492) = *(_QWORD *)((char *)value + 492);
  v49 = v17;
  UDIF_header::UDIF_header(&v47, (uint64_t *)&v49, v50);
  v38 = v49;
  v49 = 0;
  if (v38)
    MEMORY[0x2199A8A18](v38, 0x1000C407784F2AFLL);
  v39 = (_QWORD *)operator new();
  DiskImageUDIF::DiskImageUDIF(v39, (uint64_t *)&v47, v50);
  *v4 = v39;
  v40 = v48;
  if (v48)
  {
    v41 = (unint64_t *)&v48->__shared_owners_;
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
  v43.var0.var0 = (DiskImage *)v47;
  *(_QWORD *)&v47 = 0;
  if (v43.var0.var0)
    v43.var0.var0 = (DiskImage *)MEMORY[0x2199A8A18](v43.var0.var0, 0x1000C407784F2AFLL);
  v44 = (std::__shared_weak_count *)v50[1];
  if (v50[1])
  {
    v45 = (unint64_t *)(v50[1] + 8);
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  return v43;
}

- (unint64_t)numBlocks
{
  return *(_QWORD *)((char *)self->_header.__ptr_.__value_ + 492);
}

- (unint64_t)blockSize
{
  return 512;
}

- (BOOL)isWritableFormat
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DiskImageParamsUDIF_XPC)initWithCoder:(id)a3
{
  id v4;
  DiskImageParamsUDIF_XPC *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  header *value;
  void *exception;
  _QWORD v31[33];
  uint64_t v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)DiskImageParamsUDIF_XPC;
  v5 = -[DiskImageParamsXPC initWithCoder:](&v33, sel_initWithCoder_, v4);
  if (v5)
  {
    v32 = 0;
    v6 = objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("udifHeader"), &v32);
    if (!v6 || v32 != 500)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v31);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"Unexpected UDIF header length (", 31);
      std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)")", 1);
      DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)v31, 0x9Au);
    }
    v7 = operator new();
    *(_QWORD *)v7 = 0x4796C6F6BLL;
    *(_DWORD *)(v7 + 8) = 512;
    *(_DWORD *)(v7 + 12) = *(_DWORD *)(v6 + 12);
    v8 = *(_OWORD *)(v6 + 16);
    v9 = *(_OWORD *)(v6 + 32);
    *(_QWORD *)(v7 + 48) = *(_QWORD *)(v6 + 48);
    *(_OWORD *)(v7 + 16) = v8;
    *(_OWORD *)(v7 + 32) = v9;
    *(_DWORD *)(v7 + 56) = *(_DWORD *)(v6 + 56);
    *(_DWORD *)(v7 + 60) = *(_DWORD *)(v6 + 60);
    *(_OWORD *)(v7 + 64) = *(_OWORD *)(v6 + 64);
    *(_QWORD *)(v7 + 80) = *(_QWORD *)(v6 + 80);
    v10 = *(_OWORD *)(v6 + 88);
    v11 = *(_OWORD *)(v6 + 104);
    v12 = *(_OWORD *)(v6 + 120);
    *(_OWORD *)(v7 + 136) = *(_OWORD *)(v6 + 136);
    *(_OWORD *)(v7 + 120) = v12;
    *(_OWORD *)(v7 + 104) = v11;
    *(_OWORD *)(v7 + 88) = v10;
    v13 = *(_OWORD *)(v6 + 152);
    v14 = *(_OWORD *)(v6 + 168);
    v15 = *(_OWORD *)(v6 + 184);
    *(_OWORD *)(v7 + 200) = *(_OWORD *)(v6 + 200);
    *(_OWORD *)(v7 + 184) = v15;
    *(_OWORD *)(v7 + 168) = v14;
    *(_OWORD *)(v7 + 152) = v13;
    v16 = *(_OWORD *)(v6 + 248);
    v17 = *(_OWORD *)(v6 + 264);
    v18 = *(_OWORD *)(v6 + 280);
    *(_OWORD *)(v7 + 232) = *(_OWORD *)(v6 + 232);
    *(_OWORD *)(v7 + 264) = v17;
    *(_OWORD *)(v7 + 280) = v18;
    *(_OWORD *)(v7 + 248) = v16;
    v20 = *(_OWORD *)(v6 + 312);
    v19 = *(_OWORD *)(v6 + 328);
    v21 = *(_OWORD *)(v6 + 296);
    *(_QWORD *)(v7 + 344) = *(_QWORD *)(v6 + 344);
    *(_OWORD *)(v7 + 312) = v20;
    *(_OWORD *)(v7 + 328) = v19;
    *(_OWORD *)(v7 + 296) = v21;
    *(_OWORD *)(v7 + 216) = *(_OWORD *)(v6 + 216);
    *(_QWORD *)(v7 + 352) = *(_QWORD *)(v6 + 352);
    v22 = *(_OWORD *)(v6 + 360);
    v23 = *(_OWORD *)(v6 + 376);
    v24 = *(_OWORD *)(v6 + 392);
    *(_OWORD *)(v7 + 408) = *(_OWORD *)(v6 + 408);
    *(_OWORD *)(v7 + 392) = v24;
    *(_OWORD *)(v7 + 376) = v23;
    *(_OWORD *)(v7 + 360) = v22;
    v25 = *(_OWORD *)(v6 + 424);
    v26 = *(_OWORD *)(v6 + 440);
    v27 = *(_OWORD *)(v6 + 456);
    *(_OWORD *)(v7 + 472) = *(_OWORD *)(v6 + 472);
    *(_OWORD *)(v7 + 456) = v27;
    *(_OWORD *)(v7 + 440) = v26;
    *(_OWORD *)(v7 + 424) = v25;
    *(_DWORD *)(v7 + 488) = *(_DWORD *)(v6 + 488);
    *(_QWORD *)(v7 + 492) = *(_QWORD *)(v6 + 492);
    value = v5->_header.__ptr_.__value_;
    v5->_header.__ptr_.__value_ = (header *)v7;
    if (value)
      MEMORY[0x2199A8A18](value, 0x1000C407784F2AFLL);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DiskImageParamsUDIF_XPC;
  -[DiskImageParamsXPC encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_header.__ptr_.__value_, 500, CFSTR("udifHeader"));

}

- (id)instanceID
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];
  _BYTE v10[16];
  char v11[512];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  bzero(v10, 0x210uLL);
  v8.receiver = self;
  v8.super_class = (Class)DiskImageParamsUDIF_XPC;
  -[DiskImageParamsXPC instanceID](&v8, sel_instanceID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getUUIDBytes:", v10);
  udif::header::write((udif::header *)self->_header.__ptr_.__value_, v11);
  v4 = objc_alloc(MEMORY[0x24BDD1880]);
  v9[0] = di_utils::buffer_to_uuid((di_utils *)v10, 528);
  v9[1] = v5;
  v6 = (void *)objc_msgSend(v4, "initWithUUIDBytes:", v9);

  return v6;
}

- (void).cxx_destruct
{
  header *value;

  value = self->_header.__ptr_.__value_;
  self->_header.__ptr_.__value_ = 0;
  if (value)
    JUMPOUT(0x2199A8A18);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
