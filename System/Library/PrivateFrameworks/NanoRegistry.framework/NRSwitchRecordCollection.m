@implementation NRSwitchRecordCollection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)addSwitchRecordWithHistoryEntry:(uint64_t)a1
{
  id v3;
  int v4;
  id v5;
  _DWORD *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NRSwitchRecord *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v3 = a2;
  if (a1)
  {
    v19 = v3;
    v4 = objc_msgSend(v3, "switchIndex");
    v5 = *(id *)(a1 + 8);
    objc_msgSend(v5, "lastObject");
    v6 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    v7 = v6 ? v6[6] : 0;

    v3 = v19;
    if (v4 != v7)
    {
      v8 = v19;
      objc_opt_self();
      objc_msgSend(v8, "state");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activeDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "state");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "activeDeviceID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lastActiveDate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        v15 = -[NRSwitchRecord initWithDeviceID:date:switchIndex:]([NRSwitchRecord alloc], "initWithDeviceID:date:switchIndex:", v12, v14, objc_msgSend(v8, "switchIndex"));
      else
        v15 = 0;

      if (v15)
      {
        v16 = *(void **)(a1 + 8);
        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v17;

          v16 = *(void **)(a1 + 8);
        }
        objc_msgSend(v16, "addObject:", v15);
      }

      v3 = v19;
    }
  }

}

uint64_t __55__NRSwitchRecordCollection_deviceIDAtSwitchIndex_date___block_invoke(uint64_t a1, void *a2, void *a3)
{
  _DWORD *v4;
  _DWORD *v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    v6 = v4[6];
    if (v5)
    {
LABEL_3:
      v7 = v5[6];
      goto LABEL_4;
    }
  }
  else
  {
    v6 = 0;
    if (v5)
      goto LABEL_3;
  }
  v7 = 0;
LABEL_4:
  if (v6 > v7)
  {
    v8 = 1;
    goto LABEL_12;
  }
  if (v4)
  {
    v9 = v4[6];
    if (v5)
    {
LABEL_8:
      v10 = v5[6];
      goto LABEL_9;
    }
  }
  else
  {
    v9 = 0;
    if (v5)
      goto LABEL_8;
  }
  v10 = 0;
LABEL_9:
  if (v9 >= v10)
    v8 = 0;
  else
    v8 = -1;
LABEL_12:

  return v8;
}

- (void)truncateSwitchRecords
{
  NSMutableArray *records;
  NSMutableArray *v4;
  unint64_t v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  uint64_t v8;
  NSMutableArray *v9;
  void *v10;
  NSMutableArray *v11;

  if (self)
    records = self->super._records;
  else
    records = 0;
  v4 = records;
  v5 = -[NSMutableArray count](v4, "count");

  if (v5 >= 0x1F)
  {
    if (self)
      v6 = self->super._records;
    else
      v6 = 0;
    v7 = v6;
    v8 = -[NSMutableArray count](v7, "count") - 30;

    if (self)
      v9 = self->super._records;
    else
      v9 = 0;
    v11 = v9;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectsAtIndexes:](v11, "removeObjectsAtIndexes:", v10);

  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[NRSwitchRecordCollection truncateSwitchRecords](self, "truncateSwitchRecords");
  v5.receiver = self;
  v5.super_class = (Class)NRSwitchRecordCollection;
  -[NRSwitchRecordCollection encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);

}

@end
