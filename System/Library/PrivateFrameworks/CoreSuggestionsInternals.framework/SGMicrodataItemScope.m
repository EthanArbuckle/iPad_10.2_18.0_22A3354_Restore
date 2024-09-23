@implementation SGMicrodataItemScope

- (SGMicrodataItemScope)init
{
  SGMicrodataItemScope *v2;
  uint64_t v3;
  NSMutableArray *itemProps;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGMicrodataItemScope;
  v2 = -[SGMicrodataItemScope init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    itemProps = v2->_itemProps;
    v2->_itemProps = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addItemProp:(id)a3
{
  -[NSMutableArray addObject:](self->_itemProps, "addObject:", a3);
}

- (BOOL)isReferencedBy:(id)a3
{
  SGMicrodataItemScope *v4;
  SGMicrodataItemScope *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (SGMicrodataItemScope *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[SGMicrodataItemScope itemProps](v4, "itemProps", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "itemValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 && -[SGMicrodataItemScope isReferencedBy:](self, "isReferencedBy:", v11))
          {

            v12 = 1;
            goto LABEL_14;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_14:

  }
  return v12;
}

- (NSArray)itemProps
{
  return &self->_itemProps->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProps, 0);
}

@end
