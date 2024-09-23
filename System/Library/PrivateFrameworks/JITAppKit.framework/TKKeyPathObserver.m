@implementation TKKeyPathObserver

- (TKKeyPathObserver)initWithBlock:(id)a3
{
  TKKeyPathObserver *v3;
  void *v4;
  id block;
  NSMutableArray *v6;
  NSMutableArray *observations;
  TKKeyPathObserver *v9;
  objc_super v10;
  id location[2];
  TKKeyPathObserver *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v12;
  v12 = 0;
  v10.receiver = v3;
  v10.super_class = (Class)TKKeyPathObserver;
  v12 = -[TKKeyPathObserver init](&v10, sel_init);
  objc_storeStrong((id *)&v12, v12);
  if (v12)
  {
    v4 = _Block_copy(location[0]);
    block = v12->_block;
    v12->_block = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    observations = v12->_observations;
    v12->_observations = v6;

  }
  v9 = v12;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v9;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  TKKeyPathObserver *v4;

  v4 = self;
  v3 = a2;
  -[TKKeyPathObserver stopObserving](self, "stopObserving");
  v2.receiver = v4;
  v2.super_class = (Class)TKKeyPathObserver;
  -[TKKeyPathObserver dealloc](&v2, sel_dealloc);
}

- (void)observe:(id)a3 keyPath:(id)a4
{
  TKKeyPathObservation *v5;
  id v6;
  id location[2];
  TKKeyPathObserver *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = objc_alloc_init(TKKeyPathObservation);
  -[TKKeyPathObservation setObject:](v5, "setObject:", location[0]);
  -[TKKeyPathObservation setKeyPath:](v5, "setKeyPath:", v6);
  -[NSMutableArray addObject:](v8->_observations, "addObject:", v5);
  objc_msgSend(location[0], "addObserver:forKeyPath:options:context:", v8, v6, 0, 0);
  objc_storeStrong((id *)&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)stopObserving
{
  NSMutableArray *observations;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(_QWORD *, void *, void *, void *);
  void *v7;
  id v8[2];
  TKKeyPathObserver *v9;

  v9 = self;
  v8[1] = (id)a2;
  observations = self->_observations;
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __34__TKKeyPathObserver_stopObserving__block_invoke;
  v7 = &unk_24E099F70;
  v8[0] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](observations, "enumerateObjectsUsingBlock:");
  -[NSMutableArray removeAllObjects](v9->_observations, "removeAllObjects");
  objc_storeStrong(v8, 0);
}

void __34__TKKeyPathObserver_stopObserving__block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  uint64_t v4;
  id v5;
  id v9[4];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[3] = a3;
  v9[2] = a4;
  v9[1] = a1;
  v9[0] = (id)objc_msgSend(location[0], "object");
  if (v9[0])
  {
    v4 = a1[4];
    v5 = (id)objc_msgSend(location[0], "keyPath");
    objc_msgSend(v9[0], "removeObserver:forKeyPath:", v4);

  }
  objc_msgSend(location[0], "setObject:");
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  id location[2];
  TKKeyPathObserver *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = 0;
  objc_storeStrong(&v8, a5);
  if (v9 && location[0])
    (*((void (**)(void))v11->_block + 2))();
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observations, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
