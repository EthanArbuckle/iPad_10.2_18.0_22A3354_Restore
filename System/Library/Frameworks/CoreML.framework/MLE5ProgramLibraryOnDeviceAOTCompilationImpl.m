@implementation MLE5ProgramLibraryOnDeviceAOTCompilationImpl

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (NSString)modelDisplayName
{
  void *v2;
  void *v3;

  -[MLE5ProgramLibraryOnDeviceAOTCompilationImpl configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (e5rt_program_library)createProgramLibraryHandleWithRespecialization:(BOOL)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v9;
  void *__p[2];
  _DWORD buf[3];
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  __p[0] = 0;
  v5 = e5rt_e5_compiler_create();
  if ((_DWORD)v5)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      buf[0] = 136315394;
      *(_QWORD *)&buf[1] = e5rt_get_last_error_message();
      v12 = 1024;
      v13 = v5;
      _os_log_error_impl(&dword_19C486000, v6, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", (uint8_t *)buf, 0x12u);
    }

    if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v7, CFSTR("Unable to create the model specializer. It can be a system level issues such as out-of-memory and file I/O errors "));
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v9 = 0;
  }
  else
  {
    v9 = __p[0];
  }
  std::unique_ptr<e5rt_e5_compiler,MLE5ObjectDeleter<e5rt_e5_compiler>>::reset[abi:ne180100]((uint64_t *)&v9);
  kdebug_trace();
  return 0;
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (MLE5ProgramLibraryOnDeviceAOTCompilationImpl)initWithMILTextAtURL:(id)a3 irProgram:(void *)a4 deallocator:(id)a5 container:(id)a6 configuration:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MLE5ProgramLibraryOnDeviceAOTCompilationImpl *v17;
  MLE5ProgramLibraryOnDeviceAOTCompilationImpl *v18;
  __shared_weak_count *v19;
  shared_ptr<MIL::IRProgram> v20;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v23;
  void *v24;
  id deallocator;
  objc_super v27;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MLE5ProgramLibraryOnDeviceAOTCompilationImpl;
  v17 = -[MLE5ProgramLibraryOnDeviceAOTCompilationImpl init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_milTextURL, a3);
    if (a4)
    {
      v19 = (__shared_weak_count *)operator new();
      *(_QWORD *)v19 = &off_1E3D5C528;
      *((_QWORD *)v19 + 1) = 0;
      *((_QWORD *)v19 + 2) = 0;
      *((_QWORD *)v19 + 3) = a4;
      v20.__ptr_ = (IRProgram *)a4;
      v20.__cntrl_ = v19;
      cntrl = (std::__shared_weak_count *)v18->_irProgram.__cntrl_;
      v18->_irProgram = v20;
      if (cntrl)
      {
        p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
        do
          v23 = __ldaxr(p_shared_owners);
        while (__stlxr(v23 - 1, p_shared_owners));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
          std::__shared_weak_count::__release_weak(cntrl);
        }
      }
      v24 = _Block_copy(v14);
      deallocator = v18->_deallocator;
      v18->_deallocator = v24;

    }
    objc_storeStrong((id *)&v18->_container, a6);
    objc_storeStrong((id *)&v18->_configuration, a7);
  }

  return v18;
}

- (MLE5ProgramLibraryOnDeviceAOTCompilationImpl)initWithMILTextAtURL:(id)a3 container:(id)a4 configuration:(id)a5
{
  return -[MLE5ProgramLibraryOnDeviceAOTCompilationImpl initWithMILTextAtURL:irProgram:deallocator:container:configuration:](self, "initWithMILTextAtURL:irProgram:deallocator:container:configuration:", a3, 0, 0, a4, a5);
}

- (MLE5ProgramLibraryOnDeviceAOTCompilationImpl)initWithIRProgram:(void *)a3 container:(id)a4 configuration:(id)a5 deallocator:(id)a6
{
  return -[MLE5ProgramLibraryOnDeviceAOTCompilationImpl initWithMILTextAtURL:irProgram:deallocator:container:configuration:](self, "initWithMILTextAtURL:irProgram:deallocator:container:configuration:", 0, a3, a6, a4, a5);
}

- (void)dealloc
{
  void (**deallocator)(id, IRProgram *);
  objc_super v4;

  deallocator = (void (**)(id, IRProgram *))self->_deallocator;
  if (deallocator)
    deallocator[2](deallocator, self->_irProgram.__ptr_);
  v4.receiver = self;
  v4.super_class = (Class)MLE5ProgramLibraryOnDeviceAOTCompilationImpl;
  -[MLE5ProgramLibraryOnDeviceAOTCompilationImpl dealloc](&v4, sel_dealloc);
}

- (MLProgramE5Container)container
{
  return self->_container;
}

- (NSString)serializedMILText
{
  return self->_serializedMILText;
}

- (void)setSerializedMILText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedMILText, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_deallocator, 0);
  std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100]((uint64_t)&self->_irProgram);
  objc_storeStrong((id *)&self->_milTextURL, 0);
}

- (void)initWithMILTextAtURL:(std::__shared_weak_count *)a1 irProgram:deallocator:container:configuration:
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A1AD6260);
}

- (uint64_t)initWithMILTextAtURL:(uint64_t)a1 irProgram:(uint64_t)a2 deallocator:container:configuration:
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z115-[MLE5ProgramLibraryOnDeviceAOTCompilationImpl initWithMILTextAtURL:irProgram:deallocator:container:configuration:]E3$_0"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

@end
