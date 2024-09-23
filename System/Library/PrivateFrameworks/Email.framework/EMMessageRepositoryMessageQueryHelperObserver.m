@implementation EMMessageRepositoryMessageQueryHelperObserver

void __79___EMMessageRepositoryMessageQueryHelperObserver_queryHelperDidFindAllMessages__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "resultsObserver");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "observationIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "observerDidFinishInitialLoad:", v3);

    WeakRetained = v4;
  }

}

@end
