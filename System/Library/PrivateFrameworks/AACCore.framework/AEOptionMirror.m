@implementation AEOptionMirror

- (AEOptionMirror)initWithMirroredOptions:(id)a3
{
  id v4;
  AEOptionMirror *v5;
  uint64_t v6;
  NSDictionary *rightOptionsByLeft;
  uint64_t v8;
  NSDictionary *leftOptionsByRight;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AEOptionMirror;
  v5 = -[AEOptionMirror init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    rightOptionsByLeft = v5->_rightOptionsByLeft;
    v5->_rightOptionsByLeft = (NSDictionary *)v6;

    +[AEOptionMirror flippedOptionMapWithMap:]((uint64_t)AEOptionMirror, v4);
    v8 = objc_claimAutoreleasedReturnValue();
    leftOptionsByRight = v5->_leftOptionsByRight;
    v5->_leftOptionsByRight = (NSDictionary *)v8;

  }
  return v5;
}

+ (id)flippedOptionMapWithMap:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__AEOptionMirror_flippedOptionMapWithMap___block_invoke;
  v6[3] = &unk_24FA21EA0;
  v6[4] = v3;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v6);

  v4 = (void *)objc_msgSend(v3, "copy");
  return v4;
}

- (int64_t)leftOptionsFromRight:(int64_t)a3
{
  NSDictionary *leftOptionsByRight;

  if (self)
    leftOptionsByRight = self->_leftOptionsByRight;
  else
    leftOptionsByRight = 0;
  return +[AEOptionMirror destinationOptionsFromSource:destinationOptionsBySource:]((uint64_t)AEOptionMirror, a3, leftOptionsByRight);
}

+ (uint64_t)destinationOptionsFromSource:(void *)a3 destinationOptionsBySource:
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_opt_self();
  if (a2 < 1)
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    v6 = 1;
    do
    {
      if ((v6 & a2) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6 & a2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 |= objc_msgSend(v8, "integerValue");

      }
      a2 &= ~v6;
      v6 *= 2;
    }
    while (a2);
  }

  return v5;
}

- (int64_t)rightOptionsFromLeft:(int64_t)a3
{
  NSDictionary *rightOptionsByLeft;

  if (self)
    rightOptionsByLeft = self->_rightOptionsByLeft;
  else
    rightOptionsByLeft = 0;
  return +[AEOptionMirror destinationOptionsFromSource:destinationOptionsBySource:]((uint64_t)AEOptionMirror, a3, rightOptionsByLeft);
}

- (int64_t)leftClearMask
{
  void *v2;
  int64_t v3;

  if (self)
    self = (AEOptionMirror *)self->_leftOptionsByRight;
  -[AEOptionMirror allValues](self, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[AEOptionMirror clearMaskWithNumbers:]((uint64_t)AEOptionMirror, v2);

  return v3;
}

+ (uint64_t)clearMaskWithNumbers:(uint64_t)a1
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_opt_self();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "integerValue", (_QWORD)v11);
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
    v9 = ~v6;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (int64_t)rightClearMask
{
  void *v2;
  int64_t v3;

  if (self)
    self = (AEOptionMirror *)self->_rightOptionsByLeft;
  -[AEOptionMirror allValues](self, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[AEOptionMirror clearMaskWithNumbers:]((uint64_t)AEOptionMirror, v2);

  return v3;
}

uint64_t __42__AEOptionMirror_flippedOptionMapWithMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftOptionsByRight, 0);
  objc_storeStrong((id *)&self->_rightOptionsByLeft, 0);
}

@end
