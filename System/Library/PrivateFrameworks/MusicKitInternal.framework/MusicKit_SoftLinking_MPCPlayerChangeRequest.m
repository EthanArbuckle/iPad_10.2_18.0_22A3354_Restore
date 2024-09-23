@implementation MusicKit_SoftLinking_MPCPlayerChangeRequest

- (MusicKit_SoftLinking_MPCPlayerChangeRequest)initWithCommandRequests:(id)a3
{
  id v4;
  MusicKit_SoftLinking_MPCPlayerChangeRequest *v5;
  id v6;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  MPCPlayerChangeRequest *underlyingChangeRequest;
  objc_super v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MusicKit_SoftLinking_MPCPlayerChangeRequest;
  v5 = -[MusicKit_SoftLinking_MPCPlayerChangeRequest init](&v12, sel_init);
  if (v5)
  {
    v6 = v4;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v7 = (void *)getMPCPlayerChangeRequestClass_softClass;
    v17 = getMPCPlayerChangeRequestClass_softClass;
    if (!getMPCPlayerChangeRequestClass_softClass)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getMPCPlayerChangeRequestClass_block_invoke;
      v13[3] = &unk_1E9C05688;
      v13[4] = &v14;
      __getMPCPlayerChangeRequestClass_block_invoke((uint64_t)v13);
      v7 = (void *)v15[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v14, 8);
    v9 = objc_msgSend([v8 alloc], "initWithCommandRequests:", v6);
    underlyingChangeRequest = v5->_underlyingChangeRequest;
    v5->_underlyingChangeRequest = (MPCPlayerChangeRequest *)v9;

    -[MPCPlayerChangeRequest setOptions:](v5->_underlyingChangeRequest, "setOptions:", 0x10000);
  }

  return v5;
}

- (void)performWithCompletion:(id)a3
{
  id v4;
  MPCPlayerChangeRequest *underlyingChangeRequest;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  underlyingChangeRequest = self->_underlyingChangeRequest;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__MusicKit_SoftLinking_MPCPlayerChangeRequest_performWithCompletion___block_invoke;
  v7[3] = &unk_1E9C06118;
  v8 = v4;
  v6 = v4;
  -[MPCPlayerChangeRequest performWithExtendedStatusCompletion:](underlyingChangeRequest, "performWithExtendedStatusCompletion:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingChangeRequest, 0);
}

@end
