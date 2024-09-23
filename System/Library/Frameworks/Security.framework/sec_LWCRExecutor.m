@implementation sec_LWCRExecutor

- (BOOL)evaluateRequirements:(id)a3 withFacts:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  const char *v15;
  _QWORD **v16;
  BOOL v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD **v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (**v27)(TLE::AndOperation *__hidden);
  __int128 v28;
  BOOL v29;
  _QWORD *exception;
  _QWORD *v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[2];
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD aBlock[4];
  id v41;
  void (**v42)(TLE::CallbackEncyclopedia *__hidden);
  id v43;
  id v44;
  id v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  der_vm_context v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke;
  aBlock[3] = &unk_1E1FCE288;
  v41 = v6;
  v38[0] = v7;
  v38[1] = 3221225472;
  v38[2] = __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke_2;
  v38[3] = &unk_1E1FCE2B0;
  v39 = v41;
  v36[0] = v7;
  v36[1] = 3221225472;
  v36[2] = __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke_3;
  v36[3] = &unk_1E1FCE2D8;
  v8 = v39;
  v37 = v8;
  v42 = &off_1E1FC82B8;
  v9 = v36;
  v10 = v38;
  v43 = _Block_copy(aBlock);
  v11 = _Block_copy(v10);

  v44 = v11;
  v12 = _Block_copy(v9);

  v45 = v12;
  v35[0] = &v42;
  v35[1] = 0;
  *((_QWORD *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13 = *((_OWORD *)v5 + 4);
  *(_OWORD *)&v49.runtime = *((_OWORD *)v5 + 3);
  *(_OWORD *)&v49.lookup.index_count = v13;
  *(_OWORD *)&v49.sorted = *((_OWORD *)v5 + 5);
  v49.var0.ccstate.der_end = (char *)*((_QWORD *)v5 + 12);
  if ((der_vm_context_is_valid() & 1) == 0)
  {
    v17 = 0;
    v34 = 0x12uLL;
    goto LABEL_32;
  }
  v14 = *((_OWORD *)v5 + 4);
  *(_OWORD *)&v49.runtime = *((_OWORD *)v5 + 3);
  *(_OWORD *)&v49.lookup.index_count = v14;
  *(_OWORD *)&v49.sorted = *((_OWORD *)v5 + 5);
  v49.var0.ccstate.der_end = (char *)*((_QWORD *)v5 + 12);
  v52 = 0;
  v50 = 0u;
  v51 = 0u;
  v46 = 0;
  v47 = 0;
  v48 = 0;
  TLE::Executor::getDependentOpsFromDictionary((uint64_t)&v50, (uint64_t)v35, &v49);
  if ((_DWORD)v50)
  {
    LODWORD(v33) = v50;
    v16 = (_QWORD **)*((_QWORD *)&v51 + 1);
    v34 = (unint64_t)v51;
    if (!*((_QWORD *)&v51 + 1))
    {
LABEL_22:
      if ((_DWORD)v33)
      {
        v17 = 0;
        goto LABEL_32;
      }
      v26 = *((_QWORD *)&v34 + 1);
      v27 = (void (**)(TLE::AndOperation *__hidden))**((_QWORD **)&v34 + 1);
      goto LABEL_26;
    }
LABEL_14:
    if ((_DWORD)v52)
    {
      v21 = 8 * v52;
      v22 = v16;
      do
      {
        v23 = *v22;
        if (*v22)
        {
          v24 = v23[1];
          if (v24 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x1E0DE4E50], 0);
          }
          v25 = v24 - 1;
          v23[1] = v25;
          if (!v25)
            (*(void (**)(_QWORD *))(*v23 + 8))(v23);
        }
        *v22++ = 0;
        v21 -= 8;
      }
      while (v21);
    }
    free(v16);
    goto LABEL_22;
  }
  if ((_DWORD)v52 == 1)
  {
    v16 = (_QWORD **)*((_QWORD *)&v51 + 1);
    if (!*((_QWORD *)&v51 + 1))
      goto LABEL_36;
    v18 = 8 * v52;
    if (*((_QWORD *)&v51 + 1) + v18 < *((_QWORD *)&v51 + 1) || HIDWORD(v18))
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v15);
    if ((v18 & 0xFFFFFFF8) == 0)
LABEL_36:
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v15);
    v33 = 0uLL;
    v19 = **((_QWORD **)&v51 + 1);
    *((_QWORD *)&v34 + 1) = v19;
    if (v19)
    {
      v20 = *(_QWORD *)(v19 + 8);
      if (v20 < 1)
      {
        v32 = __cxa_allocate_exception(8uLL);
        *v32 = "Attempted resurection of an object";
        __cxa_throw(v32, MEMORY[0x1E0DE4E50], 0);
      }
      *(_QWORD *)(v19 + 8) = v20 + 1;
    }
    goto LABEL_14;
  }
  v26 = operator new();
  *(_QWORD *)(v26 + 16) = 0;
  *(_QWORD *)(v26 + 24) = 0;
  v27 = &off_1E1FC81C8;
  *(_QWORD *)v26 = &off_1E1FC81C8;
  *(_QWORD *)(v26 + 8) = 1;
  *(_QWORD *)(v26 + 32) = *((_QWORD *)&v51 + 1);
  *(_DWORD *)(v26 + 40) = v52;
  *((_QWORD *)&v34 + 1) = v26;
LABEL_26:
  *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v49.runtime = v28;
  *(_OWORD *)&v49.lookup.index_count = v28;
  ((void (*)(der_vm_context *__return_ptr, uint64_t, void (***)(TLE::CallbackEncyclopedia *__hidden)))v27[2])(&v49, v26, &v42);
  if (LODWORD(v49.runtime))
    v29 = 1;
  else
    v29 = LOBYTE(v49.dictionary_tag) == 0;
  v17 = !v29;
LABEL_32:
  libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::reset((_QWORD **)&v34 + 1);

  return v17;
}

+ (id)executor
{
  return objc_alloc_init(sec_LWCRExecutor);
}

@end
