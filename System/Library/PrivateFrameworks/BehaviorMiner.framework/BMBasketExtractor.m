@implementation BMBasketExtractor

- (BMBasketExtractor)initWithSamplingInterval:(double)a3
{
  BMBasketExtractor *v3;
  BMBasketExtractor *v5;
  objc_super v7;

  if (a3 >= 0.0)
  {
    v7.receiver = self;
    v7.super_class = (Class)BMBasketExtractor;
    v5 = -[BMBasketExtractor init](&v7, sel_init);
    if (v5)
    {
      v5->_samplingInterval = a3;
      v5->_shouldStop = 0;
    }
    self = v5;
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)terminateEarly
{
  -[BMBasketExtractor setShouldStop:](self, "setShouldStop:", 1);
}

- (id)slotForHourOfDay:(id)a3
{
  return -[BMBasketExtractor slotForHourOfDay:slotDuration:](self, "slotForHourOfDay:slotDuration:", a3, &unk_24D223660);
}

- (id)slotForHourOfDay:(id)a3 slotDuration:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a4;
  v6 = objc_msgSend(a3, "integerValue");
  v7 = objc_msgSend(v5, "integerValue");

  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6 / v7);
}

- (id)extractTemporalItemsFromDate:(id)a3
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)extractBasketsFromEvents:(id)a3 withTemporalFeatures:(BOOL)a4
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)extractBasketsFromEvents:(id)a3 itemTypes:(id)a4
{
  void *v4;
  void *v5;

  -[BMBasketExtractor extractDatedBasketsFromEvents:itemTypes:](self, "extractDatedBasketsFromEvents:itemTypes:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("basket"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)extractDatedBasketsFromEvents:(id)a3 itemTypes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BMBasketExtractor *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  BMBasketExtractor *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  char v62;
  uint64_t v63;
  void *v64;
  BMDatedBasket *v65;
  id v66;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  BMBasketExtractor *v74;
  void *v75;
  uint64_t v76;
  char v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _QWORD v84[3];

  v84[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "count"))
  {
    v66 = (id)MEMORY[0x24BDBD1A8];
    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v69;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v6;
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = self;
  v13 = self;
  v14 = v10;
  -[BMBasketExtractor samplingInterval](v13, "samplingInterval");
  objc_msgSend(v12, "dateByAddingTimeInterval:");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v72 = v7;
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0x24BDBC000uLL;
  v71 = v8;
  v68 = v10;
  while (1)
  {
    objc_msgSend(*(id *)(v15 + 3824), "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v12;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v18 = v14;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
    if (v19)
      break;
    v77 = 0;
    v12 = v17;
LABEL_30:

    if (objc_msgSend(v16, "count"))
    {
      BMTemporalItemsForDate(v17, v73, v7);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v64, "count"))
        objc_msgSend(v16, "unionSet:", v64);
      v65 = -[BMDatedBasket initWithBasket:Date:]([BMDatedBasket alloc], "initWithBasket:Date:", v16, v17);
      objc_msgSend(v8, "addObject:", v65);

    }
    v15 = 0x24BDBC000;
    if ((v77 & 1) != 0)
    {
      v66 = v8;
      v17 = v12;
      goto LABEL_37;
    }
  }
  v20 = v19;
  v77 = 0;
  v75 = v16;
  v76 = *(_QWORD *)v80;
  v21 = v74;
LABEL_5:
  v22 = 0;
  while (1)
  {
    if (*(_QWORD *)v80 != v76)
      objc_enumerationMutation(v18);
    v23 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v22);
    if (-[BMBasketExtractor shouldStop](v21, "shouldStop"))
      break;
    objc_msgSend(v23, "startDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "timeIntervalSince1970");
    v26 = v25;
    objc_msgSend(v17, "timeIntervalSince1970");
    if (v26 >= v27)
    {
      objc_msgSend(v23, "startDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "timeIntervalSince1970");
      v30 = v29;
      objc_msgSend(v78, "timeIntervalSince1970");
      v32 = v31;

      v16 = v75;
      if (v30 < v32)
        goto LABEL_22;
    }
    else
    {

    }
    objc_msgSend(v23, "endDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "timeIntervalSince1970");
    v35 = v34;
    objc_msgSend(v17, "timeIntervalSince1970");
    if (v35 <= v36)
      goto LABEL_15;
    objc_msgSend(v23, "endDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "timeIntervalSince1970");
    v39 = v38;
    objc_msgSend(v78, "timeIntervalSince1970");
    if (v39 > v40)
    {

      v16 = v75;
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v23, "startDate");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "endDate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqualToDate:", v56);

    v21 = v74;
    v16 = v75;
    if ((v57 & 1) == 0)
    {
LABEL_22:
      objc_msgSend(v23, "item");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v58);

      goto LABEL_23;
    }
LABEL_16:
    objc_msgSend(v23, "startDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "timeIntervalSince1970");
    v43 = v42;
    objc_msgSend(v17, "timeIntervalSince1970");
    if (v43 <= v44)
    {
      objc_msgSend(v23, "endDate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "timeIntervalSince1970");
      v47 = v46;
      objc_msgSend(v78, "timeIntervalSince1970");
      v49 = v48;

      if (v47 >= v49)
        goto LABEL_22;
    }
    else
    {

    }
    objc_msgSend(v23, "startDate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "timeIntervalSince1970");
    v52 = v51;
    objc_msgSend(v78, "timeIntervalSince1970");
    v54 = v53;

    if (v52 >= v54)
    {
      objc_msgSend(v23, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[BMBasketExtractor samplingInterval](v21, "samplingInterval");
      objc_msgSend(v12, "dateByAddingTimeInterval:");
      v63 = objc_claimAutoreleasedReturnValue();

      v78 = (void *)v63;
LABEL_29:
      v8 = v71;
      v7 = v72;
      v14 = v68;
      goto LABEL_30;
    }
LABEL_23:
    objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v18, "count") - 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v23, "isEqual:", v59);

    if (v60)
    {
      objc_msgSend(v23, "item");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v16, "containsObject:", v61);

      v77 |= v62;
    }
    if (v20 == ++v22)
    {
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
      if (v20)
        goto LABEL_5;
      v12 = v17;
      goto LABEL_29;
    }
  }

  v66 = (id)MEMORY[0x24BDBD1A8];
  v8 = v71;
  v7 = v72;
LABEL_37:

  v6 = v70;
LABEL_39:

  return v66;
}

- (double)samplingInterval
{
  return self->_samplingInterval;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

@end
