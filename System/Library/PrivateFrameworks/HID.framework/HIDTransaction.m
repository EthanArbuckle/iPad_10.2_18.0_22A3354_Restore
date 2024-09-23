@implementation HIDTransaction

- (HIDTransaction)initWithDevice:(id)a3
{
  __IOHIDDevice *v4;
  HIDTransaction *v5;
  IOHIDTransactionRef v6;
  HIDTransaction *v7;
  objc_super v9;

  v4 = (__IOHIDDevice *)a3;
  v9.receiver = self;
  v9.super_class = (Class)HIDTransaction;
  v5 = -[HIDTransaction init](&v9, sel_init);
  if (v5
    && (v6 = IOHIDTransactionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, kIOHIDTransactionDirectionTypeInput, 1u),
        (v5->_transaction = v6) != 0))
  {
    v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  __IOHIDTransaction *transaction;
  objc_super v4;

  transaction = self->_transaction;
  if (transaction)
    CFRelease(transaction);
  v4.receiver = self;
  v4.super_class = (Class)HIDTransaction;
  -[HIDTransaction dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_transaction);
}

- (int64_t)direction
{
  return IOHIDTransactionGetDirection(self->_transaction);
}

- (void)setDirection:(int64_t)a3
{
  IOHIDTransactionSetDirection(self->_transaction, (IOHIDTransactionDirectionType)a3);
}

- (BOOL)commitElements:(id)a3 error:(id *)a4
{
  return -[HIDTransaction commitElements:error:timeout:callback:](self, "commitElements:error:timeout:callback:", a3, a4, 0, 0);
}

- (BOOL)commitElements:(id)a3 error:(id *)a4 timeout:(int64_t)a5 callback:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __IOHIDTransaction *transaction;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v10);
        IOHIDTransactionAddElement(self->_transaction, *(IOHIDElementRef *)(*((_QWORD *)&v21 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }
  transaction = self->_transaction;
  if (v11)
  {
    v17 = _Block_copy(v11);
    v18 = IOHIDTransactionCommitWithCallback(transaction, (double)a5, (IOHIDCallback)asyncCommitCallback, v17);
  }
  else
  {
    v18 = IOHIDTransactionCommit(self->_transaction);
  }
  v19 = v18;
  IOHIDTransactionClear(self->_transaction);
  if ((_DWORD)v19)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithIOReturn:", v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v11)
      _Block_release(v11);
  }

  return (_DWORD)v19 == 0;
}

@end
