@implementation EKUIAvailabilityParticipantList

- (EKUIAvailabilityParticipantList)initWithParticipants:(id)a3 viewController:(id)a4
{
  id v6;
  id v7;
  EKUIAvailabilityParticipantList *v8;
  uint64_t v9;
  NSMutableArray *containers;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  EKUIParticipantContainer *v17;
  EKUIParticipantContainer *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)EKUIAvailabilityParticipantList;
  v8 = -[EKUIAvailabilityParticipantList init](&v24, sel_init);
  if (v8)
  {
    v9 = objc_opt_new();
    containers = v8->_containers;
    v8->_containers = (NSMutableArray *)v9;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
          v17 = [EKUIParticipantContainer alloc];
          v18 = -[EKUIParticipantContainer initWithParticipant:viewController:](v17, "initWithParticipant:viewController:", v16, v7, (_QWORD)v20);
          -[NSMutableArray addObject:](v8->_containers, "addObject:", v18);
          -[EKUIAvailabilityParticipantList addSubview:](v8, "addSubview:", v18);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v13);
    }

  }
  return v8;
}

- (void)setBusyParticipants:(id)a3
{
  uint64_t i;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSMutableArray *obj;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_containers;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v19)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v6 = v18;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v7)
        {
          v20 = i;
          v8 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v22 != v8)
                objc_enumerationMutation(v6);
              v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v5, "participant");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "UUID");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "participant");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "UUID");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v12, "isEqualToString:", v14);

              if ((v15 & 1) != 0)
              {
                v7 = 1;
                goto LABEL_16;
              }
            }
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v7)
              continue;
            break;
          }
LABEL_16:
          i = v20;
        }

        objc_msgSend(v5, "setBusy:", v7);
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v19);
  }

}

- (void)layoutSubviews
{
  NSMutableArray *containers;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKUIAvailabilityParticipantList;
  -[EKUIAvailabilityParticipantList layoutSubviews](&v5, sel_layoutSubviews);
  containers = self->_containers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__EKUIAvailabilityParticipantList_layoutSubviews__block_invoke;
  v4[3] = &unk_1E601A9E0;
  v4[4] = self;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](containers, "enumerateObjectsWithOptions:usingBlock:", 0, v4);
}

void __49__EKUIAvailabilityParticipantList_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double *v3;
  double v4;
  id v5;

  v3 = *(double **)(a1 + 32);
  v4 = v3[260] * (double)a3;
  v5 = a2;
  objc_msgSend(v3, "frame");
  objc_msgSend(v5, "setFrame:", 0.0, v4);

}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
  -[EKUIAvailabilityParticipantList layoutSubviews](self, "layoutSubviews");
}

- (void)setVerticalScrollOffset:(double)a3
{
  self->_scrollOffset = a3;
  -[EKUIAvailabilityParticipantList setContentOffset:](self, "setContentOffset:", 0.0, a3);
}

+ (double)listWidthForCompact:(BOOL)a3 orientation:(int64_t)a4
{
  double result;

  result = 168.0;
  if ((unint64_t)(a4 - 3) < 2)
    result = 336.0;
  if (!a3)
    return 240.0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containers, 0);
}

@end
