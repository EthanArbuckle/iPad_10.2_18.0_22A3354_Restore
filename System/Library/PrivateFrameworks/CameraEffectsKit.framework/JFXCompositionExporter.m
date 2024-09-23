@implementation JFXCompositionExporter

- (JFXCompositionExporter)initWithClipsDataSource:(id)a3
{
  id v5;
  JFXCompositionExporter *v6;
  JFXCompositionExporter *v7;
  id v8;
  void *v9;
  uint64_t v10;
  JFXComposition *composition;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)JFXCompositionExporter;
  v6 = -[JFXCompositionExporter init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clipsDataSource, a3);
    v8 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "compositionClass"));
    -[JFXCompositionExporter clipsDataSource](v7, "clipsDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithClipsDataSource:", v9);
    composition = v7->_composition;
    v7->_composition = (JFXComposition *)v10;

    objc_msgSend(v5, "renderSize");
    -[JFXComposition setViewSize:](v7->_composition, "setViewSize:");
    -[JFXComposition applyExportProperties](v7->_composition, "applyExportProperties");
  }

  return v7;
}

- (void)setParentCode:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[JFXCompositionExporter composition](self, "composition");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParentCode:", v3);

}

- (unsigned)parentCode
{
  void *v2;
  unsigned int v3;

  -[JFXCompositionExporter composition](self, "composition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "parentCode");

  return v3;
}

- (unint64_t)estimatedFileSizeForDuration:(int)a3 frameRate:(double)a4 preset:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  double v10;
  double v11;
  unint64_t v12;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  -[JFXCompositionExporter composition](self, "composition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewSize");
  v12 = +[JFXExportController estimatedFileSizeForDuration:frameRate:preset:size:](JFXExportController, "estimatedFileSizeForDuration:frameRate:preset:size:", v6, v8, a4, v10, v11);

  return v12;
}

- (void)startWithPresets:(id)a3 toFilePath:(id)a4 poster:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  JFXReaderWriterExportController *v15;
  void *v16;
  JFXReaderWriterExportController *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void *)MEMORY[0x24BDBCE60];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXCompositionExporter setExportStartTime:](self, "setExportStartTime:", v12);

  JFXLog_export();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    -[JFXCompositionExporter exportStartTime](self, "exportStartTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v14;
    _os_log_impl(&dword_2269A9000, v13, OS_LOG_TYPE_INFO, "Starting export to %@ at %@", (uint8_t *)&v20, 0x16u);

  }
  v15 = [JFXReaderWriterExportController alloc];
  -[JFXCompositionExporter composition](self, "composition");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[JFXExportController initWithWithComposition:presets:toFile:poster:delegate:](v15, "initWithWithComposition:presets:toFile:poster:delegate:", v16, v11, v8, v10, self);

  -[JFXCompositionExporter setExportController:](self, "setExportController:", v17);
  -[JFXCompositionExporter exportController](self, "exportController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "beginAsynchronousExport");

  -[JFXCompositionExporter exportController](self, "exportController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "startProgressTimer");

}

- (void)tearDown
{
  -[JFXCompositionExporter setComposition:](self, "setComposition:", 0);
  -[JFXCompositionExporter setExportController:](self, "setExportController:", 0);
}

- (void)cancelWithStatus:(int64_t)a3
{
  void *v5;

  -[JFXCompositionExporter exportController](self, "exportController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelExportWithStatus:", a3);

  -[JFXCompositionExporter tearDown](self, "tearDown");
}

- (void)dealloc
{
  objc_super v3;

  -[JFXCompositionExporter tearDown](self, "tearDown");
  v3.receiver = self;
  v3.super_class = (Class)JFXCompositionExporter;
  -[JFXCompositionExporter dealloc](&v3, sel_dealloc);
}

- (double)timeElapsedDuringExport
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[JFXCompositionExporter exportEndTime](self, "exportEndTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXCompositionExporter exportStartTime](self, "exportStartTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

+ (Class)compositionClass
{
  return (Class)objc_opt_class();
}

- (void)exportProgressedTo:(float)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  double v9;
  id v10;

  -[JFXCompositionExporter delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[JFXCompositionExporter delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[JFXCompositionExporter delegate](self, "delegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      *(float *)&v9 = a3;
      objc_msgSend(v10, "exportProgressedTo:", v9);

    }
  }
}

- (void)didFinishExport:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXCompositionExporter setExportEndTime:](self, "setExportEndTime:", v5);

  JFXLog_export();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[JFXCompositionExporter exportEndTime](self, "exportEndTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v7;
    _os_log_impl(&dword_2269A9000, v6, OS_LOG_TYPE_INFO, "Finished exporting at %@", (uint8_t *)&v13, 0xCu);

  }
  -[JFXCompositionExporter delegate](self, "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[JFXCompositionExporter delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[JFXCompositionExporter delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "didFinishExport:", a3);

    }
  }
  -[JFXCompositionExporter tearDown](self, "tearDown");
}

- (void)exportAnalyticsForSessionBegin
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[JFXCompositionExporter delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[JFXCompositionExporter delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[JFXCompositionExporter delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "exportAnalyticsForSessionBegin");

    }
  }
}

- (void)exportAnalyticsForSessionCompleteWithStatus:(int64_t)a3 exportMachDuration:(unint64_t)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  -[JFXCompositionExporter delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[JFXCompositionExporter delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[JFXCompositionExporter delegate](self, "delegate");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "exportAnalyticsForSessionCompleteWithStatus:exportMachDuration:", a3, a4);

    }
  }
}

- (JFXExportDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (JFXCompositionPlayableElementsDataSource)clipsDataSource
{
  return self->_clipsDataSource;
}

- (JFXComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
  objc_storeStrong((id *)&self->_composition, a3);
}

- (JFXReaderWriterExportController)exportController
{
  return self->_exportController;
}

- (void)setExportController:(id)a3
{
  objc_storeStrong((id *)&self->_exportController, a3);
}

- (NSDate)exportStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExportStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDate)exportEndTime
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExportEndTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportEndTime, 0);
  objc_storeStrong((id *)&self->_exportStartTime, 0);
  objc_storeStrong((id *)&self->_exportController, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_clipsDataSource, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
