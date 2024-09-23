@implementation PHASETransmissionModelerSourcePointSet

- (PHASETransmissionModelerSourcePointSet)init
{
  PHASETransmissionModelerSourcePointSet *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHASETransmissionModelerSourcePointSet;
  result = -[PHASETransmissionModelerSourcePointSet init](&v3, sel_init);
  result->_size = 0;
  return result;
}

- (PHASETransmissionModelerSourcePointSet)initWithRenderSourceView:(const void *)a3
{
  id v4;
  PHASETransmissionModelerSourcePointSet *v5;
  unint64_t v6;
  char *v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float *v24;
  float v25;
  uint64_t v26;
  float v27;
  float v28;
  uint64_t v29;
  __int128 v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)PHASETransmissionModelerSourcePointSet;
  v4 = -[PHASETransmissionModelerSourcePointSet init](&v32, sel_init);
  v5 = (PHASETransmissionModelerSourcePointSet *)v4;
  v6 = *((_QWORD *)a3 + 2);
  v8 = (char *)*((_QWORD *)v4 + 1);
  v7 = (char *)*((_QWORD *)v4 + 2);
  v9 = (v7 - v8) >> 4;
  if (v6 <= v9)
  {
    v17 = (char *)*((_QWORD *)v4 + 2);
    if (v6 >= v9)
      goto LABEL_19;
    v17 = &v8[16 * v6];
    goto LABEL_18;
  }
  v10 = v6 - v9;
  v11 = *((_QWORD *)v4 + 3);
  if (v6 - v9 <= (v11 - (uint64_t)v7) >> 4)
  {
    bzero(*((void **)v4 + 2), 16 * v10);
    v17 = &v7[16 * v10];
LABEL_18:
    *(_QWORD *)&v5->_anon_8[8] = v17;
    goto LABEL_19;
  }
  if (v6 >> 60)
    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
  v12 = v11 - (_QWORD)v8;
  if (v12 >> 3 > v6)
    v6 = v12 >> 3;
  if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
    v13 = 0xFFFFFFFFFFFFFFFLL;
  else
    v13 = v6;
  if (v13 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v14 = (char *)operator new(16 * v13);
  v15 = &v14[16 * v9];
  v16 = &v14[16 * v13];
  bzero(v15, 16 * v10);
  v17 = &v15[16 * v10];
  if (v7 != v8)
  {
    do
    {
      v18 = *((_OWORD *)v7 - 1);
      v7 -= 16;
      *((_OWORD *)v15 - 1) = v18;
      v15 -= 16;
    }
    while (v7 != v8);
    v7 = v8;
  }
  *(_QWORD *)v5->_anon_8 = v15;
  *(_QWORD *)&v5->_anon_8[8] = v17;
  *(_QWORD *)&v5->_anon_8[16] = v16;
  if (v7)
  {
    operator delete(v7);
    v17 = *(char **)&v5->_anon_8[8];
  }
LABEL_19:
  v19 = (uint64_t)&v17[-*(_QWORD *)v5->_anon_8];
  v5->_size = v19 >> 4;
  if (v19)
  {
    v20 = 0;
    v21 = 0;
    do
    {
      v22 = *((_QWORD *)a3 + 4);
      v23 = *(unsigned int *)(v22 + (v21 << 7) + 124);
      if ((_DWORD)v23)
      {
        v24 = (float *)(v22 + v20);
        v25 = 0.0;
        v26 = v23;
        do
        {
          v27 = *v24++;
          v25 = v25 + v27;
          --v26;
        }
        while (v26);
      }
      else
      {
        v25 = 0.0;
      }
      v28 = (float)(1.0 / (float)v23) * v25;
      v29 = *((_QWORD *)a3 + 3) + 12 * v21;
      *(_QWORD *)&v30 = *(_QWORD *)v29;
      DWORD2(v30) = *(_DWORD *)(v29 + 8);
      *((float *)&v30 + 3) = v28;
      *(_OWORD *)(*(_QWORD *)v5->_anon_8 + 16 * v21++) = v30;
      v20 += 128;
    }
    while (v21 < v5->_size);
  }
  return v5;
}

- (__n128)positionAtIndex:(unint64_t)a3
{
  uint64_t v3;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0x8000000000000000) != 0 || (v3 = *((_QWORD *)a1 + 1), a3 >= (*((_QWORD *)a1 + 2) - v3) >> 4))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASETransmissionModelerView.mm";
      v9 = 1024;
      v10 = 85;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: index >= 0 && index < _points.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: index >= 0 && index < _points.size() is false.");
  }
  return *(__n128 *)(v3 + 16 * a3);
}

- (float)attenuationAtIndex:(int64_t)a3
{
  uint64_t v3;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0 || (v3 = *(_QWORD *)self->_anon_8, a3 >= (unint64_t)((*(_QWORD *)&self->_anon_8[8] - v3) >> 4)))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASETransmissionModelerView.mm";
      v9 = 1024;
      v10 = 97;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: index >= 0 && index < _points.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: index >= 0 && index < _points.size() is false.");
  }
  return *(float *)(v3 + 16 * a3 + 12);
}

- (__n128)positionAndAttenuationAtIndex:(unint64_t)a3
{
  uint64_t v3;
  NSObject *v5;
  std::runtime_error *exception;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0x8000000000000000) != 0 || (v3 = *((_QWORD *)a1 + 1), a3 >= (*((_QWORD *)a1 + 2) - v3) >> 4))
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 208));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASETransmissionModelerView.mm";
      v9 = 1024;
      v10 = 108;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: index >= 0 && index < _points.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: index >= 0 && index < _points.size() is false.");
  }
  return *(__n128 *)(v3 + 16 * a3);
}

- (int64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  void *v3;

  v3 = *(void **)self->_anon_8;
  if (v3)
  {
    *(_QWORD *)&self->_anon_8[8] = v3;
    operator delete(v3);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
