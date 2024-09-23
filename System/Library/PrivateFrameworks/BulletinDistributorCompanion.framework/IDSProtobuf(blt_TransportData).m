@implementation IDSProtobuf(blt_TransportData)

- (BLTPBTransportData)transportData
{
  void *v1;
  unint64_t v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  BLTPBTransportData *v7;
  void *v8;

  objc_msgSend(a1, "data");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "length") - 2;
  v3 = objc_retainAutorelease(v1);
  v4 = objc_msgSend(v3, "bytes");
  v5 = *(unsigned __int16 *)(v4 + v2);
  if (*(_WORD *)(v4 + v2))
    v6 = v2 >= v5;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(objc_retainAutorelease(v3), "bytes") + v2 - v5, v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BLTPBTransportData initWithData:]([BLTPBTransportData alloc], "initWithData:", v8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
