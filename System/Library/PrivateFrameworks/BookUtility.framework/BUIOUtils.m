@implementation BUIOUtils

+ (void)readAllFromChannel:(id)a3 offset:(int64_t)a4 length:(unint64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  const char *v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  v9 = a3;
  v10 = a6;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_212E534E0;
  v18[4] = sub_212E534F0;
  v11 = (void *)MEMORY[0x24BDAC990];
  v12 = MEMORY[0x24BDAC990];
  v19 = v11;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_212E534F8;
  v15[3] = &unk_24CED9EC8;
  v17 = v18;
  v13 = v10;
  v16 = v13;
  objc_msgSend_readFromOffset_length_handler_(v9, v14, a4, a5, v15);

  _Block_object_dispose(v18, 8);
}

+ (CGDataProvider)newCGDataProviderForInputStream:(id)a3
{
  id v3;
  CGDataProvider *Sequential;

  if (!a3)
    return 0;
  v3 = a3;
  CFRetain(v3);
  Sequential = CGDataProviderCreateSequential(v3, &stru_24CED9EE8);

  return Sequential;
}

+ (CGDataProvider)newCGDataProviderForReadChannel:(id)a3
{
  id v4;
  BUReadChannelInputStreamAdapter *v5;
  const char *v6;
  void *Channel;
  const char *v8;
  uint64_t v9;
  const char *v10;
  CGDataProvider *v11;

  if (!a3)
    return 0;
  v4 = a3;
  v5 = [BUReadChannelInputStreamAdapter alloc];
  Channel = (void *)objc_msgSend_initWithReadChannel_(v5, v6, (uint64_t)v4);

  if (objc_msgSend_canSeek(Channel, v8, v9))
    v11 = (CGDataProvider *)objc_msgSend_newCGDataProviderForInputStream_(a1, v10, (uint64_t)Channel);
  else
    v11 = 0;

  return v11;
}

@end
