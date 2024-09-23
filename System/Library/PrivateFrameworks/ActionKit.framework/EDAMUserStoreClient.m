@implementation EDAMUserStoreClient

- (EDAMUserStoreClient)initWithProtocol:(id)a3
{
  return -[EDAMUserStoreClient initWithInProtocol:outProtocol:](self, "initWithInProtocol:outProtocol:", a3, a3);
}

- (EDAMUserStoreClient)initWithInProtocol:(id)a3 outProtocol:(id)a4
{
  id v7;
  id v8;
  EDAMUserStoreClient *v9;
  EDAMUserStoreClient *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDAMUserStoreClient;
  v9 = -[EDAMUserStoreClient init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inProtocol, a3);
    objc_storeStrong((id *)&v10->_outProtocol, a4);
  }

  return v10;
}

- (BOOL)checkVersion:(id)a3 edamVersionMajor:(signed __int16)a4 edamVersionMinor:(signed __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ENTProtocol *inProtocol;
  void *v18;
  void *v19;
  void *v20;
  ENTProtocol *outProtocol;
  void *v24;
  _QWORD v25[4];

  v5 = a5;
  v6 = a4;
  v25[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("clientName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = v9;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 6, 0, CFSTR("edamVersionMajor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v12;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 6, 0, CFSTR("edamVersionMinor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("checkVersion"), outProtocol, v16);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 2, 0, CFSTR("success"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("checkVersion"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(inProtocol) = objc_msgSend(v20, "BOOLValue");

  return (char)inProtocol;
}

- (id)getBootstrapInfo:(id)a3
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
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v5 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("locale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getBootstrapInfo"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getBootstrapInfo"), inProtocol, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)authenticate:(id)a3 password:(id)a4 consumerKey:(id)a5 consumerSecret:(id)a6 supportsTwoFactor:(BOOL)a7
{
  id v10;
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
  _BOOL4 v31;
  void *v32;
  ENTProtocol *outProtocol;
  void *v34;
  _QWORD v36[3];
  _QWORD v37[6];

  v31 = a7;
  v37[5] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("username"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v34, v13);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v37[0] = v32;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("password"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v37[1] = v15;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("consumerKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v16, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v37[2] = v17;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 0, CFSTR("consumerSecret"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v18, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v37[3] = v19;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 0, CFSTR("supportsTwoFactor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("authenticate"), outProtocol, v23);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v25;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v26;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("authenticate"), inProtocol, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)authenticateOpenID:(id)a3 consumerKey:(id)a4 consumerSecret:(id)a5 deviceIdentifier:(id)a6 deviceDescription:(id)a7 authLongSession:(BOOL)a8 supportsTwoFactor:(BOOL)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  ENTProtocol *inProtocol;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  ENTProtocol *outProtocol;
  void *v42;
  void *v43;
  _QWORD v45[3];
  _QWORD v46[9];

  v38 = a8;
  v46[7] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("credential"), objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v43, v17);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v46[0] = v42;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("consumerKey"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v40, v16);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v46[1] = v39;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("consumerSecret"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v37, v15);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v46[2] = v36;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 0, CFSTR("deviceIdentifier"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v35, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v46[3] = v18;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 11, 0, CFSTR("deviceDescription"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v19, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v46[4] = v20;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 0, CFSTR("authLongSession"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v38);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v46[5] = v23;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 2, 0, CFSTR("supportsTwoFactor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("authenticateOpenID"), outProtocol, v27);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v29;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v30;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("authenticateOpenID"), inProtocol, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)authenticateLongSession:(id)a3 password:(id)a4 consumerKey:(id)a5 consumerSecret:(id)a6 deviceIdentifier:(id)a7 deviceDescription:(id)a8 supportsTwoFactor:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  ENTProtocol *inProtocol;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  ENTProtocol *outProtocol;
  void *v42;
  void *v43;
  _QWORD v45[3];
  _QWORD v46[9];

  v46[7] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("username"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v43, v19);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v46[0] = v42;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("password"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v40, v18);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v46[1] = v39;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("consumerKey"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v38, v17);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v46[2] = v37;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 0, CFSTR("consumerSecret"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v20, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v46[3] = v21;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 11, 0, CFSTR("deviceIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v22, v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v46[4] = v23;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 0, CFSTR("deviceDescription"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v24, v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v46[5] = v25;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 2, 0, CFSTR("supportsTwoFactor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("authenticateLongSession"), outProtocol, v29);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v31;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v32;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v33;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("authenticateLongSession"), inProtocol, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (id)authenticateLongSessionV2:(id)a3
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
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("authParams"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("authenticateLongSessionV2"), outProtocol, v8);

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
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("authenticateLongSessionV2"), inProtocol, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)completeTwoFactorAuthentication:(id)a3 oneTimeCode:(id)a4 deviceIdentifier:(id)a5 deviceDescription:(id)a6
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
  ENTProtocol *outProtocol;
  _QWORD v31[3];
  _QWORD v32[5];

  v32[4] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("oneTimeCode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v32[1] = v16;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("deviceIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v17, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v32[2] = v18;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 0, CFSTR("deviceDescription"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v19, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v32[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("completeTwoFactorAuthentication"), outProtocol, v21);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v23;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v24;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("completeTwoFactorAuthentication"), inProtocol, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)revokeLongSession:(id)a3
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
  id v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v5 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("revokeLongSession"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class(), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("revokeLongSession"), inProtocol, v12);

}

- (id)authenticateToBusiness:(id)a3
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
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("authenticateToBusiness"), outProtocol, v8);

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
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("authenticateToBusiness"), inProtocol, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)refreshAuthentication:(id)a3
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
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("refreshAuthentication"), outProtocol, v8);

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
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("refreshAuthentication"), inProtocol, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)getUser:(id)a3
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
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getUser"), outProtocol, v8);

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
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getUser"), inProtocol, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)getPublicUserInfo:(id)a3
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
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("username"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getPublicUserInfo"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("notFoundException"), objc_opt_class(), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("userException"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getPublicUserInfo"), inProtocol, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)getPremiumInfo:(id)a3
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
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getPremiumInfo"), outProtocol, v8);

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
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getPremiumInfo"), inProtocol, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)getSubscriptionInfo:(id)a3
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
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getSubscriptionInfo"), outProtocol, v8);

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
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getSubscriptionInfo"), inProtocol, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)getNoteStoreUrl:(id)a3
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
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getNoteStoreUrl"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 0, CFSTR("success"));
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
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getNoteStoreUrl"), inProtocol, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)getUserUrls:(id)a3
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
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getUserUrls"), outProtocol, v8);

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
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getUserUrls"), inProtocol, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)inviteToBusiness:(id)a3 emailAddress:(id)a4
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
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a4;
  v8 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("emailAddress"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v20[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("inviteToBusiness"), outProtocol, v13);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("inviteToBusiness"), inProtocol, v17);

}

- (void)removeFromBusiness:(id)a3 emailAddress:(id)a4
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
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("emailAddress"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v21[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("removeFromBusiness"), outProtocol, v13);

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
  v19 = +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("removeFromBusiness"), inProtocol, v18);

}

- (void)updateBusinessUserIdentifier:(id)a3 oldEmailAddress:(id)a4 newEmailAddress:(id)a5
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
  id v23;
  ENTProtocol *outProtocol;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = v12;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("oldEmailAddress"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v26[1] = v14;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 0, CFSTR("newEmailAddress"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v26[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("updateBusinessUserIdentifier"), outProtocol, v17);

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
  v23 = +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("updateBusinessUserIdentifier"), inProtocol, v22);

}

- (id)listBusinessUsers:(id)a3
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
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("listBusinessUsers"), outProtocol, v8);

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
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("listBusinessUsers"), inProtocol, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)listBusinessInvitations:(id)a3 includeRequestedInvitations:(BOOL)a4
{
  _BOOL8 v4;
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
  void *v20;
  _QWORD v22[3];
  _QWORD v23[3];

  v4 = a4;
  v23[2] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v7 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v9;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 2, 0, CFSTR("includeRequestedInvitations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("listBusinessInvitations"), outProtocol, v13);

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
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("listBusinessInvitations"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)registerForSyncPushNotifications:(id)a3 credentials:(id)a4
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
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("credentials"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("registerForSyncPushNotifications"), outProtocol, v13);

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
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("registerForSyncPushNotifications"), inProtocol, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)unregisterForSyncPushNotifications:(id)a3
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
  id v14;
  _QWORD v15[3];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  v5 = a3;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("authenticationToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("unregisterForSyncPushNotifications"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("unregisterForSyncPushNotifications"), inProtocol, v13);

}

- (id)createSessionAuthenticationToken:(id)a3
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
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("createSessionAuthenticationToken"), outProtocol, v8);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 0, CFSTR("success"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class(), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 0, CFSTR("systemException"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 0, CFSTR("notFoundException"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("createSessionAuthenticationToken"), inProtocol, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)getAccountLimits:(int)a3
{
  uint64_t v3;
  ENTProtocol *outProtocol;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ENTProtocol *inProtocol;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];

  v3 = *(_QWORD *)&a3;
  v17[1] = *MEMORY[0x24BDAC8D0];
  outProtocol = self->_outProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 0, CFSTR("serviceLevel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getAccountLimits"), outProtocol, v9);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 0, CFSTR("success"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 0, CFSTR("userException"), objc_opt_class(), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getAccountLimits"), inProtocol, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)getConnectedIdentities:(id)a3 identityIds:(id)a4
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
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 10, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 2, 15, 0, CFSTR("identityIds"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FATArgument argumentWithField:value:](FATArgument, "argumentWithField:value:", v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v25[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENTProtocolUtil sendMessage:toProtocol:withArguments:](ENTProtocolUtil, "sendMessage:toProtocol:withArguments:", CFSTR("getConnectedIdentities"), outProtocol, v14);

  inProtocol = self->_inProtocol;
  +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 10, 1, 0);
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
  +[ENTProtocolUtil readMessage:fromProtocol:withResponseTypes:](ENTProtocolUtil, "readMessage:fromProtocol:withResponseTypes:", CFSTR("getConnectedIdentities"), inProtocol, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outProtocol, 0);
  objc_storeStrong((id *)&self->_inProtocol, 0);
}

@end
