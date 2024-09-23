@implementation _CPLEngineScopeDatesStack

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedKey, 0);
  objc_storeStrong((id *)&self->_intermediateStatuses, 0);
  objc_storeStrong((id *)&self->_lastDate, 0);
  objc_storeStrong((id *)&self->_earliestDate, 0);
  objc_storeStrong((id *)&self->_now, 0);
}

- (void)prependDate:(void *)a3 forKey:
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a2;
  v6 = a3;
  if (a1 && v18)
  {
    if (*(_QWORD *)(a1 + 16))
    {
      _displayableKey(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 16), "timeIntervalSinceDate:", v18);
      v9 = v8;
      if (v8 > 1.0)
      {
        objc_storeStrong((id *)(a1 + 16), a2);
        v10 = *(void **)(a1 + 32);
        v11 = objc_alloc(MEMORY[0x1E0CB3940]);
        +[CPLDateFormatter stringForTimeInterval:](CPLDateFormatter, "stringForTimeInterval:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@ ... %@ ..."), v7, v12);
        objc_msgSend(v10, "insertObject:atIndex:", v13, 0);

LABEL_9:
        goto LABEL_10;
      }
      if (v8 >= 0.0)
      {
        v17 = *(void **)(a1 + 32);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ ..."), v7);
        objc_msgSend(v17, "insertObject:atIndex:", v12, 0);
        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v14;

      objc_storeStrong((id *)(a1 + 16), a2);
      objc_storeStrong((id *)(a1 + 24), a2);
      objc_storeStrong((id *)(a1 + 40), a3);
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
      v7 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v16;
    }
LABEL_10:

  }
}

@end
