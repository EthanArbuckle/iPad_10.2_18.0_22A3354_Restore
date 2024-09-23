@implementation HMIVideoAnalyzerMutableReportSession

- (HMIVideoAnalyzerMutableReportSession)initWithSource:(id)a3
{
  id v5;
  HMIVideoAnalyzerMutableReportSession *v6;
  HMIVideoAnalyzerMutableReportSession *v7;
  uint64_t v8;
  NSMutableArray *fragments;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMIVideoAnalyzerMutableReportSession;
  v6 = -[HMIVideoAnalyzerMutableReportSession init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_source, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    fragments = v7->_fragments;
    v7->_fragments = (NSMutableArray *)v8;

  }
  return v7;
}

- (void)appendFragmentResult:(id)a3 redactFrames:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[HMIVideoAnalyzerMutableReportSession fragments](self, "fragments");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "redactedCopyWithFrameResults:fragment:", v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v7);
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerMutableReportSession source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Source"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerMutableReportSession fragments](self, "fragments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Fragments"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMIVideoAnalyzerMutableReportSession source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_source);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[HMIVideoAnalyzerMutableReportSession fragments](self, "fragments");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v9, "copy");
  NSStringFromSelector(sel_fragments);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

}

- (HMIVideoAnalyzerMutableReportSession)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMIVideoAnalyzerMutableReportSession *v13;
  HMIVideoAnalyzerMutableReportSession *v14;
  uint64_t v15;
  NSMutableArray *fragments;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_source);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCF20];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fragments);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18.receiver = self;
  v18.super_class = (Class)HMIVideoAnalyzerMutableReportSession;
  v13 = -[HMIVideoAnalyzerMutableReportSession init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_source, v7);
    v15 = objc_msgSend(v12, "mutableCopy");
    fragments = v14->_fragments;
    v14->_fragments = (NSMutableArray *)v15;

  }
  return v14;
}

- (NSString)source
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSource:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSMutableArray)fragments
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragments, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
