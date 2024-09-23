@implementation KGGraphManagerRecord

- (KGGraphManagerRecord)initWithGraphManager:(id)a3
{
  id v5;
  KGGraphManagerRecord *v6;
  KGGraphManagerRecord *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGGraphManagerRecord;
  v6 = -[KGGraphManagerRecord init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphManager, a3);
    v7->_useCount = 1;
  }

  return v7;
}

- (void)incrementUseCount
{
  ++self->_useCount;
}

- (BOOL)decrementUseCount
{
  unint64_t v2;

  v2 = self->_useCount - 1;
  self->_useCount = v2;
  return v2 == 0;
}

- (KGGraphManager)graphManager
{
  return self->_graphManager;
}

- (void)setGraphManager:(id)a3
{
  objc_storeStrong((id *)&self->_graphManager, a3);
}

- (unint64_t)useCount
{
  return self->_useCount;
}

- (void)setUseCount:(unint64_t)a3
{
  self->_useCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphManager, 0);
}

@end
