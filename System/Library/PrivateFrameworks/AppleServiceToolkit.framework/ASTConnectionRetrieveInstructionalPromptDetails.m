@implementation ASTConnectionRetrieveInstructionalPromptDetails

- (ASTConnectionRetrieveInstructionalPromptDetails)initWithInstructionID:(id)a3 type:(id)a4 language:(id)a5 locale:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ASTConnectionRetrieveInstructionalPromptDetails *v14;
  uint64_t v15;
  NSDictionary *rawBody;
  objc_super v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ASTConnectionRetrieveInstructionalPromptDetails;
  v14 = -[ASTMaterializedConnection init](&v18, sel_init);
  if (v14)
  {
    v19[0] = CFSTR("instructionId");
    v19[1] = CFSTR("type");
    v20[0] = v10;
    v20[1] = v11;
    v19[2] = CFSTR("language");
    v19[3] = CFSTR("locale");
    v20[2] = v12;
    v20[3] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
    v15 = objc_claimAutoreleasedReturnValue();
    rawBody = v14->_rawBody;
    v14->_rawBody = (NSDictionary *)v15;

    -[ASTMaterializedConnection addBody:](v14, "addBody:", v14->_rawBody);
  }

  return v14;
}

- (id)endpoint
{
  return CFSTR("retrieve/instruction/details");
}

- (id)rawBody
{
  return self->_rawBody;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawBody, 0);
}

@end
