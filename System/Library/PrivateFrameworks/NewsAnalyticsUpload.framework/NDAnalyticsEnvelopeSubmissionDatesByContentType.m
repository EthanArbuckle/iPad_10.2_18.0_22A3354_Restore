@implementation NDAnalyticsEnvelopeSubmissionDatesByContentType

uint64_t __NDAnalyticsEnvelopeSubmissionDatesByContentType_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a2, "envelopeContentType"));
}

uint64_t __NDAnalyticsEnvelopeSubmissionDatesByContentType_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "envelopeSubmissionDate");
}

@end
