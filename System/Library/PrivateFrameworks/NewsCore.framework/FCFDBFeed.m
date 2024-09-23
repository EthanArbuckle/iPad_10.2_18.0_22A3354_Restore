@implementation FCFDBFeed

- (NSString)feedID
{
  return self->_feedID;
}

- (id)initFromSQLWithFeedID:(const char *)a3 feedLookupID:(int64_t)a4 refreshedFromOrder:(int64_t)a5 refreshedToOrder:(int64_t)a6 fetchedRangesBytes:(const void *)a7 fetchedRangesLength:(int)a8
{
  void *v14;
  void *v15;
  FCFDBFeed *v16;
  _QWORD v18[5];
  int v19;

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", a3, 4);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __123__FCFDBFeed_initFromSQLWithFeedID_feedLookupID_refreshedFromOrder_refreshedToOrder_fetchedRangesBytes_fetchedRangesLength___block_invoke;
  v18[3] = &__block_descriptor_44_e24_v16__0__NSMutableArray_8l;
  v18[4] = a7;
  v19 = a8;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FCFDBFeed initWithFeedID:feedLookupID:refreshedFromOrder:refreshedToOrder:fetchedRanges:](self, "initWithFeedID:feedLookupID:refreshedFromOrder:refreshedToOrder:fetchedRanges:", v14, a4, a5, a6, v15);

  return v16;
}

void __123__FCFDBFeed_initFromSQLWithFeedID_feedLookupID_refreshedFromOrder_refreshedToOrder_fetchedRangesBytes_fetchedRangesLength___block_invoke(uint64_t a1, void *a2)
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = *(char **)(a1 + 32);
  if (v3)
  {
    v4 = *(int *)(a1 + 40);
    v5 = &v3[v4];
    while (v3 < v5)
    {
      v6 = *(_QWORD *)v3;
      v7 = *((_QWORD *)v3 + 1);
      v3 += 16;
      +[FCFeedRange feedRangeWithMaxOrder:minOrder:](FCFeedRange, "feedRangeWithMaxOrder:minOrder:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v8);

    }
  }

}

- (FCFDBFeed)initWithFeedID:(id)a3 feedLookupID:(int64_t)a4 refreshedFromOrder:(unint64_t)a5 refreshedToOrder:(unint64_t)a6 fetchedRanges:(id)a7
{
  id v13;
  id v14;
  FCFDBFeed *v15;
  FCFDBFeed *v16;
  void *v17;
  objc_super v19;

  v13 = a3;
  v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)FCFDBFeed;
  v15 = -[FCFDBFeed init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_feedID, a3);
    v16->_feedLookupID = a4;
    v16->_refreshedFromOrder = a5;
    v16->_refreshedToOrder = a6;
    if (v14)
      v17 = v14;
    else
      v17 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v16->_fetchedRanges, v17);
    -[FCFDBFeed d_sanityCheck](v16, "d_sanityCheck");
  }

  return v16;
}

- (void)enumerateGapsWithBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  FCFDBFeed *v30;
  void (**v31)(id, void *, _BYTE *);
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  v36 = 0;
  -[FCFDBFeed fetchedRanges](self, "fetchedRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  +[FCFeedCursor cursorForTopOfFeed](FCFeedCursor, "cursorForTopOfFeed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[FCFDBFeed fetchedRanges](self, "fetchedRanges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "top");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", objc_msgSend(v10, "order"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v12, &v36);

    if (v36)
      goto LABEL_19;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[FCFDBFeed fetchedRanges](self, "fetchedRanges");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v14)
    {
      v15 = v14;
      v30 = self;
      v31 = v4;
      v16 = 0;
      v17 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          v7 = v16;
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (v7)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "top");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "order");
            objc_msgSend(v7, "bottom");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "order");

            if (v21 != v23)
            {
              objc_msgSend(v7, "bottom");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "top");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v24, v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v31[2](v31, v26, &v36);

              if (v36)
              {
                v4 = v31;
                goto LABEL_18;
              }
            }
          }
          v16 = v19;

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v15)
          continue;
        break;
      }

      self = v30;
      v4 = v31;
    }

    -[FCFDBFeed fetchedRanges](self, "fetchedRanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottom");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedCursor cursorForBottomOfFeed](FCFeedCursor, "cursorForBottomOfFeed");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v29, &v36);

  }
  else
  {
    +[FCFeedCursor cursorForBottomOfFeed](FCFeedCursor, "cursorForBottomOfFeed");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v7, v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v27, &v36);
  }

LABEL_18:
LABEL_19:

}

- (BOOL)hasFetchedRangesInRange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[FCFDBFeed fetchedRanges](self, "fetchedRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__FCFDBFeed_hasFetchedRangesInRange___block_invoke;
  v8[3] = &unk_1E464AF98;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

- (NSArray)fetchedRanges
{
  return self->_fetchedRanges;
}

- (FCFDBFeed)initWithFeedID:(id)a3 feedLookupID:(int64_t)a4
{
  return -[FCFDBFeed initWithFeedID:feedLookupID:refreshedFromOrder:refreshedToOrder:fetchedRanges:](self, "initWithFeedID:feedLookupID:refreshedFromOrder:refreshedToOrder:fetchedRanges:", a3, a4, 0, 0, MEMORY[0x1E0C9AA60]);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    -[FCFDBFeed feedID](self, "feedID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "feedID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8)
      && (v9 = -[FCFDBFeed feedLookupID](self, "feedLookupID"), v9 == objc_msgSend(v6, "feedLookupID"))
      && (v10 = -[FCFDBFeed refreshedFromOrder](self, "refreshedFromOrder"),
          v10 == objc_msgSend(v6, "refreshedFromOrder"))
      && (v11 = -[FCFDBFeed refreshedToOrder](self, "refreshedToOrder"), v11 == objc_msgSend(v6, "refreshedToOrder")))
    {
      -[FCFDBFeed fetchedRanges](self, "fetchedRanges");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fetchedRanges");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToArray:", v13);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSData)fetchedRangesData
{
  void *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[FCFDBFeed fetchedRanges](self, "fetchedRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = malloc_type_calloc(2 * objc_msgSend(v3, "count"), 8uLL, 0x100004000313F17uLL);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[FCFDBFeed fetchedRanges](self, "fetchedRanges", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = v4;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "top");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *v9 = objc_msgSend(v12, "order");

        objc_msgSend(v11, "bottom");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v9 + 2;
        v9[1] = objc_msgSend(v13, "order");

        v9 += 2;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v9 = v14;
    }
    while (v7);
  }

  v15 = (void *)MEMORY[0x1E0C99D50];
  -[FCFDBFeed fetchedRanges](self, "fetchedRanges");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataWithBytesNoCopy:length:freeWhenDone:", v4, 16 * objc_msgSend(v16, "count"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v17;
}

- (FCFeedRange)refreshRegion
{
  void *v3;

  v3 = -[FCFDBFeed refreshedFromOrder](self, "refreshedFromOrder");
  if (v3)
  {
    +[FCFeedRange feedRangeWithMaxOrder:minOrder:](FCFeedRange, "feedRangeWithMaxOrder:minOrder:", -[FCFDBFeed refreshedFromOrder](self, "refreshedFromOrder"), -[FCFDBFeed refreshedToOrder](self, "refreshedToOrder"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (FCFeedRange *)v3;
}

- (FCFeedRange)trailingEmptyRegion
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[FCFDBFeed fetchedRanges](self, "fetchedRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[FCFDBFeed fetchedRanges](self, "fetchedRanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottom");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedCursor cursorForBottomOfFeed](FCFeedCursor, "cursorForBottomOfFeed");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[FCFeedCursor cursorForTopOfFeed](FCFeedCursor, "cursorForTopOfFeed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedCursor cursorForBottomOfFeed](FCFeedCursor, "cursorForBottomOfFeed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (FCFeedRange *)v9;
}

- (id)copyWithRefreshedFromOrder:(unint64_t)a3 refreshedToOrder:(unint64_t)a4 newlyFetchedRange:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  FCFDBFeed *v35;
  void *v36;
  FCFDBFeed *v37;
  FCFDBFeed *v39;
  unint64_t v40;
  id v41;
  unint64_t v42;
  id obj;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
  {
    v42 = a4;
    v44 = (void *)v9;
    v11 = v8;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[FCFDBFeed fetchedRanges](self, "fetchedRanges");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v13)
    {
      v14 = v13;
      obj = v12;
      v39 = self;
      v40 = a3;
      v41 = v8;
      v15 = *(_QWORD *)v46;
      v16 = v11;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v46 != v15)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v18, "bottom", v39, v40, v41);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "order");
          objc_msgSend(v11, "top");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "order");

          if (v20 <= v22)
          {
            objc_msgSend(v18, "top");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "order");
            objc_msgSend(v11, "bottom");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "order");

            if (v24 >= v26)
            {
              objc_msgSend(v16, "feedRangeByUnioningWithRange:", v18);
              v27 = objc_claimAutoreleasedReturnValue();

              v16 = (void *)v27;
            }
            else
            {
              if (v16)
              {
                objc_msgSend(v44, "addObject:", v16);

              }
              objc_msgSend(v44, "addObject:", v18);
              v16 = 0;
            }
          }
          else
          {
            objc_msgSend(v44, "addObject:", v18);
          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v14);

      a3 = v40;
      v8 = v41;
      self = v39;
      if (!v16)
      {
        v28 = v44;
LABEL_21:
        a4 = v42;
        goto LABEL_22;
      }
    }
    else
    {

      v16 = v11;
    }
    v28 = v44;
    objc_msgSend(v44, "addObject:", v16);

    goto LABEL_21;
  }
  -[FCFDBFeed fetchedRanges](self, "fetchedRanges");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v29, "mutableCopy");

LABEL_22:
  if (objc_msgSend(v28, "count"))
  {
    objc_msgSend(v28, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "top");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "order");

    if (v32 > a4)
    {
      objc_msgSend(v28, "firstObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "top");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = objc_msgSend(v34, "order");

    }
  }
  v35 = [FCFDBFeed alloc];
  -[FCFDBFeed feedID](self, "feedID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[FCFDBFeed initWithFeedID:feedLookupID:refreshedFromOrder:refreshedToOrder:fetchedRanges:](v35, "initWithFeedID:feedLookupID:refreshedFromOrder:refreshedToOrder:fetchedRanges:", v36, -[FCFDBFeed feedLookupID](self, "feedLookupID"), a3, a4, v28);

  return v37;
}

- (id)copyWithoutFetchedRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  FCFDBFeed *v28;
  void *v29;
  FCFDBFeed *v30;
  FCFDBFeed *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v32 = self;
  -[FCFDBFeed fetchedRanges](self, "fetchedRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    v33 = v6;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsFeedRange:", v11) & 1) == 0)
        {
          if (objc_msgSend(v4, "intersectsRange:", v11))
          {
            v12 = v5;
            objc_msgSend(v11, "top");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "order");
            objc_msgSend(v4, "top");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "order");

            if (v14 <= v16)
            {
              objc_msgSend(v4, "bottom");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "top");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v20, v21);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(v11, "top");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "top");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              +[FCFeedRange feedRangeWithTop:bottom:](FCFeedRange, "feedRangeWithTop:bottom:", v17, v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v5 = v12;
            objc_msgSend(v12, "addObject:", v19);

            v6 = v33;
          }
          else
          {
            objc_msgSend(v5, "addObject:", v11);
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v8);
  }

  v22 = -[FCFDBFeed refreshedFromOrder](v32, "refreshedFromOrder");
  objc_msgSend(v4, "top");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "order");

  if (v22 <= v24)
    v22 = v24;
  v25 = -[FCFDBFeed refreshedToOrder](v32, "refreshedToOrder");
  objc_msgSend(v4, "top");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "order");

  if (v25 <= v27)
    v25 = v27;
  v28 = [FCFDBFeed alloc];
  -[FCFDBFeed feedID](v32, "feedID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[FCFDBFeed initWithFeedID:feedLookupID:refreshedFromOrder:refreshedToOrder:fetchedRanges:](v28, "initWithFeedID:feedLookupID:refreshedFromOrder:refreshedToOrder:fetchedRanges:", v29, -[FCFDBFeed feedLookupID](v32, "feedLookupID"), v22, v25, v5);

  return v30;
}

- (id)fetchedRangePrecedingOrder:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[FCFDBFeed fetchedRanges](self, "fetchedRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__FCFDBFeed_fetchedRangePrecedingOrder___block_invoke;
  v7[3] = &__block_descriptor_40_e21_B16__0__FCFeedRange_8l;
  v7[4] = a3;
  objc_msgSend(v4, "fc_lastObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __40__FCFDBFeed_fetchedRangePrecedingOrder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "top");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "order") > *(_QWORD *)(a1 + 32);

  return v4;
}

- (id)fetchedRangeFollowingOrder:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[FCFDBFeed fetchedRanges](self, "fetchedRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__FCFDBFeed_fetchedRangeFollowingOrder___block_invoke;
  v7[3] = &__block_descriptor_40_e21_B16__0__FCFeedRange_8l;
  v7[4] = a3;
  objc_msgSend(v4, "fc_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __40__FCFDBFeed_fetchedRangeFollowingOrder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "bottom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "order") < *(_QWORD *)(a1 + 32);

  return v4;
}

- (id)contiguousFetchedRangeInRange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__82;
  v15 = __Block_byref_object_dispose__82;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__FCFDBFeed_contiguousFetchedRangeInRange___block_invoke;
  v10[3] = &unk_1E464AF70;
  v10[4] = &v11;
  -[FCFDBFeed _visitContiguousRangesInRange:withBlock:](self, "_visitContiguousRangesInRange:withBlock:", v4, v10);
  if (-[FCFDBFeed refreshedFromOrder](self, "refreshedFromOrder"))
  {
    +[FCFeedRange feedRangeWithMaxOrder:minOrder:](FCFeedRange, "feedRangeWithMaxOrder:minOrder:", -[FCFDBFeed refreshedFromOrder](self, "refreshedFromOrder"), -[FCFDBFeed refreshedToOrder](self, "refreshedToOrder"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "intersectsOrAdjoinsRange:", v4))
    {
      +[FCFeedRange feedRangeByMergingRange:withRange:](FCFeedRange, "feedRangeByMergingRange:withRange:", v12[5], v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v12[5];
      v12[5] = v6;

    }
  }
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __43__FCFDBFeed_contiguousFetchedRangeInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[FCFeedRange feedRangeByMergingRange:withRange:](FCFeedRange, "feedRangeByMergingRange:withRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __37__FCFDBFeed_hasFetchedRangesInRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v9, "intersectsRange:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v9, "top");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "order");
    objc_msgSend(*(id *)(a1 + 32), "bottom");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = v7 > objc_msgSend(v8, "order");

  }
}

- (void)_visitContiguousRangesInRange:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t (**v10)(void *, _QWORD);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD aBlock[4];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__82;
  v23[4] = __Block_byref_object_dispose__82;
  v24 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__FCFDBFeed__visitContiguousRangesInRange_withBlock___block_invoke;
  aBlock[3] = &unk_1E464AFC0;
  v22 = v23;
  v8 = v6;
  v20 = v8;
  v9 = v7;
  v21 = v9;
  v10 = (uint64_t (**)(void *, _QWORD))_Block_copy(aBlock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FCFDBFeed fetchedRanges](self, "fetchedRanges", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v13)
        objc_enumerationMutation(v11);
      if ((v10[2](v10, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14)) & 1) == 0)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

  _Block_object_dispose(v23, 8);
}

uint64_t __53__FCFDBFeed__visitContiguousRangesInRange_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (objc_msgSend(v3, "intersectsOrAdjoinsRange:"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      +[FCFeedRange feedRangeByMergingRange:withRange:](FCFeedRange, "feedRangeByMergingRange:withRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;
LABEL_7:

      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(v3, "bottom");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "order");
  objc_msgSend(*(id *)(a1 + 32), "top");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "order");

  if (v9 < v11)
  {
    if (objc_msgSend(v4, "intersectsRange:", *(_QWORD *)(a1 + 32)))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = v4;
      v7 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v13;
      goto LABEL_7;
    }
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
LABEL_8:
  v14 = 1;
LABEL_10:

  return v14;
}

- (unint64_t)refreshedFromOrder
{
  return self->_refreshedFromOrder;
}

- (unint64_t)refreshedToOrder
{
  return self->_refreshedToOrder;
}

- (int64_t)feedLookupID
{
  return self->_feedLookupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedRanges, 0);
  objc_storeStrong((id *)&self->_feedID, 0);
}

@end
