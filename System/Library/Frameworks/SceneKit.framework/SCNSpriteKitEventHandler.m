@implementation SCNSpriteKitEventHandler

- (SCNSpriteKitEventHandler)init
{
  SCNSpriteKitEventHandler *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNSpriteKitEventHandler;
  v2 = -[SCNSpriteKitEventHandler init](&v4, sel_init);
  if (v2)
    v2->_touchMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNSpriteKitEventHandler;
  -[SCNSpriteKitEventHandler dealloc](&v3, sel_dealloc);
}

- (BOOL)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  SKScene *scene;
  void *j;
  uint64_t *v15;
  _QWORD *v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  id v29;
  uint64_t *v30;
  void *v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t *v35;
  BOOL v36;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t *v44;
  _QWORD *v45[2];
  id *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!self->_scene)
    return 0;
  v45[0] = 0;
  v45[1] = 0;
  v44 = (uint64_t *)v45;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  v38 = a4;
  v8 = 0;
  if (v7)
  {
    v9 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "hash"));
        v39 = 0;
        scene = self->_scene;
        objc_msgSend(v11, "locationInNode:", scene);
        for (j = (void *)-[SKScene nodeAtPoint:recursive:](scene, "nodeAtPoint:recursive:", 1);
              ;
              j = (void *)objc_msgSend(v39, "parent"))
        {
          v39 = j;
          if (!j)
            break;
          if ((objc_msgSend(j, "isUserInteractionEnabled") & 1) != 0)
          {
            if (v39)
            {
              -[NSMutableDictionary setObject:forKey:](self->_touchMap, "setObject:forKey:", v39, v12);
              v46 = &v39;
              v15 = std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::__emplace_unique_key_args<SKNode *,std::piecewise_construct_t const&,std::tuple<SKNode * const&>,std::tuple<>>(&v44, (unint64_t *)&v39, (uint64_t)&std::piecewise_construct, (uint64_t **)&v46);
              v16 = (_QWORD *)v15[6];
              v17 = v15[7];
              if ((unint64_t)v16 >= v17)
              {
                v19 = v15[5];
                v20 = ((uint64_t)v16 - v19) >> 3;
                if ((unint64_t)(v20 + 1) >> 61)
                  abort();
                v21 = v17 - v19;
                v22 = v21 >> 2;
                if (v21 >> 2 <= (unint64_t)(v20 + 1))
                  v22 = v20 + 1;
                if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8)
                  v23 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v23 = v22;
                if (v23)
                  v24 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(v15 + 7), v23);
                else
                  v24 = 0;
                v25 = &v24[8 * v20];
                *(_QWORD *)v25 = v11;
                v18 = v25 + 8;
                v27 = (char *)v15[5];
                v26 = (char *)v15[6];
                if (v26 != v27)
                {
                  do
                  {
                    v28 = *((_QWORD *)v26 - 1);
                    v26 -= 8;
                    *((_QWORD *)v25 - 1) = v28;
                    v25 -= 8;
                  }
                  while (v26 != v27);
                  v26 = (char *)v15[5];
                }
                v15[5] = (uint64_t)v25;
                v15[6] = (uint64_t)v18;
                v15[7] = (uint64_t)&v24[8 * v23];
                if (v26)
                  operator delete(v26);
              }
              else
              {
                *v16 = v11;
                v18 = v16 + 1;
              }
              v15[6] = (uint64_t)v18;
              v8 = 1;
            }
            break;
          }
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v7);
  }
  v29 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v30 = v44;
  if (v44 != (uint64_t *)v45)
  {
    do
    {
      v31 = (void *)v30[4];
      v32 = (_QWORD *)v30[5];
      v33 = (_QWORD *)v30[6];
      while (v32 != v33)
        objc_msgSend(v29, "addObject:", *v32++);
      objc_msgSend(v31, "touchesBegan:withEvent:", v29, v38);
      objc_msgSend(v29, "removeAllObjects");
      v34 = (uint64_t *)v30[1];
      if (v34)
      {
        do
        {
          v35 = v34;
          v34 = (uint64_t *)*v34;
        }
        while (v34);
      }
      else
      {
        do
        {
          v35 = (uint64_t *)v30[2];
          v36 = *v35 == (_QWORD)v30;
          v30 = v35;
        }
        while (!v36);
      }
      v30 = v35;
    }
    while (v35 != (uint64_t *)v45);
  }

  std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::destroy((uint64_t)&v44, v45[0]);
  return v8 & 1;
}

- (BOOL)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  id v27;
  uint64_t *v28;
  void *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t *v33;
  BOOL v34;
  id v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t *v42;
  _QWORD *v43[2];
  uint64_t *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!self->_scene)
    return 0;
  v43[0] = 0;
  v43[1] = 0;
  v42 = (uint64_t *)v43;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  v36 = a4;
  v8 = 0;
  if (v7)
  {
    v9 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "hash"));
        v37 = 0;
        v37 = -[NSMutableDictionary objectForKey:](self->_touchMap, "objectForKey:", v12);
        if (v37)
        {
          v44 = &v37;
          v13 = std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::__emplace_unique_key_args<SKNode *,std::piecewise_construct_t const&,std::tuple<SKNode * const&>,std::tuple<>>(&v42, (unint64_t *)&v37, (uint64_t)&std::piecewise_construct, &v44);
          v14 = (_QWORD *)v13[6];
          v15 = v13[7];
          if ((unint64_t)v14 >= v15)
          {
            v17 = v13[5];
            v18 = ((uint64_t)v14 - v17) >> 3;
            if ((unint64_t)(v18 + 1) >> 61)
              abort();
            v19 = v15 - v17;
            v20 = v19 >> 2;
            if (v19 >> 2 <= (unint64_t)(v18 + 1))
              v20 = v18 + 1;
            if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8)
              v21 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v21 = v20;
            if (v21)
              v22 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(v13 + 7), v21);
            else
              v22 = 0;
            v23 = &v22[8 * v18];
            *(_QWORD *)v23 = v11;
            v16 = v23 + 8;
            v25 = (char *)v13[5];
            v24 = (char *)v13[6];
            if (v24 != v25)
            {
              do
              {
                v26 = *((_QWORD *)v24 - 1);
                v24 -= 8;
                *((_QWORD *)v23 - 1) = v26;
                v23 -= 8;
              }
              while (v24 != v25);
              v24 = (char *)v13[5];
            }
            v13[5] = (uint64_t)v23;
            v13[6] = (uint64_t)v16;
            v13[7] = (uint64_t)&v22[8 * v21];
            if (v24)
              operator delete(v24);
          }
          else
          {
            *v14 = v11;
            v16 = v14 + 1;
          }
          v13[6] = (uint64_t)v16;
          v8 = 1;
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v7);
  }
  v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v28 = v42;
  if (v42 != (uint64_t *)v43)
  {
    do
    {
      v29 = (void *)v28[4];
      v30 = (_QWORD *)v28[5];
      v31 = (_QWORD *)v28[6];
      while (v30 != v31)
        objc_msgSend(v27, "addObject:", *v30++);
      objc_msgSend(v29, "touchesMoved:withEvent:", v27, v36);
      objc_msgSend(v27, "removeAllObjects");
      v32 = (uint64_t *)v28[1];
      if (v32)
      {
        do
        {
          v33 = v32;
          v32 = (uint64_t *)*v32;
        }
        while (v32);
      }
      else
      {
        do
        {
          v33 = (uint64_t *)v28[2];
          v34 = *v33 == (_QWORD)v28;
          v28 = v33;
        }
        while (!v34);
      }
      v28 = v33;
    }
    while (v33 != (uint64_t *)v43);
  }

  std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::destroy((uint64_t)&v42, v43[0]);
  return v8 & 1;
}

- (BOOL)touchesEnded:(id)a3 withEvent:(id)a4
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  _QWORD *v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t *v28;
  _QWORD *v29;
  _QWORD *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t *v35;
  uint64_t *v36;
  BOOL v37;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t *v50;
  _QWORD *v51[2];
  uint64_t *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!self->_scene)
    return 0;
  v51[0] = 0;
  v51[1] = 0;
  v50 = (uint64_t *)v51;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v6 = 0;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "hash"));
        v45 = 0;
        v45 = -[NSMutableDictionary objectForKey:](self->_touchMap, "objectForKey:", v11);
        if (v45)
        {
          v52 = &v45;
          v12 = std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::__emplace_unique_key_args<SKNode *,std::piecewise_construct_t const&,std::tuple<SKNode * const&>,std::tuple<>>(&v50, (unint64_t *)&v45, (uint64_t)&std::piecewise_construct, &v52);
          v13 = (_QWORD *)v12[6];
          v14 = v12[7];
          if ((unint64_t)v13 >= v14)
          {
            v16 = v12[5];
            v17 = ((uint64_t)v13 - v16) >> 3;
            if ((unint64_t)(v17 + 1) >> 61)
              abort();
            v18 = v14 - v16;
            v19 = v18 >> 2;
            if (v18 >> 2 <= (unint64_t)(v17 + 1))
              v19 = v17 + 1;
            if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
              v20 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v20 = v19;
            if (v20)
              v21 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(v12 + 7), v20);
            else
              v21 = 0;
            v22 = &v21[8 * v17];
            *(_QWORD *)v22 = v10;
            v15 = v22 + 8;
            v24 = (char *)v12[5];
            v23 = (char *)v12[6];
            if (v23 != v24)
            {
              do
              {
                v25 = *((_QWORD *)v23 - 1);
                v23 -= 8;
                *((_QWORD *)v22 - 1) = v25;
                v22 -= 8;
              }
              while (v23 != v24);
              v23 = (char *)v12[5];
            }
            v12[5] = (uint64_t)v22;
            v12[6] = (uint64_t)v15;
            v12[7] = (uint64_t)&v21[8 * v20];
            if (v23)
              operator delete(v23);
          }
          else
          {
            *v13 = v10;
            v15 = v13 + 1;
          }
          v12[6] = (uint64_t)v15;
          v6 = 1;
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v28 = v50;
  if (v50 != (uint64_t *)v51)
  {
    do
    {
      v29 = (_QWORD *)v28[5];
      v40 = (void *)v28[4];
      v30 = (_QWORD *)v28[6];
      while (v29 != v30)
      {
        v31 = (void *)*v29;
        objc_msgSend(v27, "addObject:", *v29);
        objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v31, "hash")));
        ++v29;
      }
      objc_msgSend(v40, "touchesEnded:withEvent:", v27, a4);
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v32 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v42 != v33)
              objc_enumerationMutation(v26);
            -[NSMutableDictionary removeObjectForKey:](self->_touchMap, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
          }
          v32 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
        }
        while (v32);
      }
      objc_msgSend(v26, "removeAllObjects");
      objc_msgSend(v27, "removeAllObjects");
      v35 = (uint64_t *)v28[1];
      if (v35)
      {
        do
        {
          v36 = v35;
          v35 = (uint64_t *)*v35;
        }
        while (v35);
      }
      else
      {
        do
        {
          v36 = (uint64_t *)v28[2];
          v37 = *v36 == (_QWORD)v28;
          v28 = v36;
        }
        while (!v37);
      }
      v28 = v36;
    }
    while (v36 != (uint64_t *)v51);
  }

  std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::destroy((uint64_t)&v50, v51[0]);
  return v6 & 1;
}

- (BOOL)touchesCancelled:(id)a3 withEvent:(id)a4
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  _QWORD *v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t *v28;
  _QWORD *v29;
  _QWORD *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t *v35;
  uint64_t *v36;
  BOOL v37;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t *v50;
  _QWORD *v51[2];
  uint64_t *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!self->_scene)
    return 0;
  v51[0] = 0;
  v51[1] = 0;
  v50 = (uint64_t *)v51;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v6 = 0;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "hash"));
        v45 = 0;
        v45 = -[NSMutableDictionary objectForKey:](self->_touchMap, "objectForKey:", v11);
        if (v45)
        {
          v52 = &v45;
          v12 = std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::__emplace_unique_key_args<SKNode *,std::piecewise_construct_t const&,std::tuple<SKNode * const&>,std::tuple<>>(&v50, (unint64_t *)&v45, (uint64_t)&std::piecewise_construct, &v52);
          v13 = (_QWORD *)v12[6];
          v14 = v12[7];
          if ((unint64_t)v13 >= v14)
          {
            v16 = v12[5];
            v17 = ((uint64_t)v13 - v16) >> 3;
            if ((unint64_t)(v17 + 1) >> 61)
              abort();
            v18 = v14 - v16;
            v19 = v18 >> 2;
            if (v18 >> 2 <= (unint64_t)(v17 + 1))
              v19 = v17 + 1;
            if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
              v20 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v20 = v19;
            if (v20)
              v21 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(v12 + 7), v20);
            else
              v21 = 0;
            v22 = &v21[8 * v17];
            *(_QWORD *)v22 = v10;
            v15 = v22 + 8;
            v24 = (char *)v12[5];
            v23 = (char *)v12[6];
            if (v23 != v24)
            {
              do
              {
                v25 = *((_QWORD *)v23 - 1);
                v23 -= 8;
                *((_QWORD *)v22 - 1) = v25;
                v22 -= 8;
              }
              while (v23 != v24);
              v23 = (char *)v12[5];
            }
            v12[5] = (uint64_t)v22;
            v12[6] = (uint64_t)v15;
            v12[7] = (uint64_t)&v21[8 * v20];
            if (v23)
              operator delete(v23);
          }
          else
          {
            *v13 = v10;
            v15 = v13 + 1;
          }
          v12[6] = (uint64_t)v15;
          v6 = 1;
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v28 = v50;
  if (v50 != (uint64_t *)v51)
  {
    do
    {
      v29 = (_QWORD *)v28[5];
      v40 = (void *)v28[4];
      v30 = (_QWORD *)v28[6];
      while (v29 != v30)
      {
        v31 = (void *)*v29;
        objc_msgSend(v27, "addObject:", *v29);
        objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v31, "hash")));
        ++v29;
      }
      objc_msgSend(v40, "touchesCancelled:withEvent:", v27, a4);
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v32 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v42 != v33)
              objc_enumerationMutation(v26);
            -[NSMutableDictionary removeObjectForKey:](self->_touchMap, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
          }
          v32 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
        }
        while (v32);
      }
      objc_msgSend(v26, "removeAllObjects");
      objc_msgSend(v27, "removeAllObjects");
      v35 = (uint64_t *)v28[1];
      if (v35)
      {
        do
        {
          v36 = v35;
          v35 = (uint64_t *)*v35;
        }
        while (v35);
      }
      else
      {
        do
        {
          v36 = (uint64_t *)v28[2];
          v37 = *v36 == (_QWORD)v28;
          v28 = v36;
        }
        while (!v37);
      }
      v28 = v36;
    }
    while (v36 != (uint64_t *)v51);
  }

  std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::destroy((uint64_t)&v50, v51[0]);
  return v6 & 1;
}

- (SKScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
