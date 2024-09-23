@implementation DKDAAPParser

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)parse
{
  NSInteger v4;
  NSInteger v5;
  void *v6;
  DKDAAPParserContainer *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSInputStream *v11;
  id v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  NSInputStream *inputStream;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int64_t state;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  if (-[DKDAAPParser isCanceled](self, "isCanceled"))
  {
    self->_state = 3;
    return;
  }
  if (self->_state)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DKDAAPParser.m"), 58, CFSTR("Cannot parse more than once."));

  }
  -[NSInputStream open](self->_inputStream, "open");
  self->_state = 1;
  -[DKDAAPParser _callDelegateDidStart](self, "_callDelegateDidStart");
  if (-[DKDAAPParser isCanceled](self, "isCanceled"))
  {
LABEL_6:
    self->_state = 3;
    -[DKDAAPParser _callDelegateDidCancel](self, "_callDelegateDidCancel");
    goto LABEL_41;
  }
  while (1)
  {
    v33 = 0;
    v4 = -[NSInputStream read:maxLength:](self->_inputStream, "read:maxLength:", &v33, 4);
    if (v4 != 4)
    {
      if (!v4)
      {
        -[DKDAAPParser _verifyExpectedEOF](self, "_verifyExpectedEOF");
        goto LABEL_41;
      }
      if (v4 != -1)
      {
        self->_state = 4;
        v26 = (void *)MEMORY[0x24BDD1540];
        v36 = *MEMORY[0x24BDD0BA0];
        v37[0] = CFSTR("Failed to read property code from input stream.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("DKDAAPParserErrorDomain"), 1, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[DKDAAPParser _callDelegateDidFailWithError:](self, "_callDelegateDidFailWithError:", v28);

        goto LABEL_41;
      }
      goto LABEL_37;
    }
    v32 = 0;
    v33 = bswap32(v33);
    v5 = -[NSInputStream read:maxLength:](self->_inputStream, "read:maxLength:", &v32, 4);
    if (v5 != 4)
      break;
    v32 = bswap32(v32);
    -[NSMutableArray lastObject](self->_containerStack, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemaining:", objc_msgSend(v6, "remaining") - 8);
    if (-[DKDAAPParser _callDelegateShouldParseCode:](self, "_callDelegateShouldParseCode:", v33))
    {
      if (-[DKDAAPParser _callDelegateShouldParseCodeAsContainer:](self, "_callDelegateShouldParseCodeAsContainer:", v33))
      {
        v7 = objc_alloc_init(DKDAAPParserContainer);
        -[DKDAAPParserContainer setCode:](v7, "setCode:", v33);
        -[DKDAAPParserContainer setLength:](v7, "setLength:", v32);
        -[DKDAAPParserContainer setRemaining:](v7, "setRemaining:", v32);
        -[NSMutableArray addObject:](self->_containerStack, "addObject:", v7);

        -[DKDAAPParser _callDelegateDidStartContainerCode:contentLength:](self, "_callDelegateDidStartContainerCode:contentLength:", v33, v32);
        v6 = v7;
        goto LABEL_27;
      }
      if (!v32)
        goto LABEL_27;
      v8 = (void *)MEMORY[0x20BD22F58]();
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", v32);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v32;
      while (1)
      {
        inputStream = self->_inputStream;
        v12 = objc_retainAutorelease(v15);
        v18 = -[NSInputStream read:maxLength:](inputStream, "read:maxLength:", objc_msgSend(v12, "bytes") + objc_msgSend(v12, "length"), v16);
        if (!v18)
          break;
        if (v18 == -1)
          goto LABEL_25;
        v16 -= v18;
        if (!v16)
        {
          v19 = objc_msgSend(v6, "remaining");
          objc_msgSend(v6, "setRemaining:", v19 - v32);
          v20 = v33;
          v21 = objc_msgSend(objc_retainAutorelease(v12), "bytes");
          -[DKDAAPParser _callDelegateDidParseDataCode:bytes:contentLength:](self, "_callDelegateDidParseDataCode:bytes:contentLength:", v20, v21, v32);
          goto LABEL_26;
        }
      }
    }
    else
    {
      if (!v32)
        goto LABEL_27;
      v8 = (void *)MEMORY[0x20BD22F58]();
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", v32);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v32;
      while (1)
      {
        v11 = self->_inputStream;
        v12 = objc_retainAutorelease(v9);
        v13 = -[NSInputStream read:maxLength:](v11, "read:maxLength:", objc_msgSend(v12, "bytes") + objc_msgSend(v12, "length"), v10);
        if (!v13)
          break;
        if (v13 == -1)
        {
LABEL_25:
          self->_state = 4;
          -[NSInputStream streamError](self->_inputStream, "streamError");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[DKDAAPParser _callDelegateDidFailWithError:](self, "_callDelegateDidFailWithError:", v22);

          goto LABEL_26;
        }
        v10 -= v13;
        if (!v10)
        {
          v14 = objc_msgSend(v6, "remaining");
          objc_msgSend(v6, "setRemaining:", v14 - v32);
          goto LABEL_26;
        }
      }
    }
    -[DKDAAPParser _verifyExpectedEOF](self, "_verifyExpectedEOF");
LABEL_26:
    state = self->_state;

    objc_autoreleasePoolPop(v8);
    if (state != 1)
      goto LABEL_40;
LABEL_27:
    if (v6)
    {
      do
      {
        if (objc_msgSend(v6, "remaining"))
          break;
        -[NSMutableArray removeLastObject](self->_containerStack, "removeLastObject");
        -[DKDAAPParser _callDelegateDidEndContainerCode:](self, "_callDelegateDidEndContainerCode:", objc_msgSend(v6, "code"));
        v24 = objc_msgSend(v6, "length");
        -[NSMutableArray lastObject](self->_containerStack, "lastObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "setRemaining:", objc_msgSend(v25, "remaining") - v24);
        v6 = v25;
      }
      while (v25);

    }
    if (-[DKDAAPParser isCanceled](self, "isCanceled"))
      goto LABEL_6;
  }
  if (v5 == -1)
  {
LABEL_37:
    self->_state = 4;
    -[NSInputStream streamError](self->_inputStream, "streamError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKDAAPParser _callDelegateDidFailWithError:](self, "_callDelegateDidFailWithError:", v6);
    goto LABEL_40;
  }
  self->_state = 4;
  v29 = (void *)MEMORY[0x24BDD1540];
  v34 = *MEMORY[0x24BDD0BA0];
  v35 = CFSTR("Failed to read length from input stream.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("DKDAAPParserErrorDomain"), 1, v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKDAAPParser _callDelegateDidFailWithError:](self, "_callDelegateDidFailWithError:", v30);

LABEL_40:
LABEL_41:
  if (self->_state == 1)
    self->_state = 2;
  -[DKDAAPParser _callDelegateDidFinish](self, "_callDelegateDidFinish");
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (BOOL)_callDelegateShouldParseCodeAsContainer:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  char v6;

  v3 = *(_QWORD *)&a3;
  -[DKDAAPParser delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "parser:shouldParseCodeAsContainer:", self, v3);
  else
    v6 = 0;

  return v6;
}

- (BOOL)_callDelegateShouldParseCode:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  char v6;

  v3 = *(_QWORD *)&a3;
  -[DKDAAPParser delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "parser:shouldParseCode:", self, v3);
  else
    v6 = 0;

  return v6;
}

- (DKDAAPParserDelegate)delegate
{
  return (DKDAAPParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_verifyExpectedEOF
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_containerStack, "count"))
  {
    self->_state = 4;
    v3 = (void *)MEMORY[0x24BDD1540];
    v6 = *MEMORY[0x24BDD0BA0];
    v7[0] = CFSTR("Encountered EOF while reading input stream");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("DKDAAPParserErrorDomain"), 2, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKDAAPParser _callDelegateDidFailWithError:](self, "_callDelegateDidFailWithError:", v5);

  }
}

- (void)_callDelegateDidStart
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  -[DKDAAPParser delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6 = (void *)v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "parserDidStart:", self);
      v4 = v6;
    }
  }

}

- (void)_callDelegateDidStartContainerCode:(unsigned int)a3 contentLength:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[DKDAAPParser delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v10 = (void *)v7;
    v9 = objc_opt_respondsToSelector();
    v8 = v10;
    if ((v9 & 1) != 0)
    {
      objc_msgSend(v10, "parser:didStartContainerCode:contentLength:", self, v5, v4);
      v8 = v10;
    }
  }

}

- (void)_callDelegateDidParseDataCode:(unsigned int)a3 bytes:(char *)a4 contentLength:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;

  v5 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a3;
  -[DKDAAPParser delegate](self, "delegate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    v12 = (void *)v9;
    v11 = objc_opt_respondsToSelector();
    v10 = v12;
    if ((v11 & 1) != 0)
    {
      objc_msgSend(v12, "parser:didParseDataCode:bytes:contentLength:", self, v7, a4, v5);
      v10 = v12;
    }
  }

}

- (void)_callDelegateDidFinish
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  -[DKDAAPParser delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6 = (void *)v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "parser:didFinishWithState:", self, self->_state);
      v4 = v6;
    }
  }

}

- (void)_callDelegateDidEndContainerCode:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  -[DKDAAPParser delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v8 = (void *)v5;
    v7 = objc_opt_respondsToSelector();
    v6 = v8;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "parser:didEndContainerCode:", self, v3);
      v6 = v8;
    }
  }

}

- (DKDAAPParser)initWithStream:(id)a3
{
  id v6;
  DKDAAPParser *v7;
  DKDAAPParser *v8;
  uint64_t v9;
  NSMutableArray *containerStack;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DKDAAPParser.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inputStream"));

  }
  v13.receiver = self;
  v13.super_class = (Class)DKDAAPParser;
  v7 = -[DKDAAPParser init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_inputStream, a3);
    v8->_state = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    containerStack = v8->_containerStack;
    v8->_containerStack = (NSMutableArray *)v9;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerStack, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (DKDAAPParser)initWithData:(id)a3
{
  id v5;
  void *v6;
  DKDAAPParser *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DKDAAPParser.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DKDAAPParser initWithStream:](self, "initWithStream:", v6);

  return v7;
}

- (void)cancel
{
  -[DKDAAPParser setCanceled:](self, "setCanceled:", 1);
}

- (void)_callDelegateDidCancel
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  -[DKDAAPParser delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6 = (void *)v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "parserDidCancel:", self);
      v4 = v6;
    }
  }

}

- (void)_callDelegateDidFailWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[DKDAAPParser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "parser:didFailWithError:", self, v5);

}

- (int64_t)state
{
  return self->_state;
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (NSMutableArray)containerStack
{
  return self->_containerStack;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

@end
