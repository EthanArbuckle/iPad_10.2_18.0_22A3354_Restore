@implementation MLModelStructureProgramBlock

- (MLModelStructureProgramBlock)initWithInputs:(id)a3 outputNames:(id)a4 operations:(id)a5
{
  id v8;
  id v9;
  id v10;
  MLModelStructureProgramBlock *v11;
  uint64_t v12;
  NSArray *inputs;
  uint64_t v14;
  NSArray *outputNames;
  uint64_t v16;
  NSArray *operations;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MLModelStructureProgramBlock;
  v11 = -[MLModelStructureProgramBlock init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    inputs = v11->_inputs;
    v11->_inputs = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    outputNames = v11->_outputNames;
    v11->_outputNames = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    operations = v11->_operations;
    v11->_operations = (NSArray *)v16;

  }
  return v11;
}

- (MLModelStructureProgramBlock)initWithMILBlock:(const void *)a3 path:(Path *)a4
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  MLModelStructureProgramNamedValueType *v9;
  uint64_t **v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  void *v14;
  char ***v15;
  void *v16;
  char *v17;
  char *i;
  uint64_t v19;
  uint64_t v20;
  uint64_t Name;
  __int128 v22;
  std::string::size_type v23;
  char v24;
  MLModelStructureProgramOperation *v25;
  MLModelStructureProgramBlock *v26;
  void *v29;
  void *v30;
  std::string::size_type v31;
  _BYTE v32[15];
  char v33;
  int v34;
  _QWORD v35[3];
  std::string v36;
  void **v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v6 = (_QWORD *)(*(uint64_t (**)(const void *, SEL))(*(_QWORD *)a3 + 40))(a3, a2);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (uint64_t)(v6[1] - *v6) >> 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (_QWORD *)*v6;
  v8 = (_QWORD *)v6[1];
  if ((_QWORD *)*v6 != v8)
  {
    do
    {
      v9 = -[MLModelStructureProgramNamedValueType initWithMILNamedValueType:]([MLModelStructureProgramNamedValueType alloc], "initWithMILNamedValueType:", *v7);
      objc_msgSend(v30, "addObject:", v9);

      v7 += 2;
    }
    while (v7 != v8);
  }
  v10 = (uint64_t **)(*(uint64_t (**)(const void *))(*(_QWORD *)a3 + 88))(a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * (v10[1] - *v10));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *v10;
  v12 = v10[1];
  if (*v10 != v12)
  {
    do
    {
      v13 = v11;
      if (*((char *)v11 + 23) < 0)
        v13 = (uint64_t *)*v11;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObject:", v14);

      v11 += 3;
    }
    while (v11 != v12);
  }
  v15 = (char ***)(*(uint64_t (**)(const void *))(*(_QWORD *)a3 + 56))(a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", ((*v15)[1] - **v15) >> 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = **v15;
  for (i = (*v15)[1]; v17 != i; v17 += 16)
  {
    v19 = *(_QWORD *)v17;
    v20 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)v17 + 176))(*(_QWORD *)v17);
    if (*(_QWORD *)(v20 + 8) == *(_QWORD *)v20)
    {
      memset(&v36, 0, sizeof(v36));
    }
    else
    {
      Name = MIL::IRNamedValueType::GetName(**(MIL::IRNamedValueType ***)v20);
      if (*(char *)(Name + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v36, *(const std::string::value_type **)Name, *(_QWORD *)(Name + 8));
      }
      else
      {
        v22 = *(_OWORD *)Name;
        v36.__r_.__value_.__r.__words[2] = *(_QWORD *)(Name + 16);
        *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v22;
      }
    }
    memset(v35, 0, sizeof(v35));
    std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)v35, (uint64_t)a4->m_components.__begin_, (uint64_t)a4->m_components.__end_, ((char *)a4->m_components.__end_ - (char *)a4->m_components.__begin_) >> 5);
    v38[0] = v36.__r_.__value_.__l.__size_;
    v23 = v36.__r_.__value_.__r.__words[0];
    *(_QWORD *)((char *)v38 + 7) = *(std::string::size_type *)((char *)&v36.__r_.__value_.__r.__words[1] + 7);
    v24 = HIBYTE(v36.__r_.__value_.__r.__words[2]);
    memset(&v36, 0, sizeof(v36));
    *(_QWORD *)v32 = v38[0];
    *(_QWORD *)&v32[7] = *(_QWORD *)((char *)v38 + 7);
    v38[0] = 0;
    *(_QWORD *)((char *)v38 + 7) = 0;
    v31 = v23;
    v33 = v24;
    v34 = 4;
    CoreML::ModelStructure::Path::appendComponent((uint64_t)v35, (uint64_t)&v31);
    std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v31);
    v25 = -[MLModelStructureProgramOperation initWithMILOperation:path:]([MLModelStructureProgramOperation alloc], "initWithMILOperation:path:", v19, v35);
    objc_msgSend(v16, "addObject:", v25);

    v37 = (void **)v35;
    std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](&v37);
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v36.__r_.__value_.__l.__data_);
  }
  v26 = -[MLModelStructureProgramBlock initWithInputs:outputNames:operations:](self, "initWithInputs:outputNames:operations:", v30, v29, v16);

  return v26;
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (NSArray)outputNames
{
  return self->_outputNames;
}

- (NSArray)operations
{
  return self->_operations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
