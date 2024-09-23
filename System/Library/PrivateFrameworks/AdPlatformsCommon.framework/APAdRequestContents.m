@implementation APAdRequestContents

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_contentTypes, 0);
  objc_storeStrong((id *)&self->_apContext, 0);
}

- (APAdRequestContents)initWithContext:(id)a3 contentTypes:(id)a4 deliverEntireBatch:(BOOL)a5
{
  id v9;
  id v10;
  APAdRequestContents *v11;
  APAdRequestContents *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  APClientInfo *clientInfo;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)APAdRequestContents;
  v11 = -[APAdRequestContents init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_apContext, a3);
    objc_storeStrong((id *)&v12->_contentTypes, a4);
    v12->_deliverEntireBatch = a5;
    objc_msgSend_activeClientInfo(MEMORY[0x24BDFD480], v13, v14, v15, v16, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    clientInfo = v12->_clientInfo;
    v12->_clientInfo = (APClientInfo *)v19;

  }
  return v12;
}

- (BOOL)deliverEntireBatch
{
  return self->_deliverEntireBatch;
}

- (NSArray)contentTypes
{
  return self->_contentTypes;
}

- (APClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (APContext)apContext
{
  return self->_apContext;
}

@end
