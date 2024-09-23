@implementation _FIMutableProxyNode

- (_FIMutableProxyNode)initWithSubject:(id)a3
{
  id v4;
  _FIMutableProxyNode *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_FIMutableProxyNode;
  v5 = -[FIProxyNode initWithSubject:](&v7, sel_initWithSubject_, v4);
  -[_FIMutableProxyNode startObservingSubject](v5, "startObservingSubject");

  return v5;
}

- (id)nodesToObserve
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setSubjectNode:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[_FIMutableProxyNode stopObservingSubject](self, "stopObservingSubject");
  v5.receiver = self;
  v5.super_class = (Class)_FIMutableProxyNode;
  -[FIProxyNode setSubjectNode:](&v5, sel_setSubjectNode_, v4);
  -[_FIMutableProxyNode startObservingSubject](self, "startObservingSubject");

}

- (void)startObservingSubject
{
  void *v3;
  id v4;

  -[FIProxyNode subjectNode](self, "subjectNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FINodeObserver observerForProxy:subjectNode:](FINodeObserver, "observerForProxy:subjectNode:", self, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[_FIMutableProxyNode setSubjectObserver:](self, "setSubjectObserver:", v4);
  objc_msgSend(v4, "startObserving:", 19);

}

- (void)stopObservingSubject
{
  void *v3;

  -[_FIMutableProxyNode subjectObserver](self, "subjectObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopObserving:", 19);

  -[_FIMutableProxyNode setSubjectObserver:](self, "setSubjectObserver:", 0);
}

- (void)dispatchNodeEvent:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _FIMutableProxyNode *v6;
  _FIMutableProxyNode *v7;
  BOOL v8;
  _FIMutableProxyNode *v9;
  _FIMutableProxyNode *v10;
  _FIMutableProxyNode *v11;
  FINodeEvent *v12;

  NodeEventFromNodeEventRef((FINodeEvent *)a3, &v12);
  v4 = *(unsigned int *)TNodeEventPtr::operator->(&v12);
  v5 = *(unsigned int *)(TNodeEventPtr::operator->(&v12) + 16);
  v6 = self;
  v7 = v6;
  v8 = v4 > 0x32 || ((1 << v4) & 0x4000000000058) == 0;
  v9 = v6;
  if (!v8)
  {
    v9 = (_FIMutableProxyNode *)*(id *)(TNodeEventPtr::operator->(&v12) + 8);

  }
  -[FIProxyNode subjectNode](v7, "subjectNode");
  v10 = (_FIMutableProxyNode *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    v11 = v7;

    v9 = v11;
  }
  -[FIDSNode _sendNotification:node:property:](v7, "_sendNotification:node:property:", v4, v9, v5);

  TNodeEventPtr::~TNodeEventPtr((id *)&v12);
}

- (FINodeObserver)subjectObserver
{
  return self->_subjectObserver;
}

- (void)setSubjectObserver:(id)a3
{
  objc_storeStrong((id *)&self->_subjectObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectObserver, 0);
}

@end
