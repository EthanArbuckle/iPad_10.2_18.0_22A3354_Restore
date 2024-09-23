@implementation HMDCoreDataTransformerHMCameraActivityZone

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = (objc_class *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "points");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithCapacity:", 2 * objc_msgSend(v7, "count"));

  objc_msgSend(v5, "points");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__HMDCoreDataTransformerHMCameraActivityZone_OPACKFromValue_error___block_invoke;
  v13[3] = &unk_24E77C8D0;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);

  v11 = (void *)objc_msgSend(v10, "copy");
  return v11;
}

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  float v13;
  double v14;
  void *v15;
  float v16;
  double v17;
  void *v18;
  void *v19;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  v8 = v7;
  if (!v7)
  {
    if (a4)
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected NSArray value to create HMCameraActivityZone: %@"), v5);
      goto LABEL_17;
    }
LABEL_19:
    v19 = 0;
    goto LABEL_20;
  }
  if ((unint64_t)objc_msgSend(v7, "count") > 5)
  {
    if ((objc_msgSend(v8, "count") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", (unint64_t)objc_msgSend(v8, "count") >> 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        v11 = 0;
        do
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "floatValue");
          v14 = v13;
          objc_msgSend(v8, "objectAtIndexedSubscript:", v11 + 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "floatValue");
          v17 = v16;

          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD78D0]), "initWithPoint:", v14, v17);
          objc_msgSend(v10, "addObject:", v18);

          v11 += 2;
        }
        while (v11 < objc_msgSend(v8, "count"));
      }
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7520]), "initWithPoints:", v10);
      goto LABEL_18;
    }
    if (a4)
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected NSArray of even length to create HMCameraActivityZone: %@"), v5);
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  if (!a4)
    goto LABEL_19;
  v9 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected NSArray of at least 6 elements to create HMCameraActivityZone: %@"), v5);
LABEL_17:
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hmfErrorWithCode:reason:", 3, v10);
  v19 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

LABEL_20:
  return v19;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

void __67__HMDCoreDataTransformerHMCameraActivityZone_OPACKFromValue_error___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  objc_msgSend(a2, "point");
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  *(float *)&v6 = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  v8 = *(void **)(a1 + 32);
  *(float *)&v9 = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v10);

}

@end
