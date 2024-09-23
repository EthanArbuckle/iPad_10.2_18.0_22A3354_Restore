@implementation __NSCFURLProtocolClient_NS

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)__NSCFURLProtocolClient_NS;
  -[__NSCFURLProtocolClient_NS dealloc](&v2, sel_dealloc);
}

- (void)URLProtocol:(id)a3 wasRedirectedToRequest:(id)a4 redirectResponse:(id)a5
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82____NSCFURLProtocolClient_NS_URLProtocol_wasRedirectedToRequest_redirectResponse___block_invoke;
  v5[3] = &unk_1E14FE1E0;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v5);
}

- (void)URLProtocol:(id)a3 cachedResponseIsValid:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64____NSCFURLProtocolClient_NS_URLProtocol_cachedResponseIsValid___block_invoke;
  v4[3] = &unk_1E14FDE88;
  v4[4] = self;
  v4[5] = a4;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v4);
}

- (void)URLProtocol:(id)a3 didReceiveResponse:(id)a4 cacheStoragePolicy:(unint64_t)a5
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80____NSCFURLProtocolClient_NS_URLProtocol_didReceiveResponse_cacheStoragePolicy___block_invoke;
  v5[3] = &unk_1E14FD950;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v5);
}

- (void)URLProtocol:(id)a3 didLoadData:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  CFDataRef Copy;
  _QWORD v9[7];

  if (a4)
  {
    v6 = objc_msgSend(a4, "length", a3);
    if (v6)
    {
      v7 = v6;
      Copy = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFDataRef)a4);
      if (Copy)
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __54____NSCFURLProtocolClient_NS_URLProtocol_didLoadData___block_invoke;
        v9[3] = &unk_1E14FB048;
        v9[4] = self;
        v9[5] = Copy;
        v9[6] = v7;
        -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v9);
      }
    }
  }
}

- (void)URLProtocolDidFinishLoading:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58____NSCFURLProtocolClient_NS_URLProtocolDidFinishLoading___block_invoke;
  v3[3] = &unk_1E14FE118;
  v3[4] = self;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v3);
}

- (void)URLProtocol:(id)a3 didFailWithError:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59____NSCFURLProtocolClient_NS_URLProtocol_didFailWithError___block_invoke;
  v4[3] = &unk_1E14FDE88;
  v4[4] = self;
  v4[5] = a4;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v4);
}

- (void)URLProtocol:(id)a3 didReceiveAuthenticationChallenge:(id)a4
{
  _QWORD v6[5];

  objc_sync_enter(self);
  self->_challenge = (NSURLAuthenticationChallenge *)a4;
  self->_cfChallenge = (_CFURLAuthChallenge *)objc_msgSend(a4, "_createCFAuthChallenge");
  objc_sync_exit(self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76____NSCFURLProtocolClient_NS_URLProtocol_didReceiveAuthenticationChallenge___block_invoke;
  v6[3] = &unk_1E14FE118;
  v6[4] = self;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v6);
}

- (void)withCustomProtocolScheduling:(void *)a1
{
  uint64_t v4;
  id v5;
  _QWORD v6[6];
  void (*v7[5])(_QWORD, _QWORD, _QWORD);
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  if (a1)
  {
    if (-[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sOnce != -1)
      dispatch_once(&-[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sOnce, &__block_literal_global);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v4 = MEMORY[0x1E0C809B0];
    v7[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v7[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
    v7[2] = (void (*)(_QWORD, _QWORD, _QWORD))__59____NSCFURLProtocolClient_NS_withCustomProtocolScheduling___block_invoke_2;
    v7[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E14FD900;
    v7[4] = (void (*)(_QWORD, _QWORD, _QWORD))&v8;
    CoreSchedulingSet::applyBlock(-[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sProtocolScheduling, v7);
    if (*((_BYTE *)v9 + 24))
    {
      (*(void (**)(uint64_t))(a2 + 16))(a2);
    }
    else
    {
      v5 = a1;
      v6[0] = v4;
      v6[1] = 3221225472;
      v6[2] = __59____NSCFURLProtocolClient_NS_withCustomProtocolScheduling___block_invoke_3;
      v6[3] = &unk_1E14FDF00;
      v6[4] = a1;
      v6[5] = a2;
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)-[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sProtocolScheduling
                                                + 96))(-[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sProtocolScheduling, v6);
    }
    _Block_object_dispose(&v8, 8);
  }
}

- (id)challenge
{
  id *v1;
  id v2;

  if (result)
  {
    v1 = result;
    objc_sync_enter(result);
    v2 = v1[3];
    objc_sync_exit(v1);
    return (id *)v2;
  }
  return result;
}

@end
