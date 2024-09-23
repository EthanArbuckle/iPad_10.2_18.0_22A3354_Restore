@implementation FCAVAssetDownload

- (id)initWithAssetID:(void *)a3 underlyingOperation:
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)FCAVAssetDownload;
    a1 = (id *)objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = a1[1];
      a1[1] = (id)v7;

      objc_storeStrong(a1 + 2, a3);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[3];
      a1[3] = (id)v9;

    }
  }

  return a1;
}

- (NSString)shortOperationDescription
{
  if (self)
    self = (FCAVAssetDownload *)self->_underlyingOperation;
  return -[FCAVAssetDownload shortOperationDescription](self, "shortOperationDescription");
}

- (NSString)longOperationDescription
{
  if (self)
    self = (FCAVAssetDownload *)self->_underlyingOperation;
  return -[FCAVAssetDownload longOperationDescription](self, "longOperationDescription");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_underlyingOperation, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
