@implementation DataSourceInference

- (DataSourceInference)init
{

  return 0;
}

- (DataSourceInference)initWithLength:(unint64_t)a3 contextKey:(id)a4 targetKey:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DataSourceInference;
  v11 = -[DataSourceInference init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    std::vector<std::vector<float>>::resize((uint64_t *)v11 + 1, 1uLL);
    std::vector<std::vector<float>>::resize((uint64_t *)v12 + 4, 1uLL);
    std::vector<float>::resize(*((_QWORD *)v12 + 1), a3);
    std::vector<float>::resize(*((_QWORD *)v12 + 4), a3);
    *((_QWORD *)v12 + 7) = a3;
    objc_storeStrong((id *)v12 + 8, a4);
    objc_storeStrong((id *)v12 + 9, a5);
  }

  return (DataSourceInference *)v12;
}

- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v21[0] = &unk_1E5D5BE58;
  v21[1] = &unk_1E5D5BE58;
  v21[2] = &unk_1E5D5BE58;
  v21[3] = &unk_1E5D5BE58;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sequenceLength);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sequenceLength);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sequenceLength);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sequenceLength);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sequenceLength);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v10;
  v20[4] = &unk_1E5D5BE58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F490]), "initWithData:type:shape:strides:", *(_QWORD *)self->_contextData.__begin_, 2, v19, v11);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, self->_contextKey);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sequenceLength);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", self->_contextKey);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMaxNumberOfElements:", v13);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F490]), "initWithData:type:shape:strides:", *(_QWORD *)self->_targetData.__begin_, 2, &unk_1E5D5BF60, &unk_1E5D5BF78);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, self->_targetKey);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sequenceLength);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", self->_targetKey);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMaxNumberOfElements:", v16);

  return v5;
}

- (void)setVectorsWithProcessor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t i;
  void *v11;
  int v12;
  int v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "textSequence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sequence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "textSequence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; i < objc_msgSend(v6, "count"); ++i)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    *(_DWORD *)(*(_QWORD *)self->_contextData.__begin_ + 4 * i) = v12;

  }
  objc_msgSend(v9, "floatValue");
  **(_DWORD **)self->_targetData.__begin_ = v13;

}

- (unint64_t)numberOfDataPoints
{
  return 0xAAAAAAAAAAAAAAABLL * (((char *)self->_contextData.__end_ - (char *)self->_contextData.__begin_) >> 3);
}

- (void).cxx_destruct
{
  vector<std::vector<float>, std::allocator<std::vector<float>>> *p_targetData;

  objc_storeStrong((id *)&self->_targetKey, 0);
  objc_storeStrong((id *)&self->_contextKey, 0);
  p_targetData = &self->_targetData;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_targetData);
  p_targetData = &self->_contextData;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_targetData);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
