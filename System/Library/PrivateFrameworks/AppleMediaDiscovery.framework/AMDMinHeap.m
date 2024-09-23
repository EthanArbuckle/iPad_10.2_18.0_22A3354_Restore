@implementation AMDMinHeap

- (AMDMinHeap)initWithCapacity:(unint64_t)a3 comparator:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSMutableArray *v8;
  AMDMinHeap *v9;
  id location;
  unint64_t v11;
  SEL v12;
  AMDMinHeap *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  -[AMDMinHeap setCapacity:](v13, "setCapacity:", v11);
  -[AMDMinHeap setComparator:](v13, "setComparator:", location);
  -[AMDMinHeap setPosition:](v13, "setPosition:", 1);
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v6 = (id)objc_msgSend(v5, "initWithCapacity:", -[AMDMinHeap capacity](v13, "capacity") + 1);
  -[AMDMinHeap setObjects:](v13, "setObjects:");

  v8 = -[AMDMinHeap objects](v13, "objects");
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 1);
  -[NSMutableArray addObject:](v8, "addObject:");

  v9 = v13;
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v9;
}

- (BOOL)add:(id)a3
{
  NSMutableArray *v4;
  id v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  NSMutableArray *v9;
  uint64_t (**v10)(id, id);
  BOOL v11;
  uint64_t v12;
  id location[2];
  AMDMinHeap *v14;
  char v15;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = -[AMDMinHeap position](v14, "position");
  if (v12 != -[AMDMinHeap capacity](v14, "capacity") + 1)
  {
    v4 = -[AMDMinHeap objects](v14, "objects");
    -[NSMutableArray addObject:](v4, "addObject:", location[0]);

    -[AMDMinHeap setPosition:](v14, "setPosition:", -[AMDMinHeap position](v14, "position") + 1);
    -[AMDMinHeap bubbleUp](v14, "bubbleUp");
    goto LABEL_6;
  }
  v10 = (uint64_t (**)(id, id))-[AMDMinHeap comparator](v14, "comparator");
  v7 = location[0];
  v9 = -[AMDMinHeap objects](v14, "objects");
  v8 = (id)-[NSMutableArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", 1);
  v11 = v10[2](v10, v7) != 1;

  if (!v11)
  {
    v5 = location[0];
    v6 = -[AMDMinHeap objects](v14, "objects");
    -[NSMutableArray setObject:atIndexedSubscript:](v6, "setObject:atIndexedSubscript:", v5, 1);

    -[AMDMinHeap pushDown](v14, "pushDown");
LABEL_6:
    v15 = 1;
    goto LABEL_7;
  }
  v15 = 0;
LABEL_7:
  objc_storeStrong(location, 0);
  return v15 & 1;
}

- (BOOL)isEmpty
{
  return -[AMDMinHeap size](self, "size", a2, self) == 0;
}

- (unint64_t)size
{
  return -[AMDMinHeap position](self, "position", a2, self) - 1;
}

- (id)poll
{
  NSMutableArray *v3;
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7[2];
  AMDMinHeap *v8;
  id v9;

  v8 = self;
  v7[1] = (id)a2;
  if (-[AMDMinHeap isEmpty](self, "isEmpty"))
  {
    v9 = 0;
  }
  else
  {
    v6 = -[AMDMinHeap objects](v8, "objects");
    v7[0] = (id)-[NSMutableArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", 1);

    if (-[AMDMinHeap size](v8, "size") <= 1)
    {
      -[AMDMinHeap setPosition:](v8, "setPosition:", -[AMDMinHeap position](v8, "position") - 1);
    }
    else
    {
      v5 = -[AMDMinHeap objects](v8, "objects");
      v4 = (id)-[NSMutableArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", -[AMDMinHeap position](v8, "position") - 1);
      v3 = -[AMDMinHeap objects](v8, "objects");
      -[NSMutableArray setObject:atIndexedSubscript:](v3, "setObject:atIndexedSubscript:", v4, 1);

      -[AMDMinHeap setPosition:](v8, "setPosition:", -[AMDMinHeap position](v8, "position") - 1);
      -[AMDMinHeap pushDown](v8, "pushDown");
    }
    v9 = v7[0];
    objc_storeStrong(v7, 0);
  }
  return v9;
}

- (id)topN
{
  id v3;
  id v4;
  int v5;
  id location;
  id v7[2];
  AMDMinHeap *v8;

  v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[AMDMinHeap size](self, "size"));
  do
  {
    if (-[AMDMinHeap isEmpty](v8, "isEmpty"))
      break;
    location = -[AMDMinHeap poll](v8, "poll");
    if (location)
    {
      objc_msgSend(v7[0], "addObject:", location);
      v5 = 0;
    }
    else
    {
      v5 = 3;
    }
    objc_storeStrong(&location, 0);
  }
  while (!v5);
  v3 = (id)objc_msgSend(v7[0], "reverseObjectEnumerator");
  v4 = (id)objc_msgSend(v3, "allObjects");

  objc_storeStrong(v7, 0);
  return v4;
}

- (void)bubbleUp
{
  id v2;
  NSMutableArray *v3;
  id v4;
  NSMutableArray *v5;
  uint64_t (**v6)(id, id);
  BOOL v7;
  unint64_t i;

  for (i = -[AMDMinHeap position](self, "position") - 1; i > 1; i /= 2uLL)
  {
    v6 = (uint64_t (**)(id, id))-[AMDMinHeap comparator](self, "comparator");
    v5 = -[AMDMinHeap objects](self, "objects");
    v4 = (id)-[NSMutableArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", i);
    v3 = -[AMDMinHeap objects](self, "objects");
    v2 = (id)-[NSMutableArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", i / 2);
    v7 = v6[2](v6, v4) != -1;

    if (v7)
      break;
    -[AMDMinHeap swap:with:](self, "swap:with:", i, i / 2);
  }
}

- (void)pushDown
{
  id v2;
  NSMutableArray *v3;
  id v4;
  NSMutableArray *v5;
  uint64_t (**v6)(id, id);
  BOOL v7;
  BOOL v8;
  char v9;
  id v10;
  char v11;
  NSMutableArray *v12;
  char v13;
  id v14;
  char v15;
  NSMutableArray *v16;
  char v17;
  uint64_t (**v18)(id, id);
  uint64_t v19;
  unint64_t v20;
  unint64_t i;

  for (i = 1; i < -[AMDMinHeap position](self, "position"); i = v19)
  {
    v20 = 2 * i + 1;
    if (2 * i >= -[AMDMinHeap position](self, "position"))
      break;
    v17 = 0;
    v15 = 0;
    v13 = 0;
    v11 = 0;
    v9 = 0;
    v8 = 0;
    if (v20 < -[AMDMinHeap position](self, "position"))
    {
      v18 = (uint64_t (**)(id, id))-[AMDMinHeap comparator](self, "comparator");
      v17 = 1;
      v16 = -[AMDMinHeap objects](self, "objects");
      v15 = 1;
      v14 = (id)-[NSMutableArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", v20);
      v13 = 1;
      v12 = -[AMDMinHeap objects](self, "objects");
      v11 = 1;
      v10 = (id)-[NSMutableArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 2 * i);
      v9 = 1;
      v8 = v18[2](v18, v14) == -1;
    }
    if ((v9 & 1) != 0)

    if ((v11 & 1) != 0)
    if ((v13 & 1) != 0)

    if ((v15 & 1) != 0)
    if ((v17 & 1) != 0)

    v19 = v8 ? 2 * i + 1 : 2 * i;
    v6 = (uint64_t (**)(id, id))-[AMDMinHeap comparator](self, "comparator");
    v5 = -[AMDMinHeap objects](self, "objects");
    v4 = (id)-[NSMutableArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v19);
    v3 = -[AMDMinHeap objects](self, "objects");
    v2 = (id)-[NSMutableArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", i);
    v7 = v6[2](v6, v4) != -1;

    if (v7)
      break;
    -[AMDMinHeap swap:with:](self, "swap:with:", v19, i);
  }
}

- (void)swap:(unint64_t)a3 with:(unint64_t)a4
{
  NSMutableArray *v4;
  NSMutableArray *v5;
  id v6;
  NSMutableArray *v7;
  id v8;
  NSMutableArray *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  SEL v13;
  AMDMinHeap *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11 = a4;
  v4 = -[AMDMinHeap objects](self, "objects");
  v10 = (id)-[NSMutableArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", v12);

  v7 = -[AMDMinHeap objects](v14, "objects");
  v6 = (id)-[NSMutableArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", v11);
  v5 = -[AMDMinHeap objects](v14, "objects");
  -[NSMutableArray setObject:atIndexedSubscript:](v5, "setObject:atIndexedSubscript:", v6, v12);

  v8 = v10;
  v9 = -[AMDMinHeap objects](v14, "objects");
  -[NSMutableArray setObject:atIndexedSubscript:](v9, "setObject:atIndexedSubscript:", v8, v11);

  objc_storeStrong(&v10, 0);
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
}

- (id)comparator
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setComparator:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
