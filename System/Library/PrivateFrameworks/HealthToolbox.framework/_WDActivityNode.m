@implementation _WDActivityNode

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_WDActivityNode responder](self, "responder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_WDActivityNode nextResponder](self, "nextResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Responder: %@ Next Responder: %@ \n"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_WDActivityNode)initWithResponder:(id)a3
{
  id v4;
  _WDActivityNode *v5;
  _WDActivityNode *v6;
  uint64_t v7;
  NSMutableDictionary *responderActivity;
  NSDictionary *nextResponderActivity;
  uint64_t v10;
  NSMapTable *responderTable;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_WDActivityNode;
  v5 = -[_WDActivityNode init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_WDActivityNode setResponder:](v5, "setResponder:", v4);
    -[_WDActivityNode setNextResponder:](v6, "setNextResponder:", 0);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 10);
    v7 = objc_claimAutoreleasedReturnValue();
    responderActivity = v6->_responderActivity;
    v6->_responderActivity = (NSMutableDictionary *)v7;

    nextResponderActivity = v6->_nextResponderActivity;
    v6->_nextResponderActivity = 0;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 4);
    responderTable = v6->_responderTable;
    v6->_responderTable = (NSMapTable *)v10;

  }
  return v6;
}

- (id)changeActivityForResponder:(id)a3 activityDictionary:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _WDActivityNode *v11;

  v6 = a3;
  v7 = a4;
  -[_WDActivityNode responder](self, "responder");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    if (v7)
      -[NSMutableDictionary addEntriesFromDictionary:](self->_responderActivity, "addEntriesFromDictionary:", v7);
    v11 = self;
  }
  else
  {
    -[_WDActivityNode _nextNode](self, "_nextNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "changeActivityForResponder:activityDictionary:", v6, v7);
      v11 = (_WDActivityNode *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (id)transitionActivityForResponder:(id)a3 newResponder:(id)a4 transitionDictionary:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _WDActivityNode *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_WDActivityNode responder](self, "responder");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v8)
  {
    -[NSMapTable objectForKey:](self->_responderTable, "objectForKey:", v9);
    v14 = (_WDActivityNode *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v14 = -[_WDActivityNode initWithResponder:]([_WDActivityNode alloc], "initWithResponder:", v9);
      -[NSMapTable setObject:forKey:](self->_responderTable, "setObject:forKey:", v14, v9);
    }
    objc_storeStrong((id *)&self->_nextResponderActivity, a5);
    -[_WDActivityNode setNextResponder:](self, "setNextResponder:", v9);
  }
  else
  {
    -[_WDActivityNode _nextNode](self, "_nextNode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "transitionActivityForResponder:newResponder:transitionDictionary:", v8, v9, v10);
      v14 = (_WDActivityNode *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (void)addActivitiesToArray:(id)a3 currentNode:(id)a4
{
  _WDActivityNode *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (_WDActivityNode *)a4;
  objc_msgSend(v9, "addObject:", self->_responderActivity);
  -[_WDActivityNode _nextNode](self, "_nextNode");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (self != v6 && v7)
  {
    objc_msgSend(v9, "addObject:", self->_nextResponderActivity);
    objc_msgSend(v8, "addActivitiesToArray:currentNode:", v9, v6);
  }

}

- (id)_nextNode
{
  void *v3;
  NSMapTable *responderTable;
  void *v5;
  void *v6;

  -[_WDActivityNode nextResponder](self, "nextResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    responderTable = self->_responderTable;
    -[_WDActivityNode nextResponder](self, "nextResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](responderTable, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (WDUserActivityResponder)responder
{
  return (WDUserActivityResponder *)objc_loadWeakRetained((id *)&self->_responder);
}

- (void)setResponder:(id)a3
{
  objc_storeWeak((id *)&self->_responder, a3);
}

- (WDUserActivityResponder)nextResponder
{
  return (WDUserActivityResponder *)objc_loadWeakRetained((id *)&self->_nextResponder);
}

- (void)setNextResponder:(id)a3
{
  objc_storeWeak((id *)&self->_nextResponder, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nextResponder);
  objc_destroyWeak((id *)&self->_responder);
  objc_storeStrong((id *)&self->_responderTable, 0);
  objc_storeStrong((id *)&self->_nextResponderActivity, 0);
  objc_storeStrong((id *)&self->_responderActivity, 0);
}

@end
