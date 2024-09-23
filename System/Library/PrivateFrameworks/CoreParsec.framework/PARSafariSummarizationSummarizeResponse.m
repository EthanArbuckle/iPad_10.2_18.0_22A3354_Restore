@implementation PARSafariSummarizationSummarizeResponse

- (PARSafariSummarizationSummarizeResponse)initWithReply:(id)a3 factory:(id)a4 data:(id)a5
{
  return (PARSafariSummarizationSummarizeResponse *)sub_19A847E0C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, a5, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t))PARSafariSummarizationSummarizeResponse.init(reply:factory:data:));
}

- (NSArray)summaryCandidates
{
  return self->_summaryCandidates;
}

- (void)setSummaryCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_summaryCandidates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryCandidates, 0);
}

+ (id)responseFromReply:(id)a3
{
  id v3;
  PARSafariSummarizationSummarizeResponse *v4;
  PARDefaultFactory *v5;
  void *v6;
  PARSafariSummarizationSummarizeResponse *v7;

  v3 = a3;
  v4 = [PARSafariSummarizationSummarizeResponse alloc];
  v5 = objc_alloc_init(PARDefaultFactory);
  objc_msgSend(v3, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PARSafariSummarizationSummarizeResponse initWithReply:factory:data:](v4, "initWithReply:factory:data:", v3, v5, v6);

  return v7;
}

@end
