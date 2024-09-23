@implementation MLModelStructureProgramFunction

- (MLModelStructureProgramFunction)initWithInputs:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  MLModelStructureProgramFunction *v8;
  uint64_t v9;
  NSArray *inputs;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLModelStructureProgramFunction;
  v8 = -[MLModelStructureProgramFunction init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    inputs = v8->_inputs;
    v8->_inputs = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_block, a4);
  }

  return v8;
}

- (MLModelStructureProgramFunction)initWithMILFunction:(const void *)a3 path:(Path *)a4
{
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  MLModelStructureProgramValueType *v12;
  _QWORD *v13;
  void *v14;
  MLModelStructureProgramNamedValueType *v15;
  _QWORD *v16;
  _QWORD *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  MLModelStructureProgramBlock *v21;
  MLModelStructureProgramBlock *v22;
  MLModelStructureProgramFunction *v23;
  Path *v25;
  __int128 v26;
  void *value;
  _QWORD v28[3];
  int v29;
  void **v30;

  v7 = (_QWORD *)(*(uint64_t (**)(const void *, SEL))(*(_QWORD *)a3 + 128))(a3, a2);
  v25 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7[2]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (_QWORD *)*v7;
  v10 = v7 + 1;
  v9 = v11;
  if (v11 != v10)
  {
    do
    {
      v12 = -[MLModelStructureProgramValueType initWithMILValueType:]([MLModelStructureProgramValueType alloc], "initWithMILValueType:", v9[7]);
      v13 = v9 + 4;
      if (*((char *)v9 + 55) < 0)
        v13 = (_QWORD *)*v13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[MLModelStructureProgramNamedValueType initWithName:type:]([MLModelStructureProgramNamedValueType alloc], "initWithName:type:", v14, v12);
      objc_msgSend(v8, "addObject:", v15);

      v16 = (_QWORD *)v9[1];
      if (v16)
      {
        do
        {
          v17 = v16;
          v16 = (_QWORD *)*v16;
        }
        while (v16);
      }
      else
      {
        do
        {
          v17 = (_QWORD *)v9[2];
          v18 = *v17 == (_QWORD)v9;
          v9 = v17;
        }
        while (!v18);
      }
      v9 = v17;
    }
    while (v17 != v10);
  }
  v19 = (*(uint64_t (**)(const void *))(*(_QWORD *)a3 + 32))(a3);
  v20 = (*(uint64_t (**)(const void *, uint64_t))(*(_QWORD *)a3 + 64))(a3, v19);
  v28[0] = -1;
  v29 = 3;
  CoreML::ModelStructure::Path::appendComponent((uint64_t)v25, (uint64_t)v28);
  std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v28);
  v21 = [MLModelStructureProgramBlock alloc];
  v26 = *(_OWORD *)&v25->m_components.__begin_;
  value = v25->m_components.__end_cap_.__value_;
  v25->m_components.__end_ = 0;
  v25->m_components.__end_cap_.__value_ = 0;
  v25->m_components.__begin_ = 0;
  v22 = -[MLModelStructureProgramBlock initWithMILBlock:path:](v21, "initWithMILBlock:path:", v20, &v26);
  v30 = (void **)&v26;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](&v30);
  v23 = -[MLModelStructureProgramFunction initWithInputs:block:](self, "initWithInputs:block:", v8, v22);

  return v23;
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (MLModelStructureProgramBlock)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_block, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
