@implementation MLModelStructurePath

- (MLModelStructurePath)initWithCppPath:(Path *)a3
{
  MLModelStructurePath *v4;
  MLModelStructurePath *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MLModelStructurePath;
  v4 = -[MLModelStructurePath init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__vdeallocate(&v4->_cppPath.m_components.__begin_);
    *(_OWORD *)&v5->_cppPath.m_components.__begin_ = *(_OWORD *)&a3->m_components.__begin_;
    v5->_cppPath.m_components.__end_cap_.__value_ = a3->m_components.__end_cap_.__value_;
    a3->m_components.__begin_ = 0;
    a3->m_components.__end_ = 0;
    a3->m_components.__end_cap_.__value_ = 0;
  }
  return v5;
}

- (MLModelStructurePath)initWithNeuralNetworkLayerName:(id)a3 scopedModelNames:(id)a4
{
  id v6;
  id v7;
  char v8;
  MLModelStructurePath *v9;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  void *__p;
  __int128 v16;
  void *v17;
  _BYTE v18[15];
  char v19;
  int v20;
  void **v21[3];
  int v22;

  v6 = a3;
  v22 = 5;
  CoreML::ModelStructure::Path::appendComponent((uint64_t)&v13, (uint64_t)v21);
  std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v21);
  v7 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v7, "UTF8String"));
  v17 = __p;
  *(_QWORD *)v18 = v16;
  *(_QWORD *)&v18[7] = *(_QWORD *)((char *)&v16 + 7);
  v8 = HIBYTE(v16);
  v16 = 0uLL;
  __p = 0;
  v19 = v8;
  v20 = 6;
  CoreML::ModelStructure::Path::appendComponent((uint64_t)&v13, (uint64_t)&v17);
  std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v17);
  if (SHIBYTE(v16) < 0)
    operator delete(__p);

  v11 = v13;
  v12 = v14;
  v13 = 0uLL;
  v14 = 0;
  v9 = -[MLModelStructurePath initWithCppPath:](self, "initWithCppPath:", &v11);
  v21[0] = (void **)&v11;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v21);
  v21[0] = (void **)&v13;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v21);

  return v9;
}

- (MLModelStructurePath)initWithMLProgramOperationPathComponents:(id)a3 scopedModelNames:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  std::string::size_type v35;
  char v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  MLModelStructurePath *v65;
  std::logic_error *exception;
  std::runtime_error *v68;
  std::runtime_error *v69;
  std::runtime_error *v70;
  std::logic_error *v71;
  std::logic_error *v72;
  void *v73;
  id v75;
  id obj;
  id v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  uint64_t v81;
  __int128 v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  void *v92;
  __int128 v93;
  std::string v94;
  int v95;
  _QWORD v96[3];
  std::string __p;
  void **v98[16];
  void **v99[6];

  v99[4] = *(void ***)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LOBYTE(v82) = 0;
  v84 = 0;
  v8 = v6;
  v75 = v7;
  v9 = v8;
  v86 = 0;
  v87 = 0;
  v85 = 0;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v89;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v89 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v12);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Type");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v16 = v15;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
        v18 = v17;

        if (!v18)
        {
          exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::string::basic_string[abi:ne180100]<0>(&__p, "component");
          std::string::basic_string[abi:ne180100]<0>(v99, "Type");
          std::logic_error::logic_error(exception, &v94);
          __cxa_throw(exception, MEMORY[0x1E0DE4E70], MEMORY[0x1E0DE42A0]);
        }
        objc_msgSend(v77, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "intValue");

        switch(v20)
        {
          case 1:
            v95 = 0;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
            goto LABEL_35;
          case 2:
            v95 = 1;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
            goto LABEL_35;
          case 3:
            v28 = v13;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Name");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKeyedSubscript:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v31 = v30;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v32 = v31;
            else
              v32 = 0;
            v33 = v32;

            v34 = objc_retainAutorelease(v33);
            std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v34, "UTF8String"));
            v94.__r_.__value_.__l.__size_ = __p.__r_.__value_.__l.__size_;
            v35 = __p.__r_.__value_.__r.__words[0];
            *(std::string::size_type *)((char *)&v94.__r_.__value_.__r.__words[1] + 7) = *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7);
            v36 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            memset(&__p, 0, sizeof(__p));
            v94.__r_.__value_.__r.__words[0] = v35;
            *((_BYTE *)&v94.__r_.__value_.__s + 23) = v36;
            v95 = 2;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
            std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v94);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);

            break;
          case 4:
            v37 = v13;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Output");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectForKeyedSubscript:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v40 = v39;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v41 = v40;
            else
              v41 = 0;
            v42 = v41;

            if (!v42)
            {
              v68 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              std::string::basic_string[abi:ne180100]<0>(v99, "Operation");
              std::string::basic_string[abi:ne180100]<0>(v96, "Output");
              std::runtime_error::runtime_error(v68, &__p);
              __cxa_throw(v68, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
            }
            v43 = objc_retainAutorelease(v42);
            std::string::basic_string[abi:ne180100]<0>(&v92, (char *)objc_msgSend(v43, "UTF8String"));
            v44 = v92;
            v94.__r_.__value_.__l.__size_ = v93;
            *(std::string::size_type *)((char *)&v94.__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)&v93 + 7);
            v45 = HIBYTE(v93);
            v92 = 0;
            v93 = 0uLL;
            v94.__r_.__value_.__r.__words[0] = (std::string::size_type)v44;
            *((_BYTE *)&v94.__r_.__value_.__s + 23) = v45;
            v95 = 4;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
            std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v94);
            if (SHIBYTE(v93) < 0)
              operator delete(v92);
            goto LABEL_51;
          case 5:
            v21 = v13;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Index");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v24 = v23;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v25 = v24;
            else
              v25 = 0;
            v26 = v25;

            if (v26)
              v27 = objc_msgSend(v26, "integerValue");
            else
              v27 = -1;
            v94.__r_.__value_.__r.__words[0] = v27;
            v95 = 3;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
            std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v94);

            break;
          case 6:
            v95 = 5;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
            goto LABEL_35;
          case 7:
            v37 = v13;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Name");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectForKeyedSubscript:", v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v48 = v47;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v49 = v48;
            else
              v49 = 0;
            v50 = v49;

            if (!v50)
            {
              v70 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              std::string::basic_string[abi:ne180100]<0>(v99, "NeuralNetwork");
              std::string::basic_string[abi:ne180100]<0>(v96, "Name");
              std::runtime_error::runtime_error(v70, &__p);
              __cxa_throw(v70, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
            }
            v43 = objc_retainAutorelease(v50);
            std::string::basic_string[abi:ne180100]<0>(&v92, (char *)objc_msgSend(v43, "UTF8String"));
            v51 = v92;
            v94.__r_.__value_.__l.__size_ = v93;
            *(std::string::size_type *)((char *)&v94.__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)&v93 + 7);
            v52 = HIBYTE(v93);
            v92 = 0;
            v93 = 0uLL;
            v94.__r_.__value_.__r.__words[0] = (std::string::size_type)v51;
            *((_BYTE *)&v94.__r_.__value_.__s + 23) = v52;
            v95 = 6;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
            std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v94);
            if (SHIBYTE(v93) < 0)
              operator delete(v92);
            goto LABEL_51;
          case 8:
            v95 = 7;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
LABEL_35:
            std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v94);
            break;
          case 9:
            v37 = v13;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Name");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectForKeyedSubscript:", v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v55 = v54;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v56 = v55;
            else
              v56 = 0;
            v57 = v56;

            if (!v57)
            {
              v69 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              std::string::basic_string[abi:ne180100]<0>(v99, "Pipeline");
              std::string::basic_string[abi:ne180100]<0>(v96, "Name");
              std::runtime_error::runtime_error(v69, &__p);
              __cxa_throw(v69, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
            }
            v43 = objc_retainAutorelease(v57);
            std::string::basic_string[abi:ne180100]<0>(&v92, (char *)objc_msgSend(v43, "UTF8String"));
            v58 = v92;
            v94.__r_.__value_.__l.__size_ = v93;
            *(std::string::size_type *)((char *)&v94.__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)&v93 + 7);
            v59 = HIBYTE(v93);
            v92 = 0;
            v93 = 0uLL;
            v94.__r_.__value_.__r.__words[0] = (std::string::size_type)v58;
            *((_BYTE *)&v94.__r_.__value_.__s + 23) = v59;
            v95 = 8;
            CoreML::ModelStructure::Path::appendComponent((uint64_t)&v85, (uint64_t)&v94);
            std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v94);
            if (SHIBYTE(v93) < 0)
              operator delete(v92);
LABEL_51:

            break;
          default:
            v71 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::string::basic_string[abi:ne180100]<0>(&__p, "component");
            std::string::basic_string[abi:ne180100]<0>(v99, "Type");
            std::logic_error::logic_error(v71, &v94);
            __cxa_throw(v71, MEMORY[0x1E0DE4E70], MEMORY[0x1E0DE42A0]);
        }

        ++v12;
      }
      while (v10 != v12);
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
      v10 = v60;
    }
    while (v60);
  }

  if (v86 == v85 || *(_DWORD *)(v86 - 8) != 4)
  {
    v72 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(v72, "Not a path to an operation.");
    __cxa_throw(v72, MEMORY[0x1E0DE4E70], MEMORY[0x1E0DE42A0]);
  }
  v61 = v85;
  v62 = v86;
  if (v86 != v85)
  {
    if (!*(_DWORD *)(v86 - 8))
    {
      v73 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A1AD5E28](v73, "Failed to append path, path must be relative.");
      __cxa_throw(v73, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    do
    {
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)v98, v61);
      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)&v88, (uint64_t)v98);
      CoreML::ModelStructure::Path::appendComponent((uint64_t)&v80, (uint64_t)&v88);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v88);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v98);
      v61 += 32;
    }
    while (v61 != v62);
  }
  v98[0] = (void **)&v85;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v98);

  if (v84)
  {
    std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__vdeallocate((void **)&v82);
    v63 = v80;
    v64 = v81;
    v81 = 0;
    v80 = 0uLL;
  }
  else
  {
    v63 = v80;
    v64 = v81;
    v81 = 0;
    v80 = 0uLL;
    v84 = 1;
  }
  v82 = v63;
  v83 = v64;
  v98[0] = (void **)&v80;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v98);
  if (v84)
  {
    v78 = v82;
    v79 = v83;
    v83 = 0;
    v82 = 0uLL;
    v65 = -[MLModelStructurePath initWithCppPath:](self, "initWithCppPath:", &v78);
    v99[0] = (void **)&v78;
    std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v99);
    if (v84)
    {
      v99[0] = (void **)&v82;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](v99);
    }
    self = v65;
  }
  else
  {
    v65 = 0;
  }

  return v65;
}

- (BOOL)isEqual:(id)a3
{
  MLModelStructurePath *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  char *begin;
  char *end;
  char v10;
  char v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;

  v4 = (MLModelStructurePath *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v4)
      {
        -[MLModelStructurePath cppPath](v4, "cppPath");
        v6 = v13;
        v5 = v14;
      }
      else
      {
        v6 = 0;
        v5 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
      }
      begin = (char *)self->_cppPath.m_components.__begin_;
      end = (char *)self->_cppPath.m_components.__end_;
      if (end - begin == v5 - v6)
      {
        if (begin == end)
        {
          v7 = 1;
        }
        else
        {
          do
          {
            v10 = std::operator==[abi:ne180100]<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>((uint64_t)begin, v6);
            v7 = v10;
            begin += 32;
            v6 += 32;
            if (begin == end)
              v11 = 0;
            else
              v11 = v10;
          }
          while ((v11 & 1) != 0);
        }
      }
      else
      {
        v7 = 0;
      }
      v16 = (void **)&v13;
      std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](&v16);
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isNeuralNetworkLayerPath
{
  _DWORD *end;

  end = self->_cppPath.m_components.__end_;
  return end != self->_cppPath.m_components.__begin_ && *(end - 2) == 6;
}

- (BOOL)isMLProgramOperationPath
{
  _DWORD *end;

  end = self->_cppPath.m_components.__end_;
  return end != self->_cppPath.m_components.__begin_ && *(end - 2) == 4;
}

- (unint64_t)hash
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  char v12;

  -[MLModelStructurePath cppPath](self, "cppPath");
  v2 = v9;
  if (v9 != v10)
  {
    v3 = 0;
    while (1)
    {
      v4 = *(unsigned int *)(v2 + 24);
      if ((_DWORD)v4 == -1)
        break;
      v5 = ((uint64_t (*)(char *, uint64_t))off_1E3D64D10[v4])(&v12, v2);
      v6 = *(unsigned int *)(v2 + 24);
      if ((_DWORD)v6 == -1)
        goto LABEL_7;
LABEL_8:
      v7 = __ROR8__(v6 + 16, 16);
      v3 ^= (v3 << 6)
          + (v3 >> 2)
          + 2654435769u
          + ((0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v7 ^ ((0x9DDFEA08EB382D69 * (v5 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (v5 ^ v7)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v5 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (v5 ^ v7)))) >> 47))) ^ v6);
      v2 += 32;
      if (v2 == v10)
        goto LABEL_11;
    }
    v5 = 299792458;
LABEL_7:
    v6 = -1;
    goto LABEL_8;
  }
  v3 = 0;
LABEL_11:
  v11 = (void **)&v9;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](&v11);
  return v3;
}

- (NSArray)components
{
  void *v3;
  char *begin;
  char *i;
  uint64_t v6;
  void *v7;
  char v9;
  char *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", ((char *)self->_cppPath.m_components.__end_ - (char *)self->_cppPath.m_components.__begin_) >> 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  begin = (char *)self->_cppPath.m_components.__begin_;
  for (i = (char *)self->_cppPath.m_components.__end_; begin != i; begin += 32)
  {
    v6 = *((unsigned int *)begin + 6);
    if ((_DWORD)v6 == -1)
      std::__throw_bad_variant_access[abi:ne180100]();
    v10 = &v9;
    ((void (*)(char **, char *))off_1E3D64D58[v6])(&v10, begin);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  return (NSArray *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MLModelStructurePath *v4;
  MLModelStructurePath *v5;
  _QWORD v7[3];
  void **v8;

  v4 = +[MLModelStructurePath allocWithZone:](MLModelStructurePath, "allocWithZone:", a3);
  memset(v7, 0, sizeof(v7));
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)v7, (uint64_t)self->_cppPath.m_components.__begin_, (uint64_t)self->_cppPath.m_components.__end_, ((char *)self->_cppPath.m_components.__end_ - (char *)self->_cppPath.m_components.__begin_) >> 5);
  v5 = -[MLModelStructurePath initWithCppPath:](v4, "initWithCppPath:", v7);
  v8 = (void **)v7;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100](&v8);
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MLModelStructurePath components](self, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MLModelStructurePath: %p> %@"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (Path)cppPath
{
  retstr->m_components.__begin_ = 0;
  retstr->m_components.__end_ = 0;
  retstr->m_components.__end_cap_.__value_ = 0;
  return (Path *)std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__init_with_size[abi:ne180100]<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*,std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>*>((uint64_t)retstr, (uint64_t)self->_cppPath.m_components.__begin_, (uint64_t)self->_cppPath.m_components.__end_, ((char *)self->_cppPath.m_components.__end_ - (char *)self->_cppPath.m_components.__begin_) >> 5);
}

- (void).cxx_destruct
{
  Path *p_cppPath;

  p_cppPath = &self->_cppPath;
  std::vector<std::variant<CoreML::ModelStructure::Path::Root,CoreML::ModelStructure::Path::Program,CoreML::ModelStructure::Path::Program::Function,CoreML::ModelStructure::Path::Program::Block,CoreML::ModelStructure::Path::Program::Operation,CoreML::ModelStructure::Path::NeuralNetwork,CoreML::ModelStructure::Path::NeuralNetwork::Layer,CoreML::ModelStructure::Path::Pipeline,CoreML::ModelStructure::Path::Pipeline::SubModel>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_cppPath);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
