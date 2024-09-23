@implementation BUReadChannelInputStreamAdapter

- (BUReadChannelInputStreamAdapter)initWithReadChannel:(id)a3
{
  id v5;
  BUReadChannelInputStreamAdapter *v6;
  BUReadChannelInputStreamAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BUReadChannelInputStreamAdapter;
  v6 = -[BUReadChannelInputStreamAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_readChannel, a3);
    objc_storeStrong((id *)&v7->_leftoverData, MEMORY[0x24BDAC990]);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_close(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)BUReadChannelInputStreamAdapter;
  -[BUReadChannelInputStreamAdapter dealloc](&v4, sel_dealloc);
}

- (int64_t)offset
{
  return self->_offset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  NSObject *leftoverData;
  size_t size;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  size_t v14;
  dispatch_data_t subrange;
  const char *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD v31[5];
  NSObject *v32;
  uint64_t *v33;
  _QWORD *v34;
  uint64_t *v35;
  _QWORD *v36;
  _QWORD v37[3];
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD applier[7];
  _QWORD v46[4];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  unint64_t v50;

  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = a4;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v46[3] = a3;
  leftoverData = self->_leftoverData;
  size = dispatch_data_get_size(leftoverData);
  v8 = MEMORY[0x24BDAC760];
  v9 = a4;
  if (size)
  {
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = sub_212E694A8;
    applier[3] = &unk_24CEDADA0;
    applier[5] = &v47;
    applier[6] = v46;
    applier[4] = self;
    dispatch_data_apply(leftoverData, applier);
    if (v48[3])
    {
      objc_msgSend_setLeftoverData_(self, v10, MEMORY[0x24BDAC990]);
    }
    else
    {
      objc_msgSend_leftoverData(self, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v48[3];
      v14 = dispatch_data_get_size((dispatch_data_t)self->_leftoverData);
      subrange = dispatch_data_create_subrange(v12, a4 - v13, v14 - a4 - v13);
      objc_msgSend_setLeftoverData_(self, v16, (uint64_t)subrange);

    }
    v9 = v48[3];
  }
  if (v9 && self->_readChannel)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = sub_212E69548;
    v43 = sub_212E69558;
    v44 = 0;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v38 = 0;
    v17 = dispatch_group_create();
    dispatch_group_enter(v17);
    v31[0] = v8;
    v31[1] = 3221225472;
    v31[2] = sub_212E69560;
    v31[3] = &unk_24CEDADF0;
    v33 = &v47;
    v34 = v46;
    v31[4] = self;
    v35 = &v39;
    v36 = v37;
    v18 = v17;
    v32 = v18;
    v19 = (void *)MEMORY[0x2199A7288](v31);
    objc_msgSend_readChannel(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend_readChannel(self, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_readFromOffset_length_handler_(v25, v26, self->_offset, v48[3], v19);

    }
    else
    {
      dispatch_group_leave(v18);
    }
    dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    v28 = v40[5];
    if (v28)
      objc_msgSend_bu_raiseWithError_(MEMORY[0x24BDBCE88], v27, v28);

    _Block_object_dispose(v37, 8);
    _Block_object_dispose(&v39, 8);

    v9 = v48[3];
  }
  v29 = a4 - v9;
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&v47, 8);
  return v29;
}

- (void)close
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_readChannel(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_close(v4, v5, v6);

  MEMORY[0x24BEDD108](self, sel_setReadChannel_, 0);
}

- (BOOL)canSeek
{
  uint64_t v2;
  void *v3;
  BOOL v4;

  objc_msgSend_readChannel(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)seekToOffset:(int64_t)a3
{
  void *v5;
  const char *v6;
  const char *v7;

  objc_msgSend_readChannel(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend_setOffset_(self, v6, a3);
    objc_msgSend_setLeftoverData_(self, v7, MEMORY[0x24BDAC990]);
  }
}

- (id)closeLocalStream
{
  return 0;
}

- (BUReadChannel)readChannel
{
  return self->_readChannel;
}

- (void)setReadChannel:(id)a3
{
  objc_storeStrong((id *)&self->_readChannel, a3);
}

- (OS_dispatch_data)leftoverData
{
  return self->_leftoverData;
}

- (void)setLeftoverData:(id)a3
{
  objc_storeStrong((id *)&self->_leftoverData, a3);
}

- (void)setOffset:(int64_t)a3
{
  self->_offset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftoverData, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end
