@implementation EKDayOccurrenceViewIterator

- (EKDayOccurrenceViewIterator)initWithOccurrenceViews:(id)a3 selectedEvent:(id)a4
{
  id v6;
  id v7;
  EKDayOccurrenceViewIterator *v8;
  EKDayOccurrenceViewIterator *v9;
  _QWORD v11[4];
  EKDayOccurrenceViewIterator *v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EKDayOccurrenceViewIterator;
  v8 = -[EKDayOccurrenceViewIterator init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__EKDayOccurrenceViewIterator_initWithOccurrenceViews_selectedEvent___block_invoke;
    v11[3] = &unk_1E6019F40;
    v12 = v8;
    -[EKDayOccurrenceViewIterator _prepareOccurrenceViewsForIteration:selectedEvent:result:](v12, "_prepareOccurrenceViewsForIteration:selectedEvent:result:", v6, v7, v11);

  }
  return v9;
}

uint64_t __69__EKDayOccurrenceViewIterator_initWithOccurrenceViews_selectedEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(*(id *)(a1 + 32), "setOccurrenceViews:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentIndex:", a3);
  return objc_msgSend(*(id *)(a1 + 32), "setFirstTimedOccurrenceIndex:", a4);
}

- (id)next
{
  -[EKDayOccurrenceViewIterator setCurrentIndex:](self, "setCurrentIndex:", -[EKDayOccurrenceViewIterator _nextIndexFromCurrentIndex:forward:](self, "_nextIndexFromCurrentIndex:forward:", -[EKDayOccurrenceViewIterator currentIndex](self, "currentIndex"), 1));
  return -[EKDayOccurrenceViewIterator _occurrenceViewAtIndex:](self, "_occurrenceViewAtIndex:", -[EKDayOccurrenceViewIterator currentIndex](self, "currentIndex"));
}

- (id)previous
{
  -[EKDayOccurrenceViewIterator setCurrentIndex:](self, "setCurrentIndex:", -[EKDayOccurrenceViewIterator _nextIndexFromCurrentIndex:forward:](self, "_nextIndexFromCurrentIndex:forward:", -[EKDayOccurrenceViewIterator currentIndex](self, "currentIndex"), 0));
  return -[EKDayOccurrenceViewIterator _occurrenceViewAtIndex:](self, "_occurrenceViewAtIndex:", -[EKDayOccurrenceViewIterator currentIndex](self, "currentIndex"));
}

- (id)_occurrenceViewAtIndex:(int64_t)a3
{
  void *v3;
  void *v5;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    -[EKDayOccurrenceViewIterator occurrenceViews](self, "occurrenceViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (int64_t)_nextIndexFromCurrentIndex:(int64_t)a3 forward:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  int64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v4 = a4;
  -[EKDayOccurrenceViewIterator occurrenceViews](self, "occurrenceViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      return -[EKDayOccurrenceViewIterator firstTimedOccurrenceIndex](self, "firstTimedOccurrenceIndex");
    v10 = 0;
    v12 = 1;
    goto LABEL_9;
  }
  -[EKDayOccurrenceViewIterator occurrenceViews](self, "occurrenceViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v11, "count") - 1;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = -1;
LABEL_9:
    v13 = v12 + a3;
    if (v13 >= 0)
    {
      -[EKDayOccurrenceViewIterator occurrenceViews](self, "occurrenceViews");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 < objc_msgSend(v14, "count"))
        v10 = v13;

    }
  }
  return v10;
}

- (void)_prepareOccurrenceViewsForIteration:(id)a3 selectedEvent:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__EKDayOccurrenceViewIterator__prepareOccurrenceViewsForIteration_selectedEvent_result___block_invoke;
  v12[3] = &unk_1E6019F68;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[EKDayOccurrenceViewIterator _separateOccurrenceViews:result:](self, "_separateOccurrenceViews:result:", a3, v12);

}

void __88__EKDayOccurrenceViewIterator__prepareOccurrenceViewsForIteration_selectedEvent_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "sortedArrayUsingSelector:", sel_compareOccurrenceViewForTabOrdering_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compareOccurrenceViewForTabOrdering_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 32), "_selectedCopyOccurrenceViewIndexInOccurrenceViews:selectedIndex:", v8, objc_msgSend(*(id *)(a1 + 32), "_selectedOccurrenceViewIndexInOccurrenceViews:selectedEvent:", v8, *(_QWORD *)(a1 + 40)));
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByExcludingObjectsInArray:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  objc_msgSend(*(id *)(a1 + 32), "_firstTimedOccurrenceViewIndexInOccurrenceViews:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_separateOccurrenceViews:(id)a3 result:(id)a4
{
  id v5;
  void (**v6)(id, void *, void *);
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, void *))a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v14, "isAllDay", (_QWORD)v18))
          v15 = v7;
        else
          v15 = v8;
        objc_msgSend(v15, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16 = (void *)objc_msgSend(v7, "copy");
  v17 = (void *)objc_msgSend(v8, "copy");
  v6[2](v6, v16, v17);

}

- (int64_t)_selectedOccurrenceViewIndexInOccurrenceViews:(id)a3 selectedEvent:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __91__EKDayOccurrenceViewIterator__selectedOccurrenceViewIndexInOccurrenceViews_selectedEvent___block_invoke;
    v9[3] = &unk_1E6019F90;
    v10 = v5;
    v7 = objc_msgSend(a3, "indexOfObjectPassingTest:", v9);

  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

uint64_t __91__EKDayOccurrenceViewIterator__selectedOccurrenceViewIndexInOccurrenceViews_selectedEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "occurrence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (int64_t)_selectedCopyOccurrenceViewIndexInOccurrenceViews:(id)a3 selectedIndex:(int64_t)a4
{
  id v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  void *v9;

  v5 = a3;
  v6 = v5;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL && a4 >= -1)
  {
    v8 = a4 + 1;
    if (v8 < objc_msgSend(v5, "count"))
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isSelectedCopyView"))
        v7 = v8;

    }
  }

  return v7;
}

- (int64_t)_firstTimedOccurrenceViewIndexInOccurrenceViews:(id)a3
{
  return objc_msgSend(a3, "indexOfObjectPassingTest:", &__block_literal_global_19);
}

uint64_t __79__EKDayOccurrenceViewIterator__firstTimedOccurrenceViewIndexInOccurrenceViews___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAllDay") ^ 1;
}

- (int64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(int64_t)a3
{
  self->_currentIndex = a3;
}

- (int64_t)firstTimedOccurrenceIndex
{
  return self->_firstTimedOccurrenceIndex;
}

- (void)setFirstTimedOccurrenceIndex:(int64_t)a3
{
  self->_firstTimedOccurrenceIndex = a3;
}

- (NSArray)occurrenceViews
{
  return self->_occurrenceViews;
}

- (void)setOccurrenceViews:(id)a3
{
  objc_storeStrong((id *)&self->_occurrenceViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrenceViews, 0);
}

@end
