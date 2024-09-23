@implementation DiskImageParamsASIF_XPC

- (DiskImageParamsASIF_XPC)initWithBackendXPC:(id)a3 header:()unique_ptr<di_asif:(std::default_delete<di_asif::header>>)a4 :header
{
  DiskImageParamsASIF_XPC *v5;
  DiskImageParamsASIF_XPC *v6;
  header *v7;
  header *value;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DiskImageParamsASIF_XPC;
  v5 = -[DiskImageParamsXPC initWithBackendXPC:](&v10, sel_initWithBackendXPC_, a3);
  v6 = v5;
  if (v5)
  {
    v7 = *(header **)a4.__ptr_.__value_;
    *(_QWORD *)a4.__ptr_.__value_ = 0;
    value = v5->_header.__ptr_.__value_;
    v6->_header.__ptr_.__value_ = v7;
    if (value)
      MEMORY[0x2199A8A18](value, 0x1000C404247E4FDLL);
  }
  return v6;
}

- (BOOL)isSparseFormat
{
  return 1;
}

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  uint64_t *v2;
  uint64_t *v4;
  void *v5;
  void *v6;
  unint64_t *v7;
  unint64_t v8;
  DiskImageASIF *v9;
  __int128 v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void *v14;
  void *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  DiskImageASIF *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  unsigned __int16 v27;
  unint64_t v28;
  void *v29;
  void *v30;
  DiskImageASIF *v31;
  DiskImageASIF **v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  DiskImageASIF *v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  void *v43;
  uint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  Backend *v50;
  di_asif::header *v51;
  header *value;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  Backend *v58;
  uint64_t v59;
  const di_asif::header *v60;
  uint64_t dir_latest_offset;
  uint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  uint64_t v72;
  int v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  header *v78;
  uint64_t v79;
  std::__shared_weak_count *v80;
  unint64_t *v81;
  unint64_t v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  objc_super v86;
  uint64_t v87;
  std::__shared_weak_count *v88;
  void *v89;
  std::__shared_weak_count *v90;
  void *lpsrc[2];
  DiskImageASIF *v92[2];
  __int128 v93;
  _BYTE v94[22];
  __int128 v95;
  uint64_t v96;

  v4 = v2;
  v96 = *MEMORY[0x24BDAC8D0];
  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "backend");
  }
  else
  {
    lpsrc[0] = 0;
    lpsrc[1] = 0;
  }

  v89 = lpsrc[0];
  v90 = (std::__shared_weak_count *)lpsrc[1];
  if (lpsrc[1])
  {
    v7 = (unint64_t *)((char *)lpsrc[1] + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  while (1)
  {
    if (lpsrc[0])
    {
      if (v9)
        break;
    }
    std::shared_ptr<DiskImage>::operator=[abi:ne180100](&v89, (uint64_t *)lpsrc);
    get_next_backend_in_graph((uint64_t)lpsrc, v92);
    v10 = *(_OWORD *)v92;
    v92[0] = 0;
    v92[1] = 0;
    v11 = (std::__shared_weak_count *)lpsrc[1];
    *(_OWORD *)lpsrc = v10;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    v14 = lpsrc[0];
    v15 = v89;
    v16 = (std::__shared_weak_count *)v92[1];
    if (v92[1])
    {
      v17 = (unint64_t *)((char *)v92[1] + 8);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    if (v14 == v15)
      goto LABEL_20;
  }
  v21 = v9;
  v22 = (std::__shared_weak_count *)lpsrc[1];
  v92[0] = v9;
  v92[1] = (DiskImageASIF *)lpsrc[1];
  if (lpsrc[1])
  {
    v23 = (unint64_t *)((char *)lpsrc[1] + 8);
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  *(_QWORD *)&v95 = 0x200000001;
  smart_enums::validators::flags<unsigned int>((uint64_t)"header_ignore_fields_t", 2, (int *)&v95, 2);
  *((_DWORD *)v21 + 48) = 2;
  if (v22)
  {
    v25 = (unint64_t *)&v22->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
LABEL_20:
  if (self->_header.__ptr_.__value_)
  {
    -[DiskImageParamsXPC backendXPC](self, "backendXPC");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "backend");
    }
    else
    {
      v87 = 0;
      v88 = 0;
    }
    get_sink_backend((uint64_t)&v87, &v95);
    if ((_QWORD)v95
    {
      v92[0] = v31;
      v92[1] = *((DiskImageASIF **)&v95 + 1);
      v32 = (DiskImageASIF **)&v95;
    }
    else
    {
      v32 = v92;
    }
    *v32 = 0;
    v32[1] = 0;
    v33 = (std::__shared_weak_count *)*((_QWORD *)&v95 + 1);
    if (*((_QWORD *)&v95 + 1))
    {
      v34 = (unint64_t *)(*((_QWORD *)&v95 + 1) + 8);
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 - 1, v34));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
    v36 = v88;
    if (v88)
    {
      v37 = (unint64_t *)&v88->__shared_owners_;
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
        std::__shared_weak_count::__release_weak(v36);
      }
    }

    v39 = v92[0];
    if (v92[0])
    {
      FileDescriptor::update_info(*((FileDescriptor **)v92[0] + 5));
      atomic_store(*(_QWORD *)(*((_QWORD *)v39 + 5) + 16), (unint64_t *)(*((_QWORD *)v39 + 5) + 64));
    }
    v40 = (std::__shared_weak_count *)v92[1];
    if (v92[1])
    {
      v41 = (unint64_t *)((char *)v92[1] + 8);
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }
    -[DiskImageParamsXPC backendXPC](self, "backendXPC");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "backend");
    v44 = (*(uint64_t (**)(DiskImageASIF *))(*(_QWORD *)v92[0] + 40))(v92[0]);
    v45 = (std::__shared_weak_count *)v92[1];
    if (v92[1])
    {
      v46 = (unint64_t *)((char *)v92[1] + 8);
      do
        v47 = __ldaxr(v46);
      while (__stlxr(v47 - 1, v46));
      if (!v47)
      {
        ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
        std::__shared_weak_count::__release_weak(v45);
      }
    }

    if (v44)
    {
      -[DiskImageParamsXPC backendXPC](self, "backendXPC");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v48;
      if (v48)
      {
        objc_msgSend(v48, "backend");
        v50 = (Backend *)v92[0];
      }
      else
      {
        v50 = 0;
        v92[0] = 0;
        v92[1] = 0;
      }
      v51 = (di_asif::header *)operator new();
      di_asif::header::header(v51, v50);
      value = self->_header.__ptr_.__value_;
      self->_header.__ptr_.__value_ = (header *)v51;
      if (value)
        MEMORY[0x2199A8A18](value, 0x1000C404247E4FDLL);
      v53 = (std::__shared_weak_count *)v92[1];
      if (v92[1])
      {
        v54 = (unint64_t *)((char *)v92[1] + 8);
        do
          v55 = __ldaxr(v54);
        while (__stlxr(v55 - 1, v54));
        if (!v55)
        {
          ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
          std::__shared_weak_count::__release_weak(v53);
        }
      }

    }
    -[DiskImageParamsXPC backendXPC](self, "backendXPC");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (v56)
    {
      objc_msgSend(v56, "backend");
    }
    else
    {
      v92[0] = 0;
      v92[1] = 0;
    }
    v58 = (Backend *)self->_header.__ptr_.__value_;
    v59 = operator new();
    dir_latest_offset = DiskImageASIF::get_dir_latest_offset(v92[0], v58, v60);
    DiskImageASIF::DiskImageASIF(v59, v92, v58, dir_latest_offset, v62, &DiskImageASIF::default_options);
    *v4 = v59;
    v63 = (std::__shared_weak_count *)v92[1];
    if (v92[1])
    {
      v64 = (unint64_t *)((char *)v92[1] + 8);
      do
        v65 = __ldaxr(v64);
      while (__stlxr(v65 - 1, v64));
      if (!v65)
      {
        ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
        std::__shared_weak_count::__release_weak(v63);
      }
    }

  }
  else
  {
    v27 = -[DiskImageParamsXPC blockSize](self, "blockSize");
    v28 = -[DiskImageParamsXPC blockSize](self, "blockSize");
    -[DiskImageParamsXPC backendXPC](self, "backendXPC");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      objc_msgSend(v29, "backend");
    }
    else
    {
      v87 = 0;
      v88 = 0;
    }
    v67 = operator new();
    *(_QWORD *)&v95 = di_utils::random_uuid((di_utils *)v67);
    *((_QWORD *)&v95 + 1) = v68;
    LOBYTE(v92[0]) = 0;
    LOBYTE(v93) = 0;
    DiskImageASIF::DiskImageASIF(v67, v27, 0x100000u, 0, 0x10000000000000 / v28, (uint64_t)&v87, &DiskImageASIF::default_options, &v95, (__int128 *)v92);
    v69 = v88;
    if (v88)
    {
      v70 = (unint64_t *)&v88->__shared_owners_;
      do
        v71 = __ldaxr(v70);
      while (__stlxr(v71 - 1, v70));
      if (!v71)
      {
        ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
        std::__shared_weak_count::__release_weak(v69);
      }
    }

    v72 = *(_QWORD *)(v67 + 36);
    v73 = *(_DWORD *)(v67 + 44);
    v74 = *(_OWORD *)(v67 + 64);
    *(_OWORD *)v92 = *(_OWORD *)(v67 + 48);
    v93 = v74;
    *(_OWORD *)v94 = *(_OWORD *)(v67 + 80);
    *(_QWORD *)&v94[14] = *(_QWORD *)(v67 + 94);
    v75 = *(_QWORD *)(v67 + 104);
    v76 = operator new();
    *(_DWORD *)v76 = 2003069043;
    *(_QWORD *)(v76 + 4) = v72;
    *(_DWORD *)(v76 + 12) = v73;
    v77 = v93;
    *(_OWORD *)(v76 + 16) = *(_OWORD *)v92;
    *(_OWORD *)(v76 + 32) = v77;
    *(_OWORD *)(v76 + 48) = *(_OWORD *)v94;
    *(_QWORD *)(v76 + 62) = *(_QWORD *)&v94[14];
    *(_WORD *)(v76 + 70) = 0;
    *(_QWORD *)(v76 + 72) = v75;
    v78 = self->_header.__ptr_.__value_;
    self->_header.__ptr_.__value_ = (header *)v76;
    if (v78)
    {
      MEMORY[0x2199A8A18](v78, 0x1000C404247E4FDLL);
      v76 = (uint64_t)self->_header.__ptr_.__value_;
    }
    v79 = *(unsigned __int16 *)(v76 + 68);
    v86.receiver = self;
    v86.super_class = (Class)DiskImageParamsASIF_XPC;
    v66 = -[DiskImageParamsXPC setBlockSize:](&v86, sel_setBlockSize_, v79);
    *v4 = v67;
  }
  v80 = v90;
  if (v90)
  {
    v81 = (unint64_t *)&v90->__shared_owners_;
    do
      v82 = __ldaxr(v81);
    while (__stlxr(v82 - 1, v81));
    if (!v82)
    {
      ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
      std::__shared_weak_count::__release_weak(v80);
    }
  }
  v83 = (std::__shared_weak_count *)lpsrc[1];
  if (lpsrc[1])
  {
    v84 = (unint64_t *)((char *)lpsrc[1] + 8);
    do
      v85 = __ldaxr(v84);
    while (__stlxr(v85 - 1, v84));
    if (!v85)
    {
      ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
      std::__shared_weak_count::__release_weak(v83);
    }
  }
  return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v66;
}

- (int)setSizeWithDiskImage:(const void *)a3 newSize:(unint64_t)a4
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  header *value;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[22];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)DiskImageParamsASIF_XPC;
  v6 = -[DiskImageParamsXPC setSizeWithDiskImage:newSize:](&v16, sel_setSizeWithDiskImage_newSize_, a3, a4);
  if (!v6)
  {
    v7 = *(_QWORD *)a3;
    v8 = *(_QWORD *)(*(_QWORD *)a3 + 36);
    v9 = *(_DWORD *)(*(_QWORD *)a3 + 44);
    v10 = *(_OWORD *)(*(_QWORD *)a3 + 64);
    v17 = *(_OWORD *)(*(_QWORD *)a3 + 48);
    v18 = v10;
    *(_OWORD *)v19 = *(_OWORD *)(v7 + 80);
    *(_QWORD *)&v19[14] = *(_QWORD *)(v7 + 94);
    v11 = *(_QWORD *)(v7 + 104);
    v12 = operator new();
    *(_DWORD *)v12 = 2003069043;
    *(_QWORD *)(v12 + 4) = v8;
    *(_DWORD *)(v12 + 12) = v9;
    v13 = v18;
    *(_OWORD *)(v12 + 16) = v17;
    *(_OWORD *)(v12 + 32) = v13;
    *(_OWORD *)(v12 + 48) = *(_OWORD *)v19;
    *(_QWORD *)(v12 + 62) = *(_QWORD *)&v19[14];
    *(_WORD *)(v12 + 70) = 0;
    *(_QWORD *)(v12 + 72) = v11;
    value = self->_header.__ptr_.__value_;
    self->_header.__ptr_.__value_ = (header *)v12;
    if (value)
      MEMORY[0x2199A8A18](value, 0x1000C404247E4FDLL);
  }
  return v6;
}

- (unint64_t)numBlocks
{
  return *((_QWORD *)self->_header.__ptr_.__value_ + 6);
}

- (BOOL)isWritableFormat
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DiskImageParamsASIF_XPC)initWithCoder:(id)a3
{
  id v4;
  DiskImageParamsASIF_XPC *v5;
  __n128 *v6;
  di_asif::header *v7;
  __n128 v8;
  header *value;
  void *exception;
  _QWORD v12[33];
  uint64_t v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DiskImageParamsASIF_XPC;
  v5 = -[DiskImageParamsXPC initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5 && objc_msgSend(v4, "containsValueForKey:", CFSTR("sparseHeader")))
  {
    v13 = 0;
    v6 = (__n128 *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("sparseHeader"), &v13);
    if (!v6 || v13 != 80)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"Unexpected ASIF header length (", 31);
      std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)")", 1);
      DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)v12, 0x9Au);
    }
    v7 = (di_asif::header *)operator new();
    v8 = di_asif::header::header(v7, v6);
    value = v5->_header.__ptr_.__value_;
    v5->_header.__ptr_.__value_ = (header *)v7;
    if (value)
      MEMORY[0x2199A8A18](value, 0x1000C404247E4FDLL, v8);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  header *value;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DiskImageParamsASIF_XPC;
  -[DiskImageParamsXPC encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  value = self->_header.__ptr_.__value_;
  if (value)
    objc_msgSend(v4, "encodeBytes:length:forKey:", value, 80, CFSTR("sparseHeader"));

}

- (id)instanceID
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  objc_super v9;
  _QWORD v10[2];
  _BYTE v11[528];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_header.__ptr_.__value_)
  {
    bzero(v11, 0x210uLL);
    v8.receiver = self;
    v8.super_class = (Class)DiskImageParamsASIF_XPC;
    -[DiskImageParamsXPC instanceID](&v8, sel_instanceID);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getUUIDBytes:", v11);
    v4 = objc_alloc(MEMORY[0x24BDD1880]);
    v10[0] = di_utils::buffer_to_uuid((di_utils *)v11, 528);
    v10[1] = v5;
    v6 = (void *)objc_msgSend(v4, "initWithUUIDBytes:", v10);

    return v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)DiskImageParamsASIF_XPC;
    -[DiskImageParamsXPC instanceID](&v9, sel_instanceID);
    return (id)objc_claimAutoreleasedReturnValue();
  }
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
