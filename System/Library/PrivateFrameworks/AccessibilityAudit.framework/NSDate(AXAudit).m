@implementation NSDate(AXAudit)

- (id)axAuditLogStringForDifferenceFromDate:()AXAudit
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  char *__ptr32 *v11;
  double v12;
  double v13;
  char *__ptr32 *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = (objc_class *)MEMORY[0x24BDBCE48];
  v5 = a1;
  v6 = a3;
  v7 = [v4 alloc];
  v8 = (void *)objc_msgSend(v7, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v8, "components:fromDate:toDate:options:", 0x8000, v6, v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (double)objc_msgSend(v9, "nanosecond") / 1000000000.0;
  v11 = &off_235D05000;
  LODWORD(v11) = vcvtmd_s64_f64(v10 / 86400.0);
  v12 = (double)(86400 * (int)v11);
  if ((int)v11 <= 0)
    v12 = 0.0;
  v13 = v10 - v12;
  v14 = &off_235D05000;
  LODWORD(v14) = vcvtmd_s64_f64(v13 / 3600.0);
  v15 = (double)(3600 * (int)v14);
  if ((int)v14 <= 0)
    v15 = 0.0;
  v16 = v13 - v15;
  v17 = vcvtmd_s64_f64(v16 / 60.0) | 0x404E000000000000;
  v18 = 60 * (int)v17;
  if ((int)v17 <= 0)
    v19 = v16;
  else
    v19 = v16 - (double)v18;
  if ((int)v11 < 1)
  {
    if ((int)v14 < 1)
    {
      if ((int)v17 < 1)
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02.4fs"), *(_QWORD *)&v16, v22, v23, v24);
      else
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02i:%02.3f"), v17, v16 - (double)v18, v23, v24);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02i:%02i:%02.3f"), v14, v17, *(_QWORD *)&v19, v24);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02i:%02i:%02i:%02.3f"), v11, v14, v17, *(_QWORD *)&v19);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
