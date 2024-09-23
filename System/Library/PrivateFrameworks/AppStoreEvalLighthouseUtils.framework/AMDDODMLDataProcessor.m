@implementation AMDDODMLDataProcessor

- (AMDDODMLDataProcessor)initWithActionArray:(id)a3 withAttachmentProcessor:(id)a4
{
  AMDDODMLDataProcessor *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *coreDictionary;
  NSMutableDictionary *v7;
  NSMutableDictionary *inputDictionary;
  NSMutableDictionary *v9;
  NSMutableDictionary *numberInputsBound;
  NSMutableDictionary *v11;
  NSMutableDictionary *elementsInSample;
  AMDClient *v13;
  AMDClient *myAMDClient;
  AMDDODMLDataProcessor *v16;
  AMDDODMLDataProcessor *v18;
  objc_super v19;
  id v20;
  id location[2];
  AMDDODMLDataProcessor *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v4 = v22;
  v22 = 0;
  v19.receiver = v4;
  v19.super_class = (Class)AMDDODMLDataProcessor;
  v18 = -[AMDDODMLDataProcessor init](&v19, sel_init);
  v22 = v18;
  objc_storeStrong((id *)&v22, v18);
  if (v18)
  {
    objc_storeStrong((id *)&v22->_actionArray, location[0]);
    objc_storeStrong((id *)&v22->_attachmentsProcessor, v20);
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    coreDictionary = v22->_coreDictionary;
    v22->_coreDictionary = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    inputDictionary = v22->_inputDictionary;
    v22->_inputDictionary = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    numberInputsBound = v22->_numberInputsBound;
    v22->_numberInputsBound = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    elementsInSample = v22->_elementsInSample;
    v22->_elementsInSample = v11;

    v13 = (AMDClient *)objc_alloc_init(MEMORY[0x24BE07A20]);
    myAMDClient = v22->_myAMDClient;
    v22->_myAMDClient = v13;

  }
  v16 = v22;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v22, 0);
  return v16;
}

- (void)resetDataProcessorWithRecipe:(id)a3
{
  NSMutableDictionary *v3;
  NSMutableDictionary *inputDictionary;
  NSMutableDictionary *v5;
  NSMutableDictionary *numberInputsBound;
  NSMutableDictionary *v7;
  NSMutableDictionary *elementsInSample;
  AMDClient *v9;
  AMDClient *myAMDClient;
  id location[2];
  AMDDODMLDataProcessor *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v12->_actionArray, location[0]);
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  inputDictionary = v12->_inputDictionary;
  v12->_inputDictionary = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  numberInputsBound = v12->_numberInputsBound;
  v12->_numberInputsBound = v5;

  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  elementsInSample = v12->_elementsInSample;
  v12->_elementsInSample = v7;

  v9 = (AMDClient *)objc_alloc_init(MEMORY[0x24BE07A20]);
  myAMDClient = v12->_myAMDClient;
  v12->_myAMDClient = v9;

  objc_storeStrong(location, 0);
}

- (void)setElementInCoreDictionary:(id)a3 withKey:(id)a4
{
  id v5;
  id location[2];
  AMDDODMLDataProcessor *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[NSMutableDictionary setObject:forKey:](v7->_coreDictionary, "setObject:forKey:", location[0], v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (id)getCoreDictionary
{
  return self->_coreDictionary;
}

- (void)setElementsInCoreDictionary:(id)a3
{
  AMDDODMLDataProcessor *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id obj;
  uint64_t v10;
  _QWORD __b[8];
  uint64_t v12;
  id location[2];
  AMDDODMLDataProcessor *v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v10)
  {
    v6 = *(_QWORD *)__b[2];
    v7 = 0;
    v8 = v10;
    while (1)
    {
      v5 = v7;
      if (*(_QWORD *)__b[2] != v6)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(__b[1] + 8 * v7);
      v3 = v14;
      v4 = (id)objc_msgSend(location[0], "objectForKey:", v12);
      -[AMDDODMLDataProcessor setElementInCoreDictionary:withKey:](v3, "setElementInCoreDictionary:withKey:");

      ++v7;
      if (v5 + 1 >= v8)
      {
        v7 = 0;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
        if (!v8)
          break;
      }
    }
  }

  objc_storeStrong(location, 0);
}

- (id)getElementInCoreDictionary:(id)a3
{
  id v4;
  id location[2];
  AMDDODMLDataProcessor *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)-[NSMutableDictionary objectForKey:](v6->_coreDictionary, "objectForKey:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)getElementInInputDictionary:(id)a3
{
  id v4;
  id location[2];
  AMDDODMLDataProcessor *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)-[NSMutableDictionary objectForKey:](v6->_inputDictionary, "objectForKey:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)getElementInNumberInputsBounds:(id)a3
{
  id v4;
  id location[2];
  AMDDODMLDataProcessor *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)-[NSMutableDictionary objectForKey:](v6->_numberInputsBound, "objectForKey:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)getInputDictionary
{
  return self->_inputDictionary;
}

- (int64_t)getInputSize
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSMutableDictionary *obj;
  uint64_t v10;
  _QWORD __b[8];
  uint64_t v12;
  int64_t v13;
  SEL v14;
  AMDDODMLDataProcessor *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  v14 = a2;
  v13 = -1;
  memset(__b, 0, sizeof(__b));
  obj = v15->_numberInputsBound;
  v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v10)
  {
    v6 = *(_QWORD *)__b[2];
    v7 = 0;
    v8 = v10;
    while (1)
    {
      v5 = v7;
      if (*(_QWORD *)__b[2] != v6)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(__b[1] + 8 * v7);
      v3 = (id)-[NSMutableDictionary objectForKey:](v15->_numberInputsBound, "objectForKey:", v12);
      v4 = objc_msgSend(v3, "longValue");

      if (v4 < v13 || v13 == -1)
        v13 = v4;
      ++v7;
      if (v5 + 1 >= v8)
      {
        v7 = 0;
        v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
        if (!v8)
          break;
      }
    }
  }

  return v13;
}

- (id)getElementsInSampleDictionary
{
  return self->_elementsInSample;
}

- (id)processRecipe:(id *)a3 errorDomain:(id)a4
{
  unint64_t v5;
  int v6;
  id v7;
  id v8;
  id v9;
  unint64_t i;
  id location;
  id *v12;
  SEL v13;
  AMDDODMLDataProcessor *v14;
  id v15;

  v14 = self;
  v13 = a2;
  v12 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  for (i = 0; ; ++i)
  {
    v5 = i;
    if (v5 >= -[NSArray count](v14->_actionArray, "count"))
      break;
    v9 = -[NSArray objectAtIndex:](v14->_actionArray, "objectAtIndex:", i);
    v8 = (id)objc_msgSend(v9, "objectForKey:", FunctionName);
    v7 = -[AMDDODMLDataProcessor parseAndCall:withInputs:error:errorDomain:](v14, "parseAndCall:withInputs:error:errorDomain:", v8, v9, v12, location);
    if (v7)
    {
      v6 = 0;
    }
    else
    {
      v15 = 0;
      v6 = 1;
    }
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
    if (v6)
      goto LABEL_9;
  }
  v15 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
LABEL_9:
  objc_storeStrong(&location, 0);
  return v15;
}

- (id)parseAndCall:(id)a3 withInputs:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v6;
  id v7;
  id v12;
  id *v13;
  id v14;
  id location[2];
  AMDDODMLDataProcessor *v16;
  id v17;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = a5;
  v12 = 0;
  objc_storeStrong(&v12, a6);
  if ((objc_msgSend(location[0], "isEqual:", AggregateArray) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor aggregateArray:error:errorDomain:](v16, "aggregateArray:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", BindToBuffer) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor bindToBuffer:error:errorDomain:](v16, "bindToBuffer:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", CheckIfArrayEmptyAndThrowError) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor checkIfArrayEmptyAndThrowError:error:errorDomain:](v16, "checkIfArrayEmptyAndThrowError:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", CombineArray) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor combineArray:error:errorDomain:](v16, "combineArray:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", ConstantValueMathFunction) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor constantValueMathFunction:error:errorDomain:](v16, "constantValueMathFunction:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", DownSampleData) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor downSampleData:error:errorDomain:](v16, "downSampleData:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", DestroyArray) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor destroyArray:error:errorDomain:](v16, "destroyArray:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", FilterArrayOnNumber) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor filterArrayOnNumber:error:errorDomain:](v16, "filterArrayOnNumber:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", IfStatement) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor ifStatement:error:errorDomain:](v16, "ifStatement:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", GenerateHashFromInputs) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor generateHashFromInputs:error:errorDomain:](v16, "generateHashFromInputs:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", GetCurrentTime) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor getCurrentTime:error:errorDomain:](v16, "getCurrentTime:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", HashAdamIdsToIndices) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor hashAdamIdsToIndices:error:errorDomain:](v16, "hashAdamIdsToIndices:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", HashFromCoreDictionary) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor hashFromCoreDictionary:error:errorDomain:](v16, "hashFromCoreDictionary:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", InsertArray) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor insertArray:error:errorDomain:](v16, "insertArray:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", InsertRawArray) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor insertRawArray:error:errorDomain:](v16, "insertRawArray:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", PadArray) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor padArray:error:errorDomain:](v16, "padArray:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", ProcessForLoop) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor processForLoop:error:errorDomain:](v16, "processForLoop:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", RandomizeArray) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor randomizeArray:error:errorDomain:](v16, "randomizeArray:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", ReplicateArray) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor replicateArray:error:errorDomain:](v16, "replicateArray:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", RequestData) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor requestData:withUseStubs:error:errorDomain:](v16, "requestData:withUseStubs:error:errorDomain:", v14, 0, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", RequestDummyData) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor requestData:withUseStubs:error:errorDomain:](v16, "requestData:withUseStubs:error:errorDomain:", v14, 1, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", SampleFromDistribution) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor sampleFromDistribution:error:errorDomain:](v16, "sampleFromDistribution:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", SortArray) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor sortArray:error:errorDomain:](v16, "sortArray:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", SpliceArray) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor spliceArray:error:errorDomain:](v16, "spliceArray:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", StrideCopyAndSplitArray) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor strideCopyAndSplitArray:error:errorDomain:](v16, "strideCopyAndSplitArray:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", StrideArrayCopy) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor strideCopyArray:error:errorDomain:](v16, "strideCopyArray:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", TwoArrayMathFunction) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor twoArrayMathFunction:error:errorDomain:](v16, "twoArrayMathFunction:error:errorDomain:", v14, v13, v12);
  }
  else if ((objc_msgSend(location[0], "isEqual:", WindowFunction) & 1) != 0)
  {
    v17 = -[AMDDODMLDataProcessor windowFunction:error:errorDomain:](v16, "windowFunction:error:errorDomain:", v14, v13, v12);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDD1540]);
    v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", v12, 24, 0);
    *v13 = v7;
    v17 = 0;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v17;
}

- (id)processForLoopHelper:(id)a3 withNumber:(id)a4 withDictionary:(id)a5
{
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  _QWORD __b[8];
  uint64_t v30;
  id v31;
  id v32;
  id location[3];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32 = 0;
  objc_storeStrong(&v32, a4);
  v31 = 0;
  objc_storeStrong(&v31, a5);
  memset(__b, 0, sizeof(__b));
  v24 = v31;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
  if (v25)
  {
    v19 = *(_QWORD *)__b[2];
    v20 = 0;
    v21 = v25;
    while (1)
    {
      v18 = v20;
      if (*(_QWORD *)__b[2] != v19)
        objc_enumerationMutation(v24);
      v30 = *(_QWORD *)(__b[1] + 8 * v20);
      v28 = (id)objc_msgSend(v31, "objectForKey:", v30);
      v27 = (id)objc_msgSend(v28, "objectForKey:", Multiplier);
      v26 = (id)objc_msgSend(v28, "objectForKey:", Adder);
      objc_msgSend(v32, "doubleValue");
      v13 = v5;
      objc_msgSend(v27, "doubleValue");
      v12 = v6;
      objc_msgSend(v26, "doubleValue");
      v15 = location[0];
      v14 = v30;
      v17 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7 + v13 * v12);
      v16 = (id)objc_msgSend(v17, "stringValue");
      v8 = (id)objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", v14);
      v9 = location[0];
      location[0] = v8;

      objc_storeStrong(&v26, 0);
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v28, 0);
      ++v20;
      if (v18 + 1 >= v21)
      {
        v20 = 0;
        v21 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
        if (!v21)
          break;
      }
    }
  }

  v11 = location[0];
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (id)processForLoop:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[8];
  uint64_t v55;
  id v56;
  id v57;
  double v58;
  id v59;
  id v60;
  id v61;
  _QWORD v62[8];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD __b[8];
  uint64_t v69;
  id v70;
  id v71;
  id v72;
  id v73;
  unint64_t j;
  id v75;
  uint64_t i;
  id v77;
  id v78;
  id v79;
  id v80;
  int v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id *v90;
  id location[2];
  AMDDODMLDataProcessor *v92;
  id v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v92 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v90 = a4;
  v89 = 0;
  objc_storeStrong(&v89, a5);
  v88 = (id)objc_msgSend(location[0], "objectForKey:", Starting);
  v87 = (id)objc_msgSend(location[0], "objectForKey:", Ending);
  v86 = (id)objc_msgSend(location[0], "objectForKey:", StartingLikeOtherArray);
  v85 = (id)objc_msgSend(location[0], "objectForKey:", EndingLikeOtherArray);
  if (!v86)
    goto LABEL_73;
  v84 = (id)-[NSMutableDictionary objectForKey:](v92->_coreDictionary, "objectForKey:", v86);
  v83 = (id)objc_msgSend(location[0], "objectForKey:", StartingLikeOtherArrayMultiplier);
  v82 = (id)objc_msgSend(location[0], "objectForKey:", StartingLikeOtherArrayOffset);
  if (v84 && v83 && v82)
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v84, "count") * objc_msgSend(v83, "longValue")+ objc_msgSend(v82, "longValue"));
    v8 = v88;
    v88 = v7;

    v81 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v89, 47, 0);
    *v90 = v6;
    v93 = 0;
    v81 = 1;
  }
  objc_storeStrong(&v82, 0);
  objc_storeStrong(&v83, 0);
  objc_storeStrong(&v84, 0);
  if (!v81)
  {
LABEL_73:
    if (!v85)
      goto LABEL_15;
    v80 = (id)-[NSMutableDictionary objectForKey:](v92->_coreDictionary, "objectForKey:", v85);
    v79 = (id)objc_msgSend(location[0], "objectForKey:", EndingLikeOtherArrayMultiplier);
    v78 = (id)objc_msgSend(location[0], "objectForKey:", EndingLikeOtherArrayOffset);
    if (v80 && v79 && v78)
    {
      v11 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v80, "count") * objc_msgSend(v79, "longValue")+ objc_msgSend(v78, "longValue"));
      v12 = v87;
      v87 = v11;

      v81 = 0;
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x24BDD1540]);
      v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v89, 146, 0);
      *v90 = v10;
      v93 = 0;
      v81 = 1;
    }
    objc_storeStrong(&v78, 0);
    objc_storeStrong(&v79, 0);
    objc_storeStrong(&v80, 0);
    if (!v81)
    {
LABEL_15:
      v77 = (id)objc_msgSend(location[0], "objectForKey:", InsideLoop);
      for (i = (int)objc_msgSend(v88, "intValue"); ; ++i)
      {
        v46 = i;
        if (v46 >= (int)objc_msgSend(v87, "intValue"))
          break;
        v75 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", i);
        for (j = 0; ; ++j)
        {
          v45 = j;
          if (v45 >= objc_msgSend(v77, "count"))
            break;
          v73 = (id)objc_msgSend(v77, "objectAtIndex:", j);
          v72 = (id)objc_msgSend(v73, "objectForKey:", OverrideKey);
          v71 = (id)objc_msgSend(v73, "objectForKey:", OverrideNumberKeys);
          if (!v72)
          {
            v13 = objc_alloc_init(MEMORY[0x24BDBCE70]);
            v14 = v72;
            v72 = v13;

          }
          if (!v71)
          {
            v15 = objc_alloc_init(MEMORY[0x24BDBCE70]);
            v16 = v71;
            v71 = v15;

          }
          v70 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          memset(__b, 0, sizeof(__b));
          v43 = v73;
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", __b, v96, 16);
          if (v44)
          {
            v40 = *(_QWORD *)__b[2];
            v41 = 0;
            v42 = v44;
            while (1)
            {
              v39 = v41;
              if (*(_QWORD *)__b[2] != v40)
                objc_enumerationMutation(v43);
              v69 = *(_QWORD *)(__b[1] + 8 * v41);
              v67 = (id)objc_msgSend(v73, "objectForKey:", v69);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                break;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v64 = v67;
                memset(v62, 0, sizeof(v62));
                v37 = v71;
                v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", v62, v95, 16);
                if (v38)
                {
                  v34 = *(_QWORD *)v62[2];
                  v35 = 0;
                  v36 = v38;
                  while (1)
                  {
                    v33 = v35;
                    if (*(_QWORD *)v62[2] != v34)
                      objc_enumerationMutation(v37);
                    v63 = *(id *)(v62[1] + 8 * v35);
                    if ((objc_msgSend(v63, "isEqual:", v69) & 1) != 0)
                    {
                      v61 = (id)objc_msgSend(v71, "objectForKey:", v63);
                      v60 = (id)objc_msgSend(v61, "objectForKey:", Multiplier);
                      v59 = (id)objc_msgSend(v61, "objectForKey:", Adder);
                      v58 = 0.0;
                      objc_msgSend(v75, "doubleValue");
                      v58 = v17;
                      v32 = v17;
                      objc_msgSend(v60, "doubleValue");
                      v31 = v18;
                      objc_msgSend(v59, "doubleValue");
                      v58 = v19 + v32 * v31;
                      v20 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v58);
                      v21 = v64;
                      v64 = v20;

                      objc_storeStrong(&v59, 0);
                      objc_storeStrong(&v60, 0);
                      objc_storeStrong(&v61, 0);
                    }
                    ++v35;
                    if (v33 + 1 >= v36)
                    {
                      v35 = 0;
                      v36 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", v62, v95, 16);
                      if (!v36)
                        break;
                    }
                  }
                }

                objc_msgSend(v70, "setObject:forKey:", v64, v69);
                objc_storeStrong(&v64, 0);
                goto LABEL_53;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v57 = v67;
                v56 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                memset(v54, 0, sizeof(v54));
                v29 = v57;
                v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", v54, v94, 16);
                if (v30)
                {
                  v26 = *(_QWORD *)v54[2];
                  v27 = 0;
                  v28 = v30;
                  while (1)
                  {
                    v25 = v27;
                    if (*(_QWORD *)v54[2] != v26)
                      objc_enumerationMutation(v29);
                    v55 = *(_QWORD *)(v54[1] + 8 * v27);
                    v53 = -[AMDDODMLDataProcessor processForLoopHelper:withNumber:withDictionary:](v92, "processForLoopHelper:withNumber:withDictionary:", v55, v75, v72);
                    v52 = (id)objc_msgSend(v57, "objectForKey:", v55);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v51 = -[AMDDODMLDataProcessor processForLoopHelper:withNumber:withDictionary:](v92, "processForLoopHelper:withNumber:withDictionary:", v52, v75, v72);
                      objc_msgSend(v56, "setObject:forKey:", v51, v53);
                      objc_storeStrong(&v51, 0);
                    }
                    else
                    {
                      objc_msgSend(v56, "setObject:forKey:", v52, v53);
                    }
                    objc_storeStrong(&v52, 0);
                    objc_storeStrong(&v53, 0);
                    ++v27;
                    if (v25 + 1 >= v28)
                    {
                      v27 = 0;
                      v28 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", v54, v94, 16);
                      if (!v28)
                        break;
                    }
                  }
                }

                objc_msgSend(v70, "setObject:forKey:", v56, v69);
                objc_storeStrong(&v56, 0);
                objc_storeStrong(&v57, 0);
                goto LABEL_53;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v70, "setObject:forKey:", v67, v69);
                goto LABEL_53;
              }
              v22 = objc_alloc(MEMORY[0x24BDD1540]);
              v23 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v89, 147, 0);
              *v90 = v23;
              v93 = 0;
              v81 = 1;
LABEL_54:
              objc_storeStrong(&v67, 0);
              if (v81)
                goto LABEL_58;
              ++v41;
              if (v39 + 1 >= v42)
              {
                v41 = 0;
                v42 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", __b, v96, 16);
                if (!v42)
                  goto LABEL_57;
              }
            }
            v66 = v67;
            v65 = -[AMDDODMLDataProcessor processForLoopHelper:withNumber:withDictionary:](v92, "processForLoopHelper:withNumber:withDictionary:", v66, v75, v72);
            objc_msgSend(v70, "setObject:forKey:", v65, v69);
            objc_storeStrong(&v65, 0);
            objc_storeStrong(&v66, 0);
LABEL_53:
            v81 = 0;
            goto LABEL_54;
          }
LABEL_57:
          v81 = 0;
LABEL_58:

          if (!v81)
          {
            v50 = (id)objc_msgSend(v70, "objectForKey:", FunctionName);
            v49 = -[AMDDODMLDataProcessor parseAndCall:withInputs:error:errorDomain:](v92, "parseAndCall:withInputs:error:errorDomain:", v50, v70, v90, v89);
            if (v49)
            {
              v81 = 0;
            }
            else
            {
              v93 = 0;
              v81 = 1;
            }
            objc_storeStrong(&v49, 0);
            objc_storeStrong(&v50, 0);
          }
          objc_storeStrong(&v70, 0);
          objc_storeStrong(&v71, 0);
          objc_storeStrong(&v72, 0);
          objc_storeStrong(&v73, 0);
          if (v81)
            goto LABEL_66;
        }
        v81 = 0;
LABEL_66:
        objc_storeStrong(&v75, 0);
        if (v81)
          goto LABEL_69;
      }
      v93 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
      v81 = 1;
LABEL_69:
      objc_storeStrong(&v77, 0);
    }
  }
  objc_storeStrong(&v85, 0);
  objc_storeStrong(&v86, 0);
  objc_storeStrong(&v87, 0);
  objc_storeStrong(&v88, 0);
  objc_storeStrong(&v89, 0);
  objc_storeStrong(location, 0);
  return v93;
}

- (id)aggregateArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t j;
  double v19;
  double v20;
  unint64_t i;
  double v22;
  id v23;
  id v24;
  int v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id *v30;
  id location[2];
  AMDDODMLDataProcessor *v32;
  id v33;

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = a4;
  v29 = 0;
  objc_storeStrong(&v29, a5);
  v28 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v27 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  v26 = (id)objc_msgSend(location[0], "objectForKey:", AggregationMethod);
  if (v28 && v27 && v26)
  {
    v24 = (id)-[NSMutableDictionary objectForKey:](v32->_coreDictionary, "objectForKey:", v28);
    if (v24)
    {
      v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if ((objc_msgSend(v26, "isEqual:", AggregateSum) & 1) != 0)
      {
        v22 = 0.0;
        for (i = 0; i < objc_msgSend(v24, "count"); ++i)
        {
          v15 = (id)objc_msgSend(v24, "objectAtIndex:", i);
          objc_msgSend(v15, "doubleValue");
          v22 = v22 + v9;

        }
        v14 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
        objc_msgSend(v23, "addObject:");

      }
      else if ((objc_msgSend(v26, "isEqual:", AggregateAverage) & 1) != 0)
      {
        v19 = 0.0;
        for (j = 0; j < objc_msgSend(v24, "count"); ++j)
        {
          v13 = (id)objc_msgSend(v24, "objectAtIndex:", j);
          objc_msgSend(v13, "doubleValue");
          v19 = v19 + v10;

        }
        v20 = v19 / (double)(unint64_t)objc_msgSend(v24, "count");
        v12 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v20);
        objc_msgSend(v23, "addObject:");

      }
      -[NSMutableDictionary setObject:forKey:](v32->_coreDictionary, "setObject:forKey:", v23, v27);
      v33 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
      v25 = 1;
      objc_storeStrong(&v23, 0);
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x24BDD1540]);
      v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v29, 142, 0);
      *v30 = v8;
      v33 = 0;
      v25 = 1;
    }
    objc_storeStrong(&v24, 0);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v29, 141, 0);
    *v30 = v6;
    v33 = 0;
    v25 = 1;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v33;
}

- (id)bindToBuffer:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  int v11;
  NSMutableDictionary *numberInputsBound;
  id v14;
  unint64_t v15;
  int v18;
  id v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  int v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id *v31;
  id location[2];
  AMDDODMLDataProcessor *v33;
  id v34;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = a4;
  v30 = 0;
  objc_storeStrong(&v30, a5);
  v29 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v28 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  v27 = (id)objc_msgSend(location[0], "objectForKey:", ElementsInSample);
  if (v29 && v28 && v27)
  {
    v25 = (id)-[NSMutableDictionary objectForKey:](v33->_coreDictionary, "objectForKey:", v29);
    if (v25)
    {
      v15 = objc_msgSend(v25, "count");
      if (v15 >= objc_msgSend(v27, "longValue"))
      {
        v24 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
        v23 = objc_msgSend(v25, "count");
        v22 = v23 % objc_msgSend(v27, "longValue");
        v21 = (v23 - v22) / objc_msgSend(v27, "longValue");
        for (i = 0; i < v23 - v22; ++i)
        {
          v19 = (id)objc_msgSend(v25, "objectAtIndex:", i);
          v18 = 0;
          objc_msgSend(v19, "floatValue");
          v18 = v11;
          objc_msgSend(v24, "appendBytes:length:", &v18, 4);
          objc_storeStrong(&v19, 0);
        }
        numberInputsBound = v33->_numberInputsBound;
        v14 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v21);
        -[NSMutableDictionary setObject:forKey:](numberInputsBound, "setObject:forKey:");

        -[NSMutableDictionary setObject:forKey:](v33->_elementsInSample, "setObject:forKey:", v27, v28);
        -[NSMutableDictionary setObject:forKey:](v33->_inputDictionary, "setObject:forKey:", v24, v28);
        v34 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
        v26 = 1;
        objc_storeStrong(&v24, 0);
      }
      else
      {
        v9 = objc_alloc(MEMORY[0x24BDD1540]);
        v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v30, 92, 0);
        *v31 = v10;
        v34 = 0;
        v26 = 1;
      }
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x24BDD1540]);
      v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v30, 27, 0);
      *v31 = v8;
      v34 = 0;
      v26 = 1;
    }
    objc_storeStrong(&v25, 0);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v30, 38, 0);
    *v31 = v6;
    v34 = 0;
    v26 = 1;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  return v34;
}

- (id)checkIfArrayEmptyAndThrowError:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v14;
  int v15;
  id v16;
  id v17;
  id *v18;
  id location[2];
  AMDDODMLDataProcessor *v20;
  id v21;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = a4;
  v17 = 0;
  objc_storeStrong(&v17, a5);
  v16 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  if (v16)
  {
    v14 = (id)-[NSMutableDictionary objectForKey:](v20->_coreDictionary, "objectForKey:", v16);
    if (v14)
    {
      if (objc_msgSend(v14, "count"))
      {
        v21 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
      }
      else
      {
        v9 = objc_alloc(MEMORY[0x24BDD1540]);
        v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v17, 97, 0);
        *v18 = v10;
        v21 = 0;
      }
      v15 = 1;
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x24BDD1540]);
      v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v17, 98, 0);
      *v18 = v8;
      v21 = 0;
      v15 = 1;
    }
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v17, 99, 0);
    *v18 = v6;
    v21 = 0;
    v15 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v21;
}

- (id)combineArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;
  unint64_t j;
  unint64_t i;
  id v16;
  id v17;
  id v18;
  int v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id *v24;
  id location[2];
  AMDDODMLDataProcessor *v26;
  id v27;

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = a4;
  v23 = 0;
  objc_storeStrong(&v23, a5);
  v22 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v21 = (id)objc_msgSend(location[0], "objectForKey:", SecondArray);
  v20 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  if (v22 && v20 && v21)
  {
    v18 = (id)-[NSMutableDictionary objectForKey:](v26->_coreDictionary, "objectForKey:", v22);
    v17 = (id)-[NSMutableDictionary objectForKey:](v26->_coreDictionary, "objectForKey:", v21);
    if (v18 && v17)
    {
      v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      for (i = 0; i < objc_msgSend(v18, "count"); ++i)
      {
        v11 = (id)objc_msgSend(v18, "objectAtIndex:", i);
        objc_msgSend(v16, "addObject:");

      }
      for (j = 0; j < objc_msgSend(v17, "count"); ++j)
      {
        v10 = (id)objc_msgSend(v17, "objectAtIndex:", j);
        objc_msgSend(v16, "addObject:");

      }
      -[NSMutableDictionary setObject:forKey:](v26->_coreDictionary, "setObject:forKey:", v16, v20);
      v27 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
      v19 = 1;
      objc_storeStrong(&v16, 0);
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x24BDD1540]);
      v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v23, 28, 0);
      *v24 = v8;
      v27 = 0;
      v19 = 1;
    }
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v23, 39, 0);
    *v24 = v6;
    v27 = 0;
    v19 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  return v27;
}

- (id)destroyArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v12;
  int v13;
  id v14;
  id v15;
  id *v16;
  id location[2];
  AMDDODMLDataProcessor *v18;
  id v19;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = a4;
  v15 = 0;
  objc_storeStrong(&v15, a5);
  v14 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  if (v14)
  {
    v12 = (id)-[NSMutableDictionary objectForKey:](v18->_coreDictionary, "objectForKey:", v14);
    if (v12)
    {
      -[NSMutableDictionary removeObjectForKey:](v18->_coreDictionary, "removeObjectForKey:", v14);
      v19 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x24BDD1540]);
      v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v15, 37, 0);
      *v16 = v8;
      v19 = 0;
    }
    v13 = 1;
    objc_storeStrong(&v12, 0);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v15, 57, 0);
    *v16 = v6;
    v19 = 0;
    v13 = 1;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v19;
}

- (id)downSampleData:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  uint64_t v22;
  id v23;
  id v24;
  NSMutableDictionary *coreDictionary;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  id v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  BOOL v60;
  BOOL v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  id v66;
  uint64_t v67;
  _QWORD v70[8];
  uint64_t v71;
  id v72;
  id v73;
  unint64_t v74;
  uint64_t j;
  id v76;
  id v77;
  id v78;
  _QWORD v79[8];
  uint64_t v80;
  double v81;
  double v82;
  id v83;
  id v84;
  unint64_t i;
  id v86;
  id v87;
  _QWORD v88[8];
  uint64_t v89;
  id v90;
  id v91;
  id v92;
  id v93;
  _QWORD v94[8];
  uint64_t v95;
  _QWORD __b[8];
  uint64_t v97;
  int v98;
  __int128 v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id *v105;
  id location[2];
  AMDDODMLDataProcessor *v107;
  id v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v107 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v105 = a4;
  v104 = 0;
  objc_storeStrong(&v104, a5);
  v103 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v102 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  v101 = (id)objc_msgSend(location[0], "objectForKey:", DefaultRatio);
  v100 = (id)objc_msgSend(location[0], "objectForKey:", Mapping);
  *((_QWORD *)&v99 + 1) = (id)objc_msgSend(location[0], "objectForKey:", OtherAffectedVectorsOutputKeys);
  *(_QWORD *)&v99 = (id)objc_msgSend(location[0], "objectForKey:", OtherAffectedVectors);
  if (v99 == 0)
  {
    *((_QWORD *)&v99 + 1) = objc_alloc_init(MEMORY[0x24BDBCE70]);

    *(_QWORD *)&v99 = objc_alloc_init(MEMORY[0x24BDBCE70]);
LABEL_31:
    if (v103 && v102 && v100 && v101 && *((_QWORD *)&v99 + 1) && (_QWORD)v99)
    {
      v92 = -[AMDDODMLAttachmentProcessor downSampleDictionaryForKey:](v107->_attachmentsProcessor, "downSampleDictionaryForKey:", v100);
      if (v92)
      {
        v91 = (id)-[NSMutableDictionary objectForKey:](v107->_coreDictionary, "objectForKey:", v103);
        if (v91)
        {
          v90 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          memset(v88, 0, sizeof(v88));
          v50 = *((id *)&v99 + 1);
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", v88, v111, 16);
          if (v51)
          {
            v47 = *(_QWORD *)v88[2];
            v48 = 0;
            v49 = v51;
            while (1)
            {
              v46 = v48;
              if (*(_QWORD *)v88[2] != v47)
                objc_enumerationMutation(v50);
              v89 = *(_QWORD *)(v88[1] + 8 * v48);
              v87 = (id)objc_msgSend(*((id *)&v99 + 1), "objectForKey:", v89);
              v44 = v90;
              v45 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              objc_msgSend(v44, "setObject:forKey:");

              objc_storeStrong(&v87, 0);
              ++v48;
              if (v46 + 1 >= v49)
              {
                v48 = 0;
                v49 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", v88, v111, 16);
                if (!v49)
                  break;
              }
            }
          }

          v86 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          for (i = 0; ; ++i)
          {
            v43 = i;
            if (v43 >= objc_msgSend(v91, "count"))
              break;
            v84 = (id)objc_msgSend(v91, "objectAtIndex:", i);
            v83 = (id)objc_msgSend(v92, "objectForKey:", v84);
            if (!v83)
              objc_storeStrong(&v83, v101);
            v82 = 0.0;
            objc_msgSend(v83, "doubleValue");
            v82 = v21;
            v81 = 0.0;
            v81 = (double)(arc4random() % 0x80000000) / 2147483650.0;
            if (v81 >= v82)
              goto LABEL_70;
            objc_msgSend(v86, "addObject:", v84);
            memset(v79, 0, sizeof(v79));
            v41 = *((id *)&v99 + 1);
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", v79, v110, 16);
            if (v42)
            {
              v38 = *(_QWORD *)v79[2];
              v39 = 0;
              v40 = v42;
              while (1)
              {
                v37 = v39;
                if (*(_QWORD *)v79[2] != v38)
                  objc_enumerationMutation(v41);
                v80 = *(_QWORD *)(v79[1] + 8 * v39);
                v78 = (id)objc_msgSend((id)v99, "objectForKey:", v80);
                v77 = (id)objc_msgSend(*((id *)&v99 + 1), "objectForKey:", v80);
                v76 = (id)objc_msgSend(v90, "objectForKey:", v77);
                for (j = 0; ; ++j)
                {
                  v36 = j;
                  if (v36 >= objc_msgSend(v78, "longValue"))
                    break;
                  v74 = 0;
                  v34 = i;
                  v22 = objc_msgSend(v78, "longValue");
                  v74 = v34 * v22 + j;
                  v73 = (id)-[NSMutableDictionary objectForKey:](v107->_coreDictionary, "objectForKey:", v80);
                  v35 = v74;
                  if (v35 < objc_msgSend(v73, "count"))
                  {
                    v72 = (id)objc_msgSend(v73, "objectAtIndex:", v74);
                    objc_msgSend(v76, "addObject:", v72);
                    objc_storeStrong(&v72, 0);
                    v98 = 0;
                  }
                  else
                  {
                    v23 = objc_alloc(MEMORY[0x24BDD1540]);
                    v24 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v104, 25, 0);
                    *v105 = v24;
                    v108 = 0;
                    v98 = 1;
                  }
                  objc_storeStrong(&v73, 0);
                  if (v98)
                    goto LABEL_65;
                }
                v98 = 0;
LABEL_65:
                objc_storeStrong(&v76, 0);
                objc_storeStrong(&v77, 0);
                objc_storeStrong(&v78, 0);
                if (v98)
                  break;
                ++v39;
                if (v37 + 1 >= v40)
                {
                  v39 = 0;
                  v40 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", v79, v110, 16);
                  if (!v40)
                    goto LABEL_68;
                }
              }
            }
            else
            {
LABEL_68:
              v98 = 0;
            }

            if (!v98)
LABEL_70:
              v98 = 0;
            objc_storeStrong(&v83, 0);
            objc_storeStrong(&v84, 0);
            if (v98)
              goto LABEL_80;
          }
          memset(v70, 0, sizeof(v70));
          v32 = v90;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", v70, v109, 16);
          if (v33)
          {
            v29 = *(_QWORD *)v70[2];
            v30 = 0;
            v31 = v33;
            while (1)
            {
              v28 = v30;
              if (*(_QWORD *)v70[2] != v29)
                objc_enumerationMutation(v32);
              v71 = *(_QWORD *)(v70[1] + 8 * v30);
              coreDictionary = v107->_coreDictionary;
              v27 = (id)objc_msgSend(v90, "objectForKey:", v71);
              -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

              ++v30;
              if (v28 + 1 >= v31)
              {
                v30 = 0;
                v31 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", v70, v109, 16);
                if (!v31)
                  break;
              }
            }
          }

          -[NSMutableDictionary setObject:forKey:](v107->_coreDictionary, "setObject:forKey:", v86, v102);
          v108 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
          v98 = 1;
LABEL_80:
          objc_storeStrong(&v86, 0);
          objc_storeStrong(&v90, 0);
        }
        else
        {
          v19 = objc_alloc(MEMORY[0x24BDD1540]);
          v20 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v104, 29, 0);
          *v105 = v20;
          v108 = 0;
          v98 = 1;
        }
        objc_storeStrong(&v91, 0);
      }
      else
      {
        v17 = objc_alloc(MEMORY[0x24BDD1540]);
        v18 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v104, 21, 0);
        *v105 = v18;
        v108 = 0;
        v98 = 1;
      }
      objc_storeStrong(&v92, 0);
    }
    else
    {
      v15 = objc_alloc(MEMORY[0x24BDD1540]);
      v16 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v104, 40, 0);
      *v105 = v16;
      v108 = 0;
      v98 = 1;
    }
    goto LABEL_83;
  }
  if (!*((_QWORD *)&v99 + 1) || !(_QWORD)v99)
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v104, 40, 0);
    *v105 = v6;
    v108 = 0;
    v98 = 1;
    goto LABEL_83;
  }
  memset(__b, 0, sizeof(__b));
  v66 = *((id *)&v99 + 1);
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", __b, v113, 16);
  if (v67)
  {
    v63 = *(_QWORD *)__b[2];
    v64 = 0;
    v65 = v67;
    while (1)
    {
      v62 = v64;
      if (*(_QWORD *)__b[2] != v63)
        objc_enumerationMutation(v66);
      v97 = *(_QWORD *)(__b[1] + 8 * v64);
      v7 = (id)objc_msgSend((id)v99, "objectForKey:", v97);
      v61 = v7 != 0;

      if (!v61)
        break;
      v59 = (id)objc_msgSend((id)v99, "objectForKey:", v97);
      v60 = objc_msgSend(v59, "longValue") >= 1;

      if (!v60)
        break;
      ++v64;
      if (v62 + 1 >= v65)
      {
        v64 = 0;
        v65 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", __b, v113, 16);
        if (!v65)
          goto LABEL_15;
      }
    }
    v8 = objc_alloc(MEMORY[0x24BDD1540]);
    v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", v104, 40, 0);
    *v105 = v9;
    v108 = 0;
    v98 = 1;
  }
  else
  {
LABEL_15:
    v98 = 0;
  }

  if (!v98)
  {
    memset(v94, 0, sizeof(v94));
    v57 = (id)v99;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", v94, v112, 16);
    if (v58)
    {
      v54 = *(_QWORD *)v94[2];
      v55 = 0;
      v56 = v58;
      while (1)
      {
        v53 = v55;
        if (*(_QWORD *)v94[2] != v54)
          objc_enumerationMutation(v57);
        v95 = *(_QWORD *)(v94[1] + 8 * v55);
        v10 = (id)objc_msgSend(*((id *)&v99 + 1), "objectForKey:", v95);
        v52 = v10 != 0;

        if (!v52)
          break;
        v93 = (id)-[NSMutableDictionary objectForKey:](v107->_coreDictionary, "objectForKey:", v95);
        if (v93)
        {
          v98 = 0;
        }
        else
        {
          v13 = objc_alloc(MEMORY[0x24BDD1540]);
          v14 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v104, 29, 0);
          *v105 = v14;
          v108 = 0;
          v98 = 1;
        }
        objc_storeStrong(&v93, 0);
        if (v98)
          goto LABEL_30;
        ++v55;
        if (v53 + 1 >= v56)
        {
          v55 = 0;
          v56 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", v94, v112, 16);
          if (!v56)
            goto LABEL_29;
        }
      }
      v11 = objc_alloc(MEMORY[0x24BDD1540]);
      v12 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v104, 40, 0);
      *v105 = v12;
      v108 = 0;
      v98 = 1;
    }
    else
    {
LABEL_29:
      v98 = 0;
    }
LABEL_30:

    if (!v98)
      goto LABEL_31;
  }
LABEL_83:
  objc_storeStrong((id *)&v99, 0);
  objc_storeStrong((id *)&v99 + 1, 0);
  objc_storeStrong(&v100, 0);
  objc_storeStrong(&v101, 0);
  objc_storeStrong(&v102, 0);
  objc_storeStrong(&v103, 0);
  objc_storeStrong(&v104, 0);
  objc_storeStrong(location, 0);
  return v108;
}

- (id)constantValueMathFunction:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  double v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;
  id v15;
  double v16;
  double v17;
  id v18;
  id v19;
  double v20;
  double v21;
  id v22;
  id v23;
  double v24;
  double v25;
  id v26;
  id v27;
  id v28;
  id v29;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v39;
  id v40;
  id v41;
  unint64_t i;
  id v43;
  id v44;
  int v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id *v51;
  id location[2];
  AMDDODMLDataProcessor *v53;
  id v54;

  v53 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v51 = a4;
  v50 = 0;
  objc_storeStrong(&v50, a5);
  v49 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v48 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  v47 = (id)objc_msgSend(location[0], "objectForKey:", ConstantValue);
  v46 = (id)objc_msgSend(location[0], "objectForKey:", Operation);
  if (!v49
    || !v48
    || !v47
    || !v46
    || (objc_msgSend(v47, "doubleValue"), v5 == 0.0)
    && ((objc_msgSend(v46, "isEqual:", Modulo) & 1) != 0 || (objc_msgSend(v46, "isEqual:", Division) & 1) != 0))
  {
    v6 = objc_alloc(MEMORY[0x24BDD1540]);
    v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", v50, 86, 0);
    *v51 = v7;
    v54 = 0;
    v45 = 1;
    goto LABEL_31;
  }
  v44 = (id)-[NSMutableDictionary objectForKey:](v53->_coreDictionary, "objectForKey:", v49);
  if (!v44)
  {
    v8 = objc_alloc(MEMORY[0x24BDD1540]);
    v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", v50, 85, 0);
    *v51 = v9;
    v54 = 0;
    v45 = 1;
    goto LABEL_30;
  }
  v43 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = 0; ; ++i)
  {
    v36 = i;
    if (v36 >= objc_msgSend(v44, "count"))
      break;
    v41 = (id)objc_msgSend(v44, "objectAtIndex:", i);
    v40 = 0;
    if ((objc_msgSend(v46, "isEqual:", Modulo) & 1) != 0)
    {
      v35 = objc_msgSend(v41, "longValue");
      v39 = v35 % objc_msgSend(v47, "longValue");
      v10 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v39);
      v11 = v40;
      v40 = v10;

    }
    else if ((objc_msgSend(v46, "isEqual:", Division) & 1) != 0)
    {
      objc_msgSend(v41, "doubleValue");
      v34 = v12;
      objc_msgSend(v47, "doubleValue");
      v14 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v34 / v13);
      v15 = v40;
      v40 = v14;

    }
    else if ((objc_msgSend(v46, "isEqual:", Multiplication) & 1) != 0)
    {
      objc_msgSend(v41, "doubleValue");
      v33 = v16;
      objc_msgSend(v47, "doubleValue");
      v18 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v33 * v17);
      v19 = v40;
      v40 = v18;

    }
    else if ((objc_msgSend(v46, "isEqual:", Addition) & 1) != 0)
    {
      objc_msgSend(v41, "doubleValue");
      v32 = v20;
      objc_msgSend(v47, "doubleValue");
      v22 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v32 + v21);
      v23 = v40;
      v40 = v22;

    }
    else
    {
      if ((objc_msgSend(v46, "isEqual:", Subtraction) & 1) == 0)
      {
        v28 = objc_alloc(MEMORY[0x24BDD1540]);
        v29 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v50, 83, 0);
        *v51 = v29;
        v54 = 0;
        v45 = 1;
        goto LABEL_26;
      }
      objc_msgSend(v41, "doubleValue");
      v31 = v24;
      objc_msgSend(v47, "doubleValue");
      v26 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v31 - v25);
      v27 = v40;
      v40 = v26;

    }
    objc_msgSend(v43, "addObject:", v40);
    v45 = 0;
LABEL_26:
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v41, 0);
    if (v45)
      goto LABEL_29;
  }
  -[NSMutableDictionary setObject:forKey:](v53->_coreDictionary, "setObject:forKey:", v43, v48);
  v54 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
  v45 = 1;
LABEL_29:
  objc_storeStrong(&v43, 0);
LABEL_30:
  objc_storeStrong(&v44, 0);
LABEL_31:
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(location, 0);
  return v54;
}

- (id)filterArrayOnNumber:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  NSMutableDictionary *coreDictionary;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  unint64_t v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  id v66;
  uint64_t v67;
  BOOL v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  id v73;
  uint64_t v74;
  id v75;
  BOOL v76;
  BOOL v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  id v82;
  uint64_t v83;
  _QWORD v86[8];
  uint64_t v87;
  id v88;
  id v89;
  unint64_t v90;
  uint64_t j;
  id v92;
  id v93;
  id v94;
  _QWORD v95[8];
  uint64_t v96;
  uint64_t v97;
  id v98;
  unint64_t i;
  id v100;
  id v101;
  _QWORD v102[8];
  uint64_t v103;
  id v104;
  id v105;
  id v106;
  _QWORD v107[8];
  uint64_t v108;
  _QWORD __b[8];
  uint64_t v110;
  int v111;
  __int128 v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id *v118;
  id location[2];
  AMDDODMLDataProcessor *v120;
  id v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v120 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v118 = a4;
  v117 = 0;
  objc_storeStrong(&v117, a5);
  v116 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v115 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  v114 = (id)objc_msgSend(location[0], "objectForKey:", FilterOperation);
  v113 = (id)objc_msgSend(location[0], "objectForKey:", ConstantValue);
  *((_QWORD *)&v112 + 1) = (id)objc_msgSend(location[0], "objectForKey:", OtherAffectedVectorsOutputKeys);
  *(_QWORD *)&v112 = (id)objc_msgSend(location[0], "objectForKey:", OtherAffectedVectors);
  if (v112 == 0)
  {
    *((_QWORD *)&v112 + 1) = objc_alloc_init(MEMORY[0x24BDBCE70]);

    *(_QWORD *)&v112 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  }
  else
  {
    if (!*((_QWORD *)&v112 + 1) || !(_QWORD)v112)
    {
      v5 = objc_alloc(MEMORY[0x24BDD1540]);
      v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v117, 102, 0);
      *v118 = v6;
      v121 = 0;
      v111 = 1;
      goto LABEL_95;
    }
    memset(__b, 0, sizeof(__b));
    v82 = *((id *)&v112 + 1);
    v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", __b, v126, 16);
    if (v83)
    {
      v79 = *(_QWORD *)__b[2];
      v80 = 0;
      v81 = v83;
      while (1)
      {
        v78 = v80;
        if (*(_QWORD *)__b[2] != v79)
          objc_enumerationMutation(v82);
        v110 = *(_QWORD *)(__b[1] + 8 * v80);
        v7 = (id)objc_msgSend((id)v112, "objectForKey:", v110);
        v77 = v7 != 0;

        if (!v77)
          break;
        v75 = (id)objc_msgSend((id)v112, "objectForKey:", v110);
        v76 = objc_msgSend(v75, "longValue") >= 1;

        if (!v76)
          break;
        ++v80;
        if (v78 + 1 >= v81)
        {
          v80 = 0;
          v81 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", __b, v126, 16);
          if (!v81)
            goto LABEL_15;
        }
      }
      v8 = objc_alloc(MEMORY[0x24BDD1540]);
      v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", v117, 102, 0);
      *v118 = v9;
      v121 = 0;
      v111 = 1;
    }
    else
    {
LABEL_15:
      v111 = 0;
    }

    if (v111)
      goto LABEL_95;
    memset(v107, 0, sizeof(v107));
    v73 = (id)v112;
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", v107, v125, 16);
    if (v74)
    {
      v70 = *(_QWORD *)v107[2];
      v71 = 0;
      v72 = v74;
      while (1)
      {
        v69 = v71;
        if (*(_QWORD *)v107[2] != v70)
          objc_enumerationMutation(v73);
        v108 = *(_QWORD *)(v107[1] + 8 * v71);
        v10 = (id)objc_msgSend(*((id *)&v112 + 1), "objectForKey:", v108);
        v68 = v10 != 0;

        if (!v68)
          break;
        v106 = (id)-[NSMutableDictionary objectForKey:](v120->_coreDictionary, "objectForKey:", v108);
        if (v106)
        {
          v111 = 0;
        }
        else
        {
          v13 = objc_alloc(MEMORY[0x24BDD1540]);
          v14 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v117, 101, 0);
          *v118 = v14;
          v121 = 0;
          v111 = 1;
        }
        objc_storeStrong(&v106, 0);
        if (v111)
          goto LABEL_30;
        ++v71;
        if (v69 + 1 >= v72)
        {
          v71 = 0;
          v72 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", v107, v125, 16);
          if (!v72)
            goto LABEL_29;
        }
      }
      v11 = objc_alloc(MEMORY[0x24BDD1540]);
      v12 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v117, 102, 0);
      *v118 = v12;
      v121 = 0;
      v111 = 1;
    }
    else
    {
LABEL_29:
      v111 = 0;
    }
LABEL_30:

    if (v111)
      goto LABEL_95;
  }
  if (!v116 || !v115 || !v114 || !v113 || !*((_QWORD *)&v112 + 1) || !(_QWORD)v112)
  {
    v15 = objc_alloc(MEMORY[0x24BDD1540]);
    v16 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v117, 102, 0);
    *v118 = v16;
    v121 = 0;
    v111 = 1;
    goto LABEL_95;
  }
  v105 = (id)-[NSMutableDictionary objectForKey:](v120->_coreDictionary, "objectForKey:", v116);
  if (!v105)
  {
    v17 = objc_alloc(MEMORY[0x24BDD1540]);
    v18 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v117, 101, 0);
    *v118 = v18;
    v121 = 0;
    v111 = 1;
    goto LABEL_94;
  }
  v104 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  memset(v102, 0, sizeof(v102));
  v66 = *((id *)&v112 + 1);
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", v102, v124, 16);
  if (v67)
  {
    v63 = *(_QWORD *)v102[2];
    v64 = 0;
    v65 = v67;
    while (1)
    {
      v62 = v64;
      if (*(_QWORD *)v102[2] != v63)
        objc_enumerationMutation(v66);
      v103 = *(_QWORD *)(v102[1] + 8 * v64);
      v101 = (id)objc_msgSend(*((id *)&v112 + 1), "objectForKey:", v103);
      v60 = v104;
      v61 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v60, "setObject:forKey:");

      objc_storeStrong(&v101, 0);
      ++v64;
      if (v62 + 1 >= v65)
      {
        v64 = 0;
        v65 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", v102, v124, 16);
        if (!v65)
          break;
      }
    }
  }

  v100 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = 0; ; ++i)
  {
    v59 = i;
    if (v59 >= objc_msgSend(v105, "count"))
      break;
    v98 = (id)objc_msgSend(v105, "objectAtIndex:", i);
    v97 = 0;
    if ((objc_msgSend(v114, "isEqual:", GreaterThan) & 1) != 0)
    {
      objc_msgSend(v98, "doubleValue");
      v58 = v19;
      objc_msgSend(v113, "doubleValue");
      v21 = v20;
      v22 = v58;
      if (v58 > v21)
        v97 = 1;
    }
    else if ((objc_msgSend(v114, "isEqual:", LessThan) & 1) != 0)
    {
      objc_msgSend(v98, "doubleValue");
      v57 = v23;
      objc_msgSend(v113, "doubleValue");
      v25 = v24;
      v22 = v57;
      if (v57 < v25)
        v97 = 1;
    }
    else if ((objc_msgSend(v114, "isEqual:", NotEqualTo) & 1) != 0)
    {
      objc_msgSend(v98, "doubleValue");
      v56 = v26;
      objc_msgSend(v113, "doubleValue");
      v28 = v27;
      v22 = v56;
      if (v56 != v28)
        v97 = 1;
    }
    else
    {
      if ((objc_msgSend(v114, "isEqual:", IsEqualTo) & 1) == 0)
      {
        v32 = objc_alloc(MEMORY[0x24BDD1540]);
        v33 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v117, 100, 0);
        *v118 = v33;
        v121 = 0;
        v111 = 1;
        goto LABEL_84;
      }
      objc_msgSend(v98, "doubleValue");
      v55 = v29;
      objc_msgSend(v113, "doubleValue");
      v31 = v30;
      v22 = v55;
      if (v55 == v31)
        v97 = 1;
    }
    if (!v97)
      goto LABEL_83;
    objc_msgSend(v100, "addObject:", v98, v22);
    memset(v95, 0, sizeof(v95));
    v53 = *((id *)&v112 + 1);
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", v95, v123, 16);
    if (v54)
    {
      v50 = *(_QWORD *)v95[2];
      v51 = 0;
      v52 = v54;
      while (1)
      {
        v49 = v51;
        if (*(_QWORD *)v95[2] != v50)
          objc_enumerationMutation(v53);
        v96 = *(_QWORD *)(v95[1] + 8 * v51);
        v94 = (id)objc_msgSend((id)v112, "objectForKey:", v96);
        v93 = (id)objc_msgSend(*((id *)&v112 + 1), "objectForKey:", v96);
        v92 = (id)objc_msgSend(v104, "objectForKey:", v93);
        for (j = 0; ; ++j)
        {
          v48 = j;
          if (v48 >= objc_msgSend(v94, "longValue"))
            break;
          v90 = 0;
          v46 = i;
          v34 = objc_msgSend(v94, "longValue");
          v90 = v46 * v34 + j;
          v89 = (id)-[NSMutableDictionary objectForKey:](v120->_coreDictionary, "objectForKey:", v96);
          v47 = v90;
          if (v47 < objc_msgSend(v89, "count"))
          {
            v88 = (id)objc_msgSend(v89, "objectAtIndex:", v90);
            objc_msgSend(v92, "addObject:", v88);
            objc_storeStrong(&v88, 0);
            v111 = 0;
          }
          else
          {
            v35 = objc_alloc(MEMORY[0x24BDD1540]);
            v36 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v117, 105, 0);
            *v118 = v36;
            v121 = 0;
            v111 = 1;
          }
          objc_storeStrong(&v89, 0);
          if (v111)
            goto LABEL_78;
        }
        v111 = 0;
LABEL_78:
        objc_storeStrong(&v92, 0);
        objc_storeStrong(&v93, 0);
        objc_storeStrong(&v94, 0);
        if (v111)
          break;
        ++v51;
        if (v49 + 1 >= v52)
        {
          v51 = 0;
          v52 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", v95, v123, 16);
          if (!v52)
            goto LABEL_81;
        }
      }
    }
    else
    {
LABEL_81:
      v111 = 0;
    }

    if (!v111)
LABEL_83:
      v111 = 0;
LABEL_84:
    objc_storeStrong(&v98, 0);
    if (v111)
      goto LABEL_93;
  }
  memset(v86, 0, sizeof(v86));
  v44 = v104;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", v86, v122, 16);
  if (v45)
  {
    v41 = *(_QWORD *)v86[2];
    v42 = 0;
    v43 = v45;
    while (1)
    {
      v40 = v42;
      if (*(_QWORD *)v86[2] != v41)
        objc_enumerationMutation(v44);
      v87 = *(_QWORD *)(v86[1] + 8 * v42);
      coreDictionary = v120->_coreDictionary;
      v39 = (id)objc_msgSend(v104, "objectForKey:", v87);
      -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

      ++v42;
      if (v40 + 1 >= v43)
      {
        v42 = 0;
        v43 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", v86, v122, 16);
        if (!v43)
          break;
      }
    }
  }

  -[NSMutableDictionary setObject:forKey:](v120->_coreDictionary, "setObject:forKey:", v100, v115);
  v121 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
  v111 = 1;
LABEL_93:
  objc_storeStrong(&v100, 0);
  objc_storeStrong(&v104, 0);
LABEL_94:
  objc_storeStrong(&v105, 0);
LABEL_95:
  objc_storeStrong((id *)&v112, 0);
  objc_storeStrong((id *)&v112 + 1, 0);
  objc_storeStrong(&v113, 0);
  objc_storeStrong(&v114, 0);
  objc_storeStrong(&v115, 0);
  objc_storeStrong(&v116, 0);
  objc_storeStrong(&v117, 0);
  objc_storeStrong(location, 0);
  return v121;
}

- (id)getCurrentTime:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v11;
  id v12;
  id v13;
  id v14;
  double v15;
  mach_timebase_info info;
  id v17;
  id v18[2];
  id location[2];
  AMDDODMLDataProcessor *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18[1] = a4;
  v18[0] = 0;
  objc_storeStrong(v18, a5);
  v17 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  info = 0;
  mach_timebase_info(&info);
  v5 = mach_absolute_time();
  LODWORD(v7) = info.denom;
  LODWORD(v6) = info.numer;
  v15 = (double)v5 * ((double)v6 / (1000000000.0 * (double)v7));
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = v14;
  v12 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
  objc_msgSend(v11, "addObject:");

  -[NSMutableDictionary setObject:forKey:](v20->_coreDictionary, "setObject:forKey:", v14, v17);
  v13 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
  objc_storeStrong(location, 0);
  return v13;
}

- (id)hashFromCoreDictionary:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  unint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  id v18;
  id v19;
  unint64_t j;
  id v21;
  unint64_t i;
  id v23;
  id v24;
  id v25;
  id v26;
  int v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id *v34;
  id location[2];
  AMDDODMLDataProcessor *v36;
  id v37;

  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v34 = a4;
  v33 = 0;
  objc_storeStrong(&v33, a5);
  v32 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v31 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  v30 = (id)objc_msgSend(location[0], "objectForKey:", InputArrayMappingKey);
  v29 = (id)objc_msgSend(location[0], "objectForKey:", InputArrayMappingValue);
  v28 = (id)objc_msgSend(location[0], "objectForKey:", DefaultValue);
  if (v32 && v31 && v30 && v29)
  {
    v26 = (id)-[NSMutableDictionary objectForKey:](v36->_coreDictionary, "objectForKey:", v32);
    v25 = (id)-[NSMutableDictionary objectForKey:](v36->_coreDictionary, "objectForKey:", v30);
    v24 = (id)-[NSMutableDictionary objectForKey:](v36->_coreDictionary, "objectForKey:", v29);
    if (v26 && v25 && v24)
    {
      v15 = objc_msgSend(v25, "count");
      if (v15 == objc_msgSend(v24, "count"))
      {
        v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        for (i = 0; i < objc_msgSend(v25, "count"); ++i)
        {
          v14 = (id)objc_msgSend(v24, "objectAtIndex:", i);
          v13 = (id)objc_msgSend(v25, "objectAtIndex:", i);
          objc_msgSend(v23, "setObject:forKey:", v14);

        }
        v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        for (j = 0; ; ++j)
        {
          v12 = j;
          if (v12 >= objc_msgSend(v26, "count"))
            break;
          v19 = (id)objc_msgSend(v26, "objectAtIndex:", j);
          v18 = (id)objc_msgSend(v23, "objectForKey:", v19);
          if (v18)
          {
            objc_msgSend(v21, "addObject:", v18);
          }
          else if (v28)
          {
            objc_msgSend(v21, "addObject:", v28);
          }
          objc_storeStrong(&v18, 0);
          objc_storeStrong(&v19, 0);
        }
        -[NSMutableDictionary setObject:forKey:](v36->_coreDictionary, "setObject:forKey:", v21, v31);
        v37 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
        v27 = 1;
        objc_storeStrong(&v21, 0);
        objc_storeStrong(&v23, 0);
      }
      else
      {
        v9 = objc_alloc(MEMORY[0x24BDD1540]);
        v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v33, 130, 0);
        *v34 = v10;
        v37 = 0;
        v27 = 1;
      }
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x24BDD1540]);
      v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v33, 129, 0);
      *v34 = v8;
      v37 = 0;
      v27 = 1;
    }
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v33, 128, 0);
    *v34 = v6;
    v37 = 0;
    v27 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  return v37;
}

- (id)hashAdamIdsToIndices:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  unint64_t v12;
  id v15;
  id v16;
  unint64_t i;
  id v18;
  id v19;
  id v20;
  int v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id *v27;
  id location[2];
  AMDDODMLDataProcessor *v29;
  id v30;

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = a4;
  v26 = 0;
  objc_storeStrong(&v26, a5);
  v25 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v24 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  v23 = (id)objc_msgSend(location[0], "objectForKey:", Mapping);
  v22 = (id)objc_msgSend(location[0], "objectForKey:", DefaultValue);
  if (v25 && v24 && v23)
  {
    v20 = -[AMDDODMLAttachmentProcessor hashMapForKey:](v29->_attachmentsProcessor, "hashMapForKey:", v23);
    if (v20)
    {
      v19 = (id)-[NSMutableDictionary objectForKey:](v29->_coreDictionary, "objectForKey:", v25);
      if (v19)
      {
        v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        for (i = 0; ; ++i)
        {
          v12 = i;
          if (v12 >= objc_msgSend(v19, "count"))
            break;
          v16 = (id)objc_msgSend(v19, "objectAtIndex:", i);
          v15 = (id)objc_msgSend(v20, "objectForKey:", v16);
          if (v15)
          {
            objc_msgSend(v18, "addObject:", v15);
          }
          else if (v22)
          {
            objc_msgSend(v18, "addObject:", v22);
          }
          objc_storeStrong(&v15, 0);
          objc_storeStrong(&v16, 0);
        }
        -[NSMutableDictionary setObject:forKey:](v29->_coreDictionary, "setObject:forKey:", v18, v24);
        v30 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
        v21 = 1;
        objc_storeStrong(&v18, 0);
      }
      else
      {
        v9 = objc_alloc(MEMORY[0x24BDD1540]);
        v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v26, 30, 0);
        *v27 = v10;
        v30 = 0;
        v21 = 1;
      }
      objc_storeStrong(&v19, 0);
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x24BDD1540]);
      v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v26, 22, 0);
      *v27 = v8;
      v30 = 0;
      v21 = 1;
    }
    objc_storeStrong(&v20, 0);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v26, 41, 0);
    *v27 = v6;
    v30 = 0;
    v21 = 1;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v30;
}

- (id)ifStatement:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSMutableDictionary *coreDictionary;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  unsigned int v37;
  id v38;
  id v39;
  char v40;
  char v41;
  id v42;
  char v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  unsigned int v52;
  id v53;
  id v54;
  char v55;
  char v56;
  id v57;
  char v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  id v65;
  id v66;
  _QWORD v67[8];
  id v68;
  id v69;
  id v70;
  _QWORD __b[8];
  id v72;
  id v73;
  id v74;
  unsigned int v75;
  id v76;
  char v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  unsigned int v86;
  id v87;
  char v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  id v96;
  uint64_t i;
  uint64_t v98;
  id v99;
  uint64_t v100;
  id v101;
  int v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id *v110;
  id location[2];
  AMDDODMLDataProcessor *v112;
  id v113;
  id v114;
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x24BDAC8D0];
  v112 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v110 = a4;
  v109 = 0;
  objc_storeStrong(&v109, a5);
  v108 = (id)objc_msgSend(location[0], "objectForKey:", IfStatement);
  v107 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  v106 = (id)objc_msgSend(location[0], "objectForKey:", AllowedIterationNumber);
  v105 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v104 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v103 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!v108 || !v107)
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v109, 151, 0);
    *v110 = v6;
    v113 = 0;
    v102 = 1;
    goto LABEL_100;
  }
  if (!v106)
  {
    v106 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 10000);

  }
  v101 = 0;
  v100 = 0;
  while (1)
  {
    if (objc_msgSend(v103, "count") || (v62 = 0, !v101))
    {
      v61 = v100;
      v62 = v61 < objc_msgSend(v106, "longValue");
    }
    if (!v62)
      break;
    ++v100;
    v99 = (id)objc_msgSend(v108, "copy");
    v98 = 0;
    v98 = objc_msgSend(v105, "count") - 1;
    for (i = 0; i < v98; ++i)
    {
      v96 = (id)objc_msgSend(v105, "objectAtIndex:", i);
      v95 = (id)objc_msgSend(v99, "objectForKey:", Statements);
      v7 = (id)objc_msgSend(v95, "objectAtIndex:", (int)objc_msgSend(v96, "intValue"));
      v8 = v99;
      v99 = v7;

      objc_storeStrong(&v95, 0);
      objc_storeStrong(&v96, 0);
    }
    v94 = 0;
    v94 = objc_msgSend(v105, "count");
    if (v94 <= 0)
      goto LABEL_30;
    v93 = 0;
    v59 = (id)objc_msgSend(v105, "lastObject");
    v60 = (int)objc_msgSend(v59, "intValue");

    v93 = v60;
    v92 = (id)objc_msgSend(v99, "objectForKey:", Statements);
    v91 = 0;
    v91 = objc_msgSend(v92, "count");
    if (v93 < v91)
    {
      v9 = (id)objc_msgSend(v92, "objectAtIndex:", v93);
      v10 = v99;
      v99 = v9;

      v102 = 0;
    }
    else
    {
      objc_msgSend(v105, "removeLastObject");
      objc_msgSend(v104, "removeLastObject");
      v90 = (id)objc_msgSend(v103, "lastObject");
      objc_msgSend(v103, "removeLastObject");
      v89 = 0;
      v89 = objc_msgSend(v103, "count");
      if (v89 <= 0)
      {
        objc_storeStrong(&v101, v90);
      }
      else
      {
        v88 = 0;
        v57 = (id)objc_msgSend(v103, "lastObject");
        v58 = objc_msgSend(v57, "BOOLValue");

        v88 = v58 & 1;
        v87 = (id)objc_msgSend(v104, "lastObject");
        objc_msgSend(v103, "removeLastObject");
        if ((objc_msgSend(v87, "isEqual:", andKey) & 1) != 0)
        {
          v56 = 0;
          if ((v88 & 1) != 0)
            v56 = objc_msgSend(v90, "BOOLValue");
          v88 = v56 & 1;
        }
        else if ((objc_msgSend(v87, "isEqual:", orKey) & 1) != 0)
        {
          v55 = 1;
          if ((v88 & 1) == 0)
            v55 = objc_msgSend(v90, "BOOLValue");
          v88 = v55 & 1;
        }
        v49 = v103;
        v50 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v88 & 1);
        objc_msgSend(v49, "addObject:");

        v86 = 0;
        v51 = (id)objc_msgSend(v105, "lastObject");
        v52 = objc_msgSend(v51, "intValue") + 1;

        v86 = v52;
        objc_msgSend(v105, "removeLastObject");
        v53 = v105;
        v54 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v86);
        objc_msgSend(v53, "addObject:");

        objc_storeStrong(&v87, 0);
      }
      v102 = 2;
      objc_storeStrong(&v90, 0);
    }
    objc_storeStrong(&v92, 0);
    if (!v102)
    {
LABEL_30:
      v85 = (id)objc_msgSend(v99, "objectForKey:", Operation);
      if ((objc_msgSend(v85, "isEqual:", NAKey) & 1) == 0)
      {
        if ((objc_msgSend(v85, "isEqual:", andKey) & 1) != 0)
        {
          objc_msgSend(v103, "addObject:", &unk_2507A8998);
        }
        else if ((objc_msgSend(v85, "isEqual:", orKey) & 1) != 0)
        {
          objc_msgSend(v103, "addObject:", &unk_2507A89B0);
        }
        objc_msgSend(v104, "addObject:", v85);
        objc_msgSend(v105, "addObject:", &unk_2507A89B0);
        goto LABEL_67;
      }
      v84 = (id)objc_msgSend(v99, "objectForKey:", Statement);
      v83 = (id)objc_msgSend(v84, "objectForKey:", InputArray);
      v82 = (id)-[NSMutableDictionary objectForKey:](v112->_coreDictionary, "objectForKey:", v83);
      v81 = (id)objc_msgSend(v84, "objectForKey:", ComparisonOp);
      v80 = (id)objc_msgSend(v84, "objectForKey:", ComparisonNumber);
      v79 = 0;
      if ((objc_msgSend(v81, "isEqual:", HasLengthEqualTo) & 1) != 0)
      {
        v48 = objc_msgSend(v82, "count");
        if (v48 == (int)objc_msgSend(v80, "intValue"))
          objc_storeStrong(&v79, &unk_2507A8998);
        else
          objc_storeStrong(&v79, &unk_2507A89B0);
LABEL_50:
        if (objc_msgSend(v103, "count"))
        {
          v77 = 0;
          v42 = (id)objc_msgSend(v103, "lastObject");
          v43 = objc_msgSend(v42, "BOOLValue");

          v77 = v43 & 1;
          v76 = (id)objc_msgSend(v104, "lastObject");
          objc_msgSend(v103, "removeLastObject");
          if ((objc_msgSend(v76, "isEqual:", andKey) & 1) != 0)
          {
            v41 = 0;
            if ((v77 & 1) != 0)
              v41 = objc_msgSend(v79, "BOOLValue");
            v77 = v41 & 1;
          }
          else if ((objc_msgSend(v76, "isEqual:", orKey) & 1) != 0)
          {
            v40 = 1;
            if ((v77 & 1) == 0)
              v40 = objc_msgSend(v79, "BOOLValue");
            v77 = v40 & 1;
          }
          v34 = v103;
          v35 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v77 & 1);
          objc_msgSend(v34, "addObject:");

          v36 = (id)objc_msgSend(v105, "lastObject");
          v37 = objc_msgSend(v36, "intValue") + 1;

          v75 = v37;
          objc_msgSend(v105, "removeLastObject");
          v38 = v105;
          v39 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v37);
          objc_msgSend(v38, "addObject:");

          objc_storeStrong(&v76, 0);
        }
        else
        {
          objc_storeStrong(&v101, v79);
        }
        objc_storeStrong(&v79, 0);
        objc_storeStrong(&v80, 0);
        objc_storeStrong(&v81, 0);
        objc_storeStrong(&v82, 0);
        objc_storeStrong(&v83, 0);
        objc_storeStrong(&v84, 0);
LABEL_67:
        objc_storeStrong(&v85, 0);
        v102 = 0;
        goto LABEL_68;
      }
      v78 = (id)objc_msgSend(v82, "firstObject");
      if ((objc_msgSend(v81, "isEqual:", IsEqualTo) & 1) != 0)
      {
        objc_msgSend(v78, "doubleValue");
        v47 = v11;
        objc_msgSend(v80, "doubleValue");
        if (v47 == v12)
          goto LABEL_47;
LABEL_48:
        objc_storeStrong(&v79, &unk_2507A89B0);
      }
      else if ((objc_msgSend(v81, "isEqual:", GreaterThan) & 1) != 0)
      {
        objc_msgSend(v78, "doubleValue");
        v46 = v13;
        objc_msgSend(v80, "doubleValue");
        if (v46 <= v14)
          goto LABEL_48;
LABEL_47:
        objc_storeStrong(&v79, &unk_2507A8998);
      }
      else
      {
        if ((objc_msgSend(v81, "isEqual:", LessThan) & 1) != 0)
        {
          objc_msgSend(v78, "doubleValue");
          v45 = v15;
          objc_msgSend(v80, "doubleValue");
          if (v45 < v16)
            goto LABEL_47;
          goto LABEL_48;
        }
        if ((objc_msgSend(v81, "isEqual:", NotEqualTo) & 1) != 0)
        {
          objc_msgSend(v78, "doubleValue");
          v44 = v17;
          objc_msgSend(v80, "doubleValue");
          if (v44 != v18)
            goto LABEL_47;
          goto LABEL_48;
        }
      }
      objc_storeStrong(&v78, 0);
      goto LABEL_50;
    }
LABEL_68:
    objc_storeStrong(&v99, 0);
  }
  v74 = (id)objc_msgSend(location[0], "objectForKey:", IfEffect);
  v73 = (id)objc_msgSend(location[0], "objectForKey:", ElseEffect);
  if ((objc_msgSend(v101, "BOOLValue") & 1) != 0 && v74)
  {
    memset(__b, 0, sizeof(__b));
    v32 = v74;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", __b, v116, 16);
    if (v33)
    {
      v29 = *(_QWORD *)__b[2];
      v30 = 0;
      v31 = v33;
      while (1)
      {
        v28 = v30;
        if (*(_QWORD *)__b[2] != v29)
          objc_enumerationMutation(v32);
        v72 = *(id *)(__b[1] + 8 * v30);
        v70 = (id)objc_msgSend(v72, "objectForKey:", FunctionName);
        v69 = -[AMDDODMLDataProcessor parseAndCall:withInputs:error:errorDomain:](v112, "parseAndCall:withInputs:error:errorDomain:", v70, v72, v110, v109);
        if (v69)
        {
          v102 = 0;
        }
        else
        {
          v113 = 0;
          v102 = 1;
        }
        objc_storeStrong(&v69, 0);
        objc_storeStrong(&v70, 0);
        if (v102)
          break;
        ++v30;
        if (v28 + 1 >= v31)
        {
          v30 = 0;
          v31 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", __b, v116, 16);
          if (!v31)
            goto LABEL_81;
        }
      }
    }
    else
    {
LABEL_81:
      v102 = 0;
    }

    if (!v102)
      goto LABEL_98;
  }
  else
  {
    if ((objc_msgSend(v101, "BOOLValue") & 1) != 0 || !v73)
      goto LABEL_98;
    memset(v67, 0, sizeof(v67));
    v26 = v73;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", v67, v115, 16);
    if (v27)
    {
      v23 = *(_QWORD *)v67[2];
      v24 = 0;
      v25 = v27;
      while (1)
      {
        v22 = v24;
        if (*(_QWORD *)v67[2] != v23)
          objc_enumerationMutation(v26);
        v68 = *(id *)(v67[1] + 8 * v24);
        v66 = (id)objc_msgSend(v68, "objectForKey:", FunctionName);
        v65 = -[AMDDODMLDataProcessor parseAndCall:withInputs:error:errorDomain:](v112, "parseAndCall:withInputs:error:errorDomain:", v66, v68, v110, v109);
        if (v65)
        {
          v102 = 0;
        }
        else
        {
          v113 = 0;
          v102 = 1;
        }
        objc_storeStrong(&v65, 0);
        objc_storeStrong(&v66, 0);
        if (v102)
          break;
        ++v24;
        if (v22 + 1 >= v25)
        {
          v24 = 0;
          v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", v67, v115, 16);
          if (!v25)
            goto LABEL_96;
        }
      }
    }
    else
    {
LABEL_96:
      v102 = 0;
    }

    if (!v102)
    {
LABEL_98:
      coreDictionary = v112->_coreDictionary;
      v114 = v101;
      v21 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v114, 1);
      -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

      v113 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
      v102 = 1;
    }
  }
  objc_storeStrong(&v73, 0);
  objc_storeStrong(&v74, 0);
  objc_storeStrong(&v101, 0);
LABEL_100:
  objc_storeStrong(&v103, 0);
  objc_storeStrong(&v104, 0);
  objc_storeStrong(&v105, 0);
  objc_storeStrong(&v106, 0);
  objc_storeStrong(&v107, 0);
  objc_storeStrong(&v108, 0);
  objc_storeStrong(&v109, 0);
  objc_storeStrong(location, 0);
  return v113;
}

- (id)generateHashFromInputs:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD __b[9];
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  unint64_t i;
  id v31;
  int v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id *v37;
  id location[2];
  AMDDODMLDataProcessor *v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = a4;
  v36 = 0;
  objc_storeStrong(&v36, a5);
  v35 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v34 = (id)objc_msgSend(location[0], "objectForKey:", Mapping);
  v33 = (id)objc_msgSend(location[0], "objectForKey:", MaxHashValue);
  if (v35 && v34 && v33)
  {
    v31 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    for (i = 0; ; ++i)
    {
      v22 = i;
      if (v22 >= objc_msgSend(v35, "count"))
        break;
      v29 = (id)objc_msgSend(v35, "objectAtIndex:", i);
      v28 = (id)-[NSMutableDictionary objectForKey:](v39->_coreDictionary, "objectForKey:", v29);
      if (v28)
      {
        objc_msgSend(v31, "addObjectsFromArray:", v28);
        v32 = 0;
      }
      else
      {
        v7 = objc_alloc(MEMORY[0x24BDD1540]);
        v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v36, 110, 0);
        *v37 = v8;
        v40 = 0;
        v32 = 1;
      }
      objc_storeStrong(&v28, 0);
      objc_storeStrong(&v29, 0);
      if (v32)
        goto LABEL_21;
    }
    v21 = objc_msgSend(v31, "count");
    if (v21 <= objc_msgSend(v33, "longValue"))
    {
      v27 = 0;
      v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      memset(__b, 0, 0x40uLL);
      v19 = v31;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
      if (v20)
      {
        v16 = *(_QWORD *)__b[2];
        v17 = 0;
        v18 = v20;
        while (1)
        {
          v15 = v17;
          if (*(_QWORD *)__b[2] != v16)
            objc_enumerationMutation(v19);
          __b[8] = *(_QWORD *)(__b[1] + 8 * v17);
          v13 = v26;
          v14 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v27);
          objc_msgSend(v13, "setObject:forKey:");

          ++v27;
          ++v17;
          if (v15 + 1 >= v18)
          {
            v17 = 0;
            v18 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
            if (!v18)
              break;
          }
        }
      }

      v11 = -[AMDDODMLAttachmentProcessor setHashMap:forKey:](v39->_attachmentsProcessor, "setHashMap:forKey:", v26, v34);
      v40 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
      v32 = 1;
      objc_storeStrong(&v26, 0);
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x24BDD1540]);
      v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v36, 112, 0);
      *v37 = v10;
      v40 = 0;
      v32 = 1;
    }
LABEL_21:
    objc_storeStrong(&v31, 0);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v36, 111, 0);
    *v37 = v6;
    v40 = 0;
    v32 = 1;
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v40;
}

- (id)insertArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t i;
  id v15;
  int v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id *v25;
  id location[2];
  AMDDODMLDataProcessor *v27;
  id v28;

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = a4;
  v24 = 0;
  objc_storeStrong(&v24, a5);
  v23 = (id)objc_msgSend(location[0], "objectForKey:", ConstantValue);
  v22 = (id)objc_msgSend(location[0], "objectForKey:", FinalLength);
  v21 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  v20 = (id)objc_msgSend(location[0], "objectForKey:", FinalLengthLikeOtherArray);
  if (!v20)
    goto LABEL_10;
  v19 = (id)-[NSMutableDictionary objectForKey:](v27->_coreDictionary, "objectForKey:", v20);
  v18 = (id)objc_msgSend(location[0], "objectForKey:", FinalLengthLikeOtherArrayMultiplier);
  v17 = (id)objc_msgSend(location[0], "objectForKey:", FinalLengthLikeOtherArrayOffset);
  if (v19 && v18 && v17)
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v19, "count") * objc_msgSend(v18, "longValue")+ objc_msgSend(v17, "longValue"));
    v8 = v22;
    v22 = v7;

    v16 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v24, 42, 0);
    *v25 = v6;
    v28 = 0;
    v16 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  if (!v16)
  {
LABEL_10:
    if (v21 && v22 && v23)
    {
      v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      for (i = 0; i < objc_msgSend(v22, "longValue"); ++i)
        objc_msgSend(v15, "addObject:", v23);
      -[NSMutableDictionary setObject:forKey:](v27->_coreDictionary, "setObject:forKey:", v15, v21);
      v28 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
      v16 = 1;
      objc_storeStrong(&v15, 0);
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x24BDD1540]);
      v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v24, 42, 0);
      *v25 = v10;
      v28 = 0;
      v16 = 1;
    }
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
  return v28;
}

- (id)insertRawArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v10;
  id v11;
  id v12;
  id *v13;
  id location[2];
  AMDDODMLDataProcessor *v15;
  id v16;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v11 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v10 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  if (v10 && v11)
  {
    -[NSMutableDictionary setObject:forKey:](v15->_coreDictionary, "setObject:forKey:", v11, v10);
    v16 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v12, 150, 0);
    *v13 = v6;
    v16 = 0;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v16;
}

- (id)padArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  unint64_t j;
  uint64_t i;
  id v22;
  id v23;
  int v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id *v35;
  id location[2];
  AMDDODMLDataProcessor *v37;
  id v38;

  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = a4;
  v34 = 0;
  objc_storeStrong(&v34, a5);
  v33 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v32 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  v31 = (id)objc_msgSend(location[0], "objectForKey:", PaddingValue);
  v30 = (id)objc_msgSend(location[0], "objectForKey:", PadEnd);
  v29 = (id)objc_msgSend(location[0], "objectForKey:", FinalLength);
  v28 = (id)objc_msgSend(location[0], "objectForKey:", FinalLengthLikeOtherArray);
  if (!v28)
    goto LABEL_15;
  v27 = (id)-[NSMutableDictionary objectForKey:](v37->_coreDictionary, "objectForKey:", v28);
  v26 = (id)objc_msgSend(location[0], "objectForKey:", FinalLengthLikeOtherArrayMultiplier);
  v25 = (id)objc_msgSend(location[0], "objectForKey:", FinalLengthLikeOtherArrayOffset);
  if (v27 && v26 && v25)
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v27, "count") * objc_msgSend(v26, "longValue")+ objc_msgSend(v25, "longValue"));
    v8 = v29;
    v29 = v7;

    v24 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v34, 43, 0);
    *v35 = v6;
    v38 = 0;
    v24 = 1;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  if (!v24)
  {
LABEL_15:
    if (v33
      && v32
      && v31
      && v30
      && v29
      && ((objc_msgSend(v30, "isEqual:", &unk_2507A89B0) & 1) != 0
       || (objc_msgSend(v30, "isEqual:", &unk_2507A8998) & 1) != 0))
    {
      v23 = (id)-[NSMutableDictionary objectForKey:](v37->_coreDictionary, "objectForKey:", v33);
      if (v23)
      {
        v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v16 = objc_msgSend(v29, "longValue");
        v15 = v16 - objc_msgSend(v23, "count");
        if ((objc_msgSend(v30, "isEqual:", &unk_2507A89B0) & 1) != 0)
        {
          for (i = 0; i < v15; ++i)
            objc_msgSend(v22, "addObject:", v31);
        }
        for (j = 0; j < objc_msgSend(v23, "count"); ++j)
        {
          v14 = (id)objc_msgSend(v23, "objectAtIndex:", j);
          objc_msgSend(v22, "addObject:");

        }
        if ((objc_msgSend(v30, "isEqual:", &unk_2507A8998) & 1) != 0)
        {
          for (k = 0; k < v15; ++k)
            objc_msgSend(v22, "addObject:", v31);
        }
        -[NSMutableDictionary setObject:forKey:](v37->_coreDictionary, "setObject:forKey:", v22, v32);
        v38 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
        v24 = 1;
        objc_storeStrong(&v22, 0);
      }
      else
      {
        v11 = objc_alloc(MEMORY[0x24BDD1540]);
        v12 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v34, 31, 0);
        *v35 = v12;
        v38 = 0;
        v24 = 1;
      }
      objc_storeStrong(&v23, 0);
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x24BDD1540]);
      v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v34, 43, 0);
      *v35 = v10;
      v38 = 0;
      v24 = 1;
    }
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  return v38;
}

- (id)randomizeArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  NSMutableDictionary *coreDictionary;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  id v52;
  uint64_t v53;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  BOOL v62;
  BOOL v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  id v68;
  uint64_t v69;
  _QWORD v72[8];
  uint64_t v73;
  id v74;
  id v75;
  unint64_t v76;
  uint64_t m;
  id v78;
  id v79;
  id v80;
  _QWORD v81[8];
  uint64_t v82;
  uint64_t v83;
  unint64_t k;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t j;
  uint64_t v89;
  unint64_t i;
  id v91;
  id v92;
  _QWORD v93[8];
  uint64_t v94;
  id v95;
  id v96;
  id v97;
  _QWORD v98[8];
  uint64_t v99;
  _QWORD __b[8];
  uint64_t v101;
  int v102;
  __int128 v103;
  id v104;
  id v105;
  id v106;
  id *v107;
  id location[2];
  AMDDODMLDataProcessor *v109;
  id v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v109 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v107 = a4;
  v106 = 0;
  objc_storeStrong(&v106, a5);
  v105 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v104 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  *((_QWORD *)&v103 + 1) = (id)objc_msgSend(location[0], "objectForKey:", OtherAffectedVectorsOutputKeys);
  *(_QWORD *)&v103 = (id)objc_msgSend(location[0], "objectForKey:", OtherAffectedVectors);
  if (v103 == 0)
  {
    *((_QWORD *)&v103 + 1) = objc_alloc_init(MEMORY[0x24BDBCE70]);

    *(_QWORD *)&v103 = objc_alloc_init(MEMORY[0x24BDBCE70]);
LABEL_31:
    if (v105 && v104)
    {
      v96 = (id)-[NSMutableDictionary objectForKey:](v109->_coreDictionary, "objectForKey:", v105);
      if (v96)
      {
        v95 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        memset(v93, 0, sizeof(v93));
        v52 = *((id *)&v103 + 1);
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", v93, v113, 16);
        if (v53)
        {
          v49 = *(_QWORD *)v93[2];
          v50 = 0;
          v51 = v53;
          while (1)
          {
            v48 = v50;
            if (*(_QWORD *)v93[2] != v49)
              objc_enumerationMutation(v52);
            v94 = *(_QWORD *)(v93[1] + 8 * v50);
            v92 = (id)objc_msgSend(*((id *)&v103 + 1), "objectForKey:", v94);
            v46 = v95;
            v47 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v46, "setObject:forKey:");

            objc_storeStrong(&v92, 0);
            ++v50;
            if (v48 + 1 >= v51)
            {
              v50 = 0;
              v51 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", v93, v113, 16);
              if (!v51)
                break;
            }
          }
        }

        v91 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        for (i = 0; i < objc_msgSend(v96, "count"); ++i)
        {
          v45 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", i);
          objc_msgSend(v91, "addObject:");

        }
        v89 = objc_msgSend(v91, "count");
        for (j = 0; j < v89; ++j)
        {
          v87 = v89 - j;
          v86 = arc4random() % (v89 - j) + j;
          objc_msgSend(v91, "exchangeObjectAtIndex:withObjectAtIndex:", j, v86);
        }
        v85 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        for (k = 0; ; ++k)
        {
          v44 = k;
          if (v44 >= objc_msgSend(v96, "count"))
            break;
          v83 = 0;
          v38 = (id)objc_msgSend(v91, "objectAtIndex:", k);
          v39 = objc_msgSend(v38, "longValue");

          v83 = v39;
          v40 = v85;
          v41 = (id)objc_msgSend(v96, "objectAtIndex:", v39);
          objc_msgSend(v40, "addObject:");

          memset(v81, 0, sizeof(v81));
          v42 = *((id *)&v103 + 1);
          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", v81, v112, 16);
          if (v43)
          {
            v35 = *(_QWORD *)v81[2];
            v36 = 0;
            v37 = v43;
            while (1)
            {
              v34 = v36;
              if (*(_QWORD *)v81[2] != v35)
                objc_enumerationMutation(v42);
              v82 = *(_QWORD *)(v81[1] + 8 * v36);
              v80 = (id)objc_msgSend((id)v103, "objectForKey:", v82);
              v79 = (id)objc_msgSend(*((id *)&v103 + 1), "objectForKey:", v82);
              v78 = (id)objc_msgSend(v95, "objectForKey:", v79);
              for (m = 0; ; ++m)
              {
                v33 = m;
                if (v33 >= objc_msgSend(v80, "longValue"))
                  break;
                v76 = 0;
                v31 = v83;
                v19 = objc_msgSend(v80, "longValue");
                v76 = v31 * v19 + m;
                v75 = (id)-[NSMutableDictionary objectForKey:](v109->_coreDictionary, "objectForKey:", v82);
                v32 = v76;
                if (v32 < objc_msgSend(v75, "count"))
                {
                  v74 = (id)objc_msgSend(v75, "objectAtIndex:", v76);
                  objc_msgSend(v78, "addObject:", v74);
                  objc_storeStrong(&v74, 0);
                  v102 = 0;
                }
                else
                {
                  v20 = objc_alloc(MEMORY[0x24BDD1540]);
                  v21 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v106, 26, 0);
                  *v107 = v21;
                  v110 = 0;
                  v102 = 1;
                }
                objc_storeStrong(&v75, 0);
                if (v102)
                  goto LABEL_62;
              }
              v102 = 0;
LABEL_62:
              objc_storeStrong(&v78, 0);
              objc_storeStrong(&v79, 0);
              objc_storeStrong(&v80, 0);
              if (v102)
                break;
              ++v36;
              if (v34 + 1 >= v37)
              {
                v36 = 0;
                v37 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", v81, v112, 16);
                if (!v37)
                  goto LABEL_65;
              }
            }
          }
          else
          {
LABEL_65:
            v102 = 0;
          }

          if (v102)
            goto LABEL_75;
        }
        memset(v72, 0, sizeof(v72));
        v29 = v95;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", v72, v111, 16);
        if (v30)
        {
          v26 = *(_QWORD *)v72[2];
          v27 = 0;
          v28 = v30;
          while (1)
          {
            v25 = v27;
            if (*(_QWORD *)v72[2] != v26)
              objc_enumerationMutation(v29);
            v73 = *(_QWORD *)(v72[1] + 8 * v27);
            coreDictionary = v109->_coreDictionary;
            v24 = (id)objc_msgSend(v95, "objectForKey:", v73);
            -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

            ++v27;
            if (v25 + 1 >= v28)
            {
              v27 = 0;
              v28 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", v72, v111, 16);
              if (!v28)
                break;
            }
          }
        }

        -[NSMutableDictionary setObject:forKey:](v109->_coreDictionary, "setObject:forKey:", v85, v104);
        v110 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
        v102 = 1;
LABEL_75:
        objc_storeStrong(&v85, 0);
        objc_storeStrong(&v91, 0);
        objc_storeStrong(&v95, 0);
      }
      else
      {
        v17 = objc_alloc(MEMORY[0x24BDD1540]);
        v18 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v106, 32, 0);
        *v107 = v18;
        v110 = 0;
        v102 = 1;
      }
      objc_storeStrong(&v96, 0);
    }
    else
    {
      v15 = objc_alloc(MEMORY[0x24BDD1540]);
      v16 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v106, 44, 0);
      *v107 = v16;
      v110 = 0;
      v102 = 1;
    }
    goto LABEL_77;
  }
  if (!*((_QWORD *)&v103 + 1) || !(_QWORD)v103)
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v106, 44, 0);
    *v107 = v6;
    v110 = 0;
    v102 = 1;
    goto LABEL_77;
  }
  memset(__b, 0, sizeof(__b));
  v68 = *((id *)&v103 + 1);
  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", __b, v115, 16);
  if (v69)
  {
    v65 = *(_QWORD *)__b[2];
    v66 = 0;
    v67 = v69;
    while (1)
    {
      v64 = v66;
      if (*(_QWORD *)__b[2] != v65)
        objc_enumerationMutation(v68);
      v101 = *(_QWORD *)(__b[1] + 8 * v66);
      v7 = (id)objc_msgSend((id)v103, "objectForKey:", v101);
      v63 = v7 != 0;

      if (!v63)
        break;
      v61 = (id)objc_msgSend((id)v103, "objectForKey:", v101);
      v62 = objc_msgSend(v61, "longValue") >= 1;

      if (!v62)
        break;
      ++v66;
      if (v64 + 1 >= v67)
      {
        v66 = 0;
        v67 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", __b, v115, 16);
        if (!v67)
          goto LABEL_15;
      }
    }
    v8 = objc_alloc(MEMORY[0x24BDD1540]);
    v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", v106, 44, 0);
    *v107 = v9;
    v110 = 0;
    v102 = 1;
  }
  else
  {
LABEL_15:
    v102 = 0;
  }

  if (!v102)
  {
    memset(v98, 0, sizeof(v98));
    v59 = (id)v103;
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", v98, v114, 16);
    if (v60)
    {
      v56 = *(_QWORD *)v98[2];
      v57 = 0;
      v58 = v60;
      while (1)
      {
        v55 = v57;
        if (*(_QWORD *)v98[2] != v56)
          objc_enumerationMutation(v59);
        v99 = *(_QWORD *)(v98[1] + 8 * v57);
        v10 = (id)objc_msgSend(*((id *)&v103 + 1), "objectForKey:", v99);
        v54 = v10 != 0;

        if (!v54)
          break;
        v97 = (id)-[NSMutableDictionary objectForKey:](v109->_coreDictionary, "objectForKey:", v99);
        if (v97)
        {
          v102 = 0;
        }
        else
        {
          v13 = objc_alloc(MEMORY[0x24BDD1540]);
          v14 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v106, 44, 0);
          *v107 = v14;
          v110 = 0;
          v102 = 1;
        }
        objc_storeStrong(&v97, 0);
        if (v102)
          goto LABEL_30;
        ++v57;
        if (v55 + 1 >= v58)
        {
          v57 = 0;
          v58 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", v98, v114, 16);
          if (!v58)
            goto LABEL_29;
        }
      }
      v11 = objc_alloc(MEMORY[0x24BDD1540]);
      v12 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v106, 44, 0);
      *v107 = v12;
      v110 = 0;
      v102 = 1;
    }
    else
    {
LABEL_29:
      v102 = 0;
    }
LABEL_30:

    if (!v102)
      goto LABEL_31;
  }
LABEL_77:
  objc_storeStrong((id *)&v103, 0);
  objc_storeStrong((id *)&v103 + 1, 0);
  objc_storeStrong(&v104, 0);
  objc_storeStrong(&v105, 0);
  objc_storeStrong(&v106, 0);
  objc_storeStrong(location, 0);
  return v110;
}

- (id)replicateArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  unint64_t j;
  uint64_t i;
  id v15;
  id v16;
  int v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id *v22;
  id location[2];
  AMDDODMLDataProcessor *v24;
  id v25;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a4;
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v20 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v19 = (id)objc_msgSend(location[0], "objectForKey:", NumberOfCopies);
  v18 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  if (v20 && v18 && v19)
  {
    v16 = (id)-[NSMutableDictionary objectForKey:](v24->_coreDictionary, "objectForKey:", v20);
    if (v16)
    {
      v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      for (i = 0; i < objc_msgSend(v19, "longValue"); ++i)
      {
        for (j = 0; j < objc_msgSend(v16, "count"); ++j)
        {
          v10 = (id)objc_msgSend(v16, "objectAtIndex:", j);
          objc_msgSend(v15, "addObject:");

        }
      }
      -[NSMutableDictionary setObject:forKey:](v24->_coreDictionary, "setObject:forKey:", v15, v18);
      v25 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
      v17 = 1;
      objc_storeStrong(&v15, 0);
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x24BDD1540]);
      v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v21, 33, 0);
      *v22 = v8;
      v25 = 0;
      v17 = 1;
    }
    objc_storeStrong(&v16, 0);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v21, 45, 0);
    *v22 = v6;
    v25 = 0;
    v17 = 1;
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v25;
}

- (id)requestData:(id)a3 withUseStubs:(int64_t)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSMutableDictionary *v34;
  id v35;
  NSMutableDictionary *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  uint64_t v43;
  NSMutableDictionary *coreDictionary;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  id v70;
  uint64_t v71;
  char v72;
  id v76;
  id v77;
  id v78;
  id v79;
  _QWORD v80[8];
  uint64_t v81;
  id v82;
  id v83;
  id v84;
  id v85;
  _QWORD v86[8];
  uint64_t v87;
  id v88;
  id v89;
  id v90;
  _QWORD v91[8];
  id v92;
  id v93;
  _QWORD v94[8];
  uint64_t v95;
  id v96;
  id v97;
  id v98;
  _QWORD __b[8];
  uint64_t v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  char v106;
  id v107;
  int i;
  id v109;
  id v110;
  int v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id *v122;
  int64_t v123;
  id location[2];
  AMDDODMLDataProcessor *v125;
  id v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x24BDAC8D0];
  v125 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v123 = a4;
  v122 = a5;
  v121 = 0;
  objc_storeStrong(&v121, a6);
  v120 = (id)objc_msgSend(location[0], "objectForKey:", FeatureName);
  v119 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  v118 = (id)objc_msgSend(location[0], "objectForKey:", Domain);
  v117 = (id)objc_msgSend(location[0], "objectForKey:", CustomDescriptor);
  v116 = (id)objc_msgSend(location[0], "objectForKey:", SchemaVersion);
  v115 = (id)objc_msgSend(location[0], "objectForKey:", KeySuffix);
  v114 = (id)objc_msgSend(location[0], "objectForKey:", ValueSuffix);
  v113 = (id)objc_msgSend(location[0], "objectForKey:", DictOfArraysPrefix);
  v112 = (id)objc_msgSend(location[0], "objectForKey:", IterateOverNumbers);
  if (v120 && v119 && v118)
  {
    if (!v115 || !v114)
    {
      objc_storeStrong(&v115, DefaultKeySuffix);
      objc_storeStrong(&v114, DefaultValueSuffix);
    }
    if (!v113)
    {
      v113 = (id)objc_msgSend(v119, "stringByAppendingString:", Underscore);

    }
    v8 = objc_alloc(MEMORY[0x24BE07A28]);
    v110 = (id)objc_msgSend(v8, "initWithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:andSchemaVersion:", v120, 0, 0, v118, v117, v116);
    if (!v110)
    {
      v9 = objc_alloc(MEMORY[0x24BDD1540]);
      v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v121, 63, 0);
      *v122 = v10;
      v126 = 0;
      v111 = 1;
LABEL_119:
      objc_storeStrong(&v110, 0);
      goto LABEL_120;
    }
    v109 = 0;
    if (v123)
    {
      v11 = (id)-[AMDClient getFeatureStub:](v125->_myAMDClient, "getFeatureStub:", v110);
      v12 = v109;
      v109 = v11;

    }
    else
    {
      for (i = 0; i < 3; ++i)
      {
        v13 = (id)-[AMDClient getFeature:](v125->_myAMDClient, "getFeature:", v110);
        v14 = v109;
        v109 = v13;

        v106 = 0;
        v72 = 0;
        if (v109)
        {
          v107 = (id)objc_msgSend(v109, "objectForKey:", *MEMORY[0x24BE07A10]);
          v106 = 1;
          v72 = objc_msgSend(v107, "isEqual:", *MEMORY[0x24BE07A18]);
        }
        if ((v106 & 1) != 0)

        if ((v72 & 1) != 0)
          break;
      }
    }
    if (!v109)
    {
      v15 = objc_alloc(MEMORY[0x24BDD1540]);
      v16 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v121, 64, 0);
      *v122 = v16;
      v126 = 0;
      v111 = 1;
LABEL_118:
      objc_storeStrong(&v109, 0);
      goto LABEL_119;
    }
    v105 = (id)objc_msgSend(v109, "objectForKey:", *MEMORY[0x24BE07A10]);
    if ((objc_msgSend(v105, "isEqual:", *MEMORY[0x24BE07A18]) & 1) == 0)
    {
      v17 = objc_alloc(MEMORY[0x24BDD1540]);
      v18 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v121, 65, 0);
      *v122 = v18;
      v126 = 0;
      v111 = 1;
LABEL_117:
      objc_storeStrong(&v105, 0);
      goto LABEL_118;
    }
    v104 = (id)objc_msgSend(v109, "objectForKey:", *MEMORY[0x24BE07A08]);
    if (!v104)
    {
      v19 = objc_alloc(MEMORY[0x24BDD1540]);
      v20 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v121, 66, 0);
      *v122 = v20;
      v126 = 0;
      v111 = 1;
LABEL_116:
      objc_storeStrong(&v104, 0);
      goto LABEL_117;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v103 = v104;
      -[NSMutableDictionary setObject:forKey:](v125->_coreDictionary, "setObject:forKey:", v103, v119);
      v126 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
      v111 = 1;
      objc_storeStrong(&v103, 0);
      goto LABEL_116;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v31 = objc_alloc(MEMORY[0x24BDD1540]);
      v32 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v121, 108, 0);
      *v122 = v32;
      v126 = 0;
      v111 = 1;
      goto LABEL_116;
    }
    v102 = v104;
    v101 = 0;
    memset(__b, 0, sizeof(__b));
    v70 = v102;
    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", __b, v131, 16);
    if (v71)
    {
      v67 = *(_QWORD *)__b[2];
      v68 = 0;
      v69 = v71;
      while (1)
      {
        v66 = v68;
        if (*(_QWORD *)__b[2] != v67)
          objc_enumerationMutation(v70);
        v100 = *(_QWORD *)(__b[1] + 8 * v68);
        v98 = (id)objc_msgSend(v102, "objectForKey:", v100);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v101)
          {
            objc_storeStrong(&v101, IsAnArray);
LABEL_53:
            v111 = 0;
            goto LABEL_54;
          }
          if ((objc_msgSend(v101, "isEqual:", IsAnArray) & 1) != 0)
            goto LABEL_53;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!v101)
            {
              objc_storeStrong(&v101, IsANumber);
              goto LABEL_53;
            }
            if ((objc_msgSend(v101, "isEqual:", IsANumber) & 1) != 0)
              goto LABEL_53;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v23 = objc_alloc(MEMORY[0x24BDD1540]);
              v24 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v121, 108, 0);
              *v122 = v24;
              v126 = 0;
              v111 = 1;
              goto LABEL_54;
            }
            if (!v101)
            {
              objc_storeStrong(&v101, IsADictionary);
              goto LABEL_53;
            }
            if ((objc_msgSend(v101, "isEqual:", IsADictionary) & 1) != 0)
              goto LABEL_53;
          }
        }
        v21 = objc_alloc(MEMORY[0x24BDD1540]);
        v22 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v121, 107, 0);
        *v122 = v22;
        v126 = 0;
        v111 = 1;
LABEL_54:
        objc_storeStrong(&v98, 0);
        if (v111)
          goto LABEL_58;
        ++v68;
        if (v66 + 1 >= v69)
        {
          v68 = 0;
          v69 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", __b, v131, 16);
          if (!v69)
            break;
        }
      }
    }
    v111 = 0;
LABEL_58:

    if (v111)
    {
LABEL_113:
      objc_storeStrong(&v101, 0);
      objc_storeStrong(&v102, 0);
      if (!v111)
      {
        v126 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
        v111 = 1;
      }
      goto LABEL_116;
    }
    if ((objc_msgSend(v101, "isEqual:", IsANumber) & 1) != 0)
    {
      v97 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v96 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if (v112 && (objc_msgSend(v112, "isEqual:", IterateOverNumbers) & 1) != 0)
      {
        memset(v94, 0, sizeof(v94));
        v64 = v102;
        v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", v94, v130, 16);
        if (v65)
        {
          v61 = *(_QWORD *)v94[2];
          v62 = 0;
          v63 = v65;
          while (1)
          {
            v60 = v62;
            if (*(_QWORD *)v94[2] != v61)
              objc_enumerationMutation(v64);
            v95 = *(_QWORD *)(v94[1] + 8 * v62);
            objc_msgSend(v97, "addObject:", v95);
            v93 = (id)objc_msgSend(v102, "objectForKey:", v95);
            objc_msgSend(v96, "addObject:", v93);
            objc_storeStrong(&v93, 0);
            ++v62;
            if (v60 + 1 >= v63)
            {
              v62 = 0;
              v63 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", v94, v130, 16);
              if (!v63)
                break;
            }
          }
        }

      }
      else
      {
        memset(v91, 0, sizeof(v91));
        v58 = v102;
        v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", v91, v129, 16);
        if (v59)
        {
          v55 = *(_QWORD *)v91[2];
          v56 = 0;
          v57 = v59;
          while (1)
          {
            v54 = v56;
            if (*(_QWORD *)v91[2] != v55)
              objc_enumerationMutation(v58);
            v92 = *(id *)(v91[1] + 8 * v56);
            v52 = v97;
            v53 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v92, "longLongValue"));
            objc_msgSend(v52, "addObject:");

            v90 = (id)objc_msgSend(v102, "objectForKey:", v92);
            objc_msgSend(v96, "addObject:", v90);
            objc_storeStrong(&v90, 0);
            ++v56;
            if (v54 + 1 >= v57)
            {
              v56 = 0;
              v57 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", v91, v129, 16);
              if (!v57)
                break;
            }
          }
        }

      }
      v89 = (id)objc_msgSend(v119, "stringByAppendingString:", v115);
      v88 = (id)objc_msgSend(v119, "stringByAppendingString:", v114);
      -[NSMutableDictionary setObject:forKey:](v125->_coreDictionary, "setObject:forKey:", v97, v89);
      -[NSMutableDictionary setObject:forKey:](v125->_coreDictionary, "setObject:forKey:", v96, v88);
      objc_storeStrong(&v88, 0);
      objc_storeStrong(&v89, 0);
      objc_storeStrong(&v96, 0);
      objc_storeStrong(&v97, 0);
LABEL_112:
      v111 = 0;
      goto LABEL_113;
    }
    if ((objc_msgSend(v101, "isEqual:", IsAnArray) & 1) != 0)
    {
      memset(v86, 0, sizeof(v86));
      v50 = v102;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", v86, v128, 16);
      if (v51)
      {
        v47 = *(_QWORD *)v86[2];
        v48 = 0;
        v49 = v51;
        while (1)
        {
          v46 = v48;
          if (*(_QWORD *)v86[2] != v47)
            objc_enumerationMutation(v50);
          v87 = *(_QWORD *)(v86[1] + 8 * v48);
          v85 = (id)objc_msgSend(v113, "stringByAppendingString:", v87);
          coreDictionary = v125->_coreDictionary;
          v45 = (id)objc_msgSend(v102, "objectForKey:", v87);
          -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

          objc_storeStrong(&v85, 0);
          ++v48;
          if (v46 + 1 >= v49)
          {
            v48 = 0;
            v49 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", v86, v128, 16);
            if (!v49)
              break;
          }
        }
      }

      goto LABEL_112;
    }
    if ((objc_msgSend(v101, "isEqual:", IsADictionary) & 1) == 0)
    {
      v29 = objc_alloc(MEMORY[0x24BDD1540]);
      v30 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v121, 108, 0);
      *v122 = v30;
      v126 = 0;
      v111 = 1;
      goto LABEL_113;
    }
    v84 = (id)objc_msgSend(location[0], "objectForKey:", SubKeyDictOfDicts);
    if (!v84)
    {
      v25 = objc_alloc(MEMORY[0x24BDD1540]);
      v26 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v121, 62, 0);
      *v122 = v26;
      v126 = 0;
      v111 = 1;
      goto LABEL_109;
    }
    v83 = (id)objc_msgSend(location[0], "objectForKey:", SubKeyForSkippingTypes);
    v82 = (id)objc_msgSend(location[0], "objectForKey:", TypesToSkip);
    memset(v80, 0, sizeof(v80));
    v42 = v102;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", v80, v127, 16);
    if (!v43)
    {
LABEL_105:
      v111 = 0;
LABEL_106:

      if (!v111)
        v111 = 0;
      objc_storeStrong(&v82, 0);
      objc_storeStrong(&v83, 0);
LABEL_109:
      objc_storeStrong(&v84, 0);
      if (v111)
        goto LABEL_113;
      goto LABEL_112;
    }
    v39 = *(_QWORD *)v80[2];
    v40 = 0;
    v41 = v43;
    while (1)
    {
      v38 = v40;
      if (*(_QWORD *)v80[2] != v39)
        objc_enumerationMutation(v42);
      v81 = *(_QWORD *)(v80[1] + 8 * v40);
      v79 = (id)objc_msgSend(v102, "objectForKey:", v81);
      if (!v83 && !v82)
        break;
      if (v83 && v82)
      {
        v77 = (id)objc_msgSend(v79, "objectForKey:", v83);
        if ((objc_msgSend(v82, "containsObject:", v77) & 1) == 0)
        {
          v76 = (id)objc_msgSend(v113, "stringByAppendingString:", v81);
          v34 = v125->_coreDictionary;
          v35 = (id)objc_msgSend(v79, "objectForKey:", v84);
          -[NSMutableDictionary setObject:forKey:](v34, "setObject:forKey:");

          objc_storeStrong(&v76, 0);
        }
        objc_storeStrong(&v77, 0);
        goto LABEL_101;
      }
      v27 = objc_alloc(MEMORY[0x24BDD1540]);
      v28 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v121, 62, 0);
      *v122 = v28;
      v126 = 0;
      v111 = 1;
LABEL_102:
      objc_storeStrong(&v79, 0);
      if (v111)
        goto LABEL_106;
      ++v40;
      if (v38 + 1 >= v41)
      {
        v40 = 0;
        v41 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", v80, v127, 16);
        if (!v41)
          goto LABEL_105;
      }
    }
    v78 = (id)objc_msgSend(v113, "stringByAppendingString:", v81);
    v36 = v125->_coreDictionary;
    v37 = (id)objc_msgSend(v79, "objectForKey:", v84);
    -[NSMutableDictionary setObject:forKey:](v36, "setObject:forKey:");

    objc_storeStrong(&v78, 0);
LABEL_101:
    v111 = 0;
    goto LABEL_102;
  }
  v6 = objc_alloc(MEMORY[0x24BDD1540]);
  v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", v121, 62, 0);
  *v122 = v7;
  v126 = 0;
  v111 = 1;
LABEL_120:
  objc_storeStrong(&v112, 0);
  objc_storeStrong(&v113, 0);
  objc_storeStrong(&v114, 0);
  objc_storeStrong(&v115, 0);
  objc_storeStrong(&v116, 0);
  objc_storeStrong(&v117, 0);
  objc_storeStrong(&v118, 0);
  objc_storeStrong(&v119, 0);
  objc_storeStrong(&v120, 0);
  objc_storeStrong(&v121, 0);
  objc_storeStrong(location, 0);
  return v126;
}

- (id)sampleFromDistribution:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  id v16;
  id v17;
  double v18;
  id v19;
  BOOL v20;
  id v21;
  id v22;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  double v31;
  int i;
  id v33;
  id v34;
  int v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id *v44;
  id location[2];
  AMDDODMLDataProcessor *v46;
  id v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v44 = a4;
  v43 = 0;
  objc_storeStrong(&v43, a5);
  v42 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  v41 = (id)objc_msgSend(location[0], "objectForKey:", Mapping);
  v40 = (id)objc_msgSend(location[0], "objectForKey:", NumNegSamps);
  v39 = (id)objc_msgSend(location[0], "objectForKey:", NumNegSampsLikeOtherArray);
  if (!v39)
    goto LABEL_10;
  v38 = (id)-[NSMutableDictionary objectForKey:](v46->_coreDictionary, "objectForKey:", v39);
  v37 = (id)objc_msgSend(location[0], "objectForKey:", NumNegSampsLikeOtherArrayMultiplier);
  v36 = (id)objc_msgSend(location[0], "objectForKey:", NumNegSampsLikeOtherArrayOffset);
  if (v38 && v37 && v36)
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v38, "count") * objc_msgSend(v37, "longValue")+ objc_msgSend(v36, "longValue"));
    v8 = v40;
    v40 = v7;

    v35 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v43, 46, 0);
    *v44 = v6;
    v47 = 0;
    v35 = 1;
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  if (!v35)
  {
LABEL_10:
    if (v42 && v41 && v40)
    {
      v34 = -[AMDDODMLAttachmentProcessor negSampleArrayForKey:](v46->_attachmentsProcessor, "negSampleArrayForKey:", v41);
      if (v34)
      {
        v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        for (i = 0; i < objc_msgSend(v40, "longValue"); ++i)
        {
          v31 = (double)(arc4random() % 0x80000000) / 2147483650.0;
          v22 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v31);
          objc_msgSend(v33, "addObject:");

        }
        v30 = (id)objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
        v48[0] = v30;
        v21 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 1);
        v29 = (id)objc_msgSend(v33, "sortedArrayUsingDescriptors:");

        v28 = 0;
        v27 = 0;
        v26 = objc_msgSend(v29, "count");
        v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        while (v27 < v26)
        {
          v19 = (id)objc_msgSend(v29, "objectAtIndexedSubscript:", v27);
          objc_msgSend(v19, "doubleValue");
          v18 = v13;
          v17 = (id)objc_msgSend(v34, "objectAtIndexedSubscript:", v28);
          objc_msgSend(v17, "doubleValue");
          v20 = v18 > v14;

          if (v20)
          {
            ++v28;
          }
          else
          {
            v16 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v28);
            objc_msgSend(v25, "addObject:");

            ++v27;
          }
        }
        -[NSMutableDictionary setObject:forKey:](v46->_coreDictionary, "setObject:forKey:", v25, v42);
        v47 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
        v35 = 1;
        objc_storeStrong(&v25, 0);
        objc_storeStrong(&v29, 0);
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v33, 0);
      }
      else
      {
        v11 = objc_alloc(MEMORY[0x24BDD1540]);
        v12 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v43, 23, 0);
        *v44 = v12;
        v47 = 0;
        v35 = 1;
      }
      objc_storeStrong(&v34, 0);
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x24BDD1540]);
      v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v43, 46, 0);
      *v44 = v10;
      v47 = 0;
      v35 = 1;
    }
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  return v47;
}

- (id)sortArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  NSMutableDictionary *coreDictionary;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  id v46;
  unint64_t v47;
  id v48;
  id v49;
  unint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  id v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  BOOL v67;
  BOOL v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  id v73;
  uint64_t v74;
  _QWORD v77[8];
  uint64_t v78;
  id v79;
  id v80;
  unint64_t v81;
  uint64_t m;
  id v83;
  id v84;
  id v85;
  _QWORD v86[8];
  uint64_t v87;
  uint64_t v88;
  unint64_t k;
  id v90;
  id v91;
  unint64_t j;
  id v93;
  id v94;
  id v95;
  unint64_t i;
  id v97;
  id v98;
  _QWORD v99[8];
  uint64_t v100;
  id v101;
  id v102;
  id v103;
  _QWORD v104[8];
  uint64_t v105;
  _QWORD __b[8];
  uint64_t v107;
  int v108;
  __int128 v109;
  id v110;
  id v111;
  id v112;
  id *v113;
  id location[2];
  AMDDODMLDataProcessor *v115;
  id v116;
  _BYTE v117[128];
  _BYTE v118[128];
  _QWORD v119[2];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  v115 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v113 = a4;
  v112 = 0;
  objc_storeStrong(&v112, a5);
  v111 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v110 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  *((_QWORD *)&v109 + 1) = (id)objc_msgSend(location[0], "objectForKey:", OtherAffectedVectorsOutputKeys);
  *(_QWORD *)&v109 = (id)objc_msgSend(location[0], "objectForKey:", OtherAffectedVectors);
  if (v109 == 0)
  {
    *((_QWORD *)&v109 + 1) = objc_alloc_init(MEMORY[0x24BDBCE70]);

    *(_QWORD *)&v109 = objc_alloc_init(MEMORY[0x24BDBCE70]);
LABEL_31:
    if (v111 && v110)
    {
      v102 = (id)-[NSMutableDictionary objectForKey:](v115->_coreDictionary, "objectForKey:", v111);
      if (v102)
      {
        v101 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        memset(v99, 0, sizeof(v99));
        v57 = *((id *)&v109 + 1);
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", v99, v120, 16);
        if (v58)
        {
          v54 = *(_QWORD *)v99[2];
          v55 = 0;
          v56 = v58;
          while (1)
          {
            v53 = v55;
            if (*(_QWORD *)v99[2] != v54)
              objc_enumerationMutation(v57);
            v100 = *(_QWORD *)(v99[1] + 8 * v55);
            v98 = (id)objc_msgSend(*((id *)&v109 + 1), "objectForKey:", v100);
            v51 = v101;
            v52 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v51, "setObject:forKey:");

            objc_storeStrong(&v98, 0);
            ++v55;
            if (v53 + 1 >= v56)
            {
              v55 = 0;
              v56 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", v99, v120, 16);
              if (!v56)
                break;
            }
          }
        }

        v97 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        for (i = 0; ; ++i)
        {
          v50 = i;
          if (v50 >= objc_msgSend(v102, "count"))
            break;
          v49 = (id)objc_msgSend(v102, "objectAtIndex:", i);
          v119[0] = v49;
          v48 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", i);
          v119[1] = v48;
          v95 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v119, 2);

          objc_msgSend(v97, "addObject:", v95);
          objc_storeStrong(&v95, 0);
        }
        v94 = (id)objc_msgSend(v97, "sortedArrayUsingComparator:", &__block_literal_global);
        v93 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        for (j = 0; ; ++j)
        {
          v47 = j;
          if (v47 >= objc_msgSend(v94, "count"))
            break;
          v91 = (id)objc_msgSend(v94, "objectAtIndex:", j);
          v45 = v93;
          v46 = (id)objc_msgSend(v91, "lastObject");
          objc_msgSend(v45, "addObject:");

          objc_storeStrong(&v91, 0);
        }
        v90 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        for (k = 0; ; ++k)
        {
          v44 = k;
          if (v44 >= objc_msgSend(v102, "count"))
            break;
          v88 = 0;
          v38 = (id)objc_msgSend(v93, "objectAtIndex:", k);
          v39 = objc_msgSend(v38, "longValue");

          v88 = v39;
          v40 = v90;
          v41 = (id)objc_msgSend(v102, "objectAtIndex:", v39);
          objc_msgSend(v40, "addObject:");

          memset(v86, 0, sizeof(v86));
          v42 = *((id *)&v109 + 1);
          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", v86, v118, 16);
          if (v43)
          {
            v35 = *(_QWORD *)v86[2];
            v36 = 0;
            v37 = v43;
            while (1)
            {
              v34 = v36;
              if (*(_QWORD *)v86[2] != v35)
                objc_enumerationMutation(v42);
              v87 = *(_QWORD *)(v86[1] + 8 * v36);
              v85 = (id)objc_msgSend((id)v109, "objectForKey:", v87);
              v84 = (id)objc_msgSend(*((id *)&v109 + 1), "objectForKey:", v87);
              v83 = (id)objc_msgSend(v101, "objectForKey:", v84);
              for (m = 0; ; ++m)
              {
                v33 = m;
                if (v33 >= objc_msgSend(v85, "longValue"))
                  break;
                v81 = 0;
                v31 = v88;
                v19 = objc_msgSend(v85, "longValue");
                v81 = v31 * v19 + m;
                v80 = (id)-[NSMutableDictionary objectForKey:](v115->_coreDictionary, "objectForKey:", v87);
                v32 = v81;
                if (v32 < objc_msgSend(v80, "count"))
                {
                  v79 = (id)objc_msgSend(v80, "objectAtIndex:", v81);
                  objc_msgSend(v83, "addObject:", v79);
                  objc_storeStrong(&v79, 0);
                  v108 = 0;
                }
                else
                {
                  v20 = objc_alloc(MEMORY[0x24BDD1540]);
                  v21 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v112, 26, 0);
                  *v113 = v21;
                  v116 = 0;
                  v108 = 1;
                }
                objc_storeStrong(&v80, 0);
                if (v108)
                  goto LABEL_62;
              }
              v108 = 0;
LABEL_62:
              objc_storeStrong(&v83, 0);
              objc_storeStrong(&v84, 0);
              objc_storeStrong(&v85, 0);
              if (v108)
                break;
              ++v36;
              if (v34 + 1 >= v37)
              {
                v36 = 0;
                v37 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", v86, v118, 16);
                if (!v37)
                  goto LABEL_65;
              }
            }
          }
          else
          {
LABEL_65:
            v108 = 0;
          }

          if (v108)
            goto LABEL_75;
        }
        memset(v77, 0, sizeof(v77));
        v29 = v101;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", v77, v117, 16);
        if (v30)
        {
          v26 = *(_QWORD *)v77[2];
          v27 = 0;
          v28 = v30;
          while (1)
          {
            v25 = v27;
            if (*(_QWORD *)v77[2] != v26)
              objc_enumerationMutation(v29);
            v78 = *(_QWORD *)(v77[1] + 8 * v27);
            coreDictionary = v115->_coreDictionary;
            v24 = (id)objc_msgSend(v101, "objectForKey:", v78);
            -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

            ++v27;
            if (v25 + 1 >= v28)
            {
              v27 = 0;
              v28 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", v77, v117, 16);
              if (!v28)
                break;
            }
          }
        }

        -[NSMutableDictionary setObject:forKey:](v115->_coreDictionary, "setObject:forKey:", v90, v110);
        v116 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
        v108 = 1;
LABEL_75:
        objc_storeStrong(&v90, 0);
        objc_storeStrong(&v93, 0);
        objc_storeStrong(&v94, 0);
        objc_storeStrong(&v97, 0);
        objc_storeStrong(&v101, 0);
      }
      else
      {
        v17 = objc_alloc(MEMORY[0x24BDD1540]);
        v18 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v112, 104, 0);
        *v113 = v18;
        v116 = 0;
        v108 = 1;
      }
      objc_storeStrong(&v102, 0);
    }
    else
    {
      v15 = objc_alloc(MEMORY[0x24BDD1540]);
      v16 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v112, 103, 0);
      *v113 = v16;
      v116 = 0;
      v108 = 1;
    }
    goto LABEL_77;
  }
  if (!*((_QWORD *)&v109 + 1) || !(_QWORD)v109)
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v112, 103, 0);
    *v113 = v6;
    v116 = 0;
    v108 = 1;
    goto LABEL_77;
  }
  memset(__b, 0, sizeof(__b));
  v73 = *((id *)&v109 + 1);
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", __b, v122, 16);
  if (v74)
  {
    v70 = *(_QWORD *)__b[2];
    v71 = 0;
    v72 = v74;
    while (1)
    {
      v69 = v71;
      if (*(_QWORD *)__b[2] != v70)
        objc_enumerationMutation(v73);
      v107 = *(_QWORD *)(__b[1] + 8 * v71);
      v7 = (id)objc_msgSend((id)v109, "objectForKey:", v107);
      v68 = v7 != 0;

      if (!v68)
        break;
      v66 = (id)objc_msgSend((id)v109, "objectForKey:", v107);
      v67 = objc_msgSend(v66, "longValue") >= 1;

      if (!v67)
        break;
      ++v71;
      if (v69 + 1 >= v72)
      {
        v71 = 0;
        v72 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", __b, v122, 16);
        if (!v72)
          goto LABEL_15;
      }
    }
    v8 = objc_alloc(MEMORY[0x24BDD1540]);
    v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", v112, 103, 0);
    *v113 = v9;
    v116 = 0;
    v108 = 1;
  }
  else
  {
LABEL_15:
    v108 = 0;
  }

  if (!v108)
  {
    memset(v104, 0, sizeof(v104));
    v64 = (id)v109;
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", v104, v121, 16);
    if (v65)
    {
      v61 = *(_QWORD *)v104[2];
      v62 = 0;
      v63 = v65;
      while (1)
      {
        v60 = v62;
        if (*(_QWORD *)v104[2] != v61)
          objc_enumerationMutation(v64);
        v105 = *(_QWORD *)(v104[1] + 8 * v62);
        v10 = (id)objc_msgSend(*((id *)&v109 + 1), "objectForKey:", v105);
        v59 = v10 != 0;

        if (!v59)
          break;
        v103 = (id)-[NSMutableDictionary objectForKey:](v115->_coreDictionary, "objectForKey:", v105);
        if (v103)
        {
          v108 = 0;
        }
        else
        {
          v13 = objc_alloc(MEMORY[0x24BDD1540]);
          v14 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v112, 103, 0);
          *v113 = v14;
          v116 = 0;
          v108 = 1;
        }
        objc_storeStrong(&v103, 0);
        if (v108)
          goto LABEL_30;
        ++v62;
        if (v60 + 1 >= v63)
        {
          v62 = 0;
          v63 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", v104, v121, 16);
          if (!v63)
            goto LABEL_29;
        }
      }
      v11 = objc_alloc(MEMORY[0x24BDD1540]);
      v12 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v112, 103, 0);
      *v113 = v12;
      v116 = 0;
      v108 = 1;
    }
    else
    {
LABEL_29:
      v108 = 0;
    }
LABEL_30:

    if (!v108)
      goto LABEL_31;
  }
LABEL_77:
  objc_storeStrong((id *)&v109, 0);
  objc_storeStrong((id *)&v109 + 1, 0);
  objc_storeStrong(&v110, 0);
  objc_storeStrong(&v111, 0);
  objc_storeStrong(&v112, 0);
  objc_storeStrong(location, 0);
  return v116;
}

uint64_t __53__AMDDODMLDataProcessor_sortArray_error_errorDomain___block_invoke(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = 0;
  objc_storeStrong(&v8, a3);
  v6 = (id)objc_msgSend(location[0], "firstObject");
  v5 = (id)objc_msgSend(v8, "firstObject");
  v7 = objc_msgSend(v6, "compare:");

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)spliceArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v18;
  int64_t i;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  int v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id *v38;
  id location[2];
  AMDDODMLDataProcessor *v40;
  id v41;

  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38 = a4;
  v37 = 0;
  objc_storeStrong(&v37, a5);
  v36 = (id)objc_msgSend(location[0], "objectForKey:", Starting);
  v35 = (id)objc_msgSend(location[0], "objectForKey:", Ending);
  v34 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v33 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  v32 = (id)objc_msgSend(location[0], "objectForKey:", StartingLikeOtherArray);
  v31 = (id)objc_msgSend(location[0], "objectForKey:", EndingLikeOtherArray);
  if (!v32)
    goto LABEL_34;
  v30 = (id)-[NSMutableDictionary objectForKey:](v40->_coreDictionary, "objectForKey:", v32);
  v29 = (id)objc_msgSend(location[0], "objectForKey:", StartingLikeOtherArrayMultiplier);
  v28 = (id)objc_msgSend(location[0], "objectForKey:", StartingLikeOtherArrayOffset);
  if (v30 && v29 && v28)
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v30, "count") * objc_msgSend(v29, "longValue")+ objc_msgSend(v28, "longValue"));
    v8 = v36;
    v36 = v7;

    v27 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v37, 47, 0);
    *v38 = v6;
    v41 = 0;
    v27 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  if (!v27)
  {
LABEL_34:
    if (!v31)
      goto LABEL_18;
    v26 = (id)-[NSMutableDictionary objectForKey:](v40->_coreDictionary, "objectForKey:", v31);
    v25 = (id)objc_msgSend(location[0], "objectForKey:", EndingLikeOtherArrayMultiplier);
    v24 = (id)objc_msgSend(location[0], "objectForKey:", EndingLikeOtherArrayOffset);
    if (v26 && v25 && v24)
    {
      v11 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v26, "count") * objc_msgSend(v25, "longValue")+ objc_msgSend(v24, "longValue"));
      v12 = v35;
      v35 = v11;

      v27 = 0;
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x24BDD1540]);
      v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v37, 47, 0);
      *v38 = v10;
      v41 = 0;
      v27 = 1;
    }
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
    if (!v27)
    {
LABEL_18:
      if (v34 && v33 && v36 && v35)
      {
        v23 = (id)-[NSMutableDictionary objectForKey:](v40->_coreDictionary, "objectForKey:", v34);
        if (v23)
        {
          v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          for (i = 0; i < (unint64_t)objc_msgSend(v23, "count"); ++i)
          {
            if (i >= objc_msgSend(v36, "longValue") && i < objc_msgSend(v35, "longValue"))
            {
              v18 = (id)objc_msgSend(v23, "objectAtIndex:", i);
              objc_msgSend(v22, "addObject:");

            }
          }
          -[NSMutableDictionary setObject:forKey:](v40->_coreDictionary, "setObject:forKey:", v22, v33);
          v41 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
          v27 = 1;
          objc_storeStrong(&v22, 0);
        }
        else
        {
          v15 = objc_alloc(MEMORY[0x24BDD1540]);
          v16 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v37, 34, 0);
          *v38 = v16;
          v41 = 0;
          v27 = 1;
        }
        objc_storeStrong(&v23, 0);
      }
      else
      {
        v13 = objc_alloc(MEMORY[0x24BDD1540]);
        v14 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v37, 47, 0);
        *v38 = v14;
        v41 = 0;
        v27 = 1;
      }
    }
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  return v41;
}

- (id)strideCopyArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  id v15;
  uint64_t j;
  uint64_t i;
  uint64_t v18;
  id v19;
  id v20;
  int v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id *v28;
  id location[2];
  AMDDODMLDataProcessor *v30;
  id v31;

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = a4;
  v27 = 0;
  objc_storeStrong(&v27, a5);
  v26 = (id)objc_msgSend(location[0], "objectForKey:", StridesForSample);
  v25 = (id)objc_msgSend(location[0], "objectForKey:", ElementsInSample);
  v24 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v23 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  v22 = (id)objc_msgSend(location[0], "objectForKey:", Starting);
  if (!v22)
    objc_storeStrong(&v22, &unk_2507A89B0);
  if (v24 && v23 && v25 && v26)
  {
    v20 = (id)-[NSMutableDictionary objectForKey:](v30->_coreDictionary, "objectForKey:", v24);
    if (v20)
    {
      v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v12 = objc_msgSend(v20, "count");
      v18 = v12 - objc_msgSend(v25, "longValue");
      for (i = objc_msgSend(v22, "longValue"); i <= v18; i += v9)
      {
        for (j = 0; ; ++j)
        {
          v11 = j;
          if (v11 >= objc_msgSend(v25, "longValue"))
            break;
          v15 = (id)objc_msgSend(v20, "objectAtIndex:", i + j);
          objc_msgSend(v19, "addObject:", v15);
          objc_storeStrong(&v15, 0);
        }
        v9 = objc_msgSend(v26, "longValue");
      }
      -[NSMutableDictionary setObject:forKey:](v30->_coreDictionary, "setObject:forKey:", v19, v23);
      v31 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
      v21 = 1;
      objc_storeStrong(&v19, 0);
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x24BDD1540]);
      v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v27, 35, 0);
      *v28 = v8;
      v31 = 0;
      v21 = 1;
    }
    objc_storeStrong(&v20, 0);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v27, 48, 0);
    *v28 = v6;
    v31 = 0;
    v21 = 1;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v31;
}

- (id)strideCopyAndSplitArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSMutableDictionary *coreDictionary;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  _QWORD __b[8];
  uint64_t v37;
  id v38;
  uint64_t n;
  id v40;
  id v41;
  id v42;
  id v43;
  unint64_t m;
  uint64_t v45;
  uint64_t k;
  uint64_t v47;
  id v48;
  id v49;
  unint64_t j;
  id v51;
  id v52;
  id v53;
  id v54;
  unint64_t i;
  uint64_t v56;
  int v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id *v64;
  id location[2];
  AMDDODMLDataProcessor *v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v66 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v64 = a4;
  v63 = 0;
  objc_storeStrong(&v63, a5);
  v62 = (id)objc_msgSend(location[0], "objectForKey:", StridesForSample);
  v61 = (id)objc_msgSend(location[0], "objectForKey:", ElementsInSample);
  v60 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v59 = (id)objc_msgSend(location[0], "objectForKey:", Starting);
  if (!v59)
    objc_storeStrong(&v59, &unk_2507A89B0);
  v58 = (id)objc_msgSend(location[0], "objectForKey:", SplitArrayInstructions);
  if (v58 && v60 && v61 && v62)
  {
    v56 = 0;
    for (i = 0; ; ++i)
    {
      v33 = i;
      if (v33 >= objc_msgSend(v58, "count"))
        break;
      v54 = (id)objc_msgSend(v58, "objectAtIndex:", i);
      if (objc_msgSend(v54, "count") == 2)
      {
        v53 = (id)objc_msgSend(v54, "objectAtIndex:", 1);
        if (objc_msgSend(v53, "longValue") >= 1)
        {
          v11 = objc_msgSend(v53, "longValue");
          v56 += v11;
          v57 = 0;
        }
        else
        {
          v9 = objc_alloc(MEMORY[0x24BDD1540]);
          v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v63, 87, 0);
          *v64 = v10;
          v67 = 0;
          v57 = 1;
        }
        objc_storeStrong(&v53, 0);
      }
      else
      {
        v7 = objc_alloc(MEMORY[0x24BDD1540]);
        v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v63, 87, 0);
        *v64 = v8;
        v67 = 0;
        v57 = 1;
      }
      objc_storeStrong(&v54, 0);
      if (v57)
        goto LABEL_42;
    }
    v32 = v56;
    if (v32 == objc_msgSend(v61, "longValue"))
    {
      v52 = (id)-[NSMutableDictionary objectForKey:](v66->_coreDictionary, "objectForKey:", v60);
      if (v52)
      {
        v51 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        for (j = 0; ; ++j)
        {
          v31 = j;
          if (v31 >= objc_msgSend(v58, "count"))
            break;
          v49 = (id)objc_msgSend(v58, "objectAtIndex:", j);
          v48 = (id)objc_msgSend(v49, "objectAtIndex:", 0);
          v29 = v51;
          v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v29, "setObject:forKey:");

          objc_storeStrong(&v48, 0);
          objc_storeStrong(&v49, 0);
        }
        v28 = objc_msgSend(v52, "count");
        v47 = v28 - (int)objc_msgSend(v61, "intValue");
        for (k = objc_msgSend(v59, "longValue"); k <= v47; k += v16)
        {
          v45 = k;
          for (m = 0; ; ++m)
          {
            v27 = m;
            if (v27 >= objc_msgSend(v58, "count"))
              break;
            v43 = (id)objc_msgSend(v58, "objectAtIndex:", m);
            v42 = (id)objc_msgSend(v43, "objectAtIndex:", 0);
            v41 = (id)objc_msgSend(v43, "objectAtIndex:", 1);
            v40 = (id)objc_msgSend(v51, "objectForKey:", v42);
            for (n = 0; ; ++n)
            {
              v26 = n;
              if (v26 >= objc_msgSend(v41, "longValue"))
                break;
              v38 = (id)objc_msgSend(v52, "objectAtIndex:", v45);
              objc_msgSend(v40, "addObject:", v38);
              ++v45;
              objc_storeStrong(&v38, 0);
            }
            objc_storeStrong(&v40, 0);
            objc_storeStrong(&v41, 0);
            objc_storeStrong(&v42, 0);
            objc_storeStrong(&v43, 0);
          }
          v16 = objc_msgSend(v62, "longValue");
        }
        memset(__b, 0, sizeof(__b));
        v24 = v51;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", __b, v68, 16);
        if (v25)
        {
          v21 = *(_QWORD *)__b[2];
          v22 = 0;
          v23 = v25;
          while (1)
          {
            v20 = v22;
            if (*(_QWORD *)__b[2] != v21)
              objc_enumerationMutation(v24);
            v37 = *(_QWORD *)(__b[1] + 8 * v22);
            coreDictionary = v66->_coreDictionary;
            v19 = (id)objc_msgSend(v51, "objectForKey:", v37);
            -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

            ++v22;
            if (v20 + 1 >= v23)
            {
              v22 = 0;
              v23 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", __b, v68, 16);
              if (!v23)
                break;
            }
          }
        }

        v67 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
        v57 = 1;
        objc_storeStrong(&v51, 0);
      }
      else
      {
        v14 = objc_alloc(MEMORY[0x24BDD1540]);
        v15 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", v63, 84, 0);
        *v64 = v15;
        v67 = 0;
        v57 = 1;
      }
      objc_storeStrong(&v52, 0);
    }
    else
    {
      v12 = objc_alloc(MEMORY[0x24BDD1540]);
      v13 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", v63, 87, 0);
      *v64 = v13;
      v67 = 0;
      v57 = 1;
    }
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v63, 87, 0);
    *v64 = v6;
    v67 = 0;
    v57 = 1;
  }
LABEL_42:
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(location, 0);
  return v67;
}

- (id)twoArrayMathFunction:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  id v18;
  id v19;
  double v20;
  double v21;
  id v22;
  id v23;
  double v24;
  double v25;
  id v26;
  id v27;
  double v28;
  double v29;
  id v30;
  id v31;
  id v32;
  id v33;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  unint64_t i;
  id v49;
  id v50;
  id v51;
  int v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id *v58;
  id location[2];
  AMDDODMLDataProcessor *v60;
  id v61;

  v60 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v58 = a4;
  v57 = 0;
  objc_storeStrong(&v57, a5);
  v56 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v55 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  v54 = (id)objc_msgSend(location[0], "objectForKey:", SecondArray);
  v53 = (id)objc_msgSend(location[0], "objectForKey:", Operation);
  if (!v56 || !v55 || !v54 || !v53)
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v57, 88, 0);
    *v58 = v6;
    v61 = 0;
    v52 = 1;
    goto LABEL_35;
  }
  v51 = (id)-[NSMutableDictionary objectForKey:](v60->_coreDictionary, "objectForKey:", v56);
  v50 = (id)-[NSMutableDictionary objectForKey:](v60->_coreDictionary, "objectForKey:", v54);
  if (!v51 || !v50)
  {
    v7 = objc_alloc(MEMORY[0x24BDD1540]);
    v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v57, 89, 0);
    *v58 = v8;
    v61 = 0;
    v52 = 1;
    goto LABEL_34;
  }
  v41 = objc_msgSend(v51, "count");
  if (v41 != objc_msgSend(v50, "count"))
  {
    v9 = objc_alloc(MEMORY[0x24BDD1540]);
    v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v57, 93, 0);
    *v58 = v10;
    v61 = 0;
    v52 = 1;
    goto LABEL_34;
  }
  v49 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = 0; ; ++i)
  {
    v40 = i;
    if (v40 >= objc_msgSend(v51, "count"))
      break;
    v47 = (id)objc_msgSend(v51, "objectAtIndex:", i);
    v46 = (id)objc_msgSend(v50, "objectAtIndex:", i);
    objc_msgSend(v46, "doubleValue");
    if (v11 == 0.0
      && ((objc_msgSend(v53, "isEqual:", Modulo) & 1) != 0 || (objc_msgSend(v53, "isEqual:", Division) & 1) != 0))
    {
      v12 = objc_alloc(MEMORY[0x24BDD1540]);
      v13 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", v57, 90, 0);
      *v58 = v13;
      v61 = 0;
      v52 = 1;
      goto LABEL_30;
    }
    v45 = 0;
    if ((objc_msgSend(v53, "isEqual:", Modulo) & 1) != 0)
    {
      v39 = objc_msgSend(v47, "longValue");
      v44 = v39 % objc_msgSend(v46, "longValue");
      v14 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v44);
      v15 = v45;
      v45 = v14;

LABEL_28:
      objc_msgSend(v49, "addObject:", v45);
      v52 = 0;
      goto LABEL_29;
    }
    if ((objc_msgSend(v53, "isEqual:", Division) & 1) != 0)
    {
      objc_msgSend(v47, "doubleValue");
      v38 = v16;
      objc_msgSend(v46, "doubleValue");
      v18 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v38 / v17);
      v19 = v45;
      v45 = v18;

      goto LABEL_28;
    }
    if ((objc_msgSend(v53, "isEqual:", Multiplication) & 1) != 0)
    {
      objc_msgSend(v47, "doubleValue");
      v37 = v20;
      objc_msgSend(v46, "doubleValue");
      v22 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v37 * v21);
      v23 = v45;
      v45 = v22;

      goto LABEL_28;
    }
    if ((objc_msgSend(v53, "isEqual:", Addition) & 1) != 0)
    {
      objc_msgSend(v47, "doubleValue");
      v36 = v24;
      objc_msgSend(v46, "doubleValue");
      v26 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36 + v25);
      v27 = v45;
      v45 = v26;

      goto LABEL_28;
    }
    if ((objc_msgSend(v53, "isEqual:", Subtraction) & 1) != 0)
    {
      objc_msgSend(v47, "doubleValue");
      v35 = v28;
      objc_msgSend(v46, "doubleValue");
      v30 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v35 - v29);
      v31 = v45;
      v45 = v30;

      goto LABEL_28;
    }
    v32 = objc_alloc(MEMORY[0x24BDD1540]);
    v33 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v57, 83, 0);
    *v58 = v33;
    v61 = 0;
    v52 = 1;
LABEL_29:
    objc_storeStrong(&v45, 0);
LABEL_30:
    objc_storeStrong(&v46, 0);
    objc_storeStrong(&v47, 0);
    if (v52)
      goto LABEL_33;
  }
  -[NSMutableDictionary setObject:forKey:](v60->_coreDictionary, "setObject:forKey:", v49, v55);
  v61 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
  v52 = 1;
LABEL_33:
  objc_storeStrong(&v49, 0);
LABEL_34:
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
LABEL_35:
  objc_storeStrong(&v53, 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(location, 0);
  return v61;
}

- (id)windowFunction:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v25;
  id v26;
  double v27;
  unint64_t v28;
  id v29;
  id v30;
  double v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  id v37;
  double v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  double v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t j;
  id v48;
  unint64_t i;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  int v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id *v64;
  id location[2];
  AMDDODMLDataProcessor *v66;
  id v67;

  v66 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v64 = a4;
  v63 = 0;
  objc_storeStrong(&v63, a5);
  v62 = (id)objc_msgSend(location[0], "objectForKey:", WindowSize);
  v61 = (id)objc_msgSend(location[0], "objectForKey:", InputArray);
  v60 = (id)objc_msgSend(location[0], "objectForKey:", FeatureOutput);
  v59 = (id)objc_msgSend(location[0], "objectForKey:", ContextOutput);
  v58 = (id)objc_msgSend(location[0], "objectForKey:", LabelOutput);
  v57 = (id)objc_msgSend(location[0], "objectForKey:", TimeStampArrayKey);
  v56 = (id)objc_msgSend(location[0], "objectForKey:", TimeStampMaxDistKey);
  if (v62 && v61 && v60 && v59 && v58)
  {
    v54 = (id)-[NSMutableDictionary objectForKey:](v66->_coreDictionary, "objectForKey:", v61);
    if (!v54)
    {
      v7 = objc_alloc(MEMORY[0x24BDD1540]);
      v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v63, 36, 0);
      *v64 = v8;
      v67 = 0;
      v55 = 1;
LABEL_39:
      objc_storeStrong(&v54, 0);
      goto LABEL_40;
    }
    v53 = 0;
    if (v57)
    {
      if (!v56 || (objc_msgSend(v56, "doubleValue"), v11 <= 0.0))
      {
        v9 = objc_alloc(MEMORY[0x24BDD1540]);
        v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v63, 49, 0);
        *v64 = v10;
        v67 = 0;
        v55 = 1;
LABEL_38:
        objc_storeStrong(&v53, 0);
        goto LABEL_39;
      }
      v12 = (id)-[NSMutableDictionary objectForKey:](v66->_coreDictionary, "objectForKey:", v57);
      v13 = v53;
      v53 = v12;

      if (!v53)
      {
        v14 = objc_alloc(MEMORY[0x24BDD1540]);
        v15 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", v63, 36, 0);
        *v64 = v15;
        v67 = 0;
        v55 = 1;
        goto LABEL_38;
      }
      v34 = objc_msgSend(v53, "count");
      if (v34 != objc_msgSend(v54, "count"))
      {
        v16 = objc_alloc(MEMORY[0x24BDD1540]);
        v17 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v63, 96, 0);
        *v64 = v17;
        v67 = 0;
        v55 = 1;
        goto LABEL_38;
      }
    }
    v52 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v51 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v50 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    for (i = 0; ; ++i)
    {
      v33 = i;
      if (v33 >= objc_msgSend(v54, "count"))
        break;
      v48 = (id)objc_msgSend(v54, "objectAtIndex:", i);
      for (j = 1; ; ++j)
      {
        v32 = j;
        if (v32 > objc_msgSend(v62, "longValue"))
          break;
        if ((uint64_t)(i - j) >= 0)
        {
          v46 = 1;
          if (v53)
          {
            v45 = (id)objc_msgSend(v53, "objectAtIndex:", i);
            v44 = (id)objc_msgSend(v53, "objectAtIndex:", i - j);
            v43 = 0.0;
            objc_msgSend(v45, "doubleValue");
            v31 = v18;
            objc_msgSend(v44, "doubleValue");
            v43 = vabdd_f64(v31, v19);
            objc_msgSend(v56, "doubleValue");
            if (v20 < v43)
              v46 = 0;
            objc_storeStrong(&v44, 0);
            objc_storeStrong(&v45, 0);
          }
          if (v46 == 1)
          {
            v42 = (id)objc_msgSend(v54, "objectAtIndex:", i - j);
            objc_msgSend(v50, "addObject:", v48);
            objc_msgSend(v52, "addObject:", v42);
            v29 = v51;
            v30 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
            objc_msgSend(v29, "addObject:");

            objc_storeStrong(&v42, 0);
          }
        }
        v28 = i + j;
        if (v28 < objc_msgSend(v54, "count"))
        {
          v41 = 1;
          if (v53)
          {
            v40 = (id)objc_msgSend(v53, "objectAtIndex:", i);
            v39 = (id)objc_msgSend(v53, "objectAtIndex:", i + j);
            v38 = 0.0;
            objc_msgSend(v40, "doubleValue");
            v27 = v21;
            objc_msgSend(v39, "doubleValue");
            v38 = vabdd_f64(v27, v22);
            objc_msgSend(v56, "doubleValue");
            if (v23 < v38)
              v41 = 0;
            objc_storeStrong(&v39, 0);
            objc_storeStrong(&v40, 0);
          }
          if (v41 == 1)
          {
            v37 = (id)objc_msgSend(v54, "objectAtIndex:", i + j);
            objc_msgSend(v50, "addObject:", v48);
            objc_msgSend(v52, "addObject:", v37);
            v25 = v51;
            v26 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
            objc_msgSend(v25, "addObject:");

            objc_storeStrong(&v37, 0);
          }
        }
      }
      objc_storeStrong(&v48, 0);
    }
    -[NSMutableDictionary setObject:forKey:](v66->_coreDictionary, "setObject:forKey:", v50, v60);
    -[NSMutableDictionary setObject:forKey:](v66->_coreDictionary, "setObject:forKey:", v52, v59);
    -[NSMutableDictionary setObject:forKey:](v66->_coreDictionary, "setObject:forKey:", v51, v58);
    v67 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
    v55 = 1;
    objc_storeStrong(&v50, 0);
    objc_storeStrong(&v51, 0);
    objc_storeStrong(&v52, 0);
    goto LABEL_38;
  }
  v5 = objc_alloc(MEMORY[0x24BDD1540]);
  v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v63, 49, 0);
  *v64 = v6;
  v67 = 0;
  v55 = 1;
LABEL_40:
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(location, 0);
  return v67;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myAMDClient, 0);
  objc_storeStrong((id *)&self->_attachmentsProcessor, 0);
  objc_storeStrong((id *)&self->_numberInputsBound, 0);
  objc_storeStrong((id *)&self->_elementsInSample, 0);
  objc_storeStrong((id *)&self->_inputDictionary, 0);
  objc_storeStrong((id *)&self->_coreDictionary, 0);
  objc_storeStrong((id *)&self->_actionArray, 0);
}

@end
