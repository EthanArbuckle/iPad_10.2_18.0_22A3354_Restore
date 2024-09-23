@implementation CGRemotePDFPageProxy

- (CGRemotePDFPageProxy)initWithRemotePage:(id)a3
{
  id v5;
  CGRemotePDFPageProxy *v6;
  CGRemotePDFPageProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CGRemotePDFPageProxy;
  v6 = -[CGRemotePDFPageProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pageProxy, a3);

  return v7;
}

- (NSUUID)identifier
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9668;
  v10 = __Block_byref_object_dispose__9669;
  v11 = 0;
  -[CGRemotePDFPageProtocol synchronousRemoteObjectProxyWithErrorHandler:](self->_pageProxy, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_9681);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__CGRemotePDFPageProxy_identifier__block_invoke_2;
  v5[3] = &unk_1E165A678;
  v5[4] = &v6;
  objc_msgSend(v2, "getIdentifier:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSUUID *)v3;
}

- (int64_t)rotation
{
  void *v2;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CGRemotePDFPageProtocol synchronousRemoteObjectProxyWithErrorHandler:](self->_pageProxy, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_3_9679);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__CGRemotePDFPageProxy_rotation__block_invoke_2;
  v5[3] = &unk_1E16617A8;
  v5[4] = &v6;
  objc_msgSend(v2, "getRotation:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CGRect)rectForBox:(int)a3
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[5];
  uint64_t v14;
  double *v15;
  uint64_t v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  CGRect result;

  v3 = *(_QWORD *)&a3;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x4010000000;
  v17 = "";
  v18 = 0u;
  v19 = 0u;
  -[CGRemotePDFPageProtocol synchronousRemoteObjectProxyWithErrorHandler:](self->_pageProxy, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_5_9677);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __35__CGRemotePDFPageProxy_rectForBox___block_invoke_2;
  v13[3] = &unk_1E165A6E0;
  v13[4] = &v14;
  objc_msgSend(v4, "getBoxRect:completion:", v3, v13);

  v5 = v15[4];
  v6 = v15[5];
  v7 = v15[6];
  v8 = v15[7];
  _Block_object_dispose(&v14, 8);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)drawWithBox:(int)a3 size:(CGSize)a4 colorSpace:(id)a5 options:(id)a6 completion:(id)a7
{
  double height;
  double width;
  uint64_t v11;
  id v13;
  CGRemotePDFPageProtocol *pageProxy;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  height = a4.height;
  width = a4.width;
  v11 = *(_QWORD *)&a3;
  v13 = a7;
  pageProxy = self->_pageProxy;
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __71__CGRemotePDFPageProxy_drawWithBox_size_colorSpace_options_completion___block_invoke;
  v23[3] = &unk_1E1661818;
  v16 = v13;
  v24 = v16;
  v17 = a6;
  v18 = a5;
  -[CGRemotePDFPageProtocol remoteObjectProxyWithErrorHandler:](pageProxy, "remoteObjectProxyWithErrorHandler:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __71__CGRemotePDFPageProxy_drawWithBox_size_colorSpace_options_completion___block_invoke_2;
  v21[3] = &unk_1E165A708;
  v22 = v16;
  v20 = v16;
  objc_msgSend(v19, "drawWithBox:size:colorSpace:options:completion:", v11, v18, v17, v21, width, height);

}

- (NSString)pageText
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9668;
  v10 = __Block_byref_object_dispose__9669;
  v11 = 0;
  -[CGRemotePDFPageProtocol synchronousRemoteObjectProxyWithErrorHandler:](self->_pageProxy, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_8_9674);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__CGRemotePDFPageProxy_pageText__block_invoke_2;
  v5[3] = &unk_1E165A750;
  v5[4] = &v6;
  objc_msgSend(v2, "getPageText:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (id)getPageTextAndReturnError:(id *)a3
{
  uint64_t v4;
  CGRemotePDFPageProtocol *pageProxy;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9668;
  v21 = __Block_byref_object_dispose__9669;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__9668;
  v15 = __Block_byref_object_dispose__9669;
  v16 = 0;
  v4 = MEMORY[0x1E0C809B0];
  pageProxy = self->_pageProxy;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__CGRemotePDFPageProxy_getPageTextAndReturnError___block_invoke;
  v10[3] = &unk_1E1660FD8;
  v10[4] = &v11;
  -[CGRemotePDFPageProtocol synchronousRemoteObjectProxyWithErrorHandler:](pageProxy, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __50__CGRemotePDFPageProxy_getPageTextAndReturnError___block_invoke_2;
  v9[3] = &unk_1E165A750;
  v9[4] = &v17;
  objc_msgSend(v6, "getPageText:", v9);

  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageProxy, 0);
}

void __50__CGRemotePDFPageProxy_getPageTextAndReturnError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  NSLog(CFSTR("%s: error: %@"), "-[CGRemotePDFPageProxy getPageTextAndReturnError:]_block_invoke", v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __50__CGRemotePDFPageProxy_getPageTextAndReturnError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __32__CGRemotePDFPageProxy_pageText__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __32__CGRemotePDFPageProxy_pageText__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s: error: %@"), "-[CGRemotePDFPageProxy pageText]_block_invoke", a2);
}

uint64_t __71__CGRemotePDFPageProxy_drawWithBox_size_colorSpace_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s: error: %@"), "-[CGRemotePDFPageProxy drawWithBox:size:colorSpace:options:completion:]_block_invoke", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__CGRemotePDFPageProxy_drawWithBox_size_colorSpace_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __35__CGRemotePDFPageProxy_rectForBox___block_invoke_2(uint64_t result, double a2, double a3, double a4, double a5)
{
  double *v5;

  v5 = *(double **)(*(_QWORD *)(result + 32) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return result;
}

void __35__CGRemotePDFPageProxy_rectForBox___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s: error: %@"), "-[CGRemotePDFPageProxy rectForBox:]_block_invoke", a2);
}

uint64_t __32__CGRemotePDFPageProxy_rotation__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __32__CGRemotePDFPageProxy_rotation__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s: error: %@"), "-[CGRemotePDFPageProxy rotation]_block_invoke", a2);
}

void __34__CGRemotePDFPageProxy_identifier__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __34__CGRemotePDFPageProxy_identifier__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s: error: %@"), "-[CGRemotePDFPageProxy identifier]_block_invoke", a2);
}

@end
