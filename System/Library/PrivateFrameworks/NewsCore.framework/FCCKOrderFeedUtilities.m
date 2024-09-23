@implementation FCCKOrderFeedUtilities

+ (id)orderFeedRequestForFeedID:(id)a3 feedRange:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  FCCKOrderFeedRequest *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(a1, "_feedBinFromFeedID:", v7);
  v9 = objc_alloc_init(FCCKOrderFeedRequest);
  objc_msgSend(a1, "orderFeedIDFromFeedID:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_setProperty_nonatomic_copy(v9, v11, v10, 8);

  objc_msgSend(v6, "top");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "order");
  if (v9)
    v9->_maxOrder = v13;

  objc_msgSend(v6, "bottom");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "order");
  if (v9)
    v9->_minOrder = v15 + 1;

  objc_msgSend(v6, "timeInterval");
  v17 = v16;

  v18 = objc_msgSend(a1, "_orderFeedTopKFromBin:timeInterval:", v8, v17);
  if (v9)
    v9->_topK = v18;
  return v9;
}

+ (id)orderFeedIDFromFeedID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("@A");
  v8[1] = CFSTR("@B");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_stringByReplacingOccurrencesOfStrings:withString:", v5, &stru_1E464BC40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unint64_t)_orderFeedTopKFromBin:(int64_t)a3 timeInterval:(double)a4
{
  double v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a4 > 604800.0)
    return 0;
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case unsupported"));
      v7 = 136315906;
      v8 = "+[FCCKOrderFeedUtilities _orderFeedTopKFromBin:timeInterval:]";
      v9 = 2080;
      v10 = "FCCKOrderFeedUtilities.m";
      v11 = 1024;
      v12 = 93;
      v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v7, 0x26u);

    }
    return 0;
  }
  if (a3 == 1)
  {
    v5 = 86400.0;
    return vcvtpd_u64_f64(a4 / v5 * 12.0);
  }
  if (a3 != 2)
    return 0;
  v5 = 3600.0;
  return vcvtpd_u64_f64(a4 / v5 * 12.0);
}

+ (int64_t)_feedBinFromFeedID:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("@A")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "containsString:", CFSTR("@B")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 3;
  }

  return v4;
}

@end
