@implementation SGMicrodataItem

- (void)resolveItemRefsWithDocument:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableArray *itemProps;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableArray count](self->_itemRef, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = self->_itemRef;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v4, "htmlIds", (_QWORD)v21);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            if (!-[SGMicrodataItemScope isReferencedBy:](self, "isReferencedBy:", v12))
            {
              itemProps = self->super._itemProps;
              objc_msgSend(v12, "itemProps");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObjectsFromArray:](itemProps, "addObjectsFromArray:", v14);

              -[SGMicrodataItemScope itemProps](self, "itemProps");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "count");

              if (v16 >= 0x3E8)
              {

                goto LABEL_14;
              }
            }
          }

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

    -[SGMicrodataItemScope itemProps](self, "itemProps");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18 >= 0x3E9)
    {
      -[SGMicrodataItemScope itemProps](self, "itemProps");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count") - 1000;

      -[NSMutableArray removeObjectsInRange:](self->super._itemProps, "removeObjectsInRange:", 1000, v20);
    }
  }

}

- (SGMicrodataItem)initWithItemType:(id)a3 itemRef:(id)a4
{
  id v7;
  id v8;
  SGMicrodataItem *v9;
  SGMicrodataItem *v10;
  uint64_t v11;
  NSMutableArray *itemRef;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SGMicrodataItem;
  v9 = -[SGMicrodataItemScope init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemType, a3);
    v11 = objc_msgSend(v8, "mutableCopy");
    itemRef = v10->_itemRef;
    v10->_itemRef = (NSMutableArray *)v11;

  }
  return v10;
}

- (NSSet)itemType
{
  return self->_itemType;
}

- (NSArray)itemRef
{
  return &self->_itemRef->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemType, 0);
  objc_storeStrong((id *)&self->_itemRef, 0);
}

@end
