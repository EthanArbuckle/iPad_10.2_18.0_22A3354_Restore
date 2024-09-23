@implementation NSDateComponents(INJSONSerialization)

- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  if (objc_msgSend(a1, "year") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, CFSTR("year"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "year"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v7, CFSTR("year"));

  }
  if (objc_msgSend(a1, "month") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, CFSTR("month"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "month"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v8, CFSTR("month"));

  }
  if (objc_msgSend(a1, "day") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, CFSTR("day"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "day"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v9, CFSTR("day"));

  }
  if (objc_msgSend(a1, "weekday") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, CFSTR("weekday"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "weekday"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v10, CFSTR("weekday"));

  }
  if (objc_msgSend(a1, "hour") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, CFSTR("hour"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "hour"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v11, CFSTR("hour"));

  }
  if (objc_msgSend(a1, "minute") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, CFSTR("minute"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "minute"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v12, CFSTR("minute"));

  }
  if (objc_msgSend(a1, "second") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, CFSTR("second"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "second"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v13, CFSTR("second"));

  }
  if (objc_msgSend(a1, "nanosecond") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, CFSTR("nanosecond"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "nanosecond"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v14, CFSTR("nanosecond"));

  }
  objc_msgSend(a1, "calendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v16, CFSTR("calendar"));

  objc_msgSend(a1, "timeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v18, CFSTR("timeZone"));
  v19 = (void *)objc_msgSend(v6, "copy");

  return v19;
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("year"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v11, CFSTR("year"));

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("month"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v12, CFSTR("month"));

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("day"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v13, CFSTR("day"));

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("weekday"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v14, CFSTR("weekday"));

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("hour"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v15, CFSTR("hour"));

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("minute"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v16, CFSTR("minute"));

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("second"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v17, CFSTR("second"));

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("nanosecond"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v18, CFSTR("nanosecond"));

    v19 = objc_opt_class();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("calendar"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v21, CFSTR("calendar"));

    v22 = objc_opt_class();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timeZone"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "if_setValueIfNonNil:forKey:", v24, CFSTR("timeZone"));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
