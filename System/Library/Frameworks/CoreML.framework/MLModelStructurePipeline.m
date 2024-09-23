@implementation MLModelStructurePipeline

- (MLModelStructurePipeline)initWithSubModelNames:(id)a3 subModels:(id)a4
{
  id v6;
  id v7;
  MLModelStructurePipeline *v8;
  uint64_t v9;
  NSArray *subModelNames;
  uint64_t v11;
  NSArray *subModels;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MLModelStructurePipeline;
  v8 = -[MLModelStructurePipeline init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    subModelNames = v8->_subModelNames;
    v8->_subModelNames = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    subModels = v8->_subModels;
    v8->_subModels = (NSArray *)v11;

  }
  return v8;
}

- (NSArray)subModelNames
{
  return self->_subModelNames;
}

- (NSArray)subModels
{
  return self->_subModels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subModels, 0);
  objc_storeStrong((id *)&self->_subModelNames, 0);
}

+ (id)loadModelStructureFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 path:(Path *)a6 error:(id *)a7
{
  id v12;
  id v13;
  MLModelAssetDescription *v14;
  BOOL v15;
  id v16;
  void *v17;
  unint64_t i;
  id v19;
  char *v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  id v24;
  void *v25;
  char v26;
  void *v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  void *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  MLModelAssetDescription *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  __int128 v47;
  uint64_t v48;
  void *v49;
  __int128 v50;
  void *v51;
  _BYTE v52[15];
  char v53;
  int v54;
  __int128 v55;
  uint64_t v56;
  void *__p;
  std::__shared_weak_count *v58;
  char v59;
  char *v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  uint64_t v63;
  char *v64;
  id v65;
  id v66;
  void **v67[2];

  v12 = a4;
  v13 = a5;
  v14 = -[MLModelAssetDescription initWithCompiledModelArchive:error:]([MLModelAssetDescription alloc], "initWithCompiledModelArchive:error:", a3, a7);
  if (v14)
  {
    v42 = v14;
    v43 = v13;
    v44 = v12;
    v65 = 0;
    v66 = 0;
    v15 = +[MLPipeline parseModelArchive:subModelNames:subModelArchiveNames:error:](MLPipeline, "parseModelArchive:subModelNames:subModelArchiveNames:error:", a3, &v66, &v65, a7);
    v46 = v66;
    v16 = v65;
    v17 = v16;
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; ; ++i)
      {
        if (i >= objc_msgSend(v46, "count"))
        {
          v34 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSubModelNames:subModels:", v46, v45);
          goto LABEL_38;
        }
        objc_msgSend(v17, "objectAtIndexedSubscript:", i);
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v19, "UTF8String"));
        v20 = IArchive::nestedArchive(a3, (uint64_t)&__p);
        v21 = (std::__shared_weak_count *)*((_QWORD *)v20 + 1);
        v61 = *(_QWORD *)v20;
        v62 = v21;
        if (v21)
        {
          p_shared_owners = (unint64_t *)&v21->__shared_owners_;
          do
            v23 = __ldxr(p_shared_owners);
          while (__stxr(v23 + 1, p_shared_owners));
        }
        std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)&v63, (_QWORD *)v20 + 2);
        if (v59 < 0)
          operator delete(__p);
        _MLModelInputArchiver::_MLModelInputArchiver((_MLModelInputArchiver *)&__p, (const IArchive *)&v61);
        v55 = 0uLL;
        v56 = 0;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)&v55, (uint64_t)a6->m_components.__begin_, (uint64_t)a6->m_components.__end_, ((char *)a6->m_components.__end_ - (char *)a6->m_components.__begin_) >> 5);
        v24 = objc_retainAutorelease(v19);
        std::string::basic_string[abi:ne180100]<0>(&v49, (char *)objc_msgSend(v24, "UTF8String"));
        v25 = v49;
        *(_QWORD *)v52 = v50;
        *(_QWORD *)&v52[7] = *(_QWORD *)((char *)&v50 + 7);
        v26 = HIBYTE(v50);
        v49 = 0;
        v50 = 0uLL;
        v51 = v25;
        v53 = v26;
        v54 = 8;
        CoreML::ModelStructure::Path::appendComponent((uint64_t)&v55, (uint64_t)&v51);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v51);
        if (SHIBYTE(v50) < 0)
          operator delete(v49);
        v47 = v55;
        v48 = v56;
        v56 = 0;
        v55 = 0uLL;
        +[MLModelStructure loadModelStructureFromCompiledArchive:path:error:](MLModelStructure, "loadModelStructureFromCompiledArchive:path:error:", &__p, &v47, a7);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = (void **)&v47;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v67);
        if (!v27)
          break;
        objc_msgSend(v45, "addObject:", v27);

        v67[0] = (void **)&v55;
        std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v67);
        std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v60);
        v28 = v58;
        if (v58)
        {
          v29 = (unint64_t *)&v58->__shared_owners_;
          do
            v30 = __ldaxr(v29);
          while (__stlxr(v30 - 1, v29));
          if (!v30)
          {
            ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
            std::__shared_weak_count::__release_weak(v28);
          }
        }
        std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v64);
        v31 = v62;
        if (v62)
        {
          v32 = (unint64_t *)&v62->__shared_owners_;
          do
            v33 = __ldaxr(v32);
          while (__stlxr(v33 - 1, v32));
          if (!v33)
          {
            ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
            std::__shared_weak_count::__release_weak(v31);
          }
        }

      }
      v67[0] = (void **)&v55;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v67);
      std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v60);
      v35 = v58;
      if (v58)
      {
        v36 = (unint64_t *)&v58->__shared_owners_;
        do
          v37 = __ldaxr(v36);
        while (__stlxr(v37 - 1, v36));
        if (!v37)
        {
          ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
          std::__shared_weak_count::__release_weak(v35);
        }
      }
      std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v64);
      v38 = v62;
      if (v62)
      {
        v39 = (unint64_t *)&v62->__shared_owners_;
        do
          v40 = __ldaxr(v39);
        while (__stlxr(v40 - 1, v39));
        if (!v40)
        {
          ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
          std::__shared_weak_count::__release_weak(v38);
        }
      }

      v34 = 0;
LABEL_38:

    }
    else
    {
      v34 = 0;
    }

    v13 = v43;
    v12 = v44;
    v14 = v42;
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

@end
