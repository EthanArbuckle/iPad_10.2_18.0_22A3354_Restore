@implementation MLModelStructure

- (MLModelStructure)initWithNeuralNetwork:(id)a3 program:(id)a4 pipeline:(id)a5
{
  id v9;
  id v10;
  id v11;
  MLModelStructure *v12;
  MLModelStructure *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MLModelStructure;
  v12 = -[MLModelStructure init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_neuralNetwork, a3);
    objc_storeStrong((id *)&v13->_program, a4);
    objc_storeStrong((id *)&v13->_pipeline, a5);
  }

  return v13;
}

- (MLModelStructure)initWithNeuralNetwork:(id)a3
{
  return -[MLModelStructure initWithNeuralNetwork:program:pipeline:](self, "initWithNeuralNetwork:program:pipeline:", a3, 0, 0);
}

- (MLModelStructure)initWithProgram:(id)a3
{
  return -[MLModelStructure initWithNeuralNetwork:program:pipeline:](self, "initWithNeuralNetwork:program:pipeline:", 0, a3, 0);
}

- (MLModelStructure)initWithPipeline:(id)a3
{
  return -[MLModelStructure initWithNeuralNetwork:program:pipeline:](self, "initWithNeuralNetwork:program:pipeline:", 0, 0, a3);
}

- (MLModelStructureNeuralNetwork)neuralNetwork
{
  return self->_neuralNetwork;
}

- (MLModelStructureProgram)program
{
  return self->_program;
}

- (MLModelStructurePipeline)pipeline
{
  return self->_pipeline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipeline, 0);
  objc_storeStrong((id *)&self->_program, 0);
  objc_storeStrong((id *)&self->_neuralNetwork, 0);
}

+ (id)loadModelStructureFromCompiledArchive:(void *)a3 path:(Path *)a4 error:(id *)a5
{
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  uint64_t v21;
  _BYTE v22[24];
  int v23;
  __int128 v24;
  uint64_t v25;
  _BYTE v26[24];
  int v27;
  __int128 v28;
  uint64_t v29;
  _BYTE v30[24];
  int v31;
  uint8_t buf[16];
  uint64_t v33;
  id v34;
  id v35;
  int v36;
  uint8_t *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  if (!(*(unsigned int (**)(_QWORD, SEL))(**(_QWORD **)a3 + 64))(*(_QWORD *)a3, a2))
  {
    v36 = 0;
    v34 = 0;
    v35 = 0;
    v14 = +[MLArchivingUtils parseModelArchive:modelType:compilerVersion:modelVersion:error:](MLArchivingUtils, "parseModelArchive:modelType:compilerVersion:modelVersion:error:", a3, &v36, &v35, &v34, a5);
    v15 = v35;
    v16 = v34;
    if (!v14)
    {
      a5 = 0;
LABEL_30:

      return a5;
    }
    if (v36 <= 302)
    {
      if ((v36 - 200) < 3)
      {
        memset(buf, 0, sizeof(buf));
        v33 = 0;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)buf, (uint64_t)a4->m_components.__begin_, (uint64_t)a4->m_components.__end_, ((char *)a4->m_components.__end_ - (char *)a4->m_components.__begin_) >> 5);
        v23 = 7;
        CoreML::ModelStructure::Path::appendComponent((uint64_t)buf, (uint64_t)v22);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v22);
        v20 = *(_OWORD *)buf;
        v21 = v33;
        v33 = 0;
        memset(buf, 0, sizeof(buf));
        +[MLModelStructurePipeline loadModelStructureFromCompiledArchive:modelVersionInfo:compilerVersionInfo:path:error:](MLModelStructurePipeline, "loadModelStructureFromCompiledArchive:modelVersionInfo:compilerVersionInfo:path:error:", a3, v16, v15, &v20, a5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (uint8_t *)&v20;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
        if (v17)
          a5 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithPipeline:", v17);
        else
          a5 = 0;

        goto LABEL_29;
      }
    }
    else
    {
      if (v36 <= 499)
      {
        if (v36 != 303 && v36 != 403)
          goto LABEL_26;
        goto LABEL_18;
      }
      if (v36 == 502)
      {
        memset(buf, 0, sizeof(buf));
        v33 = 0;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)buf, (uint64_t)a4->m_components.__begin_, (uint64_t)a4->m_components.__end_, ((char *)a4->m_components.__end_ - (char *)a4->m_components.__begin_) >> 5);
        v27 = 1;
        CoreML::ModelStructure::Path::appendComponent((uint64_t)buf, (uint64_t)v26);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v26);
        v24 = *(_OWORD *)buf;
        v25 = v33;
        v33 = 0;
        memset(buf, 0, sizeof(buf));
        +[MLModelStructureProgram loadModelStructureFromCompiledArchive:modelVersionInfo:compilerVersionInfo:path:error:](MLModelStructureProgram, "loadModelStructureFromCompiledArchive:modelVersionInfo:compilerVersionInfo:path:error:", a3, v16, v15, &v24, a5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (uint8_t *)&v24;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
        if (v19)
          a5 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithProgram:", v19);
        else
          a5 = 0;

        goto LABEL_29;
      }
      if (v36 == 500)
      {
LABEL_18:
        memset(buf, 0, sizeof(buf));
        v33 = 0;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)buf, (uint64_t)a4->m_components.__begin_, (uint64_t)a4->m_components.__end_, ((char *)a4->m_components.__end_ - (char *)a4->m_components.__begin_) >> 5);
        v31 = 5;
        CoreML::ModelStructure::Path::appendComponent((uint64_t)buf, (uint64_t)v30);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v30);
        v28 = *(_OWORD *)buf;
        v29 = v33;
        v33 = 0;
        memset(buf, 0, sizeof(buf));
        +[MLModelStructureNeuralNetwork loadModelStructureFromCompiledArchive:modelVersionInfo:compilerVersionInfo:path:error:](MLModelStructureNeuralNetwork, "loadModelStructureFromCompiledArchive:modelVersionInfo:compilerVersionInfo:path:error:", a3, v16, v15, &v28, a5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (uint8_t *)&v28;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
        if (v18)
          a5 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithNeuralNetwork:", v18);
        else
          a5 = 0;

LABEL_29:
        v37 = buf;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
        goto LABEL_30;
      }
    }
LABEL_26:
    a5 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithNeuralNetwork:program:pipeline:", 0, 0, 0);
    goto LABEL_30;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "Failed to construct MLModelStructure, encrypted model is not supported.", buf, 2u);
  }

  if (a5)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to construct MLModelStructure, encrypted model is not supported."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  return a5;
}

+ (void)loadModelAsset:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(a3, "modelStructureWithCompletionHandler:", a4);
}

+ (void)loadContentsOfURL:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, id);
  void *v7;
  id v8;
  id v9;

  v6 = (void (**)(id, _QWORD, id))a4;
  v9 = 0;
  +[MLModelAsset modelAssetWithURL:error:](MLModelAsset, "modelAssetWithURL:error:", a3, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  if (v7)
    objc_msgSend(a1, "loadModelAsset:completionHandler:", v7, v6);
  else
    v6[2](v6, 0, v8);

}

@end
