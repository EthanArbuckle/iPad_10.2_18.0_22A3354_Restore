@implementation ULHomeSlamAnalyticEventAnalyzer

- (ULHomeSlamAnalyticEventAnalyzer)initWithDB:(ULDatabase *)a3
{
  ULHomeSlamAnalyticEventAnalyzer *v4;
  ULHomeSlamAnalyticEventAnalyzer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ULHomeSlamAnalyticEventAnalyzer;
  v4 = -[ULHomeSlamAnalyticEventAnalyzer init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ULHomeSlamAnalyticEventAnalyzer setDb:](v4, "setDb:", a3);
  return v5;
}

- (id)runStopDetectionAnalysisAtTimepoint:(void *)a1
{
  id v4;
  void *v5;
  ULHomeSlamStopDetection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *__p;
  void *v13;
  uint64_t v14;

  v4 = *(id *)(objc_msgSend(a1, "db") + 128);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "fetchAnalyticEventsASCFromTime:toTime:", a2 + -86400.0, a2);
  }
  else
  {
    __p = 0;
    v13 = 0;
    v14 = 0;
  }
  objc_msgSend(a1, "setEvents:", &__p);
  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }

  v6 = -[ULHomeSlamStopDetection initWithDB:]([ULHomeSlamStopDetection alloc], "initWithDB:", objc_msgSend(a1, "db"));
  -[ULHomeSlamStopDetection runStopDetectionAnalysisFromTime:toTime:](v6, "runStopDetectionAnalysisFromTime:toTime:", a2 + -86400.0, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_timepointToDate:", a2 + -86400.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_timepointToDate:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_analyzeTriggersAndGetCA:fromDate:untilDate:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (uint64_t)_timepointToDate:(double)a1
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)(uint64_t)a1);
}

- (id)_analyzeTriggersAndGetCA:(id)a3 fromDate:(id)a4 untilDate:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  _BOOL4 v19;
  unsigned int v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  id obj;
  void *v46;
  ULHomeSlamAnalyticEventAnalyzer *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[10];
  _QWORD v53[10];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v41 = a4;
  v42 = a5;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  v47 = self;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  if (v9)
  {
    v13 = 0;
    v46 = 0;
    v43 = 0;
    v14 = *(_QWORD *)v49;
    LODWORD(v15) = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (objc_msgSend(v17, "trigger") != 0 || (v13 & 1) == 0)
        {
          objc_msgSend(v17, "date");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[ULHomeSlamAnalyticEventAnalyzer _wasLastScreenStateOnBefore:](v47, "_wasLastScreenStateOnBefore:", v21);

          if (v22)
          {
            v13 = 0;
            ++v43;
            ++v10;
            v12 += (v15 & 1) == 0;
            LODWORD(v15) = 0;
          }
          else
          {
            objc_msgSend(v17, "date");
            v23 = objc_claimAutoreleasedReturnValue();

            v13 = 1;
            v46 = (void *)v23;
          }
        }
        else
        {
          objc_msgSend(v17, "date");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[ULHomeSlamAnalyticEventAnalyzer _checkIfScreenTransitionedToOnBefore:after:](v47, "_checkIfScreenTransitionedToOnBefore:after:", v18, v46);

          v13 = 0;
          v20 = v15 ^ 1;
          v10 += v19;
          v15 = !v19;
          v11 += v15;
          v12 += v19 & v20;
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v9);
  }
  else
  {
    v46 = 0;
    v43 = 0;
  }

  v24 = -[ULHomeSlamAnalyticEventAnalyzer _daemonWasRestarted](v47, "_daemonWasRestarted");
  if (v11 + v10)
    v25 = 100 * v12 / (unint64_t)(v11 + v10);
  else
    v25 = 200;
  v26 = -[ULHomeSlamAnalyticEventAnalyzer _calcTimeAtHomeFromDate:untilDate:](v47, "_calcTimeAtHomeFromDate:untilDate:", v41, v42);
  v27 = -[ULHomeSlamAnalyticEventAnalyzer _calcMiLoEnabledTimeFromDate:untilDate:](v47, "_calcMiLoEnabledTimeFromDate:untilDate:", v41, v42);
  v52[0] = CFSTR("stop_triggers_total");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11 + v10);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v40;
  v52[1] = CFSTR("stop_triggers_screen_on");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v43);
  v28 = objc_claimAutoreleasedReturnValue();
  v53[1] = v28;
  v52[2] = CFSTR("stop_triggers_not_supressed");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v44;
  v52[3] = CFSTR("stop_triggers_supressed");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v29;
  v52[4] = CFSTR("num_valid_segments");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v30;
  v52[5] = CFSTR("percent_valid_segments");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v24;
  v53[5] = v31;
  v52[6] = CFSTR("time_spent_at_home");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v26);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v33;
  v52[7] = CFSTR("time_spent_with_milo_enabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v27);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v28;
  v53[7] = v34;
  v52[8] = CFSTR("daemon_restarted");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v53[8] = v36;
  v52[9] = CFSTR("hours_since_first_event");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ULHomeSlamAnalyticEventAnalyzer _hoursFromFirstEventToDate:](v47, "_hoursFromFirstEventToDate:", v42));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v53[9] = v37;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 10);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (int64_t)_hoursFromFirstEventToDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  int64_t v9;
  double v11;
  char v12;

  v4 = a3;
  v5 = (id)-[ULHomeSlamAnalyticEventAnalyzer db](self, "db")[128];
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "fetchFirstEvent");
  }
  else
  {
    v11 = 0.0;
    v12 = 0;
  }

  if (v12)
  {
    -[ULHomeSlamAnalyticEventAnalyzer _timepointToDate:](self, "_timepointToDate:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v7);
    v9 = vcvtpd_s64_f64(v8 / 60.0 / 60.0);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_checkIfScreenTransitionedToOnBefore:(id)a3 after:(id)a4
{
  id v6;
  id v7;
  double *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  int v14;
  BOOL v16;
  double *__p;
  double *v18;

  v6 = a3;
  v7 = a4;
  -[ULHomeSlamAnalyticEventAnalyzer events](self, "events");
  v8 = __p;
  if (__p == v18)
  {
    v16 = 0;
    if (!__p)
      goto LABEL_11;
    goto LABEL_10;
  }
  do
  {
    -[ULHomeSlamAnalyticEventAnalyzer _timepointToDate:](self, "_timepointToDate:", *v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v6);
    v11 = v10;

    if (v11 > 0.0)
      break;
    -[ULHomeSlamAnalyticEventAnalyzer _timepointToDate:](self, "_timepointToDate:", *v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v7);
    if (v13 <= 0.0)
    {

    }
    else
    {
      v14 = *((unsigned __int16 *)v8 + 4);

      if (!v14)
      {
        v16 = 1;
        goto LABEL_9;
      }
    }
    v8 += 2;
  }
  while (v8 != v18);
  v16 = 0;
LABEL_9:
  v8 = __p;
  if (__p)
LABEL_10:
    operator delete(v8);
LABEL_11:

  return v16;
}

- (BOOL)_wasLastScreenStateOnBefore:(id)a3
{
  id v4;
  double *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  int v10;
  double *__p;
  double *v13;

  v4 = a3;
  -[ULHomeSlamAnalyticEventAnalyzer events](self, "events");
  v5 = __p;
  if (__p == v13)
  {
    LOBYTE(v6) = 0;
    if (!__p)
      goto LABEL_13;
    goto LABEL_12;
  }
  v6 = 0;
  do
  {
    -[ULHomeSlamAnalyticEventAnalyzer _timepointToDate:](self, "_timepointToDate:", *v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v4);
    v9 = v8;

    if (v9 > 0.0)
      break;
    v10 = *((_WORD *)v5 + 4) == 1 ? 0 : v6;
    v6 = *((_WORD *)v5 + 4) ? v10 : 1;
    v5 += 2;
  }
  while (v5 != v13);
  v5 = __p;
  if (__p)
LABEL_12:
    operator delete(v5);
LABEL_13:

  return v6 & 1;
}

- (int64_t)_calcTimeAtHomeFromDate:(id)a3 untilDate:(id)a4
{
  return -[ULHomeSlamAnalyticEventAnalyzer _aggregateTimeBetweenEvent:andEvent:startDate:endDate:](self, "_aggregateTimeBetweenEvent:andEvent:startDate:endDate:", 5, 6, a3, a4);
}

- (int64_t)_calcMiLoEnabledTimeFromDate:(id)a3 untilDate:(id)a4
{
  return -[ULHomeSlamAnalyticEventAnalyzer _aggregateTimeBetweenEvent:andEvent:startDate:endDate:](self, "_aggregateTimeBetweenEvent:andEvent:startDate:endDate:", 2, 3, a3, a4);
}

- (int64_t)_aggregateTimeBetweenEvent:(signed __int16)a3 andEvent:(signed __int16)a4 startDate:(id)a5 endDate:(id)a6
{
  id v10;
  id v11;
  int v12;
  int v13;
  id v14;
  void *v15;
  double *v16;
  void *v17;
  double v18;
  void *v19;
  int v20;
  void *v21;
  double v22;
  id v23;
  id v25;
  id v26;
  _WORD *v27;
  double v28;
  void *__p;
  _WORD *v31;
  _WORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  double *v37;

  v10 = a5;
  v11 = a6;
  -[ULHomeSlamAnalyticEventAnalyzer events](self, "events");
  v12 = (unsigned __int16)a4;
  v13 = (unsigned __int16)a3;
  v14 = v11;
  v15 = v14;
  v16 = v37;
  if (v37 != v36)
  {
    v17 = 0;
    v18 = 0.0;
    v19 = v14;
    while (1)
    {
      v20 = *((unsigned __int16 *)v16 - 4);
      if (v20 == v13)
      {
        -[ULHomeSlamAnalyticEventAnalyzer _timepointToDate:](self, "_timepointToDate:", *(v16 - 2));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "timeIntervalSinceDate:", v21);
        v18 = v18 + v22;
        v23 = v21;
        v17 = v23;
      }
      else
      {
        if (v20 != v12 && v20 != 4)
          goto LABEL_12;
        -[ULHomeSlamAnalyticEventAnalyzer _timepointToDate:](self, "_timepointToDate:", *(v16 - 2));
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      v25 = v23;

      v19 = v25;
LABEL_12:
      v16 -= 2;
      if (v16 == v36)
        goto LABEL_15;
    }
  }
  v17 = 0;
  v18 = 0.0;
  v19 = v14;
LABEL_15:
  v26 = (id)-[ULHomeSlamAnalyticEventAnalyzer db](self, "db")[128];
  v27 = operator new(6uLL);
  v31 = v27 + 3;
  v32 = v27 + 3;
  *v27 = v13;
  v27[1] = v12;
  v27[2] = 4;
  __p = v27;
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  if (v26)
  {
    objc_msgSend(v26, "fetchLatestAnalyticEventType:beforeTime:", &__p);
    v27 = __p;
    if (!__p)
      goto LABEL_20;
  }
  else
  {
    v33 = 0;
    v34 = 0;
    v35 = 0;
  }
  v31 = v27;
  operator delete(v27);
LABEL_20:

  if ((_BYTE)v35 && (unsigned __int16)v34 == v13)
  {
    objc_msgSend(v19, "timeIntervalSinceDate:", v10);
    v18 = v18 + v28;
  }

  if (v36)
  {
    v37 = (double *)v36;
    operator delete(v36);
  }

  return vcvtpd_s64_f64(v18 / 60.0 / 60.0);
}

- (BOOL)_daemonWasRestarted
{
  char *v2;
  int v3;
  BOOL v4;
  BOOL v5;
  char *v7;
  char *v8;

  -[ULHomeSlamAnalyticEventAnalyzer events](self, "events");
  if (v7 == v8)
  {
    v4 = 0;
    if (!v7)
      return v4;
    goto LABEL_9;
  }
  v2 = v7 + 16;
  do
  {
    v3 = *((unsigned __int16 *)v2 - 4);
    v4 = v3 == 4;
    v5 = v3 == 4 || v2 == v8;
    v2 += 16;
  }
  while (!v5);
  if (v7)
LABEL_9:
    operator delete(v7);
  return v4;
}

- (vector<CLMiLoHomeSlamAnalyticEventTable::Entry,)events
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<CLMiLoHomeSlamAnalyticEventTable::Entry, std::allocator<CLMiLoHomeSlamAnalyticEventTable::Entry>> *)std::vector<CLMiLoHomeSlamAnalyticEventTable::Entry>::__init_with_size[abi:ne180100]<CLMiLoHomeSlamAnalyticEventTable::Entry*,CLMiLoHomeSlamAnalyticEventTable::Entry*>(retstr, self->_events.__begin_, (uint64_t)self->_events.__end_, self->_events.__end_ - self->_events.__begin_);
}

- (void)setEvents:()vector<CLMiLoHomeSlamAnalyticEventTable:(std::allocator<CLMiLoHomeSlamAnalyticEventTable::Entry>> *)a3 :Entry
{
  char *p_events;

  p_events = (char *)&self->_events;
  if (p_events != (char *)a3)
    std::vector<CLMiLoHomeSlamAnalyticEventTable::Entry>::__assign_with_size[abi:ne180100]<CLMiLoHomeSlamAnalyticEventTable::Entry*,CLMiLoHomeSlamAnalyticEventTable::Entry*>(p_events, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
}

- (ULDatabase)db
{
  return self->_db;
}

- (void)setDb:(ULDatabase *)a3
{
  self->_db = a3;
}

- (void).cxx_destruct
{
  Entry *begin;

  begin = self->_events.__begin_;
  if (begin)
  {
    self->_events.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
