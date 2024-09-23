@implementation CPSWindow

- (void)addEventObserver:(id)a3
{
  NSHashTable *v3;
  NSHashTable *v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  BOOL v8;
  BOOL v9;
  id location[2];
  CPSWindow *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSWindow observers](v11, "observers");
  v9 = v3 != 0;

  if (!v9)
  {
    v4 = (NSHashTable *)(id)objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    observers = v11->_observers;
    v11->_observers = v4;

  }
  v7 = -[CPSWindow observers](v11, "observers");
  v8 = -[NSHashTable containsObject:](v7, "containsObject:", location[0]);

  if (!v8)
  {
    v6 = -[CPSWindow observers](v11, "observers");
    -[NSHashTable addObject:](v6, "addObject:", location[0]);

  }
  objc_storeStrong(location, 0);
}

- (void)removeEventObserver:(id)a3
{
  NSHashTable *v3;
  NSHashTable *v4;
  BOOL v5;
  id location[2];
  CPSWindow *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSWindow observers](v7, "observers");
  v5 = -[NSHashTable containsObject:](v4, "containsObject:", location[0]);

  if (v5)
  {
    v3 = -[CPSWindow observers](v7, "observers");
    -[NSHashTable removeObject:](v3, "removeObject:", location[0]);

  }
  objc_storeStrong(location, 0);
}

- (void)sendEvent:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSHashTable *obj;
  uint64_t v8;
  char v9;
  char v10;
  objc_super v11;
  char v12;
  _QWORD __b[8];
  id v14;
  char v15;
  id v16;
  char v17;
  id location[2];
  CPSWindow *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 1;
  v15 = 0;
  v10 = 1;
  if (objc_msgSend(location[0], "type") != 7)
  {
    v9 = 0;
    if (!objc_msgSend(location[0], "type"))
    {
      v16 = (id)objc_msgSend(location[0], "allTouches");
      v15 = 1;
      v9 = _touchesContainIndirectTouch(v16);
    }
    v10 = v9;
  }
  if ((v15 & 1) != 0)

  if ((v10 & 1) != 0)
  {
    memset(__b, 0, sizeof(__b));
    obj = -[CPSWindow observers](v19, "observers");
    v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
    if (v8)
    {
      v4 = *(_QWORD *)__b[2];
      v5 = 0;
      v6 = v8;
      while (1)
      {
        v3 = v5;
        if (*(_QWORD *)__b[2] != v4)
          objc_enumerationMutation(obj);
        v14 = *(id *)(__b[1] + 8 * v5);
        v12 = objc_msgSend(v14, "shouldForwardEventForWindow:eventType:", v19, objc_msgSend(location[0], "type")) & 1;
        if ((v17 & 1) == 1 && (v12 & 1) == 0)
          v17 = 0;
        ++v5;
        if (v3 + 1 >= v6)
        {
          v5 = 0;
          v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
          if (!v6)
            break;
        }
      }
    }

  }
  if ((v17 & 1) != 0)
  {
    v11.receiver = v19;
    v11.super_class = (Class)CPSWindow;
    -[CPSWindow sendEvent:](&v11, sel_sendEvent_, location[0]);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_isKeyWindowForDeferral
{
  return 0;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
