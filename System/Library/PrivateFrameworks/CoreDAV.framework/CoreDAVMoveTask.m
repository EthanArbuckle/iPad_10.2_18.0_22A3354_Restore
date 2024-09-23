@implementation CoreDAVMoveTask

- (void)dealloc
{
  objc_super v3;

  -[CoreDAVTask setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CoreDAVMoveTask;
  -[CoreDAVTask dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVMoveTask;
  -[CoreDAVCopyOrMoveTask description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@ "), v4);

  -[CoreDAVMoveTask previousETag](self, "previousETag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Previous ETag: [%@]"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("]"));
  return v3;
}

- (id)httpMethod
{
  return CFSTR("MOVE");
}

- (id)additionalHeaderValues
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVMoveTask;
  -[CoreDAVCopyOrMoveTask additionalHeaderValues](&v7, sel_additionalHeaderValues);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  -[CoreDAVMoveTask previousETag](self, "previousETag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("If-Match"));

  return v3;
}

- (void)_callBackToDelegateWithResponses:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CoreDAVTask delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CoreDAVTask delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "moveTask:parsedResponses:error:", self, v10, v6);

    -[CoreDAVTask setDelegate:](self, "setDelegate:", 0);
  }

}

- (NSString)previousETag
{
  return self->_previousETag;
}

- (void)setPreviousETag:(id)a3
{
  objc_storeStrong((id *)&self->_previousETag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousETag, 0);
}

@end
