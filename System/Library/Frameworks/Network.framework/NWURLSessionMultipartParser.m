@implementation NWURLSessionMultipartParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_boundarySuffixRecognizer, 0);
  objc_storeStrong((id *)&self->_headerRecognizer, 0);
  objc_storeStrong((id *)&self->_boundaryRecognizer, 0);
  objc_storeStrong((id *)&self->_parts, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_responseConsumer, 0);
  objc_storeStrong((id *)&self->_boundary, 0);
}

- (void)task:(void *)a3 handleMultipartData:(int)a4 complete:(void *)a5 error:(void *)a6 completionHandler:
{
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  dispatch_data_t concat;
  void *v19;
  NSObject *v20;
  dispatch_group_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  void (**v28)(_QWORD);
  id v29;
  NSObject *v30;
  void *v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  int v33;
  uint64_t v34;
  dispatch_data_t v35;
  dispatch_data_t subrange;
  int v37;
  uint64_t v38;
  void *v39;
  size_t v40;
  NSObject *v41;
  dispatch_data_t v42;
  void *v43;
  NSObject *v44;
  size_t size;
  id v46;
  id v47;
  size_t v48;
  id v49;
  _QWORD block[4];
  id v51;
  _QWORD *v52;
  _QWORD applier[5];
  id v54;
  uint64_t *v55;
  _QWORD *v56;
  size_t v57;
  _QWORD v58[5];
  NSObject *v59;
  id v60;
  _QWORD *v61;
  _QWORD v62[5];
  NSObject *v63;
  id v64;
  id v65;
  uint64_t *v66;
  _QWORD *v67;
  char v68;
  uint64_t v69;
  id *v70;
  uint64_t v71;
  void (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _QWORD aBlock[4];
  NSObject *v76;
  uint64_t v77;
  id v78;
  _QWORD *v79;
  _QWORD v80[5];
  id v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;

  v11 = a2;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (!a1)
    goto LABEL_34;
  v15 = *(NSObject **)(a1 + 40);
  if (v15)
  {
    size = dispatch_data_get_size(*(dispatch_data_t *)(a1 + 40));
    v16 = v12 != 0;
    if (!v12)
      goto LABEL_10;
    v17 = v15;
    concat = dispatch_data_create_concat(v17, v12);
    v19 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = concat;

  }
  else
  {
    size = 0;
    v48 = 0;
    v16 = v12 != 0;
    if (!v12)
      goto LABEL_12;
    v20 = v12;
    v17 = *(NSObject **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v20;
  }

  v15 = *(NSObject **)(a1 + 40);
  if (v15)
  {
LABEL_10:
    v48 = dispatch_data_get_size(v15);
    goto LABEL_12;
  }
  v48 = 0;
LABEL_12:
  v49 = v14;
  v82 = 0;
  v83 = &v82;
  v84 = 0x2020000000;
  v85 = 0;
  v21 = dispatch_group_create();
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x3032000000;
  v80[3] = __Block_byref_object_copy__47592;
  v80[4] = __Block_byref_object_dispose__47593;
  v46 = v13;
  v81 = v13;
  v22 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke;
  aBlock[3] = &unk_1E14A3308;
  v23 = v21;
  v76 = v23;
  v77 = a1;
  v47 = v11;
  v24 = v11;
  v78 = v24;
  v79 = v80;
  v25 = _Block_copy(aBlock);
  v69 = 0;
  v70 = (id *)&v69;
  v71 = 0x3042000000;
  v72 = __Block_byref_object_copy__54;
  v73 = __Block_byref_object_dispose__55;
  v74 = 0;
  v62[0] = v22;
  v62[1] = 3221225472;
  v62[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_56;
  v62[3] = &unk_1E14A3380;
  v66 = &v69;
  v67 = v80;
  v62[4] = a1;
  v68 = a4;
  v26 = v23;
  v63 = v26;
  v64 = v24;
  v27 = v25;
  v65 = v27;
  v28 = (void (**)(_QWORD))_Block_copy(v62);
  v58[0] = v22;
  v58[1] = 3221225472;
  v58[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_64;
  v58[3] = &unk_1E14A33D0;
  v58[4] = a1;
  v61 = v80;
  v29 = v27;
  v60 = v29;
  v30 = v12;
  v59 = v30;
  v31 = _Block_copy(v58);
  v32 = (void (**)(_QWORD, _QWORD, _QWORD))v31;
  if (v16)
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_68;
    applier[3] = &unk_1E14A33F8;
    v57 = size;
    applier[4] = a1;
    v55 = &v82;
    v54 = v31;
    v56 = v80;
    dispatch_data_apply(v30, applier);

  }
  if (!a4)
    goto LABEL_31;
  v33 = *(_DWORD *)(a1 + 12);
  if ((v33 - 2) < 3)
    goto LABEL_30;
  if (!v33)
  {
    subrange = dispatch_data_create_subrange(*(dispatch_data_t *)(a1 + 40), v83[3], v48 - v83[3]);
    if (!*(_BYTE *)(a1 + 8))
      ((void (**)(_QWORD, dispatch_data_t, _QWORD))v32)[2](v32, subrange, 0);
    v83[3] = v48;
    *(_DWORD *)(a1 + 12) = 3;

    goto LABEL_31;
  }
  if (v33 == 1)
  {
    v34 = *(_QWORD *)(a1 + 72);
    if (v34)
      v34 = *(_QWORD *)(v34 + 32);
    v35 = dispatch_data_create_subrange(*(dispatch_data_t *)(a1 + 40), v83[3], v48 - (*(_QWORD *)(a1 + 96) + v34) - v83[3]);
    if (*(_BYTE *)(a1 + 8))
    {
      v83[3] = v48;
    }
    else
    {
      ((void (**)(_QWORD, dispatch_data_t, _QWORD))v32)[2](v32, v35, 0);
      v37 = *(unsigned __int8 *)(a1 + 8);
      v83[3] = v48;
      if (!v37)
      {
LABEL_27:
        v38 = *(_QWORD *)(a1 + 56);
        if (v38)
        {
          *(_QWORD *)(v38 + 32) = 0;
          *(_QWORD *)(v38 + 40) = 0;
        }
        *(_DWORD *)(a1 + 12) = 3;

LABEL_30:
        v32[2](v32, MEMORY[0x1E0C80D00], 0);
        *(_DWORD *)(a1 + 12) = 3;
        goto LABEL_31;
      }
    }
    *(_BYTE *)(a1 + 8) = 0;
    goto LABEL_27;
  }
LABEL_31:
  v39 = *(void **)(a1 + 40);
  if (v39)
  {
    v40 = v83[3];
    v41 = v39;
    v42 = dispatch_data_create_subrange(v41, v40, v48 - v40);
    v43 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v42;

    v14 = v49;
  }
  objc_storeWeak(v70 + 5, v28);
  v28[2](v28);
  v44 = *(NSObject **)(a1 + 88);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_2_75;
  block[3] = &unk_1E14A3420;
  v52 = v80;
  v51 = v14;
  dispatch_group_notify(v26, v44, block);

  _Block_object_dispose(&v69, 8);
  objc_destroyWeak(&v74);

  _Block_object_dispose(v80, 8);
  _Block_object_dispose(&v82, 8);
  v13 = v46;
  v11 = v47;
LABEL_34:

}

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  NSObject *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (!gLogDatapath)
  {
    if (v7)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    if (!v8 && !(_DWORD)a3)
      goto LABEL_10;
    goto LABEL_7;
  }
  __nwlog_obj();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446978;
    v17 = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:]_block_invoke";
    v18 = 2112;
    v19 = v7;
    v20 = 1024;
    v21 = a3;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_182FBE000, v12, OS_LOG_TYPE_DEBUG, "%{public}s Delivering data %@, complete %{BOOL}d, error %@", buf, 0x26u);
  }

  if (!v7)
    goto LABEL_5;
LABEL_3:
  if (!dispatch_data_get_size(v7))
  {

    goto LABEL_5;
  }
LABEL_7:
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    v10 = *(void **)(v9 + 32);
  else
    v10 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_51;
  v13[3] = &unk_1E14A32E0;
  v11 = *(_QWORD *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 56);
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v10, "task:deliverData:complete:error:completionHandler:", v11, v7, a3, v8, v13);

LABEL_10:
}

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_56(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NWURLError *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  objc_super buf;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  if (!WeakRetained)
  {
    _os_crash();
    __break(1u);
  }
  v3 = WeakRetained;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[6];
  v5 = v4;
  objc_msgSend(v5, "firstObject");
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (gLogDatapath)
    {
      __nwlog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf.receiver) = 136446210;
        *(id *)((char *)&buf.receiver + 4) = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:compl"
                                             "etionHandler:]_block_invoke_2";
        _os_log_impl(&dword_182FBE000, v15, OS_LOG_TYPE_DEBUG, "%{public}s Delivering multipart response, waiting for disposition", (uint8_t *)&buf, 0xCu);
      }

    }
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(void **)(v7 + 32);
    else
      v8 = 0;
    v9 = *(_QWORD *)(a1 + 48);
    v10 = v6[1];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_60;
    v26[3] = &unk_1E14A3358;
    v26[4] = v7;
    v11 = v6;
    v12 = *(_QWORD *)(a1 + 72);
    v27 = v11;
    v31 = v12;
    v29 = *(id *)(a1 + 56);
    v28 = *(id *)(a1 + 40);
    v30 = v3;
    v13 = v8;
    objc_msgSend(v13, "task:deliverResponse:completionHandler:", v9, v10, v26);

    v14 = v27;
LABEL_9:

    goto LABEL_12;
  }
  if (!gLogDatapath)
  {
    if (!*(_BYTE *)(a1 + 80))
      goto LABEL_12;
    goto LABEL_19;
  }
  __nwlog_obj();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.receiver) = 136446210;
    *(id *)((char *)&buf.receiver + 4) = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completio"
                                         "nHandler:]_block_invoke";
    _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_DEBUG, "%{public}s Delivered all parts, returning", (uint8_t *)&buf, 0xCu);
  }

  if (*(_BYTE *)(a1 + 80))
  {
LABEL_19:
    v17 = *(_QWORD *)(a1 + 32);
    if ((!v17 || *(_DWORD *)(v17 + 12) != 3) && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      v22 = [NWURLError alloc];
      if (v22)
      {
        v23 = *MEMORY[0x1E0CB32E8];
        buf.receiver = v22;
        buf.super_class = (Class)NWURLError;
        v22 = (NWURLError *)objc_msgSendSuper2(&buf, sel_initWithDomain_code_userInfo_, v23, -1017, 0);
      }
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v22;

    }
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
      v19 = *(void **)(v18 + 32);
    else
      v19 = 0;
    v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_59;
    v32[3] = &unk_1E14A3330;
    v21 = *(_QWORD *)(a1 + 48);
    v33 = *(id *)(a1 + 40);
    objc_msgSend(v19, "task:deliverData:complete:error:completionHandler:", v21, 0, 1, v20, v32);
    v14 = v33;
    goto LABEL_9;
  }
LABEL_12:

}

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_64(_QWORD *a1, void *a2, _BOOL4 a3)
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  size_t size;
  int v9;
  uint64_t v10;
  dispatch_data_t subrange;
  uint64_t v12;
  int v13;
  id v14;
  NSObject *v15;
  NWURLSessionMultipartContent *v16;
  NSObject *v17;
  NWURLSessionMultipartContent *v18;
  objc_class *v19;
  uint64_t v20;
  NWURLError *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  OS_dispatch_data *v27;
  _BOOL4 complete;
  NWURLError *error;
  _QWORD applier[7];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _BYTE v39[22];
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  NWURLError *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a3)
    goto LABEL_5;
  v7 = a1[4];
  if (!v7)
    goto LABEL_5;
  if (!*(_BYTE *)(v7 + 9))
  {
    *(_BYTE *)(v7 + 9) = 1;
LABEL_5:
    size = dispatch_data_get_size(v5);
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_2;
    applier[3] = &unk_1E14A33A8;
    applier[5] = &v31;
    applier[6] = size;
    applier[4] = &v35;
    dispatch_data_apply(v6, applier);
    v9 = *((unsigned __int8 *)v36 + 24);
    if (v9 == 13)
      goto LABEL_9;
    if (v9 != 10)
      goto LABEL_11;
    if (*((_BYTE *)v32 + 24) != 13)
LABEL_9:
      v10 = -1;
    else
      v10 = -2;
    subrange = dispatch_data_create_subrange(v6, 0, v10 + size);

    v6 = subrange;
LABEL_11:
    v12 = a1[4];
    if (!v12)
      goto LABEL_15;
    v13 = *(_DWORD *)(v12 + 16);
    if (v13 == 1)
    {
      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      if (!v13)
      {
        v12 = *(_QWORD *)(v12 + 48);
LABEL_15:
        v14 = (id)v12;
        objc_msgSend(v14, "lastObject");
        v15 = objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = [NWURLSessionMultipartContent alloc];
          v17 = v6;
          if (v16)
          {
            *(_QWORD *)v39 = v16;
            *(_QWORD *)&v39[8] = NWURLSessionMultipartContent;
            v18 = (NWURLSessionMultipartContent *)objc_msgSendSuper2((objc_super *)v39, sel_init);
            v16 = v18;
            if (v18)
            {
              objc_storeStrong((id *)&v18->_data, v6);
              v16->_complete = a3;
              objc_storeStrong((id *)&v16->_error, 0);
            }
          }

          v19 = v15[2].isa;
          -[objc_class addObject:](v19, "addObject:", v16);

          if (gLogDatapath)
          {
            __nwlog_obj();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              if (v16)
              {
                v27 = v16->_data;
                complete = v16->_complete;
                error = v16->_error;
              }
              else
              {
                complete = 0;
                v27 = 0;
                error = 0;
              }
              *(_DWORD *)v39 = 136446978;
              *(_QWORD *)&v39[4] = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandl"
                                   "er:]_block_invoke";
              *(_WORD *)&v39[12] = 2112;
              *(_QWORD *)&v39[14] = v27;
              v40 = 1024;
              v41 = complete;
              v42 = 2112;
              v43 = error;
              _os_log_impl(&dword_182FBE000, v26, OS_LOG_TYPE_DEBUG, "%{public}s Created NWURLSessionMultipartContent, body %@, complete %{BOOL}d, error %@", v39, 0x26u);

            }
          }

        }
        else
        {
          if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
          {
            v21 = [NWURLError alloc];
            if (v21)
            {
              v22 = *MEMORY[0x1E0CB32E8];
              *(_QWORD *)v39 = v21;
              *(_QWORD *)&v39[8] = NWURLError;
              v21 = (NWURLError *)objc_msgSendSuper2((objc_super *)v39, sel_initWithDomain_code_userInfo_, v22, -1017, 0);
            }
            v23 = *(_QWORD *)(a1[7] + 8);
            v24 = *(void **)(v23 + 40);
            *(_QWORD *)(v23 + 40) = v21;

          }
          v25 = a1[4];
          v15 = 0;
          if (v25)
            *(_DWORD *)(v25 + 12) = 3;
        }
LABEL_31:

        goto LABEL_32;
      }
      if (gLogDatapath)
      {
        __nwlog_obj();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v20 = a1[5];
          *(_DWORD *)v39 = 136446722;
          *(_QWORD *)&v39[4] = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:]_block_invoke";
          *(_WORD *)&v39[12] = 2112;
          *(_QWORD *)&v39[14] = v20;
          v40 = 1024;
          v41 = a3;
          _os_log_impl(&dword_182FBE000, v15, OS_LOG_TYPE_DEBUG, "%{public}s Discarding content, body %@, complete %{BOOL}d", v39, 0x1Cu);
        }
        goto LABEL_31;
      }
    }
LABEL_32:
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
  }

}

uint64_t __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_68(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  int v12;
  _QWORD *v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v43;
  char v44;
  unsigned __int8 *v45;
  int v46;
  uint64_t v47;
  _BYTE *v48;
  uint64_t v49;
  size_t v50;
  uint64_t v51;
  unint64_t v52;
  NSObject *v53;
  uint64_t v54;
  size_t v55;
  dispatch_data_t subrange;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  NWURLSessionMultipartPart *v71;
  id v72;
  NWURLSessionMultipartPart *v73;
  NSMutableArray *v74;
  NSMutableArray *data;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  void *v82;
  NSObject *v83;
  os_log_type_t v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  const char *v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  NWURLError *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  char *backtrace_string;
  NSObject *v106;
  os_log_type_t v107;
  _BOOL4 v108;
  uint64_t v109;
  os_log_type_t v110;
  uint64_t v111;
  unsigned __int8 *v112;
  int v113;
  int v115;
  uint64_t v117;
  _DWORD *v118;
  int v119;
  uint64_t v120;
  uint64_t v121;
  _QWORD *v122;
  uint64_t v123;
  size_t v124;
  uint64_t v125;
  NSObject *v126;
  dispatch_data_t v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  void *v131;
  uint64_t v132;
  _QWORD *v133;
  uint64_t v134;
  _QWORD *v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  _DWORD *v139;
  uint64_t v140;
  uint64_t v141;
  _BYTE *v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  char v150;
  os_log_type_t type;
  _BYTE v152[22];
  __int16 v153;
  uint64_t v154;
  __int16 v155;
  uint64_t v156;
  __int16 v157;
  char *v158;
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  v147 = a2;
  if (a5)
  {
    v9 = 0;
    v149 = a3 + 1;
    v145 = *MEMORY[0x1E0CB32E8];
    v146 = a5;
    v148 = a4;
    while (1)
    {
      v11 = a1[4];
      if (!v11)
      {
LABEL_3:
        v10 = 0;
LABEL_4:

        goto LABEL_5;
      }
      v12 = *(_DWORD *)(v11 + 12);
      if (v12 == 2)
      {
        v43 = *(_QWORD *)(v11 + 64);
        if (!v43
          || (v44 = *(_BYTE *)(a4 + v9),
              *(_BYTE *)(v43 + 8) = *(_BYTE *)(v43 + 9),
              *(_BYTE *)(v43 + 9) = v44,
              (v11 = a1[4]) != 0))
        {
          v45 = (unsigned __int8 *)*(id *)(v11 + 64);
          if (v45)
          {
            v46 = v45[9];

            if (v46 == 10)
            {
              v47 = a1[4];
              if (v47 && (v48 = *(id *)(v47 + 64)) != 0)
              {
                if (v48[8] == 13)
                  v49 = 2;
                else
                  v49 = 1;

              }
              else
              {
                v49 = 0;
              }
              v50 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
              v51 = a1[4];
              v52 = a5;
              if (v51)
                v53 = *(NSObject **)(v51 + 40);
              else
                v53 = 0;
              v54 = v149 + v9 + a1[8];
              v55 = v50 + v49;
              subrange = dispatch_data_create_subrange(v53, v50, v54 - v55);
              v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", subrange, 5);
              v58 = v57;
              if (v54 == v55)
              {
                v59 = a1[4];
                if (v59)
                  v60 = *(void **)(v59 + 32);
                else
                  v60 = 0;
                objc_msgSend(v60, "response", v143, v144);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "allHeaderFields");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = (void *)objc_msgSend(v62, "mutableCopy");

                v64 = a1[4];
                if (v64)
                  v65 = *(_QWORD *)(v64 + 80);
                else
                  v65 = 0;
                objc_msgSend(v63, "addEntriesFromDictionary:", v65);
                v66 = objc_alloc(MEMORY[0x1E0C92C18]);
                objc_msgSend(v61, "URL");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                v68 = (void *)objc_msgSend(v66, "initWithURL:statusCode:HTTPVersion:headerFields:", v67, objc_msgSend(v61, "statusCode"), 0, v63);

                v69 = a1[4];
                if (v69)
                  v70 = *(void **)(v69 + 80);
                else
                  v70 = 0;
                objc_msgSend(v70, "removeAllObjects");
                v71 = [NWURLSessionMultipartPart alloc];
                v72 = v68;
                if (v71)
                {
                  *(_QWORD *)v152 = v71;
                  *(_QWORD *)&v152[8] = NWURLSessionMultipartPart;
                  v73 = (NWURLSessionMultipartPart *)objc_msgSendSuper2((objc_super *)v152, sel_init);
                  v71 = v73;
                  if (v73)
                  {
                    objc_storeStrong((id *)&v73->_response, v68);
                    v74 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    data = v71->_data;
                    v71->_data = v74;

                  }
                }

                v76 = a1[4];
                if (v76)
                  v77 = *(void **)(v76 + 48);
                else
                  v77 = 0;
                objc_msgSend(v77, "addObject:", v71);
                v78 = a1[4];
                if (v78)
                {
                  *(_DWORD *)(v78 + 12) = 0;
                  v79 = a1[4];
                  if (v79)
                    *(_DWORD *)(v79 + 16) = 0;
                }

                a5 = v146;
              }
              else
              {
                v94 = objc_msgSend(v57, "rangeOfString:", CFSTR(":"));
                if (v94 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
                  {
                    v95 = [NWURLError alloc];
                    if (v95)
                    {
                      *(_QWORD *)v152 = v95;
                      *(_QWORD *)&v152[8] = NWURLError;
                      v95 = (NWURLError *)objc_msgSendSuper2((objc_super *)v152, sel_initWithDomain_code_userInfo_, v145, -1017, 0);
                    }
                    v96 = *(_QWORD *)(a1[7] + 8);
                    v97 = *(void **)(v96 + 40);
                    *(_QWORD *)(v96 + 40) = v95;

                  }
                  v98 = a1[4];
                  if (v98)
                    *(_DWORD *)(v98 + 12) = 3;
                }
                objc_msgSend(v58, "substringToIndex:", v94, v143, v144);
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v99, "stringByTrimmingCharactersInSet:", v100);
                v61 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v58, "substringFromIndex:", v94 + 1);
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v101, "stringByTrimmingCharactersInSet:", v102);
                v63 = (void *)objc_claimAutoreleasedReturnValue();

                v103 = a1[4];
                if (v103)
                  v104 = *(void **)(v103 + 80);
                else
                  v104 = 0;
                a5 = v52;
                objc_msgSend(v104, "setObject:forKeyedSubscript:", v63, v61);
              }

              *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v149 + v9 + a1[8];
              a4 = v148;
            }
          }
        }
        goto LABEL_5;
      }
      if (v12 == 1)
        break;
      if (v12)
        goto LABEL_5;
      v13 = *(id *)(v11 + 56);
      if (v13)
      {
        v14 = *(_BYTE *)(a4 + v9);
        v15 = v13[5];
        v16 = v13[3];
        v17 = (v15 + 1) % v16;
        if (v17 == v13[4])
        {
          if (v17 + 1 == v16)
            v18 = 0;
          else
            v18 = v17 + 1;
          v13[4] = v18;
        }
        *(_BYTE *)(v13[2] + v15) = v14;
        v13[5] = (unint64_t)(v13[5] + 1) % v13[3];

      }
      v19 = a1[4];
      if (!v19)
        goto LABEL_3;
      v20 = *(id *)(v19 + 56);
      v10 = v20;
      if (!v20 || (unint64_t)(*((_QWORD *)v20 + 5) + 1) % *((_QWORD *)v20 + 3) != *((_QWORD *)v20 + 4))
        goto LABEL_4;
      v21 = *((id *)v20 + 1);
      v22 = (char *)objc_msgSend(v21, "cStringUsingEncoding:", 1);
      v23 = objc_msgSend(v21, "lengthOfBytesUsingEncoding:", 1);
      if (!v23)
        goto LABEL_74;
      v24 = v10[3];
      v25 = v10[4];
      v26 = v10[2];
      if (*(unsigned __int8 *)(v26 + v25 % v24) == *v22)
      {
        v27 = v23;
        v28 = 0;
        v29 = v25 + 1;
        while (v23 - 1 != v28)
        {
          v30 = *(unsigned __int8 *)(v26 + (v29 + v28) % v24);
          v31 = v22[++v28];
          if (v30 != v31)
          {

            if (v28 < v27)
              goto LABEL_5;
            goto LABEL_75;
          }
        }
LABEL_74:

LABEL_75:
        v89 = a1[4];
        if (v89)
        {
          v90 = *(id *)(v89 + 56);
          if (v90)
          {
            v90[4] = 0;
            v90[5] = 0;

          }
          v91 = a1[4];
          if (v91)
          {
            v92 = *(id *)(v91 + 72);
            if (v92)
            {
              v92[4] = 0;
              v92[2] = 0;
              *((_BYTE *)v92 + 8) = 0;
              *((_DWORD *)v92 + 3) = 4;

            }
          }
        }
        v93 = a1[4];
        if (v93)
          *(_DWORD *)(v93 + 12) = 1;
        goto LABEL_5;
      }

LABEL_5:
      if (++v9 >= a5)
        goto LABEL_174;
    }
    v32 = *(_QWORD *)(v11 + 72);
    if (!v32)
      goto LABEL_121;
    if (*(_DWORD *)(v32 + 12) != 4 || (v33 = *(_QWORD *)(v32 + 32), v33 >= 2))
    {
      _os_crash();
      __break(1u);
    }
    *(_BYTE *)(*(_QWORD *)(v32 + 24) + v33) = *(_BYTE *)(a4 + v9);
    v34 = *(_QWORD *)(v32 + 32);
    v35 = __CFADD__(v34, 1);
    v36 = v34 + 1;
    v37 = v35;
    v38 = v37 << 63 >> 63;
    *(_QWORD *)(v32 + 32) = v36;
    if (v38 == v37 && (v38 & 0x8000000000000000) == 0)
    {
      if (v36 == 1)
      {
        v39 = **(unsigned __int8 **)(v32 + 24);
        v40 = v39 > 0x2D;
        v41 = (1 << v39) & 0x200000002400;
        if (!v40 && v41 != 0)
        {
LABEL_121:
          v117 = a1[4];
          if (!v117)
            goto LABEL_158;
          goto LABEL_125;
        }
        goto LABEL_123;
      }
LABEL_108:
      v112 = *(unsigned __int8 **)(v32 + 24);
      v113 = *v112;
      if (v113 == 13 || v113 == 10)
      {
        *(_DWORD *)(v32 + 12) = 2;
        v115 = v112[1];
        if (v115 != 13 && v115 != 10)
        {
          *(_QWORD *)(v32 + 16) = 1;
          goto LABEL_124;
        }
      }
      else
      {
        if (v112[1] != 45)
        {
LABEL_123:
          *(_DWORD *)(v32 + 12) = 2;
          *(_QWORD *)(v32 + 16) = 0;
LABEL_124:
          *(_BYTE *)(v32 + 8) = 1;
          v117 = a1[4];
          if (!v117)
            goto LABEL_158;
LABEL_125:
          v118 = *(id *)(v117 + 72);
          if (!v118 || (v119 = v118[3], v118, v119 != 4))
          {
            v120 = a1[4];
            if (v120)
            {
              v121 = *(_QWORD *)(v120 + 96);
              v122 = *(id *)(v120 + 72);
              if (v122)
              {
                v123 = v122[4];

              }
              else
              {
                v123 = 0;
              }
            }
            else
            {
LABEL_158:
              v121 = 0;
              v123 = 0;
            }
            v125 = a1[4];
            if (v125)
              v126 = *(NSObject **)(v125 + 40);
            else
              v126 = 0;
            v124 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
            v127 = dispatch_data_create_subrange(v126, v124, v149 + v9 + a1[8] - (v121 + v123) - v124);
            v128 = a1[4];
            if (v128 && *(_BYTE *)(v128 + 8))
            {
              v129 = a1[8];
              goto LABEL_136;
            }
            (*(void (**)(void))(a1[5] + 16))();
            v128 = a1[4];
            v129 = a1[8];
            if (v128)
            {
LABEL_136:
              v130 = *(id *)(v128 + 72);
              v131 = v130;
              if (v130)
              {
                v132 = *((_QWORD *)v130 + 4);
                v128 = a1[4];
                if (v128)
                {
LABEL_138:
                  v133 = *(id *)(v128 + 72);
                  if (v133)
                    v128 = v133[2];
                  else
                    v128 = 0;
LABEL_140:
                  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v149 + v9 + v129 - v132 + v128;

                  v134 = a1[4];
                  if (v134)
                  {
                    if (!*(_BYTE *)(v134 + 8) || (*(_BYTE *)(v134 + 8) = 0, (v134 = a1[4]) != 0))
                    {
                      v135 = *(id *)(v134 + 56);
                      if (v135)
                      {
                        v135[4] = 0;
                        v135[5] = 0;

                      }
                    }
                  }
                  v136 = a1[4];
                  if (!v136)
                    goto LABEL_160;
                  v137 = (char *)*(id *)(v136 + 72);
                  if (v137)
                  {
                    v138 = v137[8];

                    v9 -= v138;
                  }
                  v136 = a1[4];
                  if (v136)
                  {
                    v139 = *(id *)(v136 + 72);
                    if (v139)
                      LODWORD(v136) = v139[3];
                    else
                      LODWORD(v136) = 0;
                  }
                  else
                  {
LABEL_160:
                    v139 = 0;
                  }
                  v140 = a1[4];
                  if (v140)
                    *(_DWORD *)(v140 + 12) = v136;

                  goto LABEL_5;
                }
              }
              else
              {
                v132 = 0;
                v128 = a1[4];
                if (v128)
                  goto LABEL_138;
              }
              v133 = 0;
              goto LABEL_140;
            }
            v132 = 0;
            v131 = 0;
            v133 = 0;
            goto LABEL_140;
          }
          goto LABEL_5;
        }
        *(_DWORD *)(v32 + 12) = 3;
      }
      *(_QWORD *)(v32 + 16) = 2;
      *(_BYTE *)(v32 + 8) = 0;
      goto LABEL_121;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v80 = (id)gLogObj;
    v81 = *(_QWORD *)(v32 + 32);
    *(_DWORD *)v152 = 136446978;
    *(_QWORD *)&v152[4] = "-[NWURLSessionMultipartPartBoundarySuffixRecognizer consumeCharacter:]";
    *(_WORD *)&v152[12] = 2082;
    *(_QWORD *)&v152[14] = "_count";
    v153 = 2048;
    v154 = 1;
    v155 = 2048;
    v156 = v81;
    LODWORD(v144) = 42;
    v143 = v152;
    v82 = (void *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v150 = 0;
    if (!__nwlog_fault((const char *)v82, &type, &v150))
    {
LABEL_105:
      if (!v82)
      {
LABEL_107:
        *(_QWORD *)(v32 + 32) = -1;
        goto LABEL_108;
      }
LABEL_106:
      free(v82);
      goto LABEL_107;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v83 = (id)gLogObj;
      v84 = type;
      if (!os_log_type_enabled(v83, type))
      {
LABEL_104:

        goto LABEL_105;
      }
      v85 = *(_QWORD *)(v32 + 32);
      *(_DWORD *)v152 = 136446978;
      *(_QWORD *)&v152[4] = "-[NWURLSessionMultipartPartBoundarySuffixRecognizer consumeCharacter:]";
      *(_WORD *)&v152[12] = 2082;
      *(_QWORD *)&v152[14] = "_count";
      v153 = 2048;
      v154 = 1;
      v155 = 2048;
      v156 = v85;
      v86 = v83;
      v87 = v84;
      v88 = "%{public}s Overflow: %{public}s, increment %llu, result %llu";
    }
    else
    {
      if (v150)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v106 = (id)gLogObj;
        v107 = type;
        v108 = os_log_type_enabled(v106, type);
        if (backtrace_string)
        {
          if (v108)
          {
            v109 = *(_QWORD *)(v32 + 32);
            *(_DWORD *)v152 = 136447234;
            *(_QWORD *)&v152[4] = "-[NWURLSessionMultipartPartBoundarySuffixRecognizer consumeCharacter:]";
            *(_WORD *)&v152[12] = 2082;
            *(_QWORD *)&v152[14] = "_count";
            v153 = 2048;
            v154 = 1;
            v155 = 2048;
            v156 = v109;
            v157 = 2082;
            v158 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v106, v107, "%{public}s Overflow: %{public}s, increment %llu, result %llu, dumping backtrace:%{public}s", v152, 0x34u);
          }

          free(backtrace_string);
          if (!v82)
            goto LABEL_107;
        }
        else
        {
          if (v108)
          {
            v141 = *(_QWORD *)(v32 + 32);
            *(_DWORD *)v152 = 136446978;
            *(_QWORD *)&v152[4] = "-[NWURLSessionMultipartPartBoundarySuffixRecognizer consumeCharacter:]";
            *(_WORD *)&v152[12] = 2082;
            *(_QWORD *)&v152[14] = "_count";
            v153 = 2048;
            v154 = 1;
            v155 = 2048;
            v156 = v141;
            _os_log_impl(&dword_182FBE000, v106, v107, "%{public}s Overflow: %{public}s, increment %llu, result %llu, no backtrace", v152, 0x2Au);
          }

          if (!v82)
            goto LABEL_107;
        }
        goto LABEL_106;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v83 = (id)gLogObj;
      v110 = type;
      if (!os_log_type_enabled(v83, type))
        goto LABEL_104;
      v111 = *(_QWORD *)(v32 + 32);
      *(_DWORD *)v152 = 136446978;
      *(_QWORD *)&v152[4] = "-[NWURLSessionMultipartPartBoundarySuffixRecognizer consumeCharacter:]";
      *(_WORD *)&v152[12] = 2082;
      *(_QWORD *)&v152[14] = "_count";
      v153 = 2048;
      v154 = 1;
      v155 = 2048;
      v156 = v111;
      v86 = v83;
      v87 = v110;
      v88 = "%{public}s Overflow: %{public}s, increment %llu, result %llu, backtrace limit exceeded";
    }
    _os_log_impl(&dword_182FBE000, v86, v87, v88, v152, 0x2Au);
    goto LABEL_104;
  }
LABEL_174:

  return 1;
}

uint64_t __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_2_75(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v2 = (id)gLogObj;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v5 = 136446466;
    v6 = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_182FBE000, v2, OS_LOG_TYPE_INFO, "%{public}s Completing with error %@", (uint8_t *)&v5, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_2(_QWORD *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;

  v5 = a1[6];
  if (v5)
  {
    v6 = a5 + a3;
    v7 = v5 - 1 < a3 || v5 - 1 >= v6;
    if (!v7)
    {
      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = *(_BYTE *)(a4 + v5 - 1 - a3);
      v5 = a1[6];
    }
    v7 = v5 >= 2;
    v8 = v5 - 2;
    if (v7 && v8 >= a3 && v8 < v6)
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(a4 + v8 - a3);
  }
  return 1;
}

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_59(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_60(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  NWURLError *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  id *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[22];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (gLogDatapath)
  {
    __nwlog_obj();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v37 = 136446466;
      *(_QWORD *)&v37[4] = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:]_block_invoke";
      *(_WORD *)&v37[12] = 2048;
      *(_QWORD *)&v37[14] = a2;
      _os_log_impl(&dword_182FBE000, v31, OS_LOG_TYPE_DEBUG, "%{public}s Received disposition %ld", v37, 0x16u);
    }

    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      goto LABEL_3;
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
LABEL_3:
      v8 = *(void **)(v7 + 48);
      goto LABEL_4;
    }
  }
  v8 = 0;
LABEL_4:
  objc_msgSend(v8, "removeObject:", *(_QWORD *)(a1 + 40));
  if (!a2)
  {
    v10 = [NWURLError alloc];
    if (v10)
    {
      v11 = *MEMORY[0x1E0CB32E8];
      *(_QWORD *)v37 = v10;
      *(_QWORD *)&v37[8] = NWURLError;
      v10 = (NWURLError *)objc_msgSendSuper2((objc_super *)v37, sel_initWithDomain_code_userInfo_, v11, -999, 0);
    }
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v13 = *(_QWORD **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v10;
    v9 = 2;
    goto LABEL_27;
  }
  if (a2 == 1)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v16 = *(_QWORD *)(v14 + 40);
    v15 = (id *)(v14 + 40);
    if (!v16)
      objc_storeStrong(v15, a3);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v17 = *(_QWORD **)(a1 + 40);
    if (v17)
      v17 = (_QWORD *)v17[2];
    v13 = v17;
    v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v33;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v13);
          v22 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v21);
          v23 = *(_QWORD *)(a1 + 56);
          if (v22)
          {
            v24 = *(id *)(v22 + 16);
            v25 = *(_BYTE *)(v22 + 8) != 0;
            v26 = *(_QWORD *)(v22 + 24);
          }
          else
          {
            v25 = 0;
            v24 = 0;
            v26 = 0;
          }
          (*(void (**)(uint64_t, id, _BOOL8, uint64_t))(v23 + 16))(v23, v24, v25, v26);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v19);
    }
    v9 = 1;
LABEL_27:

    goto LABEL_28;
  }
  if ((unint64_t)(a2 - 2) < 2)
  {
    _os_crash();
    __break(1u);
    return;
  }
  v9 = 2;
LABEL_28:
  v27 = *(_QWORD *)(a1 + 32);
  if (v27)
  {
    if (!objc_msgSend(*(id *)(v27 + 48), "count"))
      goto LABEL_30;
  }
  else if (!objc_msgSend(0, "count"))
  {
LABEL_30:
    v28 = *(_QWORD *)(a1 + 32);
    if (v28)
      *(_DWORD *)(v28 + 16) = v9;
  }
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = *(_QWORD *)(a1 + 40);
  if (v30)
    objc_storeStrong((id *)(v30 + 16), v29);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64));

}

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_51(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (gLogDatapath)
  {
    __nwlog_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136446466;
      v10 = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:]_block_invoke";
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_DEBUG, "%{public}s Delivered data, error %@", (uint8_t *)&v9, 0x16u);
    }

  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  if (!v7)
    objc_storeStrong(v6, a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

@end
