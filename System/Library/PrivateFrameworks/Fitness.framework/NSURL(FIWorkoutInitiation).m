@implementation NSURL(FIWorkoutInitiation)

+ (id)fi_startBackdatedWorkoutURLWithDate:()FIWorkoutInitiation workoutIdentifier:workoutType:isIndoor:swimmingLocationType:showPicker:
{
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v45;
  id v47;

  v11 = (objc_class *)MEMORY[0x24BDD1808];
  v47 = a4;
  v12 = a3;
  v13 = objc_alloc_init(v11);
  objc_msgSend(v13, "setScheme:", CFSTR("SessionTrackerApp"));
  objc_msgSend(v13, "setHost:", CFSTR("startbackdatedworkout"));
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = (void *)MEMORY[0x24BDD1838];
  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v18 = v17;

  objc_msgSend(v16, "numberWithDouble:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "queryItemWithName:value:", CFSTR("overrideActivityBeginTime"), v20);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addObject:", v45);
  v21 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "queryItemWithName:value:", CFSTR("activityType"), v23);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addObject:", v43);
  v24 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "queryItemWithName:value:", CFSTR("auxiliaryActivityType"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addObject:", v27);
  v28 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringValue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "queryItemWithName:value:", CFSTR("swimmingLocationType"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addObject:", v31);
  v32 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringValue");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "queryItemWithName:value:", CFSTR("location"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addObject:", v35);
  v36 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a8);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "stringValue");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "queryItemWithName:value:", CFSTR("presentpicker"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addObject:", v39);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("workoutidentifier"), v47);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addObject:", v40);
  objc_msgSend(v13, "setQueryItems:", v14);
  objc_msgSend(v13, "URL");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

+ (uint64_t)fi_endWorkoutURLWithIdentifier:()FIWorkoutInitiation
{
  return objc_msgSend(a1, "_launchURLWithHostname:workoutIdentifier:", CFSTR("endworkout"), a3);
}

+ (uint64_t)fi_pauseWorkoutURLWithIdentifier:()FIWorkoutInitiation
{
  return objc_msgSend(a1, "_launchURLWithHostname:workoutIdentifier:", CFSTR("pauseworkout"), a3);
}

+ (uint64_t)fi_resumeWorkoutURLWithIdentifier:()FIWorkoutInitiation date:source:
{
  return objc_msgSend(a1, "_launchURLWithHostname:workoutIdentifier:date:source:", CFSTR("resumeworkout"), a3, a4, a5);
}

+ (id)_launchURLWithHostname:()FIWorkoutInitiation workoutIdentifier:date:source:
{
  id v9;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v9 = a5;
  v10 = a6;
  v11 = (objc_class *)MEMORY[0x24BDD1808];
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v11);
  objc_msgSend(v14, "setScheme:", CFSTR("SessionTrackerApp"));
  objc_msgSend(v14, "setHost:", v13);

  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("workoutidentifier"), v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addObject:", v16);
  if (v9)
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%f"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("date"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v20);

  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("source"), v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v21);

  }
  objc_msgSend(v14, "setQueryItems:", v15);
  objc_msgSend(v14, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (uint64_t)_launchURLWithHostname:()FIWorkoutInitiation workoutIdentifier:
{
  return objc_msgSend(a1, "_launchURLWithHostname:workoutIdentifier:date:source:", a3, a4, 0, 0);
}

@end
