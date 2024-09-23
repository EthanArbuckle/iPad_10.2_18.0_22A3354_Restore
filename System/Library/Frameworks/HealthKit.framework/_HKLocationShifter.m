@implementation _HKLocationShifter

- (_HKLocationShifter)init
{
  _HKLocationShifter *v2;
  _HKLocationShifter *v3;
  uint64_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HKLocationShifter;
  v2 = -[_HKLocationShifter init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    HKCreateSerialDispatchQueue(v2, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

+ (BOOL)isShiftRequiredForLocations:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  v5 = v4;
  if (v4)
  {
    v6 = *(_QWORD *)v15;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x19AEC7968](v4);
        objc_msgSend(v8, "coordinate", (_QWORD)v14);
        v11 = v10;
        objc_msgSend(v8, "coordinate");
        LOBYTE(v8) = objc_msgSend(getGEOLocationShifterClass(), "isLocationShiftRequiredForCoordinate:", v11, v12);
        objc_autoreleasePoolPop(v9);
        if ((v8 & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)shiftLocations:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  NSObject *v19;
  NSObject *queue;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  NSObject *v31;
  unint64_t v32;
  _QWORD v33[4];
  id v34;
  id v35;
  NSObject *v36;
  unint64_t v37;

  v6 = a3;
  v24 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init((Class)getGEOLocationShifterClass());
  v9 = dispatch_group_create();
  v10 = objc_msgSend(v6, "count");
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    v12 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "coordinate");
      v15 = v14;
      objc_msgSend(v13, "coordinate");
      v17 = v16;
      if (objc_msgSend(getGEOLocationShifterClass(), "isLocationShiftRequiredForCoordinate:", v15, v16))
      {
        dispatch_group_enter(v9);
        v33[0] = v11;
        v33[1] = 3221225472;
        v33[2] = __52___HKLocationShifter_shiftLocations_withCompletion___block_invoke;
        v33[3] = &unk_1E37F5558;
        v34 = v13;
        v18 = v7;
        v35 = v18;
        v37 = v12;
        v19 = v9;
        v36 = v19;
        v29[0] = v11;
        v29[1] = 3221225472;
        v29[2] = __52___HKLocationShifter_shiftLocations_withCompletion___block_invoke_2;
        v29[3] = &unk_1E37F5580;
        v32 = v12;
        v30 = v18;
        v31 = v19;
        objc_msgSend(v8, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v33, 0, v29, self->_queue, v15, v17, 0.0);

      }
      ++v12;
    }
    while (v12 < objc_msgSend(v6, "count"));
  }
  queue = self->_queue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __52___HKLocationShifter_shiftLocations_withCompletion___block_invoke_11;
  block[3] = &unk_1E37E67E8;
  v26 = v7;
  v27 = v6;
  v28 = v24;
  v21 = v24;
  v22 = v6;
  v23 = v7;
  dispatch_group_notify(v9, queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
