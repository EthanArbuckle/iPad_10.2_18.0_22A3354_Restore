@implementation DYJavaScriptHelperContext

- (DYJavaScriptHelperContext)init
{
  DYJavaScriptHelperContext *v2;
  DYJSScriptingContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DYJavaScriptHelperContext;
  v2 = -[DYJavaScriptHelperContext init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(DYJSScriptingContext);
    v2->_context = v3;
    -[JSContext setObject:forKeyedSubscript:](-[DYJSScriptingContext context](v3, "context"), "setObject:forKeyedSubscript:", &__block_literal_global_1, CFSTR("ErrorLog"));
  }
  return v2;
}

uint64_t __33__DYJavaScriptHelperContext_init__block_invoke(uint64_t a1, void *a2)
{
  return fputs((const char *)objc_msgSend(a2, "UTF8String"), (FILE *)*MEMORY[0x24BDAC8D8]);
}

- (BOOL)evaluateScript:(id)a3
{
  int v5;
  DYJSScriptingContext *context;
  uint64_t v7;

  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:isDirectory:", a3, 0);
  if (v5)
  {
    context = self->_context;
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", a3, 4, 0);
    LOBYTE(v5) = -[DYJSScriptingContext evaluteScript:scriptURL:](context, "evaluteScript:scriptURL:", v7, objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a3));
  }
  return v5;
}

- (BOOL)evaluateScriptCode:(id)a3
{
  return -[DYJSScriptingContext evaluteScript:scriptURL:](self->_context, "evaluteScript:scriptURL:", a3, 0);
}

- (void)exportCounterValues:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__DYJavaScriptHelperContext_exportCounterValues___block_invoke;
  v3[3] = &unk_250D58FA0;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

uint64_t __49__DYJavaScriptHelperContext_exportCounterValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setValue:value:", a2, a3);
}

- (id)generateJavascriptCode:(id)a3 softwareCounterNames:(id)a4 derivedCounterNames:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v49;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(a3);
        objc_msgSend(v8, "appendFormat:", CFSTR("var %@ = 0;\n"), *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v10);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("function _SetRawCounterValues() {\n"));
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v45;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v45 != v16)
          objc_enumerationMutation(a3);
        objc_msgSend(v8, "appendFormat:", CFSTR("\t%@ = _RawCounterValues[%lu];\n"),
          *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v17),
          v15 + v17);
        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      v15 += v17;
    }
    while (v14);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("}\n"));
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v18 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(a4);
        objc_msgSend(v8, "appendFormat:", CFSTR("var %@ = 0;\n"), *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v21++));
      }
      while (v19 != v21);
      v19 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v19);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("function _SetSoftwareCounterValues() {\n"));
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v37;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(a4);
        objc_msgSend(v8, "appendFormat:", CFSTR("\t%@ = _SoftwareCounterValues[%lu];\n"),
          *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v26),
          v24 + v26);
        ++v26;
      }
      while (v23 != v26);
      v23 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
      v24 += v26;
    }
    while (v23);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("}\n"));
  objc_msgSend(v8, "appendString:", CFSTR("var _DerivedCounterResult = [];\nfunction _EvaluteDerivedCounters() {\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("\t_DerivedCounterResult = [];\n"));
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v33;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v33 != v29)
          objc_enumerationMutation(a5);
        objc_msgSend(v8, "appendFormat:", CFSTR("\ttry { value = %@(); if (!isFinite(value)) { value = 0; } _DerivedCounterResult.push(value); } catch(err) { ErrorLog(err); _DerivedCounterResult.push(0); }\n"),
          *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v30++));
      }
      while (v28 != v30);
      v28 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
    }
    while (v28);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("}\n"));
  return v8;
}

- (BOOL)prepareCounterNames:(id)a3 softwareCounterNames:(id)a4 derivedCounterNames:(id)a5
{
  return -[DYJavaScriptHelperContext evaluateScriptCode:](self, "evaluateScriptCode:", -[DYJavaScriptHelperContext generateJavascriptCode:softwareCounterNames:derivedCounterNames:](self, "generateJavascriptCode:softwareCounterNames:derivedCounterNames:", a3, a4, a5));
}

- (BOOL)prepareCounterValues:(id)a3 softwareCounterValues:(id)a4
{
  id v6;

  v6 = -[DYJSScriptingContext setValue:value:](self->_context, "setValue:value:", CFSTR("_SoftwareCounterValues"), a4);
  if (v6)
  {
    -[DYJSScriptingContext callGlobalFunction:](self->_context, "callGlobalFunction:", "_SetSoftwareCounterValues");
    v6 = -[DYJSScriptingContext setValue:value:](self->_context, "setValue:value:", CFSTR("_RawCounterValues"), a3);
    if (v6)
    {
      -[DYJSScriptingContext callGlobalFunction:](self->_context, "callGlobalFunction:", "_SetRawCounterValues");
      LOBYTE(v6) = 1;
    }
  }
  return (char)v6;
}

- (id)evaluateDerivedCounters
{
  -[DYJSScriptingContext callGlobalFunction:](self->_context, "callGlobalFunction:", "_EvaluteDerivedCounters");
  return (id)objc_msgSend(-[DYJSScriptingContext getValue:](self->_context, "getValue:", CFSTR("_DerivedCounterResult")), "toArray");
}

@end
