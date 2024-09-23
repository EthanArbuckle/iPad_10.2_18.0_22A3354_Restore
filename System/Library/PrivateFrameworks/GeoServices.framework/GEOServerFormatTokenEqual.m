@implementation GEOServerFormatTokenEqual

uint64_t __GEOServerFormatTokenEqual_block_invoke_2(void *a1, void *a2)
{
  id v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  BOOL v10;
  BOOL v11;
  double v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a1;
  v4 = a2;
  v5 = (unint64_t)v3;
  v6 = (unint64_t)v4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v6)
      v10 = 0;
    else
      v10 = v5 != 0;
    if (v6)
      v11 = v5 == 0;
    else
      v11 = 0;
    if (!v11 && !v10)
    {
      objc_msgSend((id)v5, "timeStamp");
      v13 = (uint64_t)v12;
      objc_msgSend(v7, "timeStamp");
      if (v13 == (uint64_t)v14)
      {
        objc_msgSend((id)v5, "timeZone");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "timeZone");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v15;
        v18 = v16;
        if (!(v17 | v18)
          || (v8 = objc_msgSend((id)v17, "isEqual:", v18), (id)v18, (id)v17, (_DWORD)v8))
        {
          objc_msgSend((id)v5, "formatPattern");
          v19 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "formatPattern");
          v20 = objc_claimAutoreleasedReturnValue();
          if (v19 | v20)
            v8 = objc_msgSend((id)v19, "isEqual:", v20);
          else
            v8 = 1;

        }
      }
      else
      {
        v8 = 0;
      }
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

@end
