@implementation EDSynapseAttributes

- (EDSynapseAttributes)initWithSenderAddressComment:(id)a3 senderAddress:(id)a4 messagePersistentID:(id)a5 receivedDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EDSynapseAttributes *v15;
  EDSynapseAttributes *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)EDSynapseAttributes;
  v15 = -[EDSynapseAttributes init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_senderAddressComment, a3);
    objc_storeStrong((id *)&v16->_senderAddress, a4);
    objc_storeStrong((id *)&v16->_messagePersistentID, a5);
    objc_storeStrong((id *)&v16->_receivedDate, a6);
  }

  return v16;
}

- (BOOL)saveToFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0718]), "initWithEDAttributes:file:", self, v6);
  LOBYTE(a4) = objc_msgSend(v7, "saveToFileURL:error:", v6, a4);

  return (char)a4;
}

- (void)saveToFile:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0718]), "initWithEDAttributes:file:", self, v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__EDSynapseAttributes_saveToFile_completion___block_invoke;
  v10[3] = &unk_1E94A1E30;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "saveToFileURL:additionalAttributes:completion:", v6, 0, v10);

}

uint64_t __45__EDSynapseAttributes_saveToFile_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)senderAddressComment
{
  return self->_senderAddressComment;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (NSString)messagePersistentID
{
  return self->_messagePersistentID;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedDate, 0);
  objc_storeStrong((id *)&self->_messagePersistentID, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_senderAddressComment, 0);
}

@end
