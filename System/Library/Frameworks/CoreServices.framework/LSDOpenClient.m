@implementation LSDOpenClient

uint64_t __50___LSDOpenClient_invokeServiceInvocation_isReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

void __58___LSDOpenClient_getiCloudHostNamesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  _LSServer_GetiCloudHostNames();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

uint64_t __54___LSDOpenClient_openAppLink_state_completionHandler___block_invoke(_QWORD *a1)
{
  return +[LSAppLink _openWithAppLink:state:completionHandler:](LSAppLink, "_openWithAppLink:state:completionHandler:", a1[4], a1[5], a1[6]);
}

@end
