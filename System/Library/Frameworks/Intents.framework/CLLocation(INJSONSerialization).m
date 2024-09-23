@implementation CLLocation(INJSONSerialization)

- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("coordinate"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "coordinate");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v9, CFSTR("coordinate.latitude"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "coordinate");
  objc_msgSend(v10, "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v13, CFSTR("coordinate.longitude"));

  objc_msgSend(a1, "altitude");
  if (v14 < 0.0)
  {
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", 0, CFSTR("altitude"));
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "altitude");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v17, CFSTR("altitude"));

  }
  objc_msgSend(a1, "horizontalAccuracy");
  if (v18 < 0.0)
  {
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", 0, CFSTR("horizontalAccuracy"));
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "horizontalAccuracy");
    objc_msgSend(v19, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v21, CFSTR("horizontalAccuracy"));

  }
  objc_msgSend(a1, "verticalAccuracy");
  if (v22 < 0.0)
  {
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", 0, CFSTR("verticalAccuracy"));
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "verticalAccuracy");
    objc_msgSend(v23, "numberWithDouble:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v25, CFSTR("verticalAccuracy"));

  }
  objc_msgSend(a1, "course");
  if (v26 < 0.0)
  {
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", 0, CFSTR("course"));
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "course");
    objc_msgSend(v27, "numberWithDouble:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v29, CFSTR("course"));

  }
  objc_msgSend(a1, "speed");
  if (v30 < 0.0)
  {
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", 0, CFSTR("speed"));
  }
  else
  {
    v31 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "speed");
    objc_msgSend(v31, "numberWithDouble:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v33, CFSTR("speed"));

  }
  objc_msgSend(v4, "_storedConfiguration");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "locationIncludesTimestamp");

  if (v35)
  {
    objc_msgSend(a1, "timestamp");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v37, CFSTR("timestamp"));

  }
  return v5;
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  CLLocationDegrees v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  CLLocationDegrees v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  CLLocationCoordinate2D v59;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
    v10 = 0;
    v56 = 0;
    v57 = 0;
LABEL_22:

    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v56 = 0;
    v57 = 0;
    v10 = v9;
    goto LABEL_22;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("coordinate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v57 = 0;
LABEL_21:
    v56 = v9;
    goto LABEL_22;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v12 = objc_opt_class();
    objc_msgSend(v9, "valueForKeyPath:", CFSTR("coordinate.latitude"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    v17 = objc_opt_class();
    objc_msgSend(v9, "valueForKeyPath:", CFSTR("coordinate.longitude"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

    v22 = objc_opt_class();
    objc_msgSend(v9, "valueForKeyPath:", CFSTR("altitude"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v25;

    v27 = objc_opt_class();
    objc_msgSend(v9, "valueForKeyPath:", CFSTR("horizontalAccuracy"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (!v29)
      v29 = &unk_1E23E99D0;
    objc_msgSend(v29, "doubleValue");
    v32 = v31;

    v33 = objc_opt_class();
    objc_msgSend(v9, "valueForKeyPath:", CFSTR("verticalAccuracy"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (!v35)
      v35 = &unk_1E23E99D0;
    objc_msgSend(v35, "doubleValue");
    v38 = v37;

    v39 = objc_opt_class();
    objc_msgSend(v9, "valueForKeyPath:", CFSTR("course"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (!v41)
      v41 = &unk_1E23E99D0;
    objc_msgSend(v41, "doubleValue");
    v44 = v43;

    v45 = objc_opt_class();
    objc_msgSend(v9, "valueForKeyPath:", CFSTR("speed"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (!v47)
      v47 = &unk_1E23E99D0;
    objc_msgSend(v47, "doubleValue");
    v50 = v49;

    v51 = objc_opt_class();
    objc_msgSend(v9, "valueForKeyPath:", CFSTR("timestamp"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (v53)
    {
      v55 = v53;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
      v55 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v55;

    v58 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    v59 = CLLocationCoordinate2DMake(v16, v21);
    v57 = (void *)objc_msgSend(v58, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v10, v59.latitude, v59.longitude, v26, v32, v38, v44, v50);
    goto LABEL_21;
  }
  v57 = 0;
  v56 = v9;
LABEL_23:

  return v57;
}

@end
