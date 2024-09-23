@implementation ATXLinkTranscriptUtil

+ (id)systemLinkTranscriptPublisherFromDate:(id)a3 toDate:(id)a4 error:(id *)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = (objc_class *)MEMORY[0x1E0D44288];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  objc_msgSend(v10, "transcriptPublisherWithStreamName:fromDate:toDate:maxEvents:reversed:error:", CFSTR("System"), v9, v8, 0, 0, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)linkTranscriptPublisherForBundleId:(id)a3 fromDate:(id)a4 toDate:(id)a5 maxEvents:(id)a6 reversed:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v9 = a7;
  v13 = (objc_class *)MEMORY[0x1E0D44288];
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(v13);
  objc_msgSend(v18, "transcriptPublisherWithStreamName:fromDate:toDate:maxEvents:reversed:error:", v17, v16, v15, v14, v9, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
