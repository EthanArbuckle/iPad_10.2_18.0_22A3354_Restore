@implementation SKNode(GameplayKit)

+ (id)obstaclesFromSpriteTextures:()GameplayKit accuracy:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  double v12;
  void *v13;
  char *v14;
  void *v15;
  char *v16;
  char *v17;
  void *v18;
  void *v19;
  id v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *__p;
  char *v29;
  unint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  __p = 0;
  v29 = 0;
  v30 = 0;
  std::vector<NSObject * {__strong}>::reserve((uint64_t)&__p, objc_msgSend(v5, "count"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = 0;
          v23 = 0;
          *(float *)&v12 = a1;
          if (objc_msgSend(v11, "_pathFromTextureToPoints:outSize:accuracy:", &v23, &v22, v12))
          {
            if (v22)
            {
              +[GKPolygonObstacle obstacleWithPoints:count:](GKPolygonObstacle, "obstacleWithPoints:count:", v23);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v13;
              v14 = v29;
              if ((unint64_t)v29 < v30)
              {
                *(_QWORD *)v14 = v13;
                v10 = v14 + 8;
              }
              else
              {
                v10 = (char *)std::vector<NSObject * {__strong}>::__push_back_slow_path<NSObject * const {__strong}&>(&__p, &v21);
              }
              v29 = v10;

            }
            free(v23);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (char *)__p;
  if (__p)
  {
    v17 = v29;
    v18 = __p;
    if (v29 != __p)
    {
      do
      {
        v19 = (void *)*((_QWORD *)v17 - 1);
        v17 -= 8;

      }
      while (v17 != v16);
      v18 = __p;
    }
    v29 = v16;
    operator delete(v18);
  }

  return v15;
}

+ (id)obstaclesFromNodeBounds:()GameplayKit
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  char *v13;
  char *v14;
  void *v15;
  char *v16;
  char *v17;
  void *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *__p;
  char *v27;
  unint64_t v28;
  _OWORD v29[2];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  __p = 0;
  v27 = 0;
  v28 = 0;
  std::vector<NSObject * {__strong}>::reserve((uint64_t)&__p, objc_msgSend(v3, "count"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v7), "globalBoundingVerts");
        *((_QWORD *)&v9 + 1) = v8;
        *((_QWORD *)&v11 + 1) = v10;
        v29[0] = v9;
        v29[1] = v11;
        +[GKPolygonObstacle obstacleWithPoints:count:](GKPolygonObstacle, "obstacleWithPoints:count:", v29, 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v12;
        v13 = v27;
        if ((unint64_t)v27 >= v28)
        {
          v14 = (char *)std::vector<NSObject * {__strong}>::__push_back_slow_path<NSObject * const {__strong}&>(&__p, &v21);
        }
        else
        {
          *(_QWORD *)v13 = v12;
          v14 = v13 + 8;
        }
        v27 = v14;

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (char *)__p;
  if (__p)
  {
    v17 = v27;
    v18 = __p;
    if (v27 != __p)
    {
      do
      {
        v19 = (void *)*((_QWORD *)v17 - 1);
        v17 -= 8;

      }
      while (v17 != v16);
      v18 = __p;
    }
    v27 = v16;
    operator delete(v18);
  }

  return v15;
}

+ (id)obstaclesFromNodePhysicsBodies:()GameplayKit
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  char *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  char *v13;
  void *v14;
  char *v15;
  char *v16;
  void *v17;
  void *v18;
  id v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *__p;
  char *v28;
  unint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  __p = 0;
  v28 = 0;
  v29 = 0;
  std::vector<NSObject * {__strong}>::reserve((uint64_t)&__p, objc_msgSend(v3, "count"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "physicsBody");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (!v11)
        {
          v21 = 0;
          v22 = 0;
          if (objc_msgSend(v9, "_pathFromPhysicsBodyToPoints:outSize:", &v22, &v21))
          {
            if (v21)
            {
              +[GKPolygonObstacle obstacleWithPoints:count:](GKPolygonObstacle, "obstacleWithPoints:count:", v22);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = v12;
              v13 = v28;
              if ((unint64_t)v28 < v29)
              {
                *(_QWORD *)v13 = v12;
                v8 = v13 + 8;
              }
              else
              {
                v8 = (char *)std::vector<NSObject * {__strong}>::__push_back_slow_path<NSObject * const {__strong}&>(&__p, &v20);
              }
              v28 = v8;

            }
            free(v22);
          }
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (char *)__p;
  if (__p)
  {
    v16 = v28;
    v17 = __p;
    if (v28 != __p)
    {
      do
      {
        v18 = (void *)*((_QWORD *)v16 - 1);
        v16 -= 8;

      }
      while (v16 != v15);
      v17 = __p;
    }
    v28 = v15;
    operator delete(v17);
  }

  return v14;
}

@end
