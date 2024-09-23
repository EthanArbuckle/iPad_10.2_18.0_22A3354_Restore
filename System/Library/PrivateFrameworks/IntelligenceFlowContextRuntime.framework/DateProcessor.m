@implementation DateProcessor

+ (id)processDateMatch:(id)a3 originalString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && objc_msgSend(v5, "underlyingResult"))
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "rangeOfCharacterFromSet:", v10) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(v5, "underlyingResult");
        DDResultGetType();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "rangeOfString:", CFSTR("Date"));
        v13 = objc_msgSend(v11, "rangeOfString:", CFSTR("Time"));
        v14 = objc_msgSend(v11, "rangeOfString:", CFSTR("Duration"));
        if (v12 == 0x7FFFFFFFFFFFFFFFLL && v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v8 = 0;
        }
        else
        {
          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v16 = 0;
          }
          else
          {
            v15 = objc_msgSend(v5, "timeIsSignificant");
            v16 = 224;
            if (!v15)
              v16 = 0;
          }
          if (v12 == 0x7FFFFFFFFFFFFFFFLL)
            v17 = v16;
          else
            v17 = v16 | 0x1C;
          objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "components:fromDate:", v17, v9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14 == 0x7FFFFFFFFFFFFFFFLL || (objc_msgSend(v5, "duration"), v20 <= 0.0))
          {
            v23 = 0;
          }
          else
          {
            v21 = (void *)MEMORY[0x24BDBCE60];
            objc_msgSend(v5, "duration");
            objc_msgSend(v21, "dateWithTimeInterval:sinceDate:", v9);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "components:fromDate:", v17, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v5, "timeZone");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v5, "timeZone");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setTimeZone:", v25);

            objc_msgSend(v5, "timeZone");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setTimeZone:", v26);

          }
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v9, CFSTR("date"));
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v19, CFSTR("startDateComponents"));
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v23, CFSTR("endDateComponents"));
          v8 = (void *)objc_msgSend(v27, "copy");

        }
      }

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

@end
