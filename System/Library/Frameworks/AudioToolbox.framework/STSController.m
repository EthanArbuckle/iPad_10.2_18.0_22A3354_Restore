@implementation STSController

- (STSController)initWithSTSObject:(OpaqueFigSTS *)a3 error:(id *)a4
{
  void *v7;
  uint64_t (*v8)(OpaqueFigSTS *);
  uint64_t (*v9)(OpaqueFigSTS *, const __CFString *, xpc_object_t *);
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  STSController *v14;
  uint64_t v16;
  void *v17;
  void *v18;
  size_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  STSController *v28;
  STSController *v29;
  int v30;
  unint64_t v31;
  void *v32;
  void *v33;
  objc_super v34;
  xpc_object_t xdict;
  void *region[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    if (!a3)
      goto LABEL_18;
LABEL_5:
    xdict = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v8 = (uint64_t (*)(OpaqueFigSTS *))getCMBaseObjectGetVTableSymbolLoc(void)::ptr;
    v40 = getCMBaseObjectGetVTableSymbolLoc(void)::ptr;
    if (!getCMBaseObjectGetVTableSymbolLoc(void)::ptr)
    {
      region[0] = (void *)MEMORY[0x1E0C809B0];
      region[1] = (void *)3221225472;
      region[2] = ___ZL33getCMBaseObjectGetVTableSymbolLocv_block_invoke;
      region[3] = &unk_1E4519C48;
      region[4] = &v37;
      ___ZL33getCMBaseObjectGetVTableSymbolLocv_block_invoke(region);
      v8 = (uint64_t (*)(OpaqueFigSTS *))v38[3];
    }
    _Block_object_dispose(&v37, 8);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "const CMBaseVTable *softLink_CMBaseObjectGetVTable(CMBaseObjectRef)");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("STSController.mm"), 27, CFSTR("%s"), dlerror());

      __break(1u);
    }
    v9 = *(uint64_t (**)(OpaqueFigSTS *, const __CFString *, xpc_object_t *))(*(_QWORD *)(v8(a3) + 16) + 40);
    if (!v9)
    {
      v10 = 4294954514;
      if (a4)
        goto LABEL_16;
      goto LABEL_20;
    }
    v10 = v9(a3, CFSTR("SharedStorage"), &xdict);
    if ((_DWORD)v10)
      v11 = 1;
    else
      v11 = xdict == 0;
    if (v11)
    {
LABEL_15:
      if (a4)
      {
LABEL_16:
        v49 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: Failed to copy STS shared memory configuration: %d"), v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.STS-N"), 1396924774, v13);
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

LABEL_21:
        goto LABEL_22;
      }
LABEL_20:
      v14 = 0;
      goto LABEL_21;
    }
    if (MEMORY[0x1A1B08AB8](xdict) != MEMORY[0x1E0C812F8])
    {
      v10 = 0;
      goto LABEL_15;
    }
    xpc_dictionary_get_value(xdict, "sharedstorage");
    v16 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v16;
    if (!v16 || MEMORY[0x1A1B08AB8](v16) != MEMORY[0x1E0C81388])
    {
      if (a4)
      {
        v47 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: Failed to copy STS shared memory from configuration"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.STS-N"), 1396924774, v18);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_27;
    }
    region[0] = 0;
    v19 = xpc_shmem_map(v13, region);
    v20 = region[0];
    if (region[0])
    {
      if (v19 >> 4 <= 0xE96)
      {
        if (a4)
        {
          v43 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: STS shared memory region of size %lu isn't large enough (requires %lu)"), v19, 59760);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.STS-N"), 1396924774, v22);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          v20 = region[0];
        }
        munmap(v20, v19);
        goto LABEL_27;
      }
      xpc_dictionary_get_value(xdict, "controlsemaphore");
      v25 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v25;
      if (v25 && MEMORY[0x1A1B08AB8](v25) == MEMORY[0x1E0C81338])
      {
        xpc_mach_send_copy_right();
        v34.receiver = self;
        v34.super_class = (Class)STSController;
        v28 = -[STSController init](&v34, sel_init);
        v29 = v28;
        if (v28)
        {
          v28->_shmemSize = v19;
          v28->_sts = (OpaqueFigSTS *)CFRetain(a3);
          v29->_sharedStorage = region[0];
          caulk::mach::semaphore::semaphore((caulk::mach::semaphore *)&v37);
          caulk::mach::semaphore::operator=();
          MEMORY[0x1A1B07444](&v37);
          v29->_allowAutomaticHeadTracking = xpc_dictionary_get_BOOL(xdict, "allowautomaticheadtracking");
          v30 = +[STSController maxNumberOfPerLabelStates](STSController, "maxNumberOfPerLabelStates");
          if (v30 >= 1)
          {
            v31 = v30 + 1;
            do
            {
              v37 = (v31 - 2);
              std::deque<unsigned long>::push_back(&v29->_availableIndicesWithinSharedStorage.c.__map_.__first_, &v37);
              --v31;
            }
            while (v31 > 1);
          }
        }
        else
        {
          munmap(region[0], v19);
        }
        self = v29;
        v14 = self;
      }
      else
      {
        if (a4)
        {
          v41 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: Failed to copy STS control semaphore from configuration"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.STS-N"), 1396924774, v27);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        munmap(region[0], v19);
        v14 = 0;
      }
    }
    else
    {
      if (!a4)
      {
LABEL_27:
        v14 = 0;
        goto LABEL_17;
      }
      v45 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: Failed to map STS shared memory w/ size %lu: %d"), v19, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.STS-N"), 1396924774, v24);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_17;
  }
  *a4 = 0;
  if (a3)
    goto LABEL_5;
  v51 = *MEMORY[0x1E0CB2D50];
  v52[0] = CFSTR("Error: NULL FigSTSRef");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.STS-N"), 1396926817, v7);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
  v14 = 0;
LABEL_22:

  return v14;
}

- (void)dealloc
{
  OpaqueFigSTS *sts;
  void *sharedStorage;
  objc_super v5;

  -[STSController cleanupAllLabels](self, "cleanupAllLabels");
  sts = self->_sts;
  if (sts)
    CFRelease(sts);
  sharedStorage = self->_sharedStorage;
  if (sharedStorage)
    munmap(sharedStorage, self->_shmemSize);
  v5.receiver = self;
  v5.super_class = (Class)STSController;
  -[STSController dealloc](&v5, sel_dealloc);
}

- (BOOL)signalChangeWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = caulk::mach::semaphore::signal_or_error((caulk::mach::semaphore *)&self->_controlSemaphore) & 0xFF00000000;
  if (a3 && !v4)
  {
    v8 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: failed to signal change"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.STS-N"), 1396929899, v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4 != 0;
}

- (BOOL)updateLabel:(__CFString *)a3 state:(STSPerLabelState *)a4 didChange:(BOOL *)a5 error:(id *)a6
{
  _BOOL4 v9;
  _BOOL4 v10;
  BOOL v12;

  if (a6)
    *a6 = 0;
  v12 = 0;
  v9 = -[STSController updateLabel:state:didChange:additionalInfo:error:](self, "updateLabel:state:didChange:additionalInfo:error:", a3, a4, &v12, 0, a6);
  LOBYTE(v10) = 0;
  if (v9)
  {
    if (v12)
    {
      v10 = -[STSController signalChangeWithError:](self, "signalChangeWithError:", a6);
      if (!a5)
        return v10;
    }
    else
    {
      v10 = 1;
      if (!a5)
        return v10;
    }
    if (v10)
    {
      *a5 = v12;
      LOBYTE(v10) = 1;
    }
  }
  return v10;
}

- (BOOL)updateGlobalState:(STSGlobalState *)a3 didChange:(BOOL *)a4 error:(id *)a5
{
  _BOOL4 v8;
  _BOOL4 v9;
  BOOL v11;

  if (a5)
    *a5 = 0;
  v11 = 0;
  v8 = -[STSController _updateGlobalState:didChange:error:](self, "_updateGlobalState:didChange:error:", a3, &v11, a5);
  LOBYTE(v9) = 0;
  if (v8)
  {
    if (v11 || self->_allowAutomaticHeadTracking)
    {
      v9 = -[STSController signalChangeWithError:](self, "signalChangeWithError:", a5);
      if (!a4)
        return v9;
    }
    else
    {
      v9 = 1;
      if (!a4)
        return v9;
    }
    if (v9)
    {
      *a4 = v11;
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

- (void)cleanupLabel:(__CFString *)a3
{
  __CFString *v4;
  unordered_map<std::string, STSPerLabelControllerState, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, STSPerLabelControllerState>>> *p_perLabelState;
  unsigned __int8 *v6;
  void **v7;
  unsigned int *v8;
  unint64_t v9;
  unint64_t m_activeLabels;
  unint64_t **end;
  unint64_t **begin;
  uint64_t v13;
  unint64_t v14;
  unint64_t value;
  unint64_t v16;
  uint8x8_t v17;
  STSController *isa;
  STSController *v19;
  unint64_t sts;
  unint64_t v21;
  objc_class *v22;
  unint64_t v23;
  BOOL v24;
  id v25;
  id v26;
  void *__p[2];
  char v28;
  uint8_t buf[4];
  __CFString *v30;
  __int16 v31;
  id v32;
  uint64_t __src[34];
  char v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)-[__CFString UTF8String](v4, "UTF8String"));
  p_perLabelState = &self->_perLabelState;
  v6 = std::__hash_table<std::__hash_value_type<std::string,STSPerLabelControllerState>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,STSPerLabelControllerState>>>::find<std::string>(&self->_perLabelState.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p);
  if (v6)
  {
    v7 = (void **)v6;
    v8 = (unsigned int *)((char *)self->_sharedStorage + 928 * *((_QWORD *)v6 + 6) + 368);
    __src[0] = 0;
    v34 = 0;
    caulk::concurrent::multi_buffer<STSPerLabelStorage,3>::write(v8, __src);
    v9 = (unint64_t)v7[6];
    m_activeLabels = self->_activeIndices.m_activeLabels;
    if (v9 <= 0x3F)
    {
      m_activeLabels &= ~(1 << v9);
      self->_activeIndices.m_activeLabels = m_activeLabels;
    }
    atomic_store(m_activeLabels, (unint64_t *)self->_sharedStorage + 44);
    end = self->_availableIndicesWithinSharedStorage.c.__map_.__end_;
    begin = self->_availableIndicesWithinSharedStorage.c.__map_.__begin_;
    v13 = (((char *)end - (char *)begin) << 6) - 1;
    if (end == begin)
      v13 = 0;
    v14 = self->_availableIndicesWithinSharedStorage.c.__size_.__value_
        + self->_availableIndicesWithinSharedStorage.c.__start_;
    if (v13 == v14)
    {
      std::deque<unsigned long>::__add_back_capacity(&self->_availableIndicesWithinSharedStorage.c.__map_.__first_);
      begin = self->_availableIndicesWithinSharedStorage.c.__map_.__begin_;
      v14 = self->_availableIndicesWithinSharedStorage.c.__size_.__value_
          + self->_availableIndicesWithinSharedStorage.c.__start_;
    }
    (*(unint64_t **)((char *)begin + ((v14 >> 6) & 0x3FFFFFFFFFFFFF8)))[v14 & 0x1FF] = (unint64_t)v7[6];
    ++self->_availableIndicesWithinSharedStorage.c.__size_.__value_;
    value = self->_perLabelState.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    v16 = (unint64_t)v7[1];
    v17 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] > 1uLL)
    {
      if (v16 >= value)
        v16 %= value;
    }
    else
    {
      v16 &= value - 1;
    }
    isa = (STSController *)p_perLabelState->__table_.__bucket_list_.__ptr_.__value_[v16];
    do
    {
      v19 = isa;
      isa = (STSController *)isa->super.isa;
    }
    while (isa != (STSController *)v7);
    if (v19 == (STSController *)&self->_perLabelState.__table_.__p1_)
      goto LABEL_25;
    sts = (unint64_t)v19->_sts;
    if (v17.u32[0] > 1uLL)
    {
      if (sts >= value)
        sts %= value;
    }
    else
    {
      sts &= value - 1;
    }
    if (sts != v16)
    {
LABEL_25:
      if (!*v7)
        goto LABEL_26;
      v21 = *((_QWORD *)*v7 + 1);
      if (v17.u32[0] > 1uLL)
      {
        if (v21 >= value)
          v21 %= value;
      }
      else
      {
        v21 &= value - 1;
      }
      if (v21 != v16)
LABEL_26:
        p_perLabelState->__table_.__bucket_list_.__ptr_.__value_[v16] = 0;
    }
    v22 = (objc_class *)*v7;
    if (*v7)
    {
      v23 = *((_QWORD *)v22 + 1);
      if (v17.u32[0] > 1uLL)
      {
        if (v23 >= value)
          v23 %= value;
      }
      else
      {
        v23 &= value - 1;
      }
      if (v23 != v16)
      {
        p_perLabelState->__table_.__bucket_list_.__ptr_.__value_[v23] = v19;
        v22 = (objc_class *)*v7;
      }
    }
    v19->super.isa = v22;
    *v7 = 0;
    --self->_perLabelState.__table_.__p2_.__value_;
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,STSPerLabelControllerState>,void *>>>::operator()[abi:ne180100](1, v7);
    v26 = 0;
    v24 = -[STSController signalChangeWithError:](self, "signalChangeWithError:", &v26);
    v25 = v26;
    if (!v24 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v4;
      v31 = 2112;
      v32 = v25;
      _os_log_error_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to signal cleanup of label %@: %@", buf, 0x16u);
    }

  }
  if (v28 < 0)
    operator delete(__p[0]);
}

- (void)cleanupAllLabels
{
  unint64_t v2;
  char *i;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *j;
  unint64_t v12;
  char *v13;
  std::string *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  uint64_t *v29;
  const __CFAllocator *v30;
  const char *v31;
  CFStringRef v32;
  __int128 v33;
  __int128 v34;
  float value;

  v33 = 0u;
  v34 = 0u;
  value = self->_perLabelState.__table_.__p3_.__value_;
  std::__hash_table<std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>>>::__rehash<true>((uint64_t)&v33, self->_perLabelState.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_);
  for (i = (char *)self->_perLabelState.__table_.__p1_.__value_.__next_; i; i = *(char **)i)
  {
    v5 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(i + 16));
    v6 = v5;
    v7 = *((_QWORD *)&v33 + 1);
    if (*((_QWORD *)&v33 + 1))
    {
      v8 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v33 + 8));
      v8.i16[0] = vaddlv_u8(v8);
      v9 = v8.u32[0];
      if (v8.u32[0] > 1uLL)
      {
        v2 = v5;
        if (v5 >= *((_QWORD *)&v33 + 1))
          v2 = v5 % *((_QWORD *)&v33 + 1);
      }
      else
      {
        v2 = (*((_QWORD *)&v33 + 1) - 1) & v5;
      }
      v10 = *(unsigned __int8 ***)(v33 + 8 * v2);
      if (v10)
      {
        for (j = *v10; j; j = *(unsigned __int8 **)j)
        {
          v12 = *((_QWORD *)j + 1);
          if (v12 == v6)
          {
            if (std::equal_to<std::string>::operator()[abi:ne180100](j + 16, (unsigned __int8 *)i + 16))
              goto LABEL_43;
          }
          else
          {
            if (v9 > 1)
            {
              if (v12 >= v7)
                v12 %= v7;
            }
            else
            {
              v12 &= v7 - 1;
            }
            if (v12 != v2)
              break;
          }
        }
      }
    }
    v13 = (char *)operator new(0xA0uLL);
    *(_QWORD *)v13 = 0;
    *((_QWORD *)v13 + 1) = v6;
    v14 = (std::string *)(v13 + 16);
    if (i[39] < 0)
    {
      std::string::__init_copy_ctor_external(v14, *((const std::string::value_type **)i + 2), *((_QWORD *)i + 3));
    }
    else
    {
      v15 = *((_OWORD *)i + 1);
      *((_QWORD *)v13 + 4) = *((_QWORD *)i + 4);
      *(_OWORD *)&v14->__r_.__value_.__l.__data_ = v15;
    }
    v16 = *((_OWORD *)i + 3);
    v17 = *((_OWORD *)i + 5);
    *((_OWORD *)v13 + 4) = *((_OWORD *)i + 4);
    *((_OWORD *)v13 + 5) = v17;
    *((_OWORD *)v13 + 3) = v16;
    v18 = *((_OWORD *)i + 6);
    v19 = *((_OWORD *)i + 7);
    v20 = *((_OWORD *)i + 9);
    *((_OWORD *)v13 + 8) = *((_OWORD *)i + 8);
    *((_OWORD *)v13 + 9) = v20;
    *((_OWORD *)v13 + 6) = v18;
    *((_OWORD *)v13 + 7) = v19;
    v21 = (float)(unint64_t)(*((_QWORD *)&v34 + 1) + 1);
    if (!v7 || (float)(value * (float)v7) < v21)
    {
      v22 = (v7 & (v7 - 1)) != 0;
      if (v7 < 3)
        v22 = 1;
      v23 = v22 | (2 * v7);
      v24 = vcvtps_u32_f32(v21 / value);
      if (v23 <= v24)
        v25 = v24;
      else
        v25 = v23;
      std::__hash_table<std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>>>::__rehash<true>((uint64_t)&v33, v25);
      v7 = *((_QWORD *)&v33 + 1);
      if ((*((_QWORD *)&v33 + 1) & (*((_QWORD *)&v33 + 1) - 1)) != 0)
      {
        if (v6 >= *((_QWORD *)&v33 + 1))
          v2 = v6 % *((_QWORD *)&v33 + 1);
        else
          v2 = v6;
      }
      else
      {
        v2 = (*((_QWORD *)&v33 + 1) - 1) & v6;
      }
    }
    v26 = v33;
    v27 = *(_QWORD **)(v33 + 8 * v2);
    if (v27)
    {
      *(_QWORD *)v13 = *v27;
    }
    else
    {
      *(_QWORD *)v13 = v34;
      *(_QWORD *)&v34 = v13;
      *(_QWORD *)(v26 + 8 * v2) = &v34;
      if (!*(_QWORD *)v13)
        goto LABEL_42;
      v28 = *(_QWORD *)(*(_QWORD *)v13 + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v28 >= v7)
          v28 %= v7;
      }
      else
      {
        v28 &= v7 - 1;
      }
      v27 = (_QWORD *)(v33 + 8 * v28);
    }
    *v27 = v13;
LABEL_42:
    ++*((_QWORD *)&v34 + 1);
LABEL_43:
    ;
  }
  v29 = (uint64_t *)v34;
  if ((_QWORD)v34)
  {
    v30 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      v31 = (const char *)(v29 + 2);
      if (*((char *)v29 + 39) < 0)
        v31 = *(const char **)v31;
      v32 = CFStringCreateWithCString(v30, v31, 0x8000100u);
      -[STSController cleanupLabel:](self, "cleanupLabel:", v32);
      CFRelease(v32);
      v29 = (uint64_t *)*v29;
    }
    while (v29);
  }
  std::__hash_table<std::__hash_value_type<std::string,STSPerLabelControllerState>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,STSPerLabelControllerState>>>::~__hash_table((uint64_t)&v33);
}

- (BOOL)updateGlobalState:(const STSGlobalState *)a3 labelStates:(const void *)a4 error:(id *)a5
{
  return -[STSController updateGlobalState:labelStates:additionalLabelInfo:error:](self, "updateGlobalState:labelStates:additionalLabelInfo:error:", a3, a4, 0, a5);
}

- (BOOL)updateGlobalState:(const STSGlobalState *)a3 labelStates:(const void *)a4 additionalLabelInfo:(id)a5 error:(id *)a6
{
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;
  void *v14;
  BOOL v15;
  char v17;

  v10 = a5;
  if (a6)
    *a6 = 0;
  v11 = (char *)a4 + 16;
  v12 = (char *)a4 + 16;
  while (1)
  {
    v12 = (_QWORD *)*v12;
    if (!v12)
      break;
    if (-[STSController ensureResourcesAllocatedForLabel:error:](self, "ensureResourcesAllocatedForLabel:error:", v12[2], a6) == 0)
    {
      v13 = 0;
      goto LABEL_15;
    }
  }
  v17 = 0;
  if (a3
    && !-[STSController _updateGlobalState:didChange:error:](self, "_updateGlobalState:didChange:error:", a3, &v17, a6))
  {
LABEL_11:
    v13 = 0;
  }
  else
  {
    while (1)
    {
      v11 = (_QWORD *)*v11;
      v13 = v11 == 0;
      if (!v11)
        break;
      objc_msgSend(v10, "objectForKey:", v11[2]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[STSController updateLabel:state:didChange:additionalInfo:error:](self, "updateLabel:state:didChange:additionalInfo:error:", v11[2], v11 + 4, &v17, v14, a6);

      if (!v15)
        goto LABEL_11;
    }
  }
  if (v17 || self->_allowAutomaticHeadTracking)
    v13 = -[STSController signalChangeWithError:](self, "signalChangeWithError:", a6);
LABEL_15:

  return v13;
}

- (__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::string,)ensureResourcesAllocatedForLabel:(__CFString *)a3 error:(id *)a4
{
  unint64_t v4;
  __CFString *v7;
  std::string::size_type v8;
  std::string::size_type size;
  unint64_t v10;
  std::string::size_type v11;
  void *v12;
  void *v13;
  char *v14;
  unordered_map<std::string, STSPerLabelControllerState, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, STSPerLabelControllerState>>> *p_perLabelState;
  unint64_t value;
  unint64_t **end;
  unint64_t **begin;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t m_activeLabels;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint8x8_t v30;
  unint64_t v31;
  void **v32;
  unint64_t v33;
  std::string *v34;
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  float v39;
  float v40;
  _BOOL8 v41;
  unint64_t v42;
  unint64_t v43;
  size_t v44;
  void **v45;
  void **v46;
  unint64_t v47;
  std::string __p;
  std::string v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[15];
  uint64_t v58;
  void *v59;
  uint64_t v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[__CFString UTF8String](v7, "UTF8String"));
  v8 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  size = __p.__r_.__value_.__l.__size_;
  v10 = +[STSController maxLabelLength](STSController, "maxLabelLength");
  if ((v8 & 0x80u) == 0)
    v11 = v8;
  else
    v11 = size;
  if (v11 > v10)
  {
    if (a4)
    {
      v60 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: label \"%@\" is too long - please keep under %u characters"), v7, 180);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.STS-N"), 1396924774, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_7:
    v14 = 0;
    goto LABEL_9;
  }
  p_perLabelState = &self->_perLabelState;
  v14 = (char *)std::__hash_table<std::__hash_value_type<std::string,STSPerLabelControllerState>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,STSPerLabelControllerState>>>::find<std::string>(&self->_perLabelState.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)&__p);
  if (v14)
    goto LABEL_9;
  value = self->_availableIndicesWithinSharedStorage.c.__size_.__value_;
  if (!value)
  {
    if (a4)
    {
      v58 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: no resources available for new label %@"), v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.STS-N"), 1396924774, v26);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_7;
  }
  begin = self->_availableIndicesWithinSharedStorage.c.__map_.__begin_;
  end = self->_availableIndicesWithinSharedStorage.c.__map_.__end_;
  v20 = (((char *)end - (char *)begin) << 6) - 1;
  if (end == begin)
    v20 = 0;
  v21 = value - 1;
  v22 = self->_availableIndicesWithinSharedStorage.c.__start_ + v21;
  v23 = (*(unint64_t **)((char *)begin + ((v22 >> 6) & 0x3FFFFFFFFFFFFF8)))[v22 & 0x1FF];
  self->_availableIndicesWithinSharedStorage.c.__size_.__value_ = v21;
  if (v20 - v22 >= 0x400)
  {
    operator delete(*(end - 1));
    --self->_availableIndicesWithinSharedStorage.c.__map_.__end_;
  }
  m_activeLabels = self->_activeIndices.m_activeLabels;
  if (v23 <= 0x3F)
  {
    m_activeLabels |= 1 << v23;
    self->_activeIndices.m_activeLabels = m_activeLabels;
  }
  atomic_store(m_activeLabels, (unint64_t *)self->_sharedStorage + 44);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v49, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v49 = __p;
  v50 = v23;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v51 = 0u;
  v52 = 0u;
  LOBYTE(v56) = 0;
  *(_QWORD *)((char *)&v56 + 1) = *(_QWORD *)v57;
  *((_QWORD *)&v56 + 1) = *(_QWORD *)&v57[7];
  v27 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v49);
  v28 = v27;
  v29 = self->_perLabelState.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!v29)
    goto LABEL_41;
  v30 = (uint8x8_t)vcnt_s8((int8x8_t)v29);
  v30.i16[0] = vaddlv_u8(v30);
  v31 = v30.u32[0];
  if (v30.u32[0] > 1uLL)
  {
    v4 = v27;
    if (v27 >= v29)
      v4 = v27 % v29;
  }
  else
  {
    v4 = (v29 - 1) & v27;
  }
  v32 = (void **)p_perLabelState->__table_.__bucket_list_.__ptr_.__value_[v4];
  if (!v32 || (v14 = (char *)*v32) == 0)
  {
LABEL_41:
    v14 = (char *)operator new(0xA0uLL);
    *(_QWORD *)v14 = 0;
    *((_QWORD *)v14 + 1) = v28;
    v34 = (std::string *)(v14 + 16);
    v35 = HIBYTE(v49.__r_.__value_.__r.__words[2]);
    if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v34, v49.__r_.__value_.__l.__data_, v49.__r_.__value_.__l.__size_);
    }
    else
    {
      *(_OWORD *)&v34->__r_.__value_.__l.__data_ = *(_OWORD *)&v49.__r_.__value_.__l.__data_;
      *((_QWORD *)v14 + 4) = *((_QWORD *)&v49.__r_.__value_.__l + 2);
    }
    v36 = v55;
    *((_OWORD *)v14 + 7) = v54;
    *((_OWORD *)v14 + 8) = v36;
    *((_OWORD *)v14 + 9) = v56;
    v37 = v51;
    *((_OWORD *)v14 + 3) = v50;
    *((_OWORD *)v14 + 4) = v37;
    v38 = v53;
    *((_OWORD *)v14 + 5) = v52;
    *((_OWORD *)v14 + 6) = v38;
    v39 = (float)(self->_perLabelState.__table_.__p2_.__value_ + 1);
    v40 = self->_perLabelState.__table_.__p3_.__value_;
    if (!v29 || (float)(v40 * (float)v29) < v39)
    {
      v41 = 1;
      if (v29 >= 3)
        v41 = (v29 & (v29 - 1)) != 0;
      v42 = v41 | (2 * v29);
      v43 = vcvtps_u32_f32(v39 / v40);
      if (v42 <= v43)
        v44 = v43;
      else
        v44 = v42;
      std::__hash_table<std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::shared_ptr<PowerUsageWatchdog::ClientDescription>>>>::__rehash<true>((uint64_t)&self->_perLabelState, v44);
      v29 = self->_perLabelState.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if ((v29 & (v29 - 1)) != 0)
      {
        if (v28 >= v29)
          v4 = v28 % v29;
        else
          v4 = v28;
      }
      else
      {
        v4 = (v29 - 1) & v28;
      }
    }
    v45 = p_perLabelState->__table_.__bucket_list_.__ptr_.__value_;
    v46 = (void **)p_perLabelState->__table_.__bucket_list_.__ptr_.__value_[v4];
    if (v46)
    {
      *(_QWORD *)v14 = *v46;
    }
    else
    {
      *(_QWORD *)v14 = self->_perLabelState.__table_.__p1_.__value_.__next_;
      self->_perLabelState.__table_.__p1_.__value_.__next_ = v14;
      v45[v4] = &self->_perLabelState.__table_.__p1_;
      if (!*(_QWORD *)v14)
        goto LABEL_65;
      v47 = *(_QWORD *)(*(_QWORD *)v14 + 8);
      if ((v29 & (v29 - 1)) != 0)
      {
        if (v47 >= v29)
          v47 %= v29;
      }
      else
      {
        v47 &= v29 - 1;
      }
      v46 = &p_perLabelState->__table_.__bucket_list_.__ptr_.__value_[v47];
    }
    *v46 = v14;
LABEL_65:
    ++self->_perLabelState.__table_.__p2_.__value_;
    if (v35 < 0)
      goto LABEL_66;
    goto LABEL_9;
  }
  while (1)
  {
    v33 = *((_QWORD *)v14 + 1);
    if (v33 == v28)
      break;
    if (v31 > 1)
    {
      if (v33 >= v29)
        v33 %= v29;
    }
    else
    {
      v33 &= v29 - 1;
    }
    if (v33 != v4)
      goto LABEL_41;
LABEL_40:
    v14 = *(char **)v14;
    if (!v14)
      goto LABEL_41;
  }
  if (!std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v14 + 16, (unsigned __int8 *)&v49))
    goto LABEL_40;
  if ((*((_BYTE *)&v49.__r_.__value_.__s + 23) & 0x80) != 0)
LABEL_66:
    operator delete(v49.__r_.__value_.__l.__data_);
LABEL_9:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return (__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::string, STSPerLabelControllerState>, void *> *>>)v14;
}

- (BOOL)updateLabel:(__CFString *)a3 state:(const STSPerLabelState *)a4 didChange:(BOOL *)a5 additionalInfo:(id)a6 error:(id *)a7
{
  id v12;
  __hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::string, STSPerLabelControllerState>, void *> *>> v13;
  void *v14;
  int v15;
  BOOL v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  unsigned int *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE __dst[288];
  _OWORD __src[18];
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13.var0.var0 = (void *)-[STSController ensureResourcesAllocatedForLabel:error:](self, "ensureResourcesAllocatedForLabel:error:", a3, a7);
  if (v13.var0.var0)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("STSAdditionalLabelInfoKey_DeferToSystemTuning"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "isEqualToNumber:", &unk_1E4526C80) ^ 1;
    }
    else
    {
      if (v14)
      {
        if (a7)
        {
          v31 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: Incorrect type provided for STSAdditionalLabelInfoKey_DeferToSystemTuning - expecting NSNumber, got %@"), v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v32[0] = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.STS-N"), 1396926817, v18);
          *a7 = (id)objc_claimAutoreleasedReturnValue();

        }
        v16 = 0;
        goto LABEL_18;
      }
      v15 = 0;
    }
    if (memcmp((char *)v13.var0.var0 + 64, a4, 0x50uLL) || *((unsigned __int8 *)v13.var0.var0 + 144) != v15)
    {
      v19 = (char *)v13.var0.var0 + 16;
      *a5 = 1;
      v20 = *((_QWORD *)v13.var0.var0 + 7) + 1;
      do
      {
        v21 = v20;
        v20 = 1;
      }
      while (!v21);
      *((_QWORD *)v13.var0.var0 + 7) = v21;
      if (*((char *)v13.var0.var0 + 39) < 0)
        v19 = *(const char **)v19;
      strcpy((char *)__src + 8, v19);
      *(_QWORD *)&__src[0] = v21;
      v22 = *(_OWORD *)&a4[4].var1;
      __src[14] = *(_OWORD *)&a4[2].var3;
      __src[15] = v22;
      __src[16] = *(_OWORD *)&a4[5].var2;
      v23 = *(_OWORD *)&a4[1].var2;
      __src[12] = *(_OWORD *)&a4->var1;
      __src[13] = v23;
      LOBYTE(__src[17]) = v15;
      v24 = (unsigned int *)((char *)self->_sharedStorage + 928 * *((_QWORD *)v13.var0.var0 + 6) + 368);
      memcpy(__dst, __src, sizeof(__dst));
      caulk::concurrent::multi_buffer<STSPerLabelStorage,3>::write(v24, __dst);
      *((_OWORD *)v13.var0.var0 + 4) = *(_OWORD *)&a4->var1;
      v25 = *(_OWORD *)&a4[1].var2;
      v26 = *(_OWORD *)&a4[2].var3;
      v27 = *(_OWORD *)&a4[5].var2;
      *((_OWORD *)v13.var0.var0 + 7) = *(_OWORD *)&a4[4].var1;
      *((_OWORD *)v13.var0.var0 + 8) = v27;
      *((_OWORD *)v13.var0.var0 + 5) = v25;
      *((_OWORD *)v13.var0.var0 + 6) = v26;
      *((_BYTE *)v13.var0.var0 + 144) = v15;
    }
    v16 = 1;
LABEL_18:

    goto LABEL_19;
  }
  v16 = 0;
LABEL_19:

  return v16;
}

- (BOOL)_updateGlobalState:(const STSGlobalState *)a3 didChange:(BOOL *)a4 error:(id *)a5
{
  STSGlobalState *p_globalState;
  unint64_t v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  unsigned int *sharedStorage;
  unsigned int v14;
  unsigned int i;
  unsigned int *v17;
  unsigned int *v18;
  __int128 v19;
  __int128 v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _BYTE v36[88];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  p_globalState = &self->_globalState;
  if (memcmp(&self->_globalState, a3, 0x50uLL))
  {
    *a4 = 1;
    v9 = self->_globalGeneration + 1;
    do
    {
      v10 = v9;
      v9 = 1;
    }
    while (!v10);
    self->_globalGeneration = v10;
    v11 = *(_OWORD *)&a3[2].hostTime;
    *(_OWORD *)&v36[8] = *(_OWORD *)&a3->hostTime;
    *(_OWORD *)&v36[24] = v11;
    v12 = *(_OWORD *)&a3[6].hostTime;
    *(_OWORD *)&v36[40] = *(_OWORD *)&a3[4].hostTime;
    *(_OWORD *)&v36[56] = v12;
    *(_OWORD *)&v36[72] = *(_OWORD *)&a3[8].hostTime;
    sharedStorage = (unsigned int *)self->_sharedStorage;
    v30 = *(_OWORD *)v36;
    v31 = *(_OWORD *)&v36[16];
    v35 = *(_QWORD *)&v36[80];
    v33 = *(_OWORD *)&v36[48];
    v34 = *(_OWORD *)&v36[64];
    v32 = *(_OWORD *)&v36[32];
    v29 = 0;
    if (sharedStorage[1] == 3)
      v14 = 0;
    else
      v14 = sharedStorage[1];
    for (i = atomic_load(sharedStorage); v14 == (unsigned __int16)i || v14 == HIWORD(i); i = atomic_load(sharedStorage))
    {
      caulk::concurrent::details::spinloop::spin((uint64_t)&v29);
      if (v14 == 2)
        v14 = 0;
      else
        ++v14;
    }
    v17 = &sharedStorage[28 * v14];
    *((_QWORD *)v17 + 2) = v10;
    v18 = v17 + 4;
    v19 = v33;
    *(_OWORD *)(v18 + 10) = v32;
    *(_OWORD *)(v18 + 14) = v19;
    *(_OWORD *)(v18 + 18) = v34;
    v20 = v31;
    *(_OWORD *)(v18 + 2) = v30;
    v21 = *((unsigned __int8 *)v18 + 96);
    *((_QWORD *)v18 + 11) = v35;
    *(_OWORD *)(v18 + 6) = v20;
    if (!v21)
      *((_BYTE *)v18 + 96) = 1;
    while (1)
    {
      v22 = __ldaxr(sharedStorage);
      if (v22 != i)
        break;
      if (!__stlxr((v14 << 16) | (unsigned __int16)i, sharedStorage))
      {
LABEL_27:
        sharedStorage[1] = v14 + 1;
        *(_OWORD *)&p_globalState->hostTime = *(_OWORD *)&a3->hostTime;
        v25 = *(_OWORD *)&a3[2].hostTime;
        v26 = *(_OWORD *)&a3[4].hostTime;
        v27 = *(_OWORD *)&a3[8].hostTime;
        *(_OWORD *)&p_globalState[6].hostTime = *(_OWORD *)&a3[6].hostTime;
        *(_OWORD *)&p_globalState[8].hostTime = v27;
        *(_OWORD *)&p_globalState[2].hostTime = v25;
        *(_OWORD *)&p_globalState[4].hostTime = v26;
        return 1;
      }
    }
    __clrex();
    while (1)
    {
      v23 = __ldaxr(sharedStorage);
      if (v23 != v22)
        break;
      if (!__stlxr((unsigned __int16)v22 | (v14 << 16), sharedStorage))
      {
        v24 = 1;
LABEL_26:
        v22 = v23;
        if (v24)
          goto LABEL_27;
      }
    }
    v24 = 0;
    __clrex();
    goto LABEL_26;
  }
  return 1;
}

- (void).cxx_destruct
{
  unint64_t **begin;
  unint64_t **end;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t **v9;
  unint64_t **v10;
  unint64_t **first;

  MEMORY[0x1A1B07444](&self->_controlSemaphore, a2);
  begin = self->_availableIndicesWithinSharedStorage.c.__map_.__begin_;
  end = self->_availableIndicesWithinSharedStorage.c.__map_.__end_;
  self->_availableIndicesWithinSharedStorage.c.__size_.__value_ = 0;
  v5 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
  {
    do
    {
      operator delete(*begin);
      end = self->_availableIndicesWithinSharedStorage.c.__map_.__end_;
      begin = self->_availableIndicesWithinSharedStorage.c.__map_.__begin_ + 1;
      self->_availableIndicesWithinSharedStorage.c.__map_.__begin_ = begin;
      v5 = (char *)end - (char *)begin;
    }
    while ((unint64_t)((char *)end - (char *)begin) > 0x10);
  }
  v6 = v5 >> 3;
  if (v6 == 1)
  {
    v7 = 256;
    goto LABEL_7;
  }
  if (v6 == 2)
  {
    v7 = 512;
LABEL_7:
    self->_availableIndicesWithinSharedStorage.c.__start_ = v7;
  }
  if (begin != end)
  {
    do
    {
      v8 = *begin++;
      operator delete(v8);
    }
    while (begin != end);
    v10 = self->_availableIndicesWithinSharedStorage.c.__map_.__begin_;
    v9 = self->_availableIndicesWithinSharedStorage.c.__map_.__end_;
    if (v9 != v10)
      self->_availableIndicesWithinSharedStorage.c.__map_.__end_ = (unint64_t **)((char *)v9
                                                                                       + (((char *)v10 - (char *)v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  }
  first = self->_availableIndicesWithinSharedStorage.c.__map_.__first_;
  if (first)
    operator delete(first);
  std::__hash_table<std::__hash_value_type<std::string,STSPerLabelControllerState>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,STSPerLabelControllerState>>>::~__hash_table((uint64_t)&self->_perLabelState);
}

- (id).cxx_construct
{
  self->_perLabelState.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_perLabelState.__table_.__p1_.__value_.__next_ = 0u;
  self->_perLabelState.__table_.__p3_.__value_ = 1.0;
  *(_OWORD *)&self->_availableIndicesWithinSharedStorage.c.__map_.__first_ = 0u;
  *(_OWORD *)&self->_availableIndicesWithinSharedStorage.c.__map_.__end_ = 0u;
  *(_OWORD *)&self->_availableIndicesWithinSharedStorage.c.__start_ = 0u;
  self->_activeIndices.m_activeLabels = 0;
  MEMORY[0x1A1B07438](&self->_controlSemaphore, a2);
  return self;
}

+ (int64_t)maxNumberOfPerLabelStates
{
  return 64;
}

+ (unint64_t)maxLabelLength
{
  return 179;
}

@end
