@implementation _GCStaticFuture

- (id)_initWithResult:(void *)a1
{
  id v4;
  void *v5;
  id v6;
  void *v8;
  objc_super v9;

  v4 = a2;
  v5 = v4;
  if (a1)
  {
    if (!v4)
    {
      unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithResult_, a1, CFSTR("GCFuture.mm"), 1172, CFSTR("Invalid parameter not satisfying: %s"), "result != nil");

    }
    v9.receiver = a1;
    v9.super_class = (Class)GCFuture;
    v6 = objc_msgSendSuper2(&v9, sel_init);
    *((_DWORD *)v6 + 2) = 0;
    *((_BYTE *)v6 + 12) = -2;
    *((_BYTE *)v6 + 12) = 2;
    objc_storeStrong((id *)v6 + 2, a2);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_initWithError:(void *)a1
{
  id v4;
  void *v5;
  id v6;
  void *v8;
  objc_super v9;

  v4 = a2;
  v5 = v4;
  if (a1)
  {
    if (!v4)
    {
      unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithError_, a1, CFSTR("GCFuture.mm"), 1186, CFSTR("Invalid parameter not satisfying: %s"), "error != nil");

    }
    v9.receiver = a1;
    v9.super_class = (Class)GCFuture;
    v6 = objc_msgSendSuper2(&v9, sel_init);
    *((_DWORD *)v6 + 2) = 0;
    *((_BYTE *)v6 + 12) = -2;
    *((_BYTE *)v6 + 12) = 1;
    objc_storeStrong((id *)v6 + 2, a2);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (_DWORD)_initCancelled
{
  _DWORD *v1;
  void *v2;
  objc_super v4;

  if (!a1)
    return 0;
  v4.receiver = a1;
  v4.super_class = (Class)GCFuture;
  v1 = objc_msgSendSuper2(&v4, sel_init);
  v1[2] = 0;
  *((_BYTE *)v1 + 12) = -2;
  *((_BYTE *)v1 + 12) = 0;
  v2 = (void *)*((_QWORD *)v1 + 2);
  *((_QWORD *)v1 + 2) = 0;

  return v1;
}

@end
