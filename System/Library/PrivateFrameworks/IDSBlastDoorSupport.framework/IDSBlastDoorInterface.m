@implementation IDSBlastDoorInterface

- (IDSBlastDoorInterface)init
{
  IDSBlastDoorInterface *v2;
  IDSBlastDoorInterfaceInternal *v3;
  IDSBlastDoorInterfaceInternal *interface;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)IDSBlastDoorInterface;
  v2 = -[IDSBlastDoorInterface init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(IDSBlastDoorInterfaceInternal);
    interface = v2->_interface;
    v2->_interface = v3;

  }
  return v2;
}

- (void)unpackPayloadDictionary:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[IDSBlastDoorInterface interface](self, "interface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unpackPayloadDictionary:resultHandler:", v7, v6);

}

- (void)unpackClientMessage:(id)a3 context:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[IDSBlastDoorInterface interface](self, "interface");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unpackClientMessage:context:resultHandler:", v10, v9, v8);

}

- (IDSBlastDoorInterfaceInternal)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
}

@end
