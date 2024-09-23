@implementation INImage(INImageProxyInjecting)

- (void)_injectProxiesForImages:()INImageProxyInjecting completion:
{
  _QWORD *v7;
  id v8;
  void *v9;
  void (*v10)(_QWORD *, void *, _QWORD *);
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNImage.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v9 = (void *)objc_msgSend(a1, "copy");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__INImage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
  v13[3] = &unk_1E39A14E0;
  v14 = v8;
  v10 = (void (*)(_QWORD *, void *, _QWORD *))v7[2];
  v11 = v8;
  v10(v7, v9, v13);

}

@end
