@implementation HKMedicationsBarcodeNDCParser

+ (BOOL)isObservationSupported:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "symbology");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == (void *)*MEMORY[0x24BDF9D98])
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "symbology");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == (void *)*MEMORY[0x24BDF9D90];

  }
  return v6;
}

+ (id)parsedNDCCodeFromBarcodeObservation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x2276839E4]();
  if (!objc_msgSend(a1, "isObservationSupported:", v4))
    goto LABEL_4;
  objc_msgSend(v4, "symbology");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x24BDF9D98];

  if (v6 == v7)
  {
    objc_msgSend(a1, "_parsedNDCFromEAN13:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = (void *)v11;
    goto LABEL_8;
  }
  objc_msgSend(v4, "symbology");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x24BDF9D90];

  if (v8 == v9)
  {
    objc_msgSend(a1, "parsedNDCFromDataMatrix:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_4:
  v10 = 0;
LABEL_8:
  objc_autoreleasePoolPop(v5);

  return v10;
}

+ (id)parsedGTIN14CodeFromBarcodeObservation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x2276839E4]();
  if (!objc_msgSend(a1, "isObservationSupported:", v4))
    goto LABEL_4;
  objc_msgSend(v4, "symbology");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x24BDF9D98];

  if (v6 == v7)
  {
    objc_msgSend(a1, "_parsedGTIN14FromEAN13:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = (void *)v11;
    goto LABEL_8;
  }
  objc_msgSend(v4, "symbology");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x24BDF9D90];

  if (v8 == v9)
  {
    objc_msgSend(a1, "_parsedGTIN14FromDataMatrix:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_4:
  v10 = 0;
LABEL_8:
  objc_autoreleasePoolPop(v5);

  return v10;
}

+ (id)parsedNDCCodesFromCMSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_barcodeObservationsFrom:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(a1, "parsedNDCCodeFromBarcodeObservation:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "length"))
            objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)parsedGTIN14CodesFromCMSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_barcodeObservationsFrom:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(a1, "parsedGTIN14CodeFromBarcodeObservation:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "length"))
            objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_barcodeObservationsFrom:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = objc_alloc(MEMORY[0x24BDF9C28]);
  v7 = (void *)objc_msgSend(v6, "initWithCMSampleBuffer:options:", a3, MEMORY[0x24BDBD1B8]);
  +[HKMedicationsBarcodeExtractor extractedBarcodesFromRequestHandler:error:](HKMedicationsBarcodeExtractor, "extractedBarcodesFromRequestHandler:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = v8;

  return v9;
}

+ (id)_parsedGTIN14FromEAN13:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "payloadStringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_parsedGTIN14FromEAN13Payload:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_parsedGTIN14FromEAN13Payload:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 13 && objc_msgSend(v3, "hasPrefix:", CFSTR("03")))
  {
    objc_msgSend(CFSTR("0"), "stringByAppendingString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_parsedNDCFromEAN13:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_parsedGTIN14FromEAN13:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_convertNDCFromGTIN14Code:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_parsedGTIN14FromDataMatrix:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "payloadStringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_parsedGTIN14FromDataMatrixPayload:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)parsedNDCFromDataMatrix:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_parsedGTIN14FromDataMatrix:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_convertNDCFromGTIN14Code:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_parsedGTIN14FromDataMatrixPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), 29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", v4);
  v7 = 0;
  if (!objc_msgSend(v6, "scanString:intoString:", v5, 0))
    goto LABEL_12;
  while (1)
  {
    v13 = 0;
    v8 = objc_msgSend(v6, "scanString:intoString:", CFSTR("01"), &v13);
    v9 = v13;
    v10 = v9;
    if (!v8 || !objc_msgSend(v9, "isEqual:", CFSTR("01")))
      goto LABEL_6;
    objc_msgSend(v4, "substringWithRange:", objc_msgSend(v6, "scanLocation"), 14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "containsString:", v5) & 1) == 0)
      break;

LABEL_6:
    if ((objc_msgSend(v6, "scanString:intoString:", v5, 0) & 1) == 0)
    {
      v7 = 0;
      goto LABEL_12;
    }
  }
  if (objc_msgSend(a1, "_isGTIN14CodeValid:", v11))
    v7 = v11;
  else
    v7 = 0;

LABEL_12:
  return v7;
}

+ (BOOL)_isGTIN14CodeValid:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("003")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    if (objc_msgSend(v3, "length") == 1)
      goto LABEL_11;
    v6 = 0;
    v7 = 0;
    do
    {
      objc_msgSend(v3, "substringWithRange:", v6, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "integerValue");

      if ((v6 & 1) != 0)
        v10 = 1;
      else
        v10 = 3;
      v7 += v9 * v10;
      ++v6;
    }
    while (objc_msgSend(v3, "length") - 1 > v6);
    if (!(v7 % 10))
LABEL_11:
      v11 = 0;
    else
      v11 = 10 - v7 % 10;
    v12 = v5 == v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_convertNDCFromGTIN14Code:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (objc_msgSend(a1, "_isGTIN14CodeValid:", v4))
  {
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("003"), "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length") == 10 || objc_msgSend(v6, "length") == 11)
      v7 = v6;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)hkt_parsedNDCFromDataMatrixPayload:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_parsedGTIN14FromDataMatrixPayload:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_convertNDCFromGTIN14Code:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hkt_parsedNDCFromEAN13Payload:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_parsedGTIN14FromEAN13Payload:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_convertNDCFromGTIN14Code:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
