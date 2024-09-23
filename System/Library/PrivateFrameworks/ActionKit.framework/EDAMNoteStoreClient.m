@implementation EDAMNoteStoreClient

- (EDAMNoteStoreClient)initWithProtocol:(id)a3
{
  return -[EDAMNoteStoreClient initWithInProtocol:outProtocol:](self, "initWithInProtocol:outProtocol:", a3, a3);
}

- (EDAMNoteStoreClient)initWithInProtocol:(id)a3 outProtocol:(id)a4
{
  id v7;
  id v8;
  EDAMNoteStoreClient *v9;
  EDAMNoteStoreClient *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDAMNoteStoreClient;
  v9 = -[EDAMNoteStoreClient init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inProtocol, a3);
    objc_storeStrong((id *)&v10->_outProtocol, a4);
  }

  return v10;
}

- (id)getSyncState:(id)a3
{
  ENTProtocol *outProtocol;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ENTProtocol *inProtocol;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v5 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getSyncState"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getSyncState"), inProtocol, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)getSyncStateWithMetrics:(id)a3 clientMetrics:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("clientMetrics"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getSyncStateWithMetrics"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class(), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getSyncStateWithMetrics"), inProtocol, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)getSyncChunk:(id)a3 afterUSN:(int)a4 maxEntries:(int)a5 fullSyncOnly:(BOOL)a6
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ENTProtocol *inProtocol;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v26;
  ENTProtocol *outProtocol;
  void *v28;
  void *v29;
  _QWORD v31[3];
  _QWORD v32[5];

  v26 = a6;
  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v32[4] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v29, v8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = v28;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 0, CFSTR("afterUSN"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v11;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 0, CFSTR("maxEntries"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 0, CFSTR("fullSyncOnly"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getSyncChunk"), outProtocol, v18);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getSyncChunk"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)getFilteredSyncChunk:(id)a3 afterUSN:(int)a4 maxEntries:(int)a5 filter:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ENTProtocol *inProtocol;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  ENTProtocol *outProtocol;
  void *v28;
  void *v29;
  _QWORD v31[3];
  _QWORD v32[5];

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v32[4] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v9 = a6;
  v10 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v29, v10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = v28;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 0, CFSTR("afterUSN"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v13;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 0, CFSTR("maxEntries"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 4, 12, 0, CFSTR("filter"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v17, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v32[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getFilteredSyncChunk"), outProtocol, v19);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v22;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getFilteredSyncChunk"), inProtocol, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)getLinkedNotebookSyncState:(id)a3 linkedNotebook:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("linkedNotebook"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getLinkedNotebookSyncState"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getLinkedNotebookSyncState"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getLinkedNotebookSyncChunk:(id)a3 linkedNotebook:(id)a4 afterUSN:(int)a5 maxEntries:(int)a6 fullSyncOnly:(BOOL)a7
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ENTProtocol *inProtocol;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  _BOOL4 v31;
  void *v32;
  ENTProtocol *outProtocol;
  void *v34;
  void *v35;
  _QWORD v37[4];
  _QWORD v38[6];

  v31 = a7;
  v7 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a5;
  v38[5] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v10 = a4;
  v11 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v35, v11);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = v34;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("linkedNotebook"), objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v32, v10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v38[1] = v30;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 0, CFSTR("afterUSN"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 8, 0, CFSTR("maxEntries"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v17;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 0, CFSTR("fullSyncOnly"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getLinkedNotebookSyncChunk"), outProtocol, v21);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v23;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v24;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v25;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getLinkedNotebookSyncChunk"), inProtocol, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)listNotebooks:(id)a3
{
  ENTProtocol *outProtocol;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ENTProtocol *inProtocol;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v5 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("listNotebooks"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 15, 0, CFSTR("success"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("listNotebooks"), inProtocol, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)listPublishedBusinessNotebooks:(id)a3
{
  ENTProtocol *outProtocol;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ENTProtocol *inProtocol;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v5 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("listPublishedBusinessNotebooks"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 15, 0, CFSTR("success"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("listPublishedBusinessNotebooks"), inProtocol, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)listAccessibleBusinessNotebooks:(id)a3
{
  ENTProtocol *outProtocol;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ENTProtocol *inProtocol;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v5 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("listAccessibleBusinessNotebooks"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 15, 0, CFSTR("success"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("listAccessibleBusinessNotebooks"), inProtocol, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)getNotebook:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getNotebook"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getNotebook"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getDefaultNotebook:(id)a3
{
  ENTProtocol *outProtocol;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ENTProtocol *inProtocol;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v5 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getDefaultNotebook"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getDefaultNotebook"), inProtocol, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)createNotebook:(id)a3 notebook:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notebook"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("createNotebook"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class(), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("createNotebook"), inProtocol, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (int)updateNotebook:(id)a3 notebook:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notebook"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("updateNotebook"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("updateNotebook"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v20, "intValue");

  return (int)v7;
}

- (int)expungeNotebook:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("expungeNotebook"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("expungeNotebook"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v20, "intValue");

  return (int)v7;
}

- (id)listTags:(id)a3
{
  ENTProtocol *outProtocol;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ENTProtocol *inProtocol;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v5 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("listTags"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 15, 0, CFSTR("success"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("listTags"), inProtocol, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)listTagsByNotebook:(id)a3 notebookGuid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("notebookGuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v24[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("listTagsByNotebook"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 15, 0, CFSTR("success"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v18;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("listTagsByNotebook"), inProtocol, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)getTag:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getTag"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getTag"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)createTag:(id)a3 tag:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("tag"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("createTag"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("createTag"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (int)updateTag:(id)a3 tag:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("tag"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("updateTag"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("updateTag"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v20, "intValue");

  return (int)v7;
}

- (void)untagAll:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[3];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v21[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("untagAll"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class(), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("untagAll"), inProtocol, v18);

}

- (int)expungeTag:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("expungeTag"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("expungeTag"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v20, "intValue");

  return (int)v7;
}

- (id)listSearches:(id)a3
{
  ENTProtocol *outProtocol;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ENTProtocol *inProtocol;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v5 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("listSearches"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 15, 0, CFSTR("success"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("listSearches"), inProtocol, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)getSearch:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getSearch"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getSearch"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)createSearch:(id)a3 search:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("search"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("createSearch"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class(), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("createSearch"), inProtocol, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (int)updateSearch:(id)a3 search:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("search"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("updateSearch"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("updateSearch"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v20, "intValue");

  return (int)v7;
}

- (int)expungeSearch:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("expungeSearch"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("expungeSearch"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v20, "intValue");

  return (int)v7;
}

- (id)findNotes:(id)a3 filter:(id)a4 offset:(int)a5 maxNotes:(int)a6
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ENTProtocol *inProtocol;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  ENTProtocol *outProtocol;
  void *v30;
  _QWORD v32[4];
  _QWORD v33[5];

  v6 = *(_QWORD *)&a5;
  v33[4] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a4;
  v9 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v30, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("filter"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v33[1] = v12;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 0, CFSTR("offset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v15;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 8, 0, CFSTR("maxNotes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("findNotes"), outProtocol, v19);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v22;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v23;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("findNotes"), inProtocol, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (int)findNoteOffset:(id)a3 filter:(id)a4 guid:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ENTProtocol *outProtocol;
  _QWORD v27[4];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v12;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("filter"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("guid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("findNoteOffset"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("findNoteOffset"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v24, "intValue");

  return (int)v17;
}

- (id)findNotesMetadata:(id)a3 filter:(id)a4 offset:(int)a5 maxNotes:(int)a6 resultSpec:(id)a7
{
  uint64_t v7;
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ENTProtocol *inProtocol;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  ENTProtocol *outProtocol;
  void *v34;
  void *v35;
  _QWORD v37[4];
  _QWORD v38[6];

  v7 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a5;
  v38[5] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v11 = a7;
  v12 = a4;
  v13 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v35, v13);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = v34;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("filter"), objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v32, v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v38[1] = v31;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 0, CFSTR("offset"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v16;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 8, 0, CFSTR("maxNotes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 5, 12, 0, CFSTR("resultSpec"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v20, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v38[4] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("findNotesMetadata"), outProtocol, v22);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v24;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v25;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v26;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("findNotesMetadata"), inProtocol, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)getNoteSnippets:(id)a3 noteGuids:(id)a4 maxSnippetLength:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ENTProtocol *inProtocol;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  ENTProtocol *outProtocol;
  _QWORD v29[3];
  _QWORD v30[4];

  v5 = *(_QWORD *)&a5;
  v30[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a4;
  v9 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v11;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 2, 15, 0, CFSTR("noteGuids"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v30[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 0, CFSTR("maxSnippetLength"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getNoteSnippets"), outProtocol, v18);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:keyField:valueField:](FATField, "fieldWithIndex:type:optional:name:keyField:valueField:", 0, 13, 0, CFSTR("success"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v22;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v23;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getNoteSnippets"), inProtocol, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)findNoteCounts:(id)a3 filter:(id)a4 withTrash:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ENTProtocol *outProtocol;
  _QWORD v27[4];
  _QWORD v28[4];

  v5 = a5;
  v28[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a4;
  v9 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v11;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("filter"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = v13;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 0, CFSTR("withTrash"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("findNoteCounts"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("findNoteCounts"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)getNoteWithResultSpec:(id)a3 guid:(id)a4 resultSpec:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ENTProtocol *outProtocol;
  _QWORD v27[4];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v12;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("resultSpec"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getNoteWithResultSpec"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getNoteWithResultSpec"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)getNote:(id)a3 guid:(id)a4 withContent:(BOOL)a5 withResourcesData:(BOOL)a6 withResourcesRecognition:(BOOL)a7 withResourcesAlternateData:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ENTProtocol *inProtocol;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  ENTProtocol *outProtocol;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v42[4];
  _QWORD v43[8];

  v35 = a8;
  v31 = a7;
  v8 = a6;
  v9 = a5;
  v43[6] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v11 = a4;
  v12 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v40, v12);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v43[0] = v39;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v38, v11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v43[1] = v36;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 0, CFSTR("withContent"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v34, v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v32;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 0, CFSTR("withResourcesData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v15;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 0, CFSTR("withResourcesRecognition"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v18;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 0, CFSTR("withResourcesAlternateData"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v35);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getNote"), outProtocol, v22);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v24;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v25;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v26;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getNote"), inProtocol, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)getPreferences:(id)a3 preferenceNames:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ENTProtocol *inProtocol;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 2, 15, 0, CFSTR("preferenceNames"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getPreferences"), outProtocol, v14);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class(), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getPreferences"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (int)updatePreferences:(id)a3 preferencesToUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ENTProtocol *inProtocol;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ENTProtocol *outProtocol;
  _QWORD v24[3];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v6 = a4;
  v7 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = v9;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 15, 1, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:keyField:valueField:](FATField, "fieldWithIndex:type:optional:name:keyField:valueField:", 2, 13, 0, CFSTR("preferencesToUpdate"), v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v25[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("updatePreferences"), outProtocol, v15);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v18;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("updatePreferences"), inProtocol, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(inProtocol) = objc_msgSend(v21, "intValue");

  return (int)inProtocol;
}

- (id)getNoteApplicationData:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getNoteApplicationData"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getNoteApplicationData"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getNoteApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ENTProtocol *outProtocol;
  _QWORD v27[4];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v12;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("key"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getNoteApplicationDataEntry"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 0, CFSTR("success"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getNoteApplicationDataEntry"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (int)setNoteApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5 value:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ENTProtocol *inProtocol;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  ENTProtocol *outProtocol;
  _QWORD v32[4];
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v33[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("key"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v17, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v33[2] = v18;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 0, CFSTR("value"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v19, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v33[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("setNoteApplicationDataEntry"), outProtocol, v21);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v23;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v24;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v25;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("setNoteApplicationDataEntry"), inProtocol, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(inProtocol) = objc_msgSend(v28, "intValue");

  return (int)inProtocol;
}

- (int)unsetNoteApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ENTProtocol *outProtocol;
  _QWORD v27[4];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v12;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("key"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("unsetNoteApplicationDataEntry"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("unsetNoteApplicationDataEntry"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v24, "intValue");

  return (int)v17;
}

- (id)getNoteContent:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getNoteContent"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getNoteContent"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getNoteSearchText:(id)a3 guid:(id)a4 noteOnly:(BOOL)a5 tokenizeForIndexing:(BOOL)a6
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ENTProtocol *inProtocol;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v28;
  ENTProtocol *outProtocol;
  void *v30;
  _QWORD v32[4];
  _QWORD v33[5];

  v28 = a6;
  v6 = a5;
  v33[4] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a4;
  v9 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v30, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v33[1] = v12;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 0, CFSTR("noteOnly"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v15;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 0, CFSTR("tokenizeForIndexing"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getNoteSearchText"), outProtocol, v19);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 0, CFSTR("success"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v22;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v23;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getNoteSearchText"), inProtocol, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)getResourceSearchText:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getResourceSearchText"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getResourceSearchText"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getNoteTagNames:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v24[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getNoteTagNames"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 15, 0, CFSTR("success"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v18;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getNoteTagNames"), inProtocol, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)createNote:(id)a3 note:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("note"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("createNote"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("createNote"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)updateNote:(id)a3 note:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("note"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("updateNote"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("updateNote"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (int)deleteNote:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("deleteNote"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("deleteNote"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v20, "intValue");

  return (int)v7;
}

- (int)expungeNote:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("expungeNote"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("expungeNote"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v20, "intValue");

  return (int)v7;
}

- (int)expungeNotes:(id)a3 noteGuids:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ENTProtocol *outProtocol;
  _QWORD v23[4];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v6 = a4;
  v7 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v9;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 2, 15, 0, CFSTR("noteGuids"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v24[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("expungeNotes"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("expungeNotes"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v20, "intValue");

  return (int)v6;
}

- (int)expungeInactiveNotes:(id)a3
{
  ENTProtocol *outProtocol;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ENTProtocol *inProtocol;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  _QWORD v17[3];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v5 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("expungeInactiveNotes"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("expungeInactiveNotes"), inProtocol, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  return v15;
}

- (id)copyNote:(id)a3 noteGuid:(id)a4 toNotebookGuid:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ENTProtocol *outProtocol;
  _QWORD v27[4];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v12;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("noteGuid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("toNotebookGuid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("copyNote"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("copyNote"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)listNoteVersions:(id)a3 noteGuid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("noteGuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v24[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("listNoteVersions"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 15, 0, CFSTR("success"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v18;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("listNoteVersions"), inProtocol, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)getNoteVersion:(id)a3 noteGuid:(id)a4 updateSequenceNum:(int)a5 withResourcesData:(BOOL)a6 withResourcesRecognition:(BOOL)a7 withResourcesAlternateData:(BOOL)a8
{
  _BOOL8 v8;
  uint64_t v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ENTProtocol *inProtocol;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  ENTProtocol *outProtocol;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v42[4];
  _QWORD v43[8];

  v35 = a8;
  v31 = a7;
  v8 = a6;
  v9 = *(_QWORD *)&a5;
  v43[6] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v11 = a4;
  v12 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v40, v12);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v43[0] = v39;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("noteGuid"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v38, v11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v43[1] = v36;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 0, CFSTR("updateSequenceNum"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v34, v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v32;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 0, CFSTR("withResourcesData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v15;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 0, CFSTR("withResourcesRecognition"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v18;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 0, CFSTR("withResourcesAlternateData"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v35);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getNoteVersion"), outProtocol, v22);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v24;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v25;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v26;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getNoteVersion"), inProtocol, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)getResource:(id)a3 guid:(id)a4 withData:(BOOL)a5 withRecognition:(BOOL)a6 withAttributes:(BOOL)a7 withAlternateData:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ENTProtocol *inProtocol;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  ENTProtocol *outProtocol;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v42[4];
  _QWORD v43[8];

  v35 = a8;
  v31 = a7;
  v8 = a6;
  v9 = a5;
  v43[6] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v11 = a4;
  v12 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v40, v12);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v43[0] = v39;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v38, v11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v43[1] = v36;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 0, CFSTR("withData"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v34, v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v32;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 0, CFSTR("withRecognition"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v15;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 0, CFSTR("withAttributes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v18;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 0, CFSTR("withAlternateData"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v35);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getResource"), outProtocol, v22);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v24;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v25;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v26;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getResource"), inProtocol, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)getResourceApplicationData:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getResourceApplicationData"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getResourceApplicationData"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getResourceApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ENTProtocol *outProtocol;
  _QWORD v27[4];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v12;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("key"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getResourceApplicationDataEntry"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 0, CFSTR("success"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getResourceApplicationDataEntry"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (int)setResourceApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5 value:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ENTProtocol *inProtocol;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  ENTProtocol *outProtocol;
  _QWORD v32[4];
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v33[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("key"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v17, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v33[2] = v18;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 0, CFSTR("value"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v19, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v33[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("setResourceApplicationDataEntry"), outProtocol, v21);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v23;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v24;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v25;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("setResourceApplicationDataEntry"), inProtocol, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(inProtocol) = objc_msgSend(v28, "intValue");

  return (int)inProtocol;
}

- (int)unsetResourceApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ENTProtocol *outProtocol;
  _QWORD v27[4];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v12;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("key"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("unsetResourceApplicationDataEntry"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("unsetResourceApplicationDataEntry"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v24, "intValue");

  return (int)v17;
}

- (int)updateResource:(id)a3 resource:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("resource"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("updateResource"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("updateResource"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v20, "intValue");

  return (int)v7;
}

- (id)getResourceData:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getResourceData"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 16, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getResourceData"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getResourceByHash:(id)a3 noteGuid:(id)a4 contentHash:(id)a5 withData:(BOOL)a6 withRecognition:(BOOL)a7 withAlternateData:(BOOL)a8
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ENTProtocol *inProtocol;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  ENTProtocol *outProtocol;
  void *v39;
  void *v40;
  _QWORD v42[4];
  _QWORD v43[8];

  v32 = a8;
  v34 = a7;
  v8 = a6;
  v43[6] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v40, v13);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v43[0] = v39;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("noteGuid"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v37, v12);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v43[1] = v36;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 16, 0, CFSTR("contentHash"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v35, v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v43[2] = v33;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 0, CFSTR("withData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v16;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 0, CFSTR("withRecognition"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v34);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v19;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 0, CFSTR("withAlternateData"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getResourceByHash"), outProtocol, v23);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v25;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v26;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v27;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getResourceByHash"), inProtocol, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)getResourceRecognition:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getResourceRecognition"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 16, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getResourceRecognition"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getResourceAlternateData:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getResourceAlternateData"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 16, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getResourceAlternateData"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getResourceAttributes:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getResourceAttributes"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getResourceAttributes"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getAds:(id)a3 adParameters:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("adParameters"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getAds"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 15, 0, CFSTR("success"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class(), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getAds"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getRandomAd:(id)a3 adParameters:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("adParameters"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getRandomAd"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class(), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getRandomAd"), inProtocol, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)getPublicNotebook:(int)a3 publicUri:(id)a4
{
  uint64_t v4;
  ENTProtocol *outProtocol;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[3];

  v4 = *(_QWORD *)&a3;
  v22[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 0, CFSTR("userId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("publicUri"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getPublicNotebook"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("systemException"), objc_opt_class(), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getPublicNotebook"), inProtocol, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)createSharedNotebook:(id)a3 sharedNotebook:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("sharedNotebook"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("createSharedNotebook"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("createSharedNotebook"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)shareNotebook:(id)a3 sharedNotebook:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ENTProtocol *outProtocol;
  _QWORD v27[4];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v12;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("sharedNotebook"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("message"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("shareNotebook"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("shareNotebook"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)createOrUpdateNotebookShares:(id)a3 shareTemplate:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("shareTemplate"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v24[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("createOrUpdateNotebookShares"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class(), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v18;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 4, 12, 0, CFSTR("invalidContactsException"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("createOrUpdateNotebookShares"), inProtocol, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (int)updateSharedNotebook:(id)a3 sharedNotebook:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("sharedNotebook"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("updateSharedNotebook"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("updateSharedNotebook"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v20, "intValue");

  return (int)v7;
}

- (int)setSharedNotebookRecipientSettings:(id)a3 sharedNotebookId:(int64_t)a4 recipientSettings:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ENTProtocol *outProtocol;
  _QWORD v27[4];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v11;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 10, 0, CFSTR("sharedNotebookId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("recipientSettings"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("setSharedNotebookRecipientSettings"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("setSharedNotebookRecipientSettings"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v24, "intValue");

  return (int)v17;
}

- (id)setNotebookRecipientSettings:(id)a3 notebookGuid:(id)a4 recipientSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ENTProtocol *outProtocol;
  _QWORD v27[4];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v12;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("notebookGuid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("recipientSettings"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("setNotebookRecipientSettings"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("setNotebookRecipientSettings"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (int)sendMessageToSharedNotebookMembers:(id)a3 notebookGuid:(id)a4 messageText:(id)a5 recipients:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ENTProtocol *inProtocol;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  ENTProtocol *outProtocol;
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v30, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = v13;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("notebookGuid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v34[1] = v15;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("messageText"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v16, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v34[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 4, 15, 0, CFSTR("recipients"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v19, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v34[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("sendMessageToSharedNotebookMembers"), outProtocol, v21);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v23;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v24;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v25;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("sendMessageToSharedNotebookMembers"), inProtocol, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(inProtocol) = objc_msgSend(v28, "intValue");

  return (int)inProtocol;
}

- (id)listSharedNotebooks:(id)a3
{
  ENTProtocol *outProtocol;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ENTProtocol *inProtocol;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v5 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("listSharedNotebooks"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 15, 0, CFSTR("success"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class(), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("listSharedNotebooks"), inProtocol, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (int)expungeSharedNotebooks:(id)a3 sharedNotebookIds:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ENTProtocol *outProtocol;
  _QWORD v23[4];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v6 = a4;
  v7 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v9;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 10, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 2, 15, 0, CFSTR("sharedNotebookIds"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v24[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("expungeSharedNotebooks"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("expungeSharedNotebooks"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v20, "intValue");

  return (int)v6;
}

- (id)createLinkedNotebook:(id)a3 linkedNotebook:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("linkedNotebook"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("createLinkedNotebook"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("createLinkedNotebook"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (int)updateLinkedNotebook:(id)a3 linkedNotebook:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("linkedNotebook"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("updateLinkedNotebook"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("updateLinkedNotebook"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v20, "intValue");

  return (int)v7;
}

- (id)listLinkedNotebooks:(id)a3
{
  ENTProtocol *outProtocol;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ENTProtocol *inProtocol;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v5 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("listLinkedNotebooks"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 15, 0, CFSTR("success"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class(), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("listLinkedNotebooks"), inProtocol, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (int)expungeLinkedNotebook:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("expungeLinkedNotebook"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("expungeLinkedNotebook"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v20, "intValue");

  return (int)v7;
}

- (id)authenticateToSharedNotebook:(id)a3 authenticationToken:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("shareKeyOrGlobalId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("authenticationToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("authenticateToSharedNotebook"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("authenticateToSharedNotebook"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getSharedNotebookByAuth:(id)a3
{
  ENTProtocol *outProtocol;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ENTProtocol *inProtocol;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v5 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getSharedNotebookByAuth"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class(), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getSharedNotebookByAuth"), inProtocol, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)emailNote:(id)a3 parameters:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[3];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("parameters"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v21[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("emailNote"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class(), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("emailNote"), inProtocol, v18);

}

- (id)shareNote:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("shareNote"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("shareNote"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)stopSharingNote:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[3];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v21[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("stopSharingNote"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class(), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("stopSharingNote"), inProtocol, v18);

}

- (void)stopSharingNoteWithRecipients:(id)a3 guid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[3];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v21[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("stopSharingNoteWithRecipients"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class(), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("stopSharingNoteWithRecipients"), inProtocol, v18);

}

- (id)authenticateToSharedNote:(id)a3 noteKey:(id)a4 authenticationToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ENTProtocol *outProtocol;
  _QWORD v27[4];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("guid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v12;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("noteKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("authenticationToken"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("authenticateToSharedNote"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("authenticateToSharedNote"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)createOrUpdateSharedNotes:(id)a3 shareTemplate:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("shareTemplate"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v25[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("createOrUpdateSharedNotes"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 15, 0, CFSTR("success"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class(), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v18;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 4, 12, 0, CFSTR("invalidContactsException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("createOrUpdateSharedNotes"), inProtocol, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)findRelated:(id)a3 query:(id)a4 resultSpec:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ENTProtocol *outProtocol;
  _QWORD v27[4];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v12;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("query"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("resultSpec"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("findRelated"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("findRelated"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)findSearchSuggestions:(id)a3 query:(id)a4 resultSpec:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ENTProtocol *outProtocol;
  _QWORD v27[4];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v12;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("query"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("resultSpec"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("findSearchSuggestions"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("findSearchSuggestions"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)updateUserSetting:(id)a3 setting:(int)a4 value:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  ENTProtocol *outProtocol;
  _QWORD v25[3];
  _QWORD v26[4];

  v5 = *(_QWORD *)&a4;
  v26[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = v11;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 0, CFSTR("setting"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("value"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v26[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("updateUserSetting"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("updateUserSetting"), inProtocol, v22);

}

- (id)findTimeZones:(id)a3 timeZoneSpec:(id)a4 maxTimeZones:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ENTProtocol *outProtocol;
  _QWORD v27[3];
  _QWORD v28[4];

  v5 = *(_QWORD *)&a5;
  v28[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a4;
  v9 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v11;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("timeZoneSpec"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = v13;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 0, CFSTR("maxTimeZones"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("findTimeZones"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 15, 0, CFSTR("success"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("findTimeZones"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)findContacts:(id)a3 query:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("query"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("findContacts"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 15, 0, CFSTR("success"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class(), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("findContacts"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)findInBusiness:(id)a3 query:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("query"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("findInBusiness"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class(), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("findInBusiness"), inProtocol, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (int)shareNoteWithBusiness:(id)a3 noteGuid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("noteGuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("shareNoteWithBusiness"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("systemException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("userException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("shareNoteWithBusiness"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v20, "intValue");

  return (int)v7;
}

- (int)stopSharingNoteWithBusiness:(id)a3 noteGuid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("noteGuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("stopSharingNoteWithBusiness"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("systemException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("userException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("stopSharingNoteWithBusiness"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v20, "intValue");

  return (int)v7;
}

- (void)requestAccessToNotebook:(id)a3 notebookGuid:(id)a4 privilegeLevel:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  ENTProtocol *outProtocol;
  _QWORD v25[3];
  _QWORD v26[4];

  v5 = *(_QWORD *)&a5;
  v26[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a4;
  v9 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authToken"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = v11;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("notebookGuid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v26[1] = v13;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 0, CFSTR("privilegeLevel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("requestAccessToNotebook"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("systemException"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("userException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("requestAccessToNotebook"), inProtocol, v22);

}

- (id)getNoteLockStatus:(id)a3 noteGuid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("noteGuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getNoteLockStatus"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getNoteLockStatus"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)acquireNoteLock:(id)a3 noteGuid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("noteGuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("acquireNoteLock"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("acquireNoteLock"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)releaseNoteLock:(id)a3 noteGuid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("noteGuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("releaseNoteLock"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("releaseNoteLock"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getViewersForNotes:(id)a3 noteGuids:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ENTProtocol *inProtocol;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[3];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 2, 15, 0, CFSTR("noteGuids"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v25[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getViewersForNotes"), outProtocol, v14);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:keyField:valueField:](FATField, "fieldWithIndex:type:optional:name:keyField:valueField:", 0, 13, 0, CFSTR("success"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class(), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getViewersForNotes"), inProtocol, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)updateNoteIfUsnMatches:(id)a3 note:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("note"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("updateNoteIfUsnMatches"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("updateNoteIfUsnMatches"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)manageNotebookShares:(id)a3 parameters:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("parameters"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("manageNotebookShares"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("manageNotebookShares"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getNotebookShares:(id)a3 notebookGuid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("notebookGuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getNotebookShares"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getNotebookShares"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getNoteShares:(id)a3 noteGuid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("noteGuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getNoteShares"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getNoteShares"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)manageNoteShares:(id)a3 parameters:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("parameters"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("manageNoteShares"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("manageNoteShares"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)joinPublishedBusinessNotebook:(id)a3 notebookGuid:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("notebookGuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("joinPublishedBusinessNotebook"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("joinPublishedBusinessNotebook"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)unpublishNotebook:(id)a3 notebookGuid:(id)a4 convertGroupSharesToIndividual:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  ENTProtocol *outProtocol;
  _QWORD v25[3];
  _QWORD v26[4];

  v5 = a5;
  v26[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a4;
  v9 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = v11;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("notebookGuid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v26[1] = v13;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 0, CFSTR("convertGroupSharesToIndividual"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("unpublishNotebook"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("unpublishNotebook"), inProtocol, v22);

}

- (id)getNotebookSharesEmailAddresses:(id)a3 notebookGuid:(id)a4 identities:(id)a5 skipUnknownUserIdentities:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ENTProtocol *inProtocol;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v30;
  ENTProtocol *outProtocol;
  void *v32;
  _QWORD v34[4];
  _QWORD v35[5];

  v30 = a6;
  v35[4] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v32, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = v11;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("notebookGuid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v35[1] = v13;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 3, 15, 0, CFSTR("identities"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v35[2] = v16;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 0, CFSTR("skipUnknownUserIdentities"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getNotebookSharesEmailAddresses"), outProtocol, v20);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 14, 0, CFSTR("success"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v23;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v24;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v25;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getNotebookSharesEmailAddresses"), inProtocol, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (int)renameNotebook:(id)a3 notebookGuid:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ENTProtocol *inProtocol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ENTProtocol *outProtocol;
  _QWORD v27[4];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v12;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("notebookGuid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("name"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("renameNotebook"), outProtocol, v17);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 0, CFSTR("success"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v21;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("renameNotebook"), inProtocol, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v24, "intValue");

  return (int)v17;
}

- (id)sendLogRequest:(id)a3 logRequest:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("logRequest"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("sendLogRequest"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("systemException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("sendLogRequest"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getLinkedAccountSyncState:(id)a3 linkedAccount:(id)a4
{
  ENTProtocol *outProtocol;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENTProtocol *inProtocol;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("linkedAccount"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getLinkedAccountSyncState"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getLinkedAccountSyncState"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outProtocol, 0);
  objc_storeStrong((id *)&self->_inProtocol, 0);
}

- (void)cancel
{
  id v2;

  -[ENTProtocol transport](self->_outProtocol, "transport");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)setUploadProgressBlock:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  NSLog(CFSTR("Progress blocks have been deprecated"));
  v3 = v4;
  if (v4)
  {
    (*((void (**)(id, uint64_t, uint64_t, uint64_t))v4 + 2))(v4, 1, 1, 1);
    v3 = v4;
  }

}

- (void)setDownloadProgressBlock:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  NSLog(CFSTR("Progress blocks have been deprecated"));
  v3 = v4;
  if (v4)
  {
    (*((void (**)(id, uint64_t, uint64_t, uint64_t))v4 + 2))(v4, 1, 1, 1);
    v3 = v4;
  }

}

@end
