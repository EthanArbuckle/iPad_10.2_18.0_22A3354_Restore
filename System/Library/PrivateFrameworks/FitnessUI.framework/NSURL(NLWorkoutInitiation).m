@implementation NSURL(NLWorkoutInitiation)

+ (uint64_t)fiui_URLTimeUnit
{
  return objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
}

+ (uint64_t)fiui_URLDistanceUnit
{
  return objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
}

+ (uint64_t)fiui_URLEnergyUnit
{
  return objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
}

+ (id)fiui_workoutInitiationURLWithWorkout:()NLWorkoutInitiation presentConfiguration:skipCountdown:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  FIUIWorkoutActivityType *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  FIUIWorkoutActivityType *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  void *v72;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v6, "setScheme:", *MEMORY[0x24BE328D8]);
  objc_msgSend(v6, "setHost:", *MEMORY[0x24BE328B8]);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDD31C0];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD31C0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = (void *)MEMORY[0x24BDD1838];
  v13 = *MEMORY[0x24BE328C0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queryItemWithName:value:", v13, v15);
  v16 = objc_claimAutoreleasedReturnValue();

  v72 = (void *)v16;
  objc_msgSend(v7, "addObject:", v16);
  v17 = [FIUIWorkoutActivityType alloc];
  v18 = objc_msgSend(v5, "workoutActivityType");
  objc_msgSend(v5, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");

  v22 = -[FIUIWorkoutActivityType initWithActivityTypeIdentifier:isIndoor:](v17, "initWithActivityTypeIdentifier:isIndoor:", v18, v21);
  v23 = (void *)MEMORY[0x24BDD1838];
  v24 = *MEMORY[0x24BE32898];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[FIUIWorkoutActivityType identifier](v22, "identifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "queryItemWithName:value:", v24, v26);
  v27 = objc_claimAutoreleasedReturnValue();

  v70 = (void *)v27;
  objc_msgSend(v7, "addObject:", v27);
  v28 = -[FIUIWorkoutActivityType auxiliaryTypeIdentifier](v22, "auxiliaryTypeIdentifier");
  if (v28 != *MEMORY[0x24BDD4500])
  {
    v29 = (void *)MEMORY[0x24BDD1838];
    v30 = *MEMORY[0x24BE328A0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[FIUIWorkoutActivityType auxiliaryTypeIdentifier](v22, "auxiliaryTypeIdentifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "queryItemWithName:value:", v30, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v33);
  }
  v34 = objc_msgSend(v5, "_goalType");
  v35 = (void *)MEMORY[0x24BDD1838];
  v36 = *MEMORY[0x24BE328A8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "stringValue");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "queryItemWithName:value:", v36, v38);
  v39 = objc_claimAutoreleasedReturnValue();

  v69 = (void *)v39;
  objc_msgSend(v7, "addObject:", v39);
  switch(v34)
  {
    case 1:
      objc_msgSend(v5, "_goal");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fiui_URLDistanceUnit");
      v41 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(v5, "_goal");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fiui_URLEnergyUnit");
      v41 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(v5, "_goal");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fiui_URLTimeUnit");
      v41 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      goto LABEL_11;
  }
  v42 = (void *)v41;
  objc_msgSend(v40, "doubleValueForUnit:", v41);
  v44 = v43;

  v45 = (void *)MEMORY[0x24BDD1838];
  v46 = *MEMORY[0x24BE328B0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v44);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "stringValue");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "queryItemWithName:value:", v46, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v7, "addObject:", v49);

  }
LABEL_11:
  v50 = (void *)MEMORY[0x24BDD1838];
  v51 = *MEMORY[0x24BE32890];
  v52 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "startDate");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "timeIntervalSinceReferenceDate");
  objc_msgSend(v52, "numberWithDouble:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "stringValue");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "queryItemWithName:value:", v51, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v56);
  if (a4)
  {
    v57 = (void *)MEMORY[0x24BDD1838];
    v58 = *MEMORY[0x24BE328C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "stringValue");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "queryItemWithName:value:", v58, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v61);
  }
  if (a5)
  {
    v62 = (void *)MEMORY[0x24BDD1838];
    v63 = *MEMORY[0x24BE328E0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "stringValue");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "queryItemWithName:value:", v63, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v66);
  }
  objc_msgSend(v6, "setQueryItems:", v7);
  objc_msgSend(v6, "URL");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  return v67;
}

+ (id)_launchURLWithHostname:()NLWorkoutInitiation workoutIdentifier:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x24BDD1808];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setScheme:", *MEMORY[0x24BE328D8]);
  objc_msgSend(v8, "setHost:", v7);

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", *MEMORY[0x24BE328E8], v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v10);
  objc_msgSend(v8, "setQueryItems:", v9);
  objc_msgSend(v8, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)fiui_workoutPickerURLComponents
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v0, "setScheme:", *MEMORY[0x24BE328D8]);
  objc_msgSend(v0, "setHost:", *MEMORY[0x24BE328D0]);
  return v0;
}

+ (id)fiui_workoutPickerURL
{
  void *v0;
  void *v1;

  objc_msgSend((id)objc_opt_class(), "fiui_workoutPickerURLComponents");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
