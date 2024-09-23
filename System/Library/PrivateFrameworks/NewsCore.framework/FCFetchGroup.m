@implementation FCFetchGroup

- (id)initWithKeys:(void *)a3 context:(char)a4 shouldFilter:(void *)a5 qualityOfService:(void *)a6 relativePriority:(void *)a7 completionQueue:(void *)a8 completion:
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  BOOL v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  objc_super v27;

  v15 = a2;
  v16 = a3;
  v17 = a7;
  v18 = a8;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)FCFetchGroup;
    a1 = (id *)objc_msgSendSuper2(&v27, sel_init);
    if (a1)
    {
      v19 = objc_msgSend(v15, "copy");
      v20 = a1[2];
      a1[2] = (id)v19;

      objc_storeStrong(a1 + 3, a3);
      *((_BYTE *)a1 + 8) = a4;
      v21 = 1;
      a1[4] = a5;
      a1[5] = a6;
      if (a5 != (void *)25 && a5 != (void *)33)
        v21 = a6 == (void *)1;
      *((_BYTE *)a1 + 9) = v21;
      objc_storeStrong(a1 + 7, a7);
      v22 = _Block_copy(v18);
      v23 = a1[8];
      a1[8] = v22;

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = a1[9];
      a1[9] = (id)v24;

    }
  }

  return a1;
}

- (int64_t)comparePriority:(id)a3
{
  int64_t *v4;
  int64_t *v5;
  int64_t relativePriority;
  int64_t v7;
  int64_t v8;
  BOOL v9;
  _BOOL8 v10;
  void *v11;
  void *v12;

  v4 = (int64_t *)a3;
  v5 = v4;
  if (self)
  {
    relativePriority = self->_relativePriority;
    if (v4)
    {
      v7 = v4[5];
      if (relativePriority == v7)
      {
        if (self->_isUserFacing)
        {
          if (!*((_BYTE *)v4 + 9))
          {
LABEL_6:
            v8 = -1;
            goto LABEL_19;
          }
LABEL_18:
          -[FCFetchGroup requestDate](self, "requestDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "requestDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v11, "compare:", v12);

          goto LABEL_19;
        }
LABEL_10:
        if (*((_BYTE *)v4 + 9))
        {
          v8 = 1;
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
    else
    {
      if (!relativePriority)
      {
        if (self->_isUserFacing)
          goto LABEL_6;
        goto LABEL_18;
      }
      v7 = 0;
    }
  }
  else
  {
    if (!v4)
      goto LABEL_18;
    v7 = v4[5];
    if (!v7)
      goto LABEL_10;
    relativePriority = 0;
  }
  v9 = v7 < relativePriority;
  v10 = v7 > relativePriority;
  if (v9)
    v8 = -1;
  else
    v8 = v10;
LABEL_19:

  return v8;
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)fireCompletion
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *queue;

  if (a1)
  {
    objc_msgSend(a1, "completionQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)v2;
      objc_msgSend(a1, "completion");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(a1, "completionQueue");
        queue = objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "completion");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_async(queue, v5);

      }
    }
  }
}

- (id)completion
{
  return self->_completion;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (void)setRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->_requestDate, a3);
}

@end
