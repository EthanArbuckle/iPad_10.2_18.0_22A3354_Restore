@implementation ACCMemUsageStatInfo

- (ACCMemUsageStatInfo)init
{
  ACCMemUsageStatInfo *v2;
  ACCMemUsageStatInfo *v3;
  NSString *name;
  ACCStatInfoAccumulator *v5;
  ACCStatInfoAccumulator *residentMem;
  ACCStatInfoAccumulator *v7;
  ACCStatInfoAccumulator *virtualMem;
  ACCStatInfoAccumulator *v9;
  ACCStatInfoAccumulator *physFootprintMem;
  uint64_t v11;
  NSDate *startTime;
  NSDate *lastUpdateTime;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ACCMemUsageStatInfo;
  v2 = -[ACCMemUsageStatInfo init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = 0;

    v5 = -[ACCStatInfoAccumulator initWithName:]([ACCStatInfoAccumulator alloc], "initWithName:", CFSTR("resident"));
    residentMem = v3->_residentMem;
    v3->_residentMem = v5;

    v7 = -[ACCStatInfoAccumulator initWithName:]([ACCStatInfoAccumulator alloc], "initWithName:", CFSTR("virtual"));
    virtualMem = v3->_virtualMem;
    v3->_virtualMem = v7;

    v9 = -[ACCStatInfoAccumulator initWithName:]([ACCStatInfoAccumulator alloc], "initWithName:", CFSTR("physFootprint"));
    physFootprintMem = v3->_physFootprintMem;
    v3->_physFootprintMem = v9;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    startTime = v3->_startTime;
    v3->_startTime = (NSDate *)v11;

    lastUpdateTime = v3->_lastUpdateTime;
    v3->_lastUpdateTime = 0;

  }
  return v3;
}

- (ACCMemUsageStatInfo)initWithName:(id)a3
{
  id v5;
  ACCMemUsageStatInfo *v6;
  ACCMemUsageStatInfo *v7;
  ACCStatInfoAccumulator *v8;
  void *v9;
  uint64_t v10;
  ACCStatInfoAccumulator *residentMem;
  ACCStatInfoAccumulator *v12;
  void *v13;
  uint64_t v14;
  ACCStatInfoAccumulator *virtualMem;
  ACCStatInfoAccumulator *v16;
  void *v17;
  uint64_t v18;
  ACCStatInfoAccumulator *physFootprintMem;
  uint64_t v20;
  NSDate *startTime;
  NSDate *lastUpdateTime;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ACCMemUsageStatInfo;
  v6 = -[ACCMemUsageStatInfo init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = [ACCStatInfoAccumulator alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-resident"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ACCStatInfoAccumulator initWithName:](v8, "initWithName:", v9);
    residentMem = v7->_residentMem;
    v7->_residentMem = (ACCStatInfoAccumulator *)v10;

    v12 = [ACCStatInfoAccumulator alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-virtual"), v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ACCStatInfoAccumulator initWithName:](v12, "initWithName:", v13);
    virtualMem = v7->_virtualMem;
    v7->_virtualMem = (ACCStatInfoAccumulator *)v14;

    v16 = [ACCStatInfoAccumulator alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-physFootprint"), v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[ACCStatInfoAccumulator initWithName:](v16, "initWithName:", v17);
    physFootprintMem = v7->_physFootprintMem;
    v7->_physFootprintMem = (ACCStatInfoAccumulator *)v18;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = objc_claimAutoreleasedReturnValue();
    startTime = v7->_startTime;
    v7->_startTime = (NSDate *)v20;

    lastUpdateTime = v7->_lastUpdateTime;
    v7->_lastUpdateTime = 0;

  }
  return v7;
}

- (ACCMemUsageStatInfo)initWithName:(id)a3 andInfo:(id)a4
{
  id v7;
  id v8;
  ACCMemUsageStatInfo *v9;
  ACCMemUsageStatInfo *v10;
  ACCStatInfoAccumulator *v11;
  void *v12;
  uint64_t v13;
  ACCStatInfoAccumulator *residentMem;
  ACCStatInfoAccumulator *v15;
  void *v16;
  uint64_t v17;
  ACCStatInfoAccumulator *virtualMem;
  ACCStatInfoAccumulator *v19;
  void *v20;
  uint64_t v21;
  ACCStatInfoAccumulator *physFootprintMem;
  uint64_t v23;
  NSDate *startTime;
  NSDate *lastUpdateTime;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ACCMemUsageStatInfo;
  v9 = -[ACCMemUsageStatInfo init](&v27, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v11 = [ACCStatInfoAccumulator alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-resident"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ACCStatInfoAccumulator initWithName:](v11, "initWithName:", v12);
    residentMem = v10->_residentMem;
    v10->_residentMem = (ACCStatInfoAccumulator *)v13;

    v15 = [ACCStatInfoAccumulator alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-virtual"), v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[ACCStatInfoAccumulator initWithName:](v15, "initWithName:", v16);
    virtualMem = v10->_virtualMem;
    v10->_virtualMem = (ACCStatInfoAccumulator *)v17;

    v19 = [ACCStatInfoAccumulator alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-physFootprint"), v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[ACCStatInfoAccumulator initWithName:](v19, "initWithName:", v20);
    physFootprintMem = v10->_physFootprintMem;
    v10->_physFootprintMem = (ACCStatInfoAccumulator *)v21;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v23 = objc_claimAutoreleasedReturnValue();
    startTime = v10->_startTime;
    v10->_startTime = (NSDate *)v23;

    lastUpdateTime = v10->_lastUpdateTime;
    v10->_lastUpdateTime = 0;

    -[ACCMemUsageStatInfo setInfo:](v10, "setInfo:", v8);
  }

  return v10;
}

- (id)description
{
  void *v3;
  const __CFString *name;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v12;
  double v13;
  unint64_t v14;
  double v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  name = &stru_24DD265E0;
  if (self->_name)
    name = (const __CFString *)self->_name;
  v22 = name;
  v23 = (void *)MEMORY[0x24BDD17C8];
  -[NSDate timeIntervalSince1970](self->_startTime, "timeIntervalSince1970");
  v21 = v5;
  -[NSDate timeIntervalSince1970](self->_lastUpdateTime, "timeIntervalSince1970");
  v20 = v6;
  objc_msgSend(v3, "timeIntervalSince1970");
  v19 = v7;
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_startTime);
  v18 = v8;
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_lastUpdateTime);
  v17 = v9;
  v16 = -[ACCStatInfoAccumulator start](self->_residentMem, "start");
  v15 = (double)-[ACCStatInfoAccumulator start](self->_residentMem, "start") / 1000000.0;
  v14 = -[ACCStatInfoAccumulator last](self->_residentMem, "last");
  v13 = (double)-[ACCStatInfoAccumulator last](self->_residentMem, "last") / 1000000.0;
  v12 = -[ACCStatInfoAccumulator max](self->_residentMem, "max");
  objc_msgSend(v23, "stringWithFormat:", CFSTR("  ACCMemUsageStatInfo:%@ startTime=%f, lastUpdateTime=%f, curTime=%f, sinceStart=%f, sinceLast=%f \n         resident: (start:%10llu / %8.3fM, last:%10llu / %8.3fM, max:%10llu / %8.3fM, diff:%10llu / %8.3fM, avg:%10llu / %8.3fM) \n          virtual: (start:%10llu / %8.3fM, last:%10llu / %8.3fM, max:%10llu / %8.3fM, diff:%10llu / %8.3fM, avg:%10llu / %8.3fM) \n    physFootprint: (start:%10llu / %8.3fM, last:%10llu / %8.3fM, max:%10llu / %8.3fM, diff:%10llu / %8.3fM, avg:%10llu / %8.3fM) \n"), v22, v21, v20, v19, v18, v17, v16, *(_QWORD *)&v15, v14, *(_QWORD *)&v13, v12, (double)-[ACCStatInfoAccumulator max](self->_residentMem, "max") / 1000000.0, -[ACCStatInfoAccumulator max](self->_residentMem, "max")- -[ACCStatInfoAccumulator start](self->_residentMem, "start"), (double)(-[ACCStatInfoAccumulator max](self->_residentMem, "max")- -[ACCStatInfoAccumulator start](self->_residentMem, "start"))
  / 1000000.0,
    -[ACCStatInfoAccumulator average](self->_residentMem, "average"),
    (double)-[ACCStatInfoAccumulator average](self->_residentMem, "average") / 1000000.0,
    -[ACCStatInfoAccumulator start](self->_virtualMem, "start"),
    (double)-[ACCStatInfoAccumulator start](self->_virtualMem, "start") / 1000000.0,
    -[ACCStatInfoAccumulator last](self->_virtualMem, "last"),
    (double)-[ACCStatInfoAccumulator last](self->_virtualMem, "last") / 1000000.0,
    -[ACCStatInfoAccumulator max](self->_virtualMem, "max"),
    (double)-[ACCStatInfoAccumulator max](self->_virtualMem, "max") / 1000000.0,
    -[ACCStatInfoAccumulator max](self->_virtualMem, "max")
  - -[ACCStatInfoAccumulator start](self->_virtualMem, "start"),
    (double)(-[ACCStatInfoAccumulator max](self->_virtualMem, "max")
           - -[ACCStatInfoAccumulator start](self->_virtualMem, "start"))
  / 1000000.0,
    -[ACCStatInfoAccumulator average](self->_virtualMem, "average"),
    (double)-[ACCStatInfoAccumulator average](self->_virtualMem, "average") / 1000000.0,
    -[ACCStatInfoAccumulator start](self->_physFootprintMem, "start"),
    (double)-[ACCStatInfoAccumulator start](self->_physFootprintMem, "start") / 1000000.0,
    -[ACCStatInfoAccumulator last](self->_physFootprintMem, "last"),
    (double)-[ACCStatInfoAccumulator last](self->_physFootprintMem, "last") / 1000000.0,
    -[ACCStatInfoAccumulator max](self->_physFootprintMem, "max"),
    (double)-[ACCStatInfoAccumulator max](self->_physFootprintMem, "max") / 1000000.0,
    -[ACCStatInfoAccumulator max](self->_physFootprintMem, "max")
  - -[ACCStatInfoAccumulator start](self->_physFootprintMem, "start"),
    (double)(-[ACCStatInfoAccumulator max](self->_physFootprintMem, "max")
           - -[ACCStatInfoAccumulator start](self->_physFootprintMem, "start"))
  / 1000000.0,
    -[ACCStatInfoAccumulator average](self->_physFootprintMem, "average"),
    (double)-[ACCStatInfoAccumulator average](self->_physFootprintMem, "average") / 1000000.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setInfo:(id)a3
{
  void *v4;
  id v5;
  NSDate *v6;
  NSDate *lastUpdateTime;
  ACCStatInfoAccumulator *residentMem;
  void *v9;
  ACCStatInfoAccumulator *virtualMem;
  void *v11;
  ACCStatInfoAccumulator *physFootprintMem;
  id v13;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUpdateTime = self->_lastUpdateTime;
  self->_lastUpdateTime = v6;

  -[ACCStatInfoAccumulator reset](self->_residentMem, "reset");
  residentMem = self->_residentMem;
  objc_msgSend(v5, "residentMem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCStatInfoAccumulator set:](residentMem, "set:", v9);

  -[ACCStatInfoAccumulator reset](self->_virtualMem, "reset");
  virtualMem = self->_virtualMem;
  objc_msgSend(v5, "virtualMem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCStatInfoAccumulator set:](virtualMem, "set:", v11);

  -[ACCStatInfoAccumulator reset](self->_physFootprintMem, "reset");
  physFootprintMem = self->_physFootprintMem;
  objc_msgSend(v5, "physFootprintMem");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[ACCStatInfoAccumulator set:](physFootprintMem, "set:", v13);
}

- (void)updateResident:(unint64_t)a3 virtualValue:(unint64_t)a4 physFootprintValue:(unint64_t)a5
{
  NSDate *v9;
  NSDate *lastUpdateTime;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUpdateTime = self->_lastUpdateTime;
  self->_lastUpdateTime = v9;

  -[ACCStatInfoAccumulator add:](self->_residentMem, "add:", a3);
  -[ACCStatInfoAccumulator add:](self->_virtualMem, "add:", a4);
  -[ACCStatInfoAccumulator add:](self->_physFootprintMem, "add:", a5);
}

- (double)timeIntervalSinceStart
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_startTime);
  v5 = v4;

  return v5;
}

- (double)timeIntervalSinceLastUpdate
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_lastUpdateTime);
  v5 = v4;

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (ACCStatInfoAccumulator)residentMem
{
  return self->_residentMem;
}

- (ACCStatInfoAccumulator)virtualMem
{
  return self->_virtualMem;
}

- (ACCStatInfoAccumulator)physFootprintMem
{
  return self->_physFootprintMem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physFootprintMem, 0);
  objc_storeStrong((id *)&self->_virtualMem, 0);
  objc_storeStrong((id *)&self->_residentMem, 0);
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
