@implementation NSArray

- (id)buddy_mapCountedSet:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  id v7;
  id v8;
  id v9;
  _QWORD v11[8];
  uint64_t v12;
  id v13;
  id location[2];
  id v15;
  _BYTE v16[128];

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = objc_alloc_init((Class)NSCountedSet);
  memset(v11, 0, sizeof(v11));
  v3 = v15;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v11, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)v11[2] != v5)
          objc_enumerationMutation(v3);
        v12 = *(_QWORD *)(v11[1] + 8 * i);
        v7 = v13;
        v8 = (id)(*((uint64_t (**)(id, uint64_t))location[0] + 2))(location[0], v12);
        objc_msgSend(v7, "addObject:", v8);

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v11, v16, 16);
    }
    while (v4);
  }

  v9 = v13;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (id)buddy_mapSet:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  id v7;
  id v8;
  id v9;
  _QWORD v11[8];
  uint64_t v12;
  id v13;
  id location[2];
  id v15;
  _BYTE v16[128];

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = objc_alloc_init((Class)NSMutableSet);
  memset(v11, 0, sizeof(v11));
  v3 = v15;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v11, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)v11[2] != v5)
          objc_enumerationMutation(v3);
        v12 = *(_QWORD *)(v11[1] + 8 * i);
        v7 = v13;
        v8 = (id)(*((uint64_t (**)(id, uint64_t))location[0] + 2))(location[0], v12);
        objc_msgSend(v7, "addObject:", v8);

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v11, v16, 16);
    }
    while (v4);
  }

  v9 = objc_msgSend(v13, "copy");
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (id)buddy_mapOrderedSet:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  id v7;
  id v8;
  id v9;
  _QWORD v11[8];
  uint64_t v12;
  id v13;
  id location[2];
  id v15;
  _BYTE v16[128];

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = +[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet");
  memset(v11, 0, sizeof(v11));
  v3 = v15;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v11, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)v11[2] != v5)
          objc_enumerationMutation(v3);
        v12 = *(_QWORD *)(v11[1] + 8 * i);
        v7 = v13;
        v8 = (id)(*((uint64_t (**)(id, uint64_t))location[0] + 2))(location[0], v12);
        objc_msgSend(v7, "addObject:", v8);

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v11, v16, 16);
    }
    while (v4);
  }

  v9 = objc_msgSend(v13, "copy");
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (id)buddy_filterToOrderedSet:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  id v7;
  _QWORD v9[8];
  uint64_t v10;
  id v11;
  id location[2];
  id v13;
  _BYTE v14[128];

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = +[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet");
  memset(v9, 0, sizeof(v9));
  v3 = v13;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v9, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)v9[2] != v5)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(v9[1] + 8 * i);
        if (((*((uint64_t (**)(id, uint64_t))location[0] + 2))(location[0], v10) & 1) != 0)
          objc_msgSend(v11, "addObject:", v10);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v9, v14, 16);
    }
    while (v4);
  }

  v7 = objc_msgSend(v11, "copy");
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)buddy_mapArray:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  id v7;
  id v8;
  id v9;
  _QWORD v11[8];
  uint64_t v12;
  id v13;
  id location[2];
  id v15;
  _BYTE v16[128];

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = objc_alloc_init((Class)NSMutableArray);
  memset(v11, 0, sizeof(v11));
  v3 = v15;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v11, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)v11[2] != v5)
          objc_enumerationMutation(v3);
        v12 = *(_QWORD *)(v11[1] + 8 * i);
        v7 = v13;
        v8 = (id)(*((uint64_t (**)(id, uint64_t))location[0] + 2))(location[0], v12);
        objc_msgSend(v7, "addObject:", v8);

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v11, v16, 16);
    }
    while (v4);
  }

  v9 = objc_msgSend(v13, "copy");
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (unint64_t)indexOfFirstMatchingCondition:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  int v8;
  _QWORD __b[8];
  uint64_t v10;
  unint64_t v11;
  id location[2];
  id v13;
  unint64_t v14;
  _BYTE v15[128];

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  memset(__b, 0, sizeof(__b));
  v3 = v13;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(__b[1] + 8 * i);
        if (((*((uint64_t (**)(id, uint64_t))location[0] + 2))(location[0], v10) & 1) != 0)
        {
          v14 = v11;
          v8 = 1;
          goto LABEL_11;
        }
        ++v11;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
    }
    while (v4);
  }
  v8 = 0;
LABEL_11:

  if (!v8)
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  objc_storeStrong(location, 0);
  return v14;
}

@end
