@implementation _FPXUnsupportedTrashEnumerator

- (void)currentSyncAnchorWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D50];
  v5 = a3;
  objc_msgSend(v4, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  objc_msgSend(a3, "finishEnumeratingUpToPage:", 0, a4);
}

- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D50];
  v5 = a3;
  objc_msgSend(v4, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishEnumeratingChangesUpToSyncAnchor:moreComing:", v6, 0);

}

@end
