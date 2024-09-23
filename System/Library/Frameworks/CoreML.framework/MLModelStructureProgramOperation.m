@implementation MLModelStructureProgramOperation

- (MLModelStructureProgramOperation)initWithOperatorName:(id)a3 inputs:(id)a4 outputs:(id)a5 blocks:(id)a6 path:(id)a7 milTextLocation:(id)a8 milId:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  MLModelStructureProgramOperation *v22;
  MLModelStructureProgramOperation *v23;
  uint64_t v24;
  NSDictionary *inputs;
  uint64_t v26;
  NSArray *outputs;
  uint64_t v28;
  NSArray *blocks;
  uint64_t v30;
  NSString *milTextLocation;
  uint64_t v32;
  NSNumber *milId;
  id v35;
  objc_super v36;

  v35 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v36.receiver = self;
  v36.super_class = (Class)MLModelStructureProgramOperation;
  v22 = -[MLModelStructureProgramOperation init](&v36, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_operatorName, a3);
    v24 = objc_msgSend(v16, "copy");
    inputs = v23->_inputs;
    v23->_inputs = (NSDictionary *)v24;

    v26 = objc_msgSend(v17, "copy");
    outputs = v23->_outputs;
    v23->_outputs = (NSArray *)v26;

    v28 = objc_msgSend(v18, "copy");
    blocks = v23->_blocks;
    v23->_blocks = (NSArray *)v28;

    objc_storeStrong((id *)&v23->_path, a7);
    v30 = objc_msgSend(v20, "copy");
    milTextLocation = v23->_milTextLocation;
    v23->_milTextLocation = (NSString *)v30;

    v32 = objc_msgSend(v21, "copy");
    milId = v23->_milId;
    v23->_milId = (NSNumber *)v32;

  }
  return v23;
}

- (MLModelStructureProgramOperation)initWithMILOperation:(const void *)a3 path:(const void *)a4
{
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  MLModelStructureProgramArgument *v14;
  _QWORD *v15;
  _QWORD *v16;
  BOOL v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  MLModelStructureProgramNamedValueType *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  MLModelStructureProgramBlock *v28;
  MLModelStructureProgramBlock *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  MLModelStructurePath *v35;
  MLModelStructurePath *v36;
  const void *Location;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t Attribute;
  MIL::IRValue *v44;
  MLModelStructureProgramOperation *v45;
  void *v47;
  void *v48;
  MLModelStructureProgramOperation *v49;
  MIL::IRObject *v50;
  _QWORD v51[3];
  __int128 v52;
  uint64_t v53;
  _QWORD v54[3];
  int v55;
  __int128 v56;
  uint64_t v57;
  void **v58[2];

  MIL::IRObject::GetLocation((MIL::IRObject *)a3);
  v7 = (_QWORD *)(*(uint64_t (**)(const void *))(*(_QWORD *)a3 + 160))(a3);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v7[2]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (_QWORD *)*v7;
  v9 = v7 + 1;
  v10 = v11;
  if (v11 != v9)
  {
    do
    {
      v12 = v10 + 4;
      if (*((char *)v10 + 55) < 0)
        v12 = (_QWORD *)*v12;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[MLModelStructureProgramArgument initWithMILArguments:]([MLModelStructureProgramArgument alloc], "initWithMILArguments:", v10 + 7);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v13);

      v15 = (_QWORD *)v10[1];
      if (v15)
      {
        do
        {
          v16 = v15;
          v15 = (_QWORD *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          v16 = (_QWORD *)v10[2];
          v17 = *v16 == (_QWORD)v10;
          v10 = v16;
        }
        while (!v17);
      }
      v10 = v16;
    }
    while (v16 != v9);
  }
  v50 = (MIL::IRObject *)a3;
  v18 = (_QWORD *)(*(uint64_t (**)(const void *))(*(_QWORD *)a3 + 176))(a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (uint64_t)(v18[1] - *v18) >> 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (_QWORD *)*v18;
  v21 = (_QWORD *)v18[1];
  if ((_QWORD *)*v18 != v21)
  {
    do
    {
      v22 = -[MLModelStructureProgramNamedValueType initWithMILNamedValueType:]([MLModelStructureProgramNamedValueType alloc], "initWithMILNamedValueType:", *v20);
      objc_msgSend(v19, "addObject:", v22);

      v20 += 2;
    }
    while (v20 != v21);
  }
  v23 = (*(uint64_t (**)(MIL::IRObject *))(*(_QWORD *)v50 + 208))(v50);
  v47 = v19;
  v48 = v8;
  v49 = self;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (uint64_t)(*(_QWORD *)(*(_QWORD *)v23 + 8) - **(_QWORD **)v23) >> 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*(_QWORD *)v23 + 8) != **(_QWORD **)v23)
  {
    v25 = 0;
    v26 = 0;
    do
    {
      v56 = 0uLL;
      v57 = 0;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)&v56, *(_QWORD *)a4, *((_QWORD *)a4 + 1), (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 5);
      v54[0] = v26;
      v55 = 3;
      CoreML::ModelStructure::Path::appendComponent((uint64_t)&v56, (uint64_t)v54);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v54);
      v27 = *(_QWORD *)(**(_QWORD **)v23 + v25);
      v28 = [MLModelStructureProgramBlock alloc];
      v52 = v56;
      v53 = v57;
      v57 = 0;
      v56 = 0uLL;
      v29 = -[MLModelStructureProgramBlock initWithMILBlock:path:](v28, "initWithMILBlock:path:", v27, &v52);
      v58[0] = (void **)&v52;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v58);
      objc_msgSend(v24, "addObject:", v29);

      v58[0] = (void **)&v56;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v58);
      ++v26;
      v25 += 16;
    }
    while (v26 < (uint64_t)(*(_QWORD *)(*(_QWORD *)v23 + 8) - **(_QWORD **)v23) >> 4);
  }
  v30 = (void *)MEMORY[0x1E0CB3940];
  v31 = (*(uint64_t (**)(MIL::IRObject *))(*(_QWORD *)v50 + 64))(v50);
  v32 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 16))(v31);
  if (*(char *)(v32 + 23) >= 0)
    v33 = v32;
  else
    v33 = *(_QWORD *)v32;
  objc_msgSend(v30, "stringWithUTF8String:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = [MLModelStructurePath alloc];
  memset(v51, 0, sizeof(v51));
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)v51, *(_QWORD *)a4, *((_QWORD *)a4 + 1), (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 5);
  v36 = -[MLModelStructurePath initWithCppPath:](v35, "initWithCppPath:", v51);
  *(_QWORD *)&v56 = v51;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v56);
  Location = (const void *)MIL::IRObject::GetLocation(v50);
  v38 = __dynamic_cast(Location, MEMORY[0x1E0D45EB8], MEMORY[0x1E0D45EA0], 0);
  if (v38)
  {
    v39 = v38;
    v40 = (void *)MEMORY[0x1E0CB3940];
    v41 = (*(uint64_t (**)(void *))(*(_QWORD *)v38 + 48))(v38);
    objc_msgSend(v40, "stringWithFormat:", CFSTR("%llu:%llu"), v41, (*(uint64_t (**)(void *))(*(_QWORD *)v39 + 32))(v39));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v56, "milId");
  Attribute = MIL::IRObject::TryGetAttribute();
  v44 = (MIL::IRValue *)Attribute;
  if ((SHIBYTE(v57) & 0x80000000) == 0)
  {
    if (!Attribute)
      goto LABEL_26;
    goto LABEL_25;
  }
  operator delete((void *)v56);
  if (v44)
  {
LABEL_25:
    MIL::IRValue::AsTensor(v44);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", MIL::IRValue::GetScalar<unsigned long long>());
    v44 = (MIL::IRValue *)objc_claimAutoreleasedReturnValue();
  }
LABEL_26:
  v45 = -[MLModelStructureProgramOperation initWithOperatorName:inputs:outputs:blocks:path:milTextLocation:milId:](v49, "initWithOperatorName:inputs:outputs:blocks:path:milTextLocation:milId:", v34, v48, v47, v24, v36, v42, v44);

  return v45;
}

- (NSString)operatorName
{
  return self->_operatorName;
}

- (NSDictionary)inputs
{
  return self->_inputs;
}

- (NSArray)outputs
{
  return self->_outputs;
}

- (NSArray)blocks
{
  return self->_blocks;
}

- (MLModelStructurePath)path
{
  return self->_path;
}

- (NSString)milTextLocation
{
  return self->_milTextLocation;
}

- (NSNumber)milId
{
  return self->_milId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_milId, 0);
  objc_storeStrong((id *)&self->_milTextLocation, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_blocks, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
}

@end
