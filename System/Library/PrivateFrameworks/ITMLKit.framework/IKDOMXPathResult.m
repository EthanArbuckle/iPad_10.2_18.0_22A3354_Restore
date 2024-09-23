@implementation IKDOMXPathResult

- (IKDOMXPathResult)initWithAppContext:(id)a3 type:(int64_t)a4 nodes:(id)a5
{
  id v8;
  id v9;
  IKDOMXPathResult *v10;
  IKDOMXPathResult *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)IKDOMXPathResult;
  v10 = -[IKJSObject initWithAppContext:](&v25, sel_initWithAppContext_, v8);
  v11 = v10;
  if (v10)
  {
    v10->_type = a4;
    objc_msgSend(v8, "jsContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "virtualMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17), "managedSelf");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addManagedReference:withOwner:", v18, v11);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v15);
    }

    objc_storeStrong((id *)&v11->_nodes, a5);
  }

  return v11;
}

- (int64_t)numberValue
{
  void *v3;
  void *v4;
  void *v5;

  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKDOMXPathException exceptionWithAppContext:code:](IKDOMXPathException, "exceptionWithAppContext:code:", v4, 52);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setException:withErrorMessage:", v5, CFSTR("Operation not supported"));

  return 0;
}

- (NSString)stringValue
{
  void *v3;
  void *v4;
  void *v5;

  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKDOMXPathException exceptionWithAppContext:code:](IKDOMXPathException, "exceptionWithAppContext:code:", v4, 52);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setException:withErrorMessage:", v5, CFSTR("Operation not supported"));

  return 0;
}

- (BOOL)BOOLeanValue
{
  void *v3;
  void *v4;
  void *v5;

  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKDOMXPathException exceptionWithAppContext:code:](IKDOMXPathException, "exceptionWithAppContext:code:", v4, 52);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setException:withErrorMessage:", v5, CFSTR("Operation not supported"));

  return 0;
}

- (IKDOMNode)singleNodeValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[IKDOMXPathResult type](self, "type") == 9 || -[IKDOMXPathResult type](self, "type") == 8)
  {
    -[IKDOMXPathResult nodes](self, "nodes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[IKJSObject appContext](self, "appContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject appContext](self, "appContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMXPathException exceptionWithAppContext:code:](IKDOMXPathException, "exceptionWithAppContext:code:", v5, 52);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setException:withErrorMessage:", v6, CFSTR("Operation not supported"));

    v4 = 0;
  }

  return (IKDOMNode *)v4;
}

- (BOOL)invalidIteratorState
{
  return 0;
}

- (int64_t)snapshotLength
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;

  if (-[IKDOMXPathResult type](self, "type") == 7)
  {
    -[IKDOMXPathResult nodes](self, "nodes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");
  }
  else
  {
    -[IKJSObject appContext](self, "appContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject appContext](self, "appContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMXPathException exceptionWithAppContext:code:](IKDOMXPathException, "exceptionWithAppContext:code:", v5, 52);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setException:withErrorMessage:", v6, CFSTR("Operation not supported"));

    v4 = 0;
  }

  return v4;
}

- (id)iterateNext
{
  void *v3;
  void *v4;
  void *v5;

  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKDOMXPathException exceptionWithAppContext:code:](IKDOMXPathException, "exceptionWithAppContext:code:", v4, 52);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setException:withErrorMessage:", v5, CFSTR("Operation not supported"));

  return 0;
}

- (id)snapshotItem:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[IKDOMXPathResult type](self, "type") == 7)
  {
    if (a3 < 0
      || (-[IKDOMXPathResult nodes](self, "nodes"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "count"),
          v5,
          v6 <= a3))
    {
      v8 = 0;
      return v8;
    }
    -[IKDOMXPathResult nodes](self, "nodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[IKJSObject appContext](self, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject appContext](self, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMXPathException exceptionWithAppContext:code:](IKDOMXPathException, "exceptionWithAppContext:code:", v9, 52);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setException:withErrorMessage:", v10, CFSTR("Operation not supported"));

    v8 = 0;
  }

  return v8;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end
