@implementation CNAutocompleteSearchOperation

+ (id)operationWithOwner:(id)a3 text:(id)a4 taskID:(id)a5
{
  id v9;
  id v10;
  id v11;
  id *v12;
  id *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (id *)objc_alloc_init((Class)a1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(v12 + 31, a3);
    objc_storeStrong(v13 + 32, a5);
    v14 = objc_msgSend(v10, "copy");
    v15 = v13[33];
    v13[33] = (id)v14;

    objc_msgSend(v9, "sendingAddress");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v13[34];
    v13[34] = (id)v16;

  }
  return v13;
}

- (unint64_t)type
{
  return 2;
}

- (CNAutocompleteSearchManager)owner
{
  return self->_owner;
}

- (NSNumber)taskID
{
  return self->_taskID;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)sendingAddress
{
  return self->_sendingAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingAddress, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_owner, 0);
}

@end
