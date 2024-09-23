@implementation CNDateComponentsEquivalence

+ (BOOL)canUnifyComponents:(id)a3 withComponents:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "isComponent:equivalentToComponent:", objc_msgSend(v6, "era"), objc_msgSend(v7, "era"))&& objc_msgSend(a1, "isComponent:equivalentToComponent:", objc_msgSend(v6, "year"), objc_msgSend(v7, "year"))&& objc_msgSend(a1, "isComponent:equivalentToComponent:", objc_msgSend(v6, "month"), objc_msgSend(v7, "month"))&& (v8 = objc_msgSend(v6, "isLeapMonth"), v8 == objc_msgSend(v7, "isLeapMonth"))&& objc_msgSend(a1, "isComponent:equivalentToComponent:", objc_msgSend(v6, "day"),
                       objc_msgSend(v7, "day")))
  {
    objc_msgSend(v6, "calendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "calendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(a1, "isCalendar:equivalentToCalendar:", v9, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)isComponent:(int64_t)a3 equivalentToComponent:(int64_t)a4
{
  if (a3 == a4)
    return 1;
  else
    return (a3 == 0x7FFFFFFFFFFFFFFFLL) ^ (a4 == 0x7FFFFFFFFFFFFFFFLL);
}

+ (BOOL)isCalendar:(id)a3 equivalentToCalendar:(id)a4
{
  if ((a3 != 0) == (a4 == 0))
    return 1;
  else
    return objc_msgSend(a3, "isEqual:", a4);
}

@end
