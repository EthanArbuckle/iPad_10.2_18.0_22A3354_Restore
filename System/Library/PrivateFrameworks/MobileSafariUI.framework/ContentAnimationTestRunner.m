@implementation ContentAnimationTestRunner

- (ContentAnimationTestRunner)initWithTestName:(id)a3 browserController:(id)a4
{
  ContentAnimationTestRunner *v4;
  uint64_t v5;
  NSMutableDictionary *outputData;
  ContentAnimationTestRunner *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ContentAnimationTestRunner;
  v4 = -[PurplePageLoadTestRunner initWithTestName:browserController:](&v9, sel_initWithTestName_browserController_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    outputData = v4->_outputData;
    v4->_outputData = (NSMutableDictionary *)v5;

    -[PageLoadTestRunner setResetsZoomBetweenPages:](v4, "setResetsZoomBetweenPages:", 0);
    v7 = v4;
  }

  return v4;
}

- (BOOL)startPageAction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startRenderTime:", v6);

  v8.receiver = self;
  v8.super_class = (Class)ContentAnimationTestRunner;
  LOBYTE(self) = -[PageLoadTestRunner startPageAction:](&v8, sel_startPageAction_, v5);

  return (char)self;
}

- (BOOL)performActionForPage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[PageLoadTestRunner browserController](self, "browserController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fragment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("done")) ^ 1;

  return v8;
}

- (void)finishedTestPage:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *outputData;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[ContentAnimationTestRunner outputDataForPage:](self, "outputDataForPage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  outputData = self->_outputData;
  objc_msgSend(v4, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](outputData, "setObject:forKeyedSubscript:", v5, v8);

  v9.receiver = self;
  v9.super_class = (Class)ContentAnimationTestRunner;
  -[PageLoadTestRunner finishedTestPage:](&v9, sel_finishedTestPage_, v4);

}

- (id)finalStatusForPage:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a3, "status");
  if (v3 > 6)
    return CFSTR("Finished");
  else
    return off_1E9CF52A0[v3];
}

- (id)outputDataForPage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("substitutions");
  v7[1] = CFSTR("framerate");
  v8[0] = &unk_1E9D628C8;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "framesPerSecond");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)writeOutputData
{
  void *v3;
  NSMutableDictionary *outputData;
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
    NSLog((NSString *)CFSTR("ContentAnimation results: %@"), self->_outputData);
    return;
  }
  outputData = self->_outputData;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", outputData, 0, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v6)
  {
    v7 = v6;
    NSLog((NSString *)CFSTR("Error while serializing Scrolling Performance Test results: %@"), v6);
LABEL_7:

    goto LABEL_8;
  }
  -[PageLoadTestRunner outputFilename](self, "outputFilename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "writeToFile:options:error:", v8, 0, &v10);
  v7 = v10;

  if (v7)
  {
    -[PageLoadTestRunner outputFilename](self, "outputFilename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog((NSString *)CFSTR("Error writing output to file %@: %@"), v9, v7);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)finishedTestRunner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;

  -[ContentAnimationTestRunner writeOutputData](self, "writeOutputData");
  v12.receiver = self;
  v12.super_class = (Class)ContentAnimationTestRunner;
  -[PurplePageLoadTestRunner finishedTestRunner](&v12, sel_finishedTestRunner);
  -[PageLoadTestRunner outputFilename](self, "outputFilename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PageLoadTestRunner log:](self, "log:", CFSTR("Animation Complete. Wrote data to %@"), v3);

  -[PageLoadTestRunner browserController](self, "browserController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeTabDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3998];
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsWithURL:resolvingAgainstBaseURL:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFragment:", CFSTR("submit"));
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v6, "loadURL:userDriven:", v10, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputData, 0);
}

@end
