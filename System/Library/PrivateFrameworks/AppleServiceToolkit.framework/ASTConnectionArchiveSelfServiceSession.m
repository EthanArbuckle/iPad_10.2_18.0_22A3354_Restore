@implementation ASTConnectionArchiveSelfServiceSession

- (void)setSessionId:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *rawBody;
  objc_super v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASTConnectionArchiveSelfServiceSession;
  -[ASTMaterializedConnection setSessionId:](&v7, sel_setSessionId_, v4);
  if (v4)
  {
    v8 = CFSTR("sessionId");
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    rawBody = self->_rawBody;
    self->_rawBody = v5;

    -[ASTMaterializedConnection addBody:](self, "addBody:", self->_rawBody);
  }

}

- (id)endpoint
{
  return CFSTR("archive/session");
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
