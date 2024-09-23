@implementation NSKeyedUnarchiver

void __102__NSKeyedUnarchiver_WFFileCoder__wf_securelyUnarchiveObjectWithData_allowedClasses_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "wf_unarchiveRootObjectAndFinishWithAllowedClasses:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

@end
