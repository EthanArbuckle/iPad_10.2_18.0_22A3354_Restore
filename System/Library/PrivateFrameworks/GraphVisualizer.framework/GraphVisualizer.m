uint64_t _traverse_postorder(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, void *a7)
{
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v13 = (void *)result;
    result = objc_msgSend(a7, "containsObject:", result);
    if ((result & 1) == 0)
    {
      result = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(a5 + 16))(a5, v13, a2, a3);
      if ((result & 1) == 0)
      {
        v29 = a2;
        if (a4 == 2)
        {
          v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
          objc_msgSend(v19, "unionOrderedSet:", objc_msgSend(v13, "inNodes"));
          objc_msgSend(v19, "unionOrderedSet:", objc_msgSend(v13, "outNodes"));
          objc_msgSend(v19, "minusSet:", a7);
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v31;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v31 != v22)
                  objc_enumerationMutation(v19);
                _traverse_postorder(*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), v13, a3 + 1, 2, a5, a6, a7);
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
            }
            while (v21);
          }
        }
        else if (a4 == 1)
        {
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v24 = (void *)objc_msgSend(v13, "inNodes");
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v35 != v27)
                  objc_enumerationMutation(v24);
                _traverse_postorder(*(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), v13, a3 + 1, 1, a5, a6, a7);
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            }
            while (v26);
          }
        }
        else
        {
          if (a4)
            _traverse_postorder_cold_1();
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v14 = (void *)objc_msgSend(v13, "outNodes");
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v39;
            do
            {
              for (k = 0; k != v16; ++k)
              {
                if (*(_QWORD *)v39 != v17)
                  objc_enumerationMutation(v14);
                _traverse_postorder(*(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k), v13, a3 + 1, 0, a5, a6, a7);
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
            }
            while (v16);
          }
        }
        (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(a6 + 16))(a6, v13, v29, a3);
        return objc_msgSend(a7, "addObject:", v13);
      }
    }
  }
  return result;
}

uint64_t _traverse_postorder_randomized(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, void *a7)
{
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v13 = (void *)result;
    result = objc_msgSend(a7, "containsObject:", result);
    if ((result & 1) == 0)
    {
      result = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(a5 + 16))(a5, v13, a2, a3);
      if ((result & 1) == 0)
      {
        v30 = a2;
        if (a4 == 2)
        {
          v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
          objc_msgSend(v19, "unionOrderedSet:", objc_msgSend(v13, "inNodes"));
          objc_msgSend(v19, "unionOrderedSet:", objc_msgSend(v13, "outNodes"));
          objc_msgSend(v19, "minusSet:", a7);
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          v20 = fisherYates(v19);
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v32 != v23)
                  objc_enumerationMutation(v20);
                _traverse_postorder(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), (uint64_t)v13, a3 + 1, 2, a5, a6, a7);
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
            }
            while (v22);
          }
        }
        else if (a4 == 1)
        {
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v25 = fisherYates((void *)objc_msgSend(v13, "inNodes"));
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v36;
            do
            {
              for (j = 0; j != v27; ++j)
              {
                if (*(_QWORD *)v36 != v28)
                  objc_enumerationMutation(v25);
                _traverse_postorder_randomized(*(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j), v13, a3 + 1, 1, a5, a6, a7);
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
            }
            while (v27);
          }
        }
        else
        {
          if (a4)
            _traverse_postorder_randomized_cold_1();
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v14 = fisherYates((void *)objc_msgSend(v13, "outNodes"));
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v40;
            do
            {
              for (k = 0; k != v16; ++k)
              {
                if (*(_QWORD *)v40 != v17)
                  objc_enumerationMutation(v14);
                _traverse_postorder_randomized(*(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k), v13, a3 + 1, 0, a5, a6, a7);
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
            }
            while (v16);
          }
        }
        (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(a6 + 16))(a6, v13, v30, a3);
        return objc_msgSend(a7, "addObject:", v13);
      }
    }
  }
  return result;
}

uint64_t _traverse_preorder(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, void *a6)
{
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v11 = (void *)result;
    result = objc_msgSend(a6, "containsObject:", result);
    if ((result & 1) == 0)
    {
      result = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(a5 + 16))(a5, v11, a2, a3);
      if ((result & 1) == 0)
      {
        objc_msgSend(a6, "addObject:", v11);
        if (a4 == 2)
        {
          v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
          objc_msgSend(v17, "unionOrderedSet:", objc_msgSend(v11, "inNodes"));
          objc_msgSend(v17, "unionOrderedSet:", objc_msgSend(v11, "outNodes"));
          objc_msgSend(v17, "minusSet:", a6);
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          result = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
          if (result)
          {
            v18 = result;
            v19 = *(_QWORD *)v28;
            v20 = a3 + 1;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v28 != v19)
                  objc_enumerationMutation(v17);
                _traverse_preorder(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v21++), v11, v20, 2, a5, a6);
              }
              while (v18 != v21);
              result = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
              v18 = result;
            }
            while (result);
          }
        }
        else if (a4 == 1)
        {
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          v22 = (void *)objc_msgSend(v11, "inNodes");
          result = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
          if (result)
          {
            v23 = result;
            v24 = *(_QWORD *)v32;
            v25 = a3 + 1;
            do
            {
              v26 = 0;
              do
              {
                if (*(_QWORD *)v32 != v24)
                  objc_enumerationMutation(v22);
                _traverse_preorder(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v26++), v11, v25, 1, a5, a6);
              }
              while (v23 != v26);
              result = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
              v23 = result;
            }
            while (result);
          }
        }
        else
        {
          if (a4)
            _traverse_preorder_cold_1();
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v12 = (void *)objc_msgSend(v11, "outNodes");
          result = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
          if (result)
          {
            v13 = result;
            v14 = *(_QWORD *)v36;
            v15 = a3 + 1;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v36 != v14)
                  objc_enumerationMutation(v12);
                _traverse_preorder(*(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v16++), v11, v15, 0, a5, a6);
              }
              while (v13 != v16);
              result = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
              v13 = result;
            }
            while (result);
          }
        }
      }
    }
  }
  return result;
}

void *fisherYates(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "array"), "mutableCopy");
  v3 = objc_msgSend(a1, "count");
  v4 = v3 - 1;
  if (v3 != 1)
  {
    do
    {
      objc_msgSend(v2, "exchangeObjectAtIndex:withObjectAtIndex:", arc4random() % (unint64_t)(v4 + 1), v4);
      --v4;
    }
    while (v4);
  }
  return v2;
}

void sub_1D4F53B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t _block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "inPriority");
}

uint64_t _block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "outPriority");
}

unint64_t medianX(void *a1)
{
  unint64_t result;
  unint64_t v3;

  result = objc_msgSend(a1, "count");
  if (result)
  {
    v3 = result >> 1;
    if ((result & 1) == 0)
      objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", v3 - 1), "cx");
    return objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", v3), "cx");
  }
  return result;
}

uint64_t _block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "inPriority");
}

uint64_t _block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "outPriority");
}

unint64_t medianY(void *a1)
{
  unint64_t result;
  unint64_t v3;

  result = objc_msgSend(a1, "count");
  if (result)
  {
    v3 = result >> 1;
    if ((result & 1) == 0)
      objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", v3 - 1), "y");
    return objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", v3), "y");
  }
  return result;
}

void sub_1D4F56DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __sortByIndex_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v7;

  v5 = objc_msgSend(a2, "index");
  if (v5 < objc_msgSend(a3, "index"))
    return -1;
  v7 = objc_msgSend(a2, "index");
  return v7 > objc_msgSend(a3, "index");
}

uint64_t __sortByInPriority_block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v7;

  v5 = objc_msgSend(a2, "inPriority");
  if (v5 < objc_msgSend(a3, "inPriority"))
    return -1;
  v7 = objc_msgSend(a2, "inPriority");
  return v7 > objc_msgSend(a3, "inPriority");
}

uint64_t __sortByOutPriority_block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v7;

  v5 = objc_msgSend(a2, "outPriority");
  if (v5 < objc_msgSend(a3, "outPriority"))
    return -1;
  v7 = objc_msgSend(a2, "outPriority");
  return v7 > objc_msgSend(a3, "outPriority");
}

uint64_t __sortByDegree_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  int v5;
  int v6;
  int v7;
  BOOL v8;
  _BOOL8 v9;

  v4 = a2;
  v5 = objc_msgSend(a2, "inDegree");
  v6 = v5 - 2 * objc_msgSend(v4, "outDegree");
  LODWORD(v4) = objc_msgSend(a3, "inDegree");
  v7 = (_DWORD)v4 - 2 * objc_msgSend(a3, "outDegree");
  v8 = v6 < v7;
  v9 = v6 > v7;
  if (v8)
    return -1;
  else
    return v9;
}

void _traverse_postorder_cold_1()
{
  __assert_rtn("_traverse_postorder", "GVNode.m", 264, "0 && \"unreachable\"");
}

void _traverse_postorder_randomized_cold_1()
{
  __assert_rtn("_traverse_postorder_randomized", "GVNode.m", 344, "0 && \"unreachable\"");
}

void _traverse_preorder_cold_1()
{
  __assert_rtn("_traverse_preorder", "GVNode.m", 301, "0 && \"unreachable\"");
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1E0DE8000](a1);
}

