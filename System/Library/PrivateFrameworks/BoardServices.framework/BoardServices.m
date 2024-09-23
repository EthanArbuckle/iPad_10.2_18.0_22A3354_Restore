void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_19A79AFA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A79B2E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A79B3D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A79B8D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A79BF68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A79C06C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id BSServiceXPCLog()
{
  if (BSServiceXPCLog_onceToken != -1)
    dispatch_once(&BSServiceXPCLog_onceToken, &__block_literal_global_7);
  return (id)BSServiceXPCLog___logObj;
}

void sub_19A79C4D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A79C908(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A79CA08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19A79CA90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A79CCF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A79CFF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A79D24C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19A79D3B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_19A79D4B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void __vetProtocol(void *a1)
{
  void (**v1)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  int v27;
  int v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  id v33;
  int v34;
  int v35;
  int v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  int v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  char v48;
  char v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  int v56;
  const __CFString *v57;
  char v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  int v73;
  uint64_t v74;
  NSObject *v75;
  id v76;
  id v77;
  const __CFString *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  id v83;
  void *v84;
  id v85;
  id obj;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[6];
  _QWORD v118[3];
  char v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t (*v123)(uint64_t, uint64_t);
  void (*v124)(uint64_t);
  id v125;
  uint8_t buf[4];
  id v127;
  __int16 v128;
  const __CFString *v129;
  __int16 v130;
  int v131;
  __int16 v132;
  void *v133;
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v85 = a1;
  v120 = 0;
  v121 = &v120;
  v122 = 0x3032000000;
  v123 = __Block_byref_object_copy__1;
  v124 = __Block_byref_object_dispose__1;
  v125 = 0;
  v118[0] = 0;
  v118[1] = v118;
  v118[2] = 0x2020000000;
  v119 = 0;
  v117[0] = MEMORY[0x1E0C809B0];
  v117[1] = 3221225472;
  v117[2] = ____vetProtocol_block_invoke;
  v117[3] = &unk_1E390D630;
  v117[4] = &v120;
  v117[5] = v118;
  v1 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x19AECAA00](v117);
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  objc_msgSend(v85, "methods");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v139, 16);
  if (v88)
  {
    v87 = *(_QWORD *)v114;
    do
    {
      v89 = 0;
      do
      {
        if (*(_QWORD *)v114 != v87)
          objc_enumerationMutation(obj);
        v2 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v89);
        objc_msgSend(v2, "arguments");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        v92 = v3;
        v4 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v109, v138, 16);
        if (v4)
        {
          v5 = *(_QWORD *)v110;
          do
          {
            v6 = 0;
            do
            {
              if (*(_QWORD *)v110 != v5)
                objc_enumerationMutation(v92);
              v7 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v6);
              if (objc_msgSend(v7, "size") != 8)
                ((void (**)(_QWORD, void *, void *, const __CFString *))v1)[2](v1, v2, v7, CFSTR("protocol methods and blocks may only accept pointer-sized arguments"));
              if (objc_msgSend(v7, "argumentIndex") >= 10)
                ((void (**)(_QWORD, void *, void *, const __CFString *))v1)[2](v1, v2, v7, CFSTR("argument index is out of bounds"));
              v8 = objc_msgSend(v7, "type");
              if ((v8 & 0xFFFFFFFD) == 0x64)
                ((void (**)(_QWORD, void *, void *, const __CFString *))v1)[2](v1, v2, v7, CFSTR("floating point arguments are not allowed"));
              if (v8 > 0x5Du)
              {
                if (v8 == 94)
                  goto LABEL_36;
                if (v8 != 123 && v8 != 98)
                  goto LABEL_27;
              }
              else if (v8 != 40)
              {
                if (v8 == 64)
                  goto LABEL_28;
                if (v8 != 91)
                  goto LABEL_27;
              }
              ((void (**)(_QWORD, void *, void *, const __CFString *))v1)[2](v1, v2, v7, CFSTR("c structs and bitfields unions, etc, are not allowed"));
              if (v8 != 64)
              {
                if (v8 == 94)
                  goto LABEL_36;
LABEL_27:
                ((void (**)(_QWORD, void *, void *, const __CFString *))v1)[2](v1, v2, v7, CFSTR("only objects and pointers are allowed"));
                if (v8 != 64)
                  goto LABEL_36;
              }
LABEL_28:
              if ((objc_msgSend(v7, "isXPCObject") & 1) == 0 && (objc_msgSend(v7, "isBlock") & 1) == 0)
              {
                v9 = (void *)objc_msgSend(v7, "objectClass");
                if ((objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
                  || (objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
                  || objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class()))
                {
                  objc_msgSend(v7, "objectContainedClasses");
                  v10 = (void *)objc_claimAutoreleasedReturnValue();
                  v11 = objc_msgSend(v10, "firstObject");

                  if (!v11
                    || (__disallowedValueClasses(),
                        v12 = (void *)objc_claimAutoreleasedReturnValue(),
                        v13 = objc_msgSend(v12, "containsObject:", v11),
                        v12,
                        v13))
                  {
                    ((void (**)(_QWORD, void *, void *, const __CFString *))v1)[2](v1, v2, v7, CFSTR("collections must specify a valid value class"));
                  }
                }
                else if (objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class()))
                {
                  objc_msgSend(v7, "objectContainedClasses");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v14, "count"))
                  {
                    v15 = objc_msgSend(v14, "firstObject");
                    if (v15 != objc_opt_class())
                      ((void (**)(_QWORD, void *, void *, const __CFString *))v1)[2](v1, v2, v7, CFSTR("dictionary keys must be of type NSString"));
                    __disallowedValueClasses();
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    v17 = objc_msgSend(v16, "containsObject:", objc_msgSend(v14, "lastObject"));

                    if (v17)
                      ((void (**)(_QWORD, void *, void *, const __CFString *))v1)[2](v1, v2, v7, CFSTR("dictionary value must be a concrete, non-collection type"));
                    if (objc_msgSend(v14, "count") != 2)
                      ((void (**)(_QWORD, void *, void *, const __CFString *))v1)[2](v1, v2, v7, CFSTR("dictionaries must specify both their key and value classes"));
                  }

                }
                else if (!v9 || v9 == (void *)objc_opt_class())
                {
                  ((void (**)(_QWORD, void *, void *, const __CFString *))v1)[2](v1, v2, v7, CFSTR("parameter objects must be concrete types"));
                }
              }
LABEL_36:
              ++v6;
            }
            while (v4 != v6);
            v18 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v109, v138, 16);
            v4 = v18;
          }
          while (v18);
        }

        objc_msgSend(v2, "returnValue");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "lastObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isPointer"))
        {
          objc_msgSend(v92, "lastObject");
          v91 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v91 = 0;
        }

        objc_msgSend(v92, "lastObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isBlock"))
        {
          objc_msgSend(v92, "lastObject");
          v21 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v21 = 0;
        }

        if (objc_msgSend(v90, "isVoid") && (objc_msgSend(v90, "isOneWay") & 1) != 0)
        {
          v99 = 0u;
          v100 = 0u;
          v97 = 0u;
          v98 = 0u;
          v22 = v92;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v97, v135, 16);
          if (v23)
          {
            v24 = *(_QWORD *)v98;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v98 != v24)
                  objc_enumerationMutation(v22);
                v26 = *(id *)(*((_QWORD *)&v97 + 1) + 8 * i);
                v27 = objc_msgSend(v26, "isBlock");
                if (v26 == v21)
                  v28 = 0;
                else
                  v28 = v27;
                if (v28 == 1)
                  ((void (**)(_QWORD, void *, id, const __CFString *))v1)[2](v1, v2, v26, CFSTR("methods may only contain one block parameter, and it must be the last"));
                if (objc_msgSend(v26, "isPointer"))
                  ((void (**)(_QWORD, void *, id, const __CFString *))v1)[2](v1, v2, v26, CFSTR("Async method cannot contain an out-parameter"));
              }
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v97, v135, 16);
            }
            while (v23);
          }

        }
        else
        {
          if (objc_msgSend(v90, "isVoid"))
          {
            v107 = 0u;
            v108 = 0u;
            v105 = 0u;
            v106 = 0u;
            v29 = v92;
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v105, v137, 16);
            if (v30)
            {
              v31 = *(_QWORD *)v106;
              do
              {
                for (j = 0; j != v30; ++j)
                {
                  if (*(_QWORD *)v106 != v31)
                    objc_enumerationMutation(v29);
                  v33 = *(id *)(*((_QWORD *)&v105 + 1) + 8 * j);
                  v34 = objc_msgSend(v33, "isBlock");
                  if (v33 == v21)
                    v35 = 0;
                  else
                    v35 = v34;
                  if (v35 == 1)
                    ((void (**)(_QWORD, void *, id, const __CFString *))v1)[2](v1, v2, v33, CFSTR("a reply block may only be the last argument of a method"));
                  v36 = objc_msgSend(v33, "isPointer");
                  if (v33 == v91)
                    v37 = 0;
                  else
                    v37 = v36;
                  if (v37 == 1)
                    ((void (**)(_QWORD, void *, id, const __CFString *))v1)[2](v1, v2, v33, CFSTR("an NSError out-param may only be the last argument of a method"));
                }
                v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v105, v137, 16);
              }
              while (v30);
            }
          }
          else
          {
            if (objc_msgSend(v90, "isObject") && (objc_msgSend(v90, "isBlock") & 1) == 0)
            {
              if ((objc_msgSend(v90, "isXPCObject") & 1) == 0)
              {
                v38 = (void *)objc_msgSend(v90, "objectClass");
                if ((objc_msgSend(v38, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
                  || (objc_msgSend(v38, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
                  || objc_msgSend(v38, "isSubclassOfClass:", objc_opt_class()))
                {
                  objc_msgSend(v90, "objectContainedClasses");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = objc_msgSend(v39, "firstObject");

                  if (!v40
                    || (__disallowedValueClasses(),
                        v41 = (void *)objc_claimAutoreleasedReturnValue(),
                        v42 = objc_msgSend(v41, "containsObject:", v40),
                        v41,
                        v42))
                  {
                    ((void (**)(_QWORD, void *, _QWORD, const __CFString *))v1)[2](v1, v2, 0, CFSTR("collections must specify a valid value class"));
                  }
                }
                else if (objc_msgSend(v38, "isSubclassOfClass:", objc_opt_class()))
                {
                  objc_msgSend(v90, "objectContainedClasses");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v70, "count"))
                  {
                    v71 = objc_msgSend(v70, "firstObject");
                    if (v71 != objc_opt_class())
                      ((void (**)(_QWORD, void *, _QWORD, const __CFString *))v1)[2](v1, v2, 0, CFSTR("dictionary keys must be of type NSString"));
                    __disallowedValueClasses();
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    v73 = objc_msgSend(v72, "containsObject:", objc_msgSend(v70, "lastObject"));

                    if (v73)
                      ((void (**)(_QWORD, void *, _QWORD, const __CFString *))v1)[2](v1, v2, 0, CFSTR("dictionary value must be a concrete, non-collection type"));
                    if (objc_msgSend(v70, "count") != 2)
                      ((void (**)(_QWORD, void *, _QWORD, const __CFString *))v1)[2](v1, v2, 0, CFSTR("dictionaries must specify both their key and value classes"));
                  }

                }
                else if (!v38 || v38 == (void *)objc_opt_class())
                {
                  ((void (**)(_QWORD, void *, _QWORD, const __CFString *))v1)[2](v1, v2, 0, CFSTR("returned objects must be concrete types"));
                }
              }
            }
            else if ((objc_msgSend(v90, "isBoolean") & 1) == 0)
            {
              ((void (**)(_QWORD, void *, _QWORD, const __CFString *))v1)[2](v1, v2, 0, CFSTR("synchronous method has invalid return type"));
            }
            v103 = 0u;
            v104 = 0u;
            v101 = 0u;
            v102 = 0u;
            v43 = v92;
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v101, v136, 16);
            if (v44)
            {
              v45 = *(_QWORD *)v102;
              do
              {
                for (k = 0; k != v44; ++k)
                {
                  if (*(_QWORD *)v102 != v45)
                    objc_enumerationMutation(v43);
                  v47 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * k);
                  if (objc_msgSend(v47, "isBlock"))
                    ((void (**)(_QWORD, void *, void *, const __CFString *))v1)[2](v1, v2, v47, CFSTR("a method with a return value may not also provide a block"));
                }
                v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v101, v136, 16);
              }
              while (v44);
            }
          }

          if (objc_msgSend(v90, "hasQualifier:", 82))
            ((void (**)(_QWORD, void *, _QWORD, const __CFString *))v1)[2](v1, v2, 0, CFSTR("a synchronous method may not opt in to batching"));
        }
        v48 = objc_msgSend(v90, "isVoid");
        if (v21)
          v49 = v48;
        else
          v49 = 1;
        if ((v49 & 1) == 0)
          ((void (**)(_QWORD, void *, _QWORD, const __CFString *))v1)[2](v1, v2, 0, CFSTR("Method cannot have both a sync and async return value"));
        if (v91)
        {
          if (objc_msgSend(v90, "isVoid") && objc_msgSend(v90, "isOneWay"))
            ((void (**)(_QWORD, void *, _QWORD, const __CFString *))v1)[2](v1, v2, 0, CFSTR("Asynchronous message cannot contain an out-parameter"));
          if (objc_msgSend(v91, "isObjectNonnull"))
            ((void (**)(_QWORD, void *, _QWORD, const __CFString *))v1)[2](v1, v2, 0, CFSTR("NSError out parameter cannot be nonnull"));
        }
        if (v21)
        {
          objc_msgSend(v21, "blockArguments");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = 0u;
          v96 = 0u;
          v93 = 0u;
          v94 = 0u;
          v51 = v50;
          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v93, v134, 16);
          if (v52)
          {
            v53 = *(_QWORD *)v94;
            do
            {
              v54 = 0;
              do
              {
                if (*(_QWORD *)v94 != v53)
                  objc_enumerationMutation(v51);
                v55 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v54);
                v56 = objc_msgSend(v55, "isObject");
                v57 = CFSTR("Arguments of reply block must be objects");
                if (v56
                  && (v58 = objc_msgSend(v55, "isBlock"),
                      v57 = CFSTR("Arguments of reply block cannot be blocks"),
                      (v58 & 1) == 0))
                {
                  if ((objc_msgSend(v55, "isXPCObject") & 1) == 0)
                  {
                    v59 = (void *)objc_msgSend(v55, "objectClass");
                    if ((objc_msgSend(v59, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
                      || (objc_msgSend(v59, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
                      || objc_msgSend(v59, "isSubclassOfClass:", objc_opt_class()))
                    {
                      objc_msgSend(v55, "objectContainedClasses");
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      v61 = objc_msgSend(v60, "firstObject");

                      if (!v61
                        || (__disallowedValueClasses(),
                            v62 = (void *)objc_claimAutoreleasedReturnValue(),
                            v63 = objc_msgSend(v62, "containsObject:", v61),
                            v62,
                            v63))
                      {
                        ((void (**)(_QWORD, void *, id, const __CFString *))v1)[2](v1, v2, v21, CFSTR("collections must specify a valid value class"));
                      }
                    }
                    else if (objc_msgSend(v59, "isSubclassOfClass:", objc_opt_class()))
                    {
                      objc_msgSend(v55, "objectContainedClasses");
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v64, "count"))
                      {
                        v65 = objc_msgSend(v64, "firstObject");
                        if (v65 != objc_opt_class())
                          ((void (**)(_QWORD, void *, id, const __CFString *))v1)[2](v1, v2, v21, CFSTR("dictionary keys must be of type NSString"));
                        __disallowedValueClasses();
                        v66 = (void *)objc_claimAutoreleasedReturnValue();
                        v67 = objc_msgSend(v66, "containsObject:", objc_msgSend(v64, "lastObject"));

                        if (v67)
                          ((void (**)(_QWORD, void *, id, const __CFString *))v1)[2](v1, v2, v21, CFSTR("dictionary value must be a concrete, non-collection type"));
                        if (objc_msgSend(v64, "count") != 2)
                          ((void (**)(_QWORD, void *, id, const __CFString *))v1)[2](v1, v2, v21, CFSTR("dictionaries must specify both their key and value classes"));
                      }

                    }
                    else if (!v59 || v59 == (void *)objc_opt_class())
                    {
                      ((void (**)(_QWORD, void *, id, const __CFString *))v1)[2](v1, v2, v21, CFSTR("Arguments of reply block must be concrete types"));
                    }
                  }
                }
                else
                {
                  ((void (**)(_QWORD, void *, id, const __CFString *))v1)[2](v1, v2, v21, v57);
                }
                ++v54;
              }
              while (v52 != v54);
              v68 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v93, v134, 16);
              v52 = v68;
            }
            while (v68);
          }

          if (!objc_msgSend(v51, "count") || (unint64_t)objc_msgSend(v51, "count") >= 0xB)
            ((void (**)(_QWORD, void *, id, const __CFString *))v1)[2](v1, v2, v21, CFSTR("Reply block contains an invalid number of arguments"));
          objc_msgSend(v51, "lastObject");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend((id)objc_msgSend(v69, "objectClass"), "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
            ((void (**)(_QWORD, void *, id, const __CFString *))v1)[2](v1, v2, v21, CFSTR("Reply block signature does not contain required NSError as last parameter"));
          if (objc_msgSend(v69, "isObjectNonnull"))
            ((void (**)(_QWORD, void *, id, const __CFString *))v1)[2](v1, v2, v21, CFSTR("It does not make sense to declare an error parameter as nonnull"));
          if (objc_msgSend(v90, "hasQualifier:", 82) && objc_msgSend(v51, "count") != 1)
            ((void (**)(_QWORD, void *, id, const __CFString *))v1)[2](v1, v2, v21, CFSTR("a batchable method may only accept blocks with a single NSError parameter"));

        }
        ++v89;
      }
      while (v89 != v88);
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v139, 16);
      v88 = v74;
    }
    while (v74);
  }

  if (objc_msgSend((id)v121[5], "count"))
  {
    v75 = MEMORY[0x1E0C81028];
    v76 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v85, "name");
      v77 = (id)objc_claimAutoreleasedReturnValue();
      v78 = (const __CFString *)v121[5];
      *(_DWORD *)buf = 138412546;
      v127 = v77;
      v128 = 2112;
      v129 = v78;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Non-conforming methods on protocol '%@':%@", buf, 0x16u);

    }
    v79 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v85, "name");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "stringWithFormat:", CFSTR("Non-conforming methods on protocol '%@':%@"), v80, v121[5]);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    v82 = MEMORY[0x1E0C81028];
    v83 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void __vetProtocol(BSObjCProtocol *__strong)");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v127 = v84;
      v128 = 2114;
      v129 = CFSTR("BSServiceInterface.m");
      v130 = 1024;
      v131 = 274;
      v132 = 2114;
      v133 = v81;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v81), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A79E5F0);
  }

  _Block_object_dispose(v118, 8);
  _Block_object_dispose(&v120, 8);

}

void sub_19A79E5F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;

  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose(&STACK[0x220], 8);

  _Unwind_Resume(a1);
}

void sub_19A79EEFC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, __int128 buf, int a20,__int16 a21,__int16 a22,uint64_t a23,__int128 a24)
{
  void *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if (a2 == 1)
  {
    v25 = objc_begin_catch(a1);
    v26 = BSServiceXPCErrorsLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      if (a18 && (v27 = *(_QWORD *)(a18 + 176)) != 0)
        v28 = *(_QWORD *)(v27 + 8);
      else
        v28 = 0;
      v29 = objc_msgSend(v24, "argumentName");
      v30 = objc_msgSend(v24, "argumentIndex");
      v31 = objc_msgSend(v25, "description");
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v28;
      WORD6(buf) = 2112;
      *(_QWORD *)((char *)&buf + 14) = v29;
      a22 = 2048;
      a23 = v30;
      LOWORD(a24) = 2112;
      *(_QWORD *)((char *)&a24 + 2) = v31;
      _os_log_error_impl(&dword_19A799000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Exception thrown while decoding argument \"%@\" (index %ld): %@", (uint8_t *)&buf, 0x2Au);
    }
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_19A79F70C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id __disallowedValueClasses()
{
  if (qword_1ECD9C5F0 != -1)
    dispatch_once(&qword_1ECD9C5F0, &__block_literal_global_212);
  return (id)qword_1ECD9C5E8;
}

void sub_19A7A0BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19A7A100C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A1718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_19A7A1B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;

  _Unwind_Resume(a1);
}

void sub_19A7A1F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void BSXPCServiceConnectionExecuteCallOut(os_unfair_lock_s *a1, void *a2, uint64_t a3)
{
  os_unfair_lock_s *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  os_unfair_lock_s *v9;
  os_unfair_lock_s *v10;
  os_unfair_lock_s *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  os_unfair_lock_s *v30;
  os_unfair_lock_s *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSXPCServiceConnectionExecuteCallOut(BSXPCServiceConnection *const __strong _Nonnull, __strong id _Nullable, const __strong dispatch_block_t _Nonnull)");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v33 = v17;
      v34 = 2114;
      v35 = CFSTR("BSXPCServiceConnection.m");
      v36 = 1024;
      v37 = 1293;
      v38 = 2114;
      v39 = v16;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7A21F0);
  }
  if (!v5)
  {
    -[BSXPCServiceConnection _eventHandler](a1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = v6 ? *(void **)(v6 + 136) : 0;
    v9 = v8;
    v10 = v9;
    v11 = v9 ? v9 : a1;
    v30 = v11;

    v5 = v30;
    if (!v30)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      -[BSXPCServiceConnection _eventHandler](a1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSXPCServiceConnection _eventHandler](a1);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v20)
        v22 = *(void **)(v20 + 136);
      else
        v22 = 0;
      v23 = v22;
      objc_msgSend(v18, "stringWithFormat:", CFSTR("failure to find context to execute call out : param=%@ connection=%@ eventHandler=%@ (%@)"), 0, a1, v19, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSXPCServiceConnectionExecuteCallOut(BSXPCServiceConnection *const __strong _Nonnull, __strong id _Nullable, const __strong dispatch_block_t _Nonnull)");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v33 = v25;
        v34 = 2114;
        v35 = CFSTR("BSXPCServiceConnection.m");
        v36 = 1024;
        v37 = 1299;
        v38 = 2114;
        v39 = v24;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

      }
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7A2300);
    }
  }
  v31 = v5;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "threadDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("missing thread-local storage on %@"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BSXPCServiceConnectionExecuteCallOut(BSXPCServiceConnection *const __strong _Nonnull, __strong id _Nullable, const __strong dispatch_block_t _Nonnull)");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v33 = v29;
      v34 = 2114;
      v35 = CFSTR("BSXPCServiceConnection.m");
      v36 = 1024;
      v37 = 1302;
      v38 = 2114;
      v39 = v28;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7A23E4);
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("BSXPCCurrentContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x19AECA850](objc_msgSend(v13, "setObject:forKey:", v31, CFSTR("BSXPCCurrentContext")));
  (*(void (**)(uint64_t))(a3 + 16))(a3);
  objc_autoreleasePoolPop(v15);
  if (v14)
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("BSXPCCurrentContext"));
  else
    objc_msgSend(v13, "removeObjectForKey:", CFSTR("BSXPCCurrentContext"));

}

void sub_19A7A23FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_19A7A282C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A2A6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A3274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_19A7A378C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A3FF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A40B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A42A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  void *v11;

  a11.super_class = (Class)BSXPCServiceConnectionActivationMessage;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_19A7A42F4(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_19A7A44C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A48C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;

  _Unwind_Resume(a1);
}

id BSServiceXPCErrorsLog()
{
  if (BSServiceXPCErrorsLog_onceToken != -1)
    dispatch_once(&BSServiceXPCErrorsLog_onceToken, &__block_literal_global_11);
  return (id)BSServiceXPCErrorsLog___logObj;
}

void sub_19A7A4BC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19A7A4E64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A5100(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A52BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A5464(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A560C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A5C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_19A7A5E3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A5ECC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7A6078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19A7A6134(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7A621C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7A6414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, objc_super a13)
{
  void *v13;

  a13.super_class = (Class)BSServiceConnection;
  -[_Unwind_Exception dealloc](&a13, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_19A7A645C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_19A7A67A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id __emptyProtocol()
{
  if (qword_1ECD9C600 != -1)
    dispatch_once(&qword_1ECD9C600, &__block_literal_global_215);
  return (id)qword_1ECD9C5F8;
}

void sub_19A7A6F0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19A7A71B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19A7A7768(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7A7CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_19A7A82E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  void *v12;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_19A7A8530(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A88D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,void *a21)
{
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

id BSServiceLog()
{
  if (BSServiceLog_onceToken != -1)
    dispatch_once(&BSServiceLog_onceToken, &__block_literal_global_4);
  return (id)BSServiceLog___logObj;
}

void *__getRBSServiceInitializeSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!qword_1ECD9C630)
    qword_1ECD9C630 = _sl_dlopen();
  v2 = (void *)qword_1ECD9C630;
  if (!qword_1ECD9C630)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *RunningBoardServicesLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("BSServiceManager.m"), 27, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "RBSServiceInitialize");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  off_1ECD9C628 = *(_UNKNOWN **)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

void sub_19A7A8BEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19A7A8D70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A8F50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A9148(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7A930C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A9774(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A9850(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7A9ADC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7AA4B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7AA9DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7AAAD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7AABB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7AAC98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7AAD58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7AADEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7AAE54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19A7AAF64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19A7AB7E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

id __escaped(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3500], "URLHostAllowedCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAddingPercentEncodingWithAllowedCharacters:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqualToString:", v1))
    v4 = v1;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

void sub_19A7AB9A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ____handleEvent_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
    v4 = *(void **)(a2 + 168);
    *(_QWORD *)(a2 + 168) = v3;

  }
}

void sub_19A7AC44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  void *v22;

  _Unwind_Resume(a1);
}

void sub_19A7AC598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_19A7AC630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_19A7AC6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_19A7ACB38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7ACCDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7ACDD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void __getRBSConstraintsAttributeClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  RunningBoardServicesLibrary_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("RBSConstraintsAttribute");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRBSConstraintsAttributeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSConstraintsAttributeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BSNSXPCTransport.m"), 31, CFSTR("Unable to find class %s"), "RBSConstraintsAttribute");

    __break(1u);
  }
}

void sub_19A7ACEC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void __getRBSConstraintsAttributeClass_block_invoke_0(uint64_t a1)
{
  void *v2;
  void *v3;

  RunningBoardServicesLibrary_2();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("RBSConstraintsAttribute");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRBSConstraintsAttributeClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSConstraintsAttributeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BSXPCServiceConnection.m"), 33, CFSTR("Unable to find class %s"), "RBSConstraintsAttribute");

    __break(1u);
  }
}

void sub_19A7ACFA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7ACFF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7AD04C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19A7AD4BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7AD788(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7AD954(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19A7ADE60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id getRBSTargetClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getRBSTargetClass_softClass;
  v7 = getRBSTargetClass_softClass;
  if (!getRBSTargetClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRBSTargetClass_block_invoke;
    v3[3] = &unk_1E390CE38;
    v3[4] = &v4;
    __getRBSTargetClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A7ADF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A7AE564(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19A7AE708(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7AE9F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void __getRBSTargetClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  RunningBoardServicesLibrary_2();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("RBSTarget");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRBSTargetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSTargetClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BSXPCServiceConnection.m"), 34, CFSTR("Unable to find class %s"), "RBSTarget");

    __break(1u);
  }
}

void sub_19A7AEB28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void RunningBoardServicesLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
    RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *RunningBoardServicesLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("BSServiceConnectionEndpointInjector.m"), 27, CFSTR("%s"), 0);

    __break(1u);
    free(v1);
  }
}

void sub_19A7AEC48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, _Unwind_Exception *exception_object)
{
  void *v11;

  _Unwind_Resume(a1);
}

void *RunningBoardServicesLibrary_0()
{
  void *v0;
  void *v2;

  if (!RunningBoardServicesLibraryCore_frameworkLibrary_0)
    RunningBoardServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = (void *)RunningBoardServicesLibraryCore_frameworkLibrary_0;
  if (!RunningBoardServicesLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *RunningBoardServicesLibrary(void)"), CFSTR("BSXPCServiceConnectionProxy.m"), 28, CFSTR("%s"), 0);
    __break(1u);
    free(v2);
  }
  return v0;
}

void *RunningBoardServicesLibrary_1()
{
  void *v0;
  void *v2;
  void *v3;

  if (!RunningBoardServicesLibraryCore_frameworkLibrary_1)
    RunningBoardServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  v0 = (void *)RunningBoardServicesLibraryCore_frameworkLibrary_1;
  if (!RunningBoardServicesLibraryCore_frameworkLibrary_1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *RunningBoardServicesLibrary(void)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BSNSXPCTransport.m"), 29, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
  return v0;
}

void sub_19A7AEE64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, _Unwind_Exception *exception_object)
{
  void *v11;

  _Unwind_Resume(a1);
}

void RunningBoardServicesLibrary_2()
{
  void *v0;
  void *v1;
  void *v2;

  if (!RunningBoardServicesLibraryCore_frameworkLibrary_2)
    RunningBoardServicesLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  if (!RunningBoardServicesLibraryCore_frameworkLibrary_2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *RunningBoardServicesLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("BSXPCServiceConnection.m"), 32, CFSTR("%s"), 0);

    __break(1u);
    free(v1);
  }
}

void sub_19A7AEF8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, _Unwind_Exception *exception_object)
{
  void *v11;

  _Unwind_Resume(a1);
}

void ____emptyProtocol_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE3B5578);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD9C5F8;
  qword_1ECD9C5F8 = v0;

}

void sub_19A7AF07C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7AF12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_19A7AF20C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7AF55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19A7AFF24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19A7B040C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7B060C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

id BSServiceConnectionErrorCreate(unint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!(v5 | v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must provide underlyingXPCError or reason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSError * _Nonnull BSServiceConnectionErrorCreate(BSServiceConnectionErrorCode, xpc_object_t  _Nullable __strong, NSString * _Nullable __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v15 = v11;
      v16 = 2114;
      v17 = CFSTR("BSServiceConnectionErrors.m");
      v18 = 1024;
      v19 = 31;
      v20 = 2114;
      v21 = v10;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B0844);
  }
  v7 = (void *)v6;
  if (v5)
  {
    if (MEMORY[0x19AECADB4](v5) != MEMORY[0x1E0C81310])
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("underlyingXPCError must be of type XPC_TYPE_ERROR"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSError * _Nonnull BSServiceConnectionErrorCreate(BSServiceConnectionErrorCode, xpc_object_t  _Nullable __strong, NSString * _Nullable __strong)");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v15 = v13;
        v16 = 2114;
        v17 = CFSTR("BSServiceConnectionErrors.m");
        v18 = 1024;
        v19 = 32;
        v20 = 2114;
        v21 = v12;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

      }
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7B090CLL);
    }
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string((xpc_object_t)v5, (const char *)*MEMORY[0x1E0C81270]));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  BSServiceConnectionErrorCreateWithInfo(a1, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_19A7B0914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

id BSServiceConnectionErrorCreateWithInfo(unint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must provide reason"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSError * _Nonnull BSServiceConnectionErrorCreateWithInfo(BSServiceConnectionErrorCode, NSString *__strong _Nonnull, NSDictionary * _Nullable __strong)");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v13;
      v16 = 2114;
      v17 = CFSTR("BSServiceConnectionErrors.m");
      v18 = 1024;
      v19 = 42;
      v20 = 2114;
      v21 = v12;
      _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v14, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7B0B34);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "addEntriesFromDictionary:", v6);
  if (a1 > 4)
    v9 = CFSTR("(unknown)");
  else
    v9 = *(&off_1E390E040 + a1);
  objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x1E0D01298]);
  objc_msgSend(v8, "setObject:forKey:", v5, *MEMORY[0x1E0CB2D68]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BSServiceConnectionErrorDomain"), a1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void sub_19A7B0B3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7B0D68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B0FE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B12CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)BSXPCServiceConnection;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_19A7B134C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B17BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B1C44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id BSServiceInjectionLog()
{
  if (BSServiceInjectionLog_onceToken != -1)
    dispatch_once(&BSServiceInjectionLog_onceToken, &__block_literal_global_5);
  return (id)BSServiceInjectionLog___logObj;
}

void sub_19A7B21BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_19A7B2674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19A7B2D40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19A7B303C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19A7B32A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

id __protocolsToRemove()
{
  if (qword_1ECD9C5E0 != -1)
    dispatch_once(&qword_1ECD9C5E0, &__block_literal_global_3);
  return (id)_MergedGlobals_6;
}

void sub_19A7B33B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B35CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B3878(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ____disallowedValueClasses_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v3 = (void *)qword_1ECD9C5E8;
  qword_1ECD9C5E8 = v2;

}

void sub_19A7B39B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ____protocolsToRemove_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];

  v2[8] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1EE3B0818;
  v2[1] = &unk_1EE3B2B40;
  v2[2] = &unk_1EE3B16B0;
  v2[3] = &unk_1EE3AF580;
  v2[4] = &unk_1EE3B0B20;
  v2[5] = &unk_1EE3B0BE8;
  v2[6] = &unk_1EE3B2C40;
  v2[7] = &unk_1EE3B2CD8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = v0;

}

void sub_19A7B3C08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B3DB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B3FAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B4400(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7B4910(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7B4AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  uint64_t v20;

  _Block_object_dispose(&a15, 8);

  _Block_object_dispose((const void *)(v20 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19A7B4B60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B4EB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B5A90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_19A7B5F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

id BSServiceEndpointGrantNamespace()
{
  if (qword_1ECD9C618 != -1)
    dispatch_once(&qword_1ECD9C618, &__block_literal_global_5);
  return (id)qword_1ECD9C610;
}

id getRBSHereditaryGrantClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getRBSHereditaryGrantClass_softClass;
  v7 = getRBSHereditaryGrantClass_softClass;
  if (!getRBSHereditaryGrantClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRBSHereditaryGrantClass_block_invoke;
    v3[3] = &unk_1E390CE38;
    v3[4] = &v4;
    __getRBSHereditaryGrantClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A7B60E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getRBSAssertionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  RunningBoardServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("RBSAssertion");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1ECD9C590 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSAssertionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BSServiceConnectionEndpointInjector.m"), 28, CFSTR("Unable to find class %s"), "RBSAssertion");

    __break(1u);
  }
}

void sub_19A7B61C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

Class __getRBSAssertionClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  RunningBoardServicesLibrary_0();
  result = objc_getClass("RBSAssertion");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    _MergedGlobals_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  else
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    result = (Class)objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSAssertionClass(void)_block_invoke"), CFSTR("BSXPCServiceConnectionProxy.m"), 29, CFSTR("Unable to find class %s"), "RBSAssertion");
    __break(1u);
  }
  return result;
}

void __getRBSAssertionClass_block_invoke_1(uint64_t a1)
{
  void *v2;
  void *v3;

  RunningBoardServicesLibrary_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("RBSAssertion");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSAssertionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BSNSXPCTransport.m"), 30, CFSTR("Unable to find class %s"), "RBSAssertion");

    __break(1u);
  }
}

void sub_19A7B634C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void __getRBSHereditaryGrantClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  RunningBoardServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("RBSHereditaryGrant");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRBSHereditaryGrantClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSHereditaryGrantClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BSServiceConnectionEndpointInjector.m"), 30, CFSTR("Unable to find class %s"), "RBSHereditaryGrant");

    __break(1u);
  }
}

void sub_19A7B642C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7B6648(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B67F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B699C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B6B44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B6DE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B70CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7B7430(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7B7644(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19A7B7978(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7B7B68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_19A7B7E34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id *__decodedEndpoint(void *a1, void *a2, void *a3, char a4, int a5, void *a6, void *a7, void *a8, void *a9)
{
  BSServiceConnectionEndpoint *v16;
  id v17;
  id v18;
  __CFString *v19;
  id v20;
  id v21;
  id v22;
  BSServiceConnectionEndpoint *v23;
  id *v24;
  NSObject *v25;
  BSServiceConnectionEndpoint *v27;
  const __CFString *v28;
  int v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v16 = a1;
  v17 = a2;
  v18 = a3;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (v17)
  {
    if (v20)
    {
      v23 = v16;
      if (!v16)
        v23 = [BSServiceConnectionEndpoint alloc];
      v24 = -[BSServiceConnectionEndpoint _initWithEndpoint:oneshot:isNonLaunching:targetPID:targetDescription:service:instance:](v23, v17, v18, a4, a5, v19, v20, v21);
      if (!v16)

      goto LABEL_13;
    }
    BSServiceInjectionLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v28 = CFSTR("<null>");
      v29 = 138413570;
      if (v19)
        v28 = v19;
      v30 = v22;
      v31 = 2112;
      v32 = v17;
      v33 = 2112;
      v34 = v18;
      v35 = 2112;
      v36 = v28;
      v37 = 2112;
      v38 = 0;
      v39 = 2112;
      v40 = v21;
      _os_log_error_impl(&dword_19A799000, v25, OS_LOG_TYPE_ERROR, "BSServiceConnectionEndpoint: Unable to decode endpoint from %@ : endpoint=%@ oneshot=%@ (%@) service=%@ instance=%@", (uint8_t *)&v29, 0x3Eu);
    }
LABEL_12:

    v24 = 0;
    goto LABEL_13;
  }
  if (v19)
  {
    BSServiceInjectionLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v29 = 138413570;
      v30 = v22;
      v31 = 2112;
      v32 = 0;
      v33 = 2112;
      v34 = v18;
      v35 = 2112;
      v36 = v19;
      v37 = 2112;
      v38 = v20;
      v39 = 2112;
      v40 = v21;
      _os_log_error_impl(&dword_19A799000, v25, OS_LOG_TYPE_ERROR, "BSServiceConnectionEndpoint: Unable to decode endpoint from %@ : endpoint=%@ oneshot=%@ (%@) service=%@ instance=%@", (uint8_t *)&v29, 0x3Eu);
    }
    goto LABEL_12;
  }
  v27 = v16;
  if (!v16)
    v27 = [BSServiceConnectionEndpoint alloc];
  v24 = -[BSServiceConnectionEndpoint _initForNullEndpointWithService:instance:]((id *)v27, v20, v21);
  if (!v16)

LABEL_13:
  return v24;
}

void sub_19A7B8138(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (!v1)

  _Unwind_Resume(a1);
}

void sub_19A7B8A64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7B8F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  void *v26;
  void *v27;
  void *v28;

  _Unwind_Resume(a1);
}

void sub_19A7B90F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19A7B9580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_19A7B9AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{

  _Unwind_Resume(a1);
}

void sub_19A7B9D48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7B9EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  void *v11;

  a11.super_class = (Class)BSServiceConnectionEndpointInjector;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_19A7B9F3C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_19A7BA0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_19A7BA6B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_19A7BA8F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_19A7BB378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  _Unwind_Resume(a1);
}

id BSServiceConnectionEndpointTargetDescriptionForServiceLookup(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
  {
    v6 = getpid();
    __escaped(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("XPCService:%i:%@:%@"), v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = getpid();
    __escaped(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("XPCService:%i:%@"), v10, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void sub_19A7BB61C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7BB8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;

  _Unwind_Resume(a1);
}

void sub_19A7BBAC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7BBD54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7BBE9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19A7BC00C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7BC0B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19A7BC87C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19A7BCD8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19A7BD128(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7BD2C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7BD47C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7BD624(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7BD7CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7BD90C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __getRBSEndowmentGrantClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  RunningBoardServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("RBSEndowmentGrant");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSEndowmentGrantClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BSServiceConnectionEndpointInjector.m"), 29, CFSTR("Unable to find class %s"), "RBSEndowmentGrant");

    __break(1u);
  }
}

void sub_19A7BD9E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void BSSetServiceFeatureFlagResolver()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x19AECAA00]();
  v1 = (void *)__explicitResolver;
  __explicitResolver = v0;

}

void sub_19A7BDAC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7BDBA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7BF55C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_19A7C0FF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_19A7C1540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)BSNSXPCTransport;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_19A7C1AD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7C1CEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C1E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

id getRBSConstraintsAttributeClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getRBSConstraintsAttributeClass_softClass;
  v7 = getRBSConstraintsAttributeClass_softClass;
  if (!getRBSConstraintsAttributeClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRBSConstraintsAttributeClass_block_invoke;
    v3[3] = &unk_1E390CE38;
    v3[4] = &v4;
    __getRBSConstraintsAttributeClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19A7C1F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A7C20F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_19A7C21BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19A7C224C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C244C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C24AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C24F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C2534(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C26E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C2834(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7C28BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19A7C2AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _Unwind_Exception *exception_object, id a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_19A7C2D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _Unwind_Exception *exception_object, id a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_19A7C3048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _Unwind_Exception *exception_object, id a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_19A7C3250(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7C3418(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7C35FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7C379C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFString *NSStringFromBSServiceDomainStartType(unint64_t a1)
{
  if (a1 < 4)
    return off_1E390D3E0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%lu)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_19A7C3958(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7C3A54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C3C94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7C3D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19A7C3F70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  _Unwind_Resume(a1);
}

void sub_19A7C4020(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_19A7C420C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7C42F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19A7C43C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_19A7C4428(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C447C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C44C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C4530(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7C4668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_19A7C4818(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7C4890(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C49D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7C4A3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C4B84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7C4D24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C4EFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C5148(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7C51E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C54A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7C5874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19A7C5C80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7C5D60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C5F68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19A7C6038(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7C6134(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C7610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  void *v22;

  _Unwind_Resume(a1);
}

void sub_19A7C8028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, id a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void _dedupeOptions(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, id);
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v29 = a1;
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v11 = v7;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v35 != v13)
                objc_enumerationMutation(v11);
              _dedupeOptions(v10, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i), 0, v9);
            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
          }
          while (v12);
        }

        v15 = objc_msgSend(v10, "copy");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("option value of key %@ was of an unexpected type : %@"), v8, v7);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _dedupeOptions(__strong id, __strong id, NSString *__strong, id (^__strong)(__strong id<NSCopying>))");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v39 = v26;
            v40 = 2114;
            v41 = CFSTR("BSServicesConfiguration.m");
            v42 = 1024;
            v43 = 134;
            v44 = 2114;
            v45 = v25;
            _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

          }
          objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19A7C8588);
        }
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v16 = v7;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v31 != v18)
                objc_enumerationMutation(v16);
              v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
              objc_msgSend(v16, "objectForKey:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              _dedupeOptions(v10, v21, v20, v9);

            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
          }
          while (v17);
        }

        v15 = objc_msgSend(v10, "copy");
      }
      v22 = (void *)v15;

      v7 = v22;
    }
  }
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dictionary key \"%@\" is not a string"), v8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _dedupeOptions(__strong id, __strong id, NSString *__strong, id (^__strong)(__strong id<NSCopying>))");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v39 = v28;
        v40 = 2114;
        v41 = CFSTR("BSServicesConfiguration.m");
        v42 = 1024;
        v43 = 138;
        v44 = 2114;
        v45 = v27;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

      }
      objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7C8654);
    }
    v9[2](v9, v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKey:", v23, v24);

  }
  else
  {
    v9[2](v9, v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v23);
  }

}

void sub_19A7C865C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_19A7C8B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_19A7C8C80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_19A7C9068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_19A7C9494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19A7C9570(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C95C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C9680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_19A7C96F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19A7C9864(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7C9938(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C9998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19A7C9A14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C9AC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7C9B18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7C9BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_19A7C9DB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7CA07C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void ____vetProtocol_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v9)
  {
    v10 = objc_opt_new();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v17, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v7, "argumentName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ %@: %@"), v14, v15, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v16);

  }
  else
  {
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: %@"), v14, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v15);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

void sub_19A7CA244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

id BSServiceBootstrapLog()
{
  if (BSServiceBootstrapLog_onceToken != -1)
    dispatch_once(&BSServiceBootstrapLog_onceToken, &__block_literal_global_3);
  return (id)BSServiceBootstrapLog___logObj;
}

id BSServiceXPCBatchLog()
{
  if (BSServiceXPCBatchLog_onceToken != -1)
    dispatch_once(&BSServiceXPCBatchLog_onceToken, &__block_literal_global_9);
  return (id)BSServiceXPCBatchLog___logObj;
}

void sub_19A7CA4C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7CA558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19A7CA5CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7CA814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,void *a33)
{
  void *v33;

  _Unwind_Resume(a1);
}

void sub_19A7CA940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19A7CA9FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19A7CAEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,void *a42)
{
  void *v42;
  void *v43;
  void *v44;

  _Unwind_Resume(a1);
}

void sub_19A7CB138(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7CB2B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7CB44C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7CB518(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7CB588(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7CB770(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7CB9A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7CBA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19A7CC118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  void *v21;

  _Unwind_Resume(a1);
}

void sub_19A7CC520(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7CCBA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7CCD2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19A7CCDF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19A7CD120(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7CD284(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19A7CD5DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_19A7CD82C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7CD928(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7CDA34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7CDAFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7CDB94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7CDDC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19A7CDEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_19A7CDFC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7CE15C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_19A7CE2CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7CE474(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7CEFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

id __xpcInstance()
{
  if (qword_1ECD9C640 != -1)
    dispatch_once(&qword_1ECD9C640, &__block_literal_global_158);
  return (id)_MergedGlobals_8;
}

void sub_19A7CF338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  void *v20;

  _Unwind_Resume(a1);
}

void sub_19A7CF520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  void *v22;

  _Unwind_Resume(a1);
}

void sub_19A7CF6C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19A7CF86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  void *v9;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_19A7CFA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_19A7CFA88()
{
  JUMPOUT(0x19A7CFA7CLL);
}

void sub_19A7D097C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  _Unwind_Resume(a1);
}

void sub_19A7D1148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  void *v19;

  _Unwind_Resume(a1);
}

void sub_19A7D1258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_19A7D14D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19A7D17E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19A7D1948(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7D1AAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7D1B3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_19A7D1C30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7D1DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_19A7D1F6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7D213C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ____xpcInstance_block_invoke()
{
  char *v0;
  char *v1;
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = getenv("LaunchInstanceID");
  if (v0)
  {
    v1 = v0;
    v2 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "initWithUUIDString:");
    v4 = (void *)_MergedGlobals_8;
    _MergedGlobals_8 = v3;

  }
}

void sub_19A7D2248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

Class __getRBSProcessIdentityClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!qword_1ECD9C650)
    qword_1ECD9C650 = _sl_dlopen();
  if (!qword_1ECD9C650)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *RunningBoardServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("BSServiceDomain.m"), 30, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("RBSProcessIdentity");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSProcessIdentityClass(void)_block_invoke");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("BSServiceDomain.m"), 31, CFSTR("Unable to find class %s"), "RBSProcessIdentity");

LABEL_8:
    __break(1u);
  }
  qword_1ECD9C648 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19A7D23FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19A7D2560(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7D2740(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7D2938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  void *v11;

  a11.super_class = (Class)BSXPCServiceConnectionListener;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_19A7D2980(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_19A7D2C6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7D2FAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7D32FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7D383C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7D3F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  void *v19;

  _Unwind_Resume(a1);
}

void sub_19A7D470C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7D4DCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7D4F4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7D5100(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7D5294(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7D5524(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7D57FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7D5B04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7D5CE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7D5E88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ____handleEvent_block_invoke_184(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  BSServiceXPCErrorsLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_error_impl(&dword_19A799000, v2, OS_LOG_TYPE_ERROR, "%{public}@ Invalidating due to error %@", (uint8_t *)&v5, 0x16u);
  }

}

void sub_19A7D61E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7D6390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  void *v11;

  a11.super_class = (Class)BSServiceQuality;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_19A7D63D8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_19A7D64C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7D65C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7D6700(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7D68C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  void *v11;

  a11.super_class = (Class)BSServiceConnectionEndpointMonitor;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_19A7D6908(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_19A7D6E88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7D6F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19A7D70D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_19A7D728C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7D744C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  void *v11;

  a11.super_class = (Class)BSServiceConnectionListener;
  -[_Unwind_Exception dealloc](&a11, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_19A7D7494(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_19A7D7BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19A7D824C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7D8450(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7D8708(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7D8A10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7D8D18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7D8EF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7D9024(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7D91C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19A7D9274(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19A7D9D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *a10, id *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (v13)
  {

  }
  _Unwind_Resume(a1);
}

void sub_19A7D9FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19A7DA088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_19A7DA138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_19A7DA238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_19A7DA2BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7DA3C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7DA620(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19A7DA7C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7DAAF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19A7DAC74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7DAE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19A7DB038(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7DB0CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7DB44C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7DB5A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7DB614(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7DB76C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19A7DBD28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7DBF78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7DC178(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7DC358(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7DC5A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19A7DC648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19A7DC738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_19A7DC818(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7DC86C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7DC910(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7DC96C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7DC9D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id BSServiceConnectionEndpointTargetDescriptionForMachName(void *a1)
{
  __escaped(a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id BSServiceConnectionEndpointTargetDescriptionForServiceListener(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
  {
    v6 = getpid();
    __escaped(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("XPCServiceListener:%i:%@:%@"), v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = getpid();
    __escaped(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("XPCServiceListener:%i:%@"), v10, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void sub_19A7DCBB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id BSServiceConnectionEndpointTargetDescriptionForAnonymousDomain(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = getpid();
  __escaped(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%i:%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_19A7DCC60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7DCD9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7DCE44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7DCF54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19A7DD3E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7DD4D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7DD688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_19A7DD804(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19A7DD8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19A7DD92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19A7DD9A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19A7DE514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_19A7DEB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_19A7DED80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19A7DEFB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  if (a12)
  _Unwind_Resume(a1);
}

void sub_19A7DF140(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

Class __getRBSServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!qword_1ECD9C678)
    qword_1ECD9C678 = _sl_dlopen();
  if (!qword_1ECD9C678)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *RunningBoardServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("BSServiceConnectionEndpoint.m"), 31, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("RBSService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRBSServiceClass(void)_block_invoke");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("BSServiceConnectionEndpoint.m"), 32, CFSTR("Unable to find class %s"), "RBSService");

LABEL_8:
    __break(1u);
  }
  _MergedGlobals_10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19A7DF308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

const __CFString *NSStringFromBSServiceConnectionErrorCode(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("(unknown)");
  else
    return *(&off_1E390E040 + a1);
}

uint64_t BSAtomicGetFlag()
{
  return MEMORY[0x1E0D010D8]();
}

uint64_t BSAtomicSetFlag()
{
  return MEMORY[0x1E0D010E0]();
}

uint64_t BSClearTokenVar()
{
  return MEMORY[0x1E0D01128]();
}

uint64_t BSCreateDeserializedStringFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01168]();
}

uint64_t BSDispatchQueueAssertBarrier()
{
  return MEMORY[0x1E0D01218]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1E0D01220]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1E0D01238]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSObjCClassCreate()
{
  return MEMORY[0x1E0D01448]();
}

uint64_t BSPIDForXPCConnection()
{
  return MEMORY[0x1E0D01460]();
}

uint64_t BSSerializeStringToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01578]();
}

uint64_t BSStoreTokenFromMessageToVar()
{
  return MEMORY[0x1E0D015E8]();
}

uint64_t BSStoreTokenFromXPCConnectionToVar()
{
  return MEMORY[0x1E0D015F0]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
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

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1E0D018D8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1E0DE7A60](cls, protocol);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1E0DE7B10](block);
}

void method_invoke(void)
{
  MEMORY[0x1E0DE7B90]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

qos_class_t qos_class_main(void)
{
  return MEMORY[0x1E0C84F78]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int unsetenv(const char *a1)
{
  return MEMORY[0x1E0C859D0](a1);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

uint64_t xpc_bs_main()
{
  return MEMORY[0x1E0C85F10]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

uint64_t xpc_connection_create_bs_service_listener()
{
  return MEMORY[0x1E0C85F98]();
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FA0](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_get_bs_type()
{
  return MEMORY[0x1E0C85FD8]();
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1E0C85FE0](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x1E0C86020](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x1E0C86058]();
}

uint64_t xpc_connection_set_bs_type()
{
  return MEMORY[0x1E0C86068]();
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x1E0C86070](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
  MEMORY[0x1E0C86088](connection, finalizer);
}

uint64_t xpc_connection_set_oneshot_instance()
{
  return MEMORY[0x1E0C860A8]();
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

void xpc_connection_suspend(xpc_connection_t connection)
{
  MEMORY[0x1E0C860E0](connection);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C860E8](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x1E0C86238]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

uint64_t xpc_dictionary_handoff_reply()
{
  return MEMORY[0x1E0C862F0]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C863B0](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

uint64_t xpc_endpoint_compare()
{
  return MEMORY[0x1E0C863E8]();
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1E0C863F0](connection);
}

uint64_t xpc_endpoint_create_bs_named()
{
  return MEMORY[0x1E0C86408]();
}

uint64_t xpc_endpoint_create_bs_service()
{
  return MEMORY[0x1E0C86410]();
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

size_t xpc_hash(xpc_object_t object)
{
  return MEMORY[0x1E0C86538](object);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1E0C867F8](xuuid);
}

