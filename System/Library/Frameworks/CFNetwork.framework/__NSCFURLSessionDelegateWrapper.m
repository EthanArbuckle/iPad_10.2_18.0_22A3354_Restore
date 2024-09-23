@implementation __NSCFURLSessionDelegateWrapper

- (id)initWithSession:(id *)a1
{
  _QWORD *v3;
  id *v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)__NSCFURLSessionDelegateWrapper;
    v4 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v4;
    if (v4)
    {
      v4[5] = v3;
      if (v3)
        v5 = (void *)v3[15];
      else
        v5 = 0;
      objc_storeStrong(v4 + 6, v5);
    }
  }

  return a1;
}

- (void)setFallbackDelegateWrapper:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)task:(void *)a3 didFinishCollectingMetrics:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  const char *v9;
  void (**v10)(_QWORD);
  const char *v11;
  id v12;
  char v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(_QWORD);

  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (a1)
  {
    v12 = objc_getProperty((id)a1, v9, 32, 1);
    if ((*(_BYTE *)(a1 + 9) & 0x20) != 0)
    {
      if ((*(_BYTE *)(a1 + 15) & 1) != 0)
        goto LABEL_4;
    }
    else
    {
      objc_getProperty((id)a1, v11, 32, 1);
      v13 = *(_BYTE *)(a1 + 15) & 0xFE | objc_opt_respondsToSelector() & 1;
      *(_BYTE *)(a1 + 15) = v13;
      *(_BYTE *)(a1 + 9) |= 0x20u;
      if ((v13 & 1) != 0)
      {
LABEL_4:
        v14 = *(id *)(a1 + 40);
        v15 = *(id *)(a1 + 48);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __85____NSCFURLSessionDelegateWrapper_task_didFinishCollectingMetrics_completionHandler___block_invoke;
        v19[3] = &unk_1E14F6398;
        v20 = v12;
        v21 = v14;
        v22 = v7;
        v23 = v8;
        v24 = v15;
        v25 = v10;
        v16 = v15;
        v17 = v14;
        -[NSURLSession runDelegateBlock:]((uint64_t)v17, v19);

LABEL_9:
        goto LABEL_10;
      }
    }
    v18 = *(_QWORD *)(a1 + 24);
    if (v18)
      -[__NSCFURLSessionDelegateWrapper task:didFinishCollectingMetrics:completionHandler:](v18, v7, v8, v10);
    else
      v10[2](v10);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)dataTask:(void *)a3 didReceiveResponse:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  id v14;
  _QWORD *v15;
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (a1)
  {
    v11 = objc_getProperty((id)a1, v9, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check_didReceiveResponse]((unsigned __int8 *)a1, v12))
    {
      v13 = *(id *)(a1 + 40);
      v14 = *(id *)(a1 + 48);
      v15 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_dataTask_didReceiveResponse_completionHandler_, v11);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __81____NSCFURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke;
      v20[3] = &unk_1E14F63E8;
      v21 = v11;
      v16 = v13;
      v22 = v16;
      v23 = v7;
      v24 = v8;
      v25 = v15;
      v17 = v14;
      v26 = v17;
      v27 = v10;
      v18 = v15;
      -[NSURLSession runDelegateBlock:]((uint64_t)v16, v20);

    }
    else
    {
      v19 = *(_QWORD *)(a1 + 24);
      if (v19)
        -[__NSCFURLSessionDelegateWrapper dataTask:didReceiveResponse:completionHandler:](v19, v7, v8, v10);
      else
        (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
    }

  }
}

- (uint64_t)check_didReceiveResponse
{
  unsigned __int8 *v2;
  char v3;

  if (self)
  {
    v2 = self;
    if ((char)self[10] < 0)
    {
      LODWORD(self) = (self[16] >> 2) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if ((self & 1) != 0)
        v3 = 4;
      else
        v3 = 0;
      v2[16] = v2[16] & 0xFB | v3;
      v2[10] |= 0x80u;
    }
  }
  return self & 1;
}

- (uint64_t)didReceiveResponse
{
  uint64_t v2;
  const char *v3;

  if (result)
  {
    v2 = result;
    if ((-[__NSCFURLSessionDelegateWrapper check_didReceiveResponse]((unsigned __int8 *)result, a2) & 1) != 0)
      return 1;
    else
      return -[__NSCFURLSessionDelegateWrapper check_didReceiveResponse](*(unsigned __int8 **)(v2 + 24), v3);
  }
  return result;
}

- (void)task:(void *)a3 didCompleteWithError:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  const char *v9;
  void (**v10)(_QWORD);
  const char *v11;
  id v12;
  int v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(_QWORD);

  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (a1)
  {
    v12 = objc_getProperty((id)a1, v9, 32, 1);
    if ((*(_BYTE *)(a1 + 9) & 0x40) != 0)
    {
      if ((*(_BYTE *)(a1 + 15) & 2) == 0)
      {
LABEL_7:
        v14 = *(_QWORD *)(a1 + 24);
        if (v14)
          -[__NSCFURLSessionDelegateWrapper task:didCompleteWithError:completionHandler:](v14, v7, v8, v10);
        else
          v10[2](v10);
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v11, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = 2;
      else
        v13 = 0;
      *(_BYTE *)(a1 + 15) = *(_BYTE *)(a1 + 15) & 0xFD | v13;
      *(_BYTE *)(a1 + 9) |= 0x40u;
      if (!v13)
        goto LABEL_7;
    }
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __79____NSCFURLSessionDelegateWrapper_task_didCompleteWithError_completionHandler___block_invoke;
    v19[3] = &unk_1E14F6398;
    v20 = v12;
    v21 = v15;
    v22 = v7;
    v23 = v8;
    v24 = v16;
    v25 = v10;
    v17 = v16;
    v18 = v15;
    -[NSURLSession runDelegateBlock:]((uint64_t)v18, v19);

LABEL_11:
  }

}

- (uint64_t)check_willPerformHTTPRedirection
{
  unsigned __int8 *v2;
  char v3;

  if (self)
  {
    v2 = self;
    if ((self[9] & 1) != 0)
    {
      LODWORD(self) = (self[14] >> 3) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if ((self & 1) != 0)
        v3 = 8;
      else
        v3 = 0;
      v2[14] = v2[14] & 0xF7 | v3;
      v2[9] |= 1u;
    }
  }
  return self & 1;
}

- (uint64_t)willBeginDelayedRequest
{
  uint64_t v2;
  const char *v3;

  if (result)
  {
    v2 = result;
    if ((-[__NSCFURLSessionDelegateWrapper check_willBeginDelayedRequest]((unsigned __int8 *)result, a2) & 1) != 0)
      return 1;
    else
      return -[__NSCFURLSessionDelegateWrapper check_willBeginDelayedRequest](*(unsigned __int8 **)(v2 + 24), v3);
  }
  return result;
}

- (uint64_t)check_willBeginDelayedRequest
{
  unsigned __int8 *v2;
  char v3;

  if (self)
  {
    v2 = self;
    if ((self[8] & 0x40) != 0)
    {
      LODWORD(self) = (self[14] >> 1) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if ((self & 1) != 0)
        v3 = 2;
      else
        v3 = 0;
      v2[14] = v2[14] & 0xFD | v3;
      v2[8] |= 0x40u;
    }
  }
  return self & 1;
}

- (uint64_t)didReceiveChallenge
{
  uint64_t v2;
  const char *v3;

  if (result)
  {
    v2 = result;
    if ((-[__NSCFURLSessionDelegateWrapper check_didReceiveChallenge]((unsigned __int8 *)result, a2) & 1) != 0)
      return 1;
    else
      return -[__NSCFURLSessionDelegateWrapper check_didReceiveChallenge](*(unsigned __int8 **)(v2 + 24), v3);
  }
  return result;
}

- (uint64_t)check_didBecomeDownloadTask
{
  unsigned __int8 *v2;
  char v3;

  if (self)
  {
    v2 = self;
    if ((self[11] & 1) != 0)
    {
      LODWORD(self) = (self[16] >> 3) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if ((self & 1) != 0)
        v3 = 8;
      else
        v3 = 0;
      v2[16] = v2[16] & 0xF7 | v3;
      v2[11] |= 1u;
    }
  }
  return self & 1;
}

- (id)_downloadTaskNeedsDownloadDirectory:(uint64_t)a1
{
  const char *v3;
  id v4;
  const char *v5;
  id v6;
  int v7;
  uint64_t v8;

  v4 = a2;
  if (a1)
  {
    v6 = objc_getProperty((id)a1, v3, 32, 1);
    if ((*(_BYTE *)(a1 + 12) & 8) != 0)
    {
      if ((*(_BYTE *)(a1 + 17) & 0x40) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper _downloadTaskNeedsDownloadDirectory:](*(_QWORD *)(a1 + 24), v4);
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        a1 = v8;

        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v5, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = 64;
      else
        v7 = 0;
      *(_BYTE *)(a1 + 17) = *(_BYTE *)(a1 + 17) & 0xBF | v7;
      *(_BYTE *)(a1 + 12) |= 8u;
      if (!v7)
        goto LABEL_7;
    }
    objc_msgSend(v6, "_URLSession:downloadTaskNeedsDownloadDirectory:", *(_QWORD *)(a1 + 40), v4);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:

  return (id)a1;
}

- (void)didBecomeInvalidWithError:(uint64_t)a1
{
  const char *v3;
  id v4;
  int v5;
  SEL v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  if (a1)
  {
    v4 = objc_getProperty((id)a1, a2, 32, 1);
    if ((*(_BYTE *)(a1 + 8) & 1) != 0)
    {
      if ((*(_BYTE *)(a1 + 13) & 8) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper didBecomeInvalidWithError:](*(_QWORD *)(a1 + 24));
        objc_setProperty_atomic((id)a1, v6, 0, 32);
LABEL_10:

        return;
      }
    }
    else
    {
      objc_getProperty((id)a1, v3, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = 8;
      else
        v5 = 0;
      *(_BYTE *)(a1 + 13) = *(_BYTE *)(a1 + 13) & 0xF7 | v5;
      *(_BYTE *)(a1 + 8) |= 1u;
      if (!v5)
        goto LABEL_7;
    }
    v7 = *(id *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61____NSCFURLSessionDelegateWrapper_didBecomeInvalidWithError___block_invoke;
    v9[3] = &unk_1E14FBED8;
    v10 = v4;
    v11 = v7;
    v12 = 0;
    v13 = a1;
    v8 = v7;
    -[NSURLSession runDelegateBlock:]((uint64_t)v8, v9);

    goto LABEL_10;
  }
}

- (void)didCreateTask:(uint64_t)a1
{
  const char *v3;
  const char *v4;
  id v5;
  char v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if (a1)
  {
    v5 = objc_getProperty((id)a1, v3, 32, 1);
    if ((*(_BYTE *)(a1 + 8) & 0x20) != 0)
    {
      if ((*(_BYTE *)(a1 + 14) & 1) != 0)
        goto LABEL_4;
    }
    else
    {
      objc_getProperty((id)a1, v4, 32, 1);
      v6 = *(_BYTE *)(a1 + 14) & 0xFE | objc_opt_respondsToSelector() & 1;
      *(_BYTE *)(a1 + 14) = v6;
      *(_BYTE *)(a1 + 8) |= 0x20u;
      if ((v6 & 1) != 0)
      {
LABEL_4:
        objc_msgSend(v5, "URLSession:didCreateTask:", *(_QWORD *)(a1 + 40), v8);
LABEL_8:

        goto LABEL_9;
      }
    }
    v7 = *(_QWORD *)(a1 + 24);
    if (v7)
      -[__NSCFURLSessionDelegateWrapper didCreateTask:](v7, v8);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)dataTask:(void *)a3 didReceiveData:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  const char *v9;
  void (**v10)(_QWORD);
  const char *v11;
  id v12;
  char v13;
  char v14;
  char v15;
  id v16;
  id v17;
  _QWORD *v18;
  id v19;
  id v20;
  _QWORD *v21;
  char v22;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[4];
  _QWORD *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void (**v32)(_QWORD);
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void (**v40)(_QWORD);

  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (a1)
  {
    v12 = objc_getProperty((id)a1, v9, 32, 1);
    v13 = *(_BYTE *)(a1 + 11);
    if ((v13 & 8) != 0)
    {
      v15 = *(_BYTE *)(a1 + 16);
      if ((v15 & 0x40) != 0)
      {
LABEL_7:
        v16 = *(id *)(a1 + 40);
        v17 = *(id *)(a1 + 48);
        v18 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_dataTask_didReceiveData_completionHandler_, v12);
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __77____NSCFURLSessionDelegateWrapper_dataTask_didReceiveData_completionHandler___block_invoke;
        v33[3] = &unk_1E14F63E8;
        v34 = v12;
        v19 = v16;
        v35 = v19;
        v36 = v7;
        v37 = v8;
        v38 = v18;
        v20 = v17;
        v39 = v20;
        v40 = v10;
        v21 = v18;
        -[NSURLSession runDelegateBlock:]((uint64_t)v19, v33);

        goto LABEL_18;
      }
    }
    else
    {
      objc_getProperty((id)a1, v11, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = 64;
      else
        v14 = 0;
      v15 = *(_BYTE *)(a1 + 16) & 0xBF | v14;
      *(_BYTE *)(a1 + 16) = v15;
      v13 = *(_BYTE *)(a1 + 11) | 8;
      *(_BYTE *)(a1 + 11) = v13;
      if ((v15 & 0x40) != 0)
        goto LABEL_7;
    }
    if ((v13 & 4) == 0)
    {
      objc_getProperty((id)a1, v11, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v22 = 32;
      else
        v22 = 0;
      v15 = *(_BYTE *)(a1 + 16) & 0xDF | v22;
      *(_BYTE *)(a1 + 16) = v15;
      *(_BYTE *)(a1 + 11) |= 4u;
    }
    if ((v15 & 0x20) == 0)
    {
      v23 = *(_QWORD *)(a1 + 24);
      if (v23)
        -[__NSCFURLSessionDelegateWrapper dataTask:didReceiveData:completionHandler:](v23, v7, v8, v10);
      else
        v10[2](v10);
      goto LABEL_19;
    }
    v24 = *(id *)(a1 + 40);
    v25 = *(id *)(a1 + 48);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __77____NSCFURLSessionDelegateWrapper_dataTask_didReceiveData_completionHandler___block_invoke_3;
    v26[3] = &unk_1E14F6398;
    v27 = v12;
    v28 = v24;
    v29 = v7;
    v30 = v8;
    v31 = v25;
    v32 = v10;
    v20 = v25;
    v19 = v24;
    -[NSURLSession runDelegateBlock:]((uint64_t)v19, v26);

    v21 = v27;
LABEL_18:

LABEL_19:
  }

}

- (void)task:(void *)a3 didReceiveChallenge:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  id v14;
  _QWORD *v15;
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (a1)
  {
    v11 = objc_getProperty((id)a1, v9, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check_didReceiveChallenge]((unsigned __int8 *)a1, v12))
    {
      v13 = *(id *)(a1 + 40);
      v14 = *(id *)(a1 + 48);
      v15 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task_didReceiveChallenge_completionHandler_, v11);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __78____NSCFURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke;
      v20[3] = &unk_1E14F63E8;
      v21 = v11;
      v16 = v13;
      v22 = v16;
      v23 = v7;
      v24 = v8;
      v25 = v15;
      v17 = v14;
      v26 = v17;
      v27 = v10;
      v18 = v15;
      -[NSURLSession runDelegateBlock:]((uint64_t)v16, v20);

    }
    else
    {
      v19 = *(_QWORD *)(a1 + 24);
      if (v19)
        -[__NSCFURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:](v19, v7, v8, v10);
      else
        (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);
    }

  }
}

- (uint64_t)check_didReceiveChallenge
{
  unsigned __int8 *v2;
  char v3;

  if (self)
  {
    v2 = self;
    if ((self[9] & 2) != 0)
    {
      LODWORD(self) = (self[14] >> 4) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if ((self & 1) != 0)
        v3 = 16;
      else
        v3 = 0;
      v2[14] = v2[14] & 0xEF | v3;
      v2[9] |= 2u;
    }
  }
  return self & 1;
}

- (uint64_t)sessionDidReceiveChallenge
{
  uint64_t v2;
  const char *v3;

  if (result)
  {
    v2 = result;
    if ((-[__NSCFURLSessionDelegateWrapper check_sessionDidReceiveChallenge]((unsigned __int8 *)result, a2) & 1) != 0)
      return 1;
    else
      return -[__NSCFURLSessionDelegateWrapper check_sessionDidReceiveChallenge](*(unsigned __int8 **)(v2 + 24), v3);
  }
  return result;
}

- (uint64_t)check_sessionDidReceiveChallenge
{
  unsigned __int8 *v2;
  char v3;

  if (self)
  {
    v2 = self;
    if ((self[8] & 2) != 0)
    {
      LODWORD(self) = (self[13] >> 4) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if ((self & 1) != 0)
        v3 = 16;
      else
        v3 = 0;
      v2[13] = v2[13] & 0xEF | v3;
      v2[8] |= 2u;
    }
  }
  return self & 1;
}

- (void)task:(uint64_t)a3 didSendBodyData:(uint64_t)a4 totalBytesSent:(uint64_t)a5 totalBytesExpectedToSend:
{
  const char *v9;
  id v10;
  const char *v11;
  id v12;
  char v13;
  char v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v10 = a2;
  if (a1)
  {
    v12 = objc_getProperty((id)a1, v9, 32, 1);
    if ((*(_BYTE *)(a1 + 9) & 0x10) != 0)
    {
      if ((*(_BYTE *)(a1 + 14) & 0x80) != 0)
      {
LABEL_7:
        v15 = *(id *)(a1 + 40);
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __96____NSCFURLSessionDelegateWrapper_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke;
        v17[3] = &unk_1E14FBE60;
        v18 = v12;
        v19 = v15;
        v20 = v10;
        v21 = a3;
        v22 = a4;
        v23 = a5;
        v16 = v15;
        -[NSURLSession runDelegateBlock:]((uint64_t)v16, v17);

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v11, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = 0x80;
      else
        v13 = 0;
      v14 = v13 & 0x80 | *(_BYTE *)(a1 + 14) & 0x7F;
      *(_BYTE *)(a1 + 14) = v14;
      *(_BYTE *)(a1 + 9) |= 0x10u;
      if (v14 < 0)
        goto LABEL_7;
    }
    -[__NSCFURLSessionDelegateWrapper task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:](*(_QWORD *)(a1 + 24), v10, a3, a4, a5);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)dataTask:(void *)a3 willCacheResponse:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  id v12;
  char v13;
  char v14;
  id v15;
  id v16;
  _QWORD *v17;
  id v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (a1)
  {
    v12 = objc_getProperty((id)a1, v9, 32, 1);
    if ((*(_BYTE *)(a1 + 11) & 0x10) != 0)
    {
      if ((*(_BYTE *)(a1 + 16) & 0x80) != 0)
      {
LABEL_7:
        v15 = *(id *)(a1 + 40);
        v16 = *(id *)(a1 + 48);
        v17 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_dataTask_willCacheResponse_completionHandler_, v12);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __80____NSCFURLSessionDelegateWrapper_dataTask_willCacheResponse_completionHandler___block_invoke;
        v22[3] = &unk_1E14F63E8;
        v23 = v12;
        v18 = v15;
        v24 = v18;
        v25 = v7;
        v26 = v8;
        v27 = v17;
        v19 = v16;
        v28 = v19;
        v29 = v10;
        v20 = v17;
        -[NSURLSession runDelegateBlock:]((uint64_t)v18, v22);

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
      objc_getProperty((id)a1, v11, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = 0x80;
      else
        v13 = 0;
      v14 = v13 & 0x80 | *(_BYTE *)(a1 + 16) & 0x7F;
      *(_BYTE *)(a1 + 16) = v14;
      *(_BYTE *)(a1 + 11) |= 0x10u;
      if (v14 < 0)
        goto LABEL_7;
    }
    v21 = *(_QWORD *)(a1 + 24);
    if (v21)
      -[__NSCFURLSessionDelegateWrapper dataTask:willCacheResponse:completionHandler:](v21, v7, v8, v10);
    else
      (*((void (**)(id, id))v10 + 2))(v10, v8);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)task:(void *)a3 willPerformHTTPRedirection:(void *)a4 newRequest:(void *)a5 completionHandler:
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  id v14;
  const char *v15;
  id v16;
  id v17;
  _QWORD *v18;
  id v19;
  id v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v13 = a5;
  if (a1)
  {
    v14 = objc_getProperty((id)a1, v12, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check_willPerformHTTPRedirection]((unsigned __int8 *)a1, v15))
    {
      v16 = *(id *)(a1 + 40);
      v17 = *(id *)(a1 + 48);
      v18 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task_willPerformHTTPRedirection_newRequest_completionHandler_, v14);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __96____NSCFURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
      v23[3] = &unk_1E14F6438;
      v24 = v14;
      v19 = v16;
      v25 = v19;
      v26 = v9;
      v27 = v10;
      v28 = v11;
      v29 = v18;
      v20 = v17;
      v30 = v20;
      v31 = v13;
      v21 = v18;
      -[NSURLSession runDelegateBlock:]((uint64_t)v19, v23);

    }
    else
    {
      v22 = *(_QWORD *)(a1 + 24);
      if (v22)
        -[__NSCFURLSessionDelegateWrapper task:willPerformHTTPRedirection:newRequest:completionHandler:](v22, v9, v10, v11, v13);
      else
        (*((void (**)(id, id))v13 + 2))(v13, v11);
    }

  }
}

- (void)task:(void *)a3 _willSendRequestForEstablishedConnection:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  id v14;
  _QWORD *v15;
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (a1)
  {
    v11 = objc_getProperty((id)a1, v9, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check__willSendRequestForEstablishedConnection]((unsigned __int8 *)a1, v12))
    {
      v13 = *(id *)(a1 + 40);
      v14 = *(id *)(a1 + 48);
      v15 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task__willSendRequestForEstablishedConnection_completionHandler_, v11);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __99____NSCFURLSessionDelegateWrapper_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke;
      v20[3] = &unk_1E14F63E8;
      v21 = v11;
      v16 = v13;
      v22 = v16;
      v23 = v7;
      v24 = v8;
      v25 = v15;
      v17 = v14;
      v26 = v17;
      v27 = v10;
      v18 = v15;
      -[NSURLSession runDelegateBlock:]((uint64_t)v16, v20);

    }
    else
    {
      v19 = *(_QWORD *)(a1 + 24);
      if (v19)
        -[__NSCFURLSessionDelegateWrapper task:_willSendRequestForEstablishedConnection:completionHandler:](v19, v7, v8, v10);
      else
        (*((void (**)(id, id))v10 + 2))(v10, v8);
    }

  }
}

- (void)didReceiveChallenge:(void *)a3 completionHandler:
{
  id v5;
  const char *v6;
  id v7;
  id v8;
  const char *v9;
  id v10;
  id v11;
  _QWORD *v12;
  id v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v5 = a2;
  v7 = a3;
  if (a1)
  {
    v8 = objc_getProperty((id)a1, v6, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check_sessionDidReceiveChallenge]((unsigned __int8 *)a1, v9))
    {
      v10 = *(id *)(a1 + 40);
      v11 = *(id *)(a1 + 48);
      v12 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_didReceiveChallenge_completionHandler_, v8);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __73____NSCFURLSessionDelegateWrapper_didReceiveChallenge_completionHandler___block_invoke;
      v17[3] = &unk_1E14F6398;
      v18 = v8;
      v13 = v10;
      v19 = v13;
      v20 = v5;
      v21 = v12;
      v14 = v11;
      v22 = v14;
      v23 = v7;
      v15 = v12;
      -[NSURLSession runDelegateBlock:]((uint64_t)v13, v17);

    }
    else
    {
      v16 = *(_QWORD *)(a1 + 24);
      if (v16)
        -[__NSCFURLSessionDelegateWrapper didReceiveChallenge:completionHandler:](v16, v5, v7);
      else
        (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
    }

  }
}

- (void)task:(void *)a3 _willUseEffectiveConfiguration:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  const char *v9;
  void (**v10)(id, id);
  const char *v11;
  id v12;
  int v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD *v17;
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void (**v28)(id, id);

  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (a1)
  {
    v12 = objc_getProperty((id)a1, v9, 32, 1);
    if ((*(_BYTE *)(a1 + 10) & 8) != 0)
    {
      if ((*(_BYTE *)(a1 + 15) & 0x40) == 0)
      {
LABEL_7:
        v14 = *(_QWORD *)(a1 + 24);
        if (v14)
          -[__NSCFURLSessionDelegateWrapper task:_willUseEffectiveConfiguration:completionHandler:](v14, v7, v8, v10);
        else
          v10[2](v10, v8);
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v11, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = 64;
      else
        v13 = 0;
      *(_BYTE *)(a1 + 15) = *(_BYTE *)(a1 + 15) & 0xBF | v13;
      *(_BYTE *)(a1 + 10) |= 8u;
      if (!v13)
        goto LABEL_7;
    }
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    v17 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task__willUseEffectiveConfiguration_completionHandler_, v12);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __89____NSCFURLSessionDelegateWrapper_task__willUseEffectiveConfiguration_completionHandler___block_invoke;
    v21[3] = &unk_1E14F63E8;
    v22 = v12;
    v18 = v15;
    v23 = v18;
    v24 = v7;
    v25 = v8;
    v26 = v17;
    v19 = v16;
    v27 = v19;
    v28 = v10;
    v20 = v17;
    -[NSURLSession runDelegateBlock:]((uint64_t)v18, v21);

LABEL_11:
  }

}

- (_BYTE)check__isWaitingForConnection_withoutError
{
  _BYTE *v2;
  char v3;
  char v4;

  if (self)
  {
    v2 = self;
    if ((self[10] & 0x10) != 0)
    {
      v4 = self[15];
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 0x80;
      else
        v3 = 0;
      v4 = v3 & 0x80 | v2[15] & 0x7F;
      v2[15] = v4;
      v2[10] |= 0x10u;
    }
    return (_BYTE *)(v4 < 0);
  }
  return self;
}

- (uint64_t)check__conditionalRequirementsChanged
{
  unsigned __int8 *v2;
  char v3;

  if (self)
  {
    v2 = self;
    if ((self[10] & 2) != 0)
    {
      LODWORD(self) = (self[15] >> 4) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if ((self & 1) != 0)
        v3 = 16;
      else
        v3 = 0;
      v2[15] = v2[15] & 0xEF | v3;
      v2[10] |= 2u;
    }
  }
  return self & 1;
}

- (uint64_t)check_isWaitingForConnectivity
{
  unsigned __int8 *v2;
  char v3;

  if (self)
  {
    v2 = self;
    if ((char)self[8] < 0)
    {
      LODWORD(self) = (self[14] >> 2) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if ((self & 1) != 0)
        v3 = 4;
      else
        v3 = 0;
      v2[14] = v2[14] & 0xFB | v3;
      v2[8] |= 0x80u;
    }
  }
  return self & 1;
}

- (uint64_t)check__alternatePathAvailable
{
  unsigned __int8 *v2;
  char v3;

  if (self)
  {
    v2 = self;
    if ((self[10] & 0x40) != 0)
    {
      LODWORD(self) = (self[16] >> 1) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if ((self & 1) != 0)
        v3 = 2;
      else
        v3 = 0;
      v2[16] = v2[16] & 0xFD | v3;
      v2[10] |= 0x40u;
    }
  }
  return self & 1;
}

- (_BYTE)check__isWaitingForConnection_withError
{
  _BYTE *v2;
  char v3;

  if (self)
  {
    v2 = self;
    if ((self[10] & 0x20) != 0)
    {
      v3 = self[16];
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      v3 = v2[16] & 0xFE | objc_opt_respondsToSelector() & 1;
      v2[16] = v3;
      v2[10] |= 0x20u;
    }
    return (_BYTE *)(v3 & 1);
  }
  return self;
}

- (uint64_t)_willSendRequestForEstablishedConnection
{
  uint64_t v2;
  const char *v3;

  if (result)
  {
    v2 = result;
    if ((-[__NSCFURLSessionDelegateWrapper check__willSendRequestForEstablishedConnection]((unsigned __int8 *)result, a2) & 1) != 0)return 1;
    else
      return -[__NSCFURLSessionDelegateWrapper check__willSendRequestForEstablishedConnection](*(unsigned __int8 **)(v2 + 24), v3);
  }
  return result;
}

- (uint64_t)check__willSendRequestForEstablishedConnection
{
  unsigned __int8 *v2;
  char v3;

  if (self)
  {
    v2 = self;
    if ((self[10] & 1) != 0)
    {
      LODWORD(self) = (self[15] >> 3) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if ((self & 1) != 0)
        v3 = 8;
      else
        v3 = 0;
      v2[15] = v2[15] & 0xF7 | v3;
      v2[10] |= 1u;
    }
  }
  return self & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_wrappedDelegate, 0);
  objc_storeStrong((id *)&self->_fallbackDelegateWrapper, 0);
}

- (void)task:(void *)a3 _schemeUpgraded:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  id v12;
  int v13;
  id v14;
  id v15;
  _QWORD *v16;
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (a1)
  {
    v12 = objc_getProperty((id)a1, v9, 32, 1);
    if (*(char *)(a1 + 9) < 0)
    {
      if ((*(_BYTE *)(a1 + 15) & 4) != 0)
      {
LABEL_7:
        v14 = *(id *)(a1 + 40);
        v15 = *(id *)(a1 + 48);
        v16 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task__schemeUpgraded_completionHandler_, v12);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __74____NSCFURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke;
        v21[3] = &unk_1E14F63E8;
        v22 = v12;
        v17 = v14;
        v23 = v17;
        v24 = v7;
        v25 = v8;
        v26 = v16;
        v18 = v15;
        v27 = v18;
        v28 = v10;
        v19 = v16;
        -[NSURLSession runDelegateBlock:]((uint64_t)v17, v21);

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
      objc_getProperty((id)a1, v11, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = 4;
      else
        v13 = 0;
      *(_BYTE *)(a1 + 15) = *(_BYTE *)(a1 + 15) & 0xFB | v13;
      *(_BYTE *)(a1 + 9) |= 0x80u;
      if (v13)
        goto LABEL_7;
    }
    v20 = *(_QWORD *)(a1 + 24);
    if (v20)
      -[__NSCFURLSessionDelegateWrapper task:_schemeUpgraded:completionHandler:](v20, v7, v8, v10);
    else
      (*((void (**)(id, id))v10 + 2))(v10, v8);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)dataTask:(void *)a3 didBecomeDownloadTask:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  const char *v9;
  void (**v10)(_QWORD);
  id v11;
  const char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void (**v24)(_QWORD);

  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (a1)
  {
    v11 = objc_getProperty((id)a1, v9, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check_didBecomeDownloadTask]((unsigned __int8 *)a1, v12))
    {
      v13 = *(id *)(a1 + 40);
      v14 = *(id *)(a1 + 48);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __84____NSCFURLSessionDelegateWrapper_dataTask_didBecomeDownloadTask_completionHandler___block_invoke;
      v18[3] = &unk_1E14F6398;
      v19 = v11;
      v20 = v13;
      v21 = v7;
      v22 = v8;
      v23 = v14;
      v24 = v10;
      v15 = v14;
      v16 = v13;
      -[NSURLSession runDelegateBlock:]((uint64_t)v16, v18);

    }
    else
    {
      v17 = *(_QWORD *)(a1 + 24);
      if (v17)
        -[__NSCFURLSessionDelegateWrapper dataTask:didBecomeDownloadTask:completionHandler:](v17, v7, v8, v10);
      else
        v10[2](v10);
    }

  }
}

- (uint64_t)check_needNewBodyStreamFromOffset
{
  int v3;
  char v4;

  if ((self[9] & 8) != 0)
  {
    v3 = (self[14] >> 6) & 1;
  }
  else
  {
    objc_getProperty(self, a2, 32, 1);
    LOBYTE(v3) = objc_opt_respondsToSelector();
    if ((v3 & 1) != 0)
      v4 = 64;
    else
      v4 = 0;
    self[14] = self[14] & 0xBF | v4;
    self[9] |= 8u;
  }
  return v3 & 1;
}

- (uint64_t)check_didBecomeStreamTask
{
  unsigned __int8 *v2;
  char v3;

  if (self)
  {
    v2 = self;
    if ((self[11] & 2) != 0)
    {
      LODWORD(self) = (self[16] >> 4) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if ((self & 1) != 0)
        v3 = 16;
      else
        v3 = 0;
      v2[16] = v2[16] & 0xEF | v3;
      v2[11] |= 2u;
    }
  }
  return self & 1;
}

- (uint64_t)check_didFinishDownloadingToURL
{
  unsigned __int8 *v2;
  char v3;

  if (self)
  {
    v2 = self;
    if ((char)self[11] < 0)
    {
      LODWORD(self) = (self[17] >> 2) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if ((self & 1) != 0)
        v3 = 4;
      else
        v3 = 0;
      v2[17] = v2[17] & 0xFB | v3;
      v2[11] |= 0x80u;
    }
  }
  return self & 1;
}

- (uint64_t)didFinishDownloadingToURL
{
  uint64_t v2;
  const char *v3;

  if (result)
  {
    v2 = result;
    if ((-[__NSCFURLSessionDelegateWrapper check_didFinishDownloadingToURL]((unsigned __int8 *)result, a2) & 1) != 0)
      return 1;
    else
      return -[__NSCFURLSessionDelegateWrapper check_didFinishDownloadingToURL](*(unsigned __int8 **)(v2 + 24), v3);
  }
  return result;
}

- (uint64_t)check_didWriteData
{
  unsigned __int8 *v2;
  char v3;

  if (self)
  {
    v2 = self;
    if ((self[12] & 1) != 0)
    {
      LODWORD(self) = (self[17] >> 3) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if ((self & 1) != 0)
        v3 = 8;
      else
        v3 = 0;
      v2[17] = v2[17] & 0xF7 | v3;
      v2[12] |= 1u;
    }
  }
  return self & 1;
}

- (uint64_t)didWriteData
{
  uint64_t v2;
  const char *v3;

  if (result)
  {
    v2 = result;
    if ((-[__NSCFURLSessionDelegateWrapper check_didWriteData]((unsigned __int8 *)result, a2) & 1) != 0)
      return 1;
    else
      return -[__NSCFURLSessionDelegateWrapper check_didWriteData](*(unsigned __int8 **)(v2 + 24), v3);
  }
  return result;
}

- (uint64_t)check_betterRouteDiscovered
{
  unsigned __int8 *v2;
  char v3;

  if (self)
  {
    v2 = self;
    if ((self[12] & 0x40) != 0)
    {
      LODWORD(self) = (self[18] >> 1) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if ((self & 1) != 0)
        v3 = 2;
      else
        v3 = 0;
      v2[18] = v2[18] & 0xFD | v3;
      v2[12] |= 0x40u;
    }
  }
  return self & 1;
}

- (uint64_t)check_didBecomeInputOutputStream
{
  unsigned __int8 *v2;
  char v3;

  if (self)
  {
    v2 = self;
    if ((char)self[12] < 0)
    {
      LODWORD(self) = (self[18] >> 2) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if ((self & 1) != 0)
        v3 = 4;
      else
        v3 = 0;
      v2[18] = v2[18] & 0xFB | v3;
      v2[12] |= 0x80u;
    }
  }
  return self & 1;
}

- (uint64_t)didBecomeInputOutputStream
{
  uint64_t v2;
  const char *v3;

  if (result)
  {
    v2 = result;
    if ((-[__NSCFURLSessionDelegateWrapper check_didBecomeInputOutputStream]((unsigned __int8 *)result, a2) & 1) != 0)
      return 1;
    else
      return -[__NSCFURLSessionDelegateWrapper check_didBecomeInputOutputStream](*(unsigned __int8 **)(v2 + 24), v3);
  }
  return result;
}

- (void)didFinishEventsForBackgroundURLSession
{
  const char *v3;
  id v4;
  int v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  if (a1)
  {
    v4 = objc_getProperty((id)a1, a2, 32, 1);
    if ((*(_BYTE *)(a1 + 8) & 4) != 0)
    {
      if ((*(_BYTE *)(a1 + 13) & 0x20) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper didFinishEventsForBackgroundURLSession](*(_QWORD *)(a1 + 24));
LABEL_10:

        return;
      }
    }
    else
    {
      objc_getProperty((id)a1, v3, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = 32;
      else
        v5 = 0;
      *(_BYTE *)(a1 + 13) = *(_BYTE *)(a1 + 13) & 0xDF | v5;
      *(_BYTE *)(a1 + 8) |= 4u;
      if (!v5)
        goto LABEL_7;
    }
    v6 = *(id *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73____NSCFURLSessionDelegateWrapper_didFinishEventsForBackgroundURLSession__block_invoke;
    v8[3] = &unk_1E14FDE88;
    v9 = v4;
    v10 = v6;
    v7 = v6;
    -[NSURLSession runDelegateBlock:]((uint64_t)v7, v8);

    goto LABEL_10;
  }
}

- (void)task:(void *)a3 _getAuthHeadersForResponse:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  id v12;
  int v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD *v17;
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (a1)
  {
    v12 = objc_getProperty((id)a1, v9, 32, 1);
    if ((*(_BYTE *)(a1 + 8) & 8) != 0)
    {
      if ((*(_BYTE *)(a1 + 13) & 0x40) == 0)
      {
LABEL_7:
        v14 = *(_QWORD *)(a1 + 24);
        if (v14)
          -[__NSCFURLSessionDelegateWrapper task:_getAuthHeadersForResponse:completionHandler:](v14, v7, v8, v10);
        else
          (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v11, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = 64;
      else
        v13 = 0;
      *(_BYTE *)(a1 + 13) = *(_BYTE *)(a1 + 13) & 0xBF | v13;
      *(_BYTE *)(a1 + 8) |= 8u;
      if (!v13)
        goto LABEL_7;
    }
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    v17 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task__getAuthHeadersForResponse_completionHandler_, v12);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __85____NSCFURLSessionDelegateWrapper_task__getAuthHeadersForResponse_completionHandler___block_invoke;
    v21[3] = &unk_1E14F63E8;
    v22 = v12;
    v18 = v15;
    v23 = v18;
    v24 = v7;
    v25 = v8;
    v26 = v17;
    v19 = v16;
    v27 = v19;
    v28 = v10;
    v20 = v17;
    -[NSURLSession runDelegateBlock:]((uint64_t)v18, v21);

LABEL_11:
  }

}

- (void)_openFileAtPath:(uint64_t)a3 mode:(void *)a4 completionHandler:
{
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  id v11;
  char v12;
  char v13;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  int v22;

  v7 = a2;
  v9 = a4;
  if (a1)
  {
    v11 = objc_getProperty((id)a1, v8, 32, 1);
    if ((*(_BYTE *)(a1 + 8) & 0x10) != 0)
    {
      if ((*(_BYTE *)(a1 + 13) & 0x80) != 0)
      {
LABEL_7:
        v14 = *(id *)(a1 + 40);
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __74____NSCFURLSessionDelegateWrapper__openFileAtPath_mode_completionHandler___block_invoke;
        v17[3] = &unk_1E14F9EB8;
        v18 = v11;
        v19 = v14;
        v20 = v7;
        v22 = a3;
        v21 = v9;
        v15 = v14;
        -[NSURLSession runDelegateBlock:]((uint64_t)v15, v17);

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
      objc_getProperty((id)a1, v10, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = 0x80;
      else
        v12 = 0;
      v13 = v12 & 0x80 | *(_BYTE *)(a1 + 13) & 0x7F;
      *(_BYTE *)(a1 + 13) = v13;
      *(_BYTE *)(a1 + 8) |= 0x10u;
      if (v13 < 0)
        goto LABEL_7;
    }
    v16 = *(_QWORD *)(a1 + 24);
    if (v16)
      -[__NSCFURLSessionDelegateWrapper _openFileAtPath:mode:completionHandler:](v16, v7, a3, v9);
    else
      (*((void (**)(id, uint64_t))v9 + 2))(v9, 0xFFFFFFFFLL);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)task:(void *)a3 willBeginDelayedRequest:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  id v14;
  _QWORD *v15;
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (a1)
  {
    v11 = objc_getProperty((id)a1, v9, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check_willBeginDelayedRequest]((unsigned __int8 *)a1, v12))
    {
      v13 = *(id *)(a1 + 40);
      v14 = *(id *)(a1 + 48);
      v15 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task_willBeginDelayedRequest_completionHandler_, v11);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __82____NSCFURLSessionDelegateWrapper_task_willBeginDelayedRequest_completionHandler___block_invoke;
      v20[3] = &unk_1E14F63E8;
      v21 = v11;
      v16 = v13;
      v22 = v16;
      v23 = v7;
      v24 = v8;
      v25 = v15;
      v17 = v14;
      v26 = v17;
      v27 = v10;
      v18 = v15;
      -[NSURLSession runDelegateBlock:]((uint64_t)v16, v20);

    }
    else
    {
      v19 = *(_QWORD *)(a1 + 24);
      if (v19)
        -[__NSCFURLSessionDelegateWrapper task:willBeginDelayedRequest:completionHandler:](v19, v7, v8, v10);
      else
        (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    }

  }
}

- (void)taskIsWaitingForConnectivity:(uint64_t)a1
{
  const char *v3;
  id v4;
  id v5;
  const char *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v4 = a2;
  if (a1)
  {
    v5 = objc_getProperty((id)a1, v3, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check_isWaitingForConnectivity]((unsigned __int8 *)a1, v6))
    {
      v7 = *(id *)(a1 + 40);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __64____NSCFURLSessionDelegateWrapper_taskIsWaitingForConnectivity___block_invoke;
      v9[3] = &unk_1E14FE1E0;
      v10 = v5;
      v11 = v7;
      v12 = v4;
      v8 = v7;
      -[NSURLSession runDelegateBlock:]((uint64_t)v8, v9);

    }
    else
    {
      -[__NSCFURLSessionDelegateWrapper taskIsWaitingForConnectivity:](*(_QWORD *)(a1 + 24), v4);
    }

  }
}

- (void)task:(void *)a3 needNewBodyStream:
{
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  id v9;
  int v10;
  id v11;
  id v12;
  _QWORD *v13;
  id v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v5 = a2;
  v7 = a3;
  if (a1)
  {
    v9 = objc_getProperty((id)a1, v6, 32, 1);
    if ((*(_BYTE *)(a1 + 9) & 4) != 0)
    {
      if ((*(_BYTE *)(a1 + 14) & 0x20) == 0)
      {
LABEL_7:
        if (-[__NSCFURLSessionDelegateWrapper check_needNewBodyStreamFromOffset]((unsigned __int8 *)a1, v8))
        {
          -[__NSCFURLSessionDelegateWrapper task:needNewBodyStreamFromOffset:completionHandler:](a1, v5, 0, v7);
        }
        else
        {
          v17 = *(_QWORD *)(a1 + 24);
          if (v17)
            -[__NSCFURLSessionDelegateWrapper task:needNewBodyStream:](v17, v5, v7);
          else
            (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
        }
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v8, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = 32;
      else
        v10 = 0;
      *(_BYTE *)(a1 + 14) = *(_BYTE *)(a1 + 14) & 0xDF | v10;
      *(_BYTE *)(a1 + 9) |= 4u;
      if (!v10)
        goto LABEL_7;
    }
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    v13 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task_needNewBodyStream_, v9);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __58____NSCFURLSessionDelegateWrapper_task_needNewBodyStream___block_invoke;
    v18[3] = &unk_1E14F6398;
    v19 = v9;
    v14 = v11;
    v20 = v14;
    v21 = v5;
    v22 = v13;
    v15 = v12;
    v23 = v15;
    v24 = v7;
    v16 = v13;
    -[NSURLSession runDelegateBlock:]((uint64_t)v14, v18);

LABEL_11:
  }

}

- (void)task:(uint64_t)a3 needNewBodyStreamFromOffset:(void *)a4 completionHandler:
{
  id v7;
  const char *v8;
  id v9;
  id v10;
  const char *v11;
  id v12;
  id v13;
  _QWORD *v14;
  id v15;
  id v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;

  v7 = a2;
  v9 = a4;
  if (a1)
  {
    v10 = objc_getProperty((id)a1, v8, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check_needNewBodyStreamFromOffset]((unsigned __int8 *)a1, v11))
    {
      v12 = *(id *)(a1 + 40);
      v13 = *(id *)(a1 + 48);
      v14 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task_needNewBodyStreamFromOffset_completionHandler_, v10);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __86____NSCFURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke;
      v19[3] = &unk_1E14F6488;
      v20 = v10;
      v15 = v12;
      v21 = v15;
      v26 = a3;
      v22 = v7;
      v23 = v14;
      v16 = v13;
      v24 = v16;
      v25 = v9;
      v17 = v14;
      -[NSURLSession runDelegateBlock:]((uint64_t)v15, v19);

    }
    else
    {
      v18 = *(_QWORD *)(a1 + 24);
      if (v18)
        -[__NSCFURLSessionDelegateWrapper task:needNewBodyStreamFromOffset:completionHandler:](v18, v7, a3, v9);
      else
        (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    }

  }
}

- (void)task:(uint64_t)a3 _conditionalRequirementsChanged:
{
  const char *v5;
  id v6;
  id v7;
  const char *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  char v15;

  v6 = a2;
  if (a1)
  {
    v7 = objc_getProperty((id)a1, v5, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check__conditionalRequirementsChanged]((unsigned __int8 *)a1, v8))
    {
      v9 = *(id *)(a1 + 40);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __72____NSCFURLSessionDelegateWrapper_task__conditionalRequirementsChanged___block_invoke;
      v11[3] = &unk_1E14F64B0;
      v12 = v7;
      v13 = v9;
      v14 = v6;
      v15 = a3;
      v10 = v9;
      -[NSURLSession runDelegateBlock:]((uint64_t)v10, v11);

    }
    else
    {
      -[__NSCFURLSessionDelegateWrapper task:_conditionalRequirementsChanged:](*(_QWORD *)(a1 + 24), v6, a3);
    }

  }
}

- (void)task:(void *)a3 didReceiveInformationalResponse:
{
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  id v9;
  int v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v7 = a3;
  if (a1)
  {
    v9 = objc_getProperty((id)a1, v6, 32, 1);
    if ((*(_BYTE *)(a1 + 10) & 4) != 0)
    {
      if ((*(_BYTE *)(a1 + 15) & 0x20) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper task:didReceiveInformationalResponse:](*(_QWORD *)(a1 + 24), v5, v7);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v8, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = 32;
      else
        v10 = 0;
      *(_BYTE *)(a1 + 15) = *(_BYTE *)(a1 + 15) & 0xDF | v10;
      *(_BYTE *)(a1 + 10) |= 4u;
      if (!v10)
        goto LABEL_7;
    }
    v11 = *(id *)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72____NSCFURLSessionDelegateWrapper_task_didReceiveInformationalResponse___block_invoke;
    v13[3] = &unk_1E14FBED8;
    v14 = v9;
    v15 = v11;
    v16 = v5;
    v17 = v7;
    v12 = v11;
    -[NSURLSession runDelegateBlock:]((uint64_t)v12, v13);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)task:(void *)a3 _isWaitingForConnectionWithError:
{
  id v5;
  const char *v6;
  id v7;
  id v8;
  const char *v9;
  const char *v10;
  id v11;
  id v12;
  id *v13;
  id *v14;
  id *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v5 = a2;
  v7 = a3;
  if (a1)
  {
    v8 = objc_getProperty((id)a1, v6, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check__isWaitingForConnection_withError]((_BYTE *)a1, v9))
    {
      v11 = *(id *)(a1 + 40);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __73____NSCFURLSessionDelegateWrapper_task__isWaitingForConnectionWithError___block_invoke;
      v21[3] = &unk_1E14FBED8;
      v22 = v8;
      v23 = v11;
      v24 = v5;
      v25 = v7;
      v12 = v11;
      -[NSURLSession runDelegateBlock:]((uint64_t)v12, v21);
      v13 = &v22;
      v14 = &v23;
      v15 = &v24;

    }
    else
    {
      if (!-[__NSCFURLSessionDelegateWrapper check__isWaitingForConnection_withoutError]((_BYTE *)a1, v10))
      {
        -[__NSCFURLSessionDelegateWrapper task:_isWaitingForConnectionWithError:](*(_QWORD *)(a1 + 24), v5, v7);
        goto LABEL_8;
      }
      v16 = *(id *)(a1 + 40);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __73____NSCFURLSessionDelegateWrapper_task__isWaitingForConnectionWithError___block_invoke_2;
      v17[3] = &unk_1E14FE1E0;
      v18 = v8;
      v19 = v16;
      v20 = v5;
      v12 = v16;
      -[NSURLSession runDelegateBlock:]((uint64_t)v12, v17);
      v13 = &v18;
      v14 = &v19;
      v15 = &v20;
    }

LABEL_8:
  }

}

- (void)task:(uint64_t)a3 _alternatePathAvailable:
{
  const char *v5;
  id v6;
  id v7;
  const char *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  int v15;

  v6 = a2;
  if (a1)
  {
    v7 = objc_getProperty((id)a1, v5, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check__alternatePathAvailable]((unsigned __int8 *)a1, v8))
    {
      v9 = *(id *)(a1 + 40);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __64____NSCFURLSessionDelegateWrapper_task__alternatePathAvailable___block_invoke;
      v11[3] = &unk_1E14F64D8;
      v12 = v7;
      v13 = v9;
      v14 = v6;
      v15 = a3;
      v10 = v9;
      -[NSURLSession runDelegateBlock:]((uint64_t)v10, v11);

    }
    else
    {
      -[__NSCFURLSessionDelegateWrapper task:_alternatePathAvailable:](*(_QWORD *)(a1 + 24), v6, a3);
    }

  }
}

- (void)dataTask:(void *)a3 didBecomeStreamTask:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  const char *v9;
  void (**v10)(_QWORD);
  id v11;
  const char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void (**v24)(_QWORD);

  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (a1)
  {
    v11 = objc_getProperty((id)a1, v9, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check_didBecomeStreamTask]((unsigned __int8 *)a1, v12))
    {
      v13 = *(id *)(a1 + 40);
      v14 = *(id *)(a1 + 48);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __82____NSCFURLSessionDelegateWrapper_dataTask_didBecomeStreamTask_completionHandler___block_invoke;
      v18[3] = &unk_1E14F6398;
      v19 = v11;
      v20 = v13;
      v21 = v7;
      v22 = v8;
      v23 = v14;
      v24 = v10;
      v15 = v14;
      v16 = v13;
      -[NSURLSession runDelegateBlock:]((uint64_t)v16, v18);

    }
    else
    {
      v17 = *(_QWORD *)(a1 + 24);
      if (v17)
        -[__NSCFURLSessionDelegateWrapper dataTask:didBecomeStreamTask:completionHandler:](v17, v7, v8, v10);
      else
        v10[2](v10);
    }

  }
}

- (void)_willRetryBackgroundDataTask:(void *)a3 withError:
{
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  id v9;
  char v10;
  char v11;
  char v12;
  id v13;
  id v14;
  id *v15;
  id *v16;
  id *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;

  v5 = a2;
  v7 = a3;
  if (a1)
  {
    v9 = objc_getProperty((id)a1, v6, 32, 1);
    v10 = *(_BYTE *)(a1 + 11);
    if ((v10 & 0x40) != 0)
    {
      v12 = *(_BYTE *)(a1 + 17);
      if ((v12 & 2) != 0)
      {
LABEL_7:
        v13 = *(id *)(a1 + 40);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __74____NSCFURLSessionDelegateWrapper__willRetryBackgroundDataTask_withError___block_invoke;
        v23[3] = &unk_1E14FBED8;
        v24 = v9;
        v25 = v13;
        v26 = v5;
        v27 = v7;
        v14 = v13;
        -[NSURLSession runDelegateBlock:]((uint64_t)v14, v23);
        v15 = &v24;
        v16 = &v25;
        v17 = &v26;

        goto LABEL_14;
      }
    }
    else
    {
      objc_getProperty((id)a1, v8, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = 2;
      else
        v11 = 0;
      v12 = *(_BYTE *)(a1 + 17) & 0xFD | v11;
      *(_BYTE *)(a1 + 17) = v12;
      v10 = *(_BYTE *)(a1 + 11) | 0x40;
      *(_BYTE *)(a1 + 11) = v10;
      if ((v12 & 2) != 0)
        goto LABEL_7;
    }
    if ((v10 & 0x20) == 0)
    {
      objc_getProperty((id)a1, v8, 32, 1);
      v12 = *(_BYTE *)(a1 + 17) & 0xFE | objc_opt_respondsToSelector() & 1;
      *(_BYTE *)(a1 + 17) = v12;
      *(_BYTE *)(a1 + 11) |= 0x20u;
    }
    if ((v12 & 1) == 0)
    {
      -[__NSCFURLSessionDelegateWrapper _willRetryBackgroundDataTask:withError:](*(_QWORD *)(a1 + 24), v5, v7);
LABEL_15:

      goto LABEL_16;
    }
    v18 = *(id *)(a1 + 40);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __74____NSCFURLSessionDelegateWrapper__willRetryBackgroundDataTask_withError___block_invoke_2;
    v19[3] = &unk_1E14FE1E0;
    v20 = v9;
    v21 = v18;
    v22 = v5;
    v14 = v18;
    -[NSURLSession runDelegateBlock:]((uint64_t)v14, v19);
    v15 = &v20;
    v16 = &v21;
    v17 = &v22;
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:

}

- (void)downloadTask:(void *)a3 didFinishDownloadingToURL:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  const char *v9;
  void (**v10)(_QWORD);
  id v11;
  const char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void (**v24)(_QWORD);

  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (a1)
  {
    v11 = objc_getProperty((id)a1, v9, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check_didFinishDownloadingToURL]((unsigned __int8 *)a1, v12))
    {
      v13 = *(id *)(a1 + 40);
      v14 = *(id *)(a1 + 48);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __92____NSCFURLSessionDelegateWrapper_downloadTask_didFinishDownloadingToURL_completionHandler___block_invoke;
      v18[3] = &unk_1E14F6398;
      v19 = v11;
      v20 = v13;
      v21 = v7;
      v22 = v8;
      v23 = v14;
      v24 = v10;
      v15 = v14;
      v16 = v13;
      -[NSURLSession runDelegateBlock:]((uint64_t)v16, v18);

    }
    else
    {
      v17 = *(_QWORD *)(a1 + 24);
      if (v17)
        -[__NSCFURLSessionDelegateWrapper downloadTask:didFinishDownloadingToURL:completionHandler:](v17, v7, v8, v10);
      else
        v10[2](v10);
    }

  }
}

- (void)downloadTask:(uint64_t)a3 didWriteData:(uint64_t)a4 totalBytesWritten:(uint64_t)a5 totalBytesExpectedToWrite:(void *)a6 completionHandler:
{
  id v11;
  const char *v12;
  void (**v13)(_QWORD);
  id v14;
  const char *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  void (**v26)(_QWORD);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v11 = a2;
  v13 = a6;
  if (a1)
  {
    v14 = objc_getProperty((id)a1, v12, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check_didWriteData]((unsigned __int8 *)a1, v15))
    {
      v16 = *(id *)(a1 + 40);
      v17 = *(id *)(a1 + 48);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __123____NSCFURLSessionDelegateWrapper_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite_completionHandler___block_invoke;
      v21[3] = &unk_1E14F6550;
      v22 = v14;
      v23 = v16;
      v27 = a3;
      v28 = a4;
      v29 = a5;
      v24 = v11;
      v25 = v17;
      v26 = v13;
      v18 = v17;
      v19 = v16;
      -[NSURLSession runDelegateBlock:]((uint64_t)v19, v21);

    }
    else
    {
      v20 = *(_QWORD *)(a1 + 24);
      if (v20)
        -[__NSCFURLSessionDelegateWrapper downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:completionHandler:](v20, v11, a3, a4, a5, v13);
      else
        v13[2](v13);
    }

  }
}

- (void)downloadTask:(uint64_t)a3 didResumeAtOffset:(uint64_t)a4 expectedTotalBytes:
{
  const char *v7;
  id v8;
  const char *v9;
  id v10;
  int v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v8 = a2;
  if (a1)
  {
    v10 = objc_getProperty((id)a1, v7, 32, 1);
    if ((*(_BYTE *)(a1 + 12) & 2) != 0)
    {
      if ((*(_BYTE *)(a1 + 17) & 0x10) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper downloadTask:didResumeAtOffset:expectedTotalBytes:](*(_QWORD *)(a1 + 24), v8, a3, a4);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v9, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = 16;
      else
        v11 = 0;
      *(_BYTE *)(a1 + 17) = *(_BYTE *)(a1 + 17) & 0xEF | v11;
      *(_BYTE *)(a1 + 12) |= 2u;
      if (!v11)
        goto LABEL_7;
    }
    v12 = *(id *)(a1 + 40);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85____NSCFURLSessionDelegateWrapper_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke;
    v14[3] = &unk_1E14F6578;
    v15 = v10;
    v16 = v12;
    v17 = v8;
    v18 = a3;
    v19 = a4;
    v13 = v12;
    -[NSURLSession runDelegateBlock:]((uint64_t)v13, v14);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)downloadTask:(void *)a3 _didReceiveResponse:
{
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  id v9;
  int v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v7 = a3;
  if (a1)
  {
    v9 = objc_getProperty((id)a1, v6, 32, 1);
    if ((*(_BYTE *)(a1 + 12) & 4) != 0)
    {
      if ((*(_BYTE *)(a1 + 17) & 0x20) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper downloadTask:_didReceiveResponse:](*(_QWORD *)(a1 + 24), v5, v7);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v8, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = 32;
      else
        v10 = 0;
      *(_BYTE *)(a1 + 17) = *(_BYTE *)(a1 + 17) & 0xDF | v10;
      *(_BYTE *)(a1 + 12) |= 4u;
      if (!v10)
        goto LABEL_7;
    }
    v11 = *(id *)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68____NSCFURLSessionDelegateWrapper_downloadTask__didReceiveResponse___block_invoke;
    v13[3] = &unk_1E14FBED8;
    v14 = v9;
    v15 = v11;
    v16 = v5;
    v17 = v7;
    v12 = v11;
    -[NSURLSession runDelegateBlock:]((uint64_t)v12, v13);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)readClosedForStreamTask:(void *)a3 completionHandler:
{
  id v5;
  const char *v6;
  void (**v7)(_QWORD);
  const char *v8;
  id v9;
  char v10;
  char v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD);

  v5 = a2;
  v7 = a3;
  if (a1)
  {
    v9 = objc_getProperty((id)a1, v6, 32, 1);
    if ((*(_BYTE *)(a1 + 12) & 0x10) != 0)
    {
      if ((*(_BYTE *)(a1 + 17) & 0x80) != 0)
      {
LABEL_7:
        v12 = *(id *)(a1 + 40);
        v13 = *(id *)(a1 + 48);
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __77____NSCFURLSessionDelegateWrapper_readClosedForStreamTask_completionHandler___block_invoke;
        v17[3] = &unk_1E14FDE58;
        v18 = v9;
        v19 = v12;
        v20 = v5;
        v21 = v13;
        v22 = v7;
        v14 = v13;
        v15 = v12;
        -[NSURLSession runDelegateBlock:]((uint64_t)v15, v17);

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
      objc_getProperty((id)a1, v8, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = 0x80;
      else
        v10 = 0;
      v11 = v10 & 0x80 | *(_BYTE *)(a1 + 17) & 0x7F;
      *(_BYTE *)(a1 + 17) = v11;
      *(_BYTE *)(a1 + 12) |= 0x10u;
      if (v11 < 0)
        goto LABEL_7;
    }
    v16 = *(_QWORD *)(a1 + 24);
    if (v16)
      -[__NSCFURLSessionDelegateWrapper readClosedForStreamTask:completionHandler:](v16, v5, v7);
    else
      v7[2](v7);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)writeClosedForStreamTask:(void *)a3 completionHandler:
{
  id v5;
  const char *v6;
  void (**v7)(_QWORD);
  const char *v8;
  id v9;
  char v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);

  v5 = a2;
  v7 = a3;
  if (a1)
  {
    v9 = objc_getProperty((id)a1, v6, 32, 1);
    if ((*(_BYTE *)(a1 + 12) & 0x20) != 0)
    {
      if ((*(_BYTE *)(a1 + 18) & 1) != 0)
        goto LABEL_4;
    }
    else
    {
      objc_getProperty((id)a1, v8, 32, 1);
      v10 = *(_BYTE *)(a1 + 18) & 0xFE | objc_opt_respondsToSelector() & 1;
      *(_BYTE *)(a1 + 18) = v10;
      *(_BYTE *)(a1 + 12) |= 0x20u;
      if ((v10 & 1) != 0)
      {
LABEL_4:
        v11 = *(id *)(a1 + 40);
        v12 = *(id *)(a1 + 48);
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __78____NSCFURLSessionDelegateWrapper_writeClosedForStreamTask_completionHandler___block_invoke;
        v16[3] = &unk_1E14FDE58;
        v17 = v9;
        v18 = v11;
        v19 = v5;
        v20 = v12;
        v21 = v7;
        v13 = v12;
        v14 = v11;
        -[NSURLSession runDelegateBlock:]((uint64_t)v14, v16);

LABEL_9:
        goto LABEL_10;
      }
    }
    v15 = *(_QWORD *)(a1 + 24);
    if (v15)
      -[__NSCFURLSessionDelegateWrapper writeClosedForStreamTask:completionHandler:](v15, v5, v7);
    else
      v7[2](v7);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)betterRouteDiscoveredForStreamTask:(uint64_t)a1
{
  const char *v3;
  id v4;
  id v5;
  const char *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v4 = a2;
  if (a1)
  {
    v5 = objc_getProperty((id)a1, v3, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check_betterRouteDiscovered]((unsigned __int8 *)a1, v6))
    {
      v7 = *(id *)(a1 + 40);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __70____NSCFURLSessionDelegateWrapper_betterRouteDiscoveredForStreamTask___block_invoke;
      v9[3] = &unk_1E14FE1E0;
      v10 = v5;
      v11 = v7;
      v12 = v4;
      v8 = v7;
      -[NSURLSession runDelegateBlock:]((uint64_t)v8, v9);

    }
    else
    {
      -[__NSCFURLSessionDelegateWrapper betterRouteDiscoveredForStreamTask:](*(_QWORD *)(a1 + 24), v4);
    }

  }
}

- (void)streamTask:(void *)a3 didBecomeInputStream:(void *)a4 outputStream:(void *)a5 completionHandler:
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  void (**v13)(_QWORD);
  id v14;
  const char *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void (**v28)(_QWORD);

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v13 = a5;
  if (a1)
  {
    v14 = objc_getProperty((id)a1, v12, 32, 1);
    if (-[__NSCFURLSessionDelegateWrapper check_didBecomeInputOutputStream]((unsigned __int8 *)a1, v15))
    {
      v16 = *(id *)(a1 + 40);
      v17 = *(id *)(a1 + 48);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __98____NSCFURLSessionDelegateWrapper_streamTask_didBecomeInputStream_outputStream_completionHandler___block_invoke;
      v21[3] = &unk_1E14F63E8;
      v22 = v14;
      v23 = v16;
      v24 = v9;
      v25 = v10;
      v26 = v11;
      v27 = v17;
      v28 = v13;
      v18 = v17;
      v19 = v16;
      -[NSURLSession runDelegateBlock:]((uint64_t)v19, v21);

    }
    else
    {
      v20 = *(_QWORD *)(a1 + 24);
      if (v20)
        -[__NSCFURLSessionDelegateWrapper streamTask:didBecomeInputStream:outputStream:completionHandler:](v20, v9, v10, v11, v13);
      else
        v13[2](v13);
    }

  }
}

- (void)_connectionEstablishedForStreamTask:(uint64_t)a1
{
  const char *v3;
  id v4;
  const char *v5;
  id v6;
  int v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v4 = a2;
  if (a1)
  {
    v6 = objc_getProperty((id)a1, v3, 32, 1);
    if ((*(_BYTE *)(a1 + 13) & 1) != 0)
    {
      if ((*(_BYTE *)(a1 + 18) & 8) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper _connectionEstablishedForStreamTask:](*(_QWORD *)(a1 + 24), v4);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v5, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = 8;
      else
        v7 = 0;
      *(_BYTE *)(a1 + 18) = *(_BYTE *)(a1 + 18) & 0xF7 | v7;
      *(_BYTE *)(a1 + 13) |= 1u;
      if (!v7)
        goto LABEL_7;
    }
    v8 = *(id *)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71____NSCFURLSessionDelegateWrapper__connectionEstablishedForStreamTask___block_invoke;
    v10[3] = &unk_1E14FE1E0;
    v11 = v6;
    v12 = v8;
    v13 = v4;
    v9 = v8;
    -[NSURLSession runDelegateBlock:]((uint64_t)v9, v10);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)webSocketTask:(void *)a3 didOpenWithProtocol:
{
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  id v9;
  int v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v7 = a3;
  if (a1)
  {
    v9 = objc_getProperty((id)a1, v6, 32, 1);
    if ((*(_BYTE *)(a1 + 13) & 2) != 0)
    {
      if ((*(_BYTE *)(a1 + 18) & 0x10) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper webSocketTask:didOpenWithProtocol:](*(_QWORD *)(a1 + 24), v5, v7);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v8, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = 16;
      else
        v10 = 0;
      *(_BYTE *)(a1 + 18) = *(_BYTE *)(a1 + 18) & 0xEF | v10;
      *(_BYTE *)(a1 + 13) |= 2u;
      if (!v10)
        goto LABEL_7;
    }
    v11 = *(id *)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69____NSCFURLSessionDelegateWrapper_webSocketTask_didOpenWithProtocol___block_invoke;
    v13[3] = &unk_1E14FBED8;
    v14 = v9;
    v15 = v11;
    v16 = v5;
    v17 = v7;
    v12 = v11;
    -[NSURLSession runDelegateBlock:]((uint64_t)v12, v13);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)webSocketTask:(uint64_t)a3 didCloseWithCode:(void *)a4 reason:
{
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  id v11;
  int v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v7 = a2;
  v9 = a4;
  if (a1)
  {
    v11 = objc_getProperty((id)a1, v8, 32, 1);
    if ((*(_BYTE *)(a1 + 13) & 4) != 0)
    {
      if ((*(_BYTE *)(a1 + 18) & 0x20) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper webSocketTask:didCloseWithCode:reason:](*(_QWORD *)(a1 + 24), v7, a3, v9);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v10, 32, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = 32;
      else
        v12 = 0;
      *(_BYTE *)(a1 + 18) = *(_BYTE *)(a1 + 18) & 0xDF | v12;
      *(_BYTE *)(a1 + 13) |= 4u;
      if (!v12)
        goto LABEL_7;
    }
    v13 = *(id *)(a1 + 40);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __73____NSCFURLSessionDelegateWrapper_webSocketTask_didCloseWithCode_reason___block_invoke;
    v15[3] = &unk_1E14F7C50;
    v16 = v11;
    v17 = v13;
    v18 = v7;
    v20 = a3;
    v19 = v9;
    v14 = v13;
    -[NSURLSession runDelegateBlock:]((uint64_t)v14, v15);

    goto LABEL_10;
  }
LABEL_11:

}

@end
