@implementation AMSNetworkQualityInquiryReportMake

void __AMSNetworkQualityInquiryReportMake_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (qword_1ECEAD7A0 != -1)
    dispatch_once(&qword_1ECEAD7A0, &__block_literal_global_99);
  if (objc_msgSend((id)qword_1ECEAD7A8, "containsObject:", v7))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v5)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);
  }

}

@end
