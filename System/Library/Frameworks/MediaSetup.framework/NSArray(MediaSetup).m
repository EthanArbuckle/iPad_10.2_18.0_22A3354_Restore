@implementation NSArray(MediaSetup)

- (uint64_t)ms_objectsPassingTest:()MediaSetup
{
  return objc_msgSend(a1, "ms_objectsWithOptions:passingTest:", 0, a3);
}

- (id)ms_objectsWithOptions:()MediaSetup passingTest:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  if (v6)
  {
    objc_msgSend(a1, "indexesOfObjectsWithOptions:passingTest:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(a1, "objectsAtIndexes:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)MEMORY[0x24BDBD1A8];
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v8;
}

- (uint64_t)ms_anyPassingTest:()MediaSetup
{
  uint64_t (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          v6 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

@end
