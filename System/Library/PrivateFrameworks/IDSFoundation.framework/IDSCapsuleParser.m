@implementation IDSCapsuleParser

- (IDSCapsuleParser)initWithQueue:(id)a3
{
  id v5;
  IDSCapsuleParser *v6;
  IDSCapsuleParser *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSCapsuleParser;
  v6 = -[IDSCapsuleParser init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (BOOL)_parseHeader
{
  uint64_t *p_currentCapsuleType;
  int v4;
  uint64_t *p_currentCapsuleLength;
  const char *v6;
  uint64_t v7;
  double v8;
  NSObject *v9;
  unsigned __int8 v11;
  __int16 headerBufferSize;
  unsigned __int8 *headerBuffer;

  self->_currentCapsuleHeaderLength = 0;
  headerBuffer = self->_headerBuffer;
  headerBufferSize = self->_headerBufferSize;
  v11 = -86;
  p_currentCapsuleType = (uint64_t *)&self->_currentCapsuleType;
  v4 = sub_19BAC2D64((_DWORD **)&headerBuffer, &headerBufferSize, &self->_currentCapsuleType, &v11);
  if (v4)
  {
    self->_currentCapsuleHeaderLength += v11;
    p_currentCapsuleLength = (uint64_t *)&self->_currentCapsuleLength;
    v4 = sub_19BAC2D64((_DWORD **)&headerBuffer, &headerBufferSize, &self->_currentCapsuleLength, &v11);
    if (v4)
    {
      self->_currentCapsuleHeaderLength += v11;
      self->_headerBufferSize = 0;
      objc_msgSend_IDSNWLink(IDSFoundationLog, v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        sub_19BAFA14C(p_currentCapsuleType, p_currentCapsuleLength, v9);

      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IDSCapsuleParser;
  -[IDSCapsuleParser dealloc](&v2, sel_dealloc);
}

- (void)_readHeader:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void (**v9)(id, unint64_t, dispatch_data_t, uint64_t, OS_nw_error *);
  uint64_t v10;
  NSObject *pendingData;
  size_t currentCapsuleHeaderLength;
  size_t size;
  size_t v14;
  size_t currentCapsuleLength;
  dispatch_data_t subrange;
  OS_dispatch_data *v17;
  NSObject *v18;
  unint64_t v19;
  NSObject *v20;
  OS_dispatch_data *v21;
  OS_nw_error *pendingError;
  _QWORD v23[5];
  void (**v24)(id, unint64_t, dispatch_data_t, uint64_t, OS_nw_error *);
  _QWORD applier[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a3;
  v9 = (void (**)(id, unint64_t, dispatch_data_t, uint64_t, OS_nw_error *))a4;
  v26 = 0;
  v27 = &v26;
  v10 = 0x2020000000;
  v28 = 0x2020000000;
  v29 = 0;
  if (v6
    && (applier[0] = MEMORY[0x1E0C809B0],
        applier[1] = 3221225472,
        applier[2] = sub_19BAC3110,
        applier[3] = &unk_1E3C220E8,
        applier[4] = self,
        applier[5] = &v26,
        dispatch_data_apply(v6, applier),
        *((_BYTE *)v27 + 24)))
  {
    pendingData = self->_pendingData;
    if (!pendingData)
      __assert_rtn("-[IDSCapsuleParser _readHeader:completionHandler:]", "IDSCapsuleParser.m", 122, "_pendingData");
    currentCapsuleHeaderLength = self->_currentCapsuleHeaderLength;
    size = dispatch_data_get_size((dispatch_data_t)self->_pendingData);
    v14 = size - currentCapsuleHeaderLength;
    if (size < currentCapsuleHeaderLength)
      __assert_rtn("-[IDSCapsuleParser _readHeader:completionHandler:]", "IDSCapsuleParser.m", 125, "pendingSize >= headerSize");
    currentCapsuleLength = self->_currentCapsuleLength;
    if (v14 >= currentCapsuleLength)
    {
      subrange = dispatch_data_create_subrange(pendingData, currentCapsuleHeaderLength, currentCapsuleLength);
      v19 = self->_currentCapsuleLength;
      v20 = self->_pendingData;
      if (v14 == v19)
      {
        v21 = 0;
      }
      else
      {
        v21 = (OS_dispatch_data *)dispatch_data_create_subrange(v20, v19 + currentCapsuleHeaderLength, v14 - v19);
        v20 = self->_pendingData;
      }
      self->_pendingData = v21;

      if (self->_pendingData)
        pendingError = 0;
      else
        pendingError = self->_pendingError;
      v9[2](v9, self->_currentCapsuleType, subrange, 1, pendingError);
    }
    else
    {
      subrange = dispatch_data_create_subrange(pendingData, currentCapsuleHeaderLength, v14);
      self->_state = 1;
      self->_waitingBodySize = self->_currentCapsuleLength - v14;
      v17 = self->_pendingData;
      self->_pendingData = 0;

      v9[2](v9, self->_currentCapsuleType, subrange, 0, self->_pendingError);
    }

  }
  else if (self->_pendingError)
  {
    ((void (*)(void (**)(id, unint64_t, dispatch_data_t, uint64_t, OS_nw_error *), _QWORD, _QWORD, BOOL))v9[2])(v9, 0, 0, self->_headerBufferSize == 0);
  }
  else
  {
    objc_msgSend_connection(self, v7, v8, *(double *)&v10);
    v18 = objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_19BAC3190;
    v23[3] = &unk_1E3C22110;
    v23[4] = self;
    v24 = v9;
    nw_connection_receive(v18, 1u, 0x100000u, v23);

  }
  _Block_object_dispose(&v26, 8);

}

- (void)_readWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  unint64_t state;
  char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v8 = v4;
  state = self->_state;
  if (state == 1)
  {
    if (!self->_waitingBodySize)
      sub_19BAFA200();
    if (self->_pendingData)
      sub_19BAFA2C0();
    if (self->_pendingError)
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0);
    }
    else
    {
      objc_msgSend_IDSNWLink(IDSFoundationLog, v5, v6, v7);
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
        sub_19BAFA228(self, v10, v11, v12);

      objc_msgSend_connection(self, v13, v14, v15);
      v16 = objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = sub_19BAC34A8;
      v17[3] = &unk_1E3C22110;
      v17[4] = self;
      v18 = v8;
      nw_connection_receive(v16, 1u, 0x100000u, v17);

    }
  }
  else if (!state)
  {
    if (self->_waitingBodySize)
      sub_19BAFA1D8();
    objc_msgSend__readHeader_completionHandler_(self, v5, (uint64_t)self->_pendingData, v7, v4);
  }

}

- (void)_readCapsuleWithExistingData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  double v11;
  _QWORD v12[4];
  id v13;
  IDSCapsuleParser *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_19BAC3790;
  v12[3] = &unk_1E3C22138;
  v14 = self;
  v15 = v7;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend__readWithCompletionHandler_(self, v10, (uint64_t)v12, v11);

}

- (void)readCapsuleWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  id v8;
  dispatch_block_t v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (self->_state)
    sub_19BAFA350();
  if (self->_processingReadCall)
    sub_19BAFA328();
  v5 = v4;
  self->_processingReadCall = 1;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19BAC3950;
  v10[3] = &unk_1E3C1C400;
  v10[4] = self;
  v11 = v4;
  v7 = queue;
  v8 = v5;
  v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v10);
  dispatch_async(v7, v9);

}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  self->_connection = (OS_nw_connection *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingError, 0);
  objc_storeStrong((id *)&self->_pendingData, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
