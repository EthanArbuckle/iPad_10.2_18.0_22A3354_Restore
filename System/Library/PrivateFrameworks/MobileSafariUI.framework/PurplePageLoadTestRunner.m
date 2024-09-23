@implementation PurplePageLoadTestRunner

- (PurplePageLoadTestRunner)initWithTestName:(id)a3 browserController:(id)a4
{
  PurplePageLoadTestRunner *v4;
  uint64_t v5;
  NSMutableDictionary *pptResults;
  NSMutableDictionary *v7;
  NSMutableDictionary *iterationResults;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PurplePageLoadTestRunner;
  v4 = -[PageLoadTestRunner initWithTestName:browserController:](&v10, sel_initWithTestName_browserController_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 50);
    pptResults = v4->_pptResults;
    v4->_pptResults = (NSMutableDictionary *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    iterationResults = v4->_iterationResults;
    v4->_iterationResults = v7;

    v4->_showLoadTime = 1;
    v4->_showFirstVisualLayoutTime = 0;
    v4->_showRenderTime = 0;
    v4->_showRenderFps = 0;
  }
  return v4;
}

- (id)initRenderTestWithName:(id)a3 browserController:(id)a4 showRenderTime:(BOOL)a5 showFPS:(BOOL)a6
{
  PurplePageLoadTestRunner *v8;
  PurplePageLoadTestRunner *v9;

  v8 = -[PurplePageLoadTestRunner initWithTestName:browserController:](self, "initWithTestName:browserController:", a3, a4);
  v9 = v8;
  if (v8)
  {
    v8->_showLoadTime = 0;
    v8->_showRenderTime = a5;
    v8->_showRenderFps = a6;
    -[PageLoadTestRunner setPageActionInterval:](v8, "setPageActionInterval:", 0.0166666667);
  }
  return v9;
}

- (void)startingTestRunner
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PurplePageLoadTestRunner;
  -[PageLoadTestRunner startingTestRunner](&v5, sel_startingTestRunner);
  v3 = (void *)*MEMORY[0x1E0DC4730];
  -[PageLoadTestRunner testName](self, "testName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startedTest:", v4);

}

- (void)finishedTestRunnerIteration
{
  objc_super v3;

  -[PurplePageLoadTestRunner collectPPTResults](self, "collectPPTResults");
  v3.receiver = self;
  v3.super_class = (Class)PurplePageLoadTestRunner;
  -[PageLoadTestRunner finishedTestRunnerIteration](&v3, sel_finishedTestRunnerIteration);
}

- (void)finishedTestRunner
{
  void *v3;
  void *v4;
  objc_super v5;

  -[PurplePageLoadTestRunner writeOutputData](self, "writeOutputData");
  v3 = (void *)*MEMORY[0x1E0DC4730];
  -[PageLoadTestRunner testName](self, "testName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishedTest:extraResults:", v4, self->_pptResults);

  v5.receiver = self;
  v5.super_class = (Class)PurplePageLoadTestRunner;
  -[PageLoadTestRunner finishedTestRunner](&v5, sel_finishedTestRunner);
}

- (void)pptResultFor:(id)a3 measure:(id)a4 value:(double)a5 units:(id)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *pptResults;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  id v18;

  v18 = a4;
  v10 = a6;
  objc_msgSend(a3, "description");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v11, v18);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  pptResults = self->_pptResults;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](pptResults, "setValue:forKey:", v15, v12);

  if (v10)
  {
    v16 = self->_pptResults;
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("Units"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](v16, "setValue:forKey:", v10, v17);

  }
}

- (void)pptResultFor:(id)a3 measure:(id)a4 time:(double)a5
{
  -[PurplePageLoadTestRunner pptResultFor:measure:value:units:](self, "pptResultFor:measure:value:units:", a3, a4, CFSTR("ms"), a5 * 1000.0);
}

- (void)collectPPTResults
{
  void *v3;
  int *v4;
  int *v5;
  uint64_t v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  int *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  BOOL v60;
  void *v61;
  uint64_t v62;
  int v63;
  NSMutableDictionary *pptResults;
  void *v65;
  NSMutableDictionary *iterationResults;
  void *v67;
  void *v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[NSMutableArray objectAtIndexedSubscript:](self->super._pageLoadArray, "objectAtIndexedSubscript:", self->super._currentTestIteration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = &OBJC_IVAR___MemoryAndIOTestRunner_writesAtStart;
  v5 = &OBJC_IVAR___MemoryAndIOTestRunner_writesAtStart;
  v72 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
  v6 = 0;
  if (v72)
  {
    v7 = 0;
    v70 = 0;
    v71 = *(_QWORD *)v74;
    v8 = 1.0;
    v9 = 0.0;
    v10 = 0.0;
    v69 = 0.0;
    v11 = 0.0;
    while (1)
    {
      for (i = 0; i != v72; ++i)
      {
        if (*(_QWORD *)v74 != v71)
          objc_enumerationMutation(v3);
        v13 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        if (objc_msgSend(v13, "status") != 5)
          goto LABEL_26;
        if (*((_BYTE *)&self->super.super.isa + v4[33]))
        {
          objc_msgSend(v13, "endLoadDate");
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14)
            goto LABEL_26;
          v15 = (void *)v14;
          objc_msgSend(v13, "webContentProcessStartLoadDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
            goto LABEL_26;
          objc_msgSend(v13, "endLoadDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "webContentProcessStartLoadDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "timeIntervalSinceDate:", v18);
          v20 = v19;

          v6 = (v6 + 1);
          v11 = v11 + v20;
          v9 = v9 + sqrt(v20 * 1000.0);
          v8 = v8 * (v20 * 1000.0);
          objc_msgSend(v13, "URL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PurplePageLoadTestRunner pptResultFor:measure:time:](self, "pptResultFor:measure:time:", v21, 0, v20);

        }
        if (self->super._measureTime)
        {
          objc_msgSend(v13, "endLoadDate");
          v22 = objc_claimAutoreleasedReturnValue();
          if (!v22)
            goto LABEL_26;
          v23 = (void *)v22;
          objc_msgSend(v13, "uiProcessStartDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
            goto LABEL_26;
          objc_msgSend(v13, "endLoadDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "uiProcessStartDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "timeIntervalSinceDate:", v26);
          v28 = v27;

          objc_msgSend(v13, "URL");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[PurplePageLoadTestRunner pptResultFor:measure:time:](self, "pptResultFor:measure:time:", v29, CFSTR("loadTimeFromUI"), v28);

          if (self->super._version >= 5)
          {
            objc_msgSend(v13, "domContentLoadedDate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "uiProcessStartDate");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "timeIntervalSinceDate:", v31);
            v33 = v32;

            objc_msgSend(v13, "firstMeaningfulPaintDate");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "uiProcessStartDate");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "timeIntervalSinceDate:", v35);
            v37 = v36;

            objc_msgSend(v13, "allSubresourcesLoadedDate");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "uiProcessStartDate");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "timeIntervalSinceDate:", v39);
            v41 = v40;

            objc_msgSend(v13, "URL");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[PurplePageLoadTestRunner pptResultFor:measure:time:](self, "pptResultFor:measure:time:", v42, CFSTR("domContentLoaded"), v33);

            objc_msgSend(v13, "URL");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[PurplePageLoadTestRunner pptResultFor:measure:time:](self, "pptResultFor:measure:time:", v43, CFSTR("firstMeaningfulPaint"), v37);

            objc_msgSend(v13, "URL");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[PurplePageLoadTestRunner pptResultFor:measure:time:](self, "pptResultFor:measure:time:", v44, CFSTR("allSubresources"), v41);

          }
        }
        if (self->_showFirstVisualLayoutTime)
        {
          objc_msgSend(v13, "firstVisualLayoutDate");
          v45 = objc_claimAutoreleasedReturnValue();
          if (!v45)
            goto LABEL_26;
          v46 = (void *)v45;
          objc_msgSend(v13, "webContentProcessStartLoadDate");
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v47)
            goto LABEL_26;
          objc_msgSend(v13, "URL");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firstVisualLayoutDate");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "webContentProcessStartLoadDate");
          v50 = v3;
          v51 = v6;
          v52 = v5;
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "timeIntervalSinceDate:", v53);
          -[PurplePageLoadTestRunner pptResultFor:measure:time:](self, "pptResultFor:measure:time:", v48, CFSTR("firstVisualLayout"));

          v5 = v52;
          v6 = v51;
          v3 = v50;
          v4 = &OBJC_IVAR___MemoryAndIOTestRunner_writesAtStart;

        }
        if (*((_BYTE *)&self->super.super.isa + v5[36]))
        {
          objc_msgSend(v13, "framesPerSecond");
          if (v54 <= 0.0)
            goto LABEL_26;
          v55 = v54;
          ++HIDWORD(v70);
          v10 = v10 + v54;
          objc_msgSend(v13, "URL");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[PurplePageLoadTestRunner pptResultFor:measure:value:units:](self, "pptResultFor:measure:value:units:", v56, CFSTR("fps"), CFSTR("fps"), v55);

        }
        if (!self->_showRenderTime)
          continue;
        objc_msgSend(v13, "renderDuration");
        if (v57 > 0.0)
        {
          v58 = v57;
          LODWORD(v70) = v70 + 1;
          v69 = v69 + v57;
          objc_msgSend(v13, "URL");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[PurplePageLoadTestRunner pptResultFor:measure:time:](self, "pptResultFor:measure:time:", v59, CFSTR("render"), v58);

          continue;
        }
LABEL_26:
        ++v7;
      }
      v72 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
      if (!v72)
        goto LABEL_31;
    }
  }
  v70 = 0;
  v7 = 0;
  v8 = 1.0;
  v9 = 0.0;
  v10 = 0.0;
  v69 = 0.0;
  v11 = 0.0;
LABEL_31:

  if (*((_BYTE *)&self->super.super.isa + v4[33]))
  {
    -[PurplePageLoadTestRunner pptResultFor:measure:time:](self, "pptResultFor:measure:time:", CFSTR("Total Time"), 0, v11);
    if ((int)v6 >= 1)
    {
      -[PurplePageLoadTestRunner pptResultFor:measure:time:](self, "pptResultFor:measure:time:", CFSTR("Mean Time"), 0, v11 / (double)(int)v6);
      -[PurplePageLoadTestRunner pptResultFor:measure:value:units:](self, "pptResultFor:measure:value:units:", CFSTR("Geometric Mean Time"), 0, CFSTR("ms"), (double)pow(v8, 1.0 / (double)(int)v6));
      -[PurplePageLoadTestRunner pptResultFor:measure:value:units:](self, "pptResultFor:measure:value:units:", CFSTR("Square-Mean-Root Time"), 0, CFSTR("ms"), v9 / (double)(int)v6 * (v9 / (double)(int)v6));
    }
  }
  if (*((_BYTE *)&self->super.super.isa + v5[36]))
    v60 = SHIDWORD(v70) < 1;
  else
    v60 = 1;
  if (!v60)
    -[PurplePageLoadTestRunner pptResultFor:measure:value:units:](self, "pptResultFor:measure:value:units:", CFSTR("Mean Render FPS"), 0, CFSTR("fps"), v10 / (double)SHIDWORD(v70));
  if (self->_showRenderTime)
  {
    -[PurplePageLoadTestRunner pptResultFor:measure:time:](self, "pptResultFor:measure:time:", CFSTR("Total Render Time"), 0, v69);
    if ((int)v70 >= 1)
      -[PurplePageLoadTestRunner pptResultFor:measure:time:](self, "pptResultFor:measure:time:", CFSTR("Mean Render Time"), 0, v69 / (double)(int)v70);
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->super._pageLoadArray, "objectAtIndexedSubscript:", self->super._currentTestIteration);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "count");

  if (v62)
    v63 = v7;
  else
    v63 = v7 + 1;
  if (v63 >= 1)
  {
    pptResults = self->_pptResults;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](pptResults, "setObject:forKey:", v65, CFSTR("Errors"));

  }
  iterationResults = self->_iterationResults;
  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:copyItems:", self->_pptResults, 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->super._currentTestIteration);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](iterationResults, "setObject:forKey:", v67, v68);

}

- (void)writeOutputData
{
  void *v3;
  NSMutableDictionary *iterationResults;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[PageLoadTestRunner outputFilename](self, "outputFilename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    NSLog((NSString *)CFSTR("safari-plt-test %@"), self->_iterationResults);
    goto LABEL_9;
  }
  iterationResults = self->_iterationResults;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", iterationResults, 0, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (!v6)
  {
    -[PageLoadTestRunner outputFilename](self, "outputFilename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v5, "writeToFile:options:error:", v8, 0, &v10);
    v7 = v10;

    if (v7)
    {
      -[PageLoadTestRunner outputFilename](self, "outputFilename");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog((NSString *)CFSTR("safari-plt-test Error writing output to file %@: %@"), v9, v7);

      goto LABEL_7;
    }

LABEL_9:
    -[PageLoadTestRunner outputFilename](self, "outputFilename");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PageLoadTestRunner log:](self, "log:", CFSTR("PageLoadTest Complete. Wrote data to %@"), v7);
    goto LABEL_10;
  }
  v7 = v6;
  NSLog((NSString *)CFSTR("safari-plt-test Error while serializing Page Load Performance Test results: %@"), v6);
LABEL_7:

LABEL_10:
}

- (BOOL)showLoadTime
{
  return self->_showLoadTime;
}

- (void)setShowLoadTime:(BOOL)a3
{
  self->_showLoadTime = a3;
}

- (BOOL)showFirstVisualLayoutTime
{
  return self->_showFirstVisualLayoutTime;
}

- (void)setShowFirstVisualLayoutTime:(BOOL)a3
{
  self->_showFirstVisualLayoutTime = a3;
}

- (BOOL)showRenderTime
{
  return self->_showRenderTime;
}

- (void)setShowRenderTime:(BOOL)a3
{
  self->_showRenderTime = a3;
}

- (BOOL)showRenderFps
{
  return self->_showRenderFps;
}

- (void)setShowRenderFps:(BOOL)a3
{
  self->_showRenderFps = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterationResults, 0);
  objc_storeStrong((id *)&self->_pptResults, 0);
}

@end
