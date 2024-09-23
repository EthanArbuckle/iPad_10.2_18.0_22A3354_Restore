@implementation ZN3TLE21opArrayOpDeserializerERNS

_QWORD *___ZN3TLE21opArrayOpDeserializerERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE_block_invoke(_QWORD *a1, uint64_t a2)
{
  _DWORD *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  der_vm_context *v7;
  __int128 v8;
  const char *v9;
  _QWORD *result;
  uint64_t v11;
  __int128 v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  BOOL v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD **v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL4 v43;
  uint64_t v44;
  _QWORD *exception;
  _QWORD *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  char *der_end;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v47 = 0u;
  v48 = 0u;
  v3 = (_DWORD *)a1[7];
  if (*v3)
  {
    v47 = 0uLL;
    v48 = 0uLL;
    LODWORD(v47) = 6;
    v4 = "factless operator disallowed for active fact";
    v5 = 44;
LABEL_9:
    result = 0;
    *((_QWORD *)&v47 + 1) = v4;
    *(_QWORD *)&v48 = v5;
    v11 = *(_QWORD *)(a1[4] + 8);
    *(_OWORD *)(v11 + 40) = v47;
    *(_QWORD *)(v11 + 56) = v5;
    return result;
  }
  v6 = a1[6];
  v7 = (der_vm_context *)(a2 + 56);
  v8 = *(_OWORD *)(a2 + 72);
  v68 = *(_OWORD *)(a2 + 56);
  v69 = v8;
  v70 = *(_OWORD *)(a2 + 88);
  v71 = *(_QWORD *)(a2 + 104);
  if (der_vm_CEType_from_context() != 2)
  {
    v47 = 0u;
    v48 = 0u;
    LODWORD(v47) = 6;
    v4 = "Non array element found in operator Array";
    v5 = 41;
    goto LABEL_9;
  }
  if (count_ce_elements(v7) != 2)
  {
    v47 = 0u;
    v48 = 0u;
    LODWORD(v47) = 6;
    v4 = "Incorrect number of elements in operator Array tuple";
    v5 = 52;
    goto LABEL_9;
  }
  v67 = 0;
  v65 = 0u;
  v66 = 0u;
  TLE::keyForContext((TLE *)&v65, v7);
  if ((_DWORD)v65)
  {
    v47 = v65;
    v48 = (unint64_t)v66;
    goto LABEL_26;
  }
  v64 = 0;
  v62 = 0u;
  v63 = 0u;
  v61 = 0u;
  v12 = *(_OWORD *)&v7->lookup.index_count;
  v57 = *(_OWORD *)&v7->runtime;
  v58 = v12;
  v59 = *(_OWORD *)&v7->sorted;
  der_end = v7->var0.ccstate.der_end;
  der_vm_execute_nocopy();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0;
  if (der_vm_CEType_from_context() == 1)
  {
    if (CEBuffer_cmp())
    {
      if (CEBuffer_cmp())
      {
        if (!CEBuffer_cmp())
        {
          TLE::optionalOpDeserializer(v6, (uint64_t)&v61, (uint64_t)&v47);
          goto LABEL_26;
        }
        goto LABEL_19;
      }
      TLE::orDeserializer(v6, (uint64_t)&v61, v3, (uint64_t)&v47);
    }
    else
    {
      TLE::andDeserializer(v6, (uint64_t)&v61, v3, (uint64_t)&v47);
    }
  }
  else
  {
    v49 = v61;
    v50 = v62;
    v51 = v63;
    v52 = v64;
    if (der_vm_CEType_from_context() != 2)
    {
      v47 = 0u;
      v48 = 0u;
      LODWORD(v47) = 3;
      v13 = "Unexpected type in Array tuple";
      v14 = 30;
      goto LABEL_21;
    }
    if (CEBuffer_cmp())
    {
      if (CEBuffer_cmp())
      {
LABEL_19:
        v47 = 0u;
        v48 = 0u;
        LODWORD(v47) = 9;
        v13 = "Unexpected operator in Array tuple";
        v14 = 34;
LABEL_21:
        *((_QWORD *)&v47 + 1) = v13;
        *(_QWORD *)&v48 = v14;
        goto LABEL_26;
      }
      TLE::orArrayOpDeserializer(v6, (uint64_t)&v61, (uint64_t)v3, (uint64_t)&v47);
    }
    else
    {
      TLE::andArrayOpDeserializer(&v47, v6, &v61, v3);
    }
  }
LABEL_26:
  if ((_DWORD)v47)
  {
    v15 = *(_QWORD *)(a1[4] + 8);
    *(_OWORD *)(v15 + 40) = v47;
    result = (_QWORD *)*((_QWORD *)&v48 + 1);
    *(_QWORD *)(v15 + 56) = v48;
    if (result)
    {
      v16 = result[1];
      if (v16 <= 0)
      {
        exception = __cxa_allocate_exception(8uLL);
        *exception = "Over-release of an object";
        __cxa_throw(exception, MEMORY[0x1E0DE4E50], 0);
      }
      v17 = v16 - 1;
      result[1] = v17;
      if (!v17)
        (*(void (**)(_QWORD *))(*result + 8))(result);
      return 0;
    }
    return result;
  }
  v18 = (unint64_t *)a1[8];
  v19 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v20 = *v18;
  if (*v18)
  {
    v21 = v20 + 8 * *((unsigned int *)v18 + 2);
    v22 = v21 >= v20;
    v23 = v21 - v20;
    if (!v22 || HIDWORD(v23))
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v9);
  }
  else
  {
    LODWORD(v23) = 0;
  }
  if (v19 >= 0)
    v24 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  else
    v24 = -v19;
  v25 = ((unint64_t)v19 >> 63) + 0x7FFFFFFFFFFFFFFFLL;
  if (v19 >= 0)
    v26 = 8 * v24;
  else
    v26 = -8 * v24;
  if (v24 >> 61)
    v27 = 1;
  else
    v27 = 8 * v24 > v25;
  if (v27)
  {
    v28 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would trigger an overflow";
    goto LABEL_71;
  }
  if (v26 != (int)v26)
  {
    v28 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current pos"
          "ition would overflow.";
    goto LABEL_71;
  }
  v28 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
  if ((v26 & 0x80000000) != 0
    || (int)v26 + 8 > v23
    || ((v29 = (int)v26, v30 = (uint64_t)(int)v26 >> 63, v31 = (_QWORD **)(v20 + v29), !__CFADD__(v20, v29))
      ? (v32 = v30)
      : (v32 = v30 + 1),
        (v33 = v32 << 63 >> 63,
         v28 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.",
         v33 ^ v32)
     || v33 < 0))
  {
LABEL_71:
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v28, v9);
  }
  v34 = (_QWORD *)*((_QWORD *)&v48 + 1);
  v35 = *v31;
  if (*v31)
  {
    v36 = v35[1];
    if (v36 <= 0)
    {
      v46 = __cxa_allocate_exception(8uLL);
      *v46 = "Over-release of an object";
      __cxa_throw(v46, MEMORY[0x1E0DE4E50], 0);
    }
    v37 = v36 - 1;
    v35[1] = v37;
    if (!v37)
      (*(void (**)(_QWORD *))(*v35 + 8))(v35);
  }
  *v31 = v34;
  v38 = *(_QWORD *)(a1[5] + 8);
  v39 = *(_QWORD *)(v38 + 24);
  v40 = v39 + 1;
  v41 = v39 == -1;
  v43 = v41 << 63 >> 63 != v41 || v41 << 63 >> 63 == -1;
  if (v43)
  {
    v44 = *(_QWORD *)(a1[4] + 8);
    *(_DWORD *)(v44 + 40) = 10;
    *(_QWORD *)(v44 + 48) = "Array contains too many elements";
    *(_QWORD *)(v44 + 56) = 32;
    return 0;
  }
  else
  {
    *(_QWORD *)(v38 + 24) = v40;
    return (_QWORD *)!v43;
  }
}

@end
