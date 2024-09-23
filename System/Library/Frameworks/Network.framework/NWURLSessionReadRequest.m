@implementation NWURLSessionReadRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong(&self->_awaitingData, 0);
}

- (void)putData:(char)a3 complete:
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  dispatch_data_t concat;
  void *v9;
  NSObject *v10;
  NSObject *data2;

  v5 = a2;
  if (a1)
  {
    data2 = v5;
    if (v5)
    {
      v6 = *(void **)(a1 + 40);
      if (v6)
      {
        v7 = v6;
        concat = dispatch_data_create_concat(v7, data2);
        v9 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = concat;

      }
      else
      {
        v10 = v5;
        v7 = *(NSObject **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v10;
      }

    }
    *(_BYTE *)(a1 + 8) = a3;
    -[NWURLSessionReadRequest tryFulfillRequest](a1);
    v5 = data2;
  }

}

- (void)tryFulfillRequest
{
  void *v1;
  void *v3;
  size_t v4;
  size_t v5;
  dispatch_data_t subrange;
  void *v7;
  dispatch_data_t v8;
  id v9;
  void *v10;
  size_t size;
  size_t v12;
  id v13;
  SEL v14;
  SEL v15;
  dispatch_data_t data;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      data = v1;
      objc_setProperty_nonatomic_copy((id)a1, v15, 0, 32);
      ((void (*)(dispatch_data_t, _QWORD, _QWORD, _QWORD))data[2].isa)(data, 0, 0, *(_QWORD *)(a1 + 48));
    }
    else
    {
      if (!*(_BYTE *)(a1 + 8))
      {
        v9 = *(id *)(a1 + 40);
        if (!v9)
          return;
        v10 = v9;
        size = dispatch_data_get_size(*(dispatch_data_t *)(a1 + 40));
        v12 = *(_QWORD *)(a1 + 16);

        if (size <= v12)
          return;
      }
      data = (dispatch_data_t)*(id *)(a1 + 40);
      v3 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

      if (data)
      {
        v4 = dispatch_data_get_size(data);
        v5 = *(_QWORD *)(a1 + 24);
        if (v4 > v5)
        {
          subrange = dispatch_data_create_subrange(data, v5, 0xFFFFFFFFFFFFFFFFLL);
          v7 = *(void **)(a1 + 40);
          *(_QWORD *)(a1 + 40) = subrange;

          v8 = dispatch_data_create_subrange(data, 0, *(_QWORD *)(a1 + 24));
          data = v8;
        }
      }
      else
      {
        data = 0;
      }
      v13 = *(id *)(a1 + 32);
      objc_setProperty_nonatomic_copy((id)a1, v14, 0, 32);
      (*((void (**)(id, dispatch_data_t, _QWORD, _QWORD))v13 + 2))(v13, data, *(unsigned __int8 *)(a1 + 8), 0);

    }
  }
}

- (void)putError:(uint64_t)a1
{
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;

    if (!*(_BYTE *)(a1 + 8) && !*(_QWORD *)(a1 + 48))
    {
      objc_storeStrong((id *)(a1 + 48), a2);
      -[NWURLSessionReadRequest tryFulfillRequest](a1);
    }
  }

}

@end
