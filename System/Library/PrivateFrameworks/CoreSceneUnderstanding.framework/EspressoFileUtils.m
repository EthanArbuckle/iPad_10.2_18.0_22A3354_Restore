@implementation EspressoFileUtils

+ (void)writeEspressoBufferToTextFile:(id)a3 FromBuffer:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  std::ios_base *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  size_t v21;
  void *v22;
  void **v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  std::runtime_error *exception;
  id v36;
  id v37;
  void *__dst[2];
  unint64_t v39;
  uint64_t v40;
  _BYTE v41[408];
  _QWORD v42[21];

  v42[19] = *MEMORY[0x24BDAC8D0];
  v37 = a3;
  v5 = a4;
  if (!v5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer instance is nil.");
    goto LABEL_39;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer is not an instance of CSUEspressoBuffer.");
LABEL_39:
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v10 = (_QWORD *)objc_msgSend_espressoBuffer(v5, v6, v7, v8, v9);

  v11 = MEMORY[0x24BEDB840];
  v12 = MEMORY[0x24BEDB840] + 64;
  v13 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 8);
  v14 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 16);
  v42[0] = MEMORY[0x24BEDB840] + 64;
  v40 = v13;
  *(_QWORD *)&v41[*(_QWORD *)(v13 - 24) - 8] = v14;
  v15 = (std::ios_base *)&v41[*(_QWORD *)(v40 - 24) - 8];
  std::ios_base::init(v15, v41);
  v15[1].__vftable = 0;
  v15[1].__fmtflags_ = -1;
  v40 = v11 + 24;
  v42[0] = v12;
  MEMORY[0x23B83FBF4](v41);
  v36 = objc_retainAutorelease(v37);
  v20 = (const char *)objc_msgSend_UTF8String(v36, v16, v17, v18, v19);
  v21 = strlen(v20);
  if (v21 >= 0x7FFFFFFFFFFFFFF8)
    sub_239FEBDE0();
  v22 = (void *)v21;
  if (v21 >= 0x17)
  {
    v24 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v21 | 7) != 0x17)
      v24 = v21 | 7;
    v25 = v24 + 1;
    v23 = (void **)operator new(v24 + 1);
    __dst[1] = v22;
    v39 = v25 | 0x8000000000000000;
    __dst[0] = v23;
  }
  else
  {
    HIBYTE(v39) = v21;
    v23 = __dst;
    if (!v21)
      goto LABEL_11;
  }
  memmove(v23, v20, (size_t)v22);
LABEL_11:
  *((_BYTE *)v22 + (_QWORD)v23) = 0;
  std::ofstream::open();
  v26 = v10[12];
  if (v26)
  {
    v27 = v10[11];
    if (v27)
    {
      v28 = 0;
      v29 = v10[11];
      while (!v29 || !v10[10])
      {
LABEL_15:
        if (++v28 >= v26)
          goto LABEL_32;
      }
      v30 = 0;
      v31 = 1;
      while (1)
      {
        v32 = v30 + 1;
        if (v31)
          break;
LABEL_20:
        ++v30;
        if (v32 >= v27)
        {
          v26 = v10[12];
          v29 = v27;
          goto LABEL_15;
        }
      }
      v33 = 0;
      while (1)
      {
        while (1)
        {
          std::ostream::operator<<();
          v34 = v10[12];
          if (v34 >= 2)
            break;
          if (v34 == 1 && !((v33 + 1) % v10[10]))
            goto LABEL_23;
LABEL_30:
          sub_23A00AE20(&v40, (uint64_t)" ", 1);
          ++v33;
          v31 = v10[10];
          if (v33 >= v31)
          {
LABEL_19:
            v27 = v10[11];
            goto LABEL_20;
          }
        }
        if (v32 % v10[11] || (v33 + 1) % v10[10])
          goto LABEL_30;
LABEL_23:
        sub_23A00AE20(&v40, (uint64_t)"\n", 1);
        ++v33;
        v31 = v10[10];
        if (v33 >= v31)
          goto LABEL_19;
      }
    }
  }
LABEL_32:
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)&v41[*(_QWORD *)(v40 - 24) - 8], *(_DWORD *)&v41[*(_QWORD *)(v40 - 24) + 24] | 4);
  if (SHIBYTE(v39) < 0)
    operator delete(__dst[0]);
  v40 = *MEMORY[0x24BEDB7E8];
  *(_QWORD *)&v41[*(_QWORD *)(v40 - 24) - 8] = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 24);
  MEMORY[0x23B83FC00](v41);
  std::ostream::~ostream();
  MEMORY[0x23B83FDF8](v42);

}

+ (EspressoTensor)createEspressoTensorFromTextFile:(SEL)a3 channels:(id)a4 height:(unint64_t)a5 width:(unint64_t)a6
{
  id v11;
  TensorStorage *ptr;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  std::ios_base *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  size_t v26;
  void *v27;
  void **v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t j;
  uint64_t v33;
  EspressoTensor *result;
  id v35;
  int v36;
  void *__dst[2];
  unint64_t v38;
  void *__p;
  void *v40;
  _BYTE v41[408];
  _QWORD v42[21];

  v42[19] = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  sub_23A00B128((char **)&__p, 1, a5, a6, a7);
  LODWORD(__dst[0]) = 4;
  sub_239FFFC10((uint64_t)retstr, (int *)__dst, (uint64_t)&__p);
  if (__p)
  {
    v40 = __p;
    operator delete(__p);
  }
  ptr = retstr->storage_.__ptr_;
  v13 = (_DWORD *)*((_QWORD *)ptr + 1);
  v15 = *((_QWORD *)ptr + 11);
  v14 = *((_QWORD *)ptr + 12);
  v16 = *((_QWORD *)ptr + 13);
  v17 = MEMORY[0x24BEDB838];
  v18 = MEMORY[0x24BEDB838] + 64;
  v42[0] = MEMORY[0x24BEDB838] + 64;
  v19 = *(void **)(MEMORY[0x24BEDB7E0] + 16);
  __p = *(void **)(MEMORY[0x24BEDB7E0] + 8);
  *(void **)((char *)&__p + *((_QWORD *)__p - 3)) = v19;
  v40 = 0;
  v20 = (std::ios_base *)((char *)&__p + *((_QWORD *)__p - 3));
  std::ios_base::init(v20, v41);
  v20[1].__vftable = 0;
  v20[1].__fmtflags_ = -1;
  __p = (void *)(v17 + 24);
  v42[0] = v18;
  MEMORY[0x23B83FBF4](v41);
  v35 = objc_retainAutorelease(v11);
  v25 = (const char *)objc_msgSend_UTF8String(v35, v21, v22, v23, v24);
  v26 = strlen(v25);
  if (v26 >= 0x7FFFFFFFFFFFFFF8)
    sub_239FEBDE0();
  v27 = (void *)v26;
  if (v26 >= 0x17)
  {
    v29 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v26 | 7) != 0x17)
      v29 = v26 | 7;
    v30 = v29 + 1;
    v28 = (void **)operator new(v29 + 1);
    __dst[1] = v27;
    v38 = v30 | 0x8000000000000000;
    __dst[0] = v28;
  }
  else
  {
    HIBYTE(v38) = v26;
    v28 = __dst;
    if (!v26)
      goto LABEL_11;
  }
  memmove(v28, v25, (size_t)v27);
LABEL_11:
  *((_BYTE *)v27 + (_QWORD)v28) = 0;
  std::ifstream::open();
  if (v16 && v14 && v15)
  {
    for (i = 0; i != v16; ++i)
    {
      for (j = 0; j != v14; ++j)
      {
        v33 = v15;
        do
        {
          v36 = 0;
          MEMORY[0x23B83FC48](&__p, &v36);
          *v13++ = v36;
          --v33;
        }
        while (v33);
      }
    }
  }
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)((char *)&__p + *((_QWORD *)__p - 3)), *(_DWORD *)&v41[*((_QWORD *)__p - 3) + 16] | 4);
  if (SHIBYTE(v38) < 0)
    operator delete(__dst[0]);
  __p = (void *)*MEMORY[0x24BEDB7E0];
  *(void **)((char *)&__p + *((_QWORD *)__p - 3)) = *(void **)(MEMORY[0x24BEDB7E0] + 24);
  MEMORY[0x23B83FC00](v41);
  std::istream::~istream();
  MEMORY[0x23B83FDF8](v42);

  return result;
}

+ (void)writeEspressoBufferToBinFile:(id)a3 FromBuffer:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_23A00A974;
  v10[3] = &unk_250B0E2E0;
  v11 = v5;
  v6 = v5;
  objc_msgSend_accessDataUsingBlock_(a4, v7, (uint64_t)v10, v8, v9);

}

+ (void)writeIKFloatTensorBuffer:(const void *)a3 ToBinFile:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  std::ios_base *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[408];
  _QWORD v18[20];

  v18[19] = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = MEMORY[0x24BEDB840];
  v6 = MEMORY[0x24BEDB840] + 64;
  v7 = (uint64_t *)MEMORY[0x24BEDB7E8];
  v8 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 8);
  v9 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 16);
  v18[0] = MEMORY[0x24BEDB840] + 64;
  v16 = v8;
  *(_QWORD *)&v17[*(_QWORD *)(v8 - 24) - 8] = v9;
  v10 = (std::ios_base *)&v17[*(_QWORD *)(v16 - 24) - 8];
  std::ios_base::init(v10, v17);
  v10[1].__vftable = 0;
  v10[1].__fmtflags_ = -1;
  v16 = v5 + 24;
  v18[0] = v6;
  MEMORY[0x23B83FBF4](v17);
  v11 = objc_retainAutorelease(v4);
  objc_msgSend_UTF8String(v11, v12, v13, v14, v15);
  std::ofstream::open();
  std::ostream::write();
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)&v17[*(_QWORD *)(v16 - 24) - 8], *(_DWORD *)&v17[*(_QWORD *)(v16 - 24) + 24] | 4);
  v16 = *v7;
  *(_QWORD *)&v17[*(_QWORD *)(v16 - 24) - 8] = v7[3];
  MEMORY[0x23B83FC00](v17);
  std::ostream::~ostream();
  MEMORY[0x23B83FDF8](v18);

}

@end
